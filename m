Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3968FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqerFP1ZN9krhO+NQgHUFbrEHV8W7RtHQhpONw2B/SM=; b=KldO3B8s3Utd1DT1YvUMcJzrEo
	4m4DHvh6lesImtLcAZAbWf7ULe/2bK8eDViqSbh4u48ZteLA5fwzTGid3rj/4KsSORI7VmT9u1p0r
	CRvFEkHSB5NKe9qNZrJxxxDys+nkp95R66CR+y/5JtjRbWkqZM4uZhoeclLIFES68dICriO/9fzQ0
	eKrChUXTcW1FV1XX3ii5cDiVM13K4JqXCOYmQTujXAsBsFRTAJ3g9e/FERJmR3d68BXZUBmCfwLum
	yzNzskuKTRcBZAxImfEbCg7wXCsU6lzKBzVnEyi+nsa7sr30ohwQ+nZJtwC1HR/92DgOBGgtlfIn2
	rVzfUA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNo8G-00000007lqx-2ub9;
	Fri, 15 May 2026 08:42:56 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNo8E-00000007lqA-1Lel
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 08:42:55 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-651c5d525f6so12142449d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 01:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778834573; cv=none;
        d=google.com; s=arc-20240605;
        b=XzS2DUW8DQK3weVpgMV+IETP7EJLtVR+S8HIicdXqRfuXcwbB+hQY0FzyV1NXi48Ok
         fr/p4BsaazqYQIOD9IVMBBom/Gduk9s6yllCxbuVm2eszDTRm/aoY+XHUkBf9nr+1FVi
         O6yIKQINlVdV8F1n/ZCeyYq7uvCgKSIBQzoqL8qxAlfC9USLN+VRHgMWXKt0qVQFbSEU
         KVOxK0v2fiHzf7BdMrQANufRfvqBFk99UaiYrxZlxOET/p2HPfeeIaUKwAAtXI5fgD4U
         vvL3+X29R/wg9ltf0YZakERtoGQx54oR9UOzfy3VHCWSvL4SwxwMQRdoGj/xv8jaZvS7
         QbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NqerFP1ZN9krhO+NQgHUFbrEHV8W7RtHQhpONw2B/SM=;
        fh=J16BTcnymVAPlXaTvtzFN0g1HdsqSsKU6zzvpb0hYQE=;
        b=N25/kv4BWNUeYkWRBPWZl4scMfr0x/N93aJr03iNNzzGHX2YZ4X9xXCEbImTq+ar8l
         /IKEOaKk4Z7WTu82+62m6B4WBNoTsWsCjgHRXlzkrnd2PMCmoE/O+rF9fe/0IaPszG6p
         BrZSCMXHfcdBbEh6ckbhvQ32n2OEzcBG976hNg6u+Zv4SXUib4QMYAfjXxVv7cGpREFt
         6qao4ziZSfDvxH24mITjUD0edB+kayb9PVMJwFRXfRg2+STAXXlnI/KuJTS8kCL0Ynxv
         YwbkF62Z1qOLQnE2XCG3NqrnpV6WoO1gHQcRpfioMwB91qnjgFOzrxdwjRqpjKxixqIw
         6fGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834573; x=1779439373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqerFP1ZN9krhO+NQgHUFbrEHV8W7RtHQhpONw2B/SM=;
        b=Y6uObfvvBU5/dYRjkrIxic55cB7ZAdiXGMaZeogsqYHbna2wE3TNxp0dIlAWgOgKms
         Ua8+7cLhTg2AYS0LS3zP5CSX9hX8eevtyaNq85ExwBZgVKjf5RXKeztx5zs7JOeFZTA8
         7AwlIHvfuTfy9F7h75TzFRglH0jB/6u4NdBBk2Q5DnjFAFtQBONSIqEDtlxkicEOaS6K
         1H3tIjDIsmi+TwJ0YC8huu8jnxUF74H9JR0G52RMdCYKU0YY6bApifHrHgNED21XKxvU
         9vklwXuUV4pqRAgR1x8b4gUJhFMaIArqUKTkqukiXY3xOPjICMYiQVqf1qomxvFyP40E
         meSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834573; x=1779439373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NqerFP1ZN9krhO+NQgHUFbrEHV8W7RtHQhpONw2B/SM=;
        b=T8OPUH3lU7xvBQohyMSDa47eIu5nl8C5g2UxBZS6p5hmMWGGm9a4ZcDvNFsdSd8fza
         q6WKLMDP+emjhLTpupkvKuWxCfXVgVxyvJ0UCwStkEN2rFD3A3wtuBSLOtjG6e5jSCiQ
         VRbTvPvf3Q3XCD3JAnTHBqcBY9y/jU8eAkoDgri1loAaem27/IB/LNbabUYyNF+8Tcfx
         07V4Lk4uEL3Gh0ACHIcjy5ekWG0dOHDANns2fCD6SRnMfT4FN0XZQta0T/lFRcOClvxl
         MntEGqmJLAYMD6ioj8eGiuUfoxMdVwIenMsyZmLcp9xtaQQOsD0Rn3leB4OXNbJbIyMH
         zMTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+77qag+cvvEw/Pfo9wsaPhtvzbHm++5EnpqCKxcnx773zvMpxsuPCgI8OTO+vnjoB/LaumYKV2sy3Cwrlcv+0Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwccA+rcXB+S0cla2mOZEhMb73Twe+Omg6OTXuH5R61kYbFtWsZ
	f0tV7HxJwXQOTEWU/HCnBpL1idnJmDFRsZx1XSc8IvwU6ay6I7If+GUvDhqYzYTwYyQI8hUenhn
	v/n2GH5oMIGRdaW8r+Ukt8QucEdiwhFw=
