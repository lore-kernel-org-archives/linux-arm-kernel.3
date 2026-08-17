Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D94C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7to3S/vyHJi4C50qM1skSCpv39eeSlcQqbFpwDuuSA=; b=Eo0DUcJUY4tYut4mG0Dufl/3ZD
	JWVPZDax6WSGR4JrP2Q/7STZZckaf4uy+JIDE3oIPFdkdkPY8ge47FzdwzMD3ngltSwuFsTLtDWtm
	tRsKrR+CR2nAsQXW3n9WLYPAKFvrOMfrj/8euzzOGXbcx1WHn4MRSRv8cJ0Nehlo6pHOtIn2R+6jh
	tU1JUcZxpGDoTC/3Pw52KzFFh3OdeFpFvUyLrwEQhYGlRo5ag5Wf+dwa7EulWGmr3DhbpvnV8/Oak
	oKZ1Qqwu+WeW47ZBPJgDo8JfTtZZR0JH36naQOmFaX1E2dwU4eN0dFS/xwrmKe8TSKS6iAeGCfKPH
	GqoMBr+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxhJ-00000006FAW-0I4x;
	Mon, 17 Aug 2026 13:48:17 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxhG-00000006F9Y-10PK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:48:15 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so2968729e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786974492; cv=none;
        d=google.com; s=arc-20260327;
        b=jHpnn30ZaVq8B+gSPPdgk/CkQUPTseT+A0/rQ9VpMurkNiJLjDs7D/UrN18EzXGKVd
         GpcG7OpzXR2ufFlOTmSeTRI3Azxl7r4JwCMzj+3DyWEJjo3EcmshnKGDAYugGAW8RMwr
         fDxQyep6qB7AcfjlRa/Y4sDFlIgsuF6ctOsxQq6uoItHZgX1W62e3asHCgCW5wZ23Nzz
         L2ZU4SiCjojqBxxBjQj6Rzem1Euo+oBh/C9srhlPPGP8W87OUnsg34QnsrTd43sh5HNK
         wsed333bzBVkp951eJ7AT3iLjYRndDU+aBBBVUC3nuDegUp7aNZ92Bw0vbqnP2hF+2jc
         XDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B7to3S/vyHJi4C50qM1skSCpv39eeSlcQqbFpwDuuSA=;
        fh=jhauULQli3CYEEEbk/i1tLqy9vP4WX0tWfSQBpGGzAo=;
        b=IRQjp+l+Jw6x3V8gMGzJ3GcpsaX+MgMkS8h0w7xtU1h4Vvob9XiCgCsTvdTLXjG7Au
         FDmVl5f0xUVC1BPGWKJuwwHXOYh0TJRIWwN9F84Th/DXDn0tmVJIvFmHcFI0BVbKrYWk
         wOn9eK8E2x9e8cTxS9wh/cq7pChYKjz+6MHib23bH7SnqnrNn4kjGP0z8BVrFWZKaGTY
         K0jzzsc6zVaCJgqAQaNWVk+hEwTMEHCTCujV7OxsRcKVLB7oqaBn1f5dNAKmA8G1gTP8
         HVOc5NXnFJOUyjrPs6mmkxrDUGGwtHOKjyMUrEN6h1mFyVfkax0HwX7b9CU4UERosnUU
         ne/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786974492; x=1787579292; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7to3S/vyHJi4C50qM1skSCpv39eeSlcQqbFpwDuuSA=;
        b=NELZM/Sl1aai+lizabopg2WNMrWqHUlvSnxKBOI6TV+/YegQiYBnmwDfmEvoFILw49
         GxmjOD/Py6JPo7MtD78pYD3TUEGRkwWPsS9Xd5JTyka/n2BYHO7JiBC5fVngXCa/ecs6
         beaSiuWoCEm5JkqroeRKnIAio/0iMbfnkYFUdCvRqEroFzUxt3cdEkQmRtc+VzwMweFZ
         bJ/BLVpngYZEl79Xep6ba+ngmzjdqPF+ja2Z1KXUEi0l40MjqhUR+hqj8sKbTVI48C24
         58kKLgbIyskCyjMHHzkNdLJhWA2xSgthVmMoGUKyp5npyo308cciiKo+j/20zzR0Y4pP
         BZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974492; x=1787579292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B7to3S/vyHJi4C50qM1skSCpv39eeSlcQqbFpwDuuSA=;
        b=ALD+14XXe9Qf32tHbsoWnJ7nSdOpX/WEOBvmCIez2/rAz8AU27ni37cQgUU8AdvtyL
         urwzgi6/YielcC12b2fnU1YGyNKaQcb9p8hDZWYPkA1gtiouNL+9Wm+vBquWKmX6CDnI
         Vm63H9vhYs9NoYft4LhTnh+b2DX39jApPv6ZDAsnOXMzVTipXIgz2CMDJZuU1Z9aUbF1
         XAiV+IVgC9oGR9IKQm5iPQpSskMAe6/09/tULSvaAHa2G99YLMHwoyUGSqGsV8CIQRvP
         KKiQQfXpuTnQgN2ihKO1cBYZlSKSIf7OSesuv1cE40QufA6cKZ7CYo5eLwI5N8Bag7B3
         jREA==
