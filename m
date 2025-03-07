Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808E5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MSwLxTEPEB7snYOzkakSs7OVnf7mnb46OQFG90frxc=; b=EYn3kigTz2BPf9jLQcCxUUbNlU
	2B2YdYzbm4laspcc7NxO7jlsGq9gLPAJY9LX1NA0cvm9r2rtcsoGO51MRXqDlddZd3G/Kj/I+9vgP
	uZcwJlKAEMHPaSLwPVmHAOY1SMxye0siZIPG0ysWFabddpc3gAJnfts49cWSC2b1+sKOLRAlvnemr
	rP8R0Yx+qyvUqMtFKUlaAJ528UtV27/MGXo8IF3Sbwp7w5DigRC0E0lxmmojWv/W3IPyxDRPukfcZ
	ex5lmtzMpUdiczmA0dx7jkganj1IZ2OJf2RDcBCv1hj3Jv/KZlcLhFfpUsA53aK0LoQCN/tU8EMLX
	WJ3i2YDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdj1-0000000FPvU-0lkE;
	Fri, 07 Mar 2025 19:51:15 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdhN-0000000FPfQ-0Q3j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 19:49:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 527JlIFS4055826
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 7 Mar 2025 13:47:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741376838;
	bh=7MSwLxTEPEB7snYOzkakSs7OVnf7mnb46OQFG90frxc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Y2tbYJSDFXtb3qSItccHoXSTovU+G8ZIHcDkpgt0qh+7JsRIao8dT8ZNiFm+djIOT
	 mv5xUKzEcQugm2lxrxWpdUuKsJGmA2E7sUR8pccE5cGFJyRIIwjAr8U+ruPqX1wqyH
	 ARsPzPF1GEpfesp4iIYc6GHzIr+qfutYDJph480w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527JlIOk107175;
	Fri, 7 Mar 2025 13:47:18 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Mar 2025 13:47:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Mar 2025 13:47:17 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527JlHRK114562;
	Fri, 7 Mar 2025 13:47:17 -0600
Date: Fri, 7 Mar 2025 13:47:17 -0600
From: Nishanth Menon <nm@ti.com>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v3 00/10] PRU-ICSSM Ethernet Driver
Message-ID: <20250307194717.isd2yv5qvuwe6jgp@strongly>
References: <20250214054702.1073139-1-parvathi@couthit.com>
 <20250226184408.d4gpr3uu2dm7oxa2@handwork>
 <506678778.717678.1740740287558.JavaMail.zimbra@couthit.local>
 <1229872038.768025.1741268586173.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1229872038.768025.1741268586173.JavaMail.zimbra@couthit.local>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_114933_336245_F7EDE2AE 
X-CRM114-Status: GOOD (  25.17  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco
 cruz <javier.carrasco.cruz@gmail.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 19:13-20250306, Parvathi Pudi wrote:
> Hi,
> 
> >> On 11:16-20250214, parvathi wrote:
> >> [...]
> >>> The patches presented in this series have gone through the patch verification
> >>> tools and no warnings or errors are reported. Sample test logs verifying the
> >>> functionality on Linux next kernel are available here:
> >>> 
> >>> [Interface up
> >>> Testing](https://gist.github.com/ParvathiPudi/f481837cc6994e400284cb4b58972804)
> >>> 
> >>> [Ping
> >>> Testing](https://gist.github.com/ParvathiPudi/a121aad402defcef389e93f303d79317)
> >>> 
> >>> [Iperf
> >>> Testing](https://gist.github.com/ParvathiPudi/581db46b0e9814ddb5903bdfee73fc6f)
> >>> 
> >> 
> >> 
> >> I am looking at
> >> https://lore.kernel.org/all/20250214085315.1077108-11-parvathi@couthit.com/
> >> and wondering if i can see the test log for am335x and am47xx to make
> >> sure that PRUs are functional on those two?
> >> 
> > 
> > In this patch series we have added support for PRU-ICSS on the AM57x SOC.
> > Hence the test log was only included for the AM57x SOC. We are working in
> > parallel
> > to add support for PRU-ICSS on the AM33x and AM43x SOC's as well. We will send
> > it as
> > a separate patch series at a later time.
> > 
> 
> Further update:
> 
> We have successfully cross compiled the kernel (linux-next) with this patch series
> for AM335x and AM437x SOC respectively.
> 
> Kernel is booting well on both the SOCs and we have verified PRU functionality by
> loading simple example application (pru_addition.elf) on the PRU cores, by using
> "remoteproc" driver from mainline kernel.
> 
> Below are the logs for the SOCs with boot log and running PRU with elf file specified
> above:
> 
> AM335x test log: <https://gist.github.com/ParvathiPudi/87d7ddf949913b80f022ed99706337ac>
> AM437x test log: <https://gist.github.com/ParvathiPudi/b2d556829cb4a9e3b6b4c5656dbdd594>


Thanks for testing this, I just got some time to dig further, I will
respond on the standalone patch
https://lore.kernel.org/all/20250108125937.10604-2-basharath@couthit.com/

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

