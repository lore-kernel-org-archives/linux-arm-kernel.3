Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5435DC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 06:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7AoqGRPCyCnlnI8KOQDam44EVXCyf/N7POplk+Weq8=; b=v2VewmqShDk+tcCv1mnHQegUJ6
	mPVDp4nX9WoQhAGCrRQRKeJdp/N8kKaIJuJk51xwc5yrvrp+KYdj4JUBbxCK6aPL1GVb9RqkroIVR
	D1RpXTmrherzxmLHbhGlv/XP1RjCY6Cl+7o2UsHYi9X2ySmV3yXID4lmk+34NDPlcLhyBSGJrZTjd
	rlhBTWDjptTOJSrRTg/7YOlgyxB7jwQY89XUcquhfsapITfAdIw8kspWzEhvpNOcNUJdhIeAyLE7H
	g6jkSkcUXDRhEBi7MZLCwzkxEDzyTPWt+V4QUxbr0qDzkd4JpK1LSpkznnIh9dJQkXGrLf6iMDd6I
	FWdHw8WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZIl-00000001aFz-3H3t;
	Sat, 26 Apr 2025 06:46:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ym6-00000001WOh-2gRb
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Apr 2025 06:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q7AoqGRPCyCnlnI8KOQDam44EVXCyf/N7POplk+Weq8=; b=eNWWzjBNIjmPpPN0rDEo2r6zol
	WVQAdm8cEICfaruIox87zhbMDXLNu5JawttcNLVwnQn63k/0cY39P6px+cvIBjhWKJmFveHlCaRbD
	twVnjKxi10kerG5zGWCSX0Ppr5camcnDrfFaSCvHpB392qO3VBiTwXiuBdzLB+epRM9mbq9GkrcX0
	Ko65CWxZnj85oV8K3MDgB15ZsWo7pw2wfDXtc38Uy6DSVqveA7ndhcLFzjbarWOm2X2kzXTEv0fRw
	z1rDUSmYH8N9qXRNuM6G3C/wlJ7GVKgaZuLG60zUfpAOxJGdpK6QtmLRfCw1xxm12e/ZB2IHvStCA
	muhMEG1Q==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8Ym2-0000000CDYv-1wlJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 06:12:29 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-abec8b750ebso521527866b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 23:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745647944; x=1746252744; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7AoqGRPCyCnlnI8KOQDam44EVXCyf/N7POplk+Weq8=;
        b=DkMG6G8D/5pwbgIPElhA9zk6bIfZX4uLqlPbJqcicsz8A7B68IpicogXEqljYYL85R
         zMNjFbHJP/+PKFCZe7TYmY0CiNKUfEiM70kvEomwv7YFst2W+BZp7Gk3cEXrA1yLuLWY
         M2YLvsiLa4Hwozf7DgLqNbNW06WOLhhoGXwsqjBvZMGthIXT4yfT8Z3B2eL4+sSH05Y3
         EZblVM/lxFIVBYk6KIuCvIkk8n90SY+FevBKy7DE5uYJqF6ntnQYyPd+itpQyM37HiD5
         HkxkgVdJaXvgb3MXwKjaIuMeZCPR1/h31+1SkAMD8iZ4y6S0efo7uGeTEz9LvcS9jLF7
         qflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745647944; x=1746252744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7AoqGRPCyCnlnI8KOQDam44EVXCyf/N7POplk+Weq8=;
        b=nV6SUelb4b/4iQQMzw54hCuKRkaxaimLZ/opH6mRA0R5alRImi1rpB+8fwXLcg9vsq
         2A1S2dT073vnofc127n1hDKUttnrXgTZ3DTSmg9v8eOYXyTmlmsAV8GwXrpn6RSBq1R9
         5cCTZMi+/Zmd9PgJVU4wXa3Htb0XImP1u8VOU1THV3aBsNWXgOytMqWCm0n0tzOv10uP
         V+JdunKNFbaK98xoSVy1+BT5ixBHl6zkEov228LJrKJH0/Tezskh23B+3/ELGB3qre6O
         U75LatL0ABDfd9eB28ptrs+L8ZtMxqxLKlM4y5w2Ck/b2SWqKzNs0lsJAsLsXUEJBo3f
         G6TA==
