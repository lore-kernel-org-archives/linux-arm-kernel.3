Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1902BC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIoqGwE1882w6RPA2SXDkYCUHpYydjeakLBAXqw9sSY=; b=kJ/Ifyua1RQEFTBkLEaSDiEsDe
	SF3kv5kIJdph1q+8Eu9H1LM1zGMtDuU5lWCz8EMVpZwYd98/uTWKgrMPtxgem/c2l/4X2bd7kF5Fl
	D7Dxcw0qdf62dEEF2N7G1bMnl+kVYbgvWNE4jyqaz/UEVZmrw3HjYrJLB6watbpvEHb0IN1Sn6zEy
	J4rPhU8T6kdFIbC51xdCjBXu555SKXCKypFHPycTgrrz40yw3jv+ni3wRXilmJnigH0NsnGN3y5pE
	UUIO/6zagNBNpHEbsQGqFzq8AaU2XlsB+HzVRl0Vrgq9A6ziAOxhdOsolFpVAdWf9D2MgvHpmJYmS
	qEqqwwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXcX-00000007dXN-1x6J;
	Tue, 17 Jun 2025 14:49:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWlU-00000007R9S-1102;
	Tue, 17 Jun 2025 13:54:17 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECB242A4B;
	Tue, 17 Jun 2025 15:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750168442;
	bh=t3v2gCfs3hvB2F8i2l+4fa99QiR0O16IHlX1eprudQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lCg8jExe+FK/U16zxToF1FnP0JTKhF+iLvsMrizss/kNRPN23uu82u3bMMXPaLzzT
	 DPpgXcMWz/wZ13HRQTSd+N42g3jGhhipq0NTW7HFxNESlyhVdTFoQ6511XRu2WNhtD
	 JF5JXhGxH5SzqXDHmCsE2auVMcsAu0GyL24FVO5g=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Jun 2025 15:53:59 +0200
Subject: [PATCH v8 1/4] media: pisp_be: Drop reference to non-existing
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-1-e58ae199c17d@ideasonboard.com>
References: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
In-Reply-To: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=t3v2gCfs3hvB2F8i2l+4fa99QiR0O16IHlX1eprudQU=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUXOEefIqfHkyLanL11HSFQZXFl3/OcOSvD9DF
 T3Ct5kBOIeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFFzhAAKCRByNAaPFqFW
 PEmED/9uRRqnVk6h3i9fAs+SnLvMZo8sFhDHTiVIKnpcyGfIyCzHejwz0wG1eS8lqRiz94QKMQ0
 xiLnF//2R+KUAHgqTMz0Mfht6fB3c3L5Pdo7EcmdMjmRjCTN53brl37Dze5L4bRf6CslTtcPW5D
 osQRCWnJ5T/c8XxTtQpYme3D6dJVavnMgFz3eOuHgrT1z/zhJh2H3d97PunPoPwlsjYi40QDBoF
 VpAFXexzgjnBL81EI1RyiGOASCN8t2hc+BliiI6/vIWsMV2ZLtWFi6jVAaflUViTHhWaeR57qvw
 vqKb1EwqR+Cfs/ZYLaQH9uCaGiyTR12ydW1nxqm84PsFHgdnJpr2e9c4noqLiQEnVLigYnAXtF3
 1vZW6nU9qHRRfFNXl2heLCUwo5lIhRy27zE2OBF2zaYvr7tTm7nhaCSvzYXwXilJzSj27EvQ+Xn
 Ryh30xEQ/66UBaN5wwzArI9uEBE0uXZyJJQ8FiNT8r57CiBTdc4CSuwrKV4SC8yA2Y22h5EcGYM
 bInVn3ZsT7fx5XxNN44eQfERkoWD/MaxKsisU2msoFuZLHuoBYYyyLo4wSBpNcoKDM+e/J6A038
 pg3g4sMnnxr8ovUtuG/BAg0vA+AxI2lk1/zdvKF905ZWs6vE2dFBIpBtvSxVEGPAgJCH9w2fcQ6
 gkqxcfDT9x8cIdA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_065416_442412_E923B0FB 
X-CRM114-Status: GOOD (  10.02  )
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

A comment in the pisp_be driver references the
pispbe_schedule_internal() function which doesn't exist.

Drop it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 7596ae1f7de6671484d4d351015b234829f642d4..b1449245f39436d02c9c710916e2d0605606a327 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
 	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
 				     &pispbe->node[MAIN_INPUT_NODE]);
 	if (ret <= 0) {
-		/*
-		 * This shouldn't happen; pispbe_schedule_internal should insist
-		 * on an input.
-		 */
+		/* Shouldn't happen, we have validated an input is available. */
 		dev_warn(pispbe->dev, "ISP-BE missing input\n");
 		hw_en->bayer_enables = 0;
 		hw_en->rgb_enables = 0;

-- 
2.49.0


