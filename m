Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B49FE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRhyUwZgEeFyrqEntRW9BWPqQ36kKdqGhKBGSJTuE14=; b=xHi6E409q/FlXs2unsnHXweN68
	Di/RsU3sdHUm7oOmopEQkBRwCp0BFqpDMndY/iUNv0AU2Mc+0ssAoNvmvBCCmikL787AAQBJf5sUR
	Kd3W7tfGGROPSthhUr+h+mAiMUsQIk2Uo1+MUUjZakZPLdviyHgiZ63Lpg5tDkzCpLnankZMtPuKj
	UNdVrTtxLzviBcP0CZh0E/oYi36riZ77/YIuXL7ozbc1i4vVbn4OyGbFHCSR0LhF7AYekXROnc8sO
	ZU/c6hAyLIlz9xUhOeNa6WnAUKlLFyxD/dMu643OnTw23c+uZd0xwsqA2Wkr5aBRWhtuQ4C4ki/0/
	CFqwkIVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEli-00000003oWF-25C5;
	Mon, 29 Dec 2025 15:02:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaElf-00000003oVH-3iDR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 15:02:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB8E4339;
	Mon, 29 Dec 2025 07:02:34 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3A823F5A1;
	Mon, 29 Dec 2025 07:02:39 -0800 (PST)
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
	linux-efi@vger.kernel.org,
	Ahmed.Tiba@arm.com
Subject: Re: [PATCH 03/12] ras: add estatus vendor handling and processing
Date: Mon, 29 Dec 2025 15:01:21 +0000
Message-ID: <20251229150234.2789600-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222091334.5cb8465f@foz.lan>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_070244_027633_4FCFB597 
X-CRM114-Status: GOOD (  42.24  )
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

On Mon, Dec 22, 2025 at 09:13:34 +0100, Mauro Carvalho Chehab wrote:
>Em Fri, 19 Dec 2025 18:11:54 +0000
>Ahmed Tiba <ahmed.tiba@arm.com> escreveu:
>
>> On Fri, Dec 19, 2025 at 04:30:40PM +0100, Mauro Carvalho Chehab wrote:
>> >On Fri, Dec 19, 2025 at 02:49:02PM +0000, Ahmed Tiba wrote: 
>> >>
>> >> On Wed, Dec 18, 2025 at 05:04:53PM +0100, Mauro Carvalho Chehab wrote:
>> >> 
>> >> >> Teach the estatus core how to walk CPER records and expose the vendor
>> >> >> record notification path. This adds the section iteration helpers,
>> >> >> the logging helpers that mirror the GHES behaviour, and the deferred
>> >> >> work used to hand vendor GUIDs to interested drivers. No users switch
>> >> >> over yet; this simply moves the common logic out of GHES so the next
>> >> >> patches can wire it up.
>> >> >>
>> >> >> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com> 
>> >> >
>> >> >...
>> >> > 
>> >> >> +static bool estatus_handle_arm_hw_error(estatus_generic_data *gdata, int sev, bool sync) 
>> >> >
>> >> > Huh?
>> >> >
>> >> > This is a CPER record from GHES. Why are you moving CPER code out
>> >> > of ghes.c, placing in a file named estatus.c? Doesn't make much
>> >> > sense on my eyes...
>> >> >
>> >> > Same applies to to other GHES CPER record types. 
>> >>
>> >> GHES still fills in the CPER record, but the parsing and logging logic is
>> >> shared with the new DeviceTree provider so I pulled those helpers into the
>> >> estatus core. 
>> >
>> > I see, but this is not really estatus core. Instead, it is part of GHES CPER
>> > handling logic, which is defined at ACPI and UEFI specs. moving it to estatus
>> > sounds odd, at least on my eyes.
>> >
>> > Perhaps I'm failing to see where at ACPI/UEFI specs how CPER would be
>> > integrated with an OpenFirmware approach to handle CPER without GHES.
>> > Care to point to the relevant specs, if any? 
>>
>> ACPI/APEI (via GHES) defines how CPER records are discovered and notified on ACPI systems,
>> but there is no ACPI or UEFI-defined equivalent for OpenFirmware/DeviceTree platforms.
>> UEFI standardises the CPER record format itself, not the transport or discovery mechanism.
>>
>> On non-ACPI systems we still receive the same UEFI-defined CPER payload
>> from firmware, but Linux needs a different, platform-specific contract
>> to locate and acknowledge it. The DT binding is a Linux-side description
>> of that contract rather than something defined by ACPI/UEFI.
>
> That's where I'm failing to understand: CPER is part of UEFI spec, and
> the only deliverable mechanism I'm aware of for CPER is via GHES or
> GHESv2 - e.g. via ACPI.
>
> Within the scope of https://uefi.org/specifications, I'm failing
> to see any other deliverable mechanism.

Right, the UEFI specs only describe the GHES/ACPI path. There isn’t
a spec-defined transport for firmware-first CPER delivery outside ACPI/GHES,
which is why patch 9/12 describes a Linux-side DT contract
for exposing the CPER status buffer and notification path.
If there’s a better place to document or name that DT transport, I’d appreciate pointers.

