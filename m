Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FC2C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 21:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8MeaPRzOgZSacDujPwP4MM6x0sK9+Zo6QMLPmqlAFQ=; b=uAcwN22EGOoOwayahsrgMlO8U+
	pCgwWVgcM4W1aTQ+tFtdazilwC+zN0/Ov65pTaEtvrSIIWHzcF5AnH/jZEMFCgFFspCszzZd/9i5s
	RRu6Znm/IgmbkbJlFYvz748xdAeNuJfXL6eOvbDmz2TMT9zHpdry+sMOardnXP3fZDzE1IfOdFxVS
	BO5MgQ2lI4WmCbUVwyEpUiSmRKSHK0PgfQrLphVqxbHnKyprNgUlDRfBLZf2Al7hs/XKWREP4fHqi
	EMO9FrwMepPfaVTpwqc0Euo2zl/PwVsZZO4RVZRIAgcfJp8209A45uZ47AMOg+l0DjcBBLk4E3/eo
	/leOVmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taiKx-0000000BFHO-0XTf;
	Wed, 22 Jan 2025 21:32:35 +0000
Received: from smtp-fw-52003.amazon.com ([52.119.213.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taiJf-0000000BFDd-1VJZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 21:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1737581476; x=1769117476;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M8MeaPRzOgZSacDujPwP4MM6x0sK9+Zo6QMLPmqlAFQ=;
  b=sBc7eqe/x6BefNEsZ7KnDtQbfr9DQ71UOs0bhXBS68x4trk05pd+4rB/
   pODg0ie8rQYJG7p44m4KkyrdVJEY1ptzA3xTKsoQeHV71OCI2B0p5VLzX
   4ZUE6yiTJ/XEtBo4KqGQQtUjIxfXEoJvAwSZ/UXnP6bWleaCWrxzL75QV
   w=;
X-IronPort-AV: E=Sophos;i="6.13,226,1732579200"; 
   d="scan'208";a="59780000"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 21:31:11 +0000
Received: from EX19MTAEUB002.ant.amazon.com [10.0.17.79:42981]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.45.135:2525] with esmtp (Farcaster)
 id eb42696a-8b43-4c02-b6e9-6d37daccf7e6; Wed, 22 Jan 2025 21:31:02 +0000 (UTC)
X-Farcaster-Flow-ID: eb42696a-8b43-4c02-b6e9-6d37daccf7e6
Received: from EX19D003EUA004.ant.amazon.com (10.252.50.128) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 22 Jan 2025 21:31:02 +0000
Received: from [192.168.16.80] (10.1.212.27) by EX19D003EUA004.ant.amazon.com
 (10.252.50.128) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39; Wed, 22 Jan 2025
 21:30:59 +0000
Message-ID: <965352b6-c21f-4161-9f23-2e96cc1267f6@amazon.de>
Date: Wed, 22 Jan 2025 22:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: proton-pack: Add Spectre-BSE mitigation for
 Cortex-A7{2,3,5}
To: James Morse <james.morse@arm.com>, <linux-arm-kernel@lists.infradead.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	<blakgeof@amazon.com>, <pjy@amazon.de>
References: <20250122174736.1560714-1-james.morse@arm.com>
Content-Language: en-US
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <20250122174736.1560714-1-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.1.212.27]
X-ClientProxiedBy: EX19D043UWC002.ant.amazon.com (10.13.139.222) To
 EX19D003EUA004.ant.amazon.com (10.252.50.128)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_133115_583645_ACD39777 
X-CRM114-Status: GOOD (  18.32  )
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

On 22.01.25 18:47, James Morse wrote:
> Hello!
> 
> Spectre-BSE is a variant of Spectre-BHB that abuses a power-saving mode
> on some older cores to dodge the BHB mitigation applied to the branch predictor.
> 
> Only A72r0 actually needs anything doing - this is basically a bug in the
> published BHB mitigation sequence that was published for A72r0. This
> series moves A72r0 to use the WA1 firmware call for mitigation, and adds
> the necessary reporting parts for user-space to discover which parts of
> BHB/BSE are mitigated or vulnerable.
> 
> WA1 is used instead of WA3 which was new for BHB because we can't rely
> on hypervisors not to use the 'local' workaround, and for Spectre-BSE
> we don't need to worry about discovery via. (Which is why WA3 exists -
> for cores not vulnerable to the issue mititaged by WA1).
> 
> Arm's description of this vulnerability can be found here:
> https://developer.arm.com/Arm%20Security%20Center/Spectre-BSE
> 
> This series is based on arm64/for-next/core, and can be retrieved from:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=spectre_bse/v1
> 
> Backports of this version can also be found under spectre_bse/backports
> of the above repo.
> 
> Because this vulnerability is hard to expoit, but the cost of mitigating
> it is high - the mitigation is disabled by default. (see the last
> patch). To enable the mitigation, a command-line argument is needed:
> 'spectre_bse'.

The Amazon Linux kernel team evaluated these patches on EC2 A1 instances 
running Amazon Linux 2 and UnixBench. We can confirm that patch impact 
is significant, especially for syscall overhead.

UnixBench results in comparison to disabled mitigations (AL2, kernel 
5.15, EC2 A1.4xlarge instance):

Dhrystone 2           --  +0.01%
2prec Whetstone       --  +0.01%
Execl throughput      -- +21.39%
File Copy 1024/2000   -- +45.40%
File Copy 256/500     -- +46.52%
File Copy 4096/8000   -- +25.68%
Pipe Throughput       -- +51.46%
Pipe based ctx switch -- +10.91%
Process creation      --  +4.35%
Shell Scripts x1      -- +20.00%
Shell Scripts x8      -- +26.68%
System Call Overhead  -- +55.82%
Total Score           -- +28.36%


Best,
Bjoern


