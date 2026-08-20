Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AABC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TAyv372/LEkCsLr0cT5JC02uRbKUvvVi2UV1V38EE0=; b=yxZknRWO3ukvaq2ZnnenIf4lKj
	fgD7+hJAjvbFHXovvE2uGOVv8CwzkrhKfIcbKgXwoUUZcu62V4d9LaMIrhTBOfw59vjmCg+XxJyXu
	zeeK5hecM19eYS37AQZg92gwDdjruxH+jut956CcOb1P9MWhUIRs0Xb3NmPgrtw74g5e7SHXB8zRu
	kImbB3eBNhgu9f6JlkEY3qabTh5lW0ZAv53HgzCPjUtL22tG0tufdq3H2y/v9Yn/B3IApntKY25CD
	qU1uE/w34C7x8CkVKXRO7JHsTTGnCrBJL6uaFJLFCEDzz01YSJ1Lbrwe75WU+rlxmw1icInvi5dxn
	MlumokFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxXf-0000000B6Da-3rVt;
	Thu, 20 Aug 2026 07:50:27 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxXd-0000000B6Ck-1sOj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 07:50:26 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3a151eda82dso14597071fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 00:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787212223; cv=none;
        d=google.com; s=arc-20260327;
        b=b1ewSbAoe+ZOqcQpcpGEd92GlivqKXRLAbZKr+eBY7xieZ/cGMF0BEkrcYRK9jwA8f
         UTDKtESYDMwsYhHhyQV+q6N9bZUceNibh5Mi4EEXACROhTFSvdTWZmCclpY33Cmox37R
         5tXAQZ/rWXBrExJuuLl9K5iwi7v9kADGlJfiABcmtA1jHsV3Mi0kQDTPPVGYEsIrYFL4
         ce9qxkLpby9d5qoRE/tnWaT5ma0IQGTj/lhiqm7yPLncJkOjPxKflQUO8tmQZTnjlC+Y
         zEn5ZRlklk8zVNV/gzJb6rN9TI1hhOrZs9htu6AS8XLcDhhR2Tr0M9wIzV978FsRFECO
         RNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0TAyv372/LEkCsLr0cT5JC02uRbKUvvVi2UV1V38EE0=;
        fh=EzrWMrzISwslDc5h7asGfe6YqM/1ooqSmueM2KU24bA=;
        b=XWXzBtKA8GjFPXX5t+R+McE2eaWR3lwTRGtlVcR32TXEdV01yfoWEjO3SV/BPJ6Pey
         jNLPjmwAh6Bn2/2JRqnPZhL32JpsFqjoquR9BM9XXlEbVBdVSKXHTYb0NV7Mn0Z7r41H
         Hb8pvlmz09+Oe/wBcIspykFKm7R+4m8U8weISuFytQJeruCpfMIjFT2Ge6ecyFiYNwwM
         nUddPG56YmZcsgfIgCaRNqdvUeAQOLno5HwN80OtQxVS1m+AqHsey21kGAtXj9Q/tEuE
         SDcQGMBYruxaBs++xugIXONeZcm78AaXXcVByynGuSEuxJVZN7z+sY3vC9EZQoDgMtt8
         eR/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787212223; x=1787817023; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TAyv372/LEkCsLr0cT5JC02uRbKUvvVi2UV1V38EE0=;
        b=sMgWBf3cpRkOL8iULsss4rjpbLqQ8u//cgm4SNi5xinPTLa38w+xKPxD/1FRvvLyCs
         gTWna1WgGn42TplcKXkDlitVp1u/13+dqhezYhHNyx9yTvNSqMEvC4BBdrKIShEzwOn/
         V8bXvtn2sevRaqwxHhSYt6Wz6ANRSLwcKO94LBcKg1gvOaCaKMq+AEdbwZSQ8CjCPWfk
         p1TVaQ9i93Lb72guRWoTmmLa/PAyOPJ54Hm7ByT+NRrL0FGJMtWndIZMB/T1KUiW/wP3
         vrbF7lr4Jzb2HqhXnuP5ilaZJakZPD6orOewXQ6frwoqermYpz8LhZcpuboEDJDM1zEt
         Fllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212223; x=1787817023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TAyv372/LEkCsLr0cT5JC02uRbKUvvVi2UV1V38EE0=;
        b=JQ4Z5Zu86dF/gZPjMf3esoT4A85OlQrokTjtsbUcPP8uqNcerGlR8N7k3PAxYEaRyO
         92sOVIZ+k+f/7mF11LUuyZ0/mLos/5m091yQu2nnz2m0CwiG9golYSgR9qjyCykGBeoY
         +yvyysNR/6F58P4UD8wqtSXrLQRuvANRvs/+5s7l1SExY3DJeJP9cOHtO8vrC4oVp6WT
         uEDmYJOLkgwX7g8dH7QGYh8921+wzkrXxYVihOEgL07SEeGt0u/3HTo15D6cQnIJhrKQ
         TKDKoaZi27dpsoNuJb3MBAkyPpZH9FRZ+zKK5p8xa/Cfhz5ZvIHHK6GGNncRo1hmivwn
         I+rQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjZqsil81TCPrfMszpFkCuVDQWZydnLfdEgt38Bl77iTc6reAMptSsLXfk5w4NYzcoxwpCXCotegyHH399Bvm5@lists.infradead.org
