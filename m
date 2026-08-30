Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F2BC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkgJyU5CnuE4BnlMElNZDOZylUlvGQ+88uBom0ae/JU=; b=cue7ISOGSJ8wr0yTZ0VgNl+IKa
	hWPZDC9pz03noKiJpNLT//lwLVTDP4i4BCYsuH43/aSnGH3o9LSeJvI9o2LmOKRLn75tO6UVska/c
	dPR3Tx0lawKsDfJbW/mv+e/697u4+n/v/R5n1onIE2Le8HZFnsHg11DU2l1C0F++fVwgY+J/cv4K+
	6MuX4/5ZoeGPBNf+xz5buLpvfRUmtMxk2moCaQQQ4pwFHEU+puAw0MuEik5PoYeZLVmnV6cm3YPVP
	wG3/V5UR+KpZPTDEupo8WZriHrq5NH4VgGwoD0Kdt+ywf7jx/KiNrmC3usVoG1JeFOmGNRDz6E0X8
	xBkr1Thw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aDb-00000007Y6v-3oOO;
	Sun, 30 Aug 2026 07:44:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aDY-00000007Y6I-1Uri
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 07:44:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 03F1F4E41442;
	Sun, 30 Aug 2026 07:44:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA37D603CB;
	Sun, 30 Aug 2026 07:44:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4673511C7838E;
	Sun, 30 Aug 2026 09:44:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788075871; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IkgJyU5CnuE4BnlMElNZDOZylUlvGQ+88uBom0ae/JU=;
	b=HSQQXL0r7CzNA1GNiOPyVmFwLyo8wtRokIQTh1qUxiWhj2TzG1WuUoIuBjqRY8VaE1P+Uo
	Oqb3XC0BzkcU/JTdC7iyYDWvD1QwTMwuhRSq2sx4PP+mADdVvYXs/EH2z+LjNwuQB1k1T/
	2+DnRLd6zdRLrz/u5ruMX/OAKNvWD/aRe0zq1Z2keqRHR/JrcBrSva2xBrYWsPpA3gpg/2
	Zl0cEsdbMFVQ24Ngtb/jP1GRfnrdu+YxP8R6lOc6Vp0zFL0fpfnMqMeHqIrYnTNz5i1o3p
	aQGiQ8S+mG/INUOLSsUedlesVl/n8O38ErRIqmj6Hu8upuDjcna7vMtIkfrbkA==
Message-ID: <8b798b8a-0fb3-4978-8d9d-38616ab25741@bootlin.com>
Date: Sun, 30 Aug 2026 09:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: stm32: Set TSO/TBS Tx queues
 default settings
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Kurt Kanzenbach <kurt@linutronix.de>, Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
References: <20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de>
 <20260817103337.74c30adc@kernel.org> <87mrujzzjv.fsf@jax.kurt.home>
 <20260818075335.48936b08@kernel.org> <87h5kq1s1f.fsf@jax.kurt.home>
 <20260820144528.7107ba90@kernel.org> <87y0e0x7ic.fsf@jax.kurt.home>
 <5693c628-dffb-46c4-8f7c-5a5a6c101660@bootlin.com>
Content-Language: en-US
In-Reply-To: <5693c628-dffb-46c4-8f7c-5a5a6c101660@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_004440_583125_30AF8230 
X-CRM114-Status: GOOD (  13.60  )
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

On 8/21/26 15:41, Maxime Chevallier wrote:
> Hi Kurt,

(Sorry Kurt this has nothing to do with your patch, I'm following-up with
some stuff I said on that thread)

>> However, we need to keep track of what SoC implementation can enable TBS
>> on which queue. For gmac4 we can probably reuse tbs_en and for xgmac
>> there's is capability field tbs_ch_num. Let's see.
> 
> Thanks for tackling this, let me know if you need testing. In the past weeks
> I've been looking deep in my drawers as well as on various online shops, and
> I'm starting to have a farily comprehensive set of stmmac-enabled devices
> (although I couldn't get my hands on XGMAC, AgileX5 devkits appear to be way
> outside my budget).
Made an intersting finding yesterday, maybe it's already known stuff, but it turns
out it's easier to find a DRIVER for XGMAC than an actual device...

Looking at register layouts and at some then-removed copyright notices from the history,
it seems we have not one, not two, but three different drivers upstream for the same
DWXGMAC IP :

 - stmmac's dwxgmac
 - AMD's XGBE drives a designware XGMAC
 - Samsung's SXGBE also drives a designware XGMAC

No wonder the xgbe selftests were doing the same as the stmmac selftests :)

I think reuniting the codebases isn't gonna happen in the near future, however it
could be a good idea to hack stmmac to work on amd HW could be a good way to validate
the stmmac dwxgmac code, with another reference driver...

Maxime

