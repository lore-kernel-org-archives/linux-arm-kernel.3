Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4228810D14A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 11:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOM+v3hkRUPIxwZnJzq8Dzd0DMU9QR03z+xYMXNAkMc=; b=BNfBHBnzanKfnHRERmGVIXDEO/
	i2FBNTlBIoyxpg/FjOY0eBfVoM6qHASAk8I9dNsBttnE4dn9wv2SMA43wTfKNCdRLKDLjgF7w0YyI
	yYdFz+JyJgPm74LjH+YOWGCMvoyndzDiKOiAWsj/4W6KM27m/wTsJMXo90e6FHv+8PjTMg4CzOmkh
	FEKUZHgYIc/ialP1hwWhnDOZh1hHz+JqxRPsQhTmDfMetu7ZMwWszojnTl3bCi+8ZNfmSuZhJmxXf
	99ZgPeDfjEK8/6tImZH8YztBaNGdWUOK7+c6DOVX9K1Yxs374Mbplzn31PJPEMZPrZyVkXQrSF/d5
	m/G0cgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AYa-0000000B8my-3PtF;
	Mon, 30 Mar 2026 11:13:20 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AYY-0000000B8mR-0sPY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 11:13:19 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so5179476e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 04:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774869195; cv=none;
        d=google.com; s=arc-20240605;
        b=SAXJldRmFNKs65yTWDEtCuOTP8WNibPDwV8aqjr6JXRWYgqRWFcFDbizBAuT+OL+H+
         Mu9DUbuncc0Q3eHC6gsrUrhxMJh44VDDo7nOpdu2LDjcGfgfdPp5KVmjTxGIlGgyRTSt
         rBqy/c3pk15eiS9fU6u3jqwFKRlKYA6GOA0+M5+COWebCkAVdtctT6gaEiC76gAmxiC3
         9+gVOLk6g7Y69ZJqhOvvCDwuEHoSEUFLvDrJJ6HXob0JNvgbVgMweU7YXBICIcQQ6sds
         VWFpDm7DbQE7rk38HEC7f9ASqJssEKPPDanIapT+uWgDlrO1lYqgyW6f9jrkzIu3D06j
         p+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JOM+v3hkRUPIxwZnJzq8Dzd0DMU9QR03z+xYMXNAkMc=;
        fh=0Z6hYx4T3ajKr6mPrzDE/bN/CWQ+RVH/Aj8ykSEyui4=;
        b=A8C0CSlZvv1zX7NMcl/1+dTm07+xi/vFksay9QCOwgyacQMBJ14igVxUVrT/+QMvYc
         bjBAPjzF+qktCZ3nsck51J9GBjHWP+PLtGBYWxm3SNdPmv4vxfbLH7GYyhosvkxObZIu
         V0KuLoOLyFwBmDD6ubUp7hhOvBIA0+PoEbBtDyBYricEXKYAba0kdYz5mLeaOOBjEo9Z
         FReU/E0vMLCSN1jIPZgI18AbaCfPx4w5jNlqzUlD91sFskpEtINuGWa4iPNhiSIhs08t
         FCKx9/F5udzkqYL8m9Ajr+pMxfWW807Y68OgQ2iDBwB9uMaWGpBf6dbIzOb9lkceChps
         DxEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774869195; x=1775473995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOM+v3hkRUPIxwZnJzq8Dzd0DMU9QR03z+xYMXNAkMc=;
        b=p6Awx+1GtDhPO13fHXSvgVEUUtUMpMPT0MjhBZygrvZAOHvnzbUwIxyLJIu3TEhabG
         r9QFmBgIZ9JPAAOvi1E5Xxhr/5jgq+/mvUriX0TYni4HX6uZqEynNWbRvwSjwK6bkfYr
         u8Xhdx8/dZB6sUvWMgLflZ6FvbRTHC22HLu8O11acngPHHkTFtwCIdO/oNMbO1RzJR0Q
         WoUtee6lNMkOqtxNCGCNofT8TwyKis3yXKbjTRXtWL0uFny3LxZY9AeGaWuBbjjLo8Qr
         kfQPTPhyGSGrQ7/iWgzHJy2Irm8ublf/BjCLjKN32eWj35ZFlz/sVTvisOisM5YZ6zAO
         z87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869195; x=1775473995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JOM+v3hkRUPIxwZnJzq8Dzd0DMU9QR03z+xYMXNAkMc=;
        b=PLRrkV1yO90LJMYBbDw0gfk0xKL/Wjveok6e0ztkQO2Tc+nvjuOW02F2tkI33AJ8YM
         8k2y+F+V67TPXV/ImmyLvr6173iD6plBIBOHON1MKrFapnXvUgWs3wVqMCsxCG4P2w5Q
         mTyJhlsZOBx3QwCyOgDIMb8uO0mw7wFLHOce0IfV0i4aJ3jlSYYL3lRKFU371MxjFxLj
         b9QCrCkFzKuvKvnuFlQih+Y4pCFq+9ai9rxgG9K4LDe4RCQR8u2V5pWmXXb6N4crEIvK
         n3keOmyN+p1jlVRtEN1dwRzsncUc2hs+ItICcKBbwU/SkAyHzhGchKPpF1lvRGVMXv0F
         ktvA==
