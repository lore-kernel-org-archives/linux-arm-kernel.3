Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E49FC5B568
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 21:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCauMR496lFcg+GwWLLg188VsfVYRKDTsZf2Y/Xc0nE=; b=ZL1ZZmkudkJOMn1qA5RUmNDCzu
	KTpJjX4fuyXgppb9mmNfpBv+g3W+HZXOqZaBiBQYK2ZPP1ouWtMFZmH0QsgwRfU4zzlIvdWBpORT+
	SZgugAEjmHFS+T0ZP6ky86g9WMT3zuhcC2B8bGT/6y6Tre5O08D90+q8+ZjYxWgcB48Xvfd/gn5Jn
	SqXDoXSuYgkbEID41rZjt60emmd2segklovWnuZE9urSFSUJ04+eAHpRGLNm1O9ITq7fPlggO9b31
	VMgJCW774DEmUbHuKdw11ezzCaYpaYygj1fkpMl2Hv0aKbmKQe0UVZ218wHP/ukwn9VojFqiP2RRc
	UZJyoJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtY3Z-0000000Fcq3-0mwO;
	Fri, 20 Feb 2026 21:29:01 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtY3X-0000000Fcpi-0VFS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 21:29:00 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59dea72099eso2517650e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 13:28:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771622937; cv=none;
        d=google.com; s=arc-20240605;
        b=NTgkrsDKzFWpAnHvwTz1EfAB8f9Lv+6o0lfYjtLkx4YfWjRJVOPxza55qYJfKWoVtr
         3j12+kAU1fdihwDeIYuOnct5Ydwtlj8YxmLbAKmvEj2w0xtfdArzjKVl9r8rYEa3ITX5
         n2hABQM5moG4jCVEnN52hArF3fLzU5TGxvexlImOeVqrCUmlGdLd1MRMGTCyPTig6ywC
         ilYjD/3v7J3p+v9sFDgi6Xx30X+ZitE/OexyNcCRPzoUNTqnTMFO/p+kBA2uePnYuUNF
         tZT7K+CilfSrJDTQv9VbcLGPTE17kzetrnW5dWp0BVrEyfdJ/pDVOs3TvQoRisa2J/oH
         rbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cCauMR496lFcg+GwWLLg188VsfVYRKDTsZf2Y/Xc0nE=;
        fh=W0PlICYZJ8vlwJKZ0BGFzW+gOsb1O4A6xd/yVOPM4q4=;
        b=c0l3e1ZMYL5QJ7hdDmHl8b+FkIlx6yaXjaEsMfijcYE0p746KMXYMZbJpM9pxbHv7w
         PbGtpo7SvMABO4jlejUVCn+SAE8pSu9GFlSg9uWw24BWvyfmK7TvBq/tlFPhmCypWTGX
         UDMsVXLB3AbyQbdoii4pus7CyArfAnZLM+X/f6muMow5ikq9wX8xGjKIO+4DHvfVqbw+
         NOeXJThymoZKfDL2fwDSFLoSUx0oeEAshGU/ar3MWjIHWLPTdvHyzvGRNYeyKqEn7iR8
         hcdeKEnQ3DEPymYurrWrWghDBTI0KFt+RN4IygDIPCtVg/Mnz8EFqZ/tilzCWG2Z1Qnx
         Ln6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771622937; x=1772227737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCauMR496lFcg+GwWLLg188VsfVYRKDTsZf2Y/Xc0nE=;
        b=ZJLgxJKIua8FWTS40E3To1+Ga3+usyeC00RskMhK/22TjKI95zbFbQjOIAd9s7+5W8
         UOsSpZi7jmh/EPnrL70oVltlFsN7m/9ecAGzw8e5K5JtBsN650/hwdsZRtGMCqtESvph
         4K4MTvYjTTHe2bNttbdrR68y66sYmHxqbV7s2zJZ8lXB4egTnTg0h0hWMQCrL9bt6xnS
         U2xKYeZyfVk3bMp3RYlZ2jb0DbzHA0gcwyUPXyYTPfxZ0DAIHWdwNHuo5e7LQWU4GiJp
         6MkF1Stzm+5cKSyPduuOEIqAVOKZHyyRoalTGk3eK+mgIj57qE9Ef6qwasdCGcXseqa8
         ywWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771622937; x=1772227737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cCauMR496lFcg+GwWLLg188VsfVYRKDTsZf2Y/Xc0nE=;
        b=H8xdTvVHY64xjHCOC04Ov9z7FYred2/q5EIkEjcbQDy+OFLE1dkBD29kSVphOpO3bD
         uG8TuB6dNPa0ruXnWTCIm5AVVC7LE8DGLeYGalXVJkvm3bOOnZDRpm/51DbblSzR5WMm
         Q6nxmiKqcX7bOe5zzq6yB2SxfHAbFqTIbzAETyGtAxAY8pBHjrnmeA03SCeGhcYFqJtl
         NpsgAZyST1DGP30dhV85jo/BBP09xT/uIrpXKEUhh0PGPzxb5ockif64D9Z96nOFOMKy
         zIilzZGi/rOSo748qHcbS15W/lL7Ub1TzS9D8WhpsOsWMRE2XMYADv0hkMr0MRFmM+89
         TNyw==
