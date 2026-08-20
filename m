Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E65C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 10:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHTtDnXZCHKa5y8EGgqexs176ovYBZq6I1x2ikTmc/A=; b=HQMCjT0CoeyxBVbjfF0vEBOcQf
	1a3DUcG2Kzq9AUIu2tP1EHsVK9pZyc+7q7m8nopgmlRub3IaN7uPtSsX7OmWpMOocN3DRoWXXp5dD
	GQDOpkekwPrXtyEzfMDT6juG6kV6wOsG8WheF/ocdlZ9COgvSlTtjwjsUSuCoLAP0URfil7GwpvEE
	eyMKkNjXz/fTRE6QlwnMO4YZid7Cugg4DwsZHL97gHr/dXc2Oy25OUllRWFCwbKwBmTVtHPJJgs6N
	/E+8p/VqHW4B7EPYhdZDUl/RKVuikVptR+o76cOSheGTbQ/1aJMA9g92PWPDx3DL8FeMnDGXvbSBo
	EQCpQP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx024-0000000BMW6-2EDs;
	Thu, 20 Aug 2026 10:30:00 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx021-0000000BMVI-446M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 10:29:59 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so24660901fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 03:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787221796; cv=none;
        d=google.com; s=arc-20260327;
        b=bCQFqyMQNeeaqUBets99yP6MpYfkwMKz/nJwWHdMUG+TKzDTW+nt6WDwT6XH8Hvtp6
         iz/NVV1hbUcCErR6k8vQlkQ6KgPK79oSGhupiw10PiX/DzyatMl5mhpD/j3hZRoXpV1O
         NNWYZDoJMOpG0s4AkEFUAayUg+u68GuMDY1kiTP2f4jV7ZNWcEtiBTCa+st1lUtucbI5
         4mVTdkLq5u1w42XbBbqagB3U/wbDZ2V6EzheHfWyykp+zSjvjhZCZ0AGu7iO7ReAOyOh
         dtvrZBms9vpO0TjqEsH/5IySmDadXaUQTUdraeJt9I7yx4vtKr/u5lNwR1EmszFJyygg
         bbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gHTtDnXZCHKa5y8EGgqexs176ovYBZq6I1x2ikTmc/A=;
        fh=dtZt27UTsImmMFBhzRgtAM28C4kqpjnSWWRjYbiCISk=;
        b=sq3LiBgBzeetEmq8HjHtTLrPQGhWYT40uXt9RzRX+AZ47EyeJ6jxOlwf3GA/1eP+oB
         ypvjNSbipCGdRXPp1eY1CczxQjvuSDBGPee6v/lyj4jBCKpSPcPb/jzs0gXxhEU44zKB
         r6RtCZIUwJFLBg8jN8jLuNOOLDbSMelT0tFtem/f8MKlO/jpsT/NoldTX6WWEkGSikmA
         3idvOO+ucOHBdIjgKU3oy0H8qRe7+Dt7mKuN1xoJ7zlpwo9M6B/fzxCwElLu4gKoZIoq
         Jl5oJnUMGVkNEHZIIii0HefrxGBrt2PuFiKBsMEHGOzVRzfeICFE/ljgliRqJlIbKNsH
         0F6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787221796; x=1787826596; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHTtDnXZCHKa5y8EGgqexs176ovYBZq6I1x2ikTmc/A=;
        b=nA7ygrn8eRZzAfxi8XxgsuZzDyXI557GGpeirjv2E2edH7nH7R5o6m0J6C5rXRHud2
         Pvo3rWqCp25R0SKPB0FFHP7U9AOztg3WpIYCXEB6eOSq4VCv1ayzFyaq1l+WTBFazS2K
         WmXjsJOdEoobScbZnvcvjAeZ+RiZQunU0Co6vl1+Ha4Z3KBWT7gOuprsDPTqLESc5NHv
         j1lz5fTqNB7xQoE7vIGXVfjNNUGMilHw1PJGxNbCYYJL9SPTjeiydM/f3KOq+Le42aA1
         611lN/QCKzDLi9uzI8Op/joESpo+3AYcS6caQHiEKhuXqmBB20HlImNP4Ren1jJ07I87
         dgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221796; x=1787826596;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gHTtDnXZCHKa5y8EGgqexs176ovYBZq6I1x2ikTmc/A=;
        b=cmec2Pr1aVraPlppoyjwWCGJ1jDJC4l3/3sq39ICqix5AfeWIk8Zpb7KNONMb8o25J
         5k6IiyFtB5mJxQtUOkaRzkmzsAyCt6I1uWxYjAvLMaHju1E8ZIlxrPwa5Seg7XuvGSmM
         rOCA34ejQfSseIwgtSr8cuXTcqx6U6NG8lGAj6jSw4Ok5DEi6ekln7W3stezZa8Zm2MB
         9WXXa5NP7ngrzwoLPAXkVwuuJhs/0EMAm7ow4c7J9U4tlKa+HQcerhZCZDMEvq4nrjIE
         YxCefIy5Sq6nXjhxsDiqmoaaFIk7NxRUyf9z5RKT33RZ9P6D4jNW0kNLGJMcVO545GLw
         DYEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPsh47CXELs0mbxMGR8qmpkyBvlujD/msbNE5LrYn4HHFlGjVhkymvIGGIrtGnNU9DDMMBlBeSp7vnMnFIR/V9@lists.infradead.org