X-Forwarded-Encrypted: i=1; AJvYcCVS3HfdTT4kN00l4xxm/EcN1r0chpfACVNmXoqS3GpduEZFfqCCp7qDaQWQ7Lt/IpjqFrbyLHLsNLbcEPKNbg1L@lists.infradead.org
X-Gm-Message-State: AOJu0YwLnJ0O8gynVYQXeYyEoizdHeZ3XWA2lUctXZBQLSxEjiENgZa2
	A1WCgM2iJHYcIRQSlQCTthhQE/EeWl0JIAAHTGlUw8C3ezKRYMTLLIqUmYqDEh0c6TJx0f8xUmE
	tArXpAMuXVQIGe9OYBwrBqo50plpCScVhrrMH4zjM0g==
X-Gm-Gg: ATEYQzy+D0CK3dRquTrpTFWE5eAT+dm00xnKlRQ6FRnHaq5H1MsgmNHHDAuKhrfL+v5
	UYGbSyqPLJpQiV+a4dqht7m8znvS35+IuUXl3iHiv6ek2JJcGPwuAY/eQqeIwM0lVtbWlnP0obq
	0jwU90gBhacwaJzPNBYJK52JcV7U+UPIVUXRP/5N/dSFkOL9zAtyYKkyGX04ixOZBfmqzrXBq7F
	mpiNYcBurepQMs/IG9Asv5zJtug+vxSk5OUtC9w+4ZqsFzGZKqHesHiIWwwdJQt21QNKDX77ekn
	8JADpeSAn0AtndSnN5k=
X-Received: by 2002:a05:6512:685:b0:5a2:9d61:f710 with SMTP id
 2adb3069b0e04-5a2ab92634bmr3995988e87.28.1774869195094; Mon, 30 Mar 2026
 04:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <177409907930.268981.5882592990447577348.b4-ty@b4> <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
 <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org> <CAPDyKFrK3NLwaii-9FEmyaTzUAuVkMkLL3rWBQwQvT-M+PzEHA@mail.gmail.com>
 <3bb6b71e-947b-4248-95ba-79852f743c1d@kernel.org>
In-Reply-To: <3bb6b71e-947b-4248-95ba-79852f743c1d@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Mar 2026 13:12:39 +0200
X-Gm-Features: AQROBzCzpsR16OKFH2Q1YSJwCONrrQEcDC_w0lPdIFqdSp0pO1DGRu9LhJ5vXKQ
Message-ID: <CAPDyKFpOPC2stAJ262jdap-=ByY09AeQ0kj6p_9FTGJBx+Tu-Q@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_041318_298336_10F72325 
X-CRM114-Status: GOOD (  28.53  )
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

