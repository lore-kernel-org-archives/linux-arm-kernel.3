Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A75FC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCIY2no7DhEyS/En3sT102mrkSnOI0nEyW7oK9Gl+sQ=; b=LvkNeU6y8wtfOl7oGQzdx47td6
	QC6voMJLOpk0yIi+uiG34RroLy6MWGDkOzMArKggeCVNBehng7zfjr9Hv6ZBQV33No3Uhwl+r9e+E
	XiCg870ymlh4F/qYQuFlvl13Uw3wqq8W2ievra1FqjtfOuWPRPDYjitSojxHReRrmN2aK12Nvp008
	nINXvHUozuunoQj0FCjpd2bstBRnOYyZHBXPTS2/wDXPws9aTJ6uOA6FD5L0ddzD3nzmNgoRtoiXl
	RnaSxEBTcxlhIVchsGMFmMJCEZcswxFjfD/FaeaMs2GRpNSMtzlW1hcZWt1vpNPtWtEcMZrlFfZGL
	8VsOJAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMtN-000000080Wx-3SsQ;
	Wed, 26 Mar 2025 09:17:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMrd-000000080F0-40ck
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 09:15:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so39036575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742980556; x=1743585356; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GCIY2no7DhEyS/En3sT102mrkSnOI0nEyW7oK9Gl+sQ=;
        b=TAwAmg1h5eaipqmou+vZr/tCBGWl8Dv9yByJCNnLOwJ7t9UAHZfYF5yZIhbslDsuQj
         J3pO0ou9zFVJCSJ53z6QeKN6Rwk4KhfATSulLySmbEPN527z38c9EIn6uskmOyBgBjqe
         rvP/Dc8RGLsitW2aIRNgr/OtLo6kROlx5nmQcc7CkW5f6ZFKkEvaaNf7ASWMdbvR8/r7
         JmrrUi3/GKNmOjsQ1vSDPIr8I7kae8xlDcuWP5hFhlHLlnp7mipjU7ImS1ls6DdX6Hof
         nDWcJr5nptPcyprBZ2gYNzcwjhlchofupprMmKsSgNPa5BMkMEjNGHrX/SNNAOaFbFPp
         RSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980556; x=1743585356;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCIY2no7DhEyS/En3sT102mrkSnOI0nEyW7oK9Gl+sQ=;
        b=mSIL2iQgPFckqXz3pHeVDRvcPgu6ohJLBiVzehvcykubCsWhkaKh205Rzu6WhZE8oz
         B6MZeA7CxVeCDERNDEKv4yoNJ9D6kxbMsBsP9BhEHvKBSpsb/bNaPEK9HTtagHs4PDKK
         9voQvQbC3xrGH4RZFikn4RzqmxSd8AK2ZS7DjJ4w4hpJwRlYKpCxYnftQAziP4ChMliy
         l98PLj3OUIos1PCUnT4Ay0hYv9/U/TDcJyyZn3MrbiZb9/2+hqqt42olSigtBGjBeJol
         nq7BqeFQLB0SJp1Hg0I/KTJ9Q2LA/52Gv6IC1eF9cdYw64m1MyEIX0I+amzhMjPq9256
         HJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrVMvW9PKMBeIDHxthQmBmYLDJcpowkMRF9R/l9rUQRZwrtSp5FCsHLbfps8Ss5YZMKs4dt66t1yXmRAMG5L+k@lists.infradead.org
X-Gm-Message-State: AOJu0YwWiXE3G556I+hI8+HGUfPfYSy1PGd1vQ33qQ/VWfJT2uuwpvkx
	hNvvGU9tjbIx4lFygpZWzEaeqlb1WAumEY4bBr/HKPQvIx3vRSn2RrE8rHnSsGw=