X-Gm-Message-State: AOJu0YxIrxqe2G5GOltl/p8MgBcZdJUEb8M1dZ5w+wTkrqaTTKOLevVi
	5ah51bHK6DOe9pZwzkbR40tTenJGzyyybJfLjbPaBRugpc3tJtG5WgiZYl8Y9FnRB63uSd/WFlr
	HbpRYs2d/xMbHJC0TMEtWY8qkf6KKmpM=
X-Gm-Gg: AR+sD12jWlf/mVVrEhG6ujnqhMDNv3cGbvnus8hB+tNpcesz08Q8urAxRoqRqy1rJSr
	16V/cXoNi3h0D6tAqOA48z5o+AMDIeaTtnLbOgKc0XgJVhb7SaX14cbxMjuq9WPC36TxLL3f3Yi
	k+bWZ1k8N3hYKllPsmZ6Hxi/g756w77JfF02SEN40YBmr52cs0ciIWjDDpk11n0Bevw2e4WObno
	YYKo0i4xpcQMF0+/GVrn00rDoAqTiIVJh3Fd0iTiaquOvQdQ5Vwdxs7l6Ze/3MBuKj0+VUhH/QZ
	4caveSRoFwott4z6OusuMaOxmoi7LIt85IDsZNnIEV8wqZ+2SuwgV31sviFM9yzMEx1GZedKxlO
	VRAerP8EcoJL4JXr15i39A10=
X-Received: by 2002:a05:651c:a105:20b0:396:7e66:45ba with SMTP id
 38308e7fff4ca-3a1899c93d3mr20170021fa.8.1787221795510; Thu, 20 Aug 2026
 03:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <20260819-generous-nickel-dalmatian-b6bb08@quoll>
 <CADOrJmYfBe3ADun_kFjFSH6YOSTX7Vu3UsFsL57yuRdaQ=eJCA@mail.gmail.com>
 <e554c007-67e3-4fbf-b85e-5de02f649e83@kernel.org> <CAGXv+5H7AhZgZ06r9KO3HLZ9Cymkai+Cv9SgVTuSC1PjgGf8hg@mail.gmail.com>
 <d6c8f19e-f154-4b57-9101-cf3b73e9794f@kernel.org> <CADOrJmYxKTyDkKPaKCpH37RsyyZJZ+4uReE--+uvnHmEdNJVOw@mail.gmail.com>
 <c38cb98e-0746-4b28-b0c9-ce59e8338048@kernel.org> <CADOrJmb8CTkjRFp7OjynfQSFm3fHT87wemUM4X5yJjTtS=C7tA@mail.gmail.com>
