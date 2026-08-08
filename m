Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95413C5AD2C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z8XEbNxmFITtGAeV3qoLd7HeCqmH9Ffgh8sG2RD/33I=; b=M+RYAet7peh8cVSugQ80inqwMf
	FTvhlN2Xcf4zmzXQpI1OkzVA6WvGHSEIZ3Ms2eepS4ri9LGeEt5R5NAnjI2dLgU8ppvXNmJca6cCf
	yP7QdZE/afRxCtosbm8ZTIV0v4D7KLEw/FF+hRxCj0EHFg6dHboOexpdU003JxxswrbbX6Jml9VJx
	xxCefxMTRyu0C3r8KQsquYelDKKcIwMdvEDTR/zI1sHQke092smva32K5IF49M5FstqKZ8ZQXP2S0
	yvWncz5jae7gOZMjjxxZkKf6yxlKTRGyZbY262pb9o+H0u7LYmIT1gSHNLzhm1Z07KW2kwtMKIref
	90JrWttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscvw-00000009C7G-1scT;
	Sat, 08 Aug 2026 09:01:36 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscvu-00000009C6b-20RE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:01:35 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso201729a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179693; x=1786784493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z8XEbNxmFITtGAeV3qoLd7HeCqmH9Ffgh8sG2RD/33I=;
        b=TL9xeeYoIT1PV60no7sg6bUPz579gCPNKoctWpUmd6IZ8kDGhsRckj3NPSKt9srY6a
         QcjuWYChMBJaFvT6PCLD1qoYb1U66jtA168w/fePZXsIRtPxpPd7GwYxWJjlGTLulCLj
         6JEHDHcxDa0wQlvlSppiAXzrhN1fzGJcKh6av1TR7iWHybq3KeCsL7tEHdAHkpHBAjBq
         uVrGU/FAiIpBurhuMMvuHpY5gwFCox89NQv89fJxiCDe63nRCUSvp9o61j9Rbdj3j4Dr
         w1FkhET2dvYtQm2W8FBngL4sN08J4ePdOEbwys3+qtaHCjeTZe8Er55OlaL1ezS1Zwyv
         Wm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179693; x=1786784493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8XEbNxmFITtGAeV3qoLd7HeCqmH9Ffgh8sG2RD/33I=;
        b=L7vtzx3aAwyOI9FaKDhkx6UgLVHvSw9CuH8oy0CqF3WpU46fJloPwPW8apYUhFzycD
         4hZ8zagmrIdQ22EEebKUEEosVnp+tCdhI9ogkUkHBlj8KcX7oCZc5PmxvDQyZmFQvFbl
         4H8eHmqdG3AYNPQlFV/9zQ7XrCrA0NVvT8FGveIt5MvhdQP00Dd8hajElMAenEQMgE/5
         yxC7wmRBrdULOaG8DHPMaXV4Ic5sGWcIXIfNajehn3uDmABQIDPqqD82mI2sMWkclq2i
         dVmJ1LhB7/Umsf/iTCT+4OclzqW1GYdguRywUwRYM+HfcZiAtw9PpV7exRMefIbfKfUB
         BM1w==
X-Forwarded-Encrypted: i=1; AHgh+RpWZBmH1bVzzrksWFRoJv+8IxdrzUas6o+nO37ym0bqib3NZU6jgWQ7gS6oo+AddjeK8p6CKIismMZS41bM2tif@lists.infradead.org
X-Gm-Message-State: AOJu0YzeKPkdi2fdqoBJhf+PsUpel4ecfduQKRJ55B9iQ/CNbq1rXm03
	VZIKjnm/HyZDHIL+bLKMt0Zt/76rxwf4hcMsKz/4in66U6pnr8XVY6qZ
X-Gm-Gg: AR+sD11YJTnJQ8g/NuW/6zegZ3FrRxAtdT62QRlv8KgaeQmbpNCdBITAqmJTOPGhDbL
	ZFkkOY8AzwBFiZ49aaYAQjOfLlAZlgy3DXReOIXZFXhHE6ZBokYPEt/vsK6Nz8l3Hxr8zgEqldl
	MQ65B7RD06knFnXozs0HkUBNeE//FGogMTekFFcOSfluP+UIgB6WrYJc4tfzQGoM7o/dR6XM27q
	d3UI9NEEYGRMHUiT9EVNouDcavQF5Z/qg8CHDY8F7g7OG9YOhdhaZ36Wx3PHIkmm6eGx2wP3yZw
	01Myvf5hcQUvyLROPiGJI9MfnCv/nJaawgePoWFEfkouzQsXMoKPdWB4hBxKLMjD0DftOyW8/0Y
	B2qEm1QnHZjiXPW/0s4tE8lPxoNRAYrIeiZnRYHkY50J1m7/wIAMedM4SN6cibDP9qEOdZn02K7
	vYIpEC22IVdX7HVbk5ApW8jKjeEzfAwOOj0+HMB6Q6aEKIMUWrarIj2y+1AZ7/dxzmEJrp
X-Received: by 2002:a17:90b:582e:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-392823d97aamr5991393a91.15.1786179692981;
        Sat, 08 Aug 2026 02:01:32 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff24b91sm5349083a91.9.2026.08.08.02.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:01:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] crypto: sun8i-ss: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 17:01:21 +0800
Message-ID: <20260808090121.2718855-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_020134_523903_10ED588A 
X-CRM114-Status: GOOD (  13.12  )
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

sun8i_ss_pm_init() calls pm_runtime_use_autosuspend(), but the
autosuspend setting is not undone if pm_runtime_set_suspended() fails
or when runtime PM is later torn down by sun8i_ss_pm_exit().

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Undo the autosuspend setting when pm_runtime_set_suspended() fails and
in sun8i_ss_pm_exit() before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: f08fcced6d00 ("crypto: allwinner - Add sun8i-ss cryptographic offloader")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
index 59c9bc45ec0f..775355ac9f9e 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
@@ -664,14 +664,18 @@ static int sun8i_ss_pm_init(struct sun8i_ss_dev *ss)
 	pm_runtime_set_autosuspend_delay(ss->dev, 2000);
 
 	err = pm_runtime_set_suspended(ss->dev);
-	if (err)
+	if (err) {
+		pm_runtime_dont_use_autosuspend(ss->dev);
 		return err;
+	}
+
 	pm_runtime_enable(ss->dev);
 	return err;
 }
 
 static void sun8i_ss_pm_exit(struct sun8i_ss_dev *ss)
 {
+	pm_runtime_dont_use_autosuspend(ss->dev);
 	pm_runtime_disable(ss->dev);
 }
 
-- 
2.43.0


