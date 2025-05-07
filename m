Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8E1C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 12:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gTucvQbJ8GVWGtpPTGszF2AAa2auKQNBW/SjILr374=; b=RDVOS3B5h2zjHD
	Hg5LZ1c9Tt5xuizzv9X3ZbuTTanXDC9FLj7sPO6qPwWEN6UJaWswa1306srm9aFI61ty4+JQ6ayjc
	Dvv8HBB0/JN8gakIhbnYsRnD4aiqsQiUP3FUV/i0oIELzJfraNJRQFo4fwr5nsXeg1JeDZ+kUxjSs
	x7R3wmHhCiEXQhtZkCIK0wvnOyprrGene6SOLrcO7pGE3RlaD7UoWO33MxE2e3f6lu1nngv0yMAQx
	9XFIZb6/1r3QQ9uAMpAN5u6S/CICR1wxSzmmroQ7UowMhzvCVYIoKYUppaaooWkK6xjfrVv2tvUKy
	nJAlW83pTgu+yQEZaC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeMh-0000000FUZH-2ED8;
	Wed, 07 May 2025 12:59:11 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeKV-0000000FUAU-1wvu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 12:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2gTucvQbJ8GVWGtpPTGszF2AAa2auKQNBW/SjILr374=; b=SZQ/qUqGsxZiV8NAzLkeiIQ29O
	iiJq0WqtLc873MoKOpRjCjvc4DCbrrDAbP+odpVPOcMcr8ATV43UROcDdv4vwyrFv7s01iqvVGvl4
	Fi+XWO4ihOEMpukM6PVjzlkJ0CYwDCv0ea3FD/k1DG7kx7dDezzT2ALnTmmpMS04AJExDeXU+NyBD
	kUxSfkmpbd/UPbKxhhkafl7G4LHzj76WRdEEDSbdC+ldavKkvXQC3RGnpG9phS769vcbpC1UwM4Vc
	qxTdapSgTM3csySTqflmlXFuGrhbN2Ln0Ry8rYkttmGiRJMuQSV8puvrD3t3I5FrswFmSWLIdnFkt
	dDFYl6DQ==;
Received: from [122.175.9.182] (port=34909 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uCeJl-000000000Vk-1tYs;
	Wed, 07 May 2025 18:26:09 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 9F3661784153;
	Wed,  7 May 2025 18:26:02 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 7A93317820EC;
	Wed,  7 May 2025 18:26:02 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id O1H80hbzATvn; Wed,  7 May 2025 18:26:02 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 196861784150;
	Wed,  7 May 2025 18:26:02 +0530 (IST)
Date: Wed, 7 May 2025 18:26:01 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: pabeni <pabeni@redhat.com>
Message-ID: <139244603.1233564.1746622561934.JavaMail.zimbra@couthit.local>
In-Reply-To: <19f4f38b-9962-41d6-97b7-e254db3c6dee@redhat.com>
References: <20250503121107.1973888-1-parvathi@couthit.com> <20250503121107.1973888-4-parvathi@couthit.com> <19f4f38b-9962-41d6-97b7-e254db3c6dee@redhat.com>
Subject: Re: [PATCH net-next v7 03/11] net: ti: prueth: Adds PRUETH HW and
 SW configuration
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC135 (Mac)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds PRUETH HW and SW configuration
Thread-Index: AosoBOCbs5p6H60d7E7sxq4c13PHCQ==
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
X-CRM114-CacheID: sfid-20250507_055655_530704_9DFFD696 
X-CRM114-Status: UNSURE (   2.96  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On 5/3/25 2:10 PM, Parvathi Pudi wrote:
>> +static int icssm_prueth_emac_config(struct prueth_emac *emac)
>> +{
>> +	struct prueth *prueth = emac->prueth;
>> +
>> +	/* PRU needs local shared RAM address for C28 */
>> +	u32 sharedramaddr = ICSS_LOCAL_SHARED_RAM;
>> +
>> +	/* PRU needs real global OCMC address for C30*/
>> +	u32 ocmcaddr = (u32)prueth->mem[PRUETH_MEM_OCMC].pa;
>> +	void __iomem *dram_base;
>> +	void __iomem *mac_addr;
>> +	void __iomem *dram;
> 
> Minor nit: please respect the reverse christmas tree order above.
> 
> /P

We will address this in the next version.


Thanks and Regards,
Parvathi.

