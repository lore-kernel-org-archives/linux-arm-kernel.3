Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DF3C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SaClx0Ad34mtg+r133Gl0Gu/isNenRm9UPRsEduuII=; b=mqaMeW9UKI2UYO6rO6lTC3bBHS
	ZEW/7C90jNRpf8IUj9K1VzY5zfu3+1q5b226O17tmix7h5/Li1xyfePihoqx02AYuTNd53S25eQbX
	xM5FLasNvph/cXUm/DPL/QxhAMx7kX8WEU7oHIDCmt+ZBa5UP00IE+0+etAtULYjVqCBlUcYGXndd
	YSDzB4LZH8nvWomHjrDnAjt0Gd7DapGpOaQJ0kOZr6C0QcPmp+kmV76f/CMpbHAnf9GT0wVxapzK9
	BYxNk83AKp5RVGuyMGhPNAWnIiLN151stdRvIittVYtTmD9pUoBjY9/HrcR+MQpF+Zk7V2Ob+8yUZ
	5P9ssuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyZz-0000000B3lA-45Pc;
	Wed, 15 Jan 2025 08:16:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyYg-0000000B3P0-3cjQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:15:28 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736928925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4SaClx0Ad34mtg+r133Gl0Gu/isNenRm9UPRsEduuII=;
	b=sYstNEf/fG6QfvAFHzEhJ2v/b7VSYMpWICwhx8qDamL4DT4wZ0mgQmgK0riWlK3LngSJud
	aP45QNx86f2vDBeWB9nXnucDcom/oIJBQM95bvJmmuY/jvZ2hGC6Gei20/E9W6ShaXqS6o
	JIFsA8oZTQQTGs7+cWqyUQiGJq6LClnh6e8LQvAGjmO53WHFIRdY87OSf3VsNMLG8W6w+Q
	PJtPp4dXcH94JJ9Di8txHXBxS7SpNOTS+iK2e4moJrVe6HiIk865Bh2y1wGlBTGJwL+gQ9
	eVS1oL0n9hhlTZq4h8cq6Fdc5TfI5yuJsmlBTnSkqbnM5CazX0o1mrfuUflFHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736928925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4SaClx0Ad34mtg+r133Gl0Gu/isNenRm9UPRsEduuII=;
	b=etpI9xiRyt4WGHiDMPLj3zeuITZDEjzURFCYZM8dBW1GEdcLbbvo72RNc/ezdATrNocHXC
	jVyvvrJNM+ykoyCg==
To: Stefan Eichenberger <eichest@gmail.com>, andrew@lunn.ch,
 gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
 shivamurthy.shastri@linutronix.de, anna-maria@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] irqchip/irq-mvebu-icu: Fix irq_set_type for sei and nsr
In-Reply-To: <20241217111623.92625-1-eichest@gmail.com>
References: <20241217111623.92625-1-eichest@gmail.com>
Date: Wed, 15 Jan 2025 09:15:24 +0100
Message-ID: <87frlkcx2b.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_001527_074505_A4E52447 
X-CRM114-Status: GOOD (  16.91  )
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

On Tue, Dec 17 2024 at 12:15, Stefan Eichenberger wrote:
> A regression was introduced in commit d929e4db22b6
> ("irqchip/irq-mvebu-icu: Prepare for real per device MSI") that causes
> the Armada thermal driver to fail during probe with the following error:
> genirq: Setting trigger mode 4 for irq 85 failed (irq_chip_set_type_parent+0x0/0x34)
> armada_thermal f2400000.system-controller:thermal-sensor@70: Cannot request threaded IRQ 85
> armada_thermal f2400000.system-controller:thermal-sensor@70: probe with driver armada_thermal failed with error -22
>
> The issue occurs because irq_set_type is assigned to
> irq_chip_set_type_parent, but the parent IRQ chip does not implement the
> irq_set_type operation. This causes the trigger mode configuration to
> fail.
>
> This patch resolves the issue by removing the irq_set_type assignment.
> With no irq_set_type, __irq_set_trigger safely skips the trigger
> configuration, restoring functionality to the thermal driver.

I'm not convinced that this is correct.

The original code had irq_chip_set_type_parent() for the NSR/SEI chips
too and all what d929e4db22b6 does is to convert those chips over to the
new platform MSI mechanism. Here are the original chips:

static struct irq_chip mvebu_icu_nsr_chip = {
	.name			= "ICU-NSR",
        ...
	.irq_set_type		= irq_chip_set_type_parent,
        ...
};

static struct irq_chip mvebu_icu_sei_chip = {
	.name			= "ICU-SEI",
        ...
	.irq_set_type		= irq_chip_set_type_parent,
        ...
};

And looking at the potential platform MSI providers for MVEBU, then it
turns out that GICP and SEI both have the irq_set_type() callback
populated, though ODMI has not. So either this has never worked or there
is something else fishy.

Can you please enable CONFIG_GENERIC_IRQ_DEBUGFS, build/boot a 6.10
kernel and provide the output of

cat /sys/kernel/debug/irq/irq/$N

where $N is the interrupt number of the thermal sensor.

Then provide the same information for a current kernel with your patch
applied.

Thanks,

        tglx

