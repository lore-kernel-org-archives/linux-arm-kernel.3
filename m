Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A73FCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAZLhFiggp3ISn2IlMvvHN2Lj6HBhB4JUomxmoaFyVk=; b=ylmCyiKrf02zpN5Mix1td9XR1I
	azPJcyXu0YGF0ohVtv+rJ7eE8mBs5imYDpleKJ31B/VqmcZyk3RxTzHUEpJyLH2Mb5KOo7/0aSBJu
	eTApLFLwrFp8ndcLM0vsVEg449NZbmA0XzklnPVhfH81VkcoYcvNddGSlMZKNelMGJlWvAXICHqsH
	oz+KueANDwAHsySXTLWt+FPajKfcB7i1oywxRFDpUQB44/eCiL5TwMPnfjwRwsIcTnSIjHragsDIj
	6cvdFYNWYmiz6KVCrwXourQCadz3JktwDSPy/zdtovJLGQmbgfqW42dt7pDFVAQM9p2rekMQSrZDe
	4UeRzNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYcD-0000000GK5g-2TTJ;
	Thu, 27 Nov 2025 09:48:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYcA-0000000GK4i-2RiZ;
	Thu, 27 Nov 2025 09:48:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 194DB4E41916;
	Thu, 27 Nov 2025 09:48:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D85086068C;
	Thu, 27 Nov 2025 09:48:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FF99102F2343;
	Thu, 27 Nov 2025 10:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764236913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BAZLhFiggp3ISn2IlMvvHN2Lj6HBhB4JUomxmoaFyVk=;
	b=gMSaUZeLDRdv7XorMV0FKyzctA/4ZSOlfHUNmQrVCZ+WM3vgTMDTAzCIWb21ezNRx4QYJv
	iwN7ZWp9YPgZVjsmhYZAtipIhD6LRAAeFtP3YsTnGJTfeLLM/FJDqc9twcVfL2ekMnIE5F
	YYuFFO7zSmMsyeumbEcnqxTOP/JEF+yYjFqviylqeP9fxQaSeGpA6/4T6pNMMAcvJRjl+r
	q/PQSQdH+7DnYQhMwzXCN2xdbMyxWN4zSYaGmrQ36SKtfFpvzsgum0qiYcjcqE69ftmTn1
	ivwmnZKJjCz67sul0Q4lbrdcQLshTZJuxBUgW/CRzkd6w6chphh3z6T3QBm9Cw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Nov 2025 10:48:26 +0100
Message-Id: <DEJDSE73CJES.2AB8YSKLW6VE1@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
Cc: "Kever Yang" <kever.yang@rock-chips.com>, "Minas Harutyunyan"
 <Minas.Harutyunyan@synopsys.com>, "Alan Stern" <stern@rowland.harvard.edu>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "William Wu" <wulf@rock-chips.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com> <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com> <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com> <DEJD8DJZFNZO.11B1UBXJBN7MO@bootlin.com>
In-Reply-To: <DEJD8DJZFNZO.11B1UBXJBN7MO@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_014838_786215_CFBE408A 
X-CRM114-Status: GOOD (  14.19  )
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

On Thu Nov 27, 2025 at 10:22 AM CET, Luca Ceresoli wrote:
> On Tue Nov 25, 2025 at 4:28 PM CET, Th=C3=A9o Lebrun wrote:
>>> The code already checks for !rport->suspended, so add a guard for VBUS =
as
>>> well to avoid a disconnection when a cable is connected.
>>
>> Your commit message was clear but I was missing one key point: what
>> rport->suspended means. It isn't what I first thought. Instead it means
>> phy is powered off. Naming is bad but unrelated to your series. Maybe
>> add a comment to your commit message like the following?
>>
>>   The code already checks for !rport->suspended (PHY is powered on), ...
>
> You are right. I have added a slightly longer text:
>
>   The code already checks for !rport->suspended (which, somewhat
>   counter-intuitively, means the PHY is powered on), ...
>
> Still worth your Reviewed-by?

Even more so.

> I fixed the other issues you have reported, for patch 2 as well.
>
> I also added the Cc: stable@vger.kernel.org line, which I noticed being
> missing.

I never add that Cc trailer and only rely on `Fixes:`. I thought it
used to be documented as an alternative to that Cc trailer but it does
not show up in `git log -p Documentation/process/stable-kernel-rules.rst`

There is one indirect mention of "scripts that look for commits
containing a 'Fixes:' tag":
https://elixir.bootlin.com/linux/v6.17.9/source/Documentation/process/stabl=
e-kernel-rules.rst#L132-L134

Anyway, you do right by explicitly tagging `Cc: stable@...`.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


