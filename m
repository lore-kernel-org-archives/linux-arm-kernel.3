Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A569FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMcULxUbcMjQJ66Cg9wMoxO/ZD9NbgZNU7gRtsbDIj8=; b=fMAIHzJ3sfN1nT
	mIVS/FeIzTdQAqOWD1URiaKhpuDmurlGOLxsU2SZlSrhuQhYlrqMtIFMp136o2NayS+d1uITG+EWq
	lB58QbHcP/EeATdpDfRc5Y3D4dDAnAhj1gBiS9QbZ5OKfcmqZKXo5MmcEI0NWK+mjErEf7G2ITow0
	osJ9sfVxm6OYPRFh3CuRLwmwnn1Di+5kMQtRzaxW8Jd+B9AhpX2OPi3ypvVEmotV5tnA3khsjrc35
	tRKAAIYrpm7jHDNx8ZGeHa4tBfxN7cTtxuiJ6Ufw1k5gjARJuxYBDC9dz+r/GjlMgHNHllSBNelqa
	1aLXzG3QkewWAVqj51vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hrI-00000009F0V-2zpD;
	Tue, 29 Apr 2025 10:06:36 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hpM-00000009EUk-0abd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 10:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UMcULxUbcMjQJ66Cg9wMoxO/ZD9NbgZNU7gRtsbDIj8=; b=0fKUcyOocXqLlYVibtRCQmj/Y0
	MZupjRZEn+QJ3q29KzxFTb8mgttNr6sWZfz08u+r/H3mO1QYspyV6exnz6uyXZaYwrZa6dgNA2SiW
	QNIw4CSCVViUbilfAcfjvGWSJe24/QUHibOb9rZqCJ1gjVJ3Ctk/7v2ou6UFCmh61E0IiaYfh/tXC
	X0H35EfvdU2gND1BE1OolJg96IGZ0GB8Kxhk0euJD9s7I7bfeVOuCxax95SIKCnTyxuk2KknQThPE
	oaoAooVeB82AQhdcz0zWLu9t7fuHoOJzknKIveu+TCsLDc0a1WRrsupSD6h+uJPOtOnZ9+NzVxl6D
	iR4goHcQ==;
Received: from [122.175.9.182] (port=6139 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u9hob-000000008Sv-3slT;
	Tue, 29 Apr 2025 15:33:50 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 991321782431;
	Tue, 29 Apr 2025 15:33:41 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 75066178245B;
	Tue, 29 Apr 2025 15:33:41 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HxMW6xCJqpGW; Tue, 29 Apr 2025 15:33:41 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 185171782431;
	Tue, 29 Apr 2025 15:33:41 +0530 (IST)
Date: Tue, 29 Apr 2025 15:33:40 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <772474665.1172924.1745921020429.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250424191350.7bf69fdb@kernel.org>
References: <20250423060707.145166-1-parvathi@couthit.com> <20250423072356.146726-5-parvathi@couthit.com> <20250424191350.7bf69fdb@kernel.org>
Subject: Re: [PATCH net-next v6 04/11] net: ti: prueth: Adds link detection,
 RX and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: e9vQTHb25dOlfaA340zfiKRfwAC3Tg==
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
X-CRM114-CacheID: sfid-20250429_030436_202265_AA31F638 
X-CRM114-Status: UNSURE (   2.43  )
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
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Wed, 23 Apr 2025 12:53:49 +0530 Parvathi Pudi wrote:
>> +static inline void icssm_prueth_write_reg(struct prueth *prueth,
>> +					  enum prueth_mem region,
>> +					  unsigned int reg, u32 val)
>> +{
>> +	writel_relaxed(val, prueth->mem[region].va + reg);
>> +}
> 
> Please don't use "inline" unnecessarily.
> The compiler will inline a single-line static function.


Understood. We will address this in the next version.

Thanks and Regards,
Parvathi.

