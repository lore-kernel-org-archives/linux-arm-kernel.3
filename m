Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF38CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ak9HRSabsPSc2sAYhp/DgmsudFPRzOz/MW27WLeWYw4=; b=EYzVbmFwmmhY5879Pg9Q6M69pX
	GuanepRH7us2YwDztOoO0To+QlNHdPWOU98Ct6K3BSXXZorOw7WNXAnXg1xBXA2taXm+jV97JqyTQ
	Ji/72fd+R/wyj+C1Z9cbtoYU5q+CBn7nkbkgKsBVCSo5kWKqwKC9FPjC01IpD1oqzDJUmZTkQY3J3
	RoBviGN7O7qTN5FeIgA8BtbzFVL1bt2/zFYFL+yykU6l2K+mmyRCO0/k7/HvcKBcrARXZ02t6kMgf
	4L3fy0+Gb3f3SqZlTIM99Pnr4Qn4rxpsEFxAppcmiQ9JXCb1f6ZBEcSwhYtN8z0UhpN+jMxVpw/Dw
	waPXB0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGEbh-0000000Beq4-0WBB;
	Tue, 04 Nov 2025 10:49:45 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGEbd-0000000BepW-09zz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 10:49:43 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-780fe76f457so56476687b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 02:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762253379; x=1762858179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak9HRSabsPSc2sAYhp/DgmsudFPRzOz/MW27WLeWYw4=;
        b=JIpox9jacSfzJqWzcpaLPc52X3XRXYwyWgszKebrL/7d2EwA5Hfq/xD4qGs27avVoe
         rk4Hb7k7jQoS7eCE0jykC4nI3nRyRtv5ZsLi1gI6b2emhoJayaysOdG0Zm7PTDpVJ9Vd
         I4FSC6iqyRPWamVjC4ofBWO4/2ESVUzeSNrQ3RpfBJ7y7kT75O/dzoozoRi1z3nz9cij
         Vi7cor/0kBPetA5M16k8PPGLaD5/2gluh2iCY7RHjuBi72eFy5svZ7Xqklw3rTvUx+FF
         HPDlMLE5T3X+O+owElL6elmdr88bLoVbcOBjTX2sERy4vqSMuM75/D/SeDSFdqk2IRYe
         23kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762253379; x=1762858179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ak9HRSabsPSc2sAYhp/DgmsudFPRzOz/MW27WLeWYw4=;
        b=vyHsPE7LsdA8FHlZLjF8rtVwMsr3yfFxGChTwWal0nrwiFS6+veGNAWpNfAMLqqnyK
         FTBTXkSNYk4czdvG25yQAlsOW9Ns0yxiaQq/75tvHHtaY7TA3f7YfZI6Qsdl8/6oROKE
         eSfR7kInoVE70uXcLNbsfh/ol5t1YqrHXNBf5juGH0xItam9ePEfDHSD+7vZsZWXr+It
         dM4M8nJhG7ePXiUh/+UqBWuvUxZ+GlnPCDcyY8oSFFA4gNV6ZijoywKAL8kq0wAurBuZ
         gU6ocdWNY8eLuhgqRuhFMLxAe4gwB8RAleL8kzkcscSwBAnIqtjIggYE6/QnmPG4ACVO
         E7ig==
X-Forwarded-Encrypted: i=1; AJvYcCXUyEcXPDCGN2gs4Dc/ez1jIOxEFGGVHEYRTzTu7IWaWRN76g2yvuZbT4Nt9zSIPYwHP0LjPuFAKH0xY5kXfUcI@lists.infradead.org
X-Gm-Message-State: AOJu0YyRu3SPfTeTQDXzxAWnxM0rDSgKpJ9ZHar6MgO4WvEz+iJ2RI6x
	pXuOzfKjOH2FLXdmkXil9NPeDEY4sR21Bc2kqHkLlysz6ZFhy1y5CjoMXeKHZY2N1rnVGOH6eRw
	MD7awLXtxShj8Lzg04h0POMlqOGR3R/FM0kgkSeLp/h2EALFsvgoZe4w=
X-Gm-Gg: ASbGncv8XN3dAa4VogxUnSrnS38ENe+HUdpIwhbuYix6O2yn9TuwTeVUX/msGgyMAkd
	MIWnf9c7VLentTju9rXlNCGuJMi//5itCERblIEDepBVFQNmezQ93rszPjHKPONHZyTSDkSKnZ8
	Z+zM3R28APaDPXQaDCOX40NR1KwwQ2b0igolNH+jxDsTuXixZibJWPF3WG/1/dqkVX9D2L73QAX
	E/5DlMo4SNt/aH4EGIubD6lNkrjjhBIleIRW8wd8vPXH2+CpKrxK0GX/4HU
X-Google-Smtp-Source: AGHT+IFkRk12Uz8wpzuhpMIHhTXXbZyl3DIW8r7FnluskO/7yYtfMjAEvExmUGloPG75YUmDMmv3zjusyYiPuTnpWEU=
X-Received: by 2002:a05:690c:6ac8:b0:786:68da:3f4b with SMTP id
 00721157ae682-78668da4023mr149747947b3.31.1762253379370; Tue, 04 Nov 2025
 02:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20251028061345.3885632-1-gary.yang@cixtech.com>
 <CACRpkdYdQa4=4JvBWJcRv0X_A0PnkQpZQQ8NTPzF0ntdt9qX=A@mail.gmail.com> <PUZPR06MB5887C2D161EA5CB13A41462EEFFAA@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To: <PUZPR06MB5887C2D161EA5CB13A41462EEFFAA@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Nov 2025 11:49:20 +0100
X-Gm-Features: AWmQ_bk_lIuQg0K_Adlxvvq0mVAjsPYqUJ9ljmVmC85MrC3marOjlEWPUkD0cB0
Message-ID: <CACRpkdZtQkbGnQtb3DZf1XOVpbZgnBbqZD3kxEuCCAS4Pm3AGA@mail.gmail.com>
Subject: Re: [PATCH] Pinctrl: core: export pinctrl_provide_dummies() to fix
 build error
To: Gary Yang <gary.yang@cixtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>, 
	"sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_024941_925906_804A4296 
X-CRM114-Status: GOOD (  18.26  )
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

On Wed, Oct 29, 2025 at 4:35=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:


> Generally a device may has two states: default state and sleep state. The=
y are included in DTS file.
> So DTS has two nodes, one is for default state, and the other is for slee=
p state. When the device works, select
> default state, but select sleep state when the system enters str.

What is "str"? stand-by-retention? (Sorry for my ignorance.)

> There is two pinctrl controllers on CIX sky1. One is used under S0 state,=
 and the other is used under S0 and S5 state.
> When enter str, the system enter S3 state and S0 domain power off. So the=
 pinctrl controller under S0 state is also off.
> The settings for sleep state are loft and make no sense.
>
> But if we remove these settings, the pinctrl can't find sleep state and c=
an't change state when system enter str.
> When resume pinctrl, pinctrl core may think state is still the same as be=
fore. So the settings can't be applied
> as expected.

Aha!

> To avoid write these unused settings in DTS file, we have to use pinctrl_=
provide_dummies() interface.
> Do you agree our schemes? What's your opinion? Please give us some sugges=
tions. Thanks

I think it's fine to use the pinctrl dummies, I will draft a patch and
send so you can ACK it.

It's fun to get the whole picture of how this works on CIX silicon,
it's a new way of doing
things with two different pin controllers so I haven't seen this before!

Yours,
Linus Walleij

