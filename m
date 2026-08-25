Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E91C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJH31Ij0uvxdhOs3xzrIR/KHtOQuioLd2XCJCFGaywI=; b=ZltWhV1yv5C3oWgrSrqrmPudbW
	hC1Ahu6lZUISZag8mz43HpptCVyEDVeCqjB7eDq9owaqjXUMthNqUfncoDYmS3OvemuEMXlBH9JW5
	e9zIDAPHr3EY6W+Cs72BlusfMnr9wZ7tRaoEywHkEcZqPAh/aMjmFhX+rHqY0ExaOjBdXAspvKu2T
	a5mvve9sarm2jUkmdjHmOd6Nsnyu1gypT1GkahfSY6mnt6VtV11e1bUi2oT6PoiO2s+zJkZbS9jxX
	4E9TyJlBzpll6EvzADVQwE7PBTX6gJtg1TMThjspsO60WgD7AAwPre17trnCxGWi37/314DkrPyLf
	yVz9IbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyurT-00000001Cxp-2SwR;
	Tue, 25 Aug 2026 17:22:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyurR-00000001CwQ-1qGa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:22:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e58034d05so99765a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787678576; x=1788283376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJH31Ij0uvxdhOs3xzrIR/KHtOQuioLd2XCJCFGaywI=;
        b=gfIfP+blKBUa3yzn7i8ajEZ41yhjj82/iavtriWICWaEE9ROyt31I7T9ceCBosud0z
         cNDyDDVFiJATToIbd1Wa9dIaRYABus6WkUDcKk82uGXRZVH0BDnAPnieRVQXmtcy3vyB
         cMjsBn6AdEAuDJiClBA5A2lOAzuPa5DyzDoxdXLaa/AwpdNFJppNdslNENeEdjlZdLtP
         ULnhN93A5bcEF5uJnidGrmFnK5Ht4B9pLQUq/lvBhUuEwKubTlNtmu1LoDEmoxjiwQ4M
         9e7iaUVt/Llg9XUtOqOh0V/YK8nVDNha/ncv7SOqWhIIMWojs2zxc+kDskrmHcLc9RaK
         dOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787678576; x=1788283376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJH31Ij0uvxdhOs3xzrIR/KHtOQuioLd2XCJCFGaywI=;
        b=X1cvvN5N1eOBgyx3PZYM7EwrqJ/lArfm9/1NhxC7HGZmNz21PHMOYIMQ52vdVJbqEb
         XmkGUx3pOptnWQHOL/injD/MvKrqiQcKlhnvBNIqEf9d4kAruQVSfJGMCD0kGda98YrT
         3aLpELFa/cKa3CoDVK01//qk942n0hOPE7cLy/bKxBqLrWiCR5yI1Rp0WQG5AYbu7D8L
         sCKjaDeiOsNZy2Goukvkt9WOGgbF/D3P/IJx1jvCWJqx9PnATZcY/rmHTgXMPbqdKrsE
         ZEsyYKAHYQRn5r5iWwfpTepJr/2q+mrd/VsgMEaOBotu8MdyTmDDt2B66G7yVQiomGdd
         ELKg==
X-Forwarded-Encrypted: i=1; AHgh+RqbuQ19tiTk+Wob9HnnbtiyhujqIIPXaMZ9+3WBYxE1vX1AoZolQRltDwMQkZxAFYC/621fQ9FwYothsEgv3cp9@lists.infradead.org
X-Gm-Message-State: AFuF++mg3kOib4YWFvvnm8MbX784pKaJ9jzvIkoas1ELFwSnaEtwFpdp
	NJrMF4KjyoayFV78JEXlEO+Wua22s+XMvUFwlTbU2bWBL2f/wSlLut7t
X-Gm-Gg: AR+sD10lRX2eepytxN84+Gr4BGebKs/E7anZFE4RFdtDjBo5bEOEaQEiM/YlPZENMwu
	BSFZsW6Dxg1plTy1SeWbiWde77WQv5wpCF5xtLxclFWK9v4qyt/YZOdibt5ce5VsS97cuZ8ofA1
	sDIbi1DbMqRFXDyFvbLoulrtZJv92U05wgCYZ96iivtecgsOl52S6W9rmkwfxYcsTeeil8fJTR3
	C19pusmCUpZj3mPHmizBme6seKzfI1YjR+Diu4H/fZ/S/L5x64MlEAwODhbgtVGF+A35oAM7joM
	G5s5YvhsXKtayd+qbl9EYZmt4kyfjBJ+tB8Ffv5PA7SlrcvcetS1aqfKMLmgXZZNWC9+S/dfJw/
	6jY7ci39O13x7Z60cZCxhkp2v7B3TXqHhXG3pzLbrUXx5Iw401BA5ahezCiQiwZj16Hn9vYKDEu
	ms8reGhoEKpXl2SymSNTNDR5kR3Rh4xeIyCpw0uIpDnA4NxkfH1s1ECYZdRwc=
X-Received: by 2002:a17:90b:1845:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-3966d85dd8dmr1276632a91.9.1787678576579;
        Tue, 25 Aug 2026 10:22:56 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:7ed1:605d:3bd6:fefb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8d208csm327637eec.23.2026.08.25.10.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:22:56 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v1 3/3] iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
Date: Tue, 25 Aug 2026 22:51:55 +0530
Message-ID: <20260825172155.250484-4-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825172155.250484-1-mdshahid03@gmail.com>
References: <20260825172155.250484-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_102257_483481_149D444D 
X-CRM114-Status: GOOD (  12.83  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Use devm_mutex_init() to tie the mutex lifetime to the device and
improve debugging when CONFIG_DEBUG_MUTEXES is enabled.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 1464c60bc83e..9b299e2c3e0c 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -530,7 +530,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	adc_priv = iio_priv(indio_dev);
 	platform_set_drvdata(pdev, indio_dev);
 
-	mutex_init(&adc_priv->mutex);
+	ret = devm_mutex_init(dev, &adc_priv->mutex);
+	if (ret)
+		return ret;
 
 	init_completion(&adc_priv->completion);
 
-- 
2.43.0