On Mon, 30 Mar 2026 at 12:17, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/03/2026 12:13, Ulf Hansson wrote:
> > On Mon, 30 Mar 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
> >>
> >> On 23/03/2026 12:13, Ulf Hansson wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On Sat, 21 Mar 2026 at 14:18, Krzysztof Kozlowski <krzk@kernel.org> w=
rote:
> >>>>
> >>>>
> >>>> On Wed, 18 Mar 2026 15:27:45 +0000, Andr=C3=A9 Draszik wrote:
> >>>>> This series adds support for the power domains on Google GS101.
> >>>>>
> >>>>> There are a few differences compared to SoCs already supported by t=
his
> >>>>> driver:
> >>>>> * register access does not work via plain ioremap() / readl() /
> >>>>>   writel().
> >>>>>   Instead, the regmap created by the PMU driver must be used (which
> >>>>>   uses Arm SMCC calls under the hood).
> >>>>> * DTZPC: a call needs to be made before and after power domain off/=
on,
> >>>>>   to inform the EL3 firmware of the request.
> >>>>> * power domains can and are fed by a regulator rail and therefore
> >>>>>   regulator control needed be implemented.
> >>>>>
> >>>>> [...]
> >>>>
> >>>> Applied, thanks!
> >>>>
> >>>> [01/10] dt-bindings: soc: google: add google,gs101-dtzpc
> >>>>         https://git.kernel.org/krzk/linux/c/10084aeadadfab72648f6ed1=
cc78f7cd87b861ba
> >>>> [03/10] dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into s=
eparate binding
> >>>>         https://git.kernel.org/krzk/linux/c/3ec3c42b426fe5e2b48ff19c=
551dec50bc78788c
> >>>> [04/10] dt-bindings: soc: google: gs101-pmu: allow power domains as =
children
> >>>>         https://git.kernel.org/krzk/linux/c/c8229a5160eea145b796f543=
17d6e659cec9b080
> >>>>
> >>>> Best regards,
> >>>
> >>> Usually I pick up the power-domain related changes for the DT binding=
s
> >>> and host them via an immutable branch called "dt". If needed, SOC
> >>> maintainers can pull it to apply/test the corresponding DTS changes.
> >>>
> >>> That said, I am open to whatever you think is best here. Perhaps it's
> >>> easier if you can drop the DT patches and provide your acks instead o=
r
> >>> if you can share them via an immutable branch for me to pull?
> >>
> >>
> >> I did not pick up any pmdomain binding patches. I picked up only soc a=
nd
> >> according to cover letter there are no dependencies between anything h=
ere.
> >
> > As I understand it, they are all related and some even depend on each
>
> I raised exactly that questions but no answers.
>
> > other. I think keeping all four DT patches together makes sense.
>
> Why? What is the dependency?

I defer to Andr=C3=A9 to clarify this for us.

>
> >
> > Although, as I said, if you think it's best to funnel them through
> > your tree, please do and then share them via an immutable branch, so I
> > can apply the pmdomain driver changes.
>
> soc must go via my tree, but there is no reason to take the pmdomain
> binding patch. So I did not take.

Yes, they belong to soc/platform, which is common for most
power-domain providers.

To allow us to merge/maintain power-domain provider *driver* changes
separately, we needed a way to manage the corresponding DT bindings.
That's why I am hosting the immutable "dt" branch for these, which
soc/platform maintainers can pull-in when they need it.

Of course, doing it the other way around is also possible. Just let me
know what you prefer.

>
> But anyway, I just noticed that I dropped everything: this introduces
> new warnings which were nowhere addressed or explained. So regardless
> how this should go, please do not apply anything - it's broken and
> author is silent.

Right, I will await your confirmation!

Kind regards
Uffe

