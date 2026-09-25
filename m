Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644E5C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Htdeexyfqui6yBn8pJU/UKqiEIPQ6aeL2MArnxM27yU=; b=mU7nAKbQI/uwVR1v8TXIkhYPZn
	3+szClD2K7ZxIml+futFgD3k9NPI+jnj0pOiu1Hwxt2eG9tuthaOsQfRXjon0Jq417/8xcVyNJfdm
	CmCeO/HFwNb97qu/afWjGfRjofgvibUCJ0sCpaWUl8bskL+MYZ1xslQ/vvfHlU2TKbfAvQ9rtmcMR
	3brS5SIQJ6TfW84qcIDahmtMCrYHUweKZRvvZPBkFlp3aAHiyoBC4E0UZ7KeKtWAO2JoK0rPMsjRq
	TFxp9joDwK6rxW6f5pwBq6WIq4MpbIRujwL8RThqNAuvY5P6kPEoXHSF9Blpe3VH9kcEzZ23LnS3u
	Lwe383wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2yq-0000000D5ZA-28AD;
	Fri, 25 Sep 2026 10:16:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2yo-0000000D5Yt-3QzT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 10:16:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E41440677;
	Fri, 25 Sep 2026 10:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2723F1F000FF;
	Fri, 25 Sep 2026 10:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790331394;
	bh=Htdeexyfqui6yBn8pJU/UKqiEIPQ6aeL2MArnxM27yU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WZSV2KrVGl3YQXdwQ0GOKP/uUWoB1odeW567eyoQ63pSoEH/KVP8CBuLOD4iLmkhj
	 vHko5XlwfS3mq1Jo5Il+ItolyLS0HPXeQvBXkt8yXolnC9jqWJlojS6fdCZV5ivxqs
	 3uo1KsaEN/fX7vUnVwrO0XmKQ4OwXwof9KzO2fC544tG63jk+3TYYEd6XeWYHTw+hE
	 MeINCKoErVD7xtiMarBSJl3jxUosmP6a/5cUQjCurirMhBEuWPtvEvpZDC/DozU4/6
	 S6B4gtTwIBS8AkyaNQEMvW/YVdXnk2eeO9ZF58oXdaKNc6Tgt4MzbrM3+8o4uBE6xw
	 jl/UPPQL/c55w==
Date: Fri, 25 Sep 2026 12:16:26 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 03/11] driver core: platform: Add static ACPI nodes
 IRQ retrieval/mapping code
Message-ID: <arZJ-jqd1hXqVYgz@red-moon>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-3-2c62125d0085@kernel.org>
 <arZEx0113s0bbkXJ@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arZEx0113s0bbkXJ@ashevche-desk.local>
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

On Fri, Sep 25, 2026 at 12:54:15PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 25, 2026 at 09:48:02AM +0200, Lorenzo Pieralisi wrote:
> > ACPI static fwnodes types are not contemplated in the current
> > 
> > platform_get_irq_affinity()
> > 
> > implementation that is there to retrieve and map IRQs for a device.
> > 
> > Add fwnode_irq_get() to platform_get_irq_affinity() for static ACPI fwnodes
> > to overcome this shortcoming, enabling IRQ retrieval and mapping for the
> > ACPI static fwnode type.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > ---
> 
> Same about the Cc list...
> 
> ...
> 
> > +	if (is_acpi_static_node(fwnode)) {
> > +		ret = fwnode_irq_get(fwnode, num);
> > +		if (ret > 0 || ret == -EPROBE_DEFER)
> > +			goto out;
> > +	}
> 
> This even doesn't sound right. If you know this is an ACPI-only feature what
> the fwnode has all to do with it? Call the respective ACPI-oriented function.

Yes, you are right, it is a last minute change since I noticed that just
calling fwnode_irq_get() without guards would catch previous failures so
it makes sense to do it on specific fwnode type (with is_acpi_static_node()
exported also for !CONFIG_ACPI).

Thanks,
Lorenzo

