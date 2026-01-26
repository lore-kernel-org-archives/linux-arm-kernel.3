Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B48AD19501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IM7CMREqT/HEcq8ZeP+BSkiaCLRcDi8nhxT76okq2vQ=; b=veDDhF6eY4vj13oDyTZe8LCTE6
	yVRHcWqpaXvfvRPCfGhcYR9MydamlKg3WJi8eEYyX12OTy7qU1d7iV1XxddOJqf+M1+iRhlwPaYOg
	waFh+1EQX9NNw3QJsmYg+hvLStSQLNWchpQ1pjSbZ2q6kQ/f/lsO/PRXSSDIIW7gMzG4Xt+f0zFiM
	Cj2laXuxOgy6VuS7a2ekBetXq8prPx/IVl5IHW2EWNnmwa/wf9NI7OfxJHsTMp0V7MzjsbfLprDvR
	ZMgY55gNbaQ2pw2rAs8K52gpizz/4iOBmGALjP6agC4BCz2R6FX7tEAJu49oEKXnWcK3uJl71aG09
	fUlBfojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPRE-0000000CrgO-2SFX;
	Mon, 26 Jan 2026 16:27:40 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPRB-0000000Crg0-0r47
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:27:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b884cb1e717so655218766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769444855; cv=none;
        d=google.com; s=arc-20240605;
        b=SSlV9P741jeR/lH1v/qMytVZA3kEt1Kkyh8Ni2atk1XLm6MX80S1grsbm8PDgE4gFe
         h55ZzhbF9tC4v6yGjpeHuYfWK8OXHaJ+0TThs5VhoNEhVyVWJVGajVKvuZq7ed7aFaT9
         Jt9pMKANWrNqt1rxbkyo8rsQLr1vFgZt5wzdCZsGBNRqIdlLSLF4jH+EEnDGCfMD/ICR
         FrfzcnDsRQqevIWKm52TYhDRmvaevQATPks9AUrWKAj66J9vZ0BRuy383g/abqSdUdQa
         uZzTEhT7K4CafsEZfHOZwg6lFsk95TmX3nXJWUMQUO5YRr9evNV7WlZ0Zsr+f1MMpYjT
         6R/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IM7CMREqT/HEcq8ZeP+BSkiaCLRcDi8nhxT76okq2vQ=;
        fh=7A7k+dpy6Bvfn5kxTmq4OhRcK3NVKW+DawTV/6+rzys=;
        b=X/WLjT/B6eAGhG9S2CzNFZ6Q/mCOA9v1kYkE3+NqF15Rj0BB6b1tpxHJH2y+Kw2/t4
         NIDgvBZY8xm8/fpJ/kBP2KP5R4/Z/h9y7j//G6is6g8or1iJrMt7NUjS6k/modIZIl1F
         y0uw+gpHVXUjD62WxgkxP704ZuYSwXsws435GIgRfrqCEIbr7P6TCeh4SVQtHi7fQ+dU
         9XUX8RJcQGByhh4ty4S4M8+2MW9olKuitsfQknXEuxfKgH0yx9Bf1duRbyh7hzjDpzuK
         Q+ojF1dAouLsHt2Svmt3a9IhoMtAwgDJWPR56/flicWvkgZYzRV26hxIeyxvuPsqaSaQ
         CxPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444855; x=1770049655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM7CMREqT/HEcq8ZeP+BSkiaCLRcDi8nhxT76okq2vQ=;
        b=hALLdiVtaG/YQltcC0Y9hagD4fjqpZC7LeLtVPmdpMJnn7xCZ9v4OeOoaRuM7Rl1qC
         1mGoBDh5+IAsLki2c0Un5EJVLuyeDbBCKMR9g4Wzm5rGXZyZeObkFVzd2WpkN4U4im4k
         K9J7IIoci+dMIb9/kMMuCRNdUXS/Sn511245Diafss+mPu1IWHRzr3gtyY/F41alhXCj
         T12cSvSy9yaCFiE3im4lwFq0Uriyjo5EMMha+KwSQQ2hACyb6Czf5dt4AU1BMBYyAPKL
         E6SdDpocauqSgNWszxjl9LnU583qisV/QVcbXHc69UGqdUAv+fL5qVbwKgiIYPQn3YUQ
         lPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444855; x=1770049655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IM7CMREqT/HEcq8ZeP+BSkiaCLRcDi8nhxT76okq2vQ=;
        b=WhZNiklSo6Ba0g9Z37f1rt1ohUOS/pHmcGAC6i/+BG3JINMRW/IBpXWlRlzZVqrE/7
         T4HEuk2ekJK3Ho7pyJoGQisPLXjryFhnpTJhRXG3EfHx/5GoJNVbSWUuTocbuiu8zlQi
         d8QSMPWVGmfEAMb1LOYLhQNhLGe1OgAycQ7nRo8iRccdHcPBPKgiZJu9hazutntu1m34
         Nva458+/1fXNmQbKyrKhJy1pWXbptaySuvWj3QFQpMNIbJej0PFp8n+oNJli15+a8qSW
         eSufMw/vXDPNAC8vjV5yZjbQZctpIP4hXvwtph/AOdB+FSZm6iwxE3S3DobM4G3VUG0y
         7/sg==
