Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E7DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atwhqvIvCc3kKlK5w9bQYr3vm9b/dQm59uH/1GW9aA4=; b=JAxbaL2VQY7Pub7C/TrnFO6wgs
	3peKSI/WcjfyVt7KCUIgoUBacYaMpdaaUtcsUzeD9bm85jbTOdM3ocIGiPU3OKVasJfGXpsWqiCzR
	p/SWunPh8EfhxAgl0a4K3bszLR5gdfbB58uPKh8igIsDkeCSGIcsCPckhLAqS9WzMr864gLk6yBZU
	foa0+DD5pUQx9yuHONv8/Jz25ywE0gL/ltaFE2gxLLC8oGSaJ4LdTpT7O+YOEhf9gNvIrcB2lT/zc
	yTpYjrefTM+Ip6I8O2ABqxeOYHhPyohGJ5FAvFl4NHLDjWok//GVxfYKmGpw2xeUnt/yuELmQ874S
	vl5KsQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhHV-00000003DLs-2Vpb;
	Thu, 11 Sep 2025 13:24:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhHT-00000003DKs-0UBN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:24:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C4BF4076B;
	Thu, 11 Sep 2025 13:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2804AC4CEF0;
	Thu, 11 Sep 2025 13:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757597046;
	bh=ReBPBkxXd+EypkUBHcKbC5D48dqv14ID4CKpjTXEUa4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CaDSz7w62JVQ9qph9vkiqPWEkMdO9ksAVmIJj6NNKrNQhtpY77er7EdYsXNaC3Gw7
	 Or7QidGxUnAo4jA+WYPKEG0esydorOwwWQZMNuyXSKReLFJbk9OUJjmMX1h8WrZaCC
	 kdugKwZrxFmyMFGRCijvIsDKthcvmqU6FbjU7TfoPRV/fEKPknX6eThWyBYYYCmWGy
	 NnptvyWq2o2frDJrRPJalmbwzPlpzkUokxPIWhCQK0WY4lfqfYh6AH5G/p/N9YIJYF
	 TZ4WZwjrZBDTfKUguTN6o6JgjeEoNWh5YbaKNSRXQFbXRrQSUX+E1cGz+mssdgJDSF
	 6ZLuO0WOJbW1Q==
Date: Thu, 11 Sep 2025 06:24:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Shawn Guo <shawnguo2@yeah.net>, Frank Li <Frank.li@nxp.com>, Joy Zou
 <joy.zou@nxp.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, richardcochran@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 frieder.schrempf@kontron.de, primoz.fiser@norik.com, othacehe@gnu.org,
 Markus.Niebel@ew.tq-group.com, alexander.stein@ew.tq-group.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com, netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v10 0/6] Add i.MX91 platform support
Message-ID: <20250911062404.1d2c98f6@kernel.org>
In-Reply-To: <aMI6HNACh3y1UWhW@dragon>
References: <20250901103632.3409896-1-joy.zou@nxp.com>
	<175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
	<aMI0PJtHJyPom68X@dragon>
	<aMI1ljdUkC3qxGU9@lizhi-Precision-Tower-5810>
	<aMI6HNACh3y1UWhW@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_062407_177707_2666F32D 
X-CRM114-Status: GOOD (  11.46  )
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

On Thu, 11 Sep 2025 10:55:24 +0800 Shawn Guo wrote:
> > > Can you stop applying DTS changes via net tree?  
> > 
> > shawn:
> > 	Suppose Jaku only pick patch 6.
> > 
> >         - [v10,6/6] net: stmmac: imx: add i.MX91 support
> >           https://git.kernel.org/netdev/net-next/c/59aec9138f30
> > 
> > other patches is "(no matching commit)"  
> 
> Ah, sorry for missing that!  Thanks for pointing it out, Frank!

The output is a little confusing.

Konstantin, would it be possible to add (part) to the subject of the
patchwork bot reply when only some patches were applied? I've seen
other people's bots do this. Something like:

 Re: (part) $subject

? Maybe there are other ideas how to express that just part of the
series was applied, no real preference.

