Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C50CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksRwsZduIIB6SyG2nFNgDOhkTcDdI1Vxdkt4BX+vx3c=; b=cp7iy+n7PrzVs7Pbc/AYdL6usd
	hv1DQ6B4iuyOgrpjkW3Evpx0Kjblu6axkNmhTiVRjqESr+NMIWPZ6SqPhZ7v2z0MLUnEyhLDzYJto
	BOaAzg3izD9k8PoZppqYk7uQaTgqhO54lzE5/n1siBHmcQGB3LQZDp/EHvk7hInPxTgEXpHTNUjKr
	L+++XgA3jpr2fY7JjCnguzKSH2NIpBpHwQvTJef2s3sJx1bUtCHsxfm0Oh+l1B85JlsgiNQmU0cTu
	G1PTBgLMgPOO7oA/SW+vLbBfD590qLTOL6kFk1C4nYJiJpQ+zbctbesKhdtCz+qz3pDgxuVbQmWbS
	js9uB+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBOO-0000000EgIE-1JJq;
	Mon, 15 Jun 2026 17:46:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBOL-0000000EgHN-1r7S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:46:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45ef616daf6so4142437f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781545591; x=1782150391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksRwsZduIIB6SyG2nFNgDOhkTcDdI1Vxdkt4BX+vx3c=;
        b=SvBo+/NaH+3St8jRmM3qaFfMIZgXMzsBOlVdrDoIyD8lkrPDjY0h/cnBFM/CM5r9t7
         bBup2kEySCF4QgBZvZeGM95Gi3/aJV5bzFcq+HOgZap5ApqRzxCdiyii08eMi9TszJz3
         Hyo/MyMOCvATzaSHPisxPuWoFf40rp6npHjxqAoWsCsxT9Sf8lMyll6udghfvv2rwiYJ
         LJ74Rw+cd/TDnAI+25pDeAFSlh5dxGSSc7XNLityj74ISRcwTbijvJi8HWRh7lpynqzH
         HBkz619IKJj0qcvRQ7aIGHB5T3IU/7sFoo17JZjOBZEjiFczikIvuy1pdo2at7S7tG6H
         oQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545591; x=1782150391;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksRwsZduIIB6SyG2nFNgDOhkTcDdI1Vxdkt4BX+vx3c=;
        b=fcJCZQVLp5Z0QRFKhTusFBbaJc5/OTT04Txonw/cMZQJdjMGfB2iezykEangJMRUrF
         yOlRQ61y1cYg2HX6WgBozH17LlnooY8Vqwxn+K//kWvErkV5J8ARekbpFpG7Xvdwdp6x
         +P9Lzr4Fp7dDdw41lT7LiOIxssvgmciH85z4XJiSfcnk2NURVJ315tBYmJYCRFAkQLGG
         yBC8k4Uyw4cRmnq7Lm5wIVPs+a3fD8CyB3S45DtwEEvBfEL9Td3OXvT/og9Lqt4Pv1iq
         GGw0Z7e9o9YgwcGUlXPcRbF4Goe75KtMxx6QlqMB16eHSdJ2/ELaFdWRmQvhcvnSlYLQ
         ptFQ==
X-Forwarded-Encrypted: i=1; AFNElJ97z0gXnRd9+Qfv3rGtNcJ0HIJ6DY3FScWkH6MvlyziENw4b/hHLMqhYuIwS1rCuA5xzzDpn3oR5HzhdIbfxANR@lists.infradead.org
X-Gm-Message-State: AOJu0YzBkZCkb6uWcz0t/ZJN0HfOfSiRse7RWUGvXdnzOUoahpCpyT8Y
	O0SdI1Gn9RYmlmBapTZtyRNQUhk+4OgeWfBQ/3beUBQmxgLRFykKMp/b9+32qq4u4Jo=
X-Gm-Gg: Acq92OHeErFH1XCppNHktJEqhauK3V0ycLNUiFZ6Ha4rOnbei01PLE0em1WrybmlSgp
	Ty8DWm3c99TolDzkMt6FIFaLcxZ26xyB7Sy9CeS12fznG1ZwSOSyVXoq+KvV3xF/Xhype8G1YiO
	bu5qEZlMAT6m9ItlHxeDot5XxBmIdr2h4U0xM/8u2n/9pA7mF9hoyvJFtKuuKLZMjjiWLw9FdnG
	uSDKnPZM3FF49kpOE0oDjDSIYirkzSq5j/GUYLXcfpvJi8e1ToO2CzhHLy9LVzdiGtAXsLNIcHc
	B/xog69mwB9w5Z9EIiDN0wHbnr/WzF1vjZgZnd/gdArvt6V0kUhJqfk40boSKHNLzsQHG8m6nDm
	YDECsJdhStxR0BgTPW5ebNKLEyP4+h8Cj0oBHbyWcCiBQS3SYLtpWq8XPWU3nXsozekskdVmqDg
	cekvbmb0Back1zziGEzSurEA==
