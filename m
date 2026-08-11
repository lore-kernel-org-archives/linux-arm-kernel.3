Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A254C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 10:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yi2AQubmBld0thtX/fIlK+IyfhDWkAZ51GVpdWF8ty4=; b=rLFjQACOrzbwVf4kzuF8SdYYF3
	d7w6EJNqEru5sIXbILeV9wrgnknFBo9t+YmflpFBO7uvD63ky4VEYEF3dtbIcw6QnHbqODTq85fLV
	oRvj7L4PVam0zzCCoLf3LdFNkYzLP8pTGqzy2H0Nm+GnIdjoIBItp5V5Gm4A2rOhoL+dLmbly+A0w
	UF+u0FZm1KVY0RYT5I3wjnq3yZsWcl4uDg+6n0xg1QhrmWEgzqChgpb2/i9CfPAv4VY6NYQeWLOGM
	ADP0wY39cFlqi3iYNVszOZIFER1gCKs09kFce0YLLy23J6sgESTlkUVXo6rvJ3oytFmUF1Ds/KDxK
	u+UB150g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjQw-0000000Doha-0m3F;
	Tue, 11 Aug 2026 10:10:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjQt-0000000Doh0-2x0Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 10:10:08 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso7906495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 03:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786443007; x=1787047807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yi2AQubmBld0thtX/fIlK+IyfhDWkAZ51GVpdWF8ty4=;
        b=cAmC5L5PWi6FRhTpzLcoe+dMJ+fJW/avzotkvn89IA4FFChvZFAxSgqNuLbFBRwZRX
         9tIpRir2YNFCBR2VqX5NcJmn80mzjEXyQPZSFw7UYWeSlPnasteVeP7edmccW712C850
         DpGwcg85/3/Qgl/+2rvMkmMFS5hzKnFWhx72q/2JoxZRQPJ+A2znaRf6iu/NYEe6s59A
         hq1eizVdRRIxFv8M23eknVF/gZR4nVeaNboageBdOzcrWitK1ZshMG5/n+gM5G/dtldh
         6SpRgfzT7utqPovZm76kJfQThad5ffwg9CsSGIaO4ltXKmF9oZBwBAbUFfC9q16rryqu
         E9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443007; x=1787047807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yi2AQubmBld0thtX/fIlK+IyfhDWkAZ51GVpdWF8ty4=;
        b=SYShEwS5UpPX4XjbFaq5RuDzrlBTKsS7fUuczjZUw8PRzoZ2VWc7HoTnNV9rX1nvfC
         5ffxFJK2LH99uatHxWQfwf0HPxsaFM8R0z1K1pc/X6shYYQWtCH2jWYvgdor0ePge1ov
         thvW2TBI63HanHejxqOHLEnD9FLAwGCEKdzMV3oJyypYTijfokB20mshMYEb/noRk+ff
         kknbMiHSDauavlDg+vEsc0yCjXwTwXuS3AHRYEZ/1Q3Tnng2ZxtrZfshSFz4R7nDw1UI
         FUYeF0tUC/sKtXCNinc/G3H4dYddkmoJWaB3iMPwaNvn+HNyhzBPXVwU841q0UWt+yyN
         jfdg==
X-Gm-Message-State: AOJu0YwNcEvhHabgIoZ6Gy4+TOfZvAKDL+5/fjbQdN+dVOQS1wARcOAh
	IRpO0WYAAURef8LSaNz16dJG0ggujBiiH5l1Gy528y5Zoj3c5dmBCtE1
X-Gm-Gg: AR+sD10AtvkjRRvy6LcNOagggFIP5hb8phGYjBlV/XULOh6Ou2sQ8f/Gz3zx+9AOuko
	Ea7PGf1P0gPQ6Gy5ea5Hre8eyuiWiy2NvHKnUWYAlUgZvvccokq9cGBi331/bAX26huYEqOM/BY
	rLvaruZNd21SQG/cXqihY/G9IvIe/zK97g6suN007/UZSZz7ab+w1il4rm12VrPgHusGHQSdLh9
	MMPTcAkuE5C5KmNbSOODk6JNN+6zqj+tFlxMBLEpWmT789rEF2tJWKM14O8ne+vQlunqzh357Y/
	tOPWw2nAlP5VeN9ouYyB6zCrLZmIAoombjG8TtR2NMfNMW63joPl9/tUFCRr5/GOanZfruRaVvI
	OwuicdH2VEJ8dsryY4dqAWYyidXVgqP6Suj/k4CLtTo6KeJ9c8ovC3r8LFDg3XprHSXHbEQLI+U
	WcewsgPKg0wHQPukJepDX9Zk1LHk5ZGkJve6mfzRygoxfmj2/s7pu4za1ZGObpayiCVTWztHDur
	OWQF4KnbEQuTv9VMdIRVfV4AOw6YCwzKPKxSJuOvispKhf3awpk+uNtDvNRSDq8DCP85ODaU/t3
	ciqR
X-Received: by 2002:a17:903:4688:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2d317925cbfmr22741185ad.12.1786443006674;
        Tue, 11 Aug 2026 03:10:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm5189625ad.37.2026.08.11.03.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:10:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Daniel Mack <daniel@zonque.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH] ASoC: pxa: Use devm_clk_get_optional() for extclk clock
Date: Tue, 11 Aug 2026 17:09:49 +0700
Message-ID: <20260811100949.61142-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_031007_777227_0EB2905C 
X-CRM114-Status: GOOD (  15.30  )
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

The Device Tree binding defines the extclk clock as an optional
property, but the driver currently uses devm_clk_get() and manually
handles the absence of the clock.

Use devm_clk_get_optional() to match the binding and simplify the
optional clock handling. This also propagates errors other than the
absence of the optional clock, including -EPROBE_DEFER.

This changes the existing behavior for errors other than
-EPROBE_DEFER. RFC to discuss whether these errors should cause probe
to fail rather than being treated as an unavailable optional clock.

Fixes: 90eb6b59d311 ("ASoC: pxa-ssp: add support for an external clock in devicetree")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/pxa/pxa-ssp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index f8054c1c59fa..3a0abcb0bfbd 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -769,13 +769,10 @@ static int pxa_ssp_probe(struct snd_soc_dai *dai)
 			goto err_priv;
 		}
 
-		priv->extclk = devm_clk_get(dev, "extclk");
+		priv->extclk = devm_clk_get_optional(dev, "extclk");
 		if (IS_ERR(priv->extclk)) {
 			ret = PTR_ERR(priv->extclk);
-			if (ret == -EPROBE_DEFER)
-				goto err_priv;
-
-			priv->extclk = NULL;
+			goto err_priv;
 		}
 	} else {
 		priv->ssp = pxa_ssp_request(dai->id + 1, "SoC audio");
-- 
2.43.0


