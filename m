Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B72D7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql35fGoWmgegh8ZPsQLXdMfaQu86bwhRzoWVzlRh+mw=; b=YE1kCdXwaYYn5Vb1SxpuCF1Y3R
	PpOOwE5TY7g81GDfHox8jr8nb2+6zTLW7iMGXS8jvpUV7ejivvpXto0iw4LIuJjQMKHD+BaDt7zKW
	FYRzpo82k0CbmpFzyj82nPePEs0SnxNNtoAW8wEgry1zwDa9eqKy79OlewDF9m4WuBJcDSST4k1Ag
	MeAwI55FKxwUdFAez6RJ307yE36eO6YNi0FlwqJtSgMFA50Knl1hCXam1sHDl5j3gt0mIwVicgKfv
	5ZhrypGsEgXTXYs264wOkqlNkoPKGbra5AHsEtwX0ebkHkXgGTYlpVQMNtgZKvqm93kKcMRw+W1ye
	EyXKt/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWey7-0000000AlFg-14jk;
	Fri, 19 Dec 2025 18:12:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWey4-0000000AlCk-0sMm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:12:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B3421684;
	Fri, 19 Dec 2025 10:12:35 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75E093F7BD;
	Fri, 19 Dec 2025 10:12:40 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	Ahmed.Tiba@arm.com
Subject: Re: [PATCH 03/12] ras: add estatus vendor handling and processing
Date: Fri, 19 Dec 2025 18:11:54 +0000
Message-ID: <20251219181226.2859763-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <euhams5heiuaawxq4e5ty7iijuvwt5gvdx3flsm4npligjeulq@lv3cwekyb2o2>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101244_401707_C92163F0 
X-CRM114-Status: GOOD (  25.98  )
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


On Fri, Dec 19, 2025 at 04:30:40PM +0100, Mauro Carvalho Chehab wrote:
>On Fri, Dec 19, 2025 at 02:49:02PM +0000, Ahmed Tiba wrote:
>>
>> On Wed, Dec 18, 2025 at 05:04:53PM +0100, Mauro Carvalho Chehab wrote:
>>
>> >> Teach the estatus core how to walk CPER records and expose the vendor
>> >> record notification path. This adds the section iteration helpers,
>> >> the logging helpers that mirror the GHES behaviour, and the deferred
>> >> work used to hand vendor GUIDs to interested drivers. No users switch
>> >> over yet; this simply moves the common logic out of GHES so the next
>> >> patches can wire it up.
>> >>
>> >> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
>> >
>> >...
>> >
>> >> +static bool estatus_handle_arm_hw_error(estatus_generic_data *gdata, int sev, bool sync)
>> >
>> > Huh?
>> >
>> > This is a CPER record from GHES. Why are you moving CPER code out
>> > of ghes.c, placing in a file named estatus.c? Doesn't make much
>> > sense on my eyes...
>> >
>> > Same applies to to other GHES CPER record types.
>>
>> GHES still fills in the CPER record, but the parsing and logging logic is
>> shared with the new DeviceTree provider so I pulled those helpers into the
>> estatus core.
>
> I see, but this is not really estatus core. Instead, it is part of GHES CPER
> handling logic, which is defined at ACPI and UEFI specs. moving it to estatus
> sounds odd, at least on my eyes.
> 
> Perhaps I'm failing to see where at ACPI/UEFI specs how CPER would be
> integrated with an OpenFirmware approach to handle CPER without GHES.
> Care to point to the relevant specs, if any?

ACPI/APEI (via GHES) defines how CPER records are discovered and notified on ACPI systems,
but there is no ACPI or UEFI-defined equivalent for OpenFirmware/DeviceTree platforms.
UEFI standardises the CPER record format itself, not the transport or discovery mechanism.

On non-ACPI systems we still receive the same UEFI-defined CPER payload
from firmware, but Linux needs a different, platform-specific contract
to locate and acknowledge it. The DT binding is a Linux-side description
of that contract rather than something defined by ACPI/UEFI.

>> Both providers already call into the same notifier chain and
>> memory-pool helpers; this patch just moves the generic CPER walking routines
>> next to the rest of the common code so the DT path doesn’t have to grow its
>> own copy. If you’d prefer a different file layout or naming to make that
>> intent clearer, I’m happy to adjust.

> Moving the code from ghes.c to estatus.c or to elsewhere shouldn't make any
> difference, as the DT handling logic could simply be calling the functions
> from ghes.c (or estatus.c). I fail to see why they need to be moved.

The motivation is to provide a shared implementation for non-ACPI providers,
so that the DT path does not depend on ACPI/APEI.

While the helpers currently live in ghes.c, they are CPER-specific and do not rely on ACPI tables,
APEI infrastructure, or GHES notification semantics. Keeping them there effectively makes GHES
the only place those helpers can live, even though the logic itself is provider-agnostic.

By moving the CPER parsing and logging pieces into a common location,
both GHES and the DT provider can reuse the same implementation,
while the ACPI-specific discovery and notification code remains under drivers/acpi/apei/.
This avoids having the DT provider reach into GHES internals or duplicate CPER handling code.

If the current naming or file layout makes that separation unclear, I’m happy to adjust it.

Thanks,
Ahmed

