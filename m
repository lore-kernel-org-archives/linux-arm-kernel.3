Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7BACD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4p4Y6WbmGM6SMda6SpZT7a84alwNhxR4Wy40ZV3+bm8=; b=WFhny0RNt8eGhRrggyETX5S8SG
	b9mJvunE9DJrwkcNFW5hh+ypvJAhjFORF5pUXkW3ctHH1txvZq7Bsbnl4JXeI/NE6Aa4eG/gDZYSG
	EqBTkYtTHFRiLWG5GcU+k0H7yy2cW+FwO+uwNz5kV8NnsOuclH875+mED5ExImnJ8DtINzcG/v1Fn
	g/b8RlVlGpupfEsr7BRFTMgJLYbfNl2bkqP6o8tm87VcnBRBJFdVChB4t7Ey9JVRp+G341bHBwWJw
	SgWwff4T4M16HdkYHf2htbWC7CliGTznP9XBDEM76nlwyPJM9NfFqfL4qXtAWdUX9DwccOBMTOy+7
	HlKjo36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTpi-000000027HA-1mXi;
	Fri, 19 Jun 2026 07:40:10 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTpe-000000027GQ-3LfA;
	Fri, 19 Jun 2026 07:40:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED8D2A3F88;
	Fri, 19 Jun 2026 09:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1781854796; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4p4Y6WbmGM6SMda6SpZT7a84alwNhxR4Wy40ZV3+bm8=;
	b=qjewW0t1zJDFTwlhI+N8vhSyyfjwpD+4QboNyjzo9CRm+THyWm5+e5ypPccEO4ED2aCh8U
	VAQNf9YWhYNn1wtaBxUiQA96pn9T1Pk4ehDzI+lD45mArtx/xQ0+bv03L3qmCnpmTLAKqD
	1Qj9V3xPLPK4Bkwzo+qK3ckWyqTx0Hz4OFX1JIMgwdSrxeLELxnr/zeLf869nWYEVxn4ek
	IAT5ZWsBczBy1bxTxemEwc52qe3B0PcvT9rejYvdkPfn+BNquFF/9yJccBeJTes9bsbCk/
	FmlGUep8JuFQrj50rwv6jih761uFopwThuCW2EvF/HOshptevpvx+vhhDFPHng==
MIME-Version: 1.0
Date: Fri, 19 Jun 2026 09:39:52 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Lukasz Raczylo <lukasz@raczylo.com>, Steffen Jaeckel <sjaeckel@suse.de>
Subject: Re: [PATCH v2] net: macb: add TX stall timeout callback to recover
 from lost TSTART write
In-Reply-To: <ajTtF2xy3WS6NfBi@apocalypse>
References: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
 <DJAKGHKZGUI2.29AHYNFX4LGBJ@bootlin.com> <ajTtF2xy3WS6NfBi@apocalypse>
Message-ID: <9dec2aa9fc7669a1f86ceb1c2c9de68e@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_004007_598692_D05A4154 
X-CRM114-Status: UNSURE (   4.69  )
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

On 19.6.2026 09:17, Andrea della Porta wrote:

> [...]

>> Any news from the Raspberry Pi community about this bug investigation?
> 
> Not from my side, unfortunately.

If I remember it correctly, the downstream kernel carries earlier 
versions of Lukasz patches,
which he also submitted there. If time permits, I will run some tests 
with mainline kernel
on Pi5 + downstream kernel with reverted patches + only the upstream 
patches.

But realistically this won't happen before end of next week.

BR
Nicolai

> [...]