X-Forwarded-Encrypted: i=1; AHgh+Roh7Pnei/ccFO4C+XnvsERxtcdY8zCQpc+r6FQAp2uBchjgbNhERyWWLahIQxz9RT6hz8O9FfULISok4jHRoF28@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5ot3PKm4w0HRPFLR7kaOcncuSI0kxh9Qj+QhpwqW7i/GKg6VL
	nktNU2sfNOGvSUzKY4llfa3SwD7SY8P2a1BTOglBcp/zTmdJA25ueOlEsnviBJ/kM9W4AxDNC1x
	rFjEyKizu4p3SNa62offmif0Aqz6EgMQ=
X-Gm-Gg: AR+sD12tOYAhTrzUHPyPeA8ILZgVqnEexVpYBwIbjuBpa++DoaglAbQXiiJPtQLaZW6
	qQhUT/yAuDEtHAAwbIYvW1WW5IKHGo827Hk/zB1XVvqUQg8P/FdrViCqknRAfpftitQa5zXS2A0
	vh8dU4fKThU5UOQm4wjpsAGa1B1PCBwOCWIR8yTNzBxp2twStP/1a9vt+9OIU04YGHLN4U6F+Ut
	/GPyVfxzbUqCu3FaBQ24+RS/8FTfqbKjao/7U6CBx+A0EDncdll0T+WBiCEKn2JVhO6vP3HQs5e
	IrEvvAMXkPKnYA9u3fTVDUyI7L/easFLtzXL/W4bxn3aS4MeRG0rP0pgI2f03KzfdTzb8Sy0Nho
	6X5zGG2C7BM9jCpI+sUndGj4h
X-Received: by 2002:a2e:be21:0:b0:3a1:3299:4b72 with SMTP id
 38308e7fff4ca-3a132994c9bmr27554591fa.5.1786974491759; Mon, 17 Aug 2026
 06:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <anoYr9H4KojJv-aZ@google.com> <20260814125025.90522-1-gvalkov@gmail.com>
 <20260817-hairy-serval-of-refinement-49039a@quoll> <CADOrJmb3uJPpYR481rB-CnL0A9B_5PQ683XP+Gdis47uihqMBw@mail.gmail.com>
 <9b3b6f29-35a8-4b79-a002-bd0aac5dbee4@kernel.org> <CADOrJmZRBQb9u9oi2m=4iJuKDLVi6HNjOoSurRwE5QKPB_LetA@mail.gmail.com>
 <2f264b09-98e9-4260-b413-97a494ba789f@kernel.org>
In-Reply-To: <2f264b09-98e9-4260-b413-97a494ba789f@kernel.org>
From: George Valkov <gvalkov@gmail.com>
Date: Mon, 17 Aug 2026 16:48:00 +0300
X-Gm-Features: AcwNN1XSM-kUj0y-bm3ADk8-VJqO006hhwhFkIs6frzRNq7J5ZP1Fvf40UVJSGU
Message-ID: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_064814_328115_6614483E 
X-CRM114-Status: GOOD (  49.66  )
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

