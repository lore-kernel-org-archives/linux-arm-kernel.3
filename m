Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86534CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXNqIy91mHPmLyBUYzLy8qeZ7FOKJrKClaIbZivIa/4=; b=XEjaskDcB8c3CASyivi7rA7JUw
	77aiuT/Cdnx1vhpEpuFkYFp/6ny9twOiT3pYUyMGN1P+vAwxhHxf6eKTRGgvTSfzpX4pBXb+3e0bk
	bHvAvu2z620uQLR0fXw6sJS40kEvVINNxLLQlt8jIcAiQMl6eU/xIKJWXSqry7j9m1NF4lyPu7nYR
	kcBjuIMMSYKehgwUygIu6NLau/+Rr5Jtql0FhdudjTXxW3oXd4MM43VkY7IetN2bpqTttV9bVFm9B
	jvdc1JPOyfNVfPJxIP2oewLQrmwPDIf3hq7aTj6+8jrku8hddvWp7XmozLYoZoipUhM1lvBfL2864
	Kyd5UnvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBt2j-0000000601X-29KM;
	Thu, 23 Oct 2025 10:59:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBt2h-0000000601B-2leY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 10:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cXNqIy91mHPmLyBUYzLy8qeZ7FOKJrKClaIbZivIa/4=; b=ljnUuImE9Pjqxqy0Uz5qYz6n9e
	mGCtjIUZIsd8VeoxBNlc51Frunk5tzXuigWR4oE67G5/H6szRyYTez9MIgvnmQSNh4Mw0eOydkivV
	mD4YugCenid+cFxILBA/x/XzqQa/ZL4mutB4tYA0aeKv9M1Q3dNzphSJD6Sd0Tbl58dUax4bFVDo/
	viI2gysJGHzHvM0rj+FTKe7sYmxNOGmMcpGO0j4gw2+c479jYSr/16oHGCDRG4Cj3fANteVJGbu5z
	RCo/wbUYOg/Lbi7u6XKIkydMPRrDNHOXF9ZuDsZ71qFEW3wnqTcn2u60T8c7lhjC46U1T82xbnjmE
	aJL5ohPw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41112)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vBt2S-000000006EA-3ZEb;
	Thu, 23 Oct 2025 11:59:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vBt2P-000000001d1-35L8;
	Thu, 23 Oct 2025 11:59:21 +0100
Date: Thu, 23 Oct 2025 11:59:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Rohan G Thomas <rohan.g.thomas@intel.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
Message-ID: <aPoKiREmRurn-Mle@shell.armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
 <d7bbb7dd-ddc6-43d6-b234-53213bde71bd@altera.com>
 <83ffc316-6711-4ae4-ad10-917f678de331@linux.dev>
 <0d3a8abe-773c-4859-9d6f-d08c118ce610@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d3a8abe-773c-4859-9d6f-d08c118ce610@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_035939_717074_6A292C5E 
X-CRM114-Status: GOOD (  22.41  )
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

On Sat, Oct 18, 2025 at 07:20:03AM +0530, G Thomas, Rohan wrote:
> Hi Vadim,
> 
> On 10/17/2025 5:51 PM, Vadim Fedorenko wrote:
> > On 17/10/2025 08:36, G Thomas, Rohan wrote:
> > > Hi All,
> > > 
> > > On 10/17/2025 11:41 AM, Rohan G Thomas via B4 Relay wrote:
> > > > +    sdu_len = skb->len;
> > > >       /* Check if VLAN can be inserted by HW */
> > > >       has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
> > > > +    if (has_vlan)
> > > > +        sdu_len += VLAN_HLEN;
> > > > +
> > > > +    if (priv->est && priv->est->enable &&
> > > > +        priv->est->max_sdu[queue] &&
> > > > +        skb->len > priv->est->max_sdu[queue]){
> > > 
> > > I just noticed an issue with the reworked fix after sending the patch.
> > > The condition should be: sdu_len > priv->est->max_sdu[queue]
> > > 
> > > I’ll send a corrected version, and will wait for any additional comments
> > > in the meantime.
> > 
> > Well, even though it's a copy of original code, it would be good to
> > improve some formatting and add a space at the end of if statement to
> > make it look like 'if () {'>
> 
> Thanks for pointing this out. I'll fix the formatting in the next version.

I suggest:

First patch - fix formatting.
Second patch - move the code.

We have a general rule that when code is moved, it should be moved with
no changes - otherwise it makes review much harder.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