X-Forwarded-Encrypted: i=1; AJvYcCVKIu29nAJt9/P7FcY3CjWDkQ7/Uk3xKBQDIbJOqNKf4bXKJOnbj/sPvY4x8eyYhp0iMDgzWOMprdjySRCw1uz5@lists.infradead.org
X-Gm-Message-State: AOJu0YxdMx3fDLKMphIo39Hhnv87gDK2Y4isS8xXDw/bF+AdBHEr+W2G
	NtOQ5P1p2T/p5kEo+KIchMjxhgXR5g3Az0jcwUsTBfm/irgU6rARItqX00krFPMMhOsojdsFpnD
	IlrT3xIS8bOlXMJl4RKjnX20586wmA5Ppz1o0
X-Gm-Gg: AZuq6aKE6X2fHcehUXiZ/Ko1pZqfxjDWVivlA9se+4Jv/lzILQkrALHh35aHdrwCFvp
	WaBL+XowreXYEHYN08ZESTA+7zrQqXDrxRjVJ+4VVDnMOZqB0ts2uA66ieS4miHcaclsl8efdDl
	obydWEdq/paaQEDkxlXMsoNqLKqmVl0mMSIHCZEk5cLJEqHTf89ZOoIgmTcomZG/NH8mxkxGhIt
	fgkV2wbHXW7hS/OiGMoVpei6mFwIENS8MArm47M4hIju1N+pWlwV9uqsZlSsYiWsu8mrZJvgcjo
	4kupwSupx2SY3aWosUe0gpSiySCOe9leeBU/Oio8H9gDDrB/sAi2Z+9mYYcPZpdg+kp4BL7XSwC
	dFLq6XQ==
X-Received: by 2002:a17:907:968f:b0:b79:ea1b:f13d with SMTP id
 a640c23a62f3a-b8ceed5bfc0mr416879066b.2.1769444854813; Mon, 26 Jan 2026
 08:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
 <20260122010516.1200630-4-florian.fainelli@broadcom.com> <CAHp75VfhEZ60F7ZHkjNDZ3JR6B6tNF5ORUDPoN8ZibbvF=js8w@mail.gmail.com>
 <a7b2f013-965b-436d-95f0-8ce1e2ec0c41@broadcom.com>
In-Reply-To: <a7b2f013-965b-436d-95f0-8ce1e2ec0c41@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Jan 2026 18:26:58 +0200
X-Gm-Features: AZwV_QjJmye1Ztm1Y3JRlqubTBVm6XTIk_3V-19hYG_-47rSPwV71iUOBV2yjhk
Message-ID: <CAHp75VdFE6A+Gv=-OsNT_GqJyzOfLDXSB+gant_jenSgtEYA7w@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_082737_261901_1BB43162 
X-CRM114-Status: GOOD (  13.55  )
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

On Thu, Jan 22, 2026 at 9:24=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 1/21/2026 11:42 PM, Andy Shevchenko wrote:
> > On Thu, Jan 22, 2026 at 3:06=E2=80=AFAM Florian Fainelli
> > <florian.fainelli@broadcom.com> wrote:

...

> >> +               if (priv->suspended && bank->wake_active & (u32)status=
) {
> >
> > Why casting?
>
> status is an unsigned long, which is what for_each_set_bit() expects, so
> it is intended here to ensure the top bits are not participating in the
> comparison, I think this is just being extra explicit with intent here.

Isn't that guaranteed by the C standard?

> >> +                       priv->suspended =3D false;
> >> +                       pm_wakeup_event(&priv->pdev->dev, 0);
> >> +               }


--=20
With Best Regards,
Andy Shevchenko

