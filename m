Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52AACAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 06:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhCzfI3a33n71Q6JUjSWXwlIsTQV2S+5OVxI4ljc3rQ=; b=RDuJhqU32A2uMYVy9W0vjdmmUU
	qAsA3Xccc4pcNqOqsGvIGe4BG3IcclJ2xIXerfJlwS3VNLz/+KqobMPc/Es6++ZR7qtAQnWKXrenm
	QVK5mO2IQOtXCLOmQiEyhAE9tV5pMq3ICLUiAHQCJH4KezybLk1h6I1XZR6i1+rJV1GZFdUgQw2l/
	eNzUbIheODAmGgHF1G8wXxDhnIk/Vi9VaneH6GHtatq7zLOdSetJQoab7wp0XKpRqLg1vGOgOdOcJ
	RERgXsU8hg2n2Ib6LfdDgMJumpm8fOk8w/0TUuwOjDIcXCtgcICQWAjsMbZoD9eKwwmKCdaicIPqL
	3rcU6Qpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37AL-00000001T6A-1hAc;
	Mon, 29 Sep 2025 06:15:17 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37AI-00000001Sie-2FKP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 06:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LhCzfI3a33n71Q6JUjSWXwlIsTQV2S+5OVxI4ljc3rQ=; b=BgL5aZOZegqb7yw8oMLyOgEN6W
	0L7R+4xokCa4gOguoUICzDSzW0wojNvTFSycSChFuKxpvKLShygFcMk2tpFmUXGDDkYLrHXjCgCgC
	ALR9FVKwyNeEfrJ3VwGDAvn00SZ5xqWeAT8myQr37gG0mJz5IDDeI0znOTH3h3diaH+L1VYm3JXeR
	+pl0d2g0rg9TH7dYxb1A6kNGNa7wF9/E8c9rmbjDGzc6b3YQaJI+ZhbkABOiIkQCSIak2wBbpfMTK
	gvJVs25hcoqVmpkdBT6OnpgwK1Z6pd92BauEWWXASlvScLEvpbQ3G6NXHx3fIAjG6UacjGPn9aV7T
	+BxtYDhQ==;
Received: from [122.175.9.182] (port=8359 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v379a-00000008fEe-21oW;
	Mon, 29 Sep 2025 02:14:30 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id D86761781F94;
	Mon, 29 Sep 2025 11:44:25 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id B9FEE17820F5;
	Mon, 29 Sep 2025 11:44:25 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id z89e3CPQ0WEl; Mon, 29 Sep 2025 11:44:25 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 654E21781F94;
	Mon, 29 Sep 2025 11:44:25 +0530 (IST)
Date: Mon, 29 Sep 2025 11:44:25 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev <andrew+netdev@lunn.ch>, davem <davem@davemloft.net>, 
	edumazet <edumazet@google.com>, kuba <kuba@kernel.org>, 
	pabeni <pabeni@redhat.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, pmohan <pmohan@couthit.com>, 
	basharath <basharath@couthit.com>, afd <afd@ti.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>, 
	parvathi <parvathi@couthit.com>
Message-ID: <1176879373.438342.1759126465054.JavaMail.zimbra@couthit.local>
In-Reply-To: <383e4a23-447e-4024-8dc9-fc52ea209025@lunn.ch>
References: <20250925141246.3433603-1-parvathi@couthit.com> <0080e79a-cf10-43a1-9fc5-864e2b5f5d7a@lunn.ch> <773982362.433508.1758892145106.JavaMail.zimbra@couthit.local> <383e4a23-447e-4024-8dc9-fc52ea209025@lunn.ch>
Subject: Re: [PATCH net-next 0/3] RSTP SWITCH support for PRU-ICSSM Ethernet
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC139 (Mac)/8.8.15_GA_3968)
Thread-Topic: RSTP SWITCH support for PRU-ICSSM Ethernet driver
Thread-Index: fliDJmawFSlr9+bMXgXTI3DYdqerOQ==
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
X-CRM114-CacheID: sfid-20250928_231514_613321_5B8559E2 
X-CRM114-Status: UNSURE (   5.95  )
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

Hi,

>> No, this patch-set applies to both STP and RSTP. The driver and firmware
>> responds to the port-state transitions and FDB operations through the
>> standard Linux switchdev/bridge interfaces, with no STP/RSTP related
>> logic executed in driver/firmware.
>> 
>> We referred to RSTP in the commit message as it is our primary use case
>> and it implies support for STP as well.
> 
> I would not say RSTP implied STP, because the higher level
> implementation is very different. You need to know the low level
> details to understand they use the same driver API.
> 
> Please generalise the commit messages, mention STP as well as RSTP.
> 
> Thanks
> 	Andrew

Understood, we will update the commit message in the next version.


Thanks and Regards,
Parvathi.

