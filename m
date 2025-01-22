Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D10C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+h5UKHT1Q5bzoTA6GUz4qAnjvALfXCiYgl3lpRkiHg=; b=MYNz1S9GqMY9s9
	/RjQ5nJH6Ou22VzWvFacGVqEo7t5SymjtnhL25mVUNQEW6pOSaIXElU4q9Dl6775IBZeo5VlIZm2f
	bbyCgha4tsH7CG0/BhmT66kCcTwi6vOmg54u+5IO3jylNR82fqBUujgwlkFCuLkGHULBN7XhlPbvc
	kmqICtt1YH5fEsze43N5y/uGjsSGNV6f2WlJKcrWU9RZWzMCgfCvT58Q5l3W4xRgXjZKejYnIOndp
	+PGwcYfpg4ArbpIbJKRBMkfQ/q1gSajOU4p7tw7OWlivybEIzAfiPEhvIPe6MwrO5IxmogZe1Gipl
	6a5AkFlZsvYGibYnEh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taaeZ-0000000AG9S-0bc6;
	Wed, 22 Jan 2025 13:20:19 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taacQ-0000000AFlY-3OyH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=x+h5UKHT1Q5bzoTA6GUz4qAnjvALfXCiYgl3lpRkiHg=; b=020ODiv6NZmR5jKyjatCV+aT9l
	XwsyQq5QeSfFww0eq7iCKH5STKe4k8I2vM+NYwAw0ImtWWjY1PT2+Y4pcziVDc/53Uc0gfq8KpZkn
	MG1rcmgVHiNO5KQQ4U7UUakx9f/qJYid7PNIafIqK7kI/ZRrivCKnIJaW3ztvFeByhQE3w+MEbhhU
	izl2DQVVLghyx/3TBcjEDCOVTWSNV5fmUzAtEMiwVGXUBUep8gg8HnoBu10UeegIM6OQTqFNVTuF9
	pLcF3lgayjtI7oFul62InLuEoqzUo1qJ6dz93VPg1p1yZM9xFOl432DZVDAwtMNuZLqnZ/JEkwztr
	SFTc3riQ==;
Received: from [122.175.9.182] (port=10149 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1taabe-0004sa-0I;
	Wed, 22 Jan 2025 18:47:18 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 443A31781C74;
	Wed, 22 Jan 2025 18:47:03 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 1AEA01783FED;
	Wed, 22 Jan 2025 18:47:03 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id U5j_t1xDCAcK; Wed, 22 Jan 2025 18:47:02 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 9C91B1781C74;
	Wed, 22 Jan 2025 18:47:02 +0530 (IST)
Date: Wed, 22 Jan 2025 18:47:02 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <835897001.382468.1737551822290.JavaMail.zimbra@couthit.local>
In-Reply-To: <2e82fb20-c6f9-4cc3-a700-fce049295f58@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com> <2e82fb20-c6f9-4cc3-a700-fce049295f58@lunn.ch>
Subject: Re: [RFC PATCH 00/10] PRU-ICSSM Ethernet Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRU-ICSSM Ethernet Driver
Thread-Index: /F7uLdjpxFr3AOTU/2VXYpfIDw8vRA==
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
X-CRM114-CacheID: sfid-20250122_051806_876135_731E25C9 
X-CRM114-Status: UNSURE (   6.71  )
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
Cc: nm@ti.com, vigneshr <vigneshr@ti.com>, tony@atomide.com, edumazet@google.com, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2@ti.com, basharath <basharath@couthit.com>, kuba@kernel.org, pabeni@redhat.com, devicetree <devicetree@vger.kernel.org>, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan <mohan@couthit.com>, richardcochran@gmail.com, prajith <prajith@ti.com>, rogerq@kernel.org, jacob e keller <jacob.e.keller@intel.com>, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd@ti.com, andrew+netdev@lunn.ch, parvathi <parvathi@couthit.com>, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> On Thu, Jan 09, 2025 at 04:25:50PM +0530, Basharath Hussain Khaja wrote:
>> Hi,
>> 
>> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
>> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
>> Megabit ICSS (ICSSM).
>> 
>> Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
>> fundamental components/drivers such as PRUSS driver, Remoteproc driver,
>> PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
>> Linux kernel. The current RFC patch series builds on top of these components
>> and introduces changes to support the Dual-EMAC mode on ICSSM, especially on
>> the TI AM57xx devices.
> 
> I guess this version also has the horrible architecture of multiple
> firmware's you need to swap between at runtime?

This series has support for a single protocol. Yes, swapping of firmwares will be required upon adding support for other protocols similar to ICSSG. 

Thanks & Best Regards,
Basharath


