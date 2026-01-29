Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D282AD61018
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7FuwPAg0PCi+deLDW0+dXgNLEqBVmStAJMhA+lbZ8A=; b=wj67JhvtlbWqMTCJEJM0/RgUbm
	hxtCjCcwTjPkH08PNlltzeXx5gDF+5Ascw4tbtDAx/J7ukCqB/ct+PZMoQDRNqQfysn/goHYkHkdm
	me3saSbTdU/7vZlMKofCPplUcmSUc9iVB+FpfZmQjJrDwZc+1Q8NogbZ4VKJOhJdKlJJjg6O5HnDO
	n1zCkJzERwiSR3qnUMvS3IUqURQqZDUxss+4CnveAH/wOEihqEyphX+5bzxQOmhlXxuFhQ2t7Kpnw
	ndgzxrSbt9dFXzJ4jX4h7n/ah88uRODOA5WkrKURwFbB1XxpaSnsv7bQQMvrpYf/+9k+f4p/kUaff
	lMB4ZsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSx3-00000000Deu-1N7s;
	Thu, 29 Jan 2026 14:24:53 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSx1-00000000DeR-2AVQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 14:24:52 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b883787268fso158981166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 06:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769696689; cv=none;
        d=google.com; s=arc-20240605;
        b=COd3g/k6ik/RqpbNSv1KGIGVwnZsBLR+gczl4KDzpRSSsEmDQUg4LEykbkgGtrbl/a
         NbGFgwaa1X4sd/GKfdjhaGm9scVmDp4l7WIr6dWWFXLKNEjvehMMgdD8fnNO4L+vJaRP
         eP4oqwxJSo0slQbl2mS60AwJceW3zDtk/fsfhMXKL0al0HIW+0A6y3o3oiOWzpSEkIkB
         9bF2tnXNZViNucENr2pXFyJUHcfWWFT1dBJDfIezLhYwqzvTMntOUJ4vc6nS7i4NwOaL
         sTQ4vaEOGJLJJpuQJymYzuLnx6TtilaAa9XPAFGP+IA+L7HN1xErWxTHilIqNtlamEg4
         oTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s7FuwPAg0PCi+deLDW0+dXgNLEqBVmStAJMhA+lbZ8A=;
        fh=BsEhoHA9/up5K+Ac1YPMj5WvwDxkJPOAUnOR7H61FZw=;
        b=e+myCau5dcQYxWnn77hTL6FrS4Qpu7TETC/BHEX3qLVqrs+lHfzenFA9vx1tj14lq6
         zSMmT4+CcruwyukdcZUj9nouvuvuAQZIe0Huc/sXnJb0wKCMnkLFoxgtAKZyb08flqMS
         kKcUDQfBvz2jIfeCZkQA+M/z3dlGSTS1/SGqgnju2Kfg/rzy4C9wsjXbueVCS7L/cEDl
         oJf2hi4MvBasY0AbokML+gkOOjLazNuArKN3queU7RQRlaJIV06NKzny3eKUHsu4VFPJ
         001bTcq/2GvTpHBW3I8HR9FvI8zFvqezrm1wEAf/6YnlQd5CrnysC+jo2ll6NmmherQN
         cgGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769696689; x=1770301489; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7FuwPAg0PCi+deLDW0+dXgNLEqBVmStAJMhA+lbZ8A=;
        b=bKKrXvj2xTvZZDJoUYMsMzNWgrRoDBurEunykNKh+Tcpjk3pZCZnkqK62YmlE4PeJJ
         7EC+EAQiwftbHMtg4pKOlpWrBil9W1kW9iWp4u/hzt4NINjXcF3x8Q+egX/WOwkJIfnS
         hWHebKSFGG6qolYu1pI9V2eOAA9NvxHrpq2vbLBDnLQRUWZRkeRRden2skyOc7/e8fGc
         hnDDXbd/ihNqEpjihV3d+++CLk8xeJDK13dldYkhs1FdKbY4sk9t/tbusQM3DesyhAZ/
         6TmveLmkrIfKnQN9TqDuq2gtvJqnI1BUS6IYx1nB1EetDPZehLoYxbPcXG0iooh/rzST
         4s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696689; x=1770301489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s7FuwPAg0PCi+deLDW0+dXgNLEqBVmStAJMhA+lbZ8A=;
        b=YfIm6gnciLoyXC5L0AIeTCiM5AOFMzaqfS2hRqrjK5SHgAsH1r4JPvJKwFfUEFKBlG
         8h3L+GqvxkUbCuUHdhSPl7GL/HD8IbF65e7SkNsUWBuLVj5YnuYgF9x0xFVQxdhJXk1+
         hh5uKzChoEiKAqnikeKvWCO9MmKvEziF1vLNrZY3EBGj37ZBa0CN3NXTUjAF2qi1PpRN
         TuYT123kNfwbHdckzhMPq3GKYUojocJuLLBVPWq4RwLwrmkoR2zx6afoUcTxD1juAUge
         a7R014Dt8sRqLezI/LvP6TpfCDZdVIxtO2hBNexZsewdjlEQ24iHfxuFgDFwyVvQa8M7
         vPUw==
