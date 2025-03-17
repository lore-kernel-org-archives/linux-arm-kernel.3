Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE5C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntI7zWmcsXzPUVWEHAFv4p7510PGp6fVrYmgfrStXsQ=; b=hFu3DaCGAbheNRmBeK4wtHTgs+
	P9fEdV4pz+bihmmz/mxNSML9T0h1ZlFuB4kVsSYbOH0FD/4cQSvoYyhk1o6PjxDDJ4mPcAirp/Ucj
	VGEEzS3ki+RZ/vJWISCm5Y+G4Q/d/ivXOUfvViax5uHNi4HKJTidfhY0XGlscCbq9+hZLdg2rr8XM
	m3mUY6xFuIX9EcWSRHMqTIr8j/4/fTE1cW6p2Uqk0KyE4E5M7flshFGz62pqVCUwDFGWYinlmS0dS
	+bq2Dac5Keuv771fxm1QmaLk/HuyR6dsz3Lvm5NtU8wcALhoBm7VdzKJ1pYWeRE94thze9JlX35gL
	VpgElSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8Zu-00000002NmF-2EDE;
	Mon, 17 Mar 2025 11:24:18 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8W3-00000002Mzy-3MBl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 11:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ntI7zWmcsXzPUVWEHAFv4p7510PGp6fVrYmgfrStXsQ=; b=Q8V6s/9xQVK8iRH2NJSa7eJ+Yd
	UcM9p0hqMirml26qEX3sGZ0Q5z4MMtznx5X/JQsdlIF9/23a3ZgSY+LTMT4t4uvNH38gYAdazyV3w
	VDvRmqmvw/icKKXg5baNbEQORkQeTp3ZOeWwq65MTJfrzRNBKtONwi0hIVw+/msACGpUbdRB863Ox
	/CSiJupilRfaiWclt/bvoT3Lrq1GZ5jq1AUjA9ea7emKWT4xmKuHowob+IafQJSzeGELnxvcsZMii
	qOuM4NOgc/ToFSuFyU7G5aeQDZDUEWoXEz2OS9422B/i5d8T86I5JoTTvqLutz8tbgKAKm/BdMrxJ
	FBawYabw==;
Received: from [122.175.9.182] (port=19732 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1tu8VL-000000006I9-3mNW;
	Mon, 17 Mar 2025 16:49:36 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 4A016178245B;
	Mon, 17 Mar 2025 16:49:31 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 33B3C1783FED;
	Mon, 17 Mar 2025 16:49:31 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3B2FHv0nDjmA; Mon, 17 Mar 2025 16:49:31 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 0C121178245B;
	Mon, 17 Mar 2025 16:49:31 +0530 (IST)
Date: Mon, 17 Mar 2025 16:49:30 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: nm <nm@ti.com>
Cc: basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	danishanwar <danishanwar@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, afd <afd@ti.com>, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>, parvathi <parvathi@couthit.com>, 
	Kevin Hilman <khilman@baylibre.com>
Message-ID: <1365068627.843903.1742210370862.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250307210517.5xjfc6wntcbj3s4k@precision>
References: <20250108125937.10604-1-basharath@couthit.com> <20250108125937.10604-2-basharath@couthit.com> <20250307210517.5xjfc6wntcbj3s4k@precision>
Subject: Re: [PATCH v2 1/1] soc: ti: PRUSS OCP configuration
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRUSS OCP configuration
Thread-Index: DvRQZaXzAimB/uZVNUsWawvfCP38Jg==
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
X-CRM114-CacheID: sfid-20250317_042019_930225_DF141023 
X-CRM114-Status: UNSURE (   6.17  )
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

Hi Nishanth,

> On 18:29-20250108, Basharath Hussain Khaja wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Updates OCP master port configuration to enable memory access outside
>> of the PRU-ICSS subsystem.
>> 
>> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit either
>> to enable or disable the OCP master ports (applicable only on SoCs
>> using OCP interconnect like the OMAP family).
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> 
> On the verge of applying this patch, looking deeper, I noticed
> drivers/bus/ti-sysc.c managing the sysc controls. infact, I wonder if
> b2745d92bb015cc4454d4195c4ce6e2852db397e ("bus: ti-sysc: Add support
> for PRUSS SYSC type") could be merged with this?
> 
> 
> Could you say why drivers/bus/ti-sysc.c would'nt be the right solution?
> 
> Ccying Kevin if he has any ideas about this.
> 

Thank you for the feedback.

We will analyze ti-sysc and revert back with an update shortly.


Thanks and Regards,
Parvathi.

