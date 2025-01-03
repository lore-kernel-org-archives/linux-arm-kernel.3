Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B88E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unC2Fhn6EJ32Xsi2ODneZGcaNI6Y5JHf0QRbi/IbyPo=; b=x0d3n83ir2nfCkzQpJwJckIzcH
	WE4Q48WK1h77cr86GGl/P5jjqajpMFqsd4TlunWb1DDBNYE9ZwxAo6bTQEXqmcBASOSFGXpQfIbu3
	WlmsW0awVejNRv8NWisSSV3sF5rITe+/7xA3qEqKSR2pKGCjYUaVTPL6yRIfDMc5OWttn8AfWCerX
	nDpf9fh2LgjA5QxF4v8BvX4cCM/EA9VP/FGJCC1veTZVvyaym4FGhwDWJF3aNn/vLTiBpFsG4Qk4M
	FWgiFxQbuu/qTy0utUeRK0cEFc2FiQC8QG/PeMlhC0ZMAYTXR6Vu5OZbmM4Z48XiXRxhVUqTKsuyR
	vzyRoVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkVS-0000000DQeV-3Cgc;
	Fri, 03 Jan 2025 16:26:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkUE-0000000DQQ9-3xUb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=unC2Fhn6EJ32Xsi2ODneZGcaNI6Y5JHf0QRbi/IbyPo=; b=nNfH4Lh4tOUqX+xZn1XjPeQHHF
	gFsOfzz8PlpDhe8RzH1in7ekPJfClWgJcCj52YWEv/WO6PNBF7tbqOBmftkQ3r4ECsjthmIsNsklL
	zb6MUEM8BF/DDwVkrTm1p7+QGspl2CRgzr414HmCNtSgZz6N3yjl/UgwZW6UvdIfmMvo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tTkU4-0015M9-KI; Fri, 03 Jan 2025 17:25:12 +0100
Date: Fri, 3 Jan 2025 17:25:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH net-next 05/13] net: enetc: add debugfs interface to dump
 MAC filter
Message-ID: <696fb436-40f6-4a9c-af0b-2851f8450bd1@lunn.ch>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
 <20250103060610.2233908-6-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103060610.2233908-6-wei.fang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_082522_988946_A47D0E0E 
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

On Fri, Jan 03, 2025 at 02:06:01PM +0800, Wei Fang wrote:
> ENETC's MAC filter consists of hash MAC filter and exact MAC filter. Hash
> MAC filter is a 64-entry hash table consisting of two 32-bit registers.
> Exact MAC filter is implemented by configuring MAC address filter table
> through command BD ring. The table is stored in ENETC's internal memory
> and needs to be read through command BD ring. In order to facilitate
> debugging, added a debugfs interface to get the relevant information
> about MAC filter.

How do other drivers do this?

You should only use debugfs if there is no standard way to accomplish
something. And if there is no standard way, you should be thinking is
this a common feature other drivers will need, and if so, add a
standard mechanism.

You will get pushback for using debugfs as a bumping ground without
adding some justification that debugfs is the only possible solution.

	 Andrew

