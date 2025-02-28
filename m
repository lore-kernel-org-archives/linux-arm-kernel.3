Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6460C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sE6TUNROnNN1BDGkZDG+hbLODugZVEpsfc3S6d8BpfU=; b=oRlH0UTYN0Gtzc
	WBoVV0Pa0b6K+XQW3uuodwq62TXJtl6woQEKuvZuWEgsR/n/Ntlqt/SSPUUzXrMkMFP2LQoFnuVfk
	YTdboE//RlRudL9zqk0tKO4lSMhuohqKRQplav1yKmfO5EiyLuyJwZ4df5VNZkBW+FbXEvXdp9sX3
	JLASD4fzYetsQq9On06BaAmV8GVTbmYX6TlysAs/P/3gxj0D8KHwHrBTTZ1Y2XSPdQFI/Un27FTIi
	n4DDvVINxIx+8EQ/a4vzEccqSisYMCNPZ+ps1YrTXwA5w2AA7P94w1KbwwEBQ640m2iR80Amlb2wU
	wNzimrc63Y9+00nrkjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnysl-0000000AoON-2nTd;
	Fri, 28 Feb 2025 11:50:19 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tny4P-0000000Ag5O-05TP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sE6TUNROnNN1BDGkZDG+hbLODugZVEpsfc3S6d8BpfU=; b=EUKyxWgtREsHH005xVidHeShMx
	o2x3gSov/MlMrfIA27GHA5iGyEQwi3KIMdUbPYzkOMfk2/bQH3VV2QHcxl2MfFHGDmMiiCcRyDV2G
	P3sSQc+ZRzWAlw/lANFEUHIRpFjAa28kdzEb0iGlatdiDSr/QpkG1TPl+Y5G1+V262nOY0WsaQoNH
	/O6aOmQshXEiddFa+rgrgmNFg8eTciU64Oieyx5iyu08RoDurdKPku1Xa6KpsPhWs4LFt+LuHlm0L
	6aM/f8/qdaDTTj/dt3NtV5vIrrK6td+9pqrYzM8OAqpIZ2rsO5c0G6YyTNTrB2nNvqs9s4yLKZxNL
	OtKk1cBQ==;
Received: from [122.175.9.182] (port=44904 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1tny4L-000000003tI-3dut;
	Fri, 28 Feb 2025 16:28:14 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 21DA91782035;
	Fri, 28 Feb 2025 16:28:08 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id F05031784068;
	Fri, 28 Feb 2025 16:28:07 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MkyykbHGCm10; Fri, 28 Feb 2025 16:28:07 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id B25DB1782035;
	Fri, 28 Feb 2025 16:28:07 +0530 (IST)
Date: Fri, 28 Feb 2025 16:28:07 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: nm <nm@ti.com>
Message-ID: <506678778.717678.1740740287558.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250226184408.d4gpr3uu2dm7oxa2@handwork>
References: <20250214054702.1073139-1-parvathi@couthit.com> <20250226184408.d4gpr3uu2dm7oxa2@handwork>
Subject: Re: [PATCH net-next v3 00/10] PRU-ICSSM Ethernet Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRU-ICSSM Ethernet Driver
Thread-Index: IPUW/PB0LmhbxyH+Oxy+FoQN15s69g==
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
X-CRM114-CacheID: sfid-20250228_025817_095802_557ACD59 
X-CRM114-Status: UNSURE (   8.03  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On 11:16-20250214, parvathi wrote:
> [...]
>> The patches presented in this series have gone through the patch verification
>> tools and no warnings or errors are reported. Sample test logs verifying the
>> functionality on Linux next kernel are available here:
>> 
>> [Interface up
>> Testing](https://gist.github.com/ParvathiPudi/f481837cc6994e400284cb4b58972804)
>> 
>> [Ping
>> Testing](https://gist.github.com/ParvathiPudi/a121aad402defcef389e93f303d79317)
>> 
>> [Iperf
>> Testing](https://gist.github.com/ParvathiPudi/581db46b0e9814ddb5903bdfee73fc6f)
>> 
> 
> 
> I am looking at
> https://lore.kernel.org/all/20250214085315.1077108-11-parvathi@couthit.com/
> and wondering if i can see the test log for am335x and am47xx to make
> sure that PRUs are functional on those two?
> 

In this patch series we have added support for PRU-ICSS on the AM57x SOC.
Hence the test log was only included for the AM57x SOC. We are working in parallel
to add support for PRU-ICSS on the AM33x and AM43x SOC's as well. We will send it as
a separate patch series at a later time.


Thanks and Regards,
Parvathi.