In-Reply-To: <CADOrJmb8CTkjRFp7OjynfQSFm3fHT87wemUM4X5yJjTtS=C7tA@mail.gmail.com>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 20 Aug 2026 13:29:42 +0300
X-Gm-Features: AcwNN1W--3JEaqfbnjrk9l_aNGSOT-_KL7O3smYd-mfsUY6q4R3owlstmMzx5Og
Message-ID: <CADOrJmYdg6_BLdgY3yEDkn5ugBDwUNUyArffrCB7GWJkHqQRwA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, briannorris@chromium.org, johannes@sipsolutions.net, 
	andrew@lunn.ch, krzk+dt@kernel.org, francesco@dolcini.it, 
	johannes.berg@intel.com, kees@kernel.org, miriam.rachel.korenblit@intel.com, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_032958_067366_787E973B 
X-CRM114-Status: GOOD (  45.78  )
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

On Thu, 20 Aug 2026 at 12:33, George Valkov <gvalkov@gmail.com> wrote:
>
> On Thu, 20 Aug 2026 at 11:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 20/08/2026 09:50, George Valkov wrote:
> > >
> > >
> > > Krzysztof:
> > >> regulatory-hint for me means usually regdb, but even with your meaning
> > >> you tell SW what to do - ignore hardware regulatory information.
> > >> Property should not tell what SW should do with hardware. Property
> > >> should tell what is happening here in the hardware. In this case: what
> > >> is the reason behind.
> > >>
> > >> IOW, why user of a board in country X, where regulatory data says X,
> > >> should have the correct regulatory data ignored?
> > >
> > > Because users in X buy a board for X and the regulatory data says U.
> > >
> > > Indeed when the ROM regulatory hint is set to US and the driver
> > > reports this to the OS, the wireless-regdb restrictions for US are
> > > applied. This would normally be fine, however the third radio in
> > > WRT3200ACM and WRT32x, reports US on all models including those sold
> > > in the EU and other non US markets. This creates a conflict with
> > > radios 0 and 1, which report FR and also with my correct setting: BG.
> > > With the wireless-regdb restrictions for US, FR and BG applied, radio
> > > 0 refuses to start.
> >
> > So if you move with your router to US, you would need to change DTB?
> > IOW, the DTB is per user? This is obviously wrong... What if one device
> > has correct regulatory data written and you ignore it? Why would you
> > ignore it? If you decide to ignore correct regulatory data, then you can
> > as well ignore it unconditionally and this property is not needed.
>
> All radios on these devices operate according to their certified
> region. The firmware for all radios is closed source, locked-down and
> there is no API to change any regional settings or affect TX power. By
> design, the regulatory information for this platform is configured
> from the devinfo partition mtd3:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts?h=v7.2#n106
>
> cat /dev/mtd3
> admin1_passphrase=[...]
> admin2_passphrase=[...]
> cert_region=EU
> default_passphrase=[...]
> default_ssid=Linksys07770
> deviceType=urn:home-linksys-com:device:Router:1
> devinfo_version=20160121.1
> hw_mac_addr=[...]
> hw_revision=1
> hw_version=48SAM203.0GA
> manufacturer=Linksys, LLC
> manufacturerURL=http://www.linksys.com
> manufacturer_date=2017/12/26
> mfg_data_version=1
> modelDescription=Simultaneous Dual-Band Wireless-AC Gigabit Router
> modelNumber=WRT3200ACM-EU
> serial_number=[...]
> sw_version=v1.0.0
> tc_passphrase=[...]
> tc_ssid=[...]
> uuid_key=[...]
> wps_device_pin=[...]
>
> The intent of these patch series is not to make the radios operate in
> a region other than the one they are certified for, that's obviously
> not possible. As described in the commit description, the goal is to
> allow the platform to use the correct region, which is stored in the
> devinfo partition. The hard-coded region in the ROM of radio 2
> conflicts with the platform region and should be ignored, otherwise
> radio 0 and 2 won't even start. And yes this applies to the case where
> the user bought the device in Europe and has configured their correct
> country.
>
> With routes that allow the region to be changed, a user can move from
> EU to US, set the region to US and use their device.
> This is not the case with this model. The radios refuse region change
> so the user should not use it in other regions.
> For models sold on the US market, all 3 radios report US. The platform
> also enforces the US region from the devinfo partition. Even if we
> ignore the ROM hint from all radios, the platform will still use US. I
> don't see any regression. My changes are carefully scoped to a
> particular device which needs them and do not affect any other
> devices.
>
> > > Would you approve any of these or suggest a better name for the flag?
> > > Should ROM be in upper or lower case?
> > > I omitted 'in-ROM' to keep it short, because the driver check line is
> > > already longer than 80 characters.
> > > - marvell,ignore-regulatory-hint (current)
> > > - marvell,ignore-regulatory-hint-in-ROM
> > > - marvell,invalid-regulatory-hint-in-ROM
> > > - marvell,invalid-regulatory-hint
> > > - marvell,invalid-regulatory-ROM
> > > - marvell,invalid-reg-hint-in-ROM
> >
> > The point is that the regulatory hint is NOT INVALID. One device was
> > sold in US with US data, so how could it be invalid?
>
> US devices have no issues, because all radios report US.
> I would love to ask Linksys the same question.
> My router was sold in Bulgaria and radio 3 reports US. Others bought
> it from the UK, DE, etc - same thing. Please allow me some time to
> install a clean firmware and I will post the output from
> iw reg get
> so you can see the incorrect regulatory hint and mix of three regions.
> This will take some time, and I will be left without a working Wi-Fi
> until I recover using UART.

