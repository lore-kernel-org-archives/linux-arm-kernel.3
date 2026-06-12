Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9747CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TjyvoWU4via/Ypy3GXQXVRXUREfW9VJTOTzTI4VxYM=; b=fW3y7SCDWiO3QOuW+JPgOrWBpN
	puoUMzK+9qhKCUjgl6/l7aplDpePbmzwLhnff+0M3D2+M8AnNSEn+vbQzlyNmM9Q1ymBhUqLd6ZjR
	rXpJ2n8oVDwrqw6c14DTd8elEQzhfkU/C0nPkvD1gBUWa4xocRj8atBX6CM9NLxvy2oZ6tPtQ+wyw
	i1LIGkQZlT4CKw8rqIxwbWdp31UesBBKpJc70EdZ1sNRU2wVlfTQ/reqd9eaJBGgGE5UDLpL3uUPM
	xwdAAhbRvTmeURSagrjyn7qI1cgTjtt42epXEo4ycuHVVSF8inHErUr9lvosffTNwFFa3k3PgV0j/
	a5WRW5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1OF-0000000AuSL-2Xx7;
	Fri, 12 Jun 2026 12:53:40 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1OC-0000000AuRf-3Umu;
	Fri, 12 Jun 2026 12:53:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CAC9A4BFE;
	Fri, 12 Jun 2026 14:53:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1781268813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5TjyvoWU4via/Ypy3GXQXVRXUREfW9VJTOTzTI4VxYM=;
	b=Hx4Q/M4ohqBf2TdOcV9dEEIgp5SyEFEUbkkxOyS4nq9YEvFJOiVOk+e7X6ndp9XAo6gTYQ
	OIO72FLObx3dA4FLgZqggAGNvLGkLRHNOG9phnkr7hpFOHsn8nR0t683eO4Djov0quKp0j
	Hf1zzjllsgwriPX+wKLpBxCkuXwCpLn01wL7UWDZvZYIWNoiic7MBEPsZE29uBotEtbt+/
	g+HPO4aRYCP8Ga4hAOyAlJisX+l05AKDF1g6+Gv8tKn2qzp6jTFG00GgOCZt8ZjaBtUMqq
	g+hroHl+8+vFfC2VLQJw9YHmrZFTeKQSJR+hyNg19zIN9t004irbR9cNnwljxw==
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 14:53:31 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: netdev@vger.kernel.org, Theo Lebrun <theo.lebrun@bootlin.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Lukasz Raczylo <lukasz@raczylo.com>,
 Steffen Jaeckel <sjaeckel@suse.de>
Subject: Re: [PATCH] net: macb: add TX stall timeout callback to recover from
 lost TSTART write
In-Reply-To: <aiwA1dD-qXcT3hds@apocalypse>
References: <771b8faeaee1fce4a84a5ba2661d60b35a65a6d5.1781253818.git.andrea.porta@suse.com>
 <dbc25b24865a1ad92555bc826bef4267@tipi-net.de> <aiwA1dD-qXcT3hds@apocalypse>
Message-ID: <85507fd0fb42fca280aca1ee02178ca9@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_055337_024644_A8E6A438 
X-CRM114-Status: GOOD (  11.61  )
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

Hi Andrea

On 12.6.2026 14:51, Andrea della Porta wrote:

> [...]

>> 
>> The commit message describes it as RP1 specific, but it gets applied 
>> to all
>> other variants?
> 
> I've seen this issue happening only on RaspberryPi 5, but AFAIK it
> could affect also other MACB blocks connected through PCIe, so it
> may be widespread (even though it should have probably already been
> noticed in the past). In the orginal driver there's no timeout callback
> defined and this is much like pretgending the issue causing the timeout
> to happen to go away without doing anything (whatever the cause ot the
> specific hw are). So in my opinion we can just extend that to all MACB.
> Or maybe we should execute the restart conditionally on
> .compatible = "raspberrypi,rp1-gem"?

I just observed the issue once, but other people reported it to be 
happen more
frequently. If we can narrow down a reproducer, it would be good to test 
on other
blocks too (like EyeQ at Théo's).|

So maybe you can imagine a good repro for this issue?

Thanks,
Nicolai

