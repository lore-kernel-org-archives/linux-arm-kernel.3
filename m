Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3621090255
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0eU5c0HgKDSlNJCITX3MHjJtcSK/SPj94MpY96kAVk=; b=bKL4Mz4ItpqqRrXG0Koz1VvSd9
	UuCkwiG3mHLy2qXGHD8d7XLpX2TjGExZ57WbHWASX22tDYK8LaQ2XxTagqUKNCYMgUVTfuhidLJCw
	SE0uCvBUOT4xb3H7f9+f70Xf4ZFHfbmaUKVxIIi+fdPxZjpWNwYFsGHxSIzf/QoEh0447crlTEDSi
	rUx5WhtpdsmdGkVRLsD8mU4vHhi7W0kbbWsLLt0wwt5YiNHs4zQfVpQP3/i8Dv7pIFIiuDyjcbp0n
	SH8rW4UjLnwXUB5+rRAQ38ZBl6N+IdcuUZU/Bo9o/YAK6wuJ8wfDyhO+zJcWY45FpTa1Ig5fuLjw9
	4Fb9JAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GT8-0000000B6WE-01wH;
	Thu, 19 Mar 2026 16:43:34 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GT5-0000000B6Vq-3roM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:43:33 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so7471851fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 09:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773938609; cv=none;
        d=google.com; s=arc-20240605;
        b=Yfr5D8BIacxvP6JsfjtpIaq45jaexuNdqpNzQ4QIf4e5BgFxgAwKV7PGQMBXr/vjau
         xXNLIDHcrnZg7T5vwBJfBGi2lkEBZ8ExQmtY/eF1317JT+EZIQRXsLqHONM4W+FqQAZA
         +WILdeJ/7FQr4bEgZ9lEyCicD1p7Y2zazMMhisaq15+nwyy9YF692mZt+O5Djve38s5V
         pdx01UPJAdNpT99CmRHj+dJ7dD0Sav7gk+QGU8ljyrla4tiyXk4zzRc6ZL2zXeVI9e6Z
         Jabi3Ygfo/iphkRU8KXSLSOG4aEwwt7KGzhnKgu2WKeuSIPnauApBWxecKhfuymSWHAj
         kkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0eU5c0HgKDSlNJCITX3MHjJtcSK/SPj94MpY96kAVk=;
        fh=wGmMgO4H1ks2Rq4sHFewJ2NqK99tUk0wbemNLdCBaPQ=;
        b=XWRCx5Mb4dH6A469DHl4c+2L/hljz/RWaYFdwK/RyH+NjdJOJcug6bMfQSrmXxalqC
         mPHUUipVj8QgAhwtWOe7emnsBdpQ0jGbJGjaaRK8XCRf+JRulQcaqFCTPWiFNopfxWfD
         dzabZfQhLVF05P2rBZOQd1qcbQXXHdmx14JVAvNHYh7UhRRw3/NXefqXiabwyQ3Fdbi5
         fgQLfuyCYDF5lz4oxZ1f6jbp5i4R2uiwIBhvpeb+oY/M6gaGqry5w5BT44xdtNX9sBvV
         0leAaJeedXs2rEDOtyTkvNDO6J9N2attYRPrZ7gAdGBnxWWw2gXjMjQZbnwuoVB3CVNr
         0J1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773938609; x=1774543409; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0eU5c0HgKDSlNJCITX3MHjJtcSK/SPj94MpY96kAVk=;
        b=zzb7h61Py+eWTSu8uCq+A2FsyC5A2hqavNH4OLVgAVkPV2AO6H0ixs9M/ktdZbjVET
         LCekTTLKT6xBifGLhhcSUA8Dn4C0bx+FJZl6gYtRdYMMbF+Kox0cqkmeXOu3zK4b7py8
         GmCwaisqy7QvhrpbT3Q5l7YQ49Ux1HpydfjzzqC21xT0Wl+Zq5OE9Hpm0Y7UISJ9x9xo
         76Ac43bXRgdIWcDtNU1jc/ZgBryU3NVXQI2vyj4HLwNsyA8PMmBqaZB3PsqHMJkI3T1y
         0hOxMsNMEn8rtjq3pztrL0CdNaR38I7x5X5Pfv3Irb6FxYKt5g9El1eGJqdSFlWx1bsu
         7fgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938609; x=1774543409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0eU5c0HgKDSlNJCITX3MHjJtcSK/SPj94MpY96kAVk=;
        b=TGoZtBWhQ1Vn6s7gg7q68YHO3dHKSMpS88U9XUKBF6mZtefPfcm5msTaFGQSnpxqKE
         cifqg15+3Mlxdxzaar8tO2ei9kz9rvvPWWnK7SRlwpLf/bSOz81vPl+NcR5oQcjYwyUW
         b1brmxmceO5wZDfgs1bVeNyn5Kkh3j0/7rvSOtmui8OQ1my6oYrd8deFhX7afqyWn3az
         Jg6MaKN63XtqLcyEtvKff7Ex6psvBdzm5ij1E9Gnz802qS3LLD7x+b/nf2/Htenxvmkf
         HChV2eXCP2nCsMoUYuk0XKcCmC9YKgt+CQxZPqM06Nytrd0ejbDG0Me2MBcOGn9fXIQ3
         tJGg==