iw reg get
global
country 98: DFS-UNSET
(2400 - 2472 @ 40), (N/A, 20), (N/A)
(5150 - 5250 @ 100), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
(5250 - 5350 @ 100), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
(5470 - 5725 @ 160), (N/A, 24), (0 ms), DFS
(5725 - 5730 @ 5), (N/A, 13), (0 ms), DFS
(5730 - 5850 @ 80), (N/A, 13), (N/A)
(5850 - 5875 @ 25), (N/A, 13), (N/A), NO-OUTDOOR, PASSIVE-SCAN
(5945 - 6425 @ 320), (N/A, 12), (N/A), NO-OUTDOOR, PASSIVE-SCAN
(57240 - 71000 @ 2160), (N/A, 40), (N/A)

phy#2
country US: DFS-FCC
(902 - 904 @ 2), (N/A, 30), (N/A)
(904 - 920 @ 16), (N/A, 30), (N/A)
(920 - 928 @ 8), (N/A, 30), (N/A)
(2400 - 2472 @ 40), (N/A, 30), (N/A)
(5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
(5250 - 5350 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
(5470 - 5730 @ 160), (N/A, 24), (0 ms), DFS
(5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
(5850 - 5895 @ 40), (N/A, 27), (N/A), NO-OUTDOOR, AUTO-BW, PASSIVE-SCAN
(5925 - 7125 @ 320), (N/A, 12), (N/A), NO-OUTDOOR, PASSIVE-SCAN
(57240 - 71000 @ 2160), (N/A, 40), (N/A)

phy#1
country FR: DFS-ETSI
(2400 - 2483 @ 40), (N/A, 20), (N/A)
(5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
(5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
(5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
(5725 - 5875 @ 80), (N/A, 13), (N/A)
(5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
(57000 - 71000 @ 2160), (N/A, 40), (N/A)

phy#0
country FR: DFS-ETSI
(2400 - 2483 @ 40), (N/A, 20), (N/A)
(5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
(5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
(5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
(5725 - 5875 @ 80), (N/A, 13), (N/A)
(5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
(57000 - 71000 @ 2160), (N/A, 40), (N/A)

global: country 98: DFS-UNSET
phy#0: country FR: DFS-ETSI
phy#1: country FR: DFS-ETSI
phy#2: country US: DFS-FCC

- phy0 does not start
- phy1 works
- phy2 works

And my country is set to BG
# /etc/config/wireless
config wifi-device 'radio0'
    option type 'mac80211'
    option path 'soc/soc:pcie/pci0000:00/0000:00:01.0/0000:01:00.0'
    option require_mode 'ac'
    option cell_density '3'
    option legacy_rates '0'
    option htmode 'VHT80'
    option hwmode '11a'
    option country 'BG'
    option channel '100'
    option disabled '0'

Other users report the same:
https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699

You can also search: WRT3200ACM DFS, there are endless comments.

Greetings!
Georgi Valkov