X-Gm-Message-State: AOJu0YwIfTg4+sPaUzD0dYlvAKlX02RUQfo2tAEH3d1a3GDy21JqtGiY
	+/8wQz/LacQ5U+AG0akkX8YmUXo55fm30aauIKHw4F84L8hYI69gFFAZ4F19H2X+EUvqtpJdKNX
	+I2gfGD8zHkEtoipIwaa0gapbrcqhDWY=
X-Gm-Gg: AR+sD12DsW1teRgMmgNesFnVlsz61c95tpEOJP18+dLxmXbjN0O2Kdi/+056O3DQ+WF
	B1pb/R21XzxfhJjgRavHW2LUF/M/vtEEH+CttlT9EgAJGSQ5B63RdVOGic8YHc4Wk99YXufCsCv
	PWq377jpuFV3cDnDu9x8m7yhEN2LDw4D1BOXBFjloq7DfGr+JPcxNTmVKHVpRqVbIurs7ZByomQ
	O496Oa8SyRtK7khPtIGkRwkWWR3ZXVWay3pVYgfrkqBm99q/7gD14ITKn53gQ4WgTgzCRhuD1Sz
	YRq+iu4FRgJ5BxMw2CaIm331FqrFd8rfNzqy1dV4YsFzJkj2lh7aohM7MGkdNu27/JLOLXFEA18
	zmW0225No2Z79Yx00VwmygOjz6A==
X-Received: by 2002:a05:651c:199f:b0:3a1:1d3b:67f1 with SMTP id
 38308e7fff4ca-3a1896d9d67mr21587801fa.7.1787212223022; Thu, 20 Aug 2026
 00:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <20260819-generous-nickel-dalmatian-b6bb08@quoll>
 <CADOrJmYfBe3ADun_kFjFSH6YOSTX7Vu3UsFsL57yuRdaQ=eJCA@mail.gmail.com>
 <e554c007-67e3-4fbf-b85e-5de02f649e83@kernel.org> <CAGXv+5H7AhZgZ06r9KO3HLZ9Cymkai+Cv9SgVTuSC1PjgGf8hg@mail.gmail.com>
 <d6c8f19e-f154-4b57-9101-cf3b73e9794f@kernel.org>
In-Reply-To: <d6c8f19e-f154-4b57-9101-cf3b73e9794f@kernel.org>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 20 Aug 2026 10:50:10 +0300
X-Gm-Features: AcwNN1UED2d-bg9Uini4u4mWy-mvYyG-FuFnU3Li4w7hQPYNR666nZuf3FB7ICo
Message-ID: <CADOrJmYxKTyDkKPaKCpH37RsyyZJZ+4uReE--+uvnHmEdNJVOw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, 
	kees@kernel.org, miriam.rachel.korenblit@intel.com, rafael.beims@toradex.com, 
	avraham.stern@intel.com, error27@gmail.com, s.kerkmann@pengutronix.de, 
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_005025_531318_BF8B76F6 
X-CRM114-Status: GOOD (  36.27  )
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

