Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VILfX6zF;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=nuiDZfaT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2E8XUHjyqULQIG85LgYO9aUS/MIcn0tuh3Or6DLKvbs=; b=VILfX6zFSKwEkR
	RUKCaPGjoaGHpuVJMD3f3uC7zb0H+oRtBYhyyr6Fijzw6xcraVmPDwUs/v4t/DAjyvFcIWbMgN0rP
	d6GUUVh3nD29VjLCpxFyaAjmRutBTZ3XXd99FPpZrhsZiNGJSZ/slTf5Z3taO8dU0Js3T5CZtCyEv
	xRgljxUGSqbNimN+2DV1rb+SB8ZApXMaxhS+dSBQITqH3bADRPjL27agHy0aVzBNRjBi+UIWO2O9i
	mu9BVgbNPH5bsO9iy5gEOWt42XVeGb8UvHg7HFIb6cTkxElmHVzEPGev/O+hrFCmKmB4/IB9lytoH
	4x2VaY1pnToKu8IBcTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa6j-00000005Je9-0CUH;
	Wed, 04 Nov 2026 12:28:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa6Y-00000005JR2-0Q11;
	Wed, 04 Nov 2026 12:28:39 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21ACB21DD;
	Wed,  4 Nov 2026 13:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793795176;
	bh=ColIUmM7I3sT9uPmNQaPsLO56q+grpRm8G7iqR/OKGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nuiDZfaTalhaw3meF/FOIjfbzoUZkXLQZPjg29L5aHMet91nq4JQbzmBSBWXXzyiP
	 P7PDo9/HGtOCq6bRRxokG7f4IoEc8OOMneWH2l9O5y+Rog6tF1l5RG4IUbOPrMaFmc
	 uFBvVCe4Pz3ztKBIgnhmmK74ZIpTgJ6ph9DgYfzI=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 04 Nov 2026 12:28:17 +0000
Subject: [PATCH 2/7] media: v4l2-isp: Hold v4l2-isp data in central struct
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-v4l2-isp-resume-v1-2-06aeb8cf2940@ideasonboard.com>
References: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
In-Reply-To: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6123;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ColIUmM7I3sT9uPmNQaPsLO56q+grpRm8G7iqR/OKGo=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6yTu9d6EUjNEym7soRx6mqhLCXzWYNHNI5nus
 odeox5+jm6JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCausk7gAKCRDISVd6bEV1
 MtL5D/4velDuSlPaF8gdXkdMwQkV1J5k+lyNQHW9HITYCgo2XpPOAWnY2tdHY5CUtQuDZSSgzii
 TSV6a2s2zjJeB11nVgeG9Epthsdd5wVVNQKJtzNY2GzYZeTqwf2LcZSzNPrmgAJxDMWqzGMbELD
 EJKUMjeCHncTyFcnmqoH1Hs7aESEBvCgSjN+y4wrC77ZQc+5LCbbxAplMMsDX36vG8x00sOwyPn
 u5vvwqce7pULSLRwmWu6GGY/gryNlemjDkHMkAP+MJbbhG+lpKrNBlFlJlKi1vCesLjg3Wd//LF
 k9hbOJOV1sgE5Qsd8JtlNyN61+m3ri1O/vDpdmKIZfFoyKr3CIImuZM9bQdmWN/cSf1jK1mTsty
 V9GNtk4KSzYAVg2Yz0yx37iloycFa+2UdlkGmund81jXAQoly5sX/OSARG6Bm+hdmwwb/uMcMpU
 M7eHz6cyP350CJcGZWvVJWDD0wANcQSKsoU/ui7M1dxfMkm6T+A6mrqLP3YhBgG47FXsUD5YQ/G
 2scsD4Z2tGRlj+Odt+S0zbWUzAYEZ6DzFTpvx1RVQSQ2tOMOSmEKbscdf/XInOZOLtD67OgwvmA
 Bfn1Ut0CxoTiWzyv0XQmiMzOzfvqih8QhSiKmiIBRs+ucgDQicb+zYPJxsVAWu+X3/WxYHi5KHb
 cVElSH9jUbVfBvQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_042838_302485_AB394A28 
