Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6EDCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuMEMPuykm7rNGqGRgSYCtjd+uJaJUQH41mpXqr8O2w=; b=2Byww+qF3gOSIJYu+5jjK760UK
	bXhwOS2tsaZ+qEKaH4oXxaUVEsj4d1OpQUx8ObUU57LzPdVaBm2tuakZy8k+cmiPQRjoYN+pY+Tn3
	Z1kLeQLSpf1MnTpFgk2+44aVreLVMDZ/9e2emduq3wvLXallMwf2bpDJHClbyryXTABymiByt3Hzu
	fqjCcMXLilh2Qh4vUpQZj81dKEzGUS5uKDoFamoptELwXUxveMkbTgbRNzeXT1hnQQJM9FQnHSExk
	3lYoDbM/pFC9zjJrJ+G7cpMcSXH+N4RRi9oViRpl1Dfncm3JOCzu1Ckgv6k89ETW6eVGSglJpuAVO
	gM8dga4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjYO-00000003zg5-25Am;
	Thu, 11 Sep 2025 15:49:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjYL-00000003zf5-45Np
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:49:43 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757605777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UuMEMPuykm7rNGqGRgSYCtjd+uJaJUQH41mpXqr8O2w=;
	b=Gv/J/Im1CRWyw9bIl8PD4nIFLIoBpCCDS8ViJW4a1/U8I1LoLfawuDNMYSQQJlnOXxL6xn
	OuskPZs1HqkU7fAUh+M5SxMFwGSCzu+glLIkiXNQ9BTxWi41a/3yDUGqqQzW6hvqvGbvxG
	qqnkM3cXBzd2JtesOHC+5f38VhyJIX0E+XXO/TZJ+Y019OxsWqkvmMq1sTaT+J+emzLMSu
	lXyTfsY2TjF8eVgy9PTZjs1z/FVVLvPTwNZve1qcbXRjwIhL7QuK85235FlipsXxtccsCT
	0UahOuRi7w9ZhLffoDRzXhra4do0Uac7YnvaUZnecJLnUSplJHaJ7KH8hv2DMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757605777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UuMEMPuykm7rNGqGRgSYCtjd+uJaJUQH41mpXqr8O2w=;
	b=8EyvGHyLQfWvch9vyXZ0F+oYN8ZCmX7LrZq8smIyrF3OFyBr/PeUHLTanMneSn8D2Sylym
	y8TAWPkIKCXiKnDQ==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Will
 Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob
 Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 01/25] irqdomain: Add firmware info reporting interface
In-Reply-To: <86a531cc1q.wl-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
 <20250908163127.2462948-2-maz@kernel.org> <87ikhsvvau.ffs@tglx>
 <86a531cc1q.wl-maz@kernel.org>
Date: Thu, 11 Sep 2025 17:49:36 +0200
Message-ID: <877by5rnu7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_084942_149308_6CD512BD 
X-CRM114-Status: GOOD (  12.56  )
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

On Thu, Sep 11 2025 at 15:13, Marc Zyngier wrote:

> On Tue, 09 Sep 2025 10:18:01 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> 
>> On Mon, Sep 08 2025 at 17:31, Marc Zyngier wrote:
>
> [...]
>
>> > @@ -69,6 +90,8 @@ void of_phandle_args_to_fwspec(struct device_node *np, const u32 *args,
>> >   * @translate:	Given @fwspec, decode the hardware irq number (@out_hwirq) and
>> >   *		linux irq type value (@out_type). This is a generalised @xlate
>> >   *		(over struct irq_fwspec) and is preferred if provided.
>> > + * @get_info: Given @info, report additional firmware-provided information.
>> > + *            Optional.
>> 
>> get_info() is pretty generic. Can we have some more descriptive name for
>> that? Also please keep the tabular formatting of the doc intact.
>
> Would get_fwspec_info() be descriptive enough?

I think so

