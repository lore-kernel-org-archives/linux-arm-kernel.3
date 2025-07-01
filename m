Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B03C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIyJztbyxqEjqjaJ1LnowEcyz0vyDwt8msPH6jo2mH8=; b=V68CxwD5t5qO57RcZo3gPe8XVS
	DxsqYmQL3C1TbWqib3xtzXT7W+gvtyTe7waKw1n+PeqJa/rSahmKwddv3nVyr2+C2RgdFCwPl00qv
	PeunOvGMm/9NgAp1iNv4shcEbkw+ac3xwijt6SczCjpKeaglpWSntYq3/3T3GYUqYoJ2O6sSIGoYu
	U/gf/YZqv+5+gY9fTkrL6wxNuULbGL5bqUgKw/NC8irTQq0mgHiA/ypgp3jrD1ynpjf15cBVZcT+B
	AwhDiRc3rZyRD4WyoFA3Kkl5bmc31y4dLCZ23b162IdVlvoir4vxnbKdKbXn2jqXAPVrXW9hSfSiD
	JlkeJotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXyM-00000004iMD-02wa;
	Tue, 01 Jul 2025 10:12:18 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXw1-00000004i5o-2Qeb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 10:09:54 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so537666066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751364591; x=1751969391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIyJztbyxqEjqjaJ1LnowEcyz0vyDwt8msPH6jo2mH8=;
        b=WprsWo+6RFzcIHCKLWnnU0e6WWDrBdAb5d1HJlfCtQM+sDmAh16X9JISVcG2i5dQBl
         Lxa94FbGO6JsB+S4cg/51jsx3BC6HpP/cgxCDMeT2o8HgoWoDQgcdEi6UD/XsfcJAjw1
         etXPbDBiRHScAKeilpTMkTgwPFKLdTcQg9XD/R0/E0FpkxlNHA61p607q112DYx9qbxQ
         sjUppyuCeiiN2WeQciMoiWFAq7iJhAiNstF7zE68H60rMvNpr8Z7C/haW+eEPTJy61r/
         aShWSiO0BIGqkPRa5mW55i/M+P7zS19BEopE9ot0SQGouCMeRDvcxvhX598IF/85Rv5A
         fnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364591; x=1751969391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIyJztbyxqEjqjaJ1LnowEcyz0vyDwt8msPH6jo2mH8=;
        b=qW7G90LvIPsKw0KmA8ISjC3Eu2nr77j1gW3womcPHjc7vQKcmHaz5EKCj9/IrpBrBx
         lxDWtoFnWbyQ4qbRBQHuWA7dYCO9W7jA3ISEMnKiJ62l3lFXNCcF2aqu+uNwSvC+5kNi
         yOWSNv6WWpf2C5pKUXGHPOj5Zj2OBElHWbfQIqeTxuD1YX+nomHBEIINwIfPyZqX096A
         rAjHpX4yGmvMiyRcKI9AF9Sz2IaYLRQLwkbntyh/p10QYIcJyfpzgyzvBe4WmR2m78TX
         MPHwxbVWMCriHzqIcRIMQXjDp43yzeVCCSI/cuNEvonpYZIA9C6afngtNd4iWRjNtc1o
         cM7w==
X-Forwarded-Encrypted: i=1; AJvYcCXwj1cN/ehI5Y2dn6FBhLxLqm+W/fD7pRKl+MfOdmDEjnEaLGwObNGyr8uB+GgFWOftM4cRezSIhkHqaKgly7WB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu6zwLQf3rGE/fP6wJyedRr+L/9ZmSKBwW3tg1X+m9etS76CrN
	zKwBTq9NWK/DRCzwdf9SJp8WQiXvBMoSH0h7n9Q8CS1LR9OSbumw7kmyru9if+ueUTQ=
X-Gm-Gg: ASbGncsdEnEtXCsLKRqswyAYleksOFN63q0RdO5idbxbwUfqFt/spdHSLcVpXLIrOZW
	PEGssBqVUOY9hRzZZe2TDa9Uk3K0L51MGIf8tqYMLKq0eoK+jnYMYPpM8G3ysPx0hoZlhlq3rgD
	OrbVcdquUZdECfD6uOftSnEi26O7lwi1p8dYo76ECavJWauQ757//2bqgVSFdN726g/ersHz3Qa
	rxL7nyvfQS6RhuH6lFGuuV+iWq5RTNnEgYx0LsCkqmKJYMUi+1ul8vkWI3sjElwm7zRufpnk0+P
	8fxa51gluMa577Oc0RK5id3SnhPuZeGqtvtg6vKeOnhFrKWcwvCZ/dnJWTTYWqOYHeiC3PAApSr
	iMmViMnKcysJR/M7vWBH0xjmdne7ShCAy
