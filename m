Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC04C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgYuDIxcDeA+599F/9fuaQ38vA4OYPsLsjN7kvIiw/A=; b=VTH8n4KAZ/9lz/
	gazweRvyzWs+fyGPnaKiaWfi6bPdcBsB3Vz3oscGxV8owUbeo5Rrro28BhsR6BIAx2q3bJvYcSCpI
	QpZ/ThoRZpImQd6CNjfrpgoEBjC42aPGHioUwEvSIugyqNrJDwdMIixh+E5aBdrO/qHk+yv633CrX
	huEdisRNlBYv8iUMBwWwvSE4FctsQjqT4IdMXKluTI8gkHvlY7uG1kdmD77RhgteagVv/BuBCvwUF
	3VtFkwVUkyCLwu/JmQLO7fr3vtm1lIcG45EWU6/2RUqnzl99xx8kxVSVQkViptmB51Yls/mVtuVb/
	drqStt/eig4OH7qkSLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kpL-0000000G4ZN-3Hi2;
	Fri, 18 Apr 2025 12:28:15 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5knP-0000000G4J5-1Plj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 12:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zgYuDIxcDeA+599F/9fuaQ38vA4OYPsLsjN7kvIiw/A=; b=qL35lBxh8HZH+xEXQjiD+NBNXE
	wNElmDImRWWhkgSUAkTAKAvD4A2Bg1rFoFY72ssTci5CgP6FLHMs+ECg9A7qt9ivU53nw324XanVl
	qkpsYTci/5Bna7eT0uxaPi5epE6P1BeIjQR71beALBzkYZ2aAYbp1PBiNpCwVmanuGA/7a8sBD982
	7NUOj/9M2EWXaP9/0ICVQZiW64P8hMvBaW8vil5Fh1bh98tAuiJVjnYU0Ry0EacdiyadJFKbKp0Sm
	xrYduuzHfoPDbx8i2FSvqP9QcBSait/nAkIxKOPnaG+iiS5vRVAOAndvnwGe0qhomfYqyGB8xpfxb
	EepeXgKg==;
Received: from [122.175.9.182] (port=48418 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u5knI-000000004eF-42yZ;
	Fri, 18 Apr 2025 17:56:09 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id E862917823F4;
	Fri, 18 Apr 2025 17:55:57 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id BEABC1783F61;
	Fri, 18 Apr 2025 17:55:57 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hhW7TFWjAhWH; Fri, 18 Apr 2025 17:55:57 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 7D65F17823F4;
	Fri, 18 Apr 2025 17:55:57 +0530 (IST)
Date: Fri, 18 Apr 2025 17:55:57 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: horms <horms@kernel.org>
Message-ID: <2126437499.1093120.1744979157393.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250415195756.GI395307@horms.kernel.org>
References: <20250414113458.1913823-1-parvathi@couthit.com> <20250414130237.1915448-8-parvathi@couthit.com> <20250415195756.GI395307@horms.kernel.org>
Subject: Re: [PATCH net-next v5 07/11] net: ti: prueth: Adds support for
 network filters for traffic control supported by PRU-ICSS
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds support for network filters for traffic control supported by PRU-ICSS
Thread-Index: N2IoJ9p4SeRG9XkM6ibtWxtAWdIZLA==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_052615_415120_603B601E 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Mon, Apr 14, 2025 at 06:32:33PM +0530, Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Driver updates to enable/disable network filters and traffic control
>> features supported by the firmware running on PRU-ICSS.
>> 
>> Control of the following features are now supported:
>> 1. Promiscuous mode
>> 2. Network Storm prevention
>> 3. Multicast filtering and
>> 4. VLAN filtering
>> 
>> Firmware running on PRU-ICSS will go through all these filter checks
>> prior to sending the rx packets to the host.
>> 
>> Ethtool or dev ioctl can be used to enable/disable these features from
>> the user space.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_dos.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth_dos.c
> 
> ...
> 
>> +static int icssm_emac_configure_clsflower(struct prueth_emac *emac,
>> +					  struct flow_cls_offload *cls)
>> +{
>> +	struct flow_rule *rule = flow_cls_offload_flow_rule(cls);
>> +	struct netlink_ext_ack *extack = cls->common.extack;
>> +	const struct flow_action_entry *act;
>> +	int i;
>> +
>> +	flow_action_for_each(i, act, &rule->action) {
>> +		switch (act->id) {
>> +		case FLOW_ACTION_POLICE:
>> +			return icssm_emac_flower_parse_policer
>> +				(emac, extack, cls,
>> +				 act->police.rate_bytes_ps);
>> +		default:
>> +			NL_SET_ERR_MSG_MOD(extack,
>> +					   "Action not supported");
>> +			return -EOPNOTSUPP;
>> +		}
>> +	}
>> +	return -EOPNOTSUPP;
> 
> nit: This line cannot be reached.
>     I think you can just remove it.
> 
>     Flagged by Smatch.
> 

We will cleanup this in the next version.

Thanks and Regards,
Parvathi.


