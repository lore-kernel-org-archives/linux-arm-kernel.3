Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7810C98317
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 09:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22dRL6sLaeQXaep6GKzfTNrZ7nA1X2tU2tpqpgJzvfg=; b=NNPsJtJG+LoMC7BFpTlVPcSIh5
	NH4Oyrrs55lK4mgarBuxYaKyc33IGxE/AMj1ryVk/C7As+PNxeJxB07Zv/ZBvcq7YxKxW0k5uFqgu
	gU6HMwugKCGFK5rcd7j52zl3dQOPyNlxrW3UkgH/xSQ8lC/Ifq9WlPjl2XWUE6y4JJSJsxIx+o8Xg
	j6Es1JuGdAklf7QVxl3KPmt5KaJFRwGWEbTtGCvs5p4bDGx2mKCamevn9gHSrl2AtKGjV+GoG3s70
	VnOz1jdZrqiCtaH8cmKxmP8xmzDPhkCpQ65Q+fE32afj/pBhh7wLeghrxIXNwEx5tB+I5MEFum51H
	5BfWePAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh2Zx-0000000FQ2f-3tmi;
	Sat, 17 Jan 2026 09:26:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh2Zu-0000000FQ29-16ex
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 09:26:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E9EA24E42138;
	Sat, 17 Jan 2026 09:26:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A339660708;
	Sat, 17 Jan 2026 09:26:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6AB010B68FE3;
	Sat, 17 Jan 2026 10:26:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768641995; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=22dRL6sLaeQXaep6GKzfTNrZ7nA1X2tU2tpqpgJzvfg=;
	b=Pug73uwebtcwYIIE9dsy+u5IlfETxLEgM1AUb92W+79v5ZcNuuhxnX36awql6T5cthXcds
	8EzXzI8xCLcS6RgZxTdnFg8PfajoTszCLifFWWzezKQNqZU3+UNnJHbFbNCOig0/hTdyX7
	NQObUlzy5DTbbmk+XF0xixUd2G6FR6UPf0+s0vbsbLalcdpUYUyY14d8ICGI5svHAR/Guf
	F1qLTCS3ATYW7cEOWXHClvK64+Dsh7BrKhSafsBEabhvDZriv944Q7lFe/CSy7R6rwfn6m
	5lvACW0+hZwrUBejSGBLymE0GtpLrl9Q6L0Cjlmtnq7BoUuUYqOw6D+Vx3oNTA==
Message-ID: <afbac1ba-43b4-4c0a-84fd-87866e954fa2@bootlin.com>
Date: Sat, 17 Jan 2026 10:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: fix dwmac4 transmit performance
 regression
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
 <ab2d7cc9-e7d9-47fb-95ad-90ae4f5f1f67@bootlin.com>
 <aWrH-FAuWnqmbSaJ@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aWrH-FAuWnqmbSaJ@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_012642_787526_54AC97E7 
X-CRM114-Status: GOOD (  10.89  )
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

> I really give up with when fixes should be added or not, because it
> seems quite random when it's needed and when it isn't.
> 
> And no, don't quote the stable-kernel-rules nonsense that is
> meaningless ot stable kernel people, when they use AI to analyse
> commits and pick stuff completely randomly.

The rule I'm following is the one in the netdev-maintainer doc, that says:

	'for fixes the Fixes: tag is required, regardless of the tree'

> 
>> It would also have been nice to be in CC, I spent some time on the bisect...
> 
> I thought you were, but I see now it was a different Maxime!

Bah, no worries :)

Seems we have a bunch of french people with similar names working with
st platforms or stmmac on a regular basis, I understand the confusion :

Maxime Coquelin
Maxime Chevallier
Gatien Chevallier

Anyways, thanks for the quick fix on that !

Maxime


