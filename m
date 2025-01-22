Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4ECC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFiGcNjQnJET7iFrmsyNwIZEYZkLHD0z5V2mMsLkka0=; b=OK6Sk0SMvHqy6D
	NmgyznPpzfwpag/RZ3UixqAFPzmNFew1xO1Q0fkTmn2Drn72YC7Q3QEuXxliLBN1dA9Zu5HhcjNUm
	jcqTNUw+lmJtBjJkvf18DRduGilkwMSUnPUwM8iEok2GuofZyirqKWYTr43yhz+P9e9ENJkHfgMc7
	q8yhNNwt/0RqWkqU+Y253w1+tPSpa6nB59+OeM0gJVOaWcG1kv/lb9RG0L7DuTrYlIPsUe3pi8io1
	AAcX6Qdlo+ez3so3J3tYlff0GVpZ95wwp9uXml0TBdmcyiCcnYjtDyvv1VoBkuicYtbi48GRZhu8V
	XbQv6VtiOOSRv0PFJaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tacgA-0000000AZHS-1Xqq;
	Wed, 22 Jan 2025 15:30:06 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tacep-0000000AZ1N-1tBr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 15:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HFiGcNjQnJET7iFrmsyNwIZEYZkLHD0z5V2mMsLkka0=; b=xsmB9Bgefw1NTFUKHxbbLbnXw/
	96jAb6eMgUky/CnltCs1c/hZYAnFeqi+f0Zl19450TrIUMRDRVJWhPrcSZuPLfPGIP/2rMnGKNkxp
	5jUo5OLeUTHXspbHWKggUpIr4c/sKteJhTo7qyvNuCncMBwEXAMoVPh8o+dfP0TDzckeh6Th10FKC
	39dBl9uu/yH64YSZFPi5BKjUDgrv8LVCtX5bGJmqFXESbgKutS0FpGVdSh+Ds+fuS8+x0q+zbLr8q
	WBWdkkW0dADAjBUjyPp5pp9GKLKFa9uBXoKmgFkT5sznnIX/e1feKB66s1Jc98muEo5kM6VJma34p
	7CxdiHxw==;
Received: from [122.175.9.182] (port=7750 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tacel-0007Ik-0t;
	Wed, 22 Jan 2025 20:58:39 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id AE3951781F6A;
	Wed, 22 Jan 2025 20:58:32 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 8E7671783FED;
	Wed, 22 Jan 2025 20:58:32 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lkr0Pxa3UrtC; Wed, 22 Jan 2025 20:58:32 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 4DFA71781F6A;
	Wed, 22 Jan 2025 20:58:32 +0530 (IST)
Date: Wed, 22 Jan 2025 20:58:32 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <1255520648.384747.1737559712088.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250110161654.GB2966768-robh@kernel.org>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-2-basharath@couthit.com> <20250110161654.GB2966768-robh@kernel.org>
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree
 binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: dt-bindings: net: ti: Adds device tree binding for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Thread-Index: Y6Qm4hhadSjfHBHPZZYsz2XckjHHig==
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
X-CRM114-CacheID: sfid-20250122_072843_519413_211C10FF 
X-CRM114-Status: UNSURE (   2.35  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> On Thu, Jan 09, 2025 at 04:25:51PM +0530, Basharath Hussain Khaja wrote:
>> From: Parvathi Pudi <parvathi@couthit.com>
> 
> Also, drop 'device tree binding for ' in the subject. 'dt-bindings'
> already says that and subject space is precious.
> 

We will change patch subject in the next version.

Thanks & Best Regards,
Basharath

