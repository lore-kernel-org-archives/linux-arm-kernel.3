Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED88C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqmXBPGiuDVFQYnTa+479tv08C0YiGpazt4o47JVd0w=; b=5Arx0CdjAsk1x1oKnWF9XsqYVZ
	YFfpWXdvx+MghzZCUMHTfdCSPnP2L9iRqUXj3xB4UMZwRbMJI/C+sZo+t/GY2DNjKEJRrxO86kOuP
	SLEL+j6cnV9DCjhm6UCovWKS3GSNmrcLzQ+KNbROoYzb3LJSnpij0j9qIiHsSvFGraJmOhggSfbap
	X8KBhS5oKyNVbhEb7pLhIYjXDq+LW7Zhae8dqABK2mVq7R0mjNFwrOlhQqxBN17DTP/d4scr+VfOL
	vjeQS/KdWqUkX1ukMDd3//YK25C7SAPauqTYvtdloHb34M5N007Txm+CySPKU5DzTDNrRccs3No7k
	pHqQamCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnR5-000000053IY-2ixK;
	Mon, 20 Jan 2025 08:47:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnPm-0000000536w-23mg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 08:45:47 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737362744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MqmXBPGiuDVFQYnTa+479tv08C0YiGpazt4o47JVd0w=;
	b=fhiWiEOxr06FS5991FICyxhEhCyBMQVCXCAJe0a5vSI4STlgIPXzRicBjk0TLQz8jpnArd
	roy7/5waWaUacVY4oi2hhl+JPX/g1bmjdm3WDpim+NgsYRorPHzUhfLSUdDPJqc3upqUNp
	x8HLh1+DNLf1CwQgQbISgvfK9m26AwJKx1b8Wc96KoNaPCTR4vTqNON4WuIAjpXGotARIj
	lpW5L5rMDXHWnJ2ZIVF/rnqNPNx7X3Z1Z4/l1+yleKxlw3uBMFIqbWGplWcj2j/PTly2jl
	aD9R8ugHJqkiSl7+IU5S6nf7jU9zA8VWCCYaasm+mBOAXJP3cEoMqGqJZCdO/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737362744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MqmXBPGiuDVFQYnTa+479tv08C0YiGpazt4o47JVd0w=;
	b=7xUzD//K0xPBS085wgud+OxvOizOJj9bliYwJ+dQdSYPKvSUBFS+wpTXAp/rWH+b/USQqr
	QNgq0zY3XPRWI6Aw==
To: Stefan Eichenberger <eichest@gmail.com>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, shivamurthy.shastri@linutronix.de,
 anna-maria@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] irqchip/irq-mvebu-icu: Fix irq_set_type for sei and nsr
In-Reply-To: <Z4qbioby2DK2Dddl@eichest-laptop>
References: <20241217111623.92625-1-eichest@gmail.com> <87frlkcx2b.ffs@tglx>
 <Z4k-DkMt8XQYs_kf@eichest-laptop> <87tt9ya2qy.ffs@tglx>
 <Z4qbioby2DK2Dddl@eichest-laptop>
Date: Mon, 20 Jan 2025 09:45:43 +0100
Message-ID: <87cyghan60.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_004546_724423_AF041F6E 
X-CRM114-Status: UNSURE (   9.89  )
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

On Fri, Jan 17 2025 at 19:03, Stefan Eichenberger wrote:
> It seems that irq_chip_set_type_parent is not failing. By adding some
> debug messages to kernel/irq/manage.c I found that irqd_get_trigger_type
> returns IRQF_TRIGGER_RISING even though it should return
> IRQF_TRIGGER_HIGH according to the device tree. Maybe this was fixed
> between 6.10 and 6.12 but I need to analyze that again in more detail.

The trigger type is fixed up in mvebu_icu_irq_domain_translate(), but
that should be the same with the new code in mvebu_icu_translate().

Can you instrument mvebu_icu_translate() and validate that it is

    1) Invoked at all

    2) The type fixup is done:

       if (msi_data->subset_data->icu_group == ICU_GRP_SEI)
              *type = IRQ_TYPE_EDGE_RISING;

Thanks,

        tglx

