Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A80C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mZwtOnORz1zUe5SEHz2Hy5URcUgxMWga++pbIoA72M=; b=gYL3W4Qd/6AtGb
	TeqhGIk149Fq1eV26TP8wzB0nwS2rDOtVurK4Sz/bC7xzBq9FvRjIq3kaUR9ZrhSjjmj5T6RJMQez
	2zM+gAy0WpLIBrElQy3eV5ube2cGcM+4JINqVii7LIvZ1RE6/TTs88pG526owVa29vw5pN+IA9VBV
	6JSVDmaTqFmlpkTDZQkqTaQ3w/z9XjszmfkzaqXCfyxRjO8QqklCx5cqaESQfew3lBSWv1U70N9Jk
	zxGbwNgAZvpadSSiSKJNdbFJ3GMM/iRHoCbDac9aKTD0neHeMRSeIH+wMz255+XTHx5ukeybYl6mi
	Cprr0Xzek29V0ItQ/PGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCo3-0000000EjO0-45hG;
	Fri, 11 Jul 2025 12:24:47 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCkS-0000000Ej7x-3mgi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+mZwtOnORz1zUe5SEHz2Hy5URcUgxMWga++pbIoA72M=; b=29TjSso5NUVzpIbIMeTLBFozU8
	a/49n3lqFqyPoZFcLVNitCd+/vq9uiOFbubAN8iDwg5m4e+cxvhtom09NZ1q9eHbjMFqOHLaTDCPz
	KSAbXgDlI7CkLrVI13E0HXOn77ZOEZok5wQW7DnsipF9UrzVtxEwHMvmhv7ll6ztrtXPatwUxUeoo
	EvjgQ9ztRyOUQIywqKTkqO+8gMOyfsPN4VGqlJMyhpz7Q2XT6exugj/pOT91A89sKCrPCFXQDln4G
	PbDkmZ4kbPo1TMW0kQMakfLJSBi50+6tUSm2BmZrQirU1XLAdCidVB/rOXnckLCrgmii3Jy5QhBfp
	DZScMP5g==;
Received: from [122.175.9.182] (port=57395 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uaCjj-0000000CkrI-2Xqr;
	Fri, 11 Jul 2025 08:20:19 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 998741781A71;
	Fri, 11 Jul 2025 17:50:11 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 7262017820AC;
	Fri, 11 Jul 2025 17:50:11 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4htU6JcfYILf; Fri, 11 Jul 2025 17:50:11 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 3020C1781A71;
	Fri, 11 Jul 2025 17:50:11 +0530 (IST)
Date: Fri, 11 Jul 2025 17:50:10 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <1001900168.1712445.1752236410964.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250708173310.5415b635@kernel.org>
References: <20250702140633.1612269-1-parvathi@couthit.com> <20250708173310.5415b635@kernel.org>
Subject: Re: [PATCH net-next v10 00/11] PRU-ICSSM Ethernet Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRU-ICSSM Ethernet Driver
Thread-Index: TXP7pHbOvWv5H2YAdaWH+8TjmJE3lA==
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
X-CRM114-CacheID: sfid-20250711_052105_013327_66A184AD 
X-CRM114-Status: UNSURE (   3.29  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Wed,  2 Jul 2025 19:36:22 +0530 Parvathi Pudi wrote:
>>  17 files changed, 4957 insertions(+), 4 deletions(-)
> 
> Please try to remove some features from the series.
> The chances that a maintainer will have time to look thru 5kLoC
> in one sitting are quite low.

We are refactoring and limiting features without affecting
fundamental functionality for AM33x, AM43x and AM57x platforms.

We will post the updated patch series shortly.


Thanks and Regards,
Parvathi.

