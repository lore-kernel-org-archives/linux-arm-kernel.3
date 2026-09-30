Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE20CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xL6M0dr5FX7bEZLB4pEnUkdcIL4YjSX8nLQPwIT5Zzo=; b=bGWHjTZvnPzDmVBkrh0AoBgc7n
	cJ62v6QQVPbg0aSh4K6cUdNafhcMirVZd/vVYxUqKGJagHtA0T9gXdknizqfwMv5//ulc+J+ih6vR
	QY1G0rmRJ6M+md0NtIwhvQ4NGtNrUgkPjVNWDJq5DLy8kBhsrdaW4mpbLUq4pJHxrZRKSmgvXPSgF
	mawGc7eWPvpKW7K6o3u2ECuIXoMZDCBAQtQxPAheJzTD6GhPhFXWsS8oLuRWmqFiZv3XOfRn9tQx7
	jwtLAj2S6jxwxJNYg1R1gxHk2rDNCYP/ABxfJy8yL5oFvXnTOE0I8KqBP6bQKRhktcoQHOImGzrrX
	hfa/Nx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpB5-00000005MG2-0i7l;
	Wed, 30 Sep 2026 07:56:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpB3-00000005MFi-23nd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:56:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3347602BE;
	Wed, 30 Sep 2026 07:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4728B1F000FF;
	Wed, 30 Sep 2026 07:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754992;
	bh=xL6M0dr5FX7bEZLB4pEnUkdcIL4YjSX8nLQPwIT5Zzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i89SYrP8uoUOW63arVdATXVuZH9y+kHuAUwU2N0UGVY94DWwNd2K7x/EKMapEQVv2
	 IS3kZU8IQdtUbPMdMBwhZM6iXY4jKf0Fjfr+CLnKACgkbMqTegribBZxPXuGqW37SI
	 V7Dy6PcWs6l1EKldjWnXwAcyB2uHLXgdmhUpIZDmeZ6RDMNVivQTbewanLOKGj0/Nw
	 YZTyMxUhi5R0AW5hS+q9NUt6pU5Y9GQYUthgafm93QVh4LLtAMf0aoQJcmj+Qh7TKt
	 A4xvaRF2ROzvt2xapbNlc1Xwjz+inDZ42dlbHzdFa5OS8rzLPfLvFJZ4lflr1SMC2F
	 LPpBIT4uCLTBQ==
Date: Wed, 30 Sep 2026 09:56:24 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ashok Raj <ashok.raj@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
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
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
Message-ID: <arzAqMOmSVl_PzH5@red-moon>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arr3IhF0bwN4uzUP@hu-ashoraj-lv.qualcomm.com>
 <art5m5QPXAOAvkvW@red-moon>
 <arxZ7BAya5ntRi6t@hu-ashoraj-lv.qualcomm.com>
 <ary9AGmVWDuez7Ax@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ary9AGmVWDuez7Ax@ashevche-desk.local>
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

On Wed, Sep 30, 2026 at 10:40:48AM +0300, Andy Shevchenko wrote:
> On Tue, Sep 29, 2026 at 05:38:04PM -0700, Ashok Raj wrote:
> > On Tue, Sep 29, 2026 at 10:40:59AM +0200, Lorenzo Pieralisi wrote:
> > > On Mon, Sep 28, 2026 at 04:24:18PM -0700, Ashok Raj wrote:
> > > > On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:
> 
> ...
> 
> > > > > +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_POLARITY,
> > > > > +						index, &polarity);
> > 
> > For each of the above calls for read_u32_prop_index() the allocation,
> > copy a value and does free it. 
> > 
> > Instead you could read the whole array, and just get each value and
> > discard it once? 
> 
> This was my question as well. But I formulated it differently.

Same answer (and actually two properties are enough), yes that should
be done, if using software nodes is the way to go, which does not
look like, that's the whole reason behind this series, understanding
where to stash GSI numbers, flags and names. It is a working proof
of concept to get this debated and resolved, hopefully next week at LPC.

Thanks,
Lorenzo

