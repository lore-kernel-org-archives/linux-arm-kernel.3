Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568B5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpUwu4il1VAiTMh13wOHJHOYU4uf2KEQd4xPzFOpTMk=; b=Z3u5x3qzsx5gfZ
	VJmCyF4M/Ptqg+zbZ8H2rGiqRDYJKDjuxhJjiu+lGAIwt3JClnqyxBEjJm5P1tf+r837lOgHXUZWP
	AXyRFg1P5sIBwdLpQbPgfUpxwqPoABc/gqTdQK2iPfN07tJCFoZXvHEQgyVdQKwn3Lok2pxFyGr46
	TySaQ+PQItc6nI4Uou7CwFgMqvWDupdxZdN0lK78kZUvxmHHyHPhlGN77Oq282dFyPktfb4MayebL
	ivMKHS8Hdt1liUXHYTAPioQAQPhrX1hrLkA82vO9MxPuEVcSH4AWVvDu9SqSdNmFfMkWqJPkDdJOW
	OAj4eJnZ2kpyAhBIJOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXLH-00000004mLQ-3dKS;
	Wed, 23 Jul 2025 11:08:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXGY-00000004m0A-2MBZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Jul 2025 11:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tpUwu4il1VAiTMh13wOHJHOYU4uf2KEQd4xPzFOpTMk=; b=a+k3aN9d1SXjLZWGre9QeKEY8c
	EBYtaot1nFSOgdlMm5nKCT0qmq4CI8Qp+/smtGej/EaWit9DyEirNaRlCBCpn5+CFhnVhlCLJCT0x
	AuC7IIMgAw8bZKaCN6HQsScuLrLA8ASS1l07w1qvCz57MRiaAcmTaU+walDQLGQhKLvUKyMeH6830
	e4GpbAVuv/qtThkkJy4P4MbaeJFbg0NNeo8TvhfMo3SB/vz173vuoE11Id+9LLztzhvAuQqzzPSK2
	iuYaogkwATg+Xiu2MYTMG4nA8fYHKDiBIdW837kFMQ8aMvvqaUdtLUcLUb4ORsQzxTLU0CWcEJait
	7wOuJKLw==;
Received: from server.couthit.com ([162.240.164.96])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXGV-0000000BSN2-04cK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 11:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tpUwu4il1VAiTMh13wOHJHOYU4uf2KEQd4xPzFOpTMk=; b=qfN29ILP5BDZQoV1YozWjQ2m92
	ZlM0uuWGKU/sFaEY7+M0Upxd9Io6/DdLXOh/yhGIu9gvfBKELJgamULl8hSnqVSmdzk/JAf/uvW/S
	kNsNOGwEbXYVdPHnKPXTLdyV2pDeMCFM+TOyt7qVKzVxtqxJZhPI3HyEooSuPSHHzqpw0mNIeLRbj
	v0BRvORh1FxxPy1BmtUMToWTOFdCzsKIC3IcP7OCAYk9i6X/gVKFXglJZ4o16Lfz6pWuNHw8UFq6I
	hRcivPL1CmMq7s4QIfwY7v9Q/wPYRAs77MOqmTo79Yi2ezt/4Z9QvxQV1pjeYU5eEEr3JoxzRMJqA
	wt34HXPA==;
Received: from [122.175.9.182] (port=24906 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1ueXFg-00000006TmQ-1gKW;
	Wed, 23 Jul 2025 07:03:12 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 231911782036;
	Wed, 23 Jul 2025 16:33:03 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id F36BA17823D4;
	Wed, 23 Jul 2025 16:33:02 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kVxGdNqyNizW; Wed, 23 Jul 2025 16:33:02 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 948C61782036;
	Wed, 23 Jul 2025 16:33:02 +0530 (IST)
Date: Wed, 23 Jul 2025 16:33:02 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <1390395318.23287.1753268582122.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250722184749.0c04d669@kernel.org>
References: <20250722132700.2655208-1-parvathi@couthit.com> <20250722132700.2655208-3-parvathi@couthit.com> <20250722184749.0c04d669@kernel.org>
Subject: Re: [PATCH net-next v11 2/5] net: ti: prueth: Adds ICSSM Ethernet
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ICSSM Ethernet driver
Thread-Index: CS6Pxk1Q6vpt0yapW6BMmVo7ZPHfVw==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_120403_726757_B6924273 
X-CRM114-Status: UNSURE (   3.71  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Tue, 22 Jul 2025 18:55:02 +0530 Parvathi Pudi wrote:
>> +	for_each_child_of_node(eth_ports_node, eth_node) {
>> +		u32 reg;
>> +
>> +		if (strcmp(eth_node->name, "ethernet-port"))
>> +			continue;
>> +		ret = of_property_read_u32(eth_node, "reg", &reg);
>> +		if (ret < 0) {
>> +			dev_err(dev, "%pOF error reading port_id %d\n",
>> +				eth_node, ret);
>> +			return ret;
> 
> missing put for eth_node
> 

Yes, We will address this and post the next version shortly.


Thanks and Regards,
Parvathi.

