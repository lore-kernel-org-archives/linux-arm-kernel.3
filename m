Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC26C36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhHzZoO4ypb+xIbX0IJGxi90nknZJ2h2grwWWFg+BKs=; b=vTBFDlsekZUXTFA84Gz0fKWwPq
	73dY+qljl1AYH0VsvsBuObTpt9WjIDBXWzQquhbTxnfFWIP/qOQqd2EgG8n8ABvfJc5AbeuC0uYwj
	jZ7UlC2lxLh/ZK+SELFF85paDKshdSpwrcYAktuxs7lST4m86gWmkR2KcX2jLEm0C566UFg2h5OiS
	dqfgeZZB6g6jRsduYEu4nhRN2S4Sqa1JkHVvBjAfOyfBMZWvsO5S7ISD2e59fLQo6D07pXWu8NNo8
	XC+eYa+x+hvlCTZhznTEEwcIdbIEFZxtCwaAatzV3CtDIHPYvWMXskq/aZpkIJCcNUGHSNmHB2z2m
	L5yml5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwur-000000061kO-2CzO;
	Wed, 02 Apr 2025 12:09:57 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwsT-000000061SS-3w0J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:07:31 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532C5Fhd3949065
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Apr 2025 07:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743595515;
	bh=fhHzZoO4ypb+xIbX0IJGxi90nknZJ2h2grwWWFg+BKs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OmfX3v5co1zf0X2OD55+bJPHKct6EknSkU9JVvI3GEmQnIWE5jHOsbS1B2eU5BWXr
	 A9kaNXlqQEtOFYuKX4fKBoLVoCf1LcXk3OlxA/DzVlzgEJhecmyKMPEtoKYaNWrdJm
	 XwzYESEiWADYzEIVWW4mQBEQ+hOGUxf5e9z0turA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532C5FcX024089;
	Wed, 2 Apr 2025 07:05:15 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 07:05:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 07:05:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532C5EIJ078709;
	Wed, 2 Apr 2025 07:05:14 -0500
Date: Wed, 2 Apr 2025 07:05:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Parvathi Pudi <parvathi@couthit.com>
CC: Kevin Hilman <khilman@baylibre.com>, basharath <basharath@couthit.com>,
        ssantosh <ssantosh@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        pratheesh
	<pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        danishanwar <danishanwar@ti.com>, praneeth
	<praneeth@ti.com>,
        srk <srk@ti.com>, rogerq <rogerq@ti.com>, afd
	<afd@ti.com>,
        krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>,
        mohan <mohan@couthit.com>
Subject: Re: [PATCH v2 1/1] soc: ti: PRUSS OCP configuration
Message-ID: <20250402120514.qbrwz3tsxnfqskbm@kinfolk>
References: <20250108125937.10604-1-basharath@couthit.com>
 <20250108125937.10604-2-basharath@couthit.com>
 <20250307210517.5xjfc6wntcbj3s4k@precision>
 <1365068627.843903.1742210370862.JavaMail.zimbra@couthit.local>
 <706306271.973226.1743594559548.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <706306271.973226.1743594559548.JavaMail.zimbra@couthit.local>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_050730_088626_47A51B60 
X-CRM114-Status: GOOD (  20.96  )
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

On 17:19-20250402, Parvathi Pudi wrote:
> Hi Nishanth,
>  
> >> On 18:29-20250108, Basharath Hussain Khaja wrote:
> >>> From: Roger Quadros <rogerq@ti.com>
> >>> 
> >>> Updates OCP master port configuration to enable memory access outside
> >>> of the PRU-ICSS subsystem.
> >>> 
> >>> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit either
> >>> to enable or disable the OCP master ports (applicable only on SoCs
> >>> using OCP interconnect like the OMAP family).
> >>> 
> >>> Signed-off-by: Roger Quadros <rogerq@ti.com>
> >>> Signed-off-by: Andrew F. Davis <afd@ti.com>
> >>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> >>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> >> 
> >> On the verge of applying this patch, looking deeper, I noticed
> >> drivers/bus/ti-sysc.c managing the sysc controls. infact, I wonder if
> >> b2745d92bb015cc4454d4195c4ce6e2852db397e ("bus: ti-sysc: Add support
> >> for PRUSS SYSC type") could be merged with this?
> >> 
> >> 
> >> Could you say why drivers/bus/ti-sysc.c would'nt be the right solution?
> >> 
> >> Ccying Kevin if he has any ideas about this.
> >> 
> > 
> > Thank you for the feedback.
> > 
> > We will analyze ti-sysc and revert back with an update shortly.
> > 
> 
> We've reviewed the code and decided to bypass the SOC patch posted here.
> Instead, we have implemented the required changes in the "drivers/bus/ti-sysc.c"
> file to enable OCMC access to the PRU-ICSS and verified the Ethernet
> functionality over PRUETH on AM335x, AM437x and AM57x platforms.
> 
> This patch will be abandoned and a new patch will be posted with
> "drivers/bus/ti-sysc.c" changes shortly.

Thank you for your patience and taking in feedback.
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

