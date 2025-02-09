Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F8EC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 04:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=; b=YxjqoJYhZvbEBpm5Hrdyb8obZj
	XLqVgmRgh9na3gHtkAP//5veuXd3lI6rYJycmBRV/qUBkNc8tDx+l3HM3jaTKRfTIT8mFY1U5+LhU
	ytMhLJaRZZobSjzhmd3zpak9wHRBmacJSnpASwEtZDEMbP0Wtd8a8gutslBY9TQp3tPmdDevNsi59
	LmMqkVbwg6NF7pX7K4EtiHZGzrMjH1ZesMn0PhrLivQ5K+xFj88Mm962eiwEPUXfoUNNKOYhrTyQo
	9ecD+jLHeDJxcpRNfRgiZ0ptj3Jxy3hEqe7lByXOOvPgwMBqGoxvgxV1Pb0BXYmEHHbWSmqZKduSX
	2Ji0toQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyvr-0000000E4P1-3Oh1;
	Sun, 09 Feb 2025 04:28:35 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgylr-0000000E2Xt-2eRw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 04:18:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2fa286ea7e8so2780577a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 20:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074695; x=1739679495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=H27wk9QWPks3qOJRzw9zAVDZV0byI+ZYSlJ9j9W1L9N7hblqCI3x/J80PFe6D1lKnb
         L3ezHGeugew3uGKjs95OmkFOA5iZFPj2TwhgxFGooitN6vB/cqWpjBHuigtzD+nGfOqa
         wLJAyDpXKdEBhUYqNOadgPNPsPhhjtgSos1BfIoBD+M+70jz/4+4Qds0fDHYktsIO6ze
         H4KOZZDxECif6FPSvOMWsMTNFCDrw8pgV19xWyRZmZWxYuJHd+wqq8QLhoe/x7sea1zK
         Kn9z4XCFG5YanELyGy+D/dN/vSlXTJCT/ni9U0aGk+/B/A3G6ex9Dz81mFhFJpNpuRnG
         iX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074695; x=1739679495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=Bx8jww1ZFAzpaIR0c2++NZSdKVaH/k0U2e96eYHI5njRIXeh4TxFg8quduVhD3Hy7m
         8N0RAd1Hmj0/Jl5pJ3fBdYVzoqTzH+n7aYvKsfRCIi3yUHLAEX8QLHcqxx6XUISx8h1e
         yzqhcBy0igACRICeF4qccFsbjYrXUYea+ZKTP3R9hAc/fb+crEazQH1sRseSt9MY7rk9
         7U2LLZqgEzk9vfj5ZA3xvQ0KlHIeB3Mww/IbiWbZMEX+DeM533c7vcLse9pLOdyDl2UB
         dk9GnagfzMQJZBlLyno7ixixQu4BCXzP86tihXyd7OIv0vhtHLt1KEUtQGOChW+QjmYE
         V96Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkL901QXXSgP/ymv+croA4gc0mFaDFnfINQM35fIw1JZzRTEgmXf4lswhXcs5McXQ0wo0Dv68YI1OAhHz+Da7D@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6CxtQxgxteUsfsYhZvwmoMEAQ6QYF6V5QXvmkWDrMxcJRFv7b
	kaWZSWv3wMDjOc8InH+0+FanEsY9lHp7NQ7ENMIv5NFLkIPQ7W0TLzu23C4rjGk=
X-Gm-Gg: ASbGncvY7cCKEPAqu90K1KjZqTZFtPW9Rskzfu2D6kFDq10VFTJx/ZLM/qaIO1RUgfq
	pQY5il4NjmrZD132muh8hNQtt3AdZhC/7zu0zXVLTxC+t51MhIOIX1Z5Zq4GgQJd64dJ7X4jalm
	NgtRfnsllu6P10fK49MVFJlG5tKoksoC9tMaZjKHwtuvW7Z0HjvwF3bSWJNds9H1k+nhwS170yJ
	ZamHgMwbM5LluuM9fUq4VyH+KO/iIzNKUQS/sutYqVyGbh2xznoZQpw+AAX+IJcBPxQiLELk2wy
	segsmREw3wSsNsp60r84wl0C6YH93mAz4eTCyUaApWVFZ08oBq6qWAo=
X-Google-Smtp-Source: AGHT+IHL0ZAy+b2/HWpMWPKyLFtjwNwqGOrHhxJ1k6glfU7lfaN1/yKHZr4v/qmnwtb+wj+/nQhb2w==
X-Received: by 2002:a05:6a00:2289:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-7305d2ac0admr15896176b3a.0.1739074694598;
        Sat, 08 Feb 2025 20:18:14 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:14 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v5 07/11] RISC-V: Select GENERIC_PENDING_IRQ
Date: Sun,  9 Feb 2025 09:46:51 +0530
Message-ID: <20250209041655.331470-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201815_665533_3CA5710B 
X-CRM114-Status: UNSURE (   9.14  )
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

Enable GENERIC_PENDING_IRQ for RISC-V so that RISC-V irqchips can
support delayed irq mirgration in the interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..a32f39748775 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0


