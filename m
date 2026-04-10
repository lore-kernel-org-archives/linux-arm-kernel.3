Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6649E99056
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biSMIjMoqI6BSBHbISsyBv693FJEoQDokGFZnddUKkM=; b=CLpTHIqR9nKnVvssx9/ftVstlq
	ty5WQFHIkQX33w9DZNp5JEid22rlU/N425KwJHE9MxACiI5AgzIBbXMCgqGbb605/32py1KekVFY5
	f3gfOD/mUJjwuskKyua+Kjs97HQS+DdxaXm5Lx2KibtMn+DxvNwDaXgUW7AXzp/ZbIk2qnnmhp5XS
	2RanaFPSlGazng/FGP6Uxi3WDbDLVtcxGVBT0xEt44JV0et9eyDRpzUFSOFaphWspz8JLeCp2Pi9r
	SNeiS1vmJv8LEiPc5F6xBWStOr2LabPjXPLYhS36TMh2vuvDEj65iLdhwMYyRchanZQINqjSjRP5I
	UYGtHzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB80r-0000000Btz9-1K8Y;
	Fri, 10 Apr 2026 09:18:53 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB80o-0000000BtyZ-10l9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 09:18:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775812716; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bvjtxWIGOwhhI07XetIdFYhUqGJcYhs1zYmkXxPR+bt1MMUfp+UTmkokPpSVD8koVW9oH7b4KCkzSjskeCO3JLfO8KIbFAXY7WFBPX59CCcBps+t2qMHeKgNL31T1i3BVDDEqDw6rkQWYDv874oVInplMPYPVsEl8eWNoA+UPx8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775812716; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=biSMIjMoqI6BSBHbISsyBv693FJEoQDokGFZnddUKkM=; 
	b=ltX0DBnvVCzideQg/qFRRhLxSZSjYBNSPbh7gM5WtTLsNf/Y2HpNC8D4PZEusaB8yggQtqb8UDuo0j5bpHhV8dz3CaZgFASdyltwVo/tibN3BrFr/eR7DTGvyavl4XHUJoq1nazHACboDTRM50Qa9rSirivlazUpI8hOEZHbyQI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775812716;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=biSMIjMoqI6BSBHbISsyBv693FJEoQDokGFZnddUKkM=;
	b=i+jDGeGgXIRG64OfX53pe45O/Du/c+8L4IPKelfAnF1mBKufshKaE5+OFLuByLT2
	P+tmRSdtqgA4a0J+qXYu5tvRNMVjIBexFpWxqmUYH+dsWeqr65e5rflBFGSktSqN9B0
	c3YP7u98dFywWacjkOYYaUTdZnHeL3uipmEcIgqU=
Received: by mx.zohomail.com with SMTPS id 1775812713638605.1620198428519;
	Fri, 10 Apr 2026 02:18:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 17:18:22 +0800
Message-Id: <DHPD2DBIJNKO.11THXNWNUEEG9@pigmoral.tech>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Maxime Ripard" <mripard@kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: <wens@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
 <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
In-Reply-To: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_021850_627435_FF599040 
X-CRM114-Status: GOOD (  33.76  )
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

Hi ChenYu,
Thanks for your patient review.

On Sat Mar 28, 2026 at 8:37 PM CST, Chen-Yu Tsai wrote:
> On Wed, Jan 21, 2026 at 7:03=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
>>
>> The RTC module in the Allwinner A733 SoC is functionally compatible with
>> the sun6i RTC, but its internal Clock Control Unit (CCU) has significant
>> changes.
>>
>> The A733 supports selecting the oscillator between three frequencies:
>> 19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
>> which frequency is actually used on the board. By defining all three
>> frequencies as fixed-clocks in the device tree, the driver can identify
>> the hardware-detected frequency and expose it to the rest of the system.
>
> No. The board device tree shall have the exact and correct frequency
> defined in the external crystal device node. The operating system can
> use the hardware-detected frequency to "fix" the in-system representation
> if it is off.

Okay, I will keep only one main external crystal in the device tree.

>
>> Additionally, the A733 RTC CCU provides several new DCXO gate clocks for
>> specific modules, including SerDes, HDMI, and UFS.
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 +++++++++++++++=
+++++--
>>  include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
>>  2 files changed, 52 insertions(+), 2 deletions(-)
>>

[...]

>> diff --git a/include/dt-bindings/clock/sun60i-a733-rtc.h b/include/dt-bi=
ndings/clock/sun60i-a733-rtc.h
>> new file mode 100644
>> index 000000000000..8a2b5facad73
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/sun60i-a733-rtc.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
>> +
>> +#ifndef _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
>> +#define _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
>> +
>> +#define CLK_IOSC               0
>> +#define CLK_OSC32K             1
>> +#define CLK_HOSC               2
>
> The DCXO enable control has been present since at least the H6. We just
> never added it, as we would never disable it anyway.

I will remove it.

>
> If you compare the RTC clock trees of the A733 and A523, the only additio=
n
> besides the new gates seems to be the LOSC auto selection. But even that
> is just an illusion, as the A523 has the same registers for that.
>
> One could say the A733 RTC is almost backward compatible to the A523, if
> not for the two fastboot registers the A523 has at 0x120 and 0x124.
>
> So I ask that you try to integrate the differences into the existing
> driver and bindings. You can tweak and export internal clks if you
> need.

Okay, I will try to integrate the A733 RTC support into the existing
driver and bindings.

But first I would like to ask for your advice on how to correctly
organize the device tree binding header for the clocks? I have two ideas
in mind:

1. Add the common internal clocks (e.g., CLK_RTC_32K) to the existing
sun6i-rtc.h. Then, create a new sun60i-a733-rtc.h which includes
the old sun6i-rtc.h and appends the A733-specific clock gates.

2. Simply append all the new A733-specific clock IDs directly to the
bottom of the existing sun6i-rtc.h, sharing the same header file for all
SoCs utilizing this driver.

>
>> +#define CLK_RTC_32K            3
>
> AFAICT besides being an internal clock, this is also fed to GPIO for
> debounce? We probably need to expose this on the A523 as well.
>

I will do it.

>
> Thanks
> ChenYu
>

--=20
Best regards,
Junhui Liu


