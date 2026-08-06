Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F65EC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tvFFAh4lS3mG6cJ5ZjUOGQHSvP38stbFXiDSwTmBNI=; b=hKdh4ZziMhYFFRxGbR7X8MiBLj
	ISb+e0D8utfZd5SobdIRv/7EKrHPIjeUhQGfvEY6r7AR0TzhloUThDB+BxQ2CaJy7oCA28qmxgj0C
	QlklPzVWYSII+xIMYlRwNS2CnBt6MJNo4lOWC+zZUgOI2Q6JfRhlVVxxL9knoy+rthhEIs3tiHoDu
	Uaqxe5TcAL5sIQRJfRd3bvRuq0/snR76fuD9LOS8NUWRdFcZ2z5zoAaTRIpYeGru2CJxB8cq6bzUv
	luTUnGb0JKMBLZUxzbe1ZT2G5soJHKZGTPnKAEFBDlSgtZA1P8BOuAJKGHP5+AKDa11PfQlJ+Q4t8
	qHZCMW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZJ-00000004xsy-0XBA;
	Thu, 06 Aug 2026 05:23:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqZH-00000004xqK-0z3T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:23:00 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-848593533cbso631482b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993779; x=1786598579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tvFFAh4lS3mG6cJ5ZjUOGQHSvP38stbFXiDSwTmBNI=;
        b=HXEqBPB9KkdpSgbtU3FURcOIdWglcXxw5TwC4Sf/uUL3FNpqcc5+MHhuvpTuFFQNZN
         cr8amMwUUXGD1OO/c8K8mhzRzK88rFloeEaYo/ZQGQsYmiiiboHNgLb055y+rKut8dbM
         nCpMNp+N15d4k3bdkjezEKp6fB1UZ2Uu6ajRRnKH66+dcNF6aCacItgZBh4J7Q16WGf2
         7XIgOPpQpRXvYnmQwfVjg+BYT7wHlI/HWj5nkQZCtJKNL5ThpB+D45Q8Lp+KnHQCcu5l
         VgvAqyoNfvzRsfahDhUOMzlQECagQ4YVbsDxhZ7XZuaq+9b/n+w9Axv0gpoy5995J+Z5
         KM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993779; x=1786598579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tvFFAh4lS3mG6cJ5ZjUOGQHSvP38stbFXiDSwTmBNI=;
        b=QevOCBSNWewWZbhdSSCv/oCl3BMf2l3vHg1HdPlJHkVjYl39Dw9l6NgB8foReG15hA
         lpEboeK+ScWz6Ys0lPKnUYBWKGoDt9r91dJtiBfhmdCOArAo24JO6m3+dSeL4//GTONA
         HOX6okxPX4XrGdjyxk0VQ+zrA3mTOBkmSXwISRzRK491mXJuv0GsUbG+frmcU7bo4pGd
         oThW80Wm3JojyvLBz6KN0XHA7oSROe9g3jEomwfTCGMbp4V4lcKrv65llDtYC4cJRVL7
         FVZYUt6G7A1BY54/OLUbZcz++PEjnkaWlwjwUfv5P6Iti1xPayZMrTGSsXegofp0A3JM
         OP7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpIWgPELZ7N5O5NTEWaPIhqC67YQ8vokQmRc58TFRB1e0RxAnCpBS+M37jrEPs1Z6mYk9RdAzIwHJO73zQyzuep@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+qfxSUM4OjXXWMWJbJ8B7MS61TCPgHbT5uyvuAqniQtPba3Hy
	hnjWVKDjEr5bp51iPDDNYBSVJ8vAERVMTFnarw+RmzBBaTpP7YB97up4
X-Gm-Gg: AR+sD13wt1IamlUoTrXoMuA8x+QFQtd5AqRzauV7exssB1N5p8XRp0aGjHb+rr2YxO8
	ALHBsYs/aF2h6wF1qi6wNUCcu7+5RHMezs8DK9QeqnXmYo6YybZby0/AAXpBDHOTCqB6z9Ft2cs
	f03I+kuh2XPsqANhfviazZZdJllhjC2fi9m364DcBASVmJRWqVVhrJuugY0/qdiTEH5VsntsVxT
	z5BrpSVXwdyh8Lbratnb63Shbk3gOPmgdcSCCYrxFM+l25Oo25dgneScxbih7CmJ05LZsS2hKct
	VikYJgWi9LEkzPOh6CVcBl0MfTM0LnqESpBC4OZufpMF7c/n4HelpscdWDxPGUiTa89OzzEB5CY
	8D391LY/etDjSxZRcHpVPR2eNgnC7Z8C9udkL99A7bnZ4qyA3zFL4ALXjPuG4JxURCh5tqzZKcH
	yVnoO/nnMo1TO3o99hJORBsp7RatnmQBhjIWOhBar+PgQFnworz3M4EyZrhRP1xJyLFMJSvwDay
	aIsLgIK/vSyggnkVEZieMuquE56Fm/STuPvTWBwkOSKQheYS7n7Z2ppPz6XzZGit9SMpEzA11gC
	RPKN
X-Received: by 2002:a05:6a00:1310:b0:848:8027:cac with SMTP id d2e1a72fcca58-84f2e04d03fmr13506845b3a.23.1785993778592;
        Wed, 05 Aug 2026 22:22:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:58 -0700 (PDT)
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
Subject: [PATCH 11/14] ASoC: rockchip: rockchip_sai: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 12:21:33 +0700
Message-ID: <20260806052136.21034-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222259_294585_5E50345D 
X-CRM114-Status: GOOD (  12.61  )
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

Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
re-probed when the interrupt resource becomes available instead of
continuing probe without an IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 585e89f61f0d..522b4f4f6a7a 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1428,6 +1428,8 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 				     "Failed to initialize regmap\n");
 
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -EPROBE_DEFER)
+		return irq;
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, rockchip_sai_isr,
 				       IRQF_SHARED, node->name, sai);
-- 
2.43.0


