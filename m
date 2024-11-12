Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FD6D32D96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkaaHxYMcgWp/Jayi5yY0YVWgrdbJQW2Bo/aXyuAcTM=; b=QG/nMfQ77hYL5LhcE4TkkUo8q4
	JXtUiKDZmQic3J/akTuzo3EiCjgP+MjbpGSNIeen4e+Zk8lCWGinysCJlsq6grZdjbnqyTvjREF2z
	RVACCGuUfdJiVRt9g9VoeCE4tbwYozg2boIGNQlqJaWlazJbmWMe2/8x2duCG0r4uRdLhY8vlwzSu
	d36tDjLzOz3aNOOuFONtG7JFZWT+msP9uG4JbVDZkdTW7dx29hPEsr/BfPVQwwl+tqmdgaGiW64sS
	pEBA5AVPv9LhX2uVhjBOKeO/jidgK0TsEOv/rMakOjYs/ftuuNGNC1p/5V32IO7yML4xlF62gMwXU
	eFaT7vCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApNm-00000003HY2-207W;
	Tue, 12 Nov 2024 11:48:30 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoTR-000000037AX-3np5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:50:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37DEC1BF205;
	Tue, 12 Nov 2024 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731408613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xkaaHxYMcgWp/Jayi5yY0YVWgrdbJQW2Bo/aXyuAcTM=;
	b=isDiJkf0oDX77LXbJdSdCzRBNxcVXYU8Eai4pp6HN/z63vhnavWl1UtE70ItXhyv7QDcXF
	Hgo8EJb7GPFkqIdTH9q/pUSAacJc7nfeAzL2kdSlKlv/Iy0k0uih6Dw0d+aJVBQ4QBW+16
	UTjWOTeDMrFkVK1WXoIcFnZlfsDpSZDRaqIF0Ip1YFVNWBhmiS6udn0QDmXrDY/mqt9kAU
	rReUKiWoFRLHv461lr7igdYCGG8/l1RDYhXE/IrLkZYhweOB2kEZvjgOVLsy8nhlPWOnGH
	W4YleSe/ON9aFboToWLe5yXSTIPpSoglbRTZRjlXLyQSa5EBspMWShEGQeYvVA==
Date: Tue, 12 Nov 2024 11:50:09 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard
 Cochran <richardcochran@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/9] net: stmmac: Introduce dwmac1000
 ptp_clock_info and operations
Message-ID: <20241112115009.028b8724@fedora.home>
In-Reply-To: <1b335330-900e-4620-8aaf-a27424f44321@redhat.com>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
	<20241106090331.56519-5-maxime.chevallier@bootlin.com>
	<20241111161205.25c53c62@kernel.org>
	<1b335330-900e-4620-8aaf-a27424f44321@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_025018_128884_905866DD 
X-CRM114-Status: GOOD (  15.50  )
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

Hello Jakub, Paolo,

On Tue, 12 Nov 2024 10:28:21 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

> On 11/12/24 01:12, Jakub Kicinski wrote:
> > On Wed,  6 Nov 2024 10:03:25 +0100 Maxime Chevallier wrote:  
> >> +		mutex_unlock(&priv->aux_ts_lock);
> >> +
> >> +		/* wait for auxts fifo clear to finish */
> >> +		ret = readl_poll_timeout(ptpaddr + PTP_TCR, tcr_val,
> >> +					 !(tcr_val & GMAC_PTP_TCR_ATSFC),
> >> +					 10, 10000);  
> > 
> > Is there a good reason to wait for the flush to complete outside of 
> > the mutex?   
> 
> Indeed looking at other `ptpaddr` access use-case, it looks like the
> mutex protects both read and write accesses.
> 
> @Maxime: is the above intentional? looks race-prone

You're right, this is racy... It wasn't intentionnal, it's actually the
same logic as dwmac4 uses so looks like dwmac4 is also incorrect in
that regard.

I'll send a v4 with that change, and a fix for dwmac4 along the way
then.

Thanks for spotting this,

Maxime


