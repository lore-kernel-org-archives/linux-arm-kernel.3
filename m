Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3630CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OegdgNVbNw+KkRfrQDXaRBUpYFyQJOKVqsrjfmccusE=; b=aKdpEHonELzBQF8D6Rdec+bFwW
	uGZDu51efxpc/k0FhFJ2ko8Rqaa5u2+Zj/gpppTjiJJKPtZZDir/20MjMEhim38ee/ST5EVoYpFe1
	fkYqDBMn5Mm5fYpoR+ES0I9WZZJjTUoLP0t33d9MtPO/rkRh5t3MY8ZuKNwsDqFqDz3b7v7QpJUv6
	K3QAXYYC3KUeqaTNkwrtJps+oYPVO+pjywUxaYY/otASK6G17jI4B5p2iU/TsRpLL9L1Vn5SH2K+c
	j/nAge3JgxcVAqBxHDieLl1WSZj0NPPQb7+TpksqZcdoN7X3Hog2JWHW51ggv5pRj4TywxSp1i8gN
	kqwGuJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7K4-0000000GClV-3FCJ;
	Tue, 21 Oct 2025 08:02:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7K1-0000000GCj9-1ZI5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:02:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9ED954E4122E;
	Tue, 21 Oct 2025 08:02:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6544860680;
	Tue, 21 Oct 2025 08:02:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31523102F23E1;
	Tue, 21 Oct 2025 10:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761033736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OegdgNVbNw+KkRfrQDXaRBUpYFyQJOKVqsrjfmccusE=;
	b=Ujd1EYVBFKWa1NGizpbWWxW2JcSND0EfAG/uNPgiqM7MtxUPYXj8cvBuZHZECAxyzULNWV
	vrBlgx+YQ+SGfoxQFPBmfmlzDf2JlljWJvY9YIOQUM2sXrr9XlN/apuAR7bMj4vNmsHh1/
	CRK5W1KvP9/Grku+NViQRRcU4ACaP/dnORToyb2wIEjCCszc3MjS2hBUR2jgaINm1limPa
	iDTrdcJxefCwoOcD+uhypcdvOMqpgmish1KWBWd97oAHVNiFi36612MUwzASchfzMz7Bwe
	k4HUKjjt+XkJ2xwwejOCLPGk3Mot3GrOuwvIWFVqM/8uha1dTJIck21eUTKtkg==
Message-ID: <911372f3-d941-44a8-bec2-dcc1c14d53dd@bootlin.com>
Date: Tue, 21 Oct 2025 10:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: Allow supporting coarse
 adjustment mode
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
 <20251017182358.42f76387@kernel.org>
 <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
 <20251020180309.5e283d90@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251020180309.5e283d90@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_010221_548931_F1397317 
X-CRM114-Status: GOOD (  17.86  )
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

Hi Jakub,

On 21/10/2025 03:03, Jakub Kicinski wrote:
> On Sat, 18 Oct 2025 09:42:57 +0200 Maxime Chevallier wrote:
>>> If the HW really needs it, just lob a devlink param at it?  
>>
>> I'm totally OK with that. I'm not well versed into devlink, working mostly with
>> embedded devices with simple-ish NICs, most of them don't use devlink. Let me
>> give it a try then :)
>>
>> Thanks for taking a look at this,
> 
> FWIW I dropped this form PW in an attempt to unblock testing of
> Russell's series.

Yup no problem for me

> I'm not convinced that the tsconfig API is correct
> here but I don't get how the HW works. Could you perhaps put together
> some pseudocode?

I'm not fully convinced either, devlink could also work. I already have 
a patchset ready that uses devlink for that.

Let's see if I can do a better job explaining this timestamping
parameter :


- In "fine" mode (mapped to precise qualifier if we go with the
tsinfo approach), which is the mode currently used in stmmac :

  u32 accumulator
  u32 addend
  u64 subsecond_increment

  at each ref ptp clock cycle {
    
    accumulator += addend;

    /* accumulator and addend are 32 bits. addend is adjusted
     * to control the drift of the target frequency.
     */
    if (accumulator overflows)
      current_time += subsecond_increment

  }

Main advantage: We can fine tune when we update the current_time, so
basically we can multiply or divide the ref ptp clock based on when
the accumulator overflows, and use the resulting clock as the
timestamp source.

In practice for stmmac, we set the addend to a value so that it takes
2 cycles to overflow, and we adjust the subsecond increment when
updating the PHC frequency. This gives a precision of 46-ish ns.

We do this by design as the ptp ref clk may be fairly slow (down to
5MHz in some cases). If we try to rely on accumulator overflowing at
every cycle to update the time, we'd have to overflow multiple times
per cycle, and the computation of the addend value simply overflows,
cf commit 91a2559 ("net: stmmac: Fix sub-second increment") [1]

This is basic PTP follower mode, we continuously update
the clock used for timestamping.


- In "coarse" mode :

  u32 subsecond_increment

  at each ref ptp clock cycle {
    current_time += subecond_increment
  }

We increment time at a fixed rate. The current_time can only be adjusted
by setting the entire current_time, which is jittery or even non-monotonically
increasing. However, we can use a 20ns increment (or even lower if the ref
clock is faster), and if our ref clock is externally provided by a high
precision source, this allows implementing Grand Master mode with the
highest possible precision.

[1] : https://lore.kernel.org/netdev/20200415122432.70972-2-julien.beraud@orolia.com/

Hopefully that's a bit clearer WRT what the HW can do.

Let me know if you need more clarifications on this, I'll send another
iteration once Russell's cleanup lands, using either devlink or tsconfig
depending on what we chose here.

Maxime