On Mon, 17 Aug 2026 at 16:25, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/08/2026 15:20, George Valkov wrote:
> > On Mon, 17 Aug 2026 at 14:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 17/08/2026 12:43, George Valkov wrote:
> >>> On Mon, 17 Aug 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>>
> >>>> On Fri, Aug 14, 2026 at 03:50:23PM +0300, Georgi Valkov wrote:
> >>>>> WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> >>>>> from the mwifiex ROM, which conflicts with the platform regulatory
> >>>>> configuration on units sold outside the US market. For example:
> >>>>> - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> >>>>> - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> >>>>> - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >>>>
> >>>> v1 as reply to v3 in big thread. How tools can parse that?
> >>>
> >>> Hello Krzysztof,
> >>> I apologise, I forgot to add the v4 tag to the subject.
> >>> I have documented the changes between each revision.
> >>> I saw my mistake after sending the mail. But I wasn't sure
> >>> what to do? I will make sure to add v5 to my next revision.
> >>>
> >>>> Does b4 diff work?
> >>>>
> >>>> b4 diff '20260814125025.90522-1-gvalkov@gmail.com'
> >>>
> >>> What is b4?
> >>
> >> Tool used by maintainers and contributors to handle/send patches. See
> >> korg docs (or just google "What is b4 Linux kernel").
> >
> > Thanks!
> >
> >
> >>>>> When the system boots, it detects a conflict between the user selected
> >>>>> region and the radios, e.g. BG FR US, and applies extreme restrictions,
> >>>>> preventing use of 5 GHz and DFS channels. This also affects phy0.
> >>>>>
> >>>>> Add a device-tree flag, which allows affected platforms to ignore
> >>>>> an incorrect regulatory hint from ROM, so userspace can set the
> >>>>> correct platform regulatory domain.
> >>>>>
> >>>>> [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> >>>>> [2] https://github.com/openwrt/openwrt/issues/9956
> >>>>>
> >>>>> Tested-on: WRT3200ACM, OpenWrt
> >>>>
> >>>> Not a valid tag, drop.
> >>>
> >>> I believe the tag is helpful because it describes that my changes
> >>> have been tested on a certain device and platform. It's a common
> >>> practice in OpenWrt contributions. My last two accepted patches
> >>> have this tag. Should I still remove it?
> >>
> >> Drop the tag everywhere and instead on the patches which were possible
> >> to be tested mention how did you test it.
> >
> > ok
> >
> >
> >>>> And you cannot even do that, otherwise explain me
> >>>> how did your device execute THIS (exactly THIS) code?
> >>>
> >>> I am not used to your terminology and this gets me completely confused.
> >>> You have not quoted any particular code change, so I'm not sure what
> >>> you are referring to. Here is a summary of the patch series:
> >>
> >> Tested means executing or parsing or using the code on the device under
> >> test. How can you execute/parse/use this code on the device?
> >
> > Test procedure:
> > Compile, FLASH and run OpenWrt firmware for WRT3200ACM.
> > This compiles the Linux kernel along with all dts files and drivers.
> >
> > 1. Before the fix
> > Notice how each radio has its own country:
> > iw reg get
> > https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> >
> > If the user sets their correct country code, e.g. BG, then global
> > will be set to BG. This conflicts with FR from phy0 and phy1.
> > And also conflicts with phy2 which reports US.
> > Result: the main radio phy0 does not start.
> >
> > 2. With the fix applied
> > iw reg get
> > phy2 does not appear in the list, so there is no conflict with the US
> > region. I can address phy0 and phy1 later in another PR. They need
> > a similar device-tree flag in the board file. The actual driver is not part
> > of Linux. So I'm not sure if there is any place to add documentation?
> > Result: phy0 and phy2 work. 5 GHz and DFS work.
> >
> > I also used this test code to confirm that the flag is set:
> > mwifiex_dbg(adapter, ERROR,
> >             "[%s][%pfwP] ignore-regulatory-hint %u ++\n",
> >             dev_name(adapter->dev), dev_fwnode(adapter->dev),
> >             device_property_read_bool(adapter->dev,
> >                                       "marvell,ignore-regulatory-hint"));
> >
> > [   19.927595] mwifiex_sdio mmc0:0001:1:
> > [mmc0:0001:1][wifi@1] ignore-regulatory-hint 1 ++
>
> You are not responding to the actual problem.
>
> In very simple words, like one or two sentences, explain me how this
> YAML file affected `iw reg get`?

It does not affect `iw reg get`.
I was asked to document the flag there, before I use it.
Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml


> >>> Patch 1 documents a new flag: marvell,ignore-regulatory-hint.
> >>> Patch 2 adds a device-tree node with the radio and the flag.
> >>> Patch 3 skips the regulatory_hint() call when the flag is set.
> >>
> >> I can read your patchsets and above does not proof how can you test binding.
> >
> > Ah, you mean how I tested if the device-tree changes are valid?
> > I have almost no experience with dts. I ran this command before
> > sending v4, and I think it seems fine. Here's a link to the output:
> > make dt_binding_check
> > https://httpstorm.com/share/.openwrt/test/2026-08-17_mwifiex/dt_binding_check-01.txt
>
> This is a make process, so build stage. Nothing related to testing on DUT.
>
> Building kernel (and running standard tools) is not testing, so I repeat
> - do not introduce "tested" statements to commits which is impossible to
> test by the definition of "tested" in Linux kernel. We discuss all this
> in this very specific patch, not some other patches.

ok, I will drop the Tested-on tag for patch 1 and 2.
For patch 3, which can be tested, I need to describe how
I tested the changes, e.g: iw reg get, and print the flag.

Note taken. Thank you!

Georgi Valkov

