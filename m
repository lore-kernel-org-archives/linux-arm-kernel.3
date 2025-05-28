Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD509C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFyA/Ev6J4dUYbbORf9U6czVrOpgGxA4vABlRFXcEts=; b=F5E9g/Ik020prvvuyBUHV1Cwaj
	78qT2qDLauq8ZNEYaB6CIj6O5sRKz8JR/+cNWIbObrto97jqaqKj7F3H7h8efC7h2xN1PdT75Bzjn
	KN5Jxc0SRgFlJxnT+mpTGVkAUZFHrMWOW8V2sJGD6nlWYOYXdJ6X41FwOl3XVOdGSDPXpMPknMeEX
	9uqQsqBHUwvnztUPmf4s5OoeC49aYpvZhQhfOgFrBqGhSo0PfMTFG1dGqL3gITiSgfU2wLO7xlEOY
	JQwQKCLDe4qO6EaTCcUR8EzgdAfCUYyewWv1aft3GSki/CRout7k0doca5CGYTKvSsdh/DXrUBPrf
	Pb76Dd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBjv-0000000CUsh-3IGn;
	Wed, 28 May 2025 08:02:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBgS-0000000CUSY-1JIf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 07:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IFyA/Ev6J4dUYbbORf9U6czVrOpgGxA4vABlRFXcEts=; b=evO/lKUw5MnJ7tsXnKrD9jnoqg
	b+PYF3g+tT3s31UjYVEVLUGD4QbVFxAfDe3jTt6zSBYs+BqcW7L4o5H/4lV7IAFO87k6z8drWy5fa
	+vScF2jVlpn9cLiY4WYiOtgEi5WgKmCMIPgwHxusoT7b3o06F4DVQjoJZe9dfpVaBHibLWbrJd6IW
	Gu1oxMalrZustOdJN5UvUSgvwrh1CdrLPzbN+K2eLneCuzGPxEUMaOW3MhnK4aFdt455xrGh5qZC7
	Zo/NTYKwb6lkek7YVLTY6lXsIjJqz+8AwcuyThkWfOmH+M4By7TooetgF5MUQQ5zdFOoTXrpTeUEt
	P7lO75mA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41916)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uKBg3-0008Nv-1S;
	Wed, 28 May 2025 08:58:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uKBfw-0002GD-2Q;
	Wed, 28 May 2025 08:58:12 +0100
Date: Wed, 28 May 2025 08:58:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
Cc: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, fancer.lancer@gmail.com,
	ahalaney@redhat.com, xiaolei.wang@windriver.com,
	rohan.g.thomas@intel.com, Jianheng.Zhang@synopsys.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	horms@kernel.org, florian.fainelli@broadcom.com,
	Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Subject: Re: [PATCH net-next v6 0/5] net: stmmac: Add PCI driver support for
 BCM8958x
Message-ID: <aDbCFGIi09h1irho@shell.armlinux.org.uk>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
 <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
 <67919001-1cb7-4e9b-9992-5b3dd9b03406@quicinc.com>
 <CAMdnO-+HwXf7c=igt2j6VHcki3cYanXpFApZDcEe7DibDz810g@mail.gmail.com>
 <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_005844_354212_F2F18065 
X-CRM114-Status: GOOD (  10.95  )
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

On Tue, May 27, 2025 at 05:04:52PM -0700, Abhishek Chauhan (ABC) wrote:
> Thanks Jitendra, I am sorry but just a follow up. 
> 
> Do we know if stmmac maintainer are identified now ?
> 
> Andrew/Russell - Can you please help us ? 

My mainline work is in abayence at the moment (apart from occasionally
replying to a few emails from time to time) as I have other commitments
at the moment. I still have my own patches from before the previous
merge window that I didn't get around to submitting.

Sorry, I'm not in a position to help right now.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

