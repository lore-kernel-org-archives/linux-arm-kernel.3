Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02DE606D80E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UjHM5EBe;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=K7bI8rxv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0/S8lnT9idSeXqES9T03eTejkTr8FUw2jx3DMSjMkG4=; b=UjHM5EBecm5LRT
	Yp+OERNbs19/liygoc61xbq/F8TGYj3eY68EujPoz4BPPs4+ifoccSRKViqXLhFhwPdiFq+RMTkwi
	WzerVKF577wuBsiy8Atb6UENLZ34lRC3WH3j4O+6OIHxBCGmJde6WYUwGdEK/8OA/Vn1ktpJD0+Xb
	xEtpFOw2k1Po3JfWkGSw6FFMWr0gU8Gj+5I76xhNfh8MXaz0jOKORsDL2gu8MF8J1Tzx70JbJJ0nV
	bZAw+YVUP0CydpLcN4YRlJ3MOtVkMM/jFR59/4zr03htnkPqSVf+A+yUY9D9/d4CZ+V731cuJcUd8
	Rf/RxcPMty/2pa1DhRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99M-00000001MtI-2Cxk;
	Tue, 03 Nov 2026 07:41:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98v-00000001MLG-3KiB;
	Tue, 03 Nov 2026 07:41:23 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E8224BB4;
	Tue,  3 Nov 2026 08:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691537;
	bh=EEoGhl+w4b09JEf0yxWv+I36A1RkFDfU7O1BH/fGGRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K7bI8rxvwor0g74bYQfOXTT4K2u1uyKWpfNtGUcrSOxjkICFNOvYue+Do1lvRbkhc
	 VUS6zxGaAOOv48vwY2YFLv3pi8piFcgDL/xMHoeBijTxAK8miWOd+08FzZL56SNXo4
	 XPRGWCdDrvZHHT2Pg4SHRhekEetmCSVcXcRJhxH0=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:46 +0000
Subject: [PATCH 10/16] media: rkisp1: Call .enable_streams() /
 .disable_streams()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-10-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=EEoGhl+w4b09JEf0yxWv+I36A1RkFDfU7O1BH/fGGRI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAQDQAtiE5VGbSOjKowKzi4LuD72uIyNuONN
 aMPeh9H5heJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEAAKCRDISVd6bEV1
 MmLVD/9qyL//wcKIOjFuF6D/uKb+BdjVr+5W/CH65xTWuvMXt1aoiBGtJ0vbFgnBh6r+XefrH7B
 xRrEbQMwgfX/eVdIZhy8skB0mGCX+i/M1MYEP1gIEKiM1sRIbgtqxmfN0OcoWDjI0sMTznClZq9
 kwoLceGF1LfiCYZ/yc+lN3iW4QloPhsvwucfbXPP2f592DpXjkfWnh63My0aW09JGTZ9I9J+BfU
 7S3R176D/p3SvuuZsP62khhhwDxEwoZ5MCbZREx8vf05bQ96IWx18ZjiQgE3RW3v+5qp9nsxgaw
 0fK5jy0OpONkmqLTWs1I3k3w29FXF7mKvhaCPseWgob9J339bdFSPVT5vO4WOauUk20DQpXKr8E
 zxz4UD5jA2lBV78bOGepbXoA2ferO1PsuEDR+hBCCfWsRyt/mKrJSIK8lNXjwA3HYo4jLn9L7Gu
 9L+INu2h1cC/0a8PN5o9fsR9m6jaGraR9+bqsW4SoVCl+kx8s4Oj3qvsouylE8i+10ppLFIjU1Z
 zq+UZ/OtV0b14QTzbDjoPxAj0USqUfMlSlC1TZDovGfdNGOWpteQX2IYW3l1z8VcffM0h4SxcT0
 dCI20ajNs9O+3Deu3YPTCCdCekeWhPFNz5Ejtv9PMsf+wPkjYgnuZUCaHmM5j9MsBrFaETSgTYW
 2zclZywRl5xOu/Q==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234119_773945_CE97D10F 
X-CRM114-Status: GOOD (  10.52  )
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
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Call .enable_streams() and .disable_streams() for the ISP and resizer
subdevices instead of the legacy .s_stream(). The subdevices don't
actually support the new operations yet, but v4l2-core will auto
translate them for now.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-capture.c    | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 757fd35e248a89ff3a6af4e07491239e14dda9c4..fcc6f06437e182c0510fab7df5a50dfe7d0cb48a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1073,10 +1073,11 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
 	 * be disabled, skip them.
 	 */
 	if (rkisp1->pipe.start_count < 2)
-		v4l2_subdev_call(&rkisp1->isp.sd, video, s_stream, false);
+		v4l2_subdev_disable_streams(&rkisp1->isp.sd,
+					    RKISP1_ISP_PAD_SOURCE_VIDEO, BIT(0));
 
-	v4l2_subdev_call(&rkisp1->resizer_devs[cap->id].sd, video, s_stream,
-			 false);
+	v4l2_subdev_disable_streams(&rkisp1->resizer_devs[cap->id].sd,
+				    RKISP1_RSZ_PAD_SRC, BIT(0));
 }
 
 /*
@@ -1093,8 +1094,8 @@ static int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
 
 	rkisp1_cap_stream_enable(cap);
 
-	ret = v4l2_subdev_call(&rkisp1->resizer_devs[cap->id].sd, video,
-			       s_stream, true);
+	ret = v4l2_subdev_enable_streams(&rkisp1->resizer_devs[cap->id].sd,
+					 RKISP1_RSZ_PAD_SRC, BIT(0));
 	if (ret)
 		goto err_disable_cap;
 
@@ -1105,15 +1106,16 @@ static int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
 	if (rkisp1->pipe.start_count > 1)
 		return 0;
 
-	ret = v4l2_subdev_call(&rkisp1->isp.sd, video, s_stream, true);
+	ret = v4l2_subdev_enable_streams(&rkisp1->isp.sd,
+					 RKISP1_ISP_PAD_SOURCE_VIDEO, BIT(0));
 	if (ret)
 		goto err_disable_rsz;
 
 	return 0;
 
 err_disable_rsz:
-	v4l2_subdev_call(&rkisp1->resizer_devs[cap->id].sd, video, s_stream,
-			 false);
+	v4l2_subdev_disable_streams(&rkisp1->resizer_devs[cap->id].sd,
+				    RKISP1_RSZ_PAD_SRC, BIT(0));
 err_disable_cap:
 	rkisp1_cap_stream_disable(cap);
 

-- 
2.43.0


