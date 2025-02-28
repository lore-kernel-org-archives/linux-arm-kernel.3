Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02FAC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUxYy44GRIO4cQdUKxtZBENf+y127GHIZ7y6niKwD+c=; b=4TlUO6HbRG+wBM
	iRPv8M6LZ51T82NmkjiMo/mJp1ZI07aYPuYSS3uJmX9PbpUH1ogzUJpYBfjtbtFVsK8vbxYTbDVlz
	kjgTjEkJwBo43zR8NN+aaZqVNtPPBiiwIRMQFgkDnqP+kljgWBoebdRbhuuvbgNsZ25bW4rd0/Nbr
	Poa20nPAt9P0syZJyTUXTSGJ13W5sjFeUQvNkMASTzG3NnqN9w/u41UpwJ5Qvu20GVFFrkWSdHY2z
	5sf8Syy62e6Y7kP7vjdDaizGiPTNscdsmI+m5Ozqh5eOIVkUy/raG+QZDUQztnSyTdQxg3gtplUrx
	sIXl6GJ34rAgf7VOcZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyrC-0000000Anel-1CFd;
	Fri, 28 Feb 2025 11:48:42 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tny2h-0000000AfXu-3UEP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UUxYy44GRIO4cQdUKxtZBENf+y127GHIZ7y6niKwD+c=; b=ll921IZ6bNuWX05m2a5g//QzBa
	2JCmTkTA3/84gqEYAA4nwTHgiqA/9K5CQBOS6D9FZZ60vQsZ81Ez+TDzPDQGwuDW8rK+VZNhImWhB
	lhqApCidqEle+BYlnJG4f9MWK2E3891Cl6d4WRyF/hKDwrrtevIBR/R/exbUjlPquJccsdrAWc/Od
	ebaySp0lHJ/LM7hHJsncEU34i2VJQC6YTlBrT1gjLnS/W5GXrekrWy75Efy8OTUJFenW/DNlvgbHS
	KWgGwLXTpMjyGG4BphJWlFUNZrThRzqhTLB7hQvadtlHMjyXAQlT6amUmuDcXkXpAtpAwY24h9Fmi
	dckhrPHQ==;
Received: from [122.175.9.182] (port=22918 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1tny1x-000000003oR-49Ac;
	Fri, 28 Feb 2025 16:25:46 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 6A87B17840AC;
	Fri, 28 Feb 2025 16:25:38 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 4F77F1784068;
	Fri, 28 Feb 2025 16:25:38 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iYYW2RZnI8rr; Fri, 28 Feb 2025 16:25:38 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 069531782035;
	Fri, 28 Feb 2025 16:25:38 +0530 (IST)
Date: Fri, 28 Feb 2025 16:25:37 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: danishanwar <danishanwar@ti.com>
Message-ID: <1432177615.717619.1740740137819.JavaMail.zimbra@couthit.local>
In-Reply-To: <af1d819a-4782-4b56-9e60-20263930bf19@ti.com>
References: <20250214054702.1073139-1-parvathi@couthit.com> <20250214170219.22730c3b@kernel.org> <1348929889.600853.1739873180072.JavaMail.zimbra@couthit.local> <af1d819a-4782-4b56-9e60-20263930bf19@ti.com>
Subject: Re: [PATCH net-next v3 00/10] PRU-ICSSM Ethernet Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRU-ICSSM Ethernet Driver
Thread-Index: AjaAuJTDl7foxdNqzd93kIb2DnSneg==
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
X-CRM114-CacheID: sfid-20250228_025631_893871_7E6CFF37 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,
 
> On 18/02/25 3:36 pm, Parvathi Pudi wrote:
>> 
>> Hi,
>> 
>>> On Fri, 14 Feb 2025 11:16:52 +0530 parvathi wrote:
>>>> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
>>>> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
>>>> Megabit ICSS (ICSSM).
>>>
>>> Every individual patch must build cleanly with W=1.
>>> Otherwise doing git bisections is a miserable experience.
>>> --
>> 
>> As we mentioned in cover letter we have dependency with SOC patch.
>> 
>> "These patches have a dependency on an SOC patch, which we are including at the
>> end of this series for reference. The SOC patch has been submitted in a separate
>> thread [2] and we are awaiting for it to be merged."
>> 
>> SOC patch need to be applied prior applying the "net" patches. We have changed
>> the
>> order and appended the SOC patch at the end, because SOC changes need to go into
>> linux-next but not into net-next.
>> 
>> We have make sure every individual patch has compiled successfully with W=1 if
>> we
>> apply SOC patch prior to the "net" patches.
>> 
> 
> If there is any dependency in the series, the pre-requisite patch should
> come before the dependent patch. In this series, SoC Patch should have
> been the patch 1/10 and the warnings could have been avoided.
> 

Sure, we will change the order and resubmit the patches in the next version.

Thanks and Regards,
Parvathi.


