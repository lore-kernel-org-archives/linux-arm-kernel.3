Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE693C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRPg2fF5zW2ebng5FORfud2q4xXOQdkBJ5AC1S3iOZQ=; b=INNZQO+ExtgMxyKnwq1U6++0Y4
	T7CeZbR7gtR5rdQO5RpS9XwyCS5/euSFvfvNEZeb1DenoVSNSgyn51ztK8/MW9STlxdNQkT7AjYFf
	rFA0ytn+um47b31W1CRZReyYBuDx495WoTwn3E9Kt4nx87rtFuaH5iPIpE3uO64X28yJlotA5m8WK
	1RyS33oRqWuw/CE0GRPSGOHqfSxWfVU6nNWMXR4SkRYEtVL//mZRcVw8Tf3Al9zwGPyuRGbg3XzBk
	cvPS7TkMdF/uLqYM4ulR+oLkeMDsBpehMzr29y1MisD5vUXBYGtyHp/e7t9aN302lC4/0XftasSup
	Xyi447Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFlZ-00000007Oc3-3Icm;
	Fri, 07 Aug 2026 08:17:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFlX-00000007OaL-3hMp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pRPg2fF5zW2ebng5FORfud2q4xXOQdkBJ5AC1S3iOZQ=; b=nDZ00x18veN73QxWCszYJKiuoa
	SX4vbv97remPUo3k2ws6oG3DKQzBhHHHw0ihscL+3TAeqbqrf3qNSQIKL7tDqJ/M2pJ0kzwt8dc+I
	RpW6NhsJDI6EXn6rsflHxdW//L1erlzutMuR9smzRj61bcQ6icBqwdCuDx5k87+w1nBPj0dxIUfYk
	49sMPu2SGJsvFJ89t++aAro61XOZEJsqo9JPTs2exohPChhYzLd9JTqx88wGuUocTrOzsjAkEdWsR
	PawjFPzB8zWwqYfSbN7fuQILEIHjVI48ts1a+Lw8Cz/UoY3ZHohkdVNr3/X6YQztsVSb1MpF3F1z8
	kDKzhuiQ==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFlT-0000000CBbh-2KLC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:17:18 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3900e39d935so2948911a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786090633; x=1786695433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRPg2fF5zW2ebng5FORfud2q4xXOQdkBJ5AC1S3iOZQ=;
        b=f2KXllZM72b6UqfZTvx/UEoKbbmbcqXyCm7YENe2CQH6CIUEV1SCbBJOHS0XBYK4Zr
         8MVnrrU7g9vtJZGxvKaCjzyg/Zl0zRldYXFnnLl8GG0DivJiP90jk1xNV4aA3+2epZbP
         wbhx3K3cIkC1k53pGXDDMYWCTEVYf0Qw4wO70lWlcJLae4LpcUrwlyxAks2if+cklKeZ
         KImMN2XKuJplC1+JXt/b7GCA/quxDnMDxK/Rxn9R7abgtpsdVA1ULy92AiGnTsYe/2WZ
         h1apQwxoR5uIzjXzlKnOMKjhtzxBgSx4SkHOF+PVFaLtrdT3m+Uyx1Z2VjTnqC+bx+Xg
         m6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090633; x=1786695433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRPg2fF5zW2ebng5FORfud2q4xXOQdkBJ5AC1S3iOZQ=;
        b=lW/9hbj14QbFxlV6tWcsuqcbo+VGyCmoe7GMy9SA0Pis82ryR+c8Mvz/J0cZkMiDNC
         qwP4LN+n+1+jTbOLI/uPPNT07OhhUF7EPmQr7geqD+AH3/AGKclUsjsbSccQ0gSeB1gA
         KviSja5/E959mAYchVPXbyk/xcHvQM4C/9RtnsAeI6VoOGxzCaFOQMsWuMbumgtUHz9X
         9QzG8lU5iqkEoqwA/IHJZ0tr+/Nl4K0NtCrkYAqIxEhW0ChyYFDdcmqqMl7V4NE6zJm7
         l+NMiIOy9ZWPwWW+DTPQWCnNBEIBokyFhAY7IJ5e+7SkXJWgdv6uJ47l9ARaMm2Z84DJ
         pXcA==
X-Forwarded-Encrypted: i=1; AHgh+RqwD8FVSP9lYg+hK+r0Yr5kNNl0rqjBtrtDy86UKQyECpy8ib0WJpdGTPTcNT7JFonmLCSISiNVYEmufG73ZUfM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr/y45SVKxYW91wRAx77kl8MwUg/Hu52w//sXQg0VyaFwD/tOo
	S82cLOuFgGS1Rutyh/9Pym+/gh6C28zyzMy6Dp7WxaBiFs4hfOBPzcdG
X-Gm-Gg: AR+sD11ya+kK8GRqxYw2wyAYxCEUzD1bd0RSd2JK/Ic+iW+dZuVyGZZHSepaOD+ifAs
	sYolMneV/x1HDjKmvwIGaBIyu+aAmM0isjHDsLnw94Ixa8hnHzIJHyby3ke/8h7tSR0iZE21UMz
	+0uww1qmwKSK3oGHtPibwmPCayT1fAk+q8WHyu3LQ6grch7+6WAptOdM3YUfP6diXsWXrYGiArh
	9z8U475nY0UWGPITDsz93r06Bw2bNnnCyup3CW2QB5rTiO7/BU0NRuA8ZOokkLtorSkeo7yS2F8
	BFyzw6rEuKtR/IMoSMI2m3V+jQO/5m1KF6XpN7sAN0Ifu9v7uz28qUVLVVgd5L1+CtWH7Xfa84Q
	7VEDJHS2ArI1vMEaU5N2tnNy15wTkUVdG12TWGeNZ/oosEDxdmrxG0v7SNdrtwH1Ph9BFhPRlwu
	Nqgh8j+h7FIbZTFkw4YrV1fQ59WKLAOM8uvjo7DzCerTGh/WmQ0B10lfWeh5W5aFzhn2GJj6GVw
	XXJhi4ANqWtqXxX7IO6ykTYKNSPnA+wp5AG04PoS+zchiYN9VxNA1LbXEqk7GY+0Dv5CjUEhLwC
	CSQB
X-Received: by 2002:a17:90b:274d:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-3903c534d46mr24091471a91.4.1786090633235;
        Fri, 07 Aug 2026 01:17:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm3913377a91.6.2026.08.07.01.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:17:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] watchdog: mediatek: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 15:16:50 +0700
Message-ID: <20260807081652.38692-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807081652.38692-1-phucduc.bui@gmail.com>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091715_745833_5464B1CF 
X-CRM114-Status: GOOD (  13.80  )
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

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..d9c30e4c80e3 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -422,8 +422,8 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
 		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT / 2;
 	} else {
-		if (irq == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
+		if (irq != -ENXIO)
+			return irq;
 
 		mtk_wdt->wdt_dev.info = &mtk_wdt_info;
 	}
-- 
2.43.0


