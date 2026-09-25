Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223F6C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5cOpKUrfnSjz/MBJQnHunIOTLFWIe1DjKdr4y4mBIY=; b=Musq+ib9Vd0oi8xkA6OAt4dDhs
	pg12BB2OxD7jvwy09RcrNwDhhN+fmdJUvHjMTqg7V6OV9cuG6HJ96//kZkIDnYIw3hHGvnT3gnyiI
	ggiKS69bB1lzdwxHdY/GgxeaQ0swRMOIaTx/AmBRtWA6BcUvSwJ/eM1ONqVrMavm22NZSoCxTkSWM
	q1VmV6MCjcCYEA8igjYfRtZeQ0B14EP9Iek2cfQUaYtExJ9Hz6/XF5j3RfJSLLxtd62guAER+VlL/
	NoUD00sd0IR8z+vegFNZODI8elh3TQZpfBFOopUttFuyUojIBh8pa9kW1ICpM8f1IltHSpVf+pikI
	WFa1ifUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtf-0000000Cdx7-2hAb;
	Fri, 25 Sep 2026 04:50:55 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtL-0000000Cdfn-2Lhg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:36 +0000
Received: by mail-pz2-x0c.google.com with SMTP id 41be03b00d2f7-cc515bef69dso152657a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311834; x=1790916634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5cOpKUrfnSjz/MBJQnHunIOTLFWIe1DjKdr4y4mBIY=;
        b=eZeaPo6kt3nhKbPKZH/iYJN7laCyfnHwSr72GHaTmds1IXdr+v7joO+RcrfWvI0uW7
         2ck7iRHxJZiOi2PK27ZlL/HsVgHc8hNYAcRAYsEbHszALJhFGJGkMtCRIJ5EkoakeB26
         f+1WSkGb0zAar5+hi6ocim6wUFWnUENk6OlIaPCvyXHbta0oubkrvImQc/xvOWDAK8Ze
         lhcJdguL82Rwwur33Z1VcmeIn3sVuWq3TIyD/hQFWJKIxBIr77tm7wnTA0U558hG6Vwa
         Tdi9wXTtqz7r3ZieRWH6AtmoRIhRoAmR2nH5M3pauXrWJx95NluOz4qvsMQlwecmXIz2
         sUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311834; x=1790916634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5cOpKUrfnSjz/MBJQnHunIOTLFWIe1DjKdr4y4mBIY=;
        b=hyYUbcSFPONQ440bsQ33CNJYMIygDlAiMTSmqybOzx4+AC0o7SYYyTf9ofcbVXtIWg
         ARc1Fbxb8UWqTRolO2RR5UKAERKh5+yW0T1MIUqym3rs2jzyArnyVXXADzetCO+hAAd5
         mVOrD3lUdEhczH5dtNiYV54WOCHeP+SeyUd2yMsdaLK3tyYQmkXZzOFUDRWrX009Dbgr
         9536hIhTG5pSnnkdo1PoLndMj0crFoc+1oDf5KEqhJ6glKA7iXm2KdidWbrQ+IOK1vRx
         ogUElLREqt3uiaDgvkeBdffJjMuGrbOG34gWiQ5/k+wvVVjNUoWxPOIUVF5l6kdY7Bgh
         qoGw==
X-Forwarded-Encrypted: i=1; AKwUvByia+XpmLQcm2VqqW3I5loFIidCvd71+Nl8JMm2/KAkv69FYxLQ4+cUC8ub+7vu5vFBrZGVGETAm4X9+MojswPc@lists.infradead.org
X-Gm-Message-State: AFuF++kqxr+mBNE/B9OVKANveFa7ls79POhMR3CqZXbCxcigrX5lU9+x
	vKXtmAq1TdcintLBLNDvsKMUc6MN5COWK0eC/h7Jx8IVSVdvSj2mCvhB
X-Gm-Gg: AYBFou3hqrcYQc6vp/hnhPu5sOc0A8lSQXwfEjlv1PLAoyFiFqYBioU9fa3FEiD7EbC
	tw3df4KUJ8SdXp1bKE12tXW2/xyXYXWGNGi0OeOo0Lq9h+1XUG1sUfqchAP/+Ygnu7OrgFWPHPY
	B0/QTCbHFVjOPbX3CkNw0v/aaL26vk61vMk7MzXWqStOY8OeO2W7xhFpWUS5fGWQC1t4oOup2/D
	lN4gRZTyhpchuIYu1j9e1CFSv8lmG8yEhxLdgYfesV49tAP19oySuu5SUg8z6OWEr/nheRs0rBM
	1vUvBSn6pcEpJ+vvSwTHrH196Xyrs422vxG0Jv30kh2GES6Q0PT2X3eaS5BFeKPDhuEhsOCTHqJ
	7Bqg9ta0UJIwosBkQAOyQFEToggklHBtjhlq5GZQzjwT8Fs2PrZOI6cgVZW1UBXLismvhGt8tHd
	NmMsi73PleMeb3FihOr3IFILe1NHba8ArmeH/hBKCd3xxqUXuBdRWgicJ2loR6O6IOaQxRSk8Wh
	MJDxYKDHGMqzuXDn4nRFsMjq1ZFWZHILYF0znjuDard8FM67S5OiWOOXctHuq+kwy52f6vjjtbK
	+qYsl9ERPcaO1w==
X-Received: by 2002:a17:90b:3b51:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3a0b31224ebmr1565733a91.23.1790311834493;
        Thu, 24 Sep 2026 21:50:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:34 -0700 (PDT)
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
Subject: [PATCH 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
Date: Fri, 25 Sep 2026 11:49:03 +0700
Message-ID: <20260925044908.450775-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215035_615314_DE1814A1 
X-CRM114-Status: GOOD (  13.07  )
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

Propagate the error returned by platform_get_irq() instead of
replacing it with -ENXIO.

This preserves errors such as -EPROBE_DEFER for proper handling
by the caller.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index b8c3636cb64a..057f116645c6 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return -ENXIO;
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.43.0