X-Google-Smtp-Source: AGHT+IFn6H76sBBBJXNtbulb+i6N1Dt1i4Alu/bsEVENZjt+XOBzm1/zPvGmfUSPvMdlEPKO4mGdaQ==
X-Received: by 2002:a17:907:9495:b0:ad2:43b6:dd75 with SMTP id a640c23a62f3a-ae34fcf4123mr1573289466b.10.1751364591035;
        Tue, 01 Jul 2025 03:09:51 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b24fsm838578966b.34.2025.07.01.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:09:50 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 1 Jul 2025 12:11:31 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, soc@kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Bjorn Helgaas # quirks . c" <bhelgaas@google.com>,
	pci_ids.h@broadcom.com, Stefan Wahren <wahrenst@gmx.net>,
	Randy Dunlap # build-tested <rdunlap@infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 4/5] Broadcom drivers changes for 6.17
Message-ID: <aGO0U5yuEZkIZev0@apocalypse>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
 <20250630190216.1518354-4-florian.fainelli@broadcom.com>
 <2025070139-garnish-leotard-9824@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025070139-garnish-leotard-9824@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_030953_624139_A819EF4C 
X-CRM114-Status: GOOD (  21.99  )
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

Hi Greg,

On 07:11 Tue 01 Jul     , Greg Kroah-Hartman wrote:
> On Mon, Jun 30, 2025 at 12:02:15PM -0700, Florian Fainelli wrote:
> > The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> > 
> >   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/drivers
> > 
> > for you to fetch changes up to e3ce7b897388339b407d57969acaa26063e38209:
> > 
> >   pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support (2025-06-25 12:08:56 -0700)
> > 
> > ----------------------------------------------------------------
> > This pull request contains Broadcom SoCs drivers updates for 6.17,
> > please pull the following:
> > 
> > - Andrea adds the RP1 clock, pinctrl/pinconf/gpio and misc driver to
> >   bind them all
> > 
> > ----------------------------------------------------------------
> > Andrea della Porta (5):
> >       dt-bindings: clock: Add RaspberryPi RP1 clock bindings
> >       clk: rp1: Add support for clocks provided by RP1
> >       pinctrl: rp1: Implement RaspberryPi RP1 gpio support
> >       misc: rp1: RaspberryPi RP1 misc driver
> >       pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support
> > 
> >  .../bindings/clock/raspberrypi,rp1-clocks.yaml     |   58 +
> >  drivers/clk/Kconfig                                |    9 +
> >  drivers/clk/Makefile                               |    1 +
> >  drivers/clk/clk-rp1.c                              | 1494 ++++++++++++++++
> >  drivers/misc/Kconfig                               |    1 +
> >  drivers/misc/Makefile                              |    1 +
> >  drivers/misc/rp1/Kconfig                           |   20 +
> >  drivers/misc/rp1/Makefile                          |    3 +
> >  drivers/misc/rp1/rp1-pci.dtso                      |   25 +
> >  drivers/misc/rp1/rp1_pci.c                         |  333 ++++
> 
> Any chance to actually review this code before you throw it under a
> different maintainer's responsibility?
> 
> And what's wrong with patches, why a pull request here?

Since the patchset is spanning several subsystems and some file
dependencies were shared between maintainers, Florian was so kind
to funnell all patches through the Broadcom tree, as the following
mail explains:

https://lore.kernel.org/all/0e154ae3-e0ab-4a4e-aa39-999ea1c720ed@broadcom.com/

Let me summarize the patch history here below:

dt-bindings: clock: Add RaspberryPi RP1 clock bindings - 
	Reviewed-by: Krzysztof and Florian [1,2]

clk: rp1: Add support for clocks provided by RP1 - 
	Stephen: [3]

pinctrl: rp1: Implement RaspberryPi RP1 gpio support - 
	Reviewed-by: Linus W. and Stefan W. [4,5]

misc: rp1: RaspberryPi RP1 misc driver -
	Acked-by: Bjorn H. and Greg [6,7]

pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support -
	Acked-by: Linus W. [8]

Regarding the testing phase, I and some colleagues at SUSE have tested
the patchset from quite some time now.

Links:
[1] - https://lore.kernel.org/all/leeeqocyjme2sbjbwsw6whisyu6aeq7vfypdi4arktpowzxvek@ejjyxx4iliap/
[2] - https://lore.kernel.org/all/a70e8c45-97a8-4fb6-9b27-4f9ed020211c@broadcom.com/
[3] - https://lore.kernel.org/all/8513c30f597f757a199e4f9a565b0bf5@kernel.org/
[4] - https://lore.kernel.org/all/CACRpkdZCbvNY=B05e9wGqNr5b4t8GrDVsr01C3xd5E-WWwPyMQ@mail.gmail.com/
[5] - https://lore.kernel.org/all/0c6fa2cc-3a7e-4db2-bbad-7c19a876937e@gmx.net/
[6] - https://lore.kernel.org/all/20250416193152.GA78446@bhelgaas/
[7] - https://lore.kernel.org/all/2025042551-agency-boozy-dc3b@gregkh/
[8] - https://lore.kernel.org/all/CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com/

Many thanks,
Andrea

> 
> thanks,
> 
> greg k-h

