Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93B8C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDuDwKR82JLi7EFxiha+vT2mlqKphTJuE7gvFBWzRzw=; b=xKyxH6eqgYARWO+XhSQNmLb+9y
	RGEG06Fqdls0Yp7d7UunKLjYyeT1vaXnvWqKKEqK84DDojPlhrAIE/Rg3/4urW6yfOTOBQrfRQOzK
	gjdJ158M971+qAD6/pkjNy3Z7u49J7Ej+YHTVjAmAXm3sAKAOq/1AK1Cl93qp+0qpoZFko+Fuhy6c
	tRMN1UvrKetnr2RhG7hQRuGG+U3ZrzCqW4rqDR8gvaY1iFcjRRMAziPz+mcxMM87EWBlHH+lW7h4q
	LHx3Y1V7KwCLs05xpEShi4x63WvliRAv2zLjkLqbM4WHv4a6+Fr6n7wGMHTFPZzXqxX77NaJtb/+N
	aSO5sXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYd-00000004x6T-0gFw;
	Thu, 06 Aug 2026 05:22:19 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYa-00000004x3T-3VVS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:22:17 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8484f229529so1551568b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993736; x=1786598536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDuDwKR82JLi7EFxiha+vT2mlqKphTJuE7gvFBWzRzw=;
        b=J9bHlJOpKjp1n9ayukAnPjUofrbkUah37Y/ogNwa+cmJzWsFH1nMl0z1BrY3t2qd/m
         UUaC6RgenCwLzUNtfFgnLvFuznq4NJCUhtI/3ykfZH3+dRZ/lf6KTXSR0PG5+98WwFfj
         q+nEwfN0hj0PJC9xdrIOcejidGgskRQM82/0AyT3u6XjMqK9ZYilH+wCr8s36DzNCVfi
         qtO+5yqxiDJSl6Unlc7743EvIBVyQIR0fnbzfi4CVCinc4KyQVT9tQL1IQkNQK69yG2q
         V1gOIY/++mdjsOtW1/aIGsmNyOFIOU2iZSe4pyPeFSG7vSbYd9nHGRyOuOCXNe9T5u8b
         COXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993736; x=1786598536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NDuDwKR82JLi7EFxiha+vT2mlqKphTJuE7gvFBWzRzw=;
        b=IlZ7bgcZkXPCe0X0ApSVn504GG1CVlMY6SrwPNxggMVzklbQB1a1fyIqr9dK9GzWns
         D22vnVk4YtibQ30UbWFt+ZwczF7Zj9LtTrnohdOjqhzWUw4irkJvWvuXKJpWrECwnxWa
         2BYA5uD+Mer6tWlcY5QsuwX0KIbFpoz25uwyB50OMxtkSicVJ9TkbXcBIScwYAYDAoIT
         qkSem1QJjCswns2KNHDy2pbeyKk8uc1/0+K5LFrF/UNiby2i9F6XbqVskn6u+umIWn+8
         YLjkl3uQPh2E4KEhng9CQ3RzVrUmUqcgbpvl9FSNcwI/vBP1XwEPMK6hvjGrYynbJ1rU
         lfnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgEoCW5HYHtOD3P22HOWcevhnpk75/ZBnLfEt91tfRIDaYSLFCExX/lWhi7NU19RrkZjwW0bnyRuiJ7NKAtmmX@lists.infradead.org
X-Gm-Message-State: AOJu0YwuyVpb9wNn/3DPvDfYN7/DHYSnkrcssNuPZbKJ3nQ5MXf4bsG1
	7TMmOA1yX2USIeJCPWIgRdPFMMSRxkfbaU/nYvJ68L1LoAXO9ILeBy0j
X-Gm-Gg: AR+sD11Usec6M1vJpwGqM+jn3DRchCJNl+mlLTqmf9Pz1vaztO01/4PgFNPO4tcTr4M
	28r8J3ftR4jLzqozdJwpC7rKSQhJn1U7cKlP2vifOuS83Qh6wspOf/7WhbwLmqGZiAHIVnYYvL1
	APAyXU/AtYcDGpnS5FpKezhrhkZLN9s8PpiTj8h6ZuyVT9PrtrM7ZqIyA3HFSA1fRy2xK5wYYDD
	vxtqFYo3ClQAYLnhd45jF70x829VxYtqox8fIv7oxZgPJtyIzbo0PTcvOKnde+iJBtjUSw9Xy8z
	wk9VOsIsOw6dsbjR4vDid9pJDwJsoGqYAEqJDnsYqaq3c5tyE//Y1UVZG377vNarNDccAuDXM9r
	lbNXm2XsKTCwfdncSa01XwyH8+UAW3uU89qFqAWHzkH1YwNnUPAwbhxJnsur8IA2BaM61CrAq1c
	v5R2E0t/6JVbZwYWN/ylhuDI6fW1aRsw1Say89exJ5FsFvwwo/phGSz7VQrRbTJwuZymWngQoG3
	8+hTekwg5as0xsoGbtpgkGCENfRXbLIcWuxz0exgXWM3m7svTZ3Z971W5lxWhaT69RlZ6qtWi1T
	obRizBccukhD3Rcu
X-Received: by 2002:a05:6a00:218d:b0:845:d6a5:716b with SMTP id d2e1a72fcca58-84f2e07129fmr13301068b3a.23.1785993736232;
        Wed, 05 Aug 2026 22:22:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:15 -0700 (PDT)
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
Subject: [PATCH 04/14] ASoC: rockchip: rockchip_i2s: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:26 +0700
Message-ID: <20260806052136.21034-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222216_874722_4CE36A43 
X-CRM114-Status: GOOD (  13.00  )
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
 sound/soc/rockchip/rockchip_i2s.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 3e8d07b3fc1e..354430f916f9 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -829,16 +829,12 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 					      &rockchip_i2s_component,
 					      dai, 1);
 
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register DAI\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register PCM\n");
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.43.0


