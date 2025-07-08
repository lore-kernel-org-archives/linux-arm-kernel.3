Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5825BC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ck/alYOrbLjrs/0TS8rojYN5HOKV/ZLdV/TkQIfGswE=; b=VqDu46YLfA/KG+dVH1JpTSdNH3
	ZbMaECdhEgxthrPbjIKJGZ8VmPBsDYustaQoSj5CjdvtZeFBsmBu5XDh2/dPO9VX9CCA1u5rUKDTY
	XP51z7epCWflv6aZJPqMzpvZ1WcFbWbHcSQ3MokRPelTtDmq9oiVGh8c1x718PEwt4olF0T2LO6HP
	bi6AFPo63XWYFMwC6OLdMn0HqokeAQ3y1Ln2MImqO8YgzbsYMkkJhNMfOjVQd9fh4HEpp0GY4bqd8
	Sq8/zd9rUk7s4l+qJIEKNz4gD7pInAv1H0h9p+iGFWior8OyTic4eb6WdKHJNiPxHA29SOMvkBHpW
	wiY7D9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6DD-000000059aa-0Sh7;
	Tue, 08 Jul 2025 11:10:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5lA-000000055b7-14AF;
	Tue, 08 Jul 2025 10:41:14 +0000
Received: from [192.168.0.172] (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D31A2A6E;
	Tue,  8 Jul 2025 12:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751971242;
	bh=R9qA7MNyVAfsHNo8l+6aisRM80FK3G5ZFSPJzZsHil4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ilKdzPcmTmIYXwrIX6eiXQDtEKAv7UPq2wpU2iXfbPY22ioovVWN/pe8VUj/dIPNe
	 LFol441MfnOrP9c6OhNGr20IEhztp1GHRa3u2L69QHzBBPi0+3IcIhxv/ODuKGTP40
	 zTDLZyyVGsFa8z6eO/Wm3UrKq5uwP+c6ICqSkJVg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 08 Jul 2025 12:40:51 +0200
Subject: [PATCH 4/8] media: Documentation: uapi: Add V4L2 extensible
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-extensible-parameters-validation-v1-4-9fc27c9c728c@ideasonboard.com>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
In-Reply-To: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5898;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=R9qA7MNyVAfsHNo8l+6aisRM80FK3G5ZFSPJzZsHil4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBobPXAinzzJaS2OSx2ymAzRAGd0xgVImUWJeK3w
 fR20Mi7/x6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGz1wAAKCRByNAaPFqFW
 PNzXEAChWjmh+edQ/l61iAp0yuf0mK6venOuMoyyilHNi+DtiQANVJqeGwue4dYevFQq89Cf6t/
 e7XEjkYAVncQFCIQJMpW0G2/a1FWfZy4PXI+UyXI27IGrbzOMJsuJH7L4IQcuDd8BL5t7Q/nBci
 BRiC67dVrSDKdGGVY9SHh0EX+6rFY5/wBi81KvUarku0TksfQSuiNUTwHQ1pf6Czzd6Fx8hLR20
 QJDiavfMNbrxHUrEJEJMIS8Z6xLMxs0zKAbPXktxS8/SHvQxpX7Nq6BELJ4DPOe+NNyAytXz1Re
 a9AEgwdKGYjvoNKJbWP6mLCEVvpijtBoBpPqNBG75WrT4d/AJVyWkyvI1xsGmEOGnOW7w7rxkM0
 6bKIbveGj63YRY9nGkTpC/niCQoG9ZjrGuSEeD0m+FKz0LXovjd5cIvu98jXKhCrvJ6XCmEN6XR
 OFI4N9fxTrnsFTlx75Pj4jcinFOi0LxVSyzJW3D6khl7ikgs3g6BY/4nimTYr3IxLUqLXSZtDf3
 +jKUMF9CNQ05NMAWxTi74C1n6DT3KXSqQeLsOIogkPES0RTAGYOtk0Er10CaFp1uQw0k8GDjLbp
 AkhwqvgIRO2VpT6Veyw8K1aVs7x8yBp4z6j/IgwYCmXjvMLCCW+lLpE9U0mxMah6s9VbIr1y9Nl
 VS5GHXJinAorLvw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_034112_484387_D170C286 
X-CRM114-Status: GOOD (  20.51  )
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

Add documentation for extensible parameters format to the V4L2
userspace API documentation.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/extensible-parameters.rst            | 89 ++++++++++++++++++++++
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 MAINTAINERS                                        |  1 +
 3 files changed, 91 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/extensible-parameters.rst b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
new file mode 100644
index 0000000000000000000000000000000000000000..254d4087ae0448d3e545d8533c36d154967e202a
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
@@ -0,0 +1,89 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _extensible-parameters:
+
+**********************************
+ V4L2 extensible parameters format
+**********************************
+
+ISP configuration
+=================
+
+ISP configuration parameters are computed by userspace and programmed into a
+*parameters buffer* which is queued to the ISP driver on a per-frame basis. The
+layout of the *parameters buffer* generally reflects the ISP peripheral
+registers layout and is, for this reason, platform specific.
+
+The ISP configuration parameters are passed to the ISP driver through a metadata
+output video node, using the :c:type:`v4l2_meta_format` interface. Each ISP
+driver defines a metadata format that implements the configuration parameters
+layout.
+
+Metadata output formats that describe ISP configuration parameters are most of
+the time realized by implementing C structures that reflect the registers layout
+and gets populated by userspace before queueing the buffer to the ISP. Each
+C structure usually corresponds to one ISP *processing block*, with each block
+implementing one of the ISP supported features.
+
+The uAPI/ABI problem
+--------------------
+
+By defining a metadata output format that described the configuration parameters
+layout, driver developers make them part of the Linux kernel ABI. As it
+sometimes happens for most peripherals in Linux, ISP drivers development is
+often an iterative process, where sometimes not all the hardware features are
+supported in the very first driver version that lands in the kernel, and some
+parts of the interface have to later be modified for bug-fixes or improvements.
+
+If any later bug-fix/improvement requires changes to the metadata output format,
+this is considered an ABI-breakage that is strictly forbidden by the Linux
+kernel policies. For this reason, each new iteration of an ISP driver support
+would require defining a new metadata output format, implying drivers have to be
+made ready to handle several different formats.
+
+A new set of metadata output formats has then to be defined, with the design
+goals of being:
+
+- Extensible: new features can be added later on without breaking the existing
+  interface
+- Versioned: different versions of the interface can be defined without
+  breaking the existing interface
+
+The extensible parameters format
+================================
+
+Extensible configuration formats are realized by a defining a single C structure
+that contains a few control parameters and a binary buffer where userspace
+programs a variable number of *ISP block configuration* data.
+
+The generic :c:type:`v4l2_params_buffer` defines a base type that each driver
+shall extend with a type-convertible implementation
+
+Each *ISP block configuration* is identified by an header and contains the
+parameters for that specific block.
+
+The generic :c:type:`v4l2_params_block` defines a base type that each driver can
+re-use as it is or extend appropriately.
+
+Userspace applications program in the control buffer only the parameters of the
+ISP whose configuration has changed for the next frame. The ISP driver parses
+the configuration parameters and apply them to the hardware register.
+
+Any further development that happens after the ISP driver has been merged in
+Linux and which requires supporting new ISP features can be implemented by
+adding new block definitions without invalidating the existing ones. Similarly,
+any change to the existing ISP configuration blocks can be handled by versioning
+them, again without invalidating the existing ones.
+
+Implementations
+---------------
+
+ISP drivers that define an extensible parameters metadata output format:
+
+- :ref:`RkISP1 <v4l2-meta-fmt-rk-isp1-ext-params>`
+- :ref:`Amlogic C3 ISP <v4l2-meta-fmt-c3isp-params>`
+
+V4L2 extensible parameters uAPI data types
+==========================================
+
+.. kernel-doc:: include/uapi/linux/media/v4l2-extensible-params.h
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index bb6876cfc271e1a0543eee4209d6251e1a6a73cc..58eb3c9c962bee008eee27d9c16678213c47baa9 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -12,6 +12,7 @@ These formats are used for the :ref:`metadata` interface only.
 .. toctree::
     :maxdepth: 1
 
+    extensible-parameters
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
diff --git a/MAINTAINERS b/MAINTAINERS
index 49a9329e5fe8874bdbaca13946ea28bd80134cb3..beecac86991d988c48d31366ba5201b09ef25715 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25972,6 +25972,7 @@ V4L2 EXTENSIBLE PARAMETERS FORMAT
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
 F:	include/uapi/linux/media/v4l2-extensible-params.h
 
 VF610 NAND DRIVER

-- 
2.49.0


