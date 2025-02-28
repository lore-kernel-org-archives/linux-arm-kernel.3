Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1B9C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zfu5Vr/L95oOeC63NZgTBbS0RcwVsKVogd/b3NOwXyM=; b=vsNIi52yFMQWf+jUDz1cfErxRI
	p8GYc3RlRb2QPNi/+svORDouj1Pbo0Ta6u+ECRKdjXDgId3rE+B4NC3h5KrUDaomrHTgSux6V63qX
	rIQj2JI3jAlG2FmITCurpZGjg+OgqBDEjLS7EfKOBSenbnBZKVw1EDBomCVkaFPK9TJRyCGp8uCDH
	7rG0GRdvehebAXyMp3cpQaas4L9Cyd7stB6cWyZcPnjEnPNvv+EUZdgfV8ijXz2mPDrRsUw+BmXf+
	SKbN1yrGhS9X+sDskFXA2thnwFT/w12ZXuixbAUkx9Jwwtdz9JG24FP0gfT/zg6OKB4i5bvc5ot9a
	FtJgpY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyBq-0000000Ah5U-0UmD;
	Fri, 28 Feb 2025 11:05:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxgD-0000000Ac9J-37YZ;
	Fri, 28 Feb 2025 10:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740738795;
	bh=kDGY2YRO4TVDC32xVznZInM/iWmYlqIPkiZVzBj3Lrc=;
	h=From:Date:Subject:To:Cc:From;
	b=BoGWHZwQRWEr8/81RONBuVIcCgxDCt/VZyc2pihZIE17gXKI/ysf6hhnQPHjgDL/2
	 +Sx9il5pLxOdbHVfiWAJ6hRcI6bBmnpkITo7GNZwjMTQcAysLPjnbyOajzIKlMlLKU
	 2SlXp2oaIC5gWyLIt370cOv/3UCoWL5I3n/2fEox2F3RjNjuMDwBYWpUc9HzSIl/Ym
	 tOyPOZA0CPJLseCfK0jYsZ20OGCLTjJjulda0Js70f9fzlqNs5ZK3Lw3IQsNYMOcbZ
	 qQo4U1+X+Ghoa6cv8SQpst/S/YGlxRys9rb5FSwU8WEeSsDdzT9bjJC6/VERP5kMJi
	 jzRKvJe4k8P4g==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDDD217E0199;
	Fri, 28 Feb 2025 11:33:14 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 28 Feb 2025 11:32:19 +0100
Subject: [PATCH] ASoC: mediatek: mt6359: Fix DT parse error due to wrong
 child node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-mt6359-fix-probe-failed-v1-1-64941d387b2c@collabora.com>
X-B4-Tracking: v=1; b=H4sIALKQwWcC/y2NQQ6CMBREr9L8tT+pJShwFcOilKn+RCi21ZAQ7
 m4jLt9kZt5GCVGQqFMbRXwkSZgLnE+K3MPOd7CMhcloU2tjrjzlS1W37GXlJYYB7K08MbJtKmg
 PtNo4KuslonR+z7f+4IjXuwjyEdJgE9iFaZLcqRlr5r+koX7fv8WwDZeaAAAA
X-Change-ID: 20250227-mt6359-fix-probe-failed-a83e0fee902c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740738794; l=1893;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=kDGY2YRO4TVDC32xVznZInM/iWmYlqIPkiZVzBj3Lrc=;
 b=PS2OyWfK67cny/X2RYnJVeS4ofLhP5AJvnFhlJTPG/rHIOY9UdU9PVW8/XDv0sX1aV2owfifH
 ItBqfYymvVkBbQSTaz2C+C/lXRs5I8cGhYiH4VOiTREO/H0IR14pkr9
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_023317_938040_BD72A2CA 
X-CRM114-Status: GOOD (  13.61  )
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

A recent dtbs_check error fix in mt6359.dtsi file changed a node name
(from "mt6359codec" to "audio-codec") without modifying the mt6539
codec code that uses it.
It leads to a probe failure after devicetree parsing returns in error:
```
[    1.354025] mt6359-sound mt6359-sound: mt6359_platform_driver_probe() failed to parse dts
[    1.355066] mt6359-sound mt6359-sound: probe with driver mt6359-sound failed with error -22
```

So, add the child node retrieval with the new name and if not found,
try with the older one for backward compatibility.

Fixes: 76b35f59bbe6 ("arm64: dts: mediatek: mt6359: fix dtbs_check error for audio-codec")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
I've tested this patch on a Mediatek Genio 510 EVK board with a kernel
based on linux-next (tag: 20250228)
---
 sound/soc/codecs/mt6359.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 0b76a55664b0352f6ee2d0f3c96466ffe1df2d6d..f73120c6a6ce680797a1f61841815ca01a24adf4 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -2867,9 +2867,12 @@ static int mt6359_parse_dt(struct mt6359_priv *priv)
 	struct device *dev = priv->dev;
 	struct device_node *np;
 
-	np = of_get_child_by_name(dev->parent->of_node, "mt6359codec");
-	if (!np)
-		return -EINVAL;
+	np = of_get_child_by_name(dev->parent->of_node, "audio-codec");
+	if (!np) {
+		np = of_get_child_by_name(dev->parent->of_node, "mt6359codec");
+		if (!np)
+			return -EINVAL;
+	}
 
 	ret = of_property_read_u32(np, "mediatek,dmic-mode",
 				   &priv->dmic_one_wire_mode);

---
base-commit: 15c3f6fa407bf6913c282b22ef2bcfa40cb53927
change-id: 20250227-mt6359-fix-probe-failed-a83e0fee902c

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


