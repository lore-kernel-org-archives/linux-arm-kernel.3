Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F980C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=; b=kbcCirfxvxB8qKYt0qEV2AQY03
	4mRAcdp6/kKklR80OURlKS0xS2e0Z0T2NBlZ8gvdwFGsfCMqazlB0r5VN0URgJJUeRHjC8eSkxecJ
	UFj7xdes7+O1BxQpZUv8oZr9Pe+PYOjlsIdN58XcblukpE06RlLgPLPH56P602+gXrBbfeo/4U7Sc
	PcFK25AjttPrJ5ROrhBkWAUXSMj37bW8aXp0DQpLiKEQgPg8oGyBn0940r2f2miV5A0PyENuxTirx
	cFhywwOzcF+BSv/wJslX2Rjtsi0SBYDe3vt95fkHzCIKME03iWHsHcIrAdCSBY0mlQAcFoiJlGaKx
	7k0lMgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eM8-0000000EOVj-44R2;
	Thu, 10 Sep 2026 12:58:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eM7-0000000EOTs-1Tup
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=; b=QvDOZXpyrhl72Tn2k1weoF2Rgn
	o7Wt/DdvMDMlGFertHmGr8nzp1HZukxn/7GJomxAyGatP8IcfACEfwbYz3/52GEsglT6zjwyF+QDt
	W0voCnGG21TgHbfElNpxIPp/kQ1SCRU5hNguGDNmDNfYpxUaRex3B1izYWw7EBVSPj6GoYSn/8MTh
	vr+ziZ5EZ0+TBMoO6TW7K+a6elynK5IZzOY+Y7oag/gIOkQ+KmEJJGW0fao+kZS1ZQAWRdREeNSlF
	8nxEt3V+T5UMdra/Kvw3EBZotMOpVArCYDlYDNqpX+NeEDmq1/TaZNPGEk12NN/WzPo2P2eADEiWe
	4KdKbcQw==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eM4-00000002Uy8-2PeS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:18 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4b29fa803so406182a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045095; x=1789649895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=;
        b=f4qHWe+SzHO2RyQAdhtLO3mizrbYMQDeWyVa/D9Cm/UsQghfdI5rOcToIIYEbI1PaS
         KUSE3jPkm/QQxHu1mFd7mJs+wVjN9lCaMXKzwB5M9d+o/nwCBncgBobt50NSzHcnRy9B
         JAZhbmsUOHe1CX8oGRB01iHoJICkHVWaAE1xEBiFjPZY92VsKBRcwUVrvizddt7Gl98Y
         QPW9eNAnieU2wI8s3yIOkAFewAW2ZxkeFHKWZZIPCgVXlwK/LNiUd6GpxH6dPWqW8Osi
         3HY8YeZ7bPqXnrWZFGP9gMyy8xZb/Y2707CwrmX1e7I92Rwe0gaKchz1TDLqPcGvY3LZ
         roCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045095; x=1789649895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=;
        b=T1+dRHekpv8HEhp7K1hOR/QLGVRISvZVTQk1G26r5vCaRzOe55myIR7Y2tK6wElnDy
         YmCeNLzHqT31N4w6WWycsg/aWbRmpg/Qv7bJPq6cbKQ/53fyBelAWtSMquLN/TegUlU5
         oRRRKELg/DOOuKLxwjXV0xkY6+/G+exVtFwkUpvx1fb7ITVDsgoOYR26ee1YNYxY9Ckv
         BU5y3xX5CpnMUEkJ0NLMwe0+p0DBhVjPeGxT2Xe/GZW0yx9K8Sh9l1xY5lj132R8cRpa
         w88Xsnpka3ET8CW26S+CGNiutpLlPAXmdElB9Ya8ijr5WLC/nfZ7SkUCU1EyvG760SoX
         IaGw==
X-Forwarded-Encrypted: i=1; AKwUvBx6t+o4Vnj4olXHXDUxK6LggJGlAB79iIe9LGxFLztok4JG7e5TgHPHvQAZu7VEDd9Ltj5NnrYMVKK34XFzaNkW@lists.infradead.org
X-Gm-Message-State: AFuF++nlQgRqKBE50YKaR7A+/GpZ2QitWQA8sBLjva6iHaGf2EjyzADW
	WpKSX2M1qov8f7NZrgANoJXroP07szv+201OXbnuc5xZtziYwXoBeBAV
X-Gm-Gg: AYBFou2g50aUCxNPjueCyYYbE+iEm5SLGmF1vINYj8pf7GZEcQYqxSXJOGgR322jDMw
	G4uWoVxITuVFOT6q5aERM/5EeZHMqGGatnaoVxQp9wCnuc4Dyv2J3y62TBnt6vyzzpgYBgDtb+m
	YtxpskPwAV9UoQWmf+rTp/sVlHN9G6CyNFfoO1jBi8f/6xNSB65fk2W/QYcR8g7ophfZbDAQpvZ
	taGWIGeP5V0c1SoKbR7HW1Td6pXbpaLi/XwmlbBIQf2yau8RPu6Cr3P63KeV/UjiD4wrfLJc74D
	Sgu1RrtzdrVWhCbiWew6mM/A3rzHaSAufb47BYY24yrXRTj3IeliaYSStbwfVU9Dj5cm8y3q/dN
	Ja47KePuzgd417tVwr+TYXGupl7CZeJ8EGOaFFRsooUqeJ30JLJh0N6eN+KIUqWQA3Zfl+JJ5aw
	BcyyP8fo3HW1OVxEWuo6CdmIpO9cUNrcGkVpcggxyNdUm6irwJUMYcDQdoosioOOdl21GAS7tfM
	WEn7Ytl15K3KziPQsWsS2mfV2eUEZs87OddB+A88o0exng6PgHWz8r7Ah/oFbINlpv6jovGLriY
	lTMFrY8spsiy+X0=
X-Received: by 2002:a17:90b:2b43:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d709e5464mr10985783a91.10.1789045094591;
        Thu, 10 Sep 2026 05:58:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/13] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Thu, 10 Sep 2026 19:57:32 +0700
Message-ID: <20260910125742.150902-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135816_734419_3B9333F8 
X-CRM114-Status: GOOD (  11.93  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index a901be97e75f..933179f2a5ba 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_m_sel;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_m_sel;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_div;
 
 	return 0;
+
+err_div:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_m_sel:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


