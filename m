Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E646CCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvkZ8DMLt8TicAIiC7x/wSALOp0M65czhxs+ZBfdPY4=; b=Xz/iHfP2SawQtxWtdvEnBIX87N
	ENEbRc6RU1CTIUx2DHzhf+2O70Z9BlBrijtomtuWZ4xyDaKnnCIBp32aKQyvVvpuIy6QztFsyJ4M/
	1gOn0hlNZyK4NtYzEUEHlU2AX2wBIQuGQPuasoEkDE+xh9AG6I+6miJao2r3Rt1u2YnIqM0SScVl6
	V+UJmZgHnSSCxoVEdcK+arCwiBpE7JPWonPVycueEuOYOoOflbMMDsgz/QzATI5CdztYQyGMpo0ZR
	PGx1jO6RHFGlEmDSOVOReJpdPpo18eC8I9grVAJVQsqjzD62khoc0tp4K1CcH39QZNCOiv5/fj2iP
	5cx4KDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT5f-0000000Fm8M-2T5R;
	Tue, 16 Jun 2026 12:40:28 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT5c-0000000Fm7j-25CP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bvkZ8DMLt8TicAIiC7x/wSALOp0M65czhxs+ZBfdPY4=; b=J/0ZxW7Ly02wggASZ1/Xbr5nox
	8y5LtBgN4Sq6q0qPBvmgIBDTn1QLslLD60FUFhspSQuXFoVS9UDhHoeFUUE8Ezwj/hf3Cay5Oeznu
	f+xEwKl+CZenKqe/M9SxGJTqdk4ipMVnKYOYHdkZu2K2TDvMKyZb5kB64bX+KvGEbp/qMSWWAaTWf
	Rzj7pVl4gj6C/HOWGKqY15GPqkJfI3a2SVOqK+vsN3tIo67nuBK4LpRWYTiCc1pskWAPMDyFrafPd
	mGmSXOh2yypq7B5g23STrRwrdwbL6beVsaGzSMaZW0d1Htji2IFHrE9tAI6erpxfhd1pFa85nMMDk
	fT1Ypu9Q==;
Received: from [115.246.246.98] (port=40588 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <parvathi@couthit.com>)
	id 1wZT5Y-0000000At4u-11Yd;
	Tue, 16 Jun 2026 08:40:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 6435E19A7FA4;
	Tue, 16 Jun 2026 18:10:13 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id feLN8dZta5RF; Tue, 16 Jun 2026 18:10:10 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id C412419A7F9B;
	Tue, 16 Jun 2026 18:10:10 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 47KudGkixjvB; Tue, 16 Jun 2026 18:10:10 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 9FF6319A7FA4;
	Tue, 16 Jun 2026 18:10:10 +0530 (IST)
Date: Tue, 16 Jun 2026 18:10:10 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Simon Horman <horms@kernel.org>
Cc: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, afd <afd@ti.com>, 
	basharath <basharath@couthit.com>, arnd <arnd@arndb.de>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	m-malladi <m-malladi@ti.com>, krishna <krishna@couthit.com>, 
	mohan <mohan@couthit.com>
Message-ID: <1748606529.1400457.1781613610625.JavaMail.zimbra@couthit.local>
In-Reply-To: <20260612200102.GN671640@horms.kernel.org>
References: <20260611123636.376577-1-parvathi@couthit.com> <20260612200102.GN671640@horms.kernel.org>
Subject: Re: [PATCH net-next 0/3] Introduce HSR/PRP HW offload support for
 PRU-ICSSM Ethernet driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.183]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC148 (Mac)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: Introduce HSR/PRP HW offload support for PRU-ICSSM Ethernet driver
Thread-Index: iqq9OEROOlbAtE0K3nChzbBATFVm3g==
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_054024_671799_8F37EB44 
X-CRM114-Status: UNSURE (   6.43  )
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

> On Thu, Jun 11, 2026 at 06:03:25PM +0530, Parvathi Pudi wrote:
>> Hi,
>> 
>> This series introduces HSR and PRP protocol HW offload support for
>> ICSSM-Prueth driver.  HW offload support for HSR/PRP is implemented using
>> dedicated HSR/PRP firmware running on 2 PRU cores(PRU-ICSS) as a "DAN"
>> available in AM57xx, AM437x and AM335x.
> 
> Hi Parvathi,
> 
> There is AI-generated review of this patch-set available on
> https://sashiko.dev
> 
> I would appreciate it if you could look over that with a view
> to addressing any issues that directly affect this patch-set.

Sure. We will review the sashiko feedback for this patch series and
address any findings that are directly relevant in the next version.

Thanks and Regards,
Parvathi.

