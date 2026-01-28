Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3868D3F06B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ihz3yFLvfwz7g5/dljDb7S5GJKxmDcCGi9AFt75Q+Jk=; b=vNXAQCfJYEVPYRsMHylzUpzAx1
	uyre2VkR3KCfqJ43LR9tT7FZCOfDTChVpjE9PKEhAJH377hJoyerd5qsqWNmtwChCBTxnT0Eh8bSJ
	6fFjzNKMNW7ha3ktzlyvZK5ZTt9hR1QA43bduz+7ljFZfa+g4HvuEvS95w4sUgSwTCCdZ2Lb59YLY
	FwAwMqGBqY9GeJyFvjazU2khsaVNasbwfSB1S7OVwj58n05235XN8rb8fLgClPFzQ3bLMzaUei2JW
	1ooP6ZN9BZUmOtwDvN/h/Gt4ivnyarKSUtwZVcGAqVXQQaCNMkmd+sMMmq0NcvTUeLb8PUPUcRng7
	BLEmv04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6JZ-0000000G9Nj-2YJ5;
	Wed, 28 Jan 2026 14:14:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6JY-0000000G9NX-2bNR;
	Wed, 28 Jan 2026 14:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ihz3yFLvfwz7g5/dljDb7S5GJKxmDcCGi9AFt75Q+Jk=; b=e7uQIQioxGjE2rymPJBp4usrNN
	LZbAwupkG+1kqChiQclEDyq7ba8dM+Y8r09iemiRJKQVDG9gdn1UWeA0Yu1lqJNEXmGpmkzKx3m+o
	m4wdJL1Qjs7PWD6EfoQAhFrD8SdHa1ebZOWOmJQnTay9z/Ab4rv8HhTC6IGIFUk7S/XYss8O/H7qV
	qwAzeJgoNwUaaDLDCyQOMgNUEBpKRehCtgPsnaqZYOJrAEFN8vj6GkfeSxQF4FTwQNtKngFB9zYf9
	5wauPYOnodm9UGO1dtxvQyhoUec47LXwZ7v9joeqkxO2KsGCL5Ba3ojyaT45XmSPnw5jkgyNzs+S1
	debrrVZg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6JV-00000008giu-1ye5;
	Wed, 28 Jan 2026 14:14:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 903231A2ABC;
	Wed, 28 Jan 2026 14:14:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C4BE6071F;
	Wed, 28 Jan 2026 14:14:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99C28119A880F;
	Wed, 28 Jan 2026 15:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769609662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Ihz3yFLvfwz7g5/dljDb7S5GJKxmDcCGi9AFt75Q+Jk=;
	b=RSrp9fJa/M8eOIGibDfwPpaadNoi16B6bkrtuqA5ZPtAE4g2e/UKzzpRzeCh963tJORuh8
	u/QxqRnXt66s4pr0swCK5TfwUxtX3f45uO+4y3XTOb23vCAKIXtNtHwd6UWI0BPq9LKvXg
	1NHsw8jm4loW9Em7L9KTZRVCo7FI1Tc93TeDB1ny9EQTlMW9U+tzNid+SfIDwtkwQ6jxOq
	vDWtD81O/76sh/ZvVe1VpG2x/dnDfN4vbck9Z+sylp2H53tsu4kTBuW0OLIRVCDG1w0MsE
	ZX3hST/ttuB9nRFIGm3kVbJA96HU/u/Khec0UciazKPeAD8CsKiZAllGu654aQ==
Message-ID: <b1971281-2df1-4f61-9a66-9caa9ee187cf@bootlin.com>
Date: Wed, 28 Jan 2026 15:14:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: stmmac: report active PHY interface
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aXnpTy6XckPGcmg0@shell.armlinux.org.uk>
 <E1vl36F-00000006url-1fWA@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vl36F-00000006url-1fWA@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_141433_644878_011FC4C1 
X-CRM114-Status: UNSURE (   5.88  )
X-CRM114-Notice: Please train this message.
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

Hi,

On 28/01/2026 11:48, Russell King (Oracle) wrote:
> Report the active PHY interface from the point of view of the dwmac
> hardware to the kernel log, where the core supports reading this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Tested with dwmac-socfpga on CycloneV :

RGMII interface : 

[    0.898925] socfpga-dwmac ff700000.ethernet: Active PHY interface: RGMII (1)

1000BaseX/SGMII interface connected to Lynx PCS :

[    1.003223] socfpga-dwmac ff702000.ethernet: Active PHY interface: GMII/MII (0)

Nice.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime



