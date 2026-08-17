Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23514C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2cyI6mzx6oJKUliXKmfq6Ny/sEmn4X6lt43pxzRGug=; b=kauPwN2gahOr0l7rxB+owwRUwl
	q1R7FH24dJWF/HzmA2sLkkYTXRQykhcPZSKNTbnhwRhRqn+TJnoE5LJCqgaEdTEHc6NpYqn/9V+LQ
	Nw3hTwnGXEowRYKibQzDs2Fl5+Gnpg915j7kAAKTzbLnhdzNq/kailfoPUPns/klNEeXyNtFRgqFw
	UYOC1iXfjJufki93k0Gv1AGeyVSeNABxC82VATyv7fDVyOVg/WBpuaJRSDiEj/Qb7yphWeWcba+wJ
	KH0osDhWznq8DRKiAmNnUy1thZlhCnO/mhJ2tzZqxCiM+nNtLYyM50aEek00GQFfkPM+JvfoOc7pC
	Z9rEKxPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxH9-00000006CbY-2upz;
	Mon, 17 Aug 2026 13:21:15 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxH7-00000006CaY-0u4j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:21:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5aea0fff535so3610531e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786972871; cv=none;
        d=google.com; s=arc-20260327;
        b=MmEOLCbgf1eddnOybcrZF+t2VlC8lHrQtrCx/JQBLgP8PUUdD7JWKMT4kzH7KL1NJb
         ZfNtj36ptuK3VBSILYgZaC4J1VjnlFBuVh9bdZrdho0kZFNWbRQFt063SUado4+lKZBb
         B2ABEGvLQlgNcrbO8ZlmO3111ATcgAL/XyGwCfk9t2hhx8gZzB/dFpvf1aAIjZB7DP9w
         z9iT3l3qOLql8jTSaN5RXNZZhKH5GLLPvUAnNC+6xoJdDpS2DrQaa23XPHrlnBXczglx
         GseQ2oGVNZbPGyyfNBlbeZt5JyEjsgqSeOlgo2ggmZ7imazPvRHSV6OkDeipO+5/NdvA
         2d4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d2cyI6mzx6oJKUliXKmfq6Ny/sEmn4X6lt43pxzRGug=;
        fh=NnGZMOK7VkSUK6ro7cEcydl6zcJ4O2V4A+1Au9AL/jk=;
        b=NWYgqZCOyZHteiEK9K2AzLBa8f+a/XUnD6vtgN9l2za/0jwK/NNiXSZrxsbn6QSIXC
         zM+D9eFKN15kwy0VUV0hUMjWc8n53iLJaEr4L7RFYUqojgDbfxvCBcCSFTvXFfdZJ5VI
         uXGjNjJ9b7xI+W9SUjbUNrbOoggT20ev1lCJnnZruJOe0gHggmC8DcNgd7gB+pfC2+1o
         jPKnqx678vDGzyJqVLcsg3v8MK6tD6nUwyN66r/XH5kjbGaq07R7Xsvq90lC2UcC1VU5
         go2LL1t4g3dtFBQgkc35LQx1cDm7qq4xjLI0mNIfQtgW+Nw/4yUe1busILMDWGk8TOCd
         Ly6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786972871; x=1787577671; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2cyI6mzx6oJKUliXKmfq6Ny/sEmn4X6lt43pxzRGug=;
        b=GBDycxREf8AD2cxqftOO2d8Ky74GSxwvOSRsY7qPayFN+S/4e9Zg3ys2ap7NS4rYYH
         ZOpNli9rw8XfLeRvr/MgpdUQ9jniSmP9RVjktIJiN8KjsVZP05YmHIZBD/+NbS498y/R
         7hmoW/V60iAV+68PFGD6IR1gEafrxu0euXLD50DRXIIViDbKSSd0HaQwFTrTzGNTonvJ
         clETkVzyYt1hNCpgtZUnbHcVx4FqwPkfjJSN/O/LeWpSEUybd5YwWwqYlWX1nfxL/dBF
         apJ9AwP0B74skSq/cyK29NQYxp5LMz1tUdqZJVlE+JM0n4oA2MPIaL+SPjH8yq5cdXgA
         tEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972871; x=1787577671;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d2cyI6mzx6oJKUliXKmfq6Ny/sEmn4X6lt43pxzRGug=;
        b=Ta8wW1GDjXebsk8PdzIPJTCzoMYixZSgB4ohiraoSfrmv0KojN75nN5EevS4MXQyes
         qkKo2Y4VkpYGoMucmKfR5MFOk3Hlw1xxRoWOib+KgKYsvxDDmKopcF9s3ZJTJLgQJpvi
         dfVxC1udW+YRFJb+sRyucs+UyRCKjTJXlR/7Fkj0kixws066KhU1Y0zdlWL9Il7PTuoP
         FxGweVhqDHukKfhX9qcCUT7IhP9+eeQvFo/7xek31TGDqqLmCbs7dfduCSgT4Xoo1u6G
         vhqKzDPAb4vCOeC3VjzlsrZBUamBLiJQL1OzIctCCOTRwqCuL91nsMPkRLXzULpcuer0
         WeDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrm+07zoiFhY2j+K/hmEwezkhNJzml1/mL4NM8WZ+F6Wz7GBqM5nvB7yy2uyiibU6l5FNmuyfDNQTme9Bip9v3C@lists.infradead.org
X-Gm-Message-State: AOJu0YzL2f7ZjpvWYTeMeS3uVrgv9f+SN2yuQObV/ktxXldcRzEQW8Bs
	j7iirYndI2huGMZGxpXd4UKcjvgYNZL5gkPJWDiDY8WruNgUXp6zYMXXp/GjMcvKENkuL4dwQnw
	yKyfG4F6sdchWzMYdw6KePOXenQfHvKw=
X-Gm-Gg: AR+sD11zAFZet91jFUmU/C9cNX3OqLU56aMHwBX0uJFJJULqgjrY7/SHIMe/y2ffb52
	xcOeLtxd4/wDmnGxC0ZZnBKhmORvgqUCbqKhaoiBqSaY+OtcDhd024ov67SeCwqMBwlMaJTZ/W9
	1y/J7871edyO2dPaxrrgiZjYLf2B8pU2pURlP3kShgxM1t35c4Phvew+CzY0UoEU5tD7OyuGJnj
	P4JOO4xYM+dgU2ptGKOpbKrA5LL8dW7nVLxLxWmMRXN4b0nlLunKnhMomytI/np5Oc6hvSITCd8
	ScPPppZ1XTI7ZlyIWhHdDBdRsWjHbIkmHYep+pUBSR9As/Z1M64B+DXKcTpk9hmuPV0MMpCGCpW
	UgywT+h5NS2mDmWSiO81aYbvY
X-Received: by 2002:a05:6512:3d0d:b0:5b4:51b5:6081 with SMTP id
 2adb3069b0e04-5b45915d407mr3952421e87.18.1786972870527; Mon, 17 Aug 2026
 06:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <anoYr9H4KojJv-aZ@google.com> <20260814125025.90522-1-gvalkov@gmail.com>
 <20260817-hairy-serval-of-refinement-49039a@quoll> <CADOrJmb3uJPpYR481rB-CnL0A9B_5PQ683XP+Gdis47uihqMBw@mail.gmail.com>
 <9b3b6f29-35a8-4b79-a002-bd0aac5dbee4@kernel.org>
In-Reply-To: <9b3b6f29-35a8-4b79-a002-bd0aac5dbee4@kernel.org>
From: George Valkov <gvalkov@gmail.com>
Date: Mon, 17 Aug 2026 16:20:58 +0300
X-Gm-Features: AcwNN1X6U-ZMoqh7Cxmw1TZJAety3Im5k5ja-jQ-2gFEkWXaK2yQc5cFAuGj_B4
Message-ID: <CADOrJmZRBQb9u9oi2m=4iJuKDLVi6HNjOoSurRwE5QKPB_LetA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260817_062113_304187_9B234E40 
X-CRM114-Status: GOOD (  41.44  )
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

On Mon, 17 Aug 2026 at 14:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/08/2026 12:43, George Valkov wrote:
> > On Mon, 17 Aug 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Fri, Aug 14, 2026 at 03:50:23PM +0300, Georgi Valkov wrote:
> >>> WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> >>> from the mwifiex ROM, which conflicts with the platform regulatory
> >>> configuration on units sold outside the US market. For example:
> >>> - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> >>> - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> >>> - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >>
> >> v1 as reply to v3 in big thread. How tools can parse that?
> >
> > Hello Krzysztof,
> > I apologise, I forgot to add the v4 tag to the subject.
> > I have documented the changes between each revision.
> > I saw my mistake after sending the mail. But I wasn't sure
> > what to do? I will make sure to add v5 to my next revision.
> >
> >> Does b4 diff work?
> >>
> >> b4 diff '20260814125025.90522-1-gvalkov@gmail.com'
> >
> > What is b4?
>
> Tool used by maintainers and contributors to handle/send patches. See
> korg docs (or just google "What is b4 Linux kernel").

Thanks!


> >>> When the system boots, it detects a conflict between the user selected
> >>> region and the radios, e.g. BG FR US, and applies extreme restrictions,
> >>> preventing use of 5 GHz and DFS channels. This also affects phy0.
> >>>
> >>> Add a device-tree flag, which allows affected platforms to ignore
> >>> an incorrect regulatory hint from ROM, so userspace can set the
> >>> correct platform regulatory domain.
> >>>
> >>> [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> >>> [2] https://github.com/openwrt/openwrt/issues/9956
> >>>
> >>> Tested-on: WRT3200ACM, OpenWrt
> >>
> >> Not a valid tag, drop.
> >
> > I believe the tag is helpful because it describes that my changes
> > have been tested on a certain device and platform. It's a common
> > practice in OpenWrt contributions. My last two accepted patches
> > have this tag. Should I still remove it?
>
> Drop the tag everywhere and instead on the patches which were possible
> to be tested mention how did you test it.

ok


> >> And you cannot even do that, otherwise explain me
> >> how did your device execute THIS (exactly THIS) code?
> >
> > I am not used to your terminology and this gets me completely confused.
> > You have not quoted any particular code change, so I'm not sure what
> > you are referring to. Here is a summary of the patch series:
>
> Tested means executing or parsing or using the code on the device under
> test. How can you execute/parse/use this code on the device?

Test procedure:
Compile, FLASH and run OpenWrt firmware for WRT3200ACM.
This compiles the Linux kernel along with all dts files and drivers.

1. Before the fix
Notice how each radio has its own country:
iw reg get
https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699

If the user sets their correct country code, e.g. BG, then global
will be set to BG. This conflicts with FR from phy0 and phy1.
And also conflicts with phy2 which reports US.
Result: the main radio phy0 does not start.

2. With the fix applied
iw reg get
phy2 does not appear in the list, so there is no conflict with the US
region. I can address phy0 and phy1 later in another PR. They need
a similar device-tree flag in the board file. The actual driver is not part
of Linux. So I'm not sure if there is any place to add documentation?
Result: phy0 and phy2 work. 5 GHz and DFS work.

I also used this test code to confirm that the flag is set:
mwifiex_dbg(adapter, ERROR,
            "[%s][%pfwP] ignore-regulatory-hint %u ++\n",
            dev_name(adapter->dev), dev_fwnode(adapter->dev),
            device_property_read_bool(adapter->dev,
                                      "marvell,ignore-regulatory-hint"));

[   19.927595] mwifiex_sdio mmc0:0001:1:
[mmc0:0001:1][wifi@1] ignore-regulatory-hint 1 ++


> > Patch 1 documents a new flag: marvell,ignore-regulatory-hint.
> > Patch 2 adds a device-tree node with the radio and the flag.
> > Patch 3 skips the regulatory_hint() call when the flag is set.
>
> I can read your patchsets and above does not proof how can you test binding.

Ah, you mean how I tested if the device-tree changes are valid?
I have almost no experience with dts. I ran this command before
sending v4, and I think it seems fine. Here's a link to the output:
make dt_binding_check
https://httpstorm.com/share/.openwrt/test/2026-08-17_mwifiex/dt_binding_check-01.txt

I have not inspected the output from rebuilding the kernel yet:
make target/linux/{clean,compile} -j 1 V=s
https://httpstorm.com/share/.openwrt/test/2026-08-17_mwifiex/linux-01.txt

Sashiko AI said that #address-cells and #size-cells are missing,
so I am currently looking for a way to find the correct values.
The radio works without them, but I should address all issues,
before sending v5. Please write a list of tests I should run!
How can I confirm the values are correct?

Thanks for your help!
Georgi Valkov

