Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E46C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnRpk/p9sKuCOyv2KZjNLOO6T+xrx1m13lZc/9SNpSQ=; b=jlFnXJ9bP3WMPRKgb5Oe/JP+mZ
	gq1WbOSvkmoMrD6uJIZBFPbRQJQf9+t3MRS+x6ndB4mei7ggaOua6eRq8uwL2J6HKfBeEd3HjEfEw
	1yzrLZIV13x+3ks5VrdEnXak9rCKdfCuKlMN943QIfZ85wcM4ymo0cGhcxZ2wtGvuucMRSZXiWvqG
	X4At3f4lGLRorUhpiJ4YhkAVziYPQFJ98PYtefdvdGkNBSOqnNsZDSIg1XG2hgqEpY9ESdkmbfhLz
	YuCHSF8J0PQZQFgwVp0HxLmX3u2WjR/K644ztvt45cX3FlesjMO4Y/qRvntrcsQI5A3jeRH39//gm
	9ZBsSPuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDvC-0000000HULx-2zjV;
	Tue, 04 Feb 2025 08:04:38 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDmE-0000000HSsS-3McW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 07:55:23 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b6ef047e9bso473351585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655722; x=1739260522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnRpk/p9sKuCOyv2KZjNLOO6T+xrx1m13lZc/9SNpSQ=;
        b=HGWb5V3LuorlC20A3R8l9dP9WR75SIUcCEu8BruGb6sQRGYIGKOfOd7OADt/ecQYKN
         zrnr++AXTDjgtm4GyOWMko9jAjsVsXz6fDk6Ef5xEN/9zM3+rfPmEj/xejXJX/q3lEHK
         pJVPoocqNdH67T42Sv01n1E7YLe/kEzqykjwGtTkRi7B6x+9pCgUi4N5L0dP0c07BHYM
         PoQH6ONbl0ojMHCUhCp3GHwwIc2OI9whUhMXCQah4gVRHH8n1GiDwXNo8xqAyF7ehy/C
         K1lEktCbe3nWB1/by8DFJ/jW6YMS820JVyAksCF27P6ODAGdgaKti+yezLQO8mW9HZBI
         jADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655722; x=1739260522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnRpk/p9sKuCOyv2KZjNLOO6T+xrx1m13lZc/9SNpSQ=;
        b=by7HrI6LdWFGv/Ank43XkEjEq834ErFAHKa3K7kV9wdWUWbA5NCZDA9HxUXHznRY5h
         KAXaMW0skv1qmktnfVWWpaacDeylh+bs9Hgq5OMaHUo+lGWFd0rYTllvFsqghI6upVKz
         kBfm/IFBvUfi7zn1gJTazQLQa8hf8/Uf7565aFcvTXUEpY6dwrnoKtvzfwvQsyY06Zk5
         2oNO3L/R57dhdjmDNw4McnYMnLtXqpQCggBfke6Rk5EPoXFNNWVzBLdiVlDqoQCTSfMv
         +IKIjV5Dn1dBd45zyEW3V3bL+yeC2KkLimYJ2zn0Ldr97J2JF+RmNhQdg+A2NaMTiyor
         tYlA==
X-Forwarded-Encrypted: i=1; AJvYcCWSSiLYhk5Qbiuhs/SPN+9QPYiL2LA9CbEMLrL+V3lbkVLFRauoCtKH4DaNB1ITfPZ0z0jxbfNj+pmFwmJ8vZdb@lists.infradead.org
X-Gm-Message-State: AOJu0YxK7X2SasR0VKsEyYWJLOsWWn58L9IqCdoK8VC+CzoThpYNvVVG
	UWHozmiu5oSIw7a0FVS+09jnWEnlL7HOl6HIMawfOfOWMVnpE4P3UfXg8y3xvXE=
X-Gm-Gg: ASbGncsYA6aZWZit10bgp855cHh5wXx/EANG24sM8ycbj7u7L4rlSYyTScZiIck0F30
	1VJiBRuoY2d6sJcssuDKvHJ3nWbgsY5JRytdRnexZusxldo4v2TNac+IOz90oVtLkmKWm/MDtPo
	Gb37XROe9PJiWtVhPSdqlXT1aIXHUloBwLexcM1KaHsJfbSuyuObJbRGrQodyQAOkxCHbRVWA62
	Pck/jhptkqh3wmPDtSzSg+CxYeO1hVHPtx7imNxjiMWtu/5gKH+A1/3E6of2MPEHqC6fY95JU4Q
	c8QihIncPlbwaT8cTW2pyJSuWy5dU0Fubcn68XUfGn/3kqdRw9fbDeM=
X-Google-Smtp-Source: AGHT+IHxtxKg5RW+0tra7ErqT2l5lv/l4qXvXUJ8U9uiGwIl5QtJCesqdAm7TRDDQSFPGUYW4TnQ4g==
X-Received: by 2002:a05:620a:1993:b0:7b6:d710:22ad with SMTP id af79cd13be357-7c02eca3a0amr362876885a.27.1738655721837;
        Mon, 03 Feb 2025 23:55:21 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 06/10] RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
Date: Tue,  4 Feb 2025 13:24:01 +0530
Message-ID: <20250204075405.824721-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235522_847331_F89C015C 
X-CRM114-Status: UNSURE (   9.87  )
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

Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS for RISC-V
so that RISC-V irqchips can support delayed irq mirgration in the
interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..3c19e6ca832d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,8 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
+	select GENERIC_PENDING_IRQ_CHIPFLAGS if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0


