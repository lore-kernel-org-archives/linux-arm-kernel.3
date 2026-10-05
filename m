Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15566CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=; b=NXktfVLitU2v7IPZRUOpR9XmOm
	04hvn4yrwwhXQ5iLhZkJHzloNBUnSdO9rjuDoMsntkNVaa4xRHqjDR15F4bErBIzfsf5sk8oHnF+Q
	kVS7GARY+u/QdZ0fLYWkOyf/45psgavX1JlY2/0nNOudCqTfulyLLDKsQIiu+RvmrypVMJaD83szs
	x3poKI5urz/kcEtMJX4xa+NlOO8Um8vQscMEonTQruEslk7wzPhAiVpTylbWbcXbiAWp3EoIHV6wx
	SCKoQCkI3/Is0CDgGfvXEh/V/qA3LzFnsVgqyZINZFIte8Zh0ixwfpzGloXbc2fgHmc5J2/s+vusi
	1trK4kPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUi-0000000GI49-3Wza;
	Mon, 05 Oct 2026 11:04:32 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUZ-0000000GHuW-2VDZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:27 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so245029a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198262; x=1791803062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=CSRTXMV0bAVrk1QR6fAj1l+Mr3gXzsIaZVfl+E4ImWD+AgYjXXSLI6P14cwi0GUdrg
         GahxR5h78b5OVB/U2tktPih8IZ1ZeK1PSRYuk5XOjrLjIwZXck+aQhe5z6q35Ow4ss1w
         IleIVj+s9oyKBxnx3ehYB8RME324L3VFBdYTjeXzQkvkrvWsTv56NNdvze5mx828VEJh
         Z/oTxCB6FkdyZy+slKLHOXBPoZpAI2XWP4qLnMEwQaz2KMHiOStnRuduGiQibKc+8axe
         L9XGIBgW0BAsKvwHn2XdFb0fMISIxx8kUDei4Cy7dNHAlve2/z8N8NeiZ1o6VsNA0o/q
         mM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198262; x=1791803062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=XNQagHDai25XgzIwTs68oydM51SglCNfv1Xd16FX2S15Bv8ZjsN43qsoxmMiiRN83P
         40Xe2EbyM3xxY1Eiq9J1mi4nWsCeeXPf/vl7+hNmIAmYDToDz0/qo+cVPxgzGLqpEk1E
         RG7UMOTPJMpdDQ0qtRWhc4+9i48Tk/7BQrOx69BmHDGUX+roeXhw2CNPW/rM8xZ42fk8
         a3TCC0c1MCYiCU0UdkE3B6ff+tqbHkyFIzJidI4Qib/89t77XxIn6xd224GU9GNlHn+m
         qd8DqvOPuv4YgkMW26i1bxxoSj8vFQ1osgmgQ3IQmdtNb0ZLGf0m8xGLZ9LNLX1KlWgh
         bEqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzggV3Dh7fobKKUTRH+WKuUMp1sVHDjSHuAFeGHFJ2h93Lns+jWrBATHKrZBEH3ZHfxuLci/pMSHatxSksNsqQp@lists.infradead.org
X-Gm-Message-State: AFuF++kgvQ1URr+fySKb8xWjjtVxMIK1BE2x3w5ENjckJXcyYSc2q4A8
	4YZJ7+RU0eBprH5MpQoRTdUu6SJ+ntg1rJ/BCWt+SF8Y8czLLynYkeNG
X-Gm-Gg: AYBFou09BZxCNHMDFVwiCPOgKKpYv8/gysFgE6Ku/jPToJhbUN0ZR5w1NnvGZPXAjQP
	24+M+w+ERlSafUqmsSzjlUOqPQwq+DKGXYMuH6R0Ujp4gOSmWFslAgcwH60PcqC3we9X0fiPDru
	YrkE1wY5SiPfMjchTvyZERIlXpzCBjxFczTqyqSREXUgHBu5IqZEgYYUlLh3Yf/gVzQt+fehbj5
	oYTnwJX1AArjo8yKMUEk7rZ+e/SXziyN5qXDrEO7bNNpk2pLGnqkL4+wrqmAEBSIO2PfWI9+TyA
	TuYaisIcDaDI53L5HVGKCGHT1CimSNj0/HGJREHB+KYoJdppYRaXtW8saJ1Mr9nHpNS26eQdXld
	wEUflClFi2aHtM3z4fxcMvlGcFXuEpt2DO2PbNwadBXGSgrb4iJvLqWFtAVofKmlJDg9whhkpWB
	U4Zf6XuSXIvlrbZp/MmV2rw0jHXH6WSV9nbn0Wc9xENSdijwvvtq8X5w8ZYcLcUAs0Lu1FLTmCl
	/21NLqzpWzLjPhKXSwlt37yCsA3LG1uh2wdxcyZbnSpU1F7oOcQK8RmKTlMrTg7L2xHYOM7jJbJ
	I+H0I1u/43HDjQ==
X-Received: by 2002:a05:6300:68cb:20b0:3df:f477:1e19 with SMTP id adf61e73a8af0-3dff47726f0mr5590214637.48.1791198262474;
        Mon, 05 Oct 2026 04:04:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Mon,  5 Oct 2026 18:02:57 +0700
Message-ID: <20261005110257.50145-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040423_692244_70975123 
X-CRM114-Status: GOOD (  11.27  )
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

Propagate the error returned by mt8195_afe_set_clk_parent() instead of
ignoring it.

This allows clock parent configuration failures to be properly handled
by the caller.

Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 94abde15ea09..8a58a142064d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 
-	return 0;
+	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 }
 
 static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
-- 
2.43.0


