Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6407E7316A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKjh/dGfqXvJnPMfjfG2oA+Fh/6tItlZ/M9uol9KUZo=; b=ED5+x1g0Wy7Xi3AFOnpKgOY9c0
	tT7Ju85b/Uy//M28sfZMpO5A+KwmuLeTMnCR4SvXsbX/IKWKYXq7xuoxWqDEbJtoUHbpR+d0mEyii
	KY09u5AOgCKTmi6xg+phFmBUvKT0rxSLzW8VcePtNz9WChEaw/GtNUZFQ3Xu+SnliY/T87NWcDc5A
	jHbyYdUvmNmQh6ScX86VEJiw8i6DI4rf+n/6RwQunn0An5R21rfyBUmYXmP6WqHJr/olWhiAS3rct
	falwuFQ1r7spUBNUiQApwtqQAmxBHfxA/J7piZr6XvcSmBGCa0RDge3K8jWH0SpnWdQ31BJ7O8J21
	eViKgpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtsW-000000050K4-0uwO;
	Mon, 02 Feb 2026 13:22:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtsT-000000050JW-1FwV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=IKjh/dGfqXvJnPMfjfG2oA+Fh/6tItlZ/M9uol9KUZo=; b=F4
	pbd56hm1nF3JsEosjN492dwuOR/KsYByigEMqbqClTnfCZxukQnMp7Vro/WIkMVyw//cNUf9UxzTd
	qCotNG+K6zIT4i22ybfFtYxxQUPpuTDQQiy8F1mdFyunXdTOznISJ4Y3ra2VUSLEUWoHy0fY5kZmo
	5yUG3BrLeV2KZ7Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vmtsE-005pJo-W9; Mon, 02 Feb 2026 14:21:51 +0100
Date: Mon, 2 Feb 2026 14:21:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/6] i2c: xiic: skip input clock setup on non-OF
 systems
Message-ID: <8be34da2-bf0e-47a0-bf91-3329ed0ec8ab@lunn.ch>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
 <20260129-i2c-xiic-v7-1-727e434897ef@nexthop.ai>
 <ab9dc191-59c1-40a9-bbf1-e6c082af128a@lunn.ch>
 <2428D892-89F9-4013-9681-AD9BD76B0874@nexthop.ai>
 <aX3VqGlIUGCvMY5p@smile.fi.intel.com>
 <CAGYn4vxRbPVFvzm1b_mk2KvnRcJSO0Ewmx1tCTEALaZAu+ZQJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGYn4vxRbPVFvzm1b_mk2KvnRcJSO0Ewmx1tCTEALaZAu+ZQJQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_052205_344536_7D80FE75 
X-CRM114-Status: GOOD (  24.68  )
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

On Sat, Jan 31, 2026 at 08:30:40PM -0500, Abdurrahman Hussain wrote:
> On Sat Jan 31, 2026 at 10:12 AM UTC, Andy Shevchenko wrote:
> > On Thu, Jan 29, 2026 at 03:29:45PM -0800, Abdurrahman Hussain wrote:
> >> > On Jan 29, 2026, at 2:43 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> >> > On Thu, Jan 29, 2026 at 09:43:13PM +0000, Abdurrahman Hussain via B4 Relay wrote:
> >
> >> >> The xiic driver supports operation without explicit clock configuration
> >> >> when clocks cannot be specified via firmware, such as on ACPI-based
> >> >> systems.
> >> >
> >> > Are you saying it is technically impossible to specify a clock in
> >> > ACPI?
> >> >
> >> > Maybe a more accurate would be:
> >> >
> >> > The xiic driver supports operation without explicit clock
> >> > configuration when the clocks are not specified via firmware, such as
> >> > when the ACPI tables are missing the description of the clocks.
> >>
> >> Actually, ACPI (since 6.5) added a ClockInput() macro that can be added to
> >> _CRS of a device node. The ACPI subsystem in kernel could parse these and
> >> convert into proper clocks integrated with the CCF. But, AFAIK, this idea was
> >> rejected in the past.
> >
> > Rejected by which side? CCF?
> > Because specification still has that.
> 
> I think the argument was that on ACPI based systems clocks are "owned"
> by AML and there could be syncronizations issuebetween AML and the OS.
> 
> See https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1712165.html

Doesn't that just mean there needs to be a call into AML to request it
take an action on a clock? Otherwise, why even have ClockInput()? This
link is to quite an old thread, 2018, where as ClockInput seems to be
pretty new.

The fact ClockInput() exists, means at some point somebody will
implement it. Once it has been implemented, somebody might need to use
it with xiic? Because it is mandatory in DT, and there is no ACPI
binding document for xiic, they could make it mandatory in ACPI as
well. And then your device breaks.

By putting in the commit message something like:

Currently Linux does not implement ACPI ClockInput to describe clock
resources, unlike DT. However the xiic driver is happy if something
magically enables the clock before the driver probes, and does not
turn it off again. The clock should always be considered optional for
ACPI.

That should act has a hint to future developers hacking on xiic not to
make it mandatory.

     Andrew



