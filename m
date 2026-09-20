Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E9EC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 05:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=; b=0dtf8V1pdKc0VevYtHaNDoSwy8
	b/cqXGuMKG8GjDC8N+oLEZwMFPaigvSS0kO+A6QZO524gkJ1Y6zQpCEmwQx3gKebplL6bnkOJOeLS
	kvaRHYhM+XM2WaPZuXVojGPmWeAcoUenxEUkM7KJO4QLq5N1J9cLMbewK5bg049LGYBjl4TLnFI5C
	YQp/2zdCXLUPQN9f3+82q0T7iGAh6HuDmnLUZ0ZHuziN4dtT+tL+7taLM+0E0KVdncBjhH7tfkeRB
	Pc/wzaGs5cXvDY7wGT2sHyABLSfejtr2Tj4FMfJ+ZxoTVZyh/OlH4Q68pGRDLqSYok5GWhPHHRZPu
	PkXRBUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A9v-0000000GwYd-2HwX;
	Sun, 20 Sep 2026 05:32:15 +0000
Received: from mail-oa2-x01.google.com ([2607:f8b0:4864:30::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A9o-0000000GwS8-1zgo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 05:32:09 +0000
Received: by mail-oa2-x01.google.com with SMTP id 586e51a60fabf-4511f6a63edso297088fac.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882328; x=1790487128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=Ks/lvSeElLnjZaD7DDUPo53T/+i4cjQf/RoL5Xo4d4o3NK8isU6VfsSke1FEL8U+Uk
         s8zgPJY3bRGtbk29Jpw/CFOOyzJ8bpnbp6yq939a1NvAh2h3iHAmY4/BKoFvkaDXzW4t
         qjKeO2ONbBLTG3hlZzAlPIvKQNgUwebaLH4m/F5QzDD7uanP+beZsoe54/ebLCxML3Am
         9hPf7nQVA/rsTrL2XQQ2DhpTtrbzggY4lXAoUEUCRiAzf6y8sbcRiQUEUaBSR6wBBOBj
         bZ5OIkK+N8Vewi0pyKc8XhDeWZCrQ+tHjCh7mdNZ6bVqrX07OE0nX5T6GHhU0iHrHWzl
         jhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882328; x=1790487128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=oms/dKU2d93YjedvZosIQdu2XI0rjRf92EbJQ7f0FUkwwWTiyB7VgfIDp957h0byqf
         XkOVU30xTlzHWqHBC1/Xz9XLA/c8WFi2C+MXkLTZ3r/hdKaRJ0hc7euCGbpWD6P8UzjQ
         KpXL10nUR1MoTgSqfm/F9cUIrc7DIyorHBrxXZUHKQW0lImDzswvsqYmHVgP6v0AGEwr
         XBxJRkjRsyGXwzoCZZpMcWqDfOlhaAxJT3IrL+28ldNTERU23HCM+YYh9Q5KK+ckAVCb
         vvxMmmncoCd9BXBvy/yqEPw5rOTpyHqvL7ZqYgh7bIYIJa9/kkkTncARGhCaZ/6ZxiE6
         LQXg==
X-Forwarded-Encrypted: i=1; AKwUvBwj8X+1jcfTomUEdP8uTVaGpVmVeQISWK3p29IcH3nVtbqM6LiDfRLn8YQ61b0RmizQGRZL33/nos9a5ajueo8C@lists.infradead.org
X-Gm-Message-State: AFuF++nYV03YaMDdNdraVQTTn3HBhLhNdorWLiSxxTKrwOQElMjuIR00
	jcwbrx+xY5DM8zSt3qCVCUesimeSuTdTQrXKggD/6rk6e8dFyJN7C1mG
X-Gm-Gg: AYBFou0kp6BWhf8IcVuxUrodWEfhcC5jvgO3wTgRMX+E//WVoSymcb2HZw5uJzso7/4
	iI0NB2LNMjga5nPntjmuv0JhpdiyewaH6pt+nm29t7wmfUu7u2bOARO4UnRpVdLzysbR8kTcT/Y
	sjBKdrdMKNZOMUqaPK+A8NReSG6Zy2Wz3vXwP5k2AF1Eiulf2lh2dHtIo5/eOaOf7kqtmLAWKIt
	Zpem7gVm/7jWIZ2dNJSzEdBfXhw8k4Kd3pDQBgWlD35fWV84M4K+xGjg9g5GbezHRb1XDRQGLkQ
	hU6xYpt+k5SCN6XoI0zRDXCqPd4f12hdKU69f2iqEbQ2iOx50FJr9GdL/p1+rTYyKEBMTITt157
	oCi/5AsFf4nNe1qIFhyj8b6s1/n2908O8BZ/nWSdEKHBFRwtz2dHTBT/BHSDY/6mpyhsBUv2ePo
	FIlSpfOLusoyb3tFFrPKQOF2U5Xz3fU5CN2elrPP8yHTbrQUbq3c5XjwhplQAimWwa/w==
X-Received: by 2002:a05:6820:818a:b0:6b7:8396:f3d6 with SMTP id 006d021491bc7-6ca9ce4cfcdmr7217118eaf.56.1789882327657;
        Sat, 19 Sep 2026 22:32:07 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd3541f07fsm5007319eaf.10.2026.09.19.22.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:32:06 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 20 Sep 2026 00:31:53 -0500
Subject: [PATCH v3 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-3-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789882316; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=9u9PT8EgMhT2CU7ynGTjZXDCJlhMILqp7KosTLFKUyKBrbzaMyv7T6YSoFBmQnoUOssaMtNEq
 wq0GEJz7dXDAC/rXFbTt3HuxJH3iGRrtfTsh2kyNLr/fEKdyaxtfq/X
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_223208_519475_3A935518 
X-CRM114-Status: GOOD (  13.63  )
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

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0