X-Received: by 2002:a05:600c:638f:b0:490:9df1:f0cf with SMTP id 5b1f17b1804b1-4922ff8eeaemr3741655e9.2.1781545591514;
        Mon, 15 Jun 2026 10:46:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5176:ebe3:853b:8fb0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4922fa3a8e4sm12251795e9.3.2026.06.15.10.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:46:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-rtc@vger.kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
In-Reply-To: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 28 Mar 2026 20:37:26 +0800")
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
	<20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
	<CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Jun 2026 19:46:29 +0200
Message-ID: <1j1pe7elxm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_104633_523616_7621DA00 
X-CRM114-Status: GOOD (  38.10  )
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

On sam. 28 mars 2026 at 20:37, Chen-Yu Tsai <wens@kernel.org> wrote:

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
>> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-r=
tc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> index 9df5cdb6f63f..b18431955783 100644
>> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> @@ -26,6 +26,7 @@ properties:
>>            - allwinner,sun50i-h6-rtc
>>            - allwinner,sun50i-h616-rtc
>>            - allwinner,sun50i-r329-rtc
>> +          - allwinner,sun60i-a733-rtc
>>        - items:
>>            - const: allwinner,sun50i-a64-rtc
>>            - const: allwinner,sun8i-h3-rtc
>> @@ -46,11 +47,11 @@ properties:
>>
>>    clocks:
>>      minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>
>>    clock-names:
>>      minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>
>>    clock-output-names:
>>      minItems: 1
>> @@ -156,6 +157,38 @@ allOf:
>>          - clocks
>>          - clock-names
>>
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: allwinner,sun60i-a733-rtc
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +          items:
>> +            - description: Bus clock for register access
>
>> +            - description: 19.2 MHz oscillator
>> +            - description: 24 MHz oscillator
>> +            - description: 26 MHz oscillator
>
> No. There is only one input. As in there is only one set of pins for the
> DCXO. The inputs are the same as on R329 / A523. Just use that list.
>
>> +            - description: AHB parent for internal SPI clock
>> +            - description: External 32768 Hz oscillator
>> +
>> +        clock-names:
>> +          minItems: 5
>> +          items:
>> +            - const: bus
>> +            - const: osc19M
>> +            - const: osc24M
>> +            - const: osc26M
>> +            - const: ahb
>> +            - const: ext-osc32k
>> +
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +
>>    - if:
>>        properties:
>>          compatible:
>> @@ -164,6 +197,7 @@ allOf:
>>                - allwinner,sun8i-r40-rtc
>>                - allwinner,sun50i-h616-rtc
>>                - allwinner,sun50i-r329-rtc
>> +              - allwinner,sun60i-a733-rtc
>>
>>      then:
>>        properties:
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
>
> If you compare the RTC clock trees of the A733 and A523, the only addition
> besides the new gates seems to be the LOSC auto selection. But even that
> is just an illusion, as the A523 has the same registers for that.
>
> One could say the A733 RTC is almost backward compatible to the A523, if
> not for the two fastboot registers the A523 has at 0x120 and 0x124.
>
> So I ask that you try to integrate the differences into the existing
> driver and bindings. You can tweak and export internal clks if you
> need.

I'd like to help with that. I think it is doable but I have a question
regarding the binding of the existing driver, more precisely their usage
here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/clk/sunxi-ng/ccu-sun6i-rtc.c?h=3Dv7.1#n370

Clock indexes are supposed to be stable in DT (AFAIK) but with the code
linked the external 32k is at:

* "ext-32k" - so index 3 - if "clock-names" is present
* index 0 if clock names is not present

... but index 0 is supposed to be the bus clock according the binding
doc, whether "clock-names" is there or not :/

So what are those old r329 bindings ? is there a documentation defining
them somewhere ?

Cleaning that part would help with A733 addition in the existing driver
I think

>
>> +#define CLK_RTC_32K            3
>
> AFAICT besides being an internal clock, this is also fed to GPIO for
> debounce? We probably need to expose this on the A523 as well.
>
>
> Thanks
> ChenYu
>
>
>> +#define CLK_OSC32K_FANOUT      4
>> +#define CLK_HOSC_SERDES1       5
>> +#define CLK_HOSC_SERDES0       6
>> +#define CLK_HOSC_HDMI          7
>> +#define CLK_HOSC_UFS           8
>> +
>> +#endif /* _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_ */
>>
>> --
>> 2.52.0
>>
>>

--=20
Jerome

