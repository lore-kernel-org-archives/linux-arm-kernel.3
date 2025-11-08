Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8530FCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HDDbb31Fwh50aMF68LqvH5E1EnboVguF2SoTxc0++Q=; b=ba7eDf9+SZI0RonKeAVh4GNnAs
	vngYQg5MM+aa1cU2tYhGtTCMha9NQlEVRnPz964NnGYGyycJMQey42L6OQ5ZrqWeNIYgRIbe+0KPx
	riksgnOKon3w5/5sN0H6HLX1WwnDdRyL6skvy6as8u4ZpE/wCpt1waHUDO9S8TL2ODFUnHKG3i6a3
	0OkBO+6yUK8nw2JYwzXD6jSWJk1U7ilteTO9i9fIsxhyTtGEbM4aBHiw3nsosj1W9wODRqyil0URM
	GTYJfbNHw2N1nSrTqrEYD23L7tEAHvF2wDDxembTQOCk2XhHGUN7vPPckV6RFjBhVb2iWAQDaeNmt
	WC0ThodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfNN-00000002ybv-09pL;
	Sat, 08 Nov 2025 09:36:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfNH-00000002yVd-1Yn6;
	Sat, 08 Nov 2025 09:36:48 +0000
Received: from [192.168.0.172] (mob-5-90-142-135.net.vodafone.it [5.90.142.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F366F06;
	Sat,  8 Nov 2025 10:34:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762594489;
	bh=EU5psEHBNq7zxVfGcbPO2p2HeGtCUZ6cPz61EOQCxBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GOvzaZwGa4feIx+yzb5Iut6sDCInMjxW+ZMEXZFjUBMlGBONchrR4NVWcj9d4GW4K
	 UKvI9s2CWNkg1Qd4zEh0QYq0doMCwGwjZvRNfZFWYgY3CW9zSCjJun5iTbnGk7u8eM
	 xA2EKkge1tbkVVejmkMAame7vCvz5gb7XGr+c9Hk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 08 Nov 2025 10:36:25 +0100
Subject: [PATCH v9 4/8] media: Documentation: uapi: Add V4L2 ISP
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-extensible-parameters-validation-v9-4-6a7e22aa57d0@ideasonboard.com>
References: <20251108-extensible-parameters-validation-v9-0-6a7e22aa57d0@ideasonboard.com>
In-Reply-To: <20251108-extensible-parameters-validation-v9-0-6a7e22aa57d0@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4827;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=EU5psEHBNq7zxVfGcbPO2p2HeGtCUZ6cPz61EOQCxBQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpDw8mceXuXf7+LXYwHKVmC4noulRRQzL44WoWb
 e/9DqzXp5yJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaQ8PJgAKCRByNAaPFqFW
 PEakD/9muUP0gfjAuZs/SJvWSbVDGZWB837z7akXxPXl9htif13nYeEuIwyndTrstJUDTibE6Mo
 aQRcB15uCUJjilCYfa9mndeyEmx08aiXkKB0sGvXu4PVHhlXCoeel4E1t/PX2wnDh6lhArhhZRs
 sHi8n40xWcJTH9O9s8ziEieWv+0bCQkHv22O90JluwXOoo1aHenNKmw+hZk8PpVAR8/BQxS0Tp1
 hi6JYTVNqqmCauTV89zKz8gQtuDUCyUF0foIrZpajDXh238Fd5bnbcw8BKw6u0p1spGr25uVjYG
 ZlK3PUIrBjFFvHaSq3ZkDjHswDi0c3mTCtIfCCJ3Nbn1ZVkaktbEU7sAZr6oEBTmO/FtLSQphX0
 5zglNHvdxR2E3lPxkFbu391HFQA0RqhJ2SQoNBUppI7/Mk7dhI3/0yd4N+/naEHK/YdsPTESIsL
 v41f55Bn8RN2RmXoqTRZR2YiHJgz/M0aRrn56BV6Gq7UxuOYe51Edv/m3Sd4pbdhQ2kofjNGdVo
 i38IEB8pabRpZsHHRQ6q9qdfcyvlf2RKQRwFoEgnH7N3usfQFKStjp+uBYIQLyPIL8crcO40N+R
 XPqMgK/JgU9Yy/pqBV1MEeQuZFsxXPxAtqZgufj5n79UF4Wr2DfYDVS/3BYbOKJcjbSVznmGWhd
 skwMRVYHx4jiySQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_013647_707347_1A0788DB 
X-CRM114-Status: GOOD (  17.33  )
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

Add userspace documentation for V4L2 ISP generic parameters and
statistics formats.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 Documentation/userspace-api/media/v4l/v4l2-isp.rst | 67 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 69 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index d9868ee88a0717c1acaa4ee477eaed96a6411f73..7b758ea9eb4ac3c4b354bf8e2f319985ed9e2b37 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -25,3 +25,4 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-vivid
     metafmt-vsp1-hgo
     metafmt-vsp1-hgt
+    v4l2-isp
diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..facf6dba1ca7fc34c40e285215cfcb6dfa4ee332
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _v4l2-isp:
+
+************************
+Generic V4L2 ISP formats
+************************
+
+Generic ISP formats are metadata formats that define a mechanism to pass ISP
+parameters and statistics between userspace and drivers in V4L2 buffers. They
+are designed to allow extending them in a backward-compatible way.
+
+ISP parameters
+==============
+
+The generic ISP configuration parameters format is realized by a defining a
+single C structure that contains a header, followed by a binary buffer where
+userspace programs a variable number of ISP configuration data block, one for
+each supported ISP feature.
+
+The :c:type:`v4l2_isp_params_buffer` structure defines the buffer header which
+is followed by a binary buffer of ISP configuration data. Userspace shall
+correctly populate the buffer header with the generic parameters format version
+and with the size (in bytes) of the binary data buffer where it will store the
+ISP blocks configuration.
+
+Each *ISP configuration block* is preceded by an header implemented by the
+:c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
+parameters for that specific block, defined by the ISP driver specific data
+types.
+
+Userspace applications are responsible for correctly populating each block's
+header fields (type, flags and size) and the block-specific parameters.
+
+ISP block enabling, disabling and configuration
+-----------------------------------------------
+
+When userspace wants to configure and enable an ISP block it shall fully
+populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
+bit in the block header's `flags` field.
+
+When userspace simply wants to disable an ISP block the
+V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bit should be set in block header's `flags`
+field. Drivers accept a configuration parameters block with no additional
+data after the header in this case.
+
+If the configuration of an already active ISP block has to be updated,
+userspace shall fully populate the ISP block parameters and omit setting the
+V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the
+header's `flags` field.
+
+Setting both the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and
+V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the flags field is not allowed and
+returns an error.
+
+Extension to the parameters format can be implemented by adding new blocks
+definition without invalidating the existing ones.
+
+ISP statistics
+==============
+
+Support for generic statistics format is not yet implemented in Video4Linux2.
+
+V4L2 ISP uAPI data types
+========================
+
+.. kernel-doc:: include/uapi/linux/media/v4l2-isp.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 8989e7e00d86d0c13c4c0b7e5c7eb9481b65861f..b4dd272a0790c317580d0747c8043738a1a58d8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26859,6 +26859,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
 F:	include/uapi/linux/media/v4l2-isp.h
 
 VF610 NAND DRIVER

-- 
2.51.0


