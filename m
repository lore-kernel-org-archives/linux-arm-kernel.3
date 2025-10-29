Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0059CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=; b=RN8cqU18NyEH5c9RZuSkPwaIDK
	06l8JP9ZNdRLknec/jNhdMU7EcnUBPN1I3aSaYbzluqgEDRQycme4Duxjau+FstgUkrpzSjBiY8SM
	Up/pSO5Zh6KNAFWUays5lKxZrL8n28qGhkNpXBqWCcf9JL331zsNq/eUyWkebxBA4MVtIeGKLAHZD
	eSDhZ/2tgzc94UcV4OTi8q6XwC8+sDxKHAIE6V3RT9NKE14cJWID0NkHZXnJPRBldh8GR/MG8Kd+K
	qhu2J4RXouDKxqYT0lwSt+3X+kP4cT9kzxcbcomNW+Tgt2imJvroNsIwdNuuufdC0MnVH957n5qCZ
	7YhzCQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97p-000000021st-3fVx;
	Wed, 29 Oct 2025 16:34:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97b-000000021aA-1mTG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 16:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=; b=JcVLwnqWc0PJZy0mCU5ST6TWDY
	71SIjBLXNcZlB+zte8nDwHUuA3deiY4Ttc4uopZyR3zH0NINLsa5U4CMAh4X9RDdWfiM9iPGxewVN
	SlVMj+ppAT2QIzpf+hoDte0g8eZfIttx9xuTl1FQ5vQuVrb9wMiU4N6R5ZTtsri1wF1slmaN4azMA
	ECzM49hraDgg9eZZeMwiDnyTIrPTsPWP4cmYIOrTTmelxg8OndVnX4rcBgOHpYKN59MkizJlmL7cX
	bvMrcG560HSQN1mz5Onm51HWr53fENNfUefpj52FUqo2FemGTwSbS/buqtSBkbWnbWkM81oPBmNRl
	h8K41NzQ==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Fo-00000007JgH-37Bt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:38:30 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-63d6ee383bdso16036944a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755638; x=1762360438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=;
        b=S7CERXMdcsEqJPa4CvbWVp4nRU2TMR8d29XvrDPGFSk6oDNX2Dh0La5pefAuEJuiRk
         Mv12cScIxl8uu+iPkC1DqCYr24wD0CRaOSRBgIsmzvNddaCxbeapTaXqmrv/XCxx/QAn
         8VmMkPKllYCtUeH7AzsmRFg7/4Nv6KqjyLWlCvr1IFy0xOZ1tUdrat+2ePytF23nh7Fl
         pFTjvy9JEK2KwH98g69g79eoXTS+mOfE7+ZbItg2RgozpbNNn4tn7u/VldXrBovAHYcW
         MnHPXAgszg9EBM9BO0ncvXkhS1Jfwc/0otFi5t/ylG1OT04zVvkN49xq60ZdCrUHHg4d
         Y6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755638; x=1762360438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=;
        b=mIwU9tF3yFlE5Kj/hUr1cBGXO53atJ4Gi1IdkEj3o0gpoW/77R9JRz2emF7BXElD3K
         QKYm6MhTLPsCfPganQoG30yCmD8fFubXNysOroxSSEvr6u5hGNcdw2hnHV+o8OFgKXvL
         ukEs4PUFQon7QWo1BllRRr/I+f0huo/w4wN/G3SZxSPZyp8x58eXtQpMYqOsygno8eGd
         4jKfhiT10/v4OWrsESKVtVwqSdiaBNs0M9GkzM+HryTtQ1jxWESu6y9qyV1nj/l2c4E/
         al39L0cJkk0BdMoxBmBQ1J58ZTz1ckp7VuZdfYysabB7I0oiN19ii18jjGj++Q/82BOZ
         3zQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxEOQ7Z4eQmq/SN10rRvAHiYF6xOryBvjh4mxOVmTkqN50fk9Hm35Lgm1IZRD81JPyMXEu30Fwpvh36FZOJI9j@lists.infradead.org
X-Gm-Message-State: AOJu0YwNuBVkHPH8rSzBNZtmVvYUNmCUX170AtPgy3sbpP7FDpj0oYH2
	c1jiNGvbMY+PC5Vx7yg09QwyGdI2/6iNdyOSS+B1Yq56PkTzLmjg7q7w
X-Gm-Gg: ASbGnct5arxqYIcWePlBiwLwJmcxoFcGxMXpiSF5So5cwtCVWXaihQX1wJc4CCG+OeJ
	yFyZdnzDVnzEmVu17Eb9f30vZ5CuRgK1XO2gNwxpubwBtysDHeS6YPeQrX586OTFMAu4ja7WLw2
	n5bKbmhOrKZ8z3PXz/MRm1YeeLON5oZ2pCFoLJZxa50GqN9rWVhY2yVDsuc+doeNwm3UTEqbk7I
	yOLh9+KBK0bNxSvYdrwHFdDpu6ZOpzdJ8kl8lOmXqKzDGgBjwvGieFbOWjux59UBdG7QaSLRGKk
	ssJ4ae1FaBMAIAZoUFxcyf2GWi6jwTzGtD8kLRYpoPQQ3lf8Sx6t41Mqn1QKtoJ2XSE7A0rLUaZ
	GiIs7wqz2aYL8+Y1TWD+EKv/0paCO8oSPAMhrxDGSWNFXKWyn3gtqp8SCAz1QkG/x42LcZSTHmH
	ef9zRUFBl52p1zWYvA0HpHpG1gFQamC41oYFhzp5KqDZSMcQWhJXeqIQJq2E2eQyL3NKhT
X-Google-Smtp-Source: AGHT+IHnWRqBehOWBCyuY7cscNzDJLcQ8Q1/xskpkrSKjJiOMcliraM9J9uBI/ZGi7u/t3zd09QFLA==
X-Received: by 2002:a05:6402:e9b:b0:634:544b:a740 with SMTP id 4fb4d7f45d1cf-64044255cf2mr2554809a12.22.1761755638150;
        Wed, 29 Oct 2025 09:33:58 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63e86c6d7d3sm12474615a12.27.2025.10.29.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] soc/tegra: pmc: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:36 +0100
Message-ID: <20251029163336.2785270-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_153829_426968_A024A4CB 
X-CRM114-Status: GOOD (  13.33  )
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

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/soc/tegra/pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f57e5a4b4d96..6e0ae0ede263 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3150,6 +3150,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 
 static void tegra186_pmc_wake_syscore_resume(void *data)
 {
+	struct tegra_pmc *pmc = data;
 	u32 status, mask;
 	unsigned int i;
 
@@ -3163,6 +3164,8 @@ static void tegra186_pmc_wake_syscore_resume(void *data)
 
 static int tegra186_pmc_wake_syscore_suspend(void *data)
 {
+	struct tegra_pmc *pmc = data;
+
 	wke_read_sw_wake_status(pmc);
 
 	/* flip the wakeup trigger for dual-edge triggered pads
@@ -3836,6 +3839,7 @@ static const struct tegra_pmc_regs tegra186_pmc_regs = {
 static void tegra186_pmc_init(struct tegra_pmc *pmc)
 {
 	pmc->syscore.ops = &tegra186_pmc_wake_syscore_ops;
+	pmc->syscore.data = pmc;
 	register_syscore(&pmc->syscore);
 }
 
-- 
2.51.0


