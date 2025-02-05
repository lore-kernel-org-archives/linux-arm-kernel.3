Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61F0C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 03:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z7iXbDBu4oFwaAzUKB5T1KaEuDxsnH7EBEnrF26Px5s=; b=uLy7ilkkFZTKFeL4DGcy8/QmdW
	N2ON/BzAEabVfcTYOAChKp6ZCzHbqzXdSBcBl1kkLGZB1C8D0rUJAlgkcDfXG3Cnykge09AOEyn9J
	Fx+8BPXvfh24Sbwtge4sQBosgS91OmDGxDUtLE7ttHdUJyIQwWS2fNodlidZtU3yZGyr2Tle/BCmM
	KgoUeA50im0OFcOQP90/fw6+myGstBJK500BPDYywp66n0xjTAkP8YYbHgrsEJF9lH3okY81Tv0hL
	vt5nmdG0fgziWZQUHQbB8ttbcUVrApbq2LxXsSMIwQ01k7C0GFPgS1z1zuJmStheksCu4dAkUW92J
	aay7G33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWR4-00000002Fc2-49Vw;
	Wed, 05 Feb 2025 03:50:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWPh-00000002FNI-1HGr;
	Wed, 05 Feb 2025 03:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738727361; x=1770263361;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=Y2M37YpkkM+Vyr8bB/bqMI0pllLoH5F4qCf3uTmRpkY=;
  b=JCKi/gMg7IZgqt9zouoZBOTb058UEKaJag5ERSo515pCDpNdnPyO1Ne+
   r1KMN+DdFXFN4odJKLTCycgeauHILSRMZjvqsbOOuMUihu8nq3k5ECa0B
   WLTRg/nzJFrHIeuJuF8ZgXeUgUZpFu5JtHqghA5yn+4F5ao22tWOmbffc
   wsWnREe7Cj4xg+EX+zeoex3VHMHrbgauvEKk4ioKbxIZDxgdTcb9XeiwT
   YKxKdFyAg5yfYhJCV/DkB9s/fsnSp3lr5feFXQ3UKr7G3A0w9wtr3b7vm
   8/RH5mai8gyCtPblADN7IaOuhrdjPZiIg5+j9OLq3uvc+f+hslLQMx2o9
   g==;
X-CSE-ConnectionGUID: 9q6sxc6oQ7qZQgsLIprwFg==
X-CSE-MsgGUID: 3DLtMxkgRhOvagShr5YrNw==
X-IronPort-AV: E=Sophos;i="6.13,260,1732604400"; 
   d="scan'208";a="268617910"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Feb 2025 20:49:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 4 Feb 2025 20:48:48 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 4 Feb 2025 20:48:43 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 5 Feb 2025 09:18:40 +0530
Subject: [PATCH RFC v2] dt-bindings: mmc: mmc-slot: make compatible
 property optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
X-B4-Tracking: v=1; b=H4sIAJjfomcC/2WMywrCMBQFf6XctZEmjaR1JQh+gFvpIuZhLpimJ
 CUoJf9uyNblnDPMDslENAnO3Q7RZEwYlgrs0IFycnkZgroysJ5xyuhEvFckvcNG+pPg4zhpaeQ
 AVV+jsfhpqQfcb1eY6+gwbSF+Wz7Tdv2XMiWUaKsEF3LQg31ePKoYlMP1qIKHuZTyA3S5ypWpA
 AAA
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738727322; l=1069;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=Y2M37YpkkM+Vyr8bB/bqMI0pllLoH5F4qCf3uTmRpkY=;
 b=euyPCQtPylPzBTnrVIPruEpcg2aZlyXORKa4vu1AoL4yj1xw9fMuXDNmnsUO4EOkAEw6vL48b
 HjHTGYLef3/C7DXH+LL04r3Bbck58HswIL+R+2FCxbZpd2p6GQYLrsk
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_194921_362410_0CA2A7DF 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

Remove the compatible property from the list of required properties and
mark it as optional.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Changes in v2:
- Instead of moving the compatible string to the other binding, just make it
  optional (remove from required list).
- Link to v1: https://lore.kernel.org/r/20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com
---
 Documentation/devicetree/bindings/mmc/mmc-slot.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
index 1f0667828063..ca3d0114bfc6 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
@@ -29,7 +29,6 @@ properties:
     maxItems: 1
 
 required:
-  - compatible
   - reg
 
 unevaluatedProperties: false

---
base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
change-id: 20241219-mmc-slot-0574889daea3

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


