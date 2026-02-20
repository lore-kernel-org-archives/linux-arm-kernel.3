Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAFAC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 21:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/ehpuDLYCSiZo06p7zgUPmNgRW3JzvJYGyW7ub5l/w=; b=uL7srwQyfl/O05F2rZWLY5O0k6
	xf6Ln9Avp1f1u7jo15pQZ9xqF6rSoymRXPsRDdezSWr1ddNmXuCwVRaBy1psZtiuPZJmQYXaFCaza
	R++NgE/sC9NVYEbWeY1enqRoavLCIYEwBkkJeH1iIBhZ+e2YmuRG8R5SnlJi+XJ4XUhYvMungbLIa
	T0RgLGwJj0HlRunoG1zNnkS+22FJIH+ui/Z4mr7MXiFywtTbeTdgC0YmcO5pAJIl1gfupxqs1cjNi
	caahETlIyg0IgFDWiEOm2eoOEy+uVBvLv/PyCV6trQx9tlbfOYUyEO44IyZUuyouczpYdJn4HMxKx
	/8p93j9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtXvG-0000000FcZE-3tX7;
	Fri, 20 Feb 2026 21:20:26 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtXvE-0000000FcYs-3aDe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 21:20:25 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b8fa449e618so403209566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 13:20:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771622423; cv=none;
        d=google.com; s=arc-20240605;
        b=ZnPflZGJP6VjIxZc5rddtwpn7yUFseCiRoPcAk+bZEbcmPRaemSaVufYtIFa1BB5n9
         1NzPuL1c4oBMsOTryI16qw6HaTqI0dkh2+/uJWGkCGSKUfagRJwg0hg5KCgBhjVscntw
         WgXviuw4cfNV3qo5uJiuR2fwUL+4O3l0clcG9ehs01kTZiNJwyesteN6uCYOhjsGZsfS
         3Jarx20fuFZs0hWSE3KApDvlbEtOfInnt4O0Whg+OebwDOWFaDZzEnNMeav+ehh2srIr
         L5JgtPHlWouq5gp05ZI2oGXq+JTH/9ztQzhS3QkNtlJWEt1+GK4YfklqBKfAg6IRNJws
         748g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s/ehpuDLYCSiZo06p7zgUPmNgRW3JzvJYGyW7ub5l/w=;
        fh=8eflA6RcpnHNt3sjc1oK11/v0FRmNEZivOSVdHdIJqs=;
        b=hOFcOSlBtpkh9thWdHPMQub/5Ro9u9f5AgpPGDxJ4LCsp+kIGchp3sTNzwBFXhHvqZ
         DMBYuEhBD/zxNYVNVNggPhpZwNnj/VgTUxzyipeFyWSE5k9tZyoPFeYZlr3bis+GbT+S
         L8NvFJ+G6lhbSLHQI1lBnhs+ejLikiSALRRN5C2nJagJ2TZZvopvMyo6K9UoXtng7mwI
         X7NVpcjg78R84x42mADBEA77OSEiPXZfmgxhVoqHG+DbWpZO8d7j4krBHsOrWsrs1hDc
         70bwF8w3c6DZXO7FYSnAFDy/qHKG+CcaoWzw00YJ5KIGEh55ZYBYMF/M9SLQArXb+uV6
         +YNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771622423; x=1772227223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/ehpuDLYCSiZo06p7zgUPmNgRW3JzvJYGyW7ub5l/w=;
        b=HeTh5blGWFArO4M34BNPC983VWWbo0OVtXwKw0m2zT+nCqxB1Cjj4ZkjstVFLFL9dR
         vM3Dz/Hw+jB5NSQjWvaNTTDJ4JYpXURN0KVUV+8gXRa4aYgBwSQkE/MyBrDG7X1kmYBh
         HCO2pUTL5rSm132Emq+cvYuXrXeasEcveQCQI0urnn9NlJ1kZesFmHwCXy2Gtb0KglgH
         PL/hQ8QQ+9MmOdVV3W1g9ZPBU9Vo1s2iLzhOFGYxKUx3YNurVHVyBpV4SQotvuXxVHhl
         HlpLqvkSM0cjS8KyqSqwuyHDfP+kB50mgBRrThbDbDzrz4VQu0YOK72yl6Wmftm4wTjp
         Z44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771622423; x=1772227223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/ehpuDLYCSiZo06p7zgUPmNgRW3JzvJYGyW7ub5l/w=;
        b=piXXeh2Oey5TQkKsERDmxhu+EDM8tMZWd0WvzrdZYwHYLR9cqASvkj4hzMqUmHZnuW
         ImOAKWXa2zSNmCFoDWFOnz2LrW7G+KNVmNh6LVSGCgPTVA7ZO/2gnOGoPH1JYG2+kOMJ
         R5w7VJoOipbqejOUp2ueOp5beMrNoGyDsqoOiqB61FbHfa6dCFVeDZZt6nhL4LucOBdG
         r5fzXpdNVxiLQsBAo0l02KS61HsgNvLSMcVPTUAc2+atqBMP4JPV5xGrBu4EGHTOEQW7
         h/FAe/pCdw1RTIRWIA5HU0v+yojjB/u6WViyfHSv8jCtXrknJJVffpAAawXHSRWO+8Pg
         Vv7w==
