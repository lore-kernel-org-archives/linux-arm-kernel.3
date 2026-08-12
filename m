Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131B4C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pmOhvHjKtyx1tsemnhIoQr9qZIHW/1lKISTBmzgj3ag=; b=v/e3QMhicKwwg1wWIjUQ+vbPtk
	2lJxlFQpRS/5wPtWmtA3+AUUi2Om/ddhD0W9nhPJXwzGyg0W0BgHQC52/N09u/PT/VFCC+C/K7HYa
	69mC+h2+zt5WMg9qZAQcLNCcJ6DHtNIQjo+D0nz/9Np1HvNCW8qRrFBQ7/SfbVldQ38/6hsbJWdRv
	OR768uyuTWA7U4+nqWke4Ej+Yv+toYjYrnFHdkBAZWTnowOAoZBfZPrfpUmKFAn+x+54bKbxBB0BA
	+OolqhMCL4trHSN01L8XrQHPDpyd/xPr74M8/hdwLHc5EiBXEtHjzhYPNv1Ut/pLTQWJypuNEEu3c
	Nfv4QNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4cv-0000000FfuI-3GLE;
	Wed, 12 Aug 2026 08:47:57 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4cr-0000000FftO-23y8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:47:55 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c9e7391839cso630485a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524472; x=1787129272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pmOhvHjKtyx1tsemnhIoQr9qZIHW/1lKISTBmzgj3ag=;
        b=paCSkoDW3Y6yayZlOW8F0vhFToboG7yYj//WnnGa4Pf+WibYXgxWVA4RiK/KUvyWa/
         UhsYGMEvaF921fpzQZheWKUS+FcbJq8rZp969eTgjLt67ppyDzpSdI/NbU5Ibx4hZtIh
         bfpmg+vPOxB9gFNBIIUU76gBJRWF1CvNkQJ2QTGrEpShE0EgX5yIxjduLecQ8gazjaxL
         hrxhLNsc0DDjlYPg45QEm72dKKP1/0a9DCZzRY/kbGxpOF/qTNmAinNGOuILsgnDhZnd
         Ovb/ptxdJSolPQPhMs2+lBEFoTGrMb6s5eETrHzSNEzWED/r97uCufG/yAIm840oFOGs
         efFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524472; x=1787129272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmOhvHjKtyx1tsemnhIoQr9qZIHW/1lKISTBmzgj3ag=;
        b=RXno1ze4yD8QmCL+PF9zwas12Exag0jmikuX3zO4r2NOqcF3KY/t5GBGUu+NHx83gG
         T+2XBj9BAXAPtlfhGelZNBaQSNhfWh54TujAP1ftMhNXOfod2W2gl2R4LKOSApzGm75M
         A6pGFIF3w3z5cWZIaA6MjmFblPNCPnuxViGywn+ar17ZtQJte4lhX40u8WwFl5zbTvqK
         3QQ1qROaKvQe6fRYa9HHD4z+YuIl6Dah5y4PSiXq34ZMmlgaSPq1Wr2pWtzCXpT6cGtD
         fFBeZ74A30kN8efYaI7Kyum6jUyqnJhQQKnKcSdF7kEuNykxhIgYd+e+iTwrO7DP+ljw
         hCCg==
X-Forwarded-Encrypted: i=1; AHgh+RoVFVVjikU1fS/xn4yFhnWI5AYCx8C8lk3tCwFkn4v4zZCmPqgyf2zzJvvNa/UwXyO3v1hha85Emoq1DR2Jvtam@lists.infradead.org
X-Gm-Message-State: AOJu0YyI90wkhnIe6ruc77ZyTf1ntkEsItjTN1QAAC3ULIB1aRrEUl33
	QBVm4RRC6NnrmdngTPwfGRESwLcBbHTZ82l8DzxhkXE8iQbwplsAt2w=
X-Gm-Gg: AR+sD13F8zc+3Sf+4eWL0wAu5x6S0ADEvP7m1/hojOcXMhWv1km1ifc6a6lcA10PHa6
	wQhgBVEUCKcKQVAr9Tb9OdDcB6fFFni2PyDxCzPEggWg1PRSNp0dm23yoz/HVDfuc0iR37Z2eZ9
	RZcaCkyccu5/ojUQNtrfDt4rFxEjwV5hMPU7/wGKpS5/7riX15UehDGgVXI/eEw+tI7Ntwv2nCF
	xENl7Tfdut6MYaHsNrMc+A3oTMULLkPUf59+Nqa98jUw7owof00AeehqdVhC9zITbu3eR52lvoM
	YrvZlCf7FyjrVJ6kOF6Ufl2ODqzz+399ZnLxHy4pKAaxkq69o0bTzQs6PL3iqyKdv8hfezo5Wzu
	7HKNNGcaVHD7vh+DYvN9oG8c5VMYw5uIRbebv6z7gQ/9r+rH2B+QOGYl9bJTD/29LF/LopdZ8Li
	goz2G4PH6j2xnZjP6BP52m9Zo3cDQEGLtDjk2e1xiR37eaxBOUcJ/lff73x3y+BVCwubjaEWlyT
	qqnCuedYlpR0Gdxdmv2yL4=
X-Received: by 2002:a05:6a21:9104:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3cc3f7fecf9mr4379988637.34.1786524471484;
        Wed, 12 Aug 2026 01:47:51 -0700 (PDT)
Received: from t-rex ([2401:4900:add3:10b5:4aae:4436:6510:810])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d7a3c7sm12865594eec.29.2026.08.12.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:47:50 -0700 (PDT)
From: kr494167@gmail.com
To: jassisinghbrar@gmail.com,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v2 0/2] mailbox: cix: clean up channel validation and error reporting
Date: Wed, 12 Aug 2026 14:17:40 +0530
Message-ID: <20260812084742.22081-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_014753_529523_571F3076 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

From: Surendra Singh Chouhan <kr494167@gmail.com>

Per maintainer review feedback from Jassi Brar, this patch series splits
the CIX mailbox driver fixes into two separate patches:

Patch 1 validates fast channel index bounds before request_irq() in
cix_mbox_startup() to avoid unnecessary IRQ registration and teardown churn.

Patch 2 fixes the DT property name string typo ("cix,mbox_dir" -> "cix,mbox-dir")
and converts cix_mbox_probe() error paths to dev_err_probe().

v2:
 - Split into 2 separate patches per Jassi Brar review.
 - Drop bounced address peter.chen@cixtech.com.

Surendra Singh Chouhan (2):
  mailbox: cix: validate fast channel index before request_irq()
  mailbox: cix: fix DT property name string typo and use dev_err_probe()

 drivers/mailbox/cix-mailbox.c | 36 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

-- 
2.55.0


