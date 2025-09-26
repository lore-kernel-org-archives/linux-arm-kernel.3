Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11A7CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtyV6PRmbGQ26cR1Yf8W9GPsIiuuem2tM8ucnMedeAc=; b=lB3NvcYdn+yC8SSBWlz0+0VwG2
	zREtcVDe0Xwb7qaXF1KBdv+cXbK7XaTFtjzQPiHzR153sC3USsSWJMjVukC7ZB4kZZdkmZc78+F3c
	f8i8AKmNboh9LJ+1U8qAlcvEVcetsPw5tvZudjqf2VqR5GywN606jImthJxPhpEbIPyZa9AN5cZff
	WLQ9epTj4LVsSJpvzVuu2SLez+Dr76O5WRss+vkL8SHs39jCJkwv+wxFGo0a/ohFdvMdxwyyvupxT
	ySlLn/3EIz0QHErDVQD9RiohP+VJ9CBGhqZDeTRMOe//XzFmRWJTxHG8fiiDjsEm+f0NOwKyXC33l
	l8VFaSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28CJ-00000001Qqo-3bv7;
	Fri, 26 Sep 2025 13:09:15 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28CI-00000001QqE-0CNT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PtyV6PRmbGQ26cR1Yf8W9GPsIiuuem2tM8ucnMedeAc=; b=aKx7BLn6PGRgrEIG0c/4hgZrk4
	JUaJCJaMZJEbJaMWjkT6lPwpj+QSYsUqFrnryxbzl5484EfHKV8YD2EvCRjVwJGeju9jg5f1ogXDP
	obOOvOQ/yJlBNKEg9iiuun3XXS3b+FF4obLwUqI9o4i20E4dJ/OV4DK3RE4SUIw66fmQXAZKYAQIh
	5kb8QsQsisYT2DN/nPHDA6WWvuPDbhRdvPSxyPuz8jMyI7vDkvhABKQWwCPOkoncq23O9oNGUpVDh
	x6Tigq9l4LSzX4Whu1m0wky27ZCLJrfPbRmZ4U/2qPcP2mU46vKsfoW3wAIsQygyt4TKr4K0kVppg
	Ap9VUmRg==;
Received: from [122.175.9.182] (port=48006 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v28CF-00000006Ytd-0KRX;
	Fri, 26 Sep 2025 09:09:10 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 125421783FF9;
	Fri, 26 Sep 2025 18:39:06 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id E37941783FF3;
	Fri, 26 Sep 2025 18:39:05 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bvkrUVJt43l9; Fri, 26 Sep 2025 18:39:05 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 53A021781C3D;
	Fri, 26 Sep 2025 18:39:05 +0530 (IST)
Date: Fri, 26 Sep 2025 18:39:05 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: parvathi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Message-ID: <773982362.433508.1758892145106.JavaMail.zimbra@couthit.local>
In-Reply-To: <0080e79a-cf10-43a1-9fc5-864e2b5f5d7a@lunn.ch>
References: <20250925141246.3433603-1-parvathi@couthit.com> <0080e79a-cf10-43a1-9fc5-864e2b5f5d7a@lunn.ch>
Subject: Re: [PATCH net-next 0/3] RSTP SWITCH support for PRU-ICSSM Ethernet
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: RSTP SWITCH support for PRU-ICSSM Ethernet driver
Thread-Index: baBJgWRemsOFlllaDdRIwjoAJGMMPQ==
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
X-CRM114-CacheID: sfid-20250926_060914_166963_436CD858 
X-CRM114-Status: GOOD (  10.84  )
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

Hi,

> On Thu, Sep 25, 2025 at 07:32:09PM +0530, Parvathi Pudi wrote:
>> Hi,
>> 
>> The DUAL-EMAC patch series for Megabit Industrial Communication Sub-system
>> (ICSSM), which provides the foundational support for Ethernet functionality
>> over PRU-ICSS on the TI SOCs (AM335x, AM437x, and AM57x), was merged into
>> net-next recently [1].
>> 
>> This patch series enhances the PRU-ICSSM Ethernet driver to support
>> RSTP SWITCH mode, which has been implemented based on "switchdev" and
>> interacts with "mstp daemon" to support Rapid Spanning Tree Protocol
>> (RSTP) as well.
> 
> Is there anything in this patchset which is specific to RSTP? In
> general, there is no difference between STP and RSTP. STP is generally
> done in the kernel as part of the kernel bridge code. RSTP does it in
> user space. But the hardware driver does not care if it is STP or
> RSTP, it is the same API to the layer above.
> 
> 	Andrew

No, this patch-set applies to both STP and RSTP. The driver and firmware
responds to the port-state transitions and FDB operations through the
standard Linux switchdev/bridge interfaces, with no STP/RSTP related
logic executed in driver/firmware.

We referred to RSTP in the commit message as it is our primary use case
and it implies support for STP as well.


Thanks and Regards,
Parvathi.

