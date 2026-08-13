Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BB0C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 05:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xzFkArDiYUJVrphFijlWZtDKj/k87XskzGvkdFKreQ=; b=qaxwrxjwJQ/Q7z+AKZ+OZKJpNz
	nBPUkN/seJdgDAcqe1sgYgsYb5NPP7rCCsOeCu095Khw4DDEOasvSEi6Xjz/NISCnPXLwZckK/vp7
	J4DVCg6PZaQvYblIp1cMmhsgd5TmF0kesWMTEisdHGW6lqHUXo1KkB65qrnbSRwjkgxuUi8LQTh7E
	RhvJxAWkVe7WNl8QQHpTA4fmADTHWLn6SNlAasFWJMvGuyta7VRQPYmr/E4ojiv0sfkS1j9sf7wnS
	ShtJ2NSnubsAJVbmB2IDE4ktxuVVMB2EOYobNe3XS7oVopCDkb/uXlAfv55EDaoHpDYrsgADpfmjz
	3idahfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5I-0000000HQSg-3SKq;
	Thu, 13 Aug 2026 05:34:32 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5F-0000000HQQV-3Ep2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 05:34:30 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38101f85591so623676a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 22:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786599269; x=1787204069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xzFkArDiYUJVrphFijlWZtDKj/k87XskzGvkdFKreQ=;
        b=LyWVZKZ+5Fl1UOKkfn8zHGuClvuH7S1M33vhSLA/gp4XQDmLgqZM/Ux6tWuBr8YlCY
         a9DQ5pISF59dljBmgbT+lgSFs3EHMPJ7pJoqCSAOnDHp+sqthzdYXDpnRCpf18KOA0XF
         LGYUHVX/esZksnAlqv0R3UNsDC+wkvBlstCchzopj4hFTepiyRX44aMou5uF2+xgT82T
         jYpzXwe4xaopLJbvGH8Ue9N/QGU9uJYwvQi7WwjHkqFysoAvRLGB/f7rhqvfNKjxq0Ee
         5dSqxvKQFxvaHc5d57kKMcD8rYolVluu9Mbd45RNa+XIzUH8WgjsATDTyPivwBTKR+Ce
         EZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599269; x=1787204069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xzFkArDiYUJVrphFijlWZtDKj/k87XskzGvkdFKreQ=;
        b=HeI69+jHDqCMKNRMDJFobsPQWxGozenKwvzrIm0wQPqC79J+0xsLHHXz01E2gJD76B
         TNXhl4AWA6hJpM04jxBGk7eqGxYloiG3BN5mDvtMdFkTxarTHeV0yK8Ls+zhEDGqb1Mk
         KBLmKAM+cdyI4lz3HqeRUi5O3OshSay6X0yf94D1aMUTGm6mVjU8D+sd9v/p/Ql0uciw
         J8d1fjYg0QuW7Ps/zXxYBkCXmASXY8UKRLLhewCcqpHismwox5D136cDE3lQe20ClTo0
         2kO2BfljlCon4p1KRWSj/F1PhKolS3Xb2W/CP+PFS5nF1U64FfswtEvwv+x/MCDJWVNT
         2OcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBpz/5C0gV9DUmYsWWecPd5JTLPwr4aKUHd59BCJifVgJcK/PP5ZEnflcljNpzQ2z6iQ1rD46nRaHT8CR+uzCb@lists.infradead.org
X-Gm-Message-State: AOJu0YxZmd2WNunKn8PNchLdJ28qKc9k4Sx36G/CBqFadd2F46ckxeDE
	pruvI1UEse0C5xqJ7f2w41PzUqpCAl0PSembtR63kU0MKDK8q4OtuycB
X-Gm-Gg: AR+sD11ZjcH9IU/FNO4M+fSdnkjDlsV5eToTk3yF8YK+dhpMrt76KMDxrS6EWj+XwAZ
	qryS72w8stZ+UTqpgoLT6W4lXCd/oaiTgvc0ki7LM8ugbqReQnVaE+i03cHh+IITQKmzH7Y11lJ
	V8/ELfEcQcLT0OLctfXTeIH8KcEguJ4dK8HIxjYDQ+NOxtcyvYQ1e7byd7fthlV4VTSujar15tf
	pY7xItnat06UmNxp4exSZAJFRbxOEM3JLqmFZch6Zt/K83eijrVo0vVKv6uyv43ApCd1NY3OUqm
	lY89V0LfWQsb2y/AWxJJDEcdgNQgQMB62Urp/C+sSZxrJ1lVEcLBa9DWRJWb9+6thqYee/8nbqp
	0qHZPpKFXk3ricrLy8XOj8UExZtUTc0Pg+PdclWbVmrtzk8AWBvqcyJebZACFqiIexH6Vqzafxe
	UI5ojALcLmUItY1N1AXqaJUfJ0nuvkC3szGyKvMc/1EN6rf4FNwpJnn83s+hFSx/NeteDt0BVQW
	v4g4ljvxofJvKm1j0NHJ0YT9FXtLjnEEc1g0w1l4leDIK7E9zIeqgluquuEkJWhOBiJkKvPoW6Z
	a1YISU3gtjF8V5OO+2zkRHhiWMI=
X-Received: by 2002:a17:90b:4990:b0:38e:b3fd:d584 with SMTP id 98e67ed59e1d1-3931f94365cmr1262125a91.15.1786599268892;
        Wed, 12 Aug 2026 22:34:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d872ec5sm594734a91.0.2026.08.12.22.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:34:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/3] mmc: davinci: Handle errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 12:34:03 +0700
Message-ID: <20260813053404.21553-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813053404.21553-1-phucduc.bui@gmail.com>
References: <20260813053404.21553-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_223429_823376_F22EE52F 
X-CRM114-Status: GOOD (  14.33  )
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
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

However, the driver currently stores the return value directly in
host->sdio_irq and continues probing.

Propagate negative errors other than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Use parse_fail for proper cleanup on IRQ lookup errors.
 - Keep the value returned by platform_get_irq_optional() 
   in host->sdio_irq, since it is already checked 
   before calling devm_request_irq().

 drivers/mmc/host/davinci_mmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index cdb9fa94b56d..773577a10512 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1249,6 +1249,10 @@ static int davinci_mmcsd_probe(struct platform_device *pdev)
 	host->use_dma = use_dma;
 	host->mmc_irq = irq;
 	host->sdio_irq = platform_get_irq_optional(pdev, 1);
+	if (host->sdio_irq < 0 && host->sdio_irq != -ENXIO) {
+		ret = host->sdio_irq;
+		goto parse_fail;
+	}
 
 	if (host->use_dma) {
 		ret = davinci_acquire_dma_channels(host);
-- 
2.43.0


