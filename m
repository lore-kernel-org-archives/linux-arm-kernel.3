Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9685ECA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 10:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awT1Pc5QFdF5D/Wxu+LjKDgk6d6Ud6beDyAqqEU7AUY=; b=PSsz6DQbdHwSE9H8+dncqjd7tr
	CSGASrj4SaGYs2V/k3oH2dvUxzJQpMlblKi3Z2mXk2bj5+Nk468O2o0IlJWRi+4JtmmnnLAppYDue
	/+LHOp3ioPAFyX+TYeOdJznenSy+8jz+59wRQMrv97RYNY6VdQ+BdbYHSgTZVQMIaohoXlNeYEUme
	HSX8fil/PFeKTpnp1eR+ayfSReCSrCyNaX/gvM2v/BAr6kPw2XX3BvjAtvz6Y5wwBlGeuILyd8B6k
	vBVlt9YWAkuONVjZrEq/APXFbN0pjpdx0YiSSjavv0FyII1K4drg0gxmM8PHfp+jCqDi+htgZqK29
	hOPSdVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJF1-0000000A4ik-3LGp;
	Tue, 19 Aug 2025 10:06:55 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHru-00000009pXG-2eBy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:39:00 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-afcb78c66dcso707413566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 01:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755592737; x=1756197537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awT1Pc5QFdF5D/Wxu+LjKDgk6d6Ud6beDyAqqEU7AUY=;
        b=apZIqSW5uNZ6/0sfkO6/lUJhmXKsdiJ9S0TsK99OxnwloASzwweuFg/YP43lYElqAo
         CW9UYRjze0pCiKAoAdh812z6QZSIEpJj6D2HUyu6g+GSgSEHBXIiAcQLUEWGN/kpHkpw
         MoSiVT5hoDq4RiQgQSLWCeZPZd604yJtfM5dUzC9Nr83fLvWlJavnx6Ia7vdL7kQyjcY
         qIIJHF4g7evuYlrPrapmz9lQ1bR+0TEhlpV8eJMQHWUdxPV57qI/HdqKk6Vxr1WZ2eD/
         NDITbk/v3Fna5AEkBInTxiHYOeAmW+4R6uI0RlQPe1DNk4wSHdy2d3pjdI/knkRafrzC
         F/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755592737; x=1756197537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awT1Pc5QFdF5D/Wxu+LjKDgk6d6Ud6beDyAqqEU7AUY=;
        b=QwOywXiUhygkeOnZ2VJNuijhdDm9DAf/t97st6A5qLjcsvmz2zuC42I9eSKWGZsfRS
         p27dCySJu4/0o6dInPRM3N8YgfkYvrR1rm12cyWwoAl7AKOCz4XirdXEUv201oI9eyj2
         nrmSPGAxAIqG5YlfbQTL/vTwuTj4iwrJ2LLFWt49fH1iHgYVu5PE/IkOyEjmonJbP/RG
         mMxkHcQCVGfeEF4pmFfh6M3c/dsMUogNfCI+mVOg5HDWwdmi5kOtGfbAK/xv6m6WpOA3
         6nOF+z21IvHn/rT5EseYXmU6bSUGE5b09YSMQcOeWCtLiyNZXIvhQ5BLdWSAskEf4F9s
         bZuA==
X-Forwarded-Encrypted: i=1; AJvYcCXXcaWsJa0msK+1ap95bieGp9ZntNSz3IerJLdeN5a1yTGkIRF5pwDEct9QqvQFoccoKp7+Tivgi2akur3yDGCd@lists.infradead.org
X-Gm-Message-State: AOJu0YxvIphTC+GY8Hdu+ssF9h7xEPG7PpoAYsZUn0EzW/yDWPOsbYng
	pNDCjgpfn1/ZfZK8Ypy9l5hHpVNC7rtnD1Hp/zkFqUxm7/nUai33E6w+wC9GkxpGErA=