X-Forwarded-Encrypted: i=1; AJvYcCX2hsiC7R5o5BnWs/hXxi4R5AnKM5LkbCgGd3YajS8uniMWS7Npv4fueJjkIe0KQ9yHIcRXj8fBsqMyHYnCVQvG@lists.infradead.org
X-Gm-Message-State: AOJu0YxhOctdJMjlcbHvrivpwCd0rloJR8Eov9cU2eLp3IHXYFI4G1j9
	9GoU1I4DJeK7Pe6WnB2PZDDRPN/CM5ivbKkVQthd1kqElL83DfOYYbV5TRJyxzGJBhVWcwsMZoj
	qrAW8D9uksxEGAH4Hbm1AlAc2Wn9KYeA=
X-Gm-Gg: AZuq6aKkdxuAwgT36+kTOgsYJp0wTJYEG9qEsBI2/G3IDCKbWspqjOWGdsJw//5M9+R
	udKlHVeu+J7NRHxZTUFouOYdMHSmYzh8K/kxsGIp69TniyqYCXgpnwrcA3PEtE/CaX2RP8xH19K
	g11vVczO7APzIiiSmBTGQtPRseoVXXW78q++dPATZ3RLyQpXYd4uBT37MFNPXFZxz+4e4cY6a8b
	goLnPobAS42KrfOOPEUD7zafJrcYrEqBcCseo0YEZlMCTX4MZoJO3qhYxOohHAUtfxr9/S1Tp41
	EbkeOttl51juv/IT4oYl2a/n9u82Zg8XPAFjhQ==
X-Received: by 2002:a05:6512:2316:b0:59e:37fc:fb56 with SMTP id
 2adb3069b0e04-5a0ed8a4cfbmr206199e87.25.1771622936453; Fri, 20 Feb 2026
 13:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20260220021353.40554-1-rosenp@gmail.com> <20260220021353.40554-4-rosenp@gmail.com>
 <CACna6ry+K6q_JY84j7OjRWALsUDU87mpAiikF7cpUGDUUYhZJQ@mail.gmail.com> <CAKxU2N_V=VWXtpj3qYcPQ-SOYDyA+wrg9Mb4AZvWMQUDnARVFA@mail.gmail.com>
In-Reply-To: <CAKxU2N_V=VWXtpj3qYcPQ-SOYDyA+wrg9Mb4AZvWMQUDnARVFA@mail.gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 20 Feb 2026 22:28:44 +0100
X-Gm-Features: AaiRm52CH-GIQpgAj_Fm01cIzdj6T-W5-pmlyWK26JbIMJLyYzNUxSuOqjs_IWs
Message-ID: <CACna6rxOYo3-G9msjXVyoc0jyJRMjUjMeOac6+-bZvD2MdH4tg@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: bcm4709-asus-rt-ac87u: specify switch
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_132859_180005_4FF22209 
X-CRM114-Status: GOOD (  14.33  )
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

pt., 20 lut 2026 o 22:18 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a):
> On Fri, Feb 20, 2026 at 3:18=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@g=
mail.com> wrote:
> > pt., 20 lut 2026 o 03:14 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a)=
:
> > > bcm-ns.dtsi specifies a default layout that is not correct for the
> > > RT-AC87U. Also allows setting the WAN MAC address properly.
> >
> > How the basic ports info from bcm-ns.dtsi is not correct for RT-AC87U?
> > I don't see you doing any overwriting or /delete-node/. It seems like
> > a standard NS device with BCM53011 and 8 ports (0, 1, 2, 3, 4, 5, 7,
> > 8), three of them connected to no-SoC Ethernet interfaces.
> This comes from a local OpenWrt patch. I just added the nvmem
> definition for WAN.
>
> There's also the addition of labels.

Then I guess someone else didn't try hard enough for proper
description. It happens with downstream code. Sometimes it suffers
from lower quality & hacks.

When submitting for upstream you can improve it though :-) You can
(and rather should) reword commit description so it's accurate.

--=20
Rafa=C5=82

