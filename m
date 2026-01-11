Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019D3D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 21:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+La3CIGRSshVXzJJV6Ws5h0oOhl5eEMo2EIxi5DDGY=; b=OPg2JZG3F9rr062XHRB2Da1Jqs
	3syqa+cSDxmvIuw+1vDNNENOlZVUW0XOOCF5F3d6NKJm6N7WZnoO2FZ90nogjt23hpD66NYiJBtY0
	zvDgVJaqJBntGW+2AAXyseIHwO+AxknWwXOz7s8PFqaYjX0L5r8ARiNjCuvwJwphK1cDCxgpO9BM8
	aVc2h8V2t149ZNR6/chhy7iX6NlIwejPkm2rMVX+pgQGR2DGIJfW3S9YOso7GSQy6NYN6tfkRH+C4
	tEujcX264EOcg1lTBc1wm0MRoGQIgxa2YMCH+pMM3yO+uYUIJDdXIHpKFLg6l0pMx6bgQx+7kbJoa
	MS7COMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf2xo-00000004W6P-0ZuR;
	Sun, 11 Jan 2026 21:27:08 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf2xl-00000004W60-2O86
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 21:27:07 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-121b14d0089so6202008c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 13:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768166825; x=1768771625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+La3CIGRSshVXzJJV6Ws5h0oOhl5eEMo2EIxi5DDGY=;
        b=E1xTiPpr9u4whhRfWnBcUXaS69XdRQO/tVm6gGUEv5QTS3Aa+7HJymiovDNDDSPumc
         YBt3yejDLOq3P/eMP67YpVZOTJ2AUd0naOdYygXtwqNz6yaw4g+B+X8C3HzwVLcS4Erk
         gBeFbYQc2qiBbUlgFqh71JPH9dkb9JZXp8A23fcA5xt77jZ/p4ng2fM5pnrsuaH/P4T7
         5QK3q9mvIIsWAZVM82aDYruhSpJ46TUaUrCD4ziijPC/pG4ALhJudhyWczyveYDP3Apq
         GjCYTEep7oNdYxwJf95QqCpARbaV632oQbh4pEjGGev0UNguxkSpwMKQ7mKvVCq74ZCc
         cnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768166825; x=1768771625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+La3CIGRSshVXzJJV6Ws5h0oOhl5eEMo2EIxi5DDGY=;
        b=mfniOEwSMfo5zT3V6nTQbfFSvVy501LZyGwlP+/hwYMSFT9XT8ZzQITL/ZdtwhQzXE
         cLsIItCqBxyor16I1elpXZNcWvsPgf3EPOGsqzwDQGdHA/1iT0Xed3lrH7R+X1A+22eT
         URljy4v6OU0/dI6rvv4UuCZ26qWUOpl3XUuibNRCAJZ/DIYqC5B/Ct18kYHB82PhPe3V
         iSIO7CPgsvjMUSz8TRv0jKy51NoQi1ptrgKHGxItMnbce9/rF9zXYb2f3H/U3u1gUkXq
         mSS803nztyYQpstKwIak89aPe5NxLCaGGS/WvUSD31iRZCixHwYykdaUtjqgz82u6DA9
         dzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyGjB2dF8L196eGJHCTaGfKKWeWqSUU/PknP2HByj7FBR582cjrTPPYrzXfKtl+1yR2A/ECzt/oP6nX7e3VTO3@lists.infradead.org
X-Gm-Message-State: AOJu0YwrjPRK/q0QD6nIILJHYB9pIeOb3GwvPvO4OHS9oIS5sgA3WnSg
	61Hfy0ys3cVtd75sCcl1OuC2TExv9QR2Ig7xXTqkQtRaCgs29JskMH/dZM9N2EkEhYHcl2PC1b9
	Pl92G+o3HgXCJ3AozgfqxmTax+YnvVhQ=
X-Gm-Gg: AY/fxX5OqmmS5g3gJwTHq3nqo9kTr5oMvCtsY8X1ZwzfthSyxnE3cPKb2Iii8iGLP65
	uxKCZOCTziI2VjUwJqg1rt9Uk4gC6vO41kz6QeDoDOdIGsCSxv7+b5HU1XORLz1akkbxZQBe4rr
	cggqrDVExpli9Y9KWe42fx6uTDpHLZs32JQ8nTo7yRZu3PcmuFqo0jNsg5I+zOwioCUt9Q04/IA
	dt/SDPXpcF6OrG48ZImrtVfkMqa9TfKnlv2a1YuMjgw1JFcYnmrpYL6WmkENsoiiMqCIbPGbtQ0
	X2h1FDWP/DYlyTpwisA=
X-Google-Smtp-Source: AGHT+IEAIkTtTenYTps//RIeNMSHypd9h5mkG9ym0bXQcjZBxIqbQi188jjy2QtOlW65luwAbZQyPc1Ub9a0FeUef3E=
X-Received: by 2002:a05:7022:b9d:b0:119:e56b:98c1 with SMTP id
 a92af1059eb24-121f8b8c1dcmr15280403c88.40.1768166824499; Sun, 11 Jan 2026
 13:27:04 -0800 (PST)
MIME-Version: 1.0
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
 <20260111201040.162880-3-anirudhsriniv@gmail.com> <fdfb7212-5133-4cf4-9448-15cbbaa34eff@lunn.ch>
In-Reply-To: <fdfb7212-5133-4cf4-9448-15cbbaa34eff@lunn.ch>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sun, 11 Jan 2026 15:26:52 -0600
X-Gm-Features: AZwV_QhD59iuYK8Lvi1649SQz_mf1A12Z53MMB7xc4wTeA0B9lLvh3wsy_Tx2eA
Message-ID: <CAJ13v3QVVC44XD1W-4t_m7Mfv8L214s2T62CyDdJTggX6paZpg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add Asus IPMI card
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_132706_279452_6C542C75 
X-CRM114-Status: GOOD (  12.16  )
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

On Sun, Jan 11, 2026 at 3:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&mac2 {
> > +     status =3D "okay";
> > +
> > +     /* Bootloader sets up the MAC to insert delay */
> > +     phy-mode =3D "rgmii";
>
> There has been many discussions about this. This is broken, 'rgmii'
> means the PCB adds the delays, not the MAC/PHY pair.
>
> Please drop Ethernet support until aspeed fix the broken MAC driver.
>
>        Andrew

Understood, I will remove it for now.