X-Forwarded-Encrypted: i=1; AJvYcCU+z7Xy2F9CVBZespUBFygdEAFy1URxKpSZEElLmvT+NXhnR4W9W7rI0GsNgOnDIJWo+Wz58m/tLi7IpORcSZu9@lists.infradead.org
X-Gm-Message-State: AOJu0YzAE7bkFELSf0vDkr3A7qG4hmvIzrYflILY9A3PfQERnwcwDY0d
	VgXqPKzPYAaIxYgpimY19A3xt0efO0hcrpW/XRGWgCfi4vCaqlMiYGmNwP0+dq2DoJq2rWZEgtX
	XMej5pkzI9urbhUrceiPmRbxYSdX6C6g=
X-Gm-Gg: AZuq6aLX72pTy6thMp3B44DP5fW6S1rcdbKOZir/tX+p+iVUYrF1j95llTHRd7pbMz+
	n+H7FU8pnFn1JWIrrIYAHQgDerBQApmL3w3Fq4s1fXTyE7VGPfMNP3gumhGfYU1sIKSHDbQtLoa
	1SUjDCXsKYTDQFqvP3Gc3HEreLAysQzyEOWju/Rp4Vo1+1TbhmJZwpXrEaeU+sWhUBPG1GeiWwo
	ooZ512fYMQ1Iqp3kG/Os4CBOTfUCtVCe4sjUhWoBHKX2Pv5N0UrlcpZvUGH5yWSMb90H9ZTTP4o
	uW6bd7abp/dFUvuhnD+JZb9o2FD3ga4=
X-Received: by 2002:a17:907:26c3:b0:b8d:ce06:8a25 with SMTP id
 a640c23a62f3a-b9081b3b147mr45307966b.35.1771622422727; Fri, 20 Feb 2026
 13:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20260220021353.40554-1-rosenp@gmail.com> <CACna6ryBW-6b0UYaMq12Xf6bdgQV9AxYajb9use7g4o=VK59+A@mail.gmail.com>
In-Reply-To: <CACna6ryBW-6b0UYaMq12Xf6bdgQV9AxYajb9use7g4o=VK59+A@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Feb 2026 13:20:11 -0800
X-Gm-Features: AaiRm524Y8fJXV13-zTi5iMufwXiCDxpkNYZpVDl-ejo11ObH5bRZxuW451l-VM
Message-ID: <CAKxU2N-UYZyUdc70H-=Em7ydBve5HP35agu7=pqozFTQo0A_Tw@mail.gmail.com>
Subject: Re: [PATCH 0/5] ARM: dts: bcm470x: set MACs where missing
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_132024_912124_1AF61689 
X-CRM114-Status: GOOD (  14.12  )
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

On Fri, Feb 20, 2026 at 3:21=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> pt., 20 lut 2026 o 03:14 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a):
> > I believe these predate the bcm,nvram driver, which makes this
> > possible. Downstream OpenWrt currently assigns these in userspace.
>
> Changes look good, I just posted one comment about commit description.
> Thanks for submitting this!
>
> If you check
> git log --oneline arch/arm/boot/dts/broadcom/bcm470*dts
> git log --oneline -- arch/arm/boot/dts/bcm470*dts
> the prefix always used for NS patches was:
> "ARM: dts: BCM5301X: "
>
> I guess it may be preferred / required to follow that.
I didn't want to make the subject line huge.

Actually in such a case, would it make sense to fold into one commit?
>
> --
> Rafa=C5=82

