Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A65C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VI1znOBQLbz/1vQkVjAXYLg+Z0oCTtt7na+x+SnaEEA=; b=q9bJHW4b6wroRxv+KWIxCvc/xM
	tgr3k7iuPzPXZX1/UIYm2Ozl3aK73DC9OOiz7/7ynkFF19LhGGy7RE3CyBXdf/8N9JFT9RxNrpRqO
	5+ZMBXgDaTNFIVWSVpweafjA8rnYbS9AnTN3/7OG39yo7wqwWCu3FbbdNofnQJ2NGuS0iyBstp696
	UTRm5vSnQbp5SYlEqgvUZktair948cSOUm6jpKpfTLHSIkBHX4ZgI7tOhr+s0bCf4zSH6qKvHb1vI
	7/CVsV1Fe3HwfblUvPsBCn04hQjGZv86LVRJjSPSh6bvlKQWi7V6zU+5Vhr9WOeQL603eAUHIsqWJ
	9CtLVtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZG-00000004xoq-01pY;
	Thu, 06 Aug 2026 05:22:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZC-00000004xl0-3Bh1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:22:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8486ac3f347so631955b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993774; x=1786598574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VI1znOBQLbz/1vQkVjAXYLg+Z0oCTtt7na+x+SnaEEA=;
        b=Ntzdh/Y9/pWEtBXSBpbp41cAhkXA3kBlsovgKDUq667y/0m5VNDzCAUE733+w3OfYM
         u/7j/JenWKDAOGe93nUo8FnbWZeT8CZIF9yJOdsiyp+e0t09YO2WOlpQklUf3VkxGmPg
         B9nuJFAMZZIGaQCzOFC+ANK3s3WFJH6ORNXmCyA0pG/h2JThcnNrTwiLh64dVLnq1sZ2
         EA5tkLUWzfRNnmXRx/UDHo0NRk3OzGPLaihCOOstSTr/eLhP7SqgAFwIHPu5dP5aQKfP
         +o/Dj0QetGyLGv/ai8XZIh0SJqdh3AoqYrbxyvcTCJwDG5spXFOhX846zUhi3he0PmQX
         E6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993774; x=1786598574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VI1znOBQLbz/1vQkVjAXYLg+Z0oCTtt7na+x+SnaEEA=;
        b=PrzOpNpjEmDa6U3CiRVeeh/aQ+ulk8oqfvQ0Ltc+J0cLiZZJvEt5OIQI2q5Mmfjs6P
         r3ehLpDkfTykATerKxxy5L/oDAUkDLEXhO5qVPUXYfioX1nQf5FmD0tcyTo4xThBr0ww
         srlyGhojjclj5loAZNMTubeN7pVD9h3mEnlpzBIQjwOvCSYkTaM4XjuZrB6k/tr4IlPV
         DGCkIm9bKyz24UpMtPP91AcSip6N45645iqHRfWWuzeck8Eg02JazIYWQcH7Q2mpT5ug
         SVI3k7qk1azvXvai1KV9aeu9Miy0mE7EWYRepXlOv9sRBIso3HLgjJ9r+ndsF/sFYJOs
         Ix4w==
X-Forwarded-Encrypted: i=1; AHgh+RrQSsUTBY10kyYAeRHEdbhxVzoYEroEiKRJBPS8kfZT3qiyRESRmfEFjpdTs/wtilXrp3OQ1btdIwk7biczuZus@lists.infradead.org
X-Gm-Message-State: AOJu0YycGPgWpRY/y5rYBo8PFnxdjPYrBlKMXIn2cggqQfyW89Q9A1Uq
	8FHWt6f7yw5hklv1KvtdRizd4zFmq4KG6du7Loaza0t+/Rv+fmmFaY81
X-Gm-Gg: AR+sD1045FADfZ8+3XgGLRZJas/mF7kC5pDw21ipFK2CbGfeK09mx3NL5RMuOME3k8u
	fFdu/URMcvwQOEEMvV3jUV4EVFHRGtNllve2pJ2JnDDxOZpAAQqau2kWF9dp28LdKrp6jviVeq5
	wkzleIXhR9CZby+1OUMzC+OEMT/rkEUJUnZE/nICXDo2TtPYtesUsA0jvffzgg8SDnLfhrzdlge
	7X1tjetLRLjqRm9fyW62MCjWU1jhTn1BNoIzhjHKHb2Tf6NGTt2GCb0F+EZ4iJSw1K0PlTI2LUS
	Cu/F9rwGjfcadyonc7FMXpENlpjma/awaGizJuZZtymJDrOPEfLhOdIJAvnq7Z9zXB4Ic1JqVde
	ovpzlkKB5b3VmNhmQPR+q6uu8NxoJOyio06W+yidgCJTO+1PUhKMvhMqMKISNWCKZCV/bFQFJii
	GXIne5v4EvH7kQixfg/iVXPeO7X+pXZkQxX59J31Y+T2jC9RGfgXlVqYv6OOQBEuxXpg1rWsrlQ
	X7Fd96ehV+GSliVcqixFrgjZx3y57VnNRUh+f6k+Nw1pXI9PPrBO4txZcq/D5kaPjF+d5H1ADNw
	A8E+
X-Received: by 2002:a05:6a00:b56:b0:847:9d6c:a56d with SMTP id d2e1a72fcca58-84f47dbc610mr1869903b3a.12.1785993774069;
        Wed, 05 Aug 2026 22:22:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/14] ASoC: rockchip: rockchip_rt5645: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:32 +0700
Message-ID: <20260806052136.21034-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222254_798994_7BC8FBB1 
X-CRM114-Status: GOOD (  12.42  )
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

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_rt5645.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index 590b64b362f6..0432eeabc64e 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -191,11 +191,8 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	rk_dailink.platforms->of_node = rk_dailink.cpus->of_node;
 
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Soc parse card name failed %d\n", ret);
+	if (ret)
 		goto put_cpu_of_node;
-	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-- 
2.43.0