X-Gm-Gg: Acq92OFmarDzxuPpagtUSo/uVHGp+0F4zEpyUOb7B3wKxGuEc0ds9Yen5K78fOiPxdP
	zxYt3UfJZOW1kMzPUmzhb/xRVRYz4bQTFft4qrGTfYGj6YR6a+EcJuyVcnYMBuv9u4X94Fp2Bdt
	8HNuJgC8GqGZ0utZOEOpioJyQDLeptdDSKCtnBVZUjfTAbObw+LUltFVW/W0htu5YAplWa9bWCM
	8Tw4GnxRWBodYinWwMLNmfk9QEMBd5gF1ZhMzq2+ZnLlLfG3Io4O2l4jtGpy0zbM11Tv/UTR8jI
	yQZ40qLklFMeVAJ9kqc=
X-Received: by 2002:a05:690e:11c1:b0:65c:4b93:4261 with SMTP id
 956f58d0204a3-65e228e2050mr2929469d50.64.1778834573102; Fri, 15 May 2026
 01:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260514103740.5416-1-chaitanya.msabnis@gmail.com> <1ce483f8-1d9a-40c3-a45e-6ca536010b20@lunn.ch>
In-Reply-To: <1ce483f8-1d9a-40c3-a45e-6ca536010b20@lunn.ch>
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Date: Fri, 15 May 2026 14:12:43 +0530
X-Gm-Features: AVHnY4JEjymFDabfng7P110Y37cdzsT70TLrv5QMB__FOlUHUuBPsZy2L1nMErY
Message-ID: <CABjkosFHLErOziCrYhJJxtpMg01t36LqAfr-zz1wE4HSZhfzFA@mail.gmail.com>
Subject: Re: [PATCH] i2c: davinci: fix division by zero on missing clock-frequency
To: Andrew Lunn <andrew@lunn.ch>
Cc: brgl@kernel.org, andi.shyti@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_014254_368149_88CCDF0F 
X-CRM114-Status: GOOD (  18.10  )
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

Hi Andrew,

That makes complete sense. Updating the macro to Hz is a much cleaner
approach and aligns perfectly with the expected unit of the device
tree property.

I have track down the original commit for the Fixes: tag and send out a v2.

Thanks for the review!
Chaitanya


On Thu, May 14, 2026 at 5:46=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, May 14, 2026 at 04:07:40PM +0530, Chaitanya Sabnis wrote:
> > When the 'clock-frequency' property is missing from the device tree,
> > the driver falls back to DAVINCI_I2C_DEFAULT_BUS_FREQ. However, this
> > macro is defined in kHz (100), whereas the device tree property is
> > expected in Hz.
> >
> > The probe function blindly divided the fallback value by 1000, causing
> > integer truncation that resulted in dev->bus_freq =3D 0. This triggered
> > a deterministic division-by-zero kernel panic when calculating clock
> > dividers later in the probe sequence.
> >
> > Fix this by isolating the division so it only applies to the Hz value
> > read from the device tree, cleanly assigning the kHz default otherwise.
>
> Why not keep the patch simple and just change the value of
> DAVINCI_I2C_DEFAULT_BUS_FREQ to Hz?
>
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/all/20260514044726.57297C2BCB7@smtp.ker=
nel.org/
> > Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
>
> Please also added a Fixes: tag.
>
>        Andrew

