Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB10D29DF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffT9AI1btJrZrHR/GYV1hr1GKpayG/NfIMZfQqrIwpY=; b=aF696NAUtF9bEvM2k77si0RQIJ
	5ntEp1dyMT/Wbcz1h2eBddy/+i5CyoIVjVhRGZvcvXrkH8QuDFZsGEOOIVX8JviOwZ75HTMOE9WS3
	hKINP95mUmPKDjO4ufIPg7lUix2yLoQNohosDPURTn5Rzs1XEwyUGP3PQ2Yt9+ob0NXD4ELaScwsg
	prXyfWjpq1+q5cqmAgrYbj/WJ4W/Za0xofd/BQNNoTyRG4o6KeB9ekJtxW60pIf0ETpa1y91qHZez
	+Bkb+s6W1wwLp2rZ/yhxfOBeZxbYbMNAlTd4HZcamMETqUz1Fk68ZR9xCa6nTQNsBu+WyfeNSheSE
	9afpQslA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaq7-00000006qjh-0KxD;
	Tue, 13 Jan 2026 09:37:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaq5-00000006qjb-2REM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:37:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA53E60055;
	Tue, 13 Jan 2026 09:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854ABC2BC86;
	Tue, 13 Jan 2026 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768297044;
	bh=MQpO1he/TA2OH7HM+Qp6ShsyJLTSwamdYNi4C0k7rmQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oANqp7GffSJApYVClv+vGIE3m7dVxTrPczfQFtJDDYC7lx2Y+9H0ZtJomWFkZo7qM
	 4LKVu8r3th0VU6hTHMrYhLx4x64X9VSV6L5N3b3RFNUpmJG8zFZvQ4/K9MLcYUOtIP
	 nAas/yVakBU4LcSlcxYHYOo0uv/tQssuFJK0EEiBsifHhQwisr+eEOYdBrZDtyBjLl
	 sGefnbwi/9tpKzHaZylzmP3s3C8CbGCOIZW+Q8OG+LMpqbLUJVn/XOrMYnwCoKMluv
	 1eX9d2PP3XQEkN1yTIUiajXuWETT+5uKrJ1Zk0YeXSotW83kzu8riuMoLpqhi3CS0j
	 tFB7wndU8JvYg==
From: Thomas Gleixner <tglx@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 3/7] irqdomain: Add parent field to struct irqchip_fwid
In-Reply-To: <aV6Yi+N+lCEekshX@lpieralisi>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
 <20251218-gicv5-host-acpi-v2-3-eec76cd1d40b@kernel.org>
 <20260105120108.00002016@huawei.com> <aV4gH/yHaOmOtK0J@lpieralisi>
 <20260107100452.00004b6f@huawei.com> <aV6Yi+N+lCEekshX@lpieralisi>
Date: Tue, 13 Jan 2026 10:37:20 +0100
Message-ID: <87sec9etv3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Jan 07 2026 at 18:31, Lorenzo Pieralisi wrote:
> On Wed, Jan 07, 2026 at 10:04:52AM +0000, Jonathan Cameron wrote:
>> Agreed. Let's see what Thomas prefers (i.e. make the decision his problem ;)
>
> Thomas do you have any preference on the matter please ? It is not a big deal
> either way I'd just like to respin promptly (provided the rest of the series
> does not require further changes other than the ones Jon suggested and I
> addressed) if possible please.

Hiding the NULL parameters in helpers is perfectly fine. I agree with
Jonathan to make the name of the new helper more intuitive, but other
than that this looks sane.

Thanks,

        tglx