>> >> Both providers already call into the same notifier chain and
>> >> memory-pool helpers; this patch just moves the generic CPER walking routines
>> >> next to the rest of the common code so the DT path doesn’t have to grow its
>> >> own copy. If you’d prefer a different file layout or naming to make that
>> >> intent clearer, I’m happy to adjust. 
>>
>> > Moving the code from ghes.c to estatus.c or to elsewhere shouldn't make any
>> > difference, as the DT handling logic could simply be calling the functions
>> > from ghes.c (or estatus.c). I fail to see why they need to be moved. 
>>
>> The motivation is to provide a shared implementation for non-ACPI providers,
>> so that the DT path does not depend on ACPI/APEI.
>>
>> While the helpers currently live in ghes.c, they are CPER-specific and do not rely on ACPI tables,
>> APEI infrastructure, or GHES notification semantics. Keeping them there effectively makes GHES
>> the only place those helpers can live, even though the logic itself is provider-agnostic.
>
> The logic is related to GHES, as this seems to be the only standardized
> mechanism to report CPER records. As it is part of APEI, get_maintainers
> points to the people that have been maintaining it as:
>
>        $ ./scripts/get_maintainer.pl -f ./drivers/acpi/apei/ghes.c
>        "Rafael J. Wysocki" <rafael@kernel.org> (maintainer:ACPI APEI,commit_signer:6/13=46%)
>        Tony Luck <tony.luck@intel.com> (reviewer:ACPI APEI,commit_signer:3/13=23%)
>        Borislav Petkov <bp@alien8.de> (reviewer:ACPI APEI,removed_lines:5/62=8%)
>        Hanjun Guo <guohanjun@huawei.com> (reviewer:ACPI APEI,commit_signer:4/13=31%)
>        Mauro Carvalho Chehab <mchehab@kernel.org> (reviewer:ACPI APEI,authored:1/13=8%,removed_lines:6/62=10%)
>        Shuai Xue <xueshuai@linux.alibaba.com> (reviewer:ACPI APEI,commit_signer:5/13=38%,authored:2/13=15%,added_lines:56/218=26%,removed_lines:34/62=55%)
>        Len Brown <lenb@kernel.org> (reviewer:ACPI)
>        Jonathan Cameron <Jonathan.Cameron@huawei.com> (commit_signer:5/13=38%)
>        Breno Leitao <leitao@debian.org> (authored:2/13=15%,added_lines:38/218=17%)
>        Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com> (authored:2/13=15%,added_lines:103/218=47%)
>        Ankit Agrawal <ankita@nvidia.com> (authored:1/13=8%,removed_lines:6/62=10%)
>        Jason Tian <jason@os.amperecomputing.com> (removed_lines:7/62=11%)
>        linux-acpi@vger.kernel.org (open list:ACPI APEI)
>        linux-kernel@vger.kernel.org (open list)
>
> Moving it elsewhere would make it confusing, as the expected deliverable
> mechanism for CPER is via GHES - as this is the only one defined at the
> uefi.org specs.
>
> While it might be moved to EFI and placed under cper.c,
> get_maintainers.pl would point to:
>
>        $ ./scripts/get_maintainer.pl -f ./drivers/firmware/efi/cper.c
>        Ard Biesheuvel <ardb@kernel.org> (maintainer:EXTENSIBLE FIRMWARE INTERFACE (EFI))
>        linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI))
>        linux-kernel@vger.kernel.org (open list)
>
> which is not the people that have been maintaining RAS.
>
> Placing it under a "estatus.c" file would make it completely
> dissociated with UEFI/ACPI specs, as this name means nothing at
> the specs.
>
> Also, adding a new maintainer's entry won't make any sense, as the
> people that currently reviews and maintains GHES/CPER records
> should be kept.

You’re right that per UEFI/ACPI, GHES is the only standardised delivery path.
My goal isn’t to redefine that; it’s to avoid duplicating the CPER parsing/logging
code for non-ACPI platforms. I’m happy to restructure the helpers however you
think best so we keep the existing ACPI/APEI maintainer model intact.

>> By moving the CPER parsing and logging pieces into a common location,
>> both GHES and the DT provider can reuse the same implementation,
>> while the ACPI-specific discovery and notification code remains under drivers/acpi/apei/.
>> This avoids having the DT provider reach into GHES internals or duplicate CPER handling code.
>
> As Boris mentioned on patch 00/12, we need to better understand
> the high level scenario, as it is still not clear to me how a
> firmware-first notification would happen without ACPI.

That scenario is a firmware-first platform where firmware still produces a UEFI
CPER Generic Error Status block but signals Linux via the DT-described transport.
Once the buffer is available, the provider feeds it into the same estatus decoding path as GHES.

>> If the current naming or file layout makes that separation unclear, I’m happy to adjust it.

Thanks,
Ahmed

