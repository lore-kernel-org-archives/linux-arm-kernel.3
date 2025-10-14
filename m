Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF20CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoRB0AU9nKyAvYa+xy0bfHVqr/wF/WFI1rMxSkSGTh0=; b=oyltO73eH+l5Em4bzpkZS7zuG9
	OWDf0rZXzqidxDLfcJ86yLVP9bAEIRFJA3O85XwgRs2PjvdYDoFcF0uJZr3bRsgceBhilfEslzsJM
	/Eb7LxHxXypWjOdQON2h1DMtuewsi1PFxd/QnGPX1K/atkj5tUro3r1nv3ZJuOswo4iXKav7FN5Ef
	Gnt/qvfOnN+pp2pmCa85nXw/eVIgn3kV0foifs8c4HZ6c8oZqgvdMu6nC7ZX8zbHTzOlj8T8GpNBs
	nHNHwsV6lAm8yMCa0XsU2ml+Djq/N/FzP5oIYuBLqaNtuoRNgF1Hch56dqon268dhXDWZae/6MdQI
	pGC2jzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZyP-0000000FX53-2LD5;
	Tue, 14 Oct 2025 08:01:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZyE-0000000FWq7-0AZy;
	Tue, 14 Oct 2025 08:01:24 +0000
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 214F711DD;
	Tue, 14 Oct 2025 09:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760428778;
	bh=6nIA8PMBxNyMFZpIPqZNTn55txgmaas6G6JxqTpnEHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KOq5kxys/GQVjZaTmVcPbI7GlewLn7ndBht/nkIoU/Pp9XZpzmb6zeqwvlPtTP0c2
	 x2x2x500os0ib8eIcMQX8Jgw7GeoD0QDW895QAfUaAh8gotqvC4ExvPiWsixN27Iiu
	 y4tKDd3lBfsmaueDRK+tGmKyLovK1Y8dQ9OVE+uQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 14 Oct 2025 10:01:00 +0200
Subject: [PATCH v7 8/8] media: Documentation: kapi: Add v4l2 generic ISP
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-extensible-parameters-validation-v7-8-6628bed5ca98@ideasonboard.com>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4037;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=6nIA8PMBxNyMFZpIPqZNTn55txgmaas6G6JxqTpnEHo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7gNHjvfYwLqh8xguj4uruLNRXZauUpFikLfZE
 0nOZoHG6R2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO4DRwAKCRByNAaPFqFW
 PAEcD/9+utt/ZXzF0biLyHM02WwO32AyOewfdWDaVTIeh8P+7PWTZGaoESXUtbB9ms+ZrnY80cd
 RsSwZlxkVwah7tnGqiEtgTnVi5uhuhVL09w0ueV7EOXYcwEmI/GlcW1ri4cZLrKPj2oP/d2+gOu
 cK1qizym1P0R8+O4MUrVWTRiyqZiRdXUZYcHkxojLiSWRmg7Rd+nwf1BkwgvJiNuSi9oQuTHejJ
 tYuE06/EAfAtu6L69lxbt/hpbXHOh8wtQnsK/EzbU1qmMj4QdnrczmxEQlWH5PrRGJZ11sCaChd
 Op8akjgIzC/BnV754MalKFo/+DKyIOf6jbD3aMSaWTfKvvw9iD8v3kd1Z0eWZXfXEkWTnz2LVmz
 K/BVuGlI5a5VRpc0CY64HmNQh6j+qQDR1EWNsN7vNY2h+1f3Cpyxau2FVvrxHCpMDFLFybVIioh
 FIyWQc1jnCiGMdxcwv8wdI1MGK/kiMsdCYXXovIFLmll3qrKnuE4J7QBDLIy6lTSYyU4PTY6kx/
 iRa3a6NNqxlK4d+z+9ZFc5uA1OprvNT+baMKKS1ywW4zSf0KDuAYyeKLdC7I0ZSPClZdEYKMYYI
 2J2jh5qkIf0J1D2RgDG3hrT4wkERipEQE4vLfi2sLd5W+AMCqYifM5M85oeVn9nYz9exyi2+EZ+
 3xUs9y3ZEtl56YA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_010122_230198_79101AE8 
X-CRM114-Status: GOOD (  16.51  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add to the driver-api documentation the v4l2-isp.h types and
helpers documentation.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-core.rst |  1 +
 Documentation/driver-api/media/v4l2-isp.rst  | 49 ++++++++++++++++++++++++++++
 MAINTAINERS                                  |  1 +
 3 files changed, 51 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index ad987c34ad2a8460bb95e97adc4d850d624e0b81..a5f5102c64cca57b57b54ab95882b26286fb27de 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -27,3 +27,4 @@ Video4Linux devices
     v4l2-common
     v4l2-tveeprom
     v4l2-jpeg
+    v4l2-isp
diff --git a/Documentation/driver-api/media/v4l2-isp.rst b/Documentation/driver-api/media/v4l2-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..42c2550602979609e92a09e3cd1fe3dcbafd6416
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-isp.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 generic ISP parameters and statistics support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Design rationale
+================
+
+ISP configuration parameters and statistics are processed and collected by
+drivers and exchanged with userspace through data types that usually
+reflect the ISP peripheral registers layout.
+
+Each ISP driver defines its own metadata capture format for parameters and
+a metadata output format for statistics. The buffer layout is realized by a
+set of C structures that reflects the registers layout. The number and types
+of C structures is fixed by the format definition and becomes part of the Linux
+kernel uAPI/uABI interface.
+
+Because of the hard requirement of backward compatibility when extending the
+user API/ABI interface, modifying an ISP driver capture or output metadata
+format after it has been accepted by mainline is very hard if not impossible.
+
+It generally happens, in facts, that after the first accepted revision of an
+ISP driver the buffer layout need to be modified, either to support new hardware
+blocks, fix bugs found later on or support different revisions of the same IP.
+
+Each of these situation would require defining a new metadata format, making it
+really hard to maintain and extend drivers and requiring userspace to use a
+the correct format depending on the kernel revision in use.
+
+V4L2 ISP configuration parameters
+=================================
+
+For these reasons, Video4Linux2 defines generic types for ISP configuration
+parameters and statistics. Drivers are still expected to define their own
+formats for their metadata output and capture nodes, but the buffer layout can
+be defined using the extensible and versioned types defined by
+include/uapi/linux/media/v4l2-isp.h.
+
+Drivers are expected to provide the definitions of their supported ISP blocks,
+the control flags and the expected maximum size of a buffer.
+
+For driver developers a set of helper functions to assist them with validation
+of the buffer received from userspace is available in the form of helper
+functions in drivers/media/v4l2-core/v4l2-isp.c
+
+V4L2 ISP support driver documentation
+=====================================
+.. kernel-doc:: include/media/v4l2-isp.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 59ab4a34f72c0430a8d7966942acb2242ad923ca..3cc24092995bcb01051cc301ca212c32938cf745 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26857,6 +26857,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/driver-api/media/v4l2-isp.rst
 F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
 F:	drivers/media/v4l2-core/v4l2-isp.c
 F:	include/media/v4l2-isp.h

-- 
2.51.0


