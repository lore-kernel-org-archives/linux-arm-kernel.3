Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027BDC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 12:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkT1HXnvhmnIAy7ak03esG1cDt05Qmm78tFPJg+aYTA=; b=KYE3sdrOkCyzivaVu+jFymYOxO
	QTd0iVzsZaNLbW9I3Pmhe1oFJH4A2ia2M1HDdUjpzk7YAKelxnwFUA3DSIcheBdtnBnoDRsEWVLUn
	mprp9xDfa8PAkn4typcQZBgh3mf8YmP3geSHpd2mol4PknE//+5pnGpkHgRzkdXkgpEOzuq9gmTF4
	pERq4RGMxxvlevCPDKylpvMgHeB8KoQTCMq/n+MWDSOfq0OwcbAQ4c3lgJWqCU6ZXWJZyR9qUiZ/U
	bzEoAFM1J9QVSXiBOhwSBpQVaNYaZN9CnJaSjFaCYrDmK/zM5fzN/su4fqnKasq6VlOdpoAHIAgcT
	gucYblCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiY71-0000000AyKM-2lp3;
	Thu, 13 Feb 2025 12:14:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiY5L-0000000Ay8n-2hzh;
	Thu, 13 Feb 2025 12:12:52 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739448770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IkT1HXnvhmnIAy7ak03esG1cDt05Qmm78tFPJg+aYTA=;
	b=nQa5DEVIVciTNLFayb5YHiTTdqSbOXVAXcAnHis9A8bp5C+WaXQMOIMkXcdAMsAjBZdDnb
	A24kTgc0opcSVHVjjJOi5cYdyc0sU6M8D7Ba9JdH2b+L+jpTPKHtt1YCrUZj0KJEVvYjCa
	JR/fm0bGJ30H0OUfwKejyV/bs5vDuiCZD1KGmFODedweYcD5xcYdgYt1K3byL7gXUYT9a/
	BffVs1Kvd1hESQYMAST0JoKvSrEjkMuxB8pVHzneOFLGs2+d09YzC9Q2DmIZvZZA7ZG5Yx
	Tadw7oAGvjS+GOlqNnXCdUxY/3ojA2BQRn5nDt4UtyBRa1v9X27Tvuiu5f+NCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739448770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IkT1HXnvhmnIAy7ak03esG1cDt05Qmm78tFPJg+aYTA=;
	b=EQrHOm5eu4qUbGUFL7thOi2PpaAuHnmB/RxDrvQL4TzjrZ+H2ohXWAWggSJtwHR67CDUl4
	O90uincGPSZMZsBA==
To: Anup Patel <apatel@ventanamicro.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: hpa@zytor.com, Marc Zyngier <maz@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v5 01/11] irqchip/riscv-imsic: Set irq_set_affinity for
 IMSIC base
In-Reply-To: <20250209041655.331470-2-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
 <20250209041655.331470-2-apatel@ventanamicro.com>
Date: Thu, 13 Feb 2025 13:12:49 +0100
Message-ID: <87seoijb5q.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_041251_819140_B5145B10 
X-CRM114-Status: UNSURE (   5.42  )
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

On Sun, Feb 09 2025 at 09:46, Anup Patel wrote:
> From: Andrew Jones <ajones@ventanamicro.com>
>
> Instead of using imsic_irq_set_affinity() for leaf MSI domains,
> use imsic_irq_set_affinity() for the non-leaf IMSIC base domain
> and use irq_chip_set_affinity_parent() for leaf MSI domains.

This clearly lacks an explanation of the purpose/reason of this change.


