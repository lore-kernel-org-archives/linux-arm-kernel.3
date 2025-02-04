Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A465FC0219A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+np3wghDxTYvPM4DJ7Bcv/JvDfMQYeUeUQQTzNPD3A=; b=1LP0RUQXeCLkGTpjTDtVarz5yf
	47+NhKRJv31jdxMB1Texjg1E9sfJfpjZAzeyfLM0ZCwDKm/pgJdwfwOfzmWOJP7Kir2DeR1CEFQM6
	wumstwH4whjT2sZcWPIfIaChm6QJ/XK8w15gli1ugOfvVq2fHqzFzPAJTW2iNWtRtA29T5fZAIF5Y
	5zvfSIhjjYji2eWL96DJvp8XEKlQmpWX+zRA/5gJKEmsUF5K9lHsfKBgzR2W4AN3ai+vEWCNdvlQl
	rGjOpsyUTel+BZElZ1JZSdPaxDjr/IvoCVy+4MsJ64xxQowOOl8xRi79xcWkn00mNYrGOJQL+jBt1
	ehj2ZBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKoX-00000000oHP-1rh3;
	Tue, 04 Feb 2025 15:26:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKj3-00000000njv-185q;
	Tue, 04 Feb 2025 15:20:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738682429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+np3wghDxTYvPM4DJ7Bcv/JvDfMQYeUeUQQTzNPD3A=;
	b=PhnloDKYNBOrZBEe9vEbIX8wdTJMzWPCq9rB3iYhHnl9FFRrKeNxTrKOBpjWlKWGB8W6xb
	R0MGAX/uT5/nGmCn3pxBnubFyDeu5WDKk5kpLj0/4xJ9sS1raOa3AuslhdOIvWrQXPtErr
	tQxrsQ6ksCJ4v2KS7nCQeFBzUrauP+7CjBmtzIw//Sc0kn4MZ3iHwrgp6E7tJcRc+CTP5f
	6kvvz1+6fF1pTuOANHtCH/SwS3oD+xs/q9bgrEcUhilZORvJlD5Dx/jc+R4mKx8+Zgi0SN
	LJVZPshsHOrvPMuz4guozzsqmaU9j8kqm/EUyTKvJPLTvor/FTxbvXs4fDNw+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738682429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+np3wghDxTYvPM4DJ7Bcv/JvDfMQYeUeUQQTzNPD3A=;
	b=rOLEsODCJvNLJOUwg/qKcv7l3HvdSVhKFHYQM9G81quzT2zY0VtGTOwVSSYqSKg2g1lrUr
	gLT6jEyfQOk5+dDQ==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED
 flag for PCI devices
In-Reply-To: <CAK9=C2VgOnSVBRPh+bJBQnGreVYcUh6HWVg1MEzDtfYsuT0s-g@mail.gmail.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-11-apatel@ventanamicro.com> <87o6zinl5o.ffs@tglx>
 <CAK9=C2VgOnSVBRPh+bJBQnGreVYcUh6HWVg1MEzDtfYsuT0s-g@mail.gmail.com>
Date: Tue, 04 Feb 2025 16:20:28 +0100
Message-ID: <87cyfxohxf.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_072033_443536_63C8F47E 
X-CRM114-Status: GOOD (  11.39  )
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

On Tue, Feb 04 2025 at 20:19, Anup Patel wrote:
> On Tue, Feb 4, 2025 at 2:26=E2=80=AFPM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>> The same could be achieved by executing that intermediate transition on
>> CPU0 with interrupts disabled by affining the calling context (thread)
>> to CPU0 or by issuing an IPI on CPU0 and doing it in that context. I
>> looked into that, but that has it's own pile of issues. So at the end
>> moving it in the context of the interrupt on the original CPU/vector
>> turned out to be the simplest way to achieve it.
>
> I got confused because IRQCHIP_MOVE_DEFERRED updates affinity
> with the interrupt masked which I interpreted as masked at the device
> level. Also, PCI MSI mask/unmask is an optional feature of PCI devices
> which I totally missed.

That's the problem this actually handles. If PCI mask/unmask would be
mandatory the problem would not exist in the first place :)


