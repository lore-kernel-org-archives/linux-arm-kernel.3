Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC54FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 02:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TppaCDBBSzNsxD6lOnTs78aAdw1fcP4/VQvmYPvxh2Y=; b=0o0ma4sfw76g1YqHCZwGbS5gcj
	oJx2Ds31bUJzHnlytbNiNUOFCRcku/2MSa+KMxHVEfU09dbtHNnyuir+c8Q2KxVrSEMT/WoLHSTsX
	XVozR8tDtojFwzpzh6JuecuUAV4aekYZZf7+dY4bcL5C5hsu3ymEGKRKuOTqpRDuVEBcXVw4A+Mo/
	pgZ9i2Q7ICU/MfecP+sI3Hxc5ZYL6IOZcgKlXvw9u2VtVUclEuAIN2oEe+yrPoNly+oPtNzTUwb3q
	uFAoGDabrtPnwQBqnzV9xQWQjjs54bBY6BgaqoaCTU/Q9JMzwfFZE0UkfdyCFW7Jh7EevYn8zBzG7
	9YOnycwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFpz-0000000DfQk-1ij3;
	Thu, 16 Jan 2025 02:42:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFoi-0000000DfI5-1bOb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 02:41:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E2575C5BE0;
	Thu, 16 Jan 2025 02:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E850C4CED1;
	Thu, 16 Jan 2025 02:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736995267;
	bh=357X8ueNSmXmBC6zxKI/63tEqCXBjNeDU6GK2yNvUAc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JPasyAZ2pXyo8qbSFD7ZwIEuV1EKK/LSSeua5vU//cH6s7iu3tSTYwGQSny2KAC7D
	 VznLxn5ygEAW5jlVKrZMx3n+Sb+AI/Jy66mm7E0ZwL2ppZuSFXd1dwS8tP+plcfKUj
	 QEWcn41dyqz32+oVWK4tkBXlo6v9cCydSkC7dtKql1zZv0dq7H7lIlVi1/HTR0NrFa
	 coEvsEQlICfRbB9IWB+lIvHzUMx1DQzdBK8NXErtZL694f3SCcyssiyaNNhzDscAwg
	 o/LC8tuOBCs6gsUPk/KAvTSKdjKbY5lditIZMMnjqOkQdiPRWKRMWU3mjDNdvkOG2J
	 9YoR6N03JSnOw==
Date: Wed, 15 Jan 2025 18:41:05 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
 <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>
Subject: Re: [PATCH v2 net-next 07/13] net: enetc: add RSS support for
 i.MX95 ENETC PF
Message-ID: <20250115184105.139aed9c@kernel.org>
In-Reply-To: <PAXPR04MB8510B52B7D27640C557680B4881A2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
	<20250113082245.2332775-8-wei.fang@nxp.com>
	<20250115140042.63b99c4f@kernel.org>
	<PAXPR04MB8510B52B7D27640C557680B4881A2@PAXPR04MB8510.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_184108_475305_D671F7AC 
X-CRM114-Status: UNSURE (   8.36  )
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

On Thu, 16 Jan 2025 02:24:10 +0000 Wei Fang wrote:
> > Why create full ops for something this trivial?  
> 
> We add enetc_pf_hw_ops to implement different hardware ops
> for different chips. So that they can be called in common functions.
> Although the change is minor, it is consistent with the original
> intention of adding enetc_pf_hw_ops.

In other words you prefer ops.

Now imagine you have to refactor such piece of code in 10 drivers 
and each of them has 2 layers of indirect ops like you do.
Unnecessary complexity.