X-Forwarded-Encrypted: i=1; AJvYcCXXSs619/j/TZWzmDN2HPuWwfq292k7Z+RW1OxeG37fxDHQDt4gwi1YVW+EhAe3jaY0syUfb/6rf3BVdLrTqfk3@lists.infradead.org
X-Gm-Message-State: AOJu0YxoBtMejQ0SO+2csjsdSrlsluFTMUZwqyJnWYOeAC+D0Jxz6nCi
	wUNOuwpYd5Y3EQqIzft9G1UBqVLSPvpHw1+nb5Wzro3dF5ZP1eeg495A3v5Ost2sD9TT5jmW6g1
	gJ8d+3EnQ2ksWn1BMn1VBbL2lIHV30wpAcVHpT41Dqg==
X-Gm-Gg: ATEYQzzItM5mJBWAzoj87ink2W3RQxGJuDpcARVgxiZud0EBoUTwEm2/rWHTHgj1+z9
	B/eAl2/l0r7O6Qe58D1SL6vpi4pQxIIuYkqZhAP7DAwx5SHpMyn0a0jsm/p/IsXjNy63cEasGYd
	wRzC0cM9z/etywoiuFh6c8YaqNVjmBqWeMrVX92jevQ2c2yUKPK4uOzve5abUJTrrNUXopLeqcT
	nJ0XWsYK4NHYPxMralrOO7+XPTq0NNRRBcEZSa239wKlk5LP+axekQubdOIMk6bGGydDfAIDezl
	5tuFL3RF
X-Received: by 2002:a05:651c:324d:b0:38b:f0aa:36e7 with SMTP id
 38308e7fff4ca-38bf96ddf40mr439181fa.31.1773938608940; Thu, 19 Mar 2026
 09:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <20260318-gs101-pd-v8-5-241523460b10@linaro.org> <CGME20260319101424eucas1p2d5dca06240e8760046fb40507ffb3bba@eucas1p2.samsung.com>
 <CAPDyKFrprMSLOBMB_BHbi=j6UXV4dXBn-H8M1BsqDWNSCJwvuA@mail.gmail.com>
 <c5ba58fb-50f1-4067-a099-97169ea81f68@samsung.com> <ae31c62c940e99077d44e1935465dce7db0e4c06.camel@linaro.org>
 <4809918d-fdf1-48c0-bc10-fcf75837cb81@samsung.com>
In-Reply-To: <4809918d-fdf1-48c0-bc10-fcf75837cb81@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Mar 2026 17:42:52 +0100
X-Gm-Features: AaiRm53oqCm_eJUl4m-8pk5SCQoZ-_Pm5z0ieeorC9RntVzrStWwABAEThg9uu0
Message-ID: <CAPDyKFp8zsbgRA746Sds+1y4C0FvyohF7AFVsEghVkhukGZafg@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_094331_985172_C88D8AEC 
X-CRM114-Status: GOOD (  20.46  )
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

On Thu, 19 Mar 2026 at 16:57, Marek Szyprowski <m.szyprowski@samsung.com> w=
rote:
>
> On 19.03.2026 12:58, Andr=C3=A9 Draszik wrote:
> > On Thu, 2026-03-19 at 11:29 +0100, Marek Szyprowski wrote:
> >> On 19.03.2026 11:13, Ulf Hansson wrote:
> >>> As a follow-up patch on top, please consider converting the open-code=
d
> >>> polling loop above into a readx_poll_timeout_atomic().
> >> This has been tried and it doesn't work in all cases required for powe=
r
> >> domain driver:
> >>
> >> https://lore.kernel.org/all/5c19e4ef-c4fd-4bf5-88b3-46c86751b14e@samsu=
ng.com/
> >>
> >> Probably a comment about that could be added directly to this code to
> >> avoid such conversion and breakage in the future.
> > I am planning to revisit this in the future and am hoping that we can
> > figure out what goes wrong when using regmap_read_poll_timeout().
> >
> > Hopefully such a comment would only be short-lived, so maybe not really
> > worth it? I can add it, though, if you prefer.
>
> Well, I think I've already pointed what goes wrong with
> regmap_read_poll_timeout() in the above mentioned thread. You would need
> to use regmap_read_poll_timeout_atomic() and modify it the same way as
> commit 7349a69cf312 did for read_poll_timeout_atomic().

Thanks a lot for bringing this to our attention!

To me, it looks like the regmap helpers should really use
readx_poll_timeout_atomic, rather than open-coding the loop from the
regular iopoll helpers.

Kind regards
Uffe

