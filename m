Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEEBD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dH+D5mTSh5ELrYXQNv+Ooza55h/kNIOuzgn9g1M4Gk=; b=O93JJ4M2ZCWIqa1X88Y5cvogdt
	LRT5WkfG0jSUwT8jvBZgrumk2zNfelHQEVi4iOiLa06JUJKtLTHokoXclw1TVaKkw4mx5pUD079Xo
	XrVp7CDw4g6BjCWjLvF0xXwjrYXoPypIRhrrH3UCLcMGx+ry5jdVJDbGZ/nDjXWf5gibJ731EhhUe
	2CFpC7sKZe7nG9aZAgcgVO1o3yXt3A6sl76Si+1jt4zen0Tr0zXlrnXFCDWCp/tJve2otQ1VzO+ot
	F+phxOh5n9An4ONtF4p8p/tagLY6VB8wJNBxY3ui8TyDPK+2en89Axp5qqr3eHnymOE2Pb9c6ebUE
	uxwwYkMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOxgy-00000000Qtq-2tUg;
	Fri, 28 Nov 2025 12:35:16 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOxgw-00000000Qpr-1Gy4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 12:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9dH+D5mTSh5ELrYXQNv+Ooza55h/kNIOuzgn9g1M4Gk=; b=t/AhlW2pNgdxkkP4BnAGTAbg4q
	yzFNL59iUiW+bqdg2QvEAkHBmgy+/JvZbCCgUSh7l/wIXMrsXAF1aLrW62eT3YArgJrg/ypt+QWP4
	dK68VDDq/3bNQeceNdpimxAiDoRnMnC9vgk1wHXa2NTdrg4IBx6J7MGgjKg6t4MmaIuf4eBZXXHGt
	WbesSMu0yItkBDhQ6v5WHgtBDX3nPXlIu2hXMZA4chLA+ICKD045pNogaLqUItbyrTEBn5yALHr0s
	VWWcfYZdny4SI7ddDmDQLyZW/bShWdHpnssnD+CmSi22KBA7ePd5CpBIGv6d3Z0w35uBZnyv1g94T
	qlYRdzfw==;
Received: from [122.175.9.182] (port=40292 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vOxgF-0000000EcTe-04l2;
	Fri, 28 Nov 2025 07:34:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 395B21A83410;
	Fri, 28 Nov 2025 18:04:26 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id mUNqj3eLG-2O; Fri, 28 Nov 2025 18:04:25 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 4C9A01A833F8;
	Fri, 28 Nov 2025 18:04:25 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id LJ-YG9CDH0uv; Fri, 28 Nov 2025 18:04:25 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 2ED9A1A83410;
	Fri, 28 Nov 2025 18:04:25 +0530 (IST)
Date: Fri, 28 Nov 2025 18:04:25 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	pabeni <pabeni@redhat.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, pmohan <pmohan@couthit.com>, 
	basharath <basharath@couthit.com>, afd <afd@ti.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	ALOK TIWARI <alok.a.tiwari@oracle.com>, horms <horms@kernel.org>, 
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Message-ID: <802911697.52286.1764333265118.JavaMail.zimbra@couthit.local>
In-Reply-To: <20251127184342.5d15c0e6@kernel.org>
References: <20251126163056.2697668-1-parvathi@couthit.com> <20251127184342.5d15c0e6@kernel.org>
Subject: Re: [PATCH net-next v8 0/3] STP/RSTP SWITCH support for PRU-ICSSM
 Ethernet driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: STP/RSTP SWITCH support for PRU-ICSSM Ethernet driver
Thread-Index: OaBX5KHFpkZx/CLKU63NiWcFnFJGkw==
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
X-CRM114-CacheID: sfid-20251128_043514_381680_A63CAA4D 
X-CRM114-Status: UNSURE (   3.86  )
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

> On Wed, 26 Nov 2025 21:57:11 +0530 Parvathi Pudi wrote:
>> Changes from v7 to v8:
>> 
>> *) Modified dev_hold/dev_put reference to netdev_hold/netdev_put in patch 2 of
>> the series.
>> *) Rebased the series on latest net-next.
> 
> The only acceptable reason for reposting within 24h is when a reviewer
> / maintainer explicitly and clearly asks for it. Please (re-)read:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
> --
> pv-bot: 24h


Understood, we will follow the guidelines and avoid re-posting
within 24h.


Thanks and Regards,
Parvathi.