X-CRM114-Status: GOOD (  23.77  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hold v4l2-isp related data in a new struct v4l2_isp to facilitate the
easier use of driver-defined data in v4l2-isp itself. Provide a
function to validate the driver's definition of data to make sure that
we have everything that we need.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-isp.c | 41 ++++++++++++++++++++
 include/media/v4l2-isp.h           | 79 ++++++++++++++++++++++++++++----------
 2 files changed, 99 insertions(+), 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 8e6c2ef326aaa63e00332bcdac8ebdf6da059f44..a979c0690d19d9956a45657561b510546b3aa8c2 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -13,6 +13,47 @@
 
 #include <media/videobuf2-core.h>
 
+int v4l2_isp_validate(struct v4l2_isp *isp)
+{
+	/* We require a device pointer for debugging purposes */
+	if (!isp->dev)
+		return -EINVAL;
+
+	/*
+	 * We need to know how big the data member of the params buffer can get
+	 */
+	if (!isp->params.max_size) {
+		dev_err(isp->dev, "Missing parameters buffer size data\n");
+		return -EINVAL;
+	}
+
+	/* We need to know how many block types there are */
+	if (!isp->params.num_block_types) {
+		dev_err(isp->dev, "Missing number of block types\n");
+		return -EINVAL;
+	}
+
+	/* We need a pointer to some &struct v4l2_isp_params_block_type_info */
+	if (!isp->params.types_info) {
+		dev_err(isp->dev, "Missing block types info pointer\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * A block type with a size of zero is inherently invalid, so let's
+	 * catch that early.
+	 */
+	for (unsigned int i = 0; i < isp->params.num_block_types; i++) {
+		if (!isp->params.types_info[i].size) {
+			dev_err(isp->dev, "Found block type info with 0 size\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_isp_validate);
+
 int v4l2_isp_params_validate_buffer_size(struct device *dev,
 					 struct vb2_buffer *vb,
 					 size_t max_size)
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index 7a54cf98c79af7a621fdc1f7098690ec7ccaa267..dc3e612ef79ea510ec1535f483fc16c6ec3d4569 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -31,27 +31,6 @@ struct vb2_buffer;
 #define v4l2_isp_buffer_size(max_size)			\
 	(offsetof(struct v4l2_isp_buffer, data) + (max_size))
 
-/**
- * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
- * @dev: the driver's device pointer
- * @vb: the videobuf2 buffer
- * @max_size: the maximum allowed buffer size
- *
- * This function performs validation of the size of a V4L2 ISP parameters buffer
- * before the driver can access the actual data buffer content.
- *
- * After the sizes validation, drivers should copy the buffer content to a
- * kernel-only memory area to prevent userspace from modifying it,
- * before completing validation using v4l2_isp_params_validate_buffer().
- *
- * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
- * against @max_size and it's validated to be large enough to accommodate at
- * least one ISP configuration block.
- */
-int v4l2_isp_params_validate_buffer_size(struct device *dev,
-					 struct vb2_buffer *vb,
-					 size_t max_size);
-
 /**
  * struct v4l2_isp_params_block_type_info - V4L2 ISP params per-block-type info
  * @size: the block type expected size
@@ -73,6 +52,64 @@ struct v4l2_isp_params_block_type_info {
 			      const struct v4l2_isp_block_header *block);
 };
 
+/**
+ * struct v4l2_isp - V4L2 ISP processing structure
+ * @dev: pointer to the &struct device associated with the ISP
+ * @params: sub-struct holding data related to the V4L2 ISP parameters
+ * @params.types_info: pointer to array of params block information structs
+ * @params.num_block_types: number of possible params block types
+ * @params.max_size: maximum size in bytes of the data member of
+ *		     &struct v4l2_isp_params_buffer
+ *
+ * The V4L2 ISP framework is designed to ease validation of parameter and
+ * statistic buffers queued to ISP device drivers. This struct holds references
+ * to driver-defined information designed to facilitate easy validation in a
+ * central source file. The intention is for an instance of the struct to be
+ * embedded within a driver specific struct and populated before validation and
+ * use through the v4l2-isp framework.
+ */
+struct v4l2_isp {
+	struct device *dev;
+
+	struct {
+		const struct v4l2_isp_params_block_type_info *types_info;
+		size_t num_block_types;
+		size_t max_size;
+	} params;
+};
+
+/**
+ * v4l2_isp_validate - Set up a &struct v4l2_isp properly
+ * @isp: pointer to the &struct v4l2_isp to initialise
+ *
+ * This function validates that the members of @isp have been populated with
+ * information sufficient to allow it to be used with the v4l2-isp framework.
+ *
+ * @return int
+ */
+int v4l2_isp_validate(struct v4l2_isp *isp);
+
+/**
+ * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
+ * @dev: the driver's device pointer
+ * @vb: the videobuf2 buffer
+ * @max_size: the maximum allowed buffer size
+ *
+ * This function performs validation of the size of a V4L2 ISP parameters buffer
+ * before the driver can access the actual data buffer content.
+ *
+ * After the sizes validation, drivers should copy the buffer content to a
+ * kernel-only memory area to prevent userspace from modifying it,
+ * before completing validation using v4l2_isp_params_validate_buffer().
+ *
+ * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
+ * against @max_size and it's validated to be large enough to accommodate at
+ * least one ISP configuration block.
+ */
+int v4l2_isp_params_validate_buffer_size(struct device *dev,
+					 struct vb2_buffer *vb,
+					 size_t max_size);
+
 /**
  * v4l2_isp_params_validate_buffer - Validate a V4L2 ISP parameters buffer
  * @dev: the driver's device pointer

-- 
2.43.0