X-Gm-Gg: ASbGncuP3AIUgmDjZIUTTn3M3SyqeFLzbN7KBlaZwJnhqE+UeNk0i6A90O9/jO6wtCu
	NTiu0UJR4daPlr6Q72MCjPyKyrEnfLYpdVNxzn54MOAjrhASHYJylUzTCQYntziuCnju6oYhT5G
	l4gQjcGywCGzxAVrBE4u4ntn1SarE2Qe9qBVcLYjnCUxqQ0ycw23Z2IKavtUDgyVZiHV2w2qt4k
	wWAm6ne2jQcyAalPHH4zOAJw4VEDShTt53wqTUEnvQGJeiRRsbTlCIwwtiaCYmShVMOMp7MTn/h
	OdM54d2A8jYf7G22JgzZZ04hy5IFiptJPvV2SXw6Y7Gle1MFKA==
X-Google-Smtp-Source: AGHT+IGx7e5C+Sh+HHT4ZLhJxYeCSMGqOs/VS4VI7TohJ8fgltfofFctJegQ4k3N2nPlKvOkPunClA==
X-Received: by 2002:a05:600c:3ba3:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-43d6ce18becmr59665045e9.3.1742980555577;
        Wed, 26 Mar 2025 02:15:55 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9e960sm175393475e9.29.2025.03.26.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:15:55 -0700 (PDT)
Message-ID: <a4928b0f7b54fc6e3e80f7130b466d5d493b0aa2.camel@linaro.org>
Subject: Re: [PATCH v2 2/2] firmware: exynos-acpm: allow use during system
 shutdown
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 26 Mar 2025 09:15:54 +0000
In-Reply-To: <4f2252fb-841e-46e0-942a-5db9767db89f@kernel.org>
References: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
	 <20250324-acpm-atomic-v2-2-7d87746e1765@linaro.org>
	 <be580155-372f-445b-b9d1-2dc4fbf1c3a1@kernel.org>
	 <974ddabee5a2a43b9d32f382ec4b13afab066f1a.camel@linaro.org>
	 <60732c52-7774-48c6-8ec8-44ae82d86267@kernel.org>
	 <42905f72-100b-432a-becb-7e1f835e518e@linaro.org>
	 <4f2252fb-841e-46e0-942a-5db9767db89f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_021558_007223_923785DC 
X-CRM114-Status: GOOD (  29.32  )
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

On Wed, 2025-03-26 at 08:36 +0100, Krzysztof Kozlowski wrote:
> On 26/03/2025 08:24, Tudor Ambarus wrote:
> > > > >=20
> > > > > What happens if system_state is changed to shutdown in this parti=
cular
> > > > > moment? How did you prevent this from happening?
> > > >=20
> > > > Yes, and that's also what the I2C subsystem is doing, AFAICS, see
> > > > i2c_in_atomic_xfer_mode() and its use. This is to make a very
> > > > specific corner case work, similar to I2C which has to deal with
> > > > the same issue during shutdown.
> > >=20
> > > But they don't have a choice so they try to do the best to avoid
> > > sleeping. And it is a subsystem, not a driver, which means their
> > > patterns are sometimes special. Drivers should not replicate subsyste=
m
> > > workarounds.
> > >=20
> > > >=20
> > > > Would you have a better suggestion?
> > >=20
> > > Yes, you have a choice, you can always use udelay. Driver code is
> > > supposed to be always correct.
> >=20
> > Using udelay() is good enough for now. I see that downstream uses a
> > usleep_range(50, 100) and I'm concerned that we're going to waste lots
> > of cpu cyles once more and more clients get added.
>=20
>=20
> If this is going to be the case, then we can revisit it with some
> numbers. Especially if this ACPM turns out to be a bus driver.
>=20
> >=20
> > If there's no concurrency on the ACPM queue mutexes at late system
> > shutdown, would it work to pass the don't sleep requirement from the
> > client to ACPM and use udelay only then?
>=20
>=20
> You mean the client will choose what sort of delay it expects (sleeping
> or not)? That would work, but can you actually control it from the
> client side?

I can know this requirement from the RTC driver indeed
https://lore.kernel.org/all/20250323-s2mpg10-v1-29-d08943702707@linaro.org/
but a) I'm not sure how to do that with regmap, I'll have to have a look an=
d
b) if the concern is that system_state is changed to shutdown while one
of the (other) drivers is using the ACPM (as per your earlier email), then
having a different API wouldn't help I believe.

Cheers,
Andre'

