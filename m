Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44733C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoTJIxjM/g1WxUH67XffHodkk6JcBynnDz8cI4nr0gk=; b=WQ1IadCQPukqtwd79Eq+TQHTVb
	XpxzMOY1o7hKhYJr3PXhEc4AIm+dX2gr+L+aaOoHmcpePxtF1suyNehSSwyyliZeD/Kq47pwAJpWB
	uI7y7gEhfwkX2SylnA1yRiQTYAB1VJDdEO5HAD9d5Hk1ZTuz8Bg83m42s1TnkzARlFb3ZVVDXUsQ2
	ChKWN9XoCvLk2uoSxd4gTWqVA7FdWx8KM6KIf6EeBegJWO2fuV4MNUucy47evqltuHeAWe9AWRkRo
	NzarzIXaferdoOsdmDAttKA3rxcw8HQRePz+ZfKqyVSOgOIeFzLVizXBI/58OYNS9/T7fJfq4YZe0
	YMehIeRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMPN-000000028TC-0mhu;
	Mon, 27 Jan 2025 10:31:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMO4-000000028N4-1FdH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 10:30:37 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737973832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SoTJIxjM/g1WxUH67XffHodkk6JcBynnDz8cI4nr0gk=;
	b=Wh70ZcK9IRdaDAMlsqNO9xBeJYA54wYNkoo+R83Svmce05g5PUsT0PiDGjy1V5FrEEaU7t
	ZnLZvfW8y80xLjgXKIry5yKYcjUCGWxiXiVFtoaCoKxZVfrBr62ftYsmPTgguT6lxxGXrW
	aP5B7B+px4R6a1GnfMv2i9V3NdZcW6cKXtiHkv03EgE04Hy5eJZS2LiEomXcya9xzwhdvt
	uPnjemOY18dXufCDUZP71yCuiOgALlgtu+3zAzrxkgf2WI8oYio5WmSYZUS+EwTixHkinm
	nOlIeIHm11iaoPpx7XqjgdjQbqp3g/6HtLzzjIyqiiGnEvN/gtb+dJHzRWmAdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737973832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SoTJIxjM/g1WxUH67XffHodkk6JcBynnDz8cI4nr0gk=;
	b=ryfxDeDynswhIXKIl4gjBhNKbRi9mbPiNQmj0zvSIqXe9mm3CvJ2nYif1Hb28BCLIUDP2u
	5m+ZUL6jkphOIhBw==
To: Stefan Eichenberger <eichest@gmail.com>, andrew@lunn.ch,
 gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
 shivamurthy.shastri@linutronix.de, anna-maria@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] irqchip/irq-mvebu-icu: Fix access to msi_data from
 irq_domain
In-Reply-To: <20250124085140.44792-1-eichest@gmail.com>
References: <20250124085140.44792-1-eichest@gmail.com>
Date: Mon, 27 Jan 2025 11:30:32 +0100
Message-ID: <87sep48s6v.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_023036_477745_9882CAC7 
X-CRM114-Status: GOOD (  10.21  )
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

On Fri, Jan 24 2025 at 09:50, Stefan Eichenberger wrote:
> Previously, we incorrectly cast irq_domain->host_data directly to

Previously 'we' do nothing. The current implementation casts inconrrectly.

> mvebu_icu_msi_data. However, host_data actually stores a structure of
> type msi_domain_info.
>
> This incorrect assumption caused issues such as the thermal sensors of
> the CP110 platform malfunctioning. Specifically, the translation of the
> SEI interrupt to IRQ_TYPE_EDGE_RISING failed, preventing proper
> interrupt handling. The following error was observed:
> genirq: Setting trigger mode 4 for irq 85 failed (irq_chip_set_type_parent+0x0/0x34)
> armada_thermal f2400000.system-controller:thermal-sensor@70: Cannot request threaded IRQ 85
>
> This commit resolves the issue by first casting host_data to

This commit is equally wrong as 'This patch'. See Documentation/process/

> msi_domain_info and then accessing the mvebu_icu_msi_data through
> msi_domain_info->chip_data.

I fixed it up for you.

Thanks,

        tglx