On Thu, 20 Aug 2026 at 09:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 20/08/2026 08:42, Chen-Yu Tsai wrote:
> > On Wed, Aug 19, 2026 at 8:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/08/2026 13:42, George Valkov wrote:
> >>> On Wed, 19 Aug 2026 at 12:42, Krzysztof Kozlowski <krzk@kernel.org> w=
rote:
> >>>>
> >>>> On Tue, Aug 18, 2026 at 12:54:26AM +0300, Georgi Valkov wrote:
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell=
,sd8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd878=
7.yaml
> >>>>> index 930b700b73d0..5f235cb9f3e5 100644
> >>>>> --- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787=
.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787=
.yaml
> >>>>> @@ -59,6 +59,12 @@ properties:
> >>>>>      description: Calibration data for sub-band 3 in the 5GHz band.
> >>>>>      maxItems: 502
> >>>>>
> >>>>> +  marvell,ignore-regulatory-hint:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/flag
> >>>>> +    description:
> >>>>> +      Ignore an incorrect regulatory hint from ROM,
> >>>>> +      so userspace can set the correct regulatory domain.
> >>>>> +
> >>>>
> >>>> Same comments, so you just ignored entire feedback?
> >>>
> >>> Do you mean this feedback? I already replied to it:
> >>>>> Anyway, property looks like SW choice. You must describe hardware
> >>>>> instead.
> >>>>
> >>>> I am sorry, I do not understand what you want me to do?
> >>>> Can you please send a diff or a clear description suitable for peopl=
e
> >>>> who have way less experience than you?
> >>>
> >>>
> >>>> Again: you need to describe the hardware, in commit msg, in property
> >>>> name and in description. You cannot tell SW what to do, that's not t=
he
> >>>> purpose of bindings.
> >>>
> >>> I still don't understand what I should do?
> >>> Can you please show me an example of the changes you want?
> >>> Else I'm likely to make a wrong guess and implement it. That obviousl=
y
> >>> won't help.
> >>>
> >>> The commit message already describes the issue with WRT3200ACM and WR=
T32x.
> >>>
> >>> About the description, do you want me to do something like this?
> >>>     description:
> >>>       Ignore an incorrect regulatory hint from ROM,
> >>>       so userspace can set the correct regulatory domain.
> >>> +    WRT3200ACM and WRT32x are known to need this.
> >>>
> >>> About the property name or flag, do you want me to add a separate fla=
g
> >>> for each affected hardware device?
> >>> - wrt3200acm,ignore-regulatory-hint
> >>> - wrt3200x,ignore-regulatory-hint
> >>> - the list may grow if someone decides to add other devices
> >>> - and the driver will need to support all of them
> >>> - that doesn't make sense, because it isn't scalable
> >>
> >> You need to describe the actual problem in the hardware or firmware, a=
nd
> >> then name the property and description accordingly. "Ignore regulatory
> >> hint" is clear instruction to the OS what it should do - ignore the
> >> wireless-regdb package/instruction etc.
> >
> ChenYu:
> > You probably have it backwards. The driver is taking the hint from the
> > hardware ROM, which is fixed and thus wrong once someone carries the
> > device to a different country. I.e. it is a quirk saying the _hardware_
> > region should not be used.

Almost. I bought the router in Bulgaria and I am in Bulgaria.
The ROM hint is US. More details below.


Krzysztof:
> regulatory-hint for me means usually regdb, but even with your meaning
> you tell SW what to do - ignore hardware regulatory information.
> Property should not tell what SW should do with hardware. Property
> should tell what is happening here in the hardware. In this case: what
> is the reason behind.
>
> IOW, why user of a board in country X, where regulatory data says X,
> should have the correct regulatory data ignored?

Because users in X buy a board for X and the regulatory data says U.

Indeed when the ROM regulatory hint is set to US and the driver
reports this to the OS, the wireless-regdb restrictions for US are
applied. This would normally be fine, however the third radio in
WRT3200ACM and WRT32x, reports US on all models including those sold
in the EU and other non US markets. This creates a conflict with
radios 0 and 1, which report FR and also with my correct setting: BG.
With the wireless-regdb restrictions for US, FR and BG applied, radio
0 refuses to start.

Would you approve any of these or suggest a better name for the flag?
Should ROM be in upper or lower case?
I omitted 'in-ROM' to keep it short, because the driver check line is
already longer than 80 characters.
- marvell,ignore-regulatory-hint (current)
- marvell,ignore-regulatory-hint-in-ROM
- marvell,invalid-regulatory-hint-in-ROM
- marvell,invalid-regulatory-hint
- marvell,invalid-regulatory-ROM
- marvell,invalid-reg-hint-in-ROM

Krzysztof:
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

I used these flags to keep everything in the same conversation:
--thread --in-reply-to
The documentation states I should always start a new thread for
multi-patch series. Note taken. Thank you for the links!

Kind regards,
Georgi Valkov

