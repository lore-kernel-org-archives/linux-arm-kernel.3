Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E398C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 22:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4nulfCBgSWkzS/L23qgD/kenB1Hoae3y0h93vhD5hQ=; b=wTSEvM4QG8iOfPja6K3UOCKVHf
	O6ALliVnoN6i1LRVJNZfwMrI02lfkNwkuhZ4MryYaqdVBXiiq5/S4xDNVcXmSsCaXvNS4lM2wiUSK
	UBLt4AuA+B2yY5+zzwqQNOm0T23Uc/eQ8ZJjzE0xegqErzNRL4LXZ6R1yJaZBNgdTj0ZH4xMn3oNW
	JziI387gtVmr0enhMGyCD7mZQDUTkiBEM8RTKlMGqI+ONHqUEv/zt1+yXieUgnmWoyuFG5LYVvkJm
	5q5BpgOZCzzyTEFRxUFLxc7TTIofQ4Zls4eVp2GXnJNYsyury2HRUmmaMWSn9q7c/x9/6C6Jy9c1v
	tGrygsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajMv-0000000BLZu-0zK5;
	Wed, 22 Jan 2025 22:38:41 +0000
Received: from smtp-fw-52005.amazon.com ([52.119.213.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tajLd-0000000BLVa-31Z9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 22:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1737585442; x=1769121442;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=G4nulfCBgSWkzS/L23qgD/kenB1Hoae3y0h93vhD5hQ=;
  b=a5LlhCJ89RsGW11YyLGgNUwab8BeohOt9mww64Kc7fMV17i2Qh7TBNDI
   S1b4ExUOZz4Ii3qX3xbEJlXofHedDHtAjrtUfwb7FWmc6k8IzlIaxNHP/
   dHvtXLKzt0AsmS67a1LukgxtFvpYZ8sHYx8hnodRO9hJe+RoWg0g/qWIC
   g=;
X-IronPort-AV: E=Sophos;i="6.13,226,1732579200"; 
   d="scan'208";a="712857940"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 22:37:19 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.7.35:48884]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.127:2525] with esmtp (Farcaster)
 id fbc3c2c8-fb22-409d-b4ab-1e9a512ec03c; Wed, 22 Jan 2025 22:37:17 +0000 (UTC)
X-Farcaster-Flow-ID: fbc3c2c8-fb22-409d-b4ab-1e9a512ec03c
Received: from EX19D003UWC001.ant.amazon.com (10.13.138.144) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 22 Jan 2025 22:37:04 +0000
Received: from [10.95.192.248] (10.95.192.248) by
 EX19D003UWC001.ant.amazon.com (10.13.138.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 22 Jan 2025 22:37:02 +0000
Date: Wed, 22 Jan 2025 16:36:54 -0600
From: Geoff Blake <blakgeof@amazon.com>
To: "Doebel, Bjoern" <doebel@amazon.de>
CC: James Morse <james.morse@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	<pjy@amazon.de>
Subject: Re: [PATCH 0/3] arm64: proton-pack: Add Spectre-BSE mitigation for
 Cortex-A7{2,3,5}
In-Reply-To: <965352b6-c21f-4161-9f23-2e96cc1267f6@amazon.de>
Message-ID: <b2a40d81-0186-da33-899d-9d21bb8356b9@amazon.com>
References: <20250122174736.1560714-1-james.morse@arm.com> <965352b6-c21f-4161-9f23-2e96cc1267f6@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.95.192.248]
X-ClientProxiedBy: EX19D043UWC001.ant.amazon.com (10.13.139.202) To
 EX19D003UWC001.ant.amazon.com (10.13.138.144)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_143721_904004_5B7108E7 
X-CRM114-Status: GOOD (  23.96  )
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

On Wed, 22 Jan 2025, Doebel, Bjoern wrote:

> Hi,
> 
> On 22.01.25 18:47, James Morse wrote:
> > Hello!
> > 
> > Spectre-BSE is a variant of Spectre-BHB that abuses a power-saving mode
> > on some older cores to dodge the BHB mitigation applied to the branch
> > predictor.
> > 
> > Only A72r0 actually needs anything doing - this is basically a bug in the
> > published BHB mitigation sequence that was published for A72r0. This
> > series moves A72r0 to use the WA1 firmware call for mitigation, and adds
> > the necessary reporting parts for user-space to discover which parts of
> > BHB/BSE are mitigated or vulnerable.
> > 
> > WA1 is used instead of WA3 which was new for BHB because we can't rely
> > on hypervisors not to use the 'local' workaround, and for Spectre-BSE
> > we don't need to worry about discovery via. (Which is why WA3 exists -
> > for cores not vulnerable to the issue mititaged by WA1).
> > 
> > Arm's description of this vulnerability can be found here:
> > https://developer.arm.com/Arm%20Security%20Center/Spectre-BSE
> > 
> > This series is based on arm64/for-next/core, and can be retrieved from:
> > https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=spectre_bse/v1
> > 
> > Backports of this version can also be found under spectre_bse/backports
> > of the above repo.
> > 
> > Because this vulnerability is hard to expoit, but the cost of mitigating
> > it is high - the mitigation is disabled by default. (see the last
> > patch). To enable the mitigation, a command-line argument is needed:
> > 'spectre_bse'.
> 
> The Amazon Linux kernel team evaluated these patches on EC2 A1 instances
> running Amazon Linux 2 and UnixBench. We can confirm that patch impact is
> significant, especially for syscall overhead.
> 
> UnixBench results in comparison to disabled mitigations (AL2, kernel 5.15, EC2
> A1.4xlarge instance):
> 
> Dhrystone 2           --  +0.01%
> 2prec Whetstone       --  +0.01%
> Execl throughput      -- +21.39%
> File Copy 1024/2000   -- +45.40%
> File Copy 256/500     -- +46.52%
> File Copy 4096/8000   -- +25.68%
> Pipe Throughput       -- +51.46%
> Pipe based ctx switch -- +10.91%
> Process creation      --  +4.35%
> Shell Scripts x1      -- +20.00%
> Shell Scripts x8      -- +26.68%
> System Call Overhead  -- +55.82%
> Total Score           -- +28.36%
> 
> 
> Best,
> Bjoern
> 

We also conducted full sized workload tests that we consider 
representative of common use cases for A1 instances. The data we see 
shows the impact can be significant depending on workload:

NGINX server configured as a load-balancer: -20%
Memcached loaded so P99 response latency <10ms: -29%
Memcached loaded so P99 response latency <1ms: -2%
Wordpress blog server: -2%

Thanks,
Geoff