X-Forwarded-Encrypted: i=1; AJvYcCWOXYA6+ev6bprl2lcW+0CVBfredegE55/TfRmVp3cbQtvO+lIoHzoOaibNLl26thLSza7DZaojDZuKMyMDRzrn@lists.infradead.org
X-Gm-Message-State: AOJu0YxgC/RVafGUhN2QJ0UA8KavfaxNH7vrBbtOJKWNXHZTqHWBWzcx
	kHBtXqHLt17s4EscG+rplhArrSVMkCo9pmlN37eOR+fHvsQ8tk3cYmmsbgJ81SQN2YZgsFsVGo5
	KkfkbQ3C39i9IEHYsuXFSpg3Z5mI=
X-Gm-Gg: ASbGncsfEc6YCbQC3GrnkasrE/1tPXb5Jlj6LfgP/lnjH+pPOeCdV/mLfmR+PbcTh16
	u4gDFAlwSzs39ddVjmxTArgGV6fTmXFFwzcQvf9lXpuRgjrSjvdGVdWdBsPp61Ed+cbpog77Soc
	fU/zZqxYWjlm4kT824AKHl
X-Google-Smtp-Source: AGHT+IHhIwe8rU9PLpYBn4D0l6l1OxCmDLFLe9Bgm3lFBWXmThOd0XpQJqAtk/OcOVWwsd3kI1THgvNLEgb0DKDyTec=
X-Received: by 2002:a17:906:9f88:b0:acb:b08c:76ae with SMTP id
 a640c23a62f3a-ace710951d1mr418780966b.16.1745647943830; Fri, 25 Apr 2025
 23:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250425132727.5160-1-linux.amoon@gmail.com> <20250425132727.5160-9-linux.amoon@gmail.com>
 <7a1e2432-46e2-40f6-84af-bff45ab79899@kernel.org>
In-Reply-To: <7a1e2432-46e2-40f6-84af-bff45ab79899@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 26 Apr 2025 11:42:07 +0530
X-Gm-Features: ATxdqUE-aSBuAto3DWag_735XNh8AilQRfbJbLa3ov7b-DirWkNhYUiBgQia2w4
Message-ID: <CANAwSgSQrW8CCg7=rdN98EsoDZ0KsWv84DKOh3K4Jgmgz66XFQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/10] ARM: dts: exynos: Add proper regulator states
 for suspend-to-mem for Exyno5250 smdk5250
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO..." <linux-kernel@vger.kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_071226_768837_A6415863 
X-CRM114-Status: GOOD (  20.05  )
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

Hi Krzysztof,

On Fri, 25 Apr 2025 at 20:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/04/2025 15:26, Anand Moon wrote:
> > The MAX77686 PMCI is able to power down and up key core supplies and other
> > voltage rails via PWRREQ signal to enter / exit (deep) sleep mode.
> > PWRREQ status is ignored during initial power up and down processes.
> > All programming must be done before the AP enterns the sleep mode by
> > pulling PWRREQ low since the AP does not have programming capability
> > in (deep) sleep mode.
> >
> > Add suspend-to-mem node to regulator core to be enabled or disabled
> > during system suspend and also support changing the regulator operating
> > mode during runtime and when the system enter sleep mode (stand by mode).
> >
> > Regulators which can be turned off during system suspend:
> >       -LDOn   :       2, 6-8, 10-12, 14-16,
> >         -BUCKn  :       1-4.
> > Use standard regulator bindings for it ('regulator-off-in-suspend').
>
> I do not believe you tested this but instead send whatever you found
> somewhere without actually understanding the code. In the past you were
> sending such patches - without knowing what they do and without actually
> testing.
>
> NAK
>
Thanks for your review comments,

All the MAX77686 control register supports On/Off Control by PWRREQ signal.

Once the Application Processor (AP) boots up, the AP is able to power
down and up key
core supplies and other voltage rails via PWRREQ signal to enter /
exit (deep) sleep mode.
PWRREQ status is ignored during initial power up and down processes.
All programming must be done before the AP enterns the sleep mode by
pulling PWRREQ l
ow since the AP does not have programming capability in (deep) sleep mode.

So PWRREQ has the following states for control registers

00: OFF (regardless of PWRREQ)
01: Output ON/OFF controlled by PWRREQ PWRREQ=H (1) : Output ON
PWRREQ=L (0) : Output OFF
10: unused
11: ON (Regardless of PWRREQ)

I have dome code mapping through the driver to understand this feature.
If there is some code improvement plz suggest so.

> Best regards,
> Krzysztof

Thanks
-Anand