X-Gm-Gg: ASbGncswwVzW00deVQMVjezuU617QXt5+D6XHbOOu56p/W4BlZpa0UwdjjoZnGHHRQN
	kNq+QTXpQd6plrITdBLfqp1ulBNLlSAvl/m4r2D9mncL77G09OIX1/f9WZ/k4k6ZjYv7upBSoEr
	PleVorhoboOyGzBu6sWOFU+18ug8aR9xIGekSZ37Ye9gsgTw6A+5odD+4pYAcnn4gcvsqumigNI
	4S8+6FByMGYX1owNKS6xwUgP4HDgbMP2zf3NdPXGae+SeYC+4PSJvYW3UFiiTf9AD3Ak/1/SkHf
	FRikQsnMODFG5ZJ7R9SS3NAxJCMNi8zd2ZDTIDHW6eTmJORzbevRGtGtFHSUpX1mqLPpPwzJ6Rk
	aBuk8lffEsN5/oZfU7l99+gfMA1S6Q8JWfDnlG3ACxdy4ITlbDcQujcs0QVqN
X-Google-Smtp-Source: AGHT+IHonInmdTYMCRZte9li+YjdpP7iMaUqqny3PYj+jU1US9Z78L5CzsZFHXynIpZWrj7rqyAw1g==
X-Received: by 2002:a17:906:730d:b0:af3:7645:43e1 with SMTP id a640c23a62f3a-afddcb7f393mr178888166b.17.1755592737043;
        Tue, 19 Aug 2025 01:38:57 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcea0ebdsm967968366b.56.2025.08.19.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 01:38:56 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 19 Aug 2025 10:40:48 +0200
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aKQ4kBZtyr-g5JfV@apocalypse>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <f7892abc-1063-4b12-8d47-c80714aeb8fe@suse.de>
 <aKQyViTbXAsFEuT7@apocalypse>
 <9af1eb5b-7eb1-4686-869d-eda597145819@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9af1eb5b-7eb1-4686-869d-eda597145819@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_013858_677383_F91D220B 
X-CRM114-Status: GOOD (  19.05  )
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

Hi Stanmir,

On 11:19 Tue 19 Aug     , Stanimir Varbanov wrote:
> 
> 
> On 8/19/25 11:14 AM, Andrea della Porta wrote:
> > Hi Stanimir,
> > 
> > On 10:40 Tue 19 Aug     , Stanimir Varbanov wrote:
> >> Hi Andrea,
> >>
> >> On 8/11/25 5:46 PM, Andrea della Porta wrote:
> >>> From: "Ivan T. Ivanov" <iivanov@suse.de>
> >>>
> >>> This driver provide pin muxing and configuration functionality
> >>> for BCM2712 SoC used by RPi5. According to [1] this chip is an
> >>> instance of the one used in Broadcom STB  product line.
> >>>
> >>> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> >>>
> >>> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> >>> Cc: Phil Elwell <phil@raspberrypi.com>
> >>> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> >>> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> >>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> >>> ---
> >>>  drivers/pinctrl/bcm/Kconfig           |   13 +
> >>>  drivers/pinctrl/bcm/Makefile          |    1 +
> >>>  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 1197 +++++++++++++++++++++++++
> >>>  3 files changed, 1211 insertions(+)
> >>>  create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
> >>>
> >>
> >> <snip>
> >>
> >>> +static int brcmstb_pinctrl_probe(struct platform_device *pdev)
> >>> +{
> >>> +	struct device *dev = &pdev->dev;
> >>> +	struct device_node *np = dev->of_node;
> >>> +	const struct brcmstb_pdata *pdata;
> >>> +	const struct of_device_id *match;
> >>> +	struct brcmstb_pinctrl *pc;
> >>> +	const char **names;
> >>> +	int num_pins, i;
> >>> +
> >>> +	match = of_match_node(brcmstb_pinctrl_match, np);
> >>
> >> The 'match' variable is needless, you can drop it.
> > 
> > you mean something like this?
> > 
> > pdata = of_match_node(brcmstb_pinctrl_match, np)->data;
> > 
> 
> No, I meant:
> 
> pdata = of_device_get_match_data(dev)
> 
> Also as a bonus you could move brcmstb_pinctrl_match[] array after .probe.a

Right. Thanks!

Andrea

> 
> ~Stan