X-Forwarded-Encrypted: i=1; AJvYcCUmpjpOwlAIpa7mpLOS3owKQNqc2nU0BoMqyWHrXc+jN4hlVX8jd2GV/SLzoxUqOCTh76aUHXr0xuftwYxXGnyj@lists.infradead.org
X-Gm-Message-State: AOJu0YzkNu4WXXqvJfjSlyq0QuU3FCqG/5XoXsGEVdsDkVSwuFQ8ufKy
	ksELc9pzkaJBicpBap73epG6w+tiTR9bY2eTW/HVjfeEf9A7e3YJlo2BYteAqMOkOs65pPdYKEa
	27oHvrze4YzbSn/Y/+Z1MHRksxaAmsrY=
X-Gm-Gg: AZuq6aKvXdwhAoFXoJAKhsdjyFLeD5fb4IyIAH6tRUetUwt5GOOZR7Tqnd7OxSNYIRg
	bN28qTC9XiDGZCPy6347y5VhzcQj7V9h9S58qNsl4O068FyHzSIsAtY8uCFiYa0nul3OgEog2Ah
	ZM+5p+LZDBNJWlzl+iYx+2dhCzaOqUrZ2rrz0PGqbmfT7IH2+rFRbWIOlXwBlzAzS4ju4cumgE/
	d6xQEgcgRv3TiWx0TkE90cDspVCw2TjtN5PTSXaOqcx1oEluyJlrIt6bK0FSWuRHjRSBNIedZmd
	vw/Gw2weIhbq/j1+hPWKo9B80L1rdXpLhudt2jZod6RtqdZMh4q6DDNt3ikqoKq/YpqNFxI=
X-Received: by 2002:a17:907:c1f:b0:b87:2536:fd9a with SMTP id
 a640c23a62f3a-b8dab3d22a9mr612966766b.59.1769696689248; Thu, 29 Jan 2026
 06:24:49 -0800 (PST)
MIME-Version: 1.0
References: <20260127214656.447333-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260127214656.447333-1-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 29 Jan 2026 16:24:11 +0200
X-Gm-Features: AZwV_QiOy3G2NjRYUaEaUk5hinZGYHicnAm1TELmap2-pncZyz1_cZokRrT0m0A
Message-ID: <CAHp75VdxQXDiAf+-0vXao8RdDSMJ70DQ8pZVz-EE8s7ZUdfmrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: brcmstb: Bug fixes and wake-up interrupt improvements
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_062451_568210_596BAB25 
X-CRM114-Status: GOOD (  10.34  )
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

On Tue, Jan 27, 2026 at 11:47=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> This patch series corrects the HW interrupt to the bank mapping logic to
> be more robust and do not assume any particular order.
>
> The last two patches improve the handling of early wake-up conditions
> and makes it more robust so we can use those during "s2idle".

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

