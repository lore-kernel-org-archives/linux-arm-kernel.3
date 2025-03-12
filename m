Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD2C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJH2Ax17dWdJx/45OfCnLXHITTljX3qItqIIDROqhas=; b=q1fBRckDxkaRjiaF1MUXBzTdIX
	lR9lpYh8A6GovMMbrU4Ia0NMWjQZSCzsdBvblO0RuFdqEulLKmRW7Xk4stzh99tWTJrDJBOdW0H9z
	VgY/sRF6nLGtkd+zQi5sDZh/O8CiTsb7VL/vUED2+JSj0964U20VGKClFXUlqNeWxZPaawXmkmju4
	CfNPg9//6nbvQTw2FwPLGYIp0wPGlpUFP4mypuKCeD5qTMaNPw36yWtHt/l8p1CQv/QYHs6GCsMce
	zWaf0oKXY1HIrEy7kzXNiMUtRc8JVCg5Cct5kzQplf1aQux91pvblHOmy18t9Cyg26PPy058IB1pY
	Oepx+x+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGDc-00000007fK3-3YJB;
	Wed, 12 Mar 2025 07:09:32 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGBy-00000007fAB-0ELM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741763270; x=1773299270;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xkX5hO3+T5vZpdAsfoZaLQBkb+ij52X34+ckdVAMjzQ=;
  b=b3k11atojpFfl1HexE/lbY9wlrdqs+2SFPzf5zgKh+6r31Vc3ZbntyNn
   ao9GTfVvxBbHe+3rAqg4N2a3DetN0VdXIdeqh/72DIqpBUFMZj/BEMcsI
   ROblkhvynuigibzMaMRsKNJte6cVU11GquCzV1/3gEC15BhCHOh9NPCzW
   nJusXygWtWngpdApMr6wHKEcPS0hko8FsKttUDvM/rdH4Xb2cQu++rStY
   yeFporMV02ULJpOwvUmBcUXUY5jVTNOD5WCKSxZe4DWasUyo0o3gcciK2
   iORdLcHSAGZJ1SHBiIlQhunapMeX/NfdS3eIGJ25ewUZ4Dxp8wC5c7U2v
   Q==;
X-CSE-ConnectionGUID: QIKUuC7ySKmwmmw0+Xt5XA==
X-CSE-MsgGUID: cEbGjudMTXS2PkoX7VOg4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="43008864"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="43008864"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 00:07:47 -0700
X-CSE-ConnectionGUID: 8ncVAMK5TiK/y6V+rgmE6A==
X-CSE-MsgGUID: gi9Y5KxmQra4GmzB21WXbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125179288"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.240.153]) ([10.124.240.153])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 00:07:41 -0700
Message-ID: <57dab191-6383-4d51-ba77-4d2cd62cc1da@linux.intel.com>
Date: Wed, 12 Mar 2025 15:07:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta
 <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
To: Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <Z9CEIlXoQJ-A0t-d@8bytes.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <Z9CEIlXoQJ-A0t-d@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_000750_144813_8F07C043 
X-CRM114-Status: GOOD (  12.01  )
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

On 2025/3/12 2:42, Joerg Roedel wrote:
> On Fri, Feb 28, 2025 at 03:46:33PM +0000, Robin Murphy wrote:
>> +	/*
>> +	 * And if we do now see any replay calls, they would indicate someone
>> +	 * misusing the dma_configure path outside bus code.
>> +	 */
>> +	if (dev->driver)
>> +		dev_WARN(dev, "late IOMMU probe at driver bind, something fishy here!\n");
> This warning triggers on my workstation (with an AMD IOMMU), any ideas?
> 
>   ------------[ cut here ]------------
>   reg-dummy reg-dummy: late IOMMU probe at driver bind, something fishy here!
>   WARNING: CPU: 0 PID: 1 at drivers/iommu/iommu.c:449 __iommu_probe_device+0x10b/0x510
>   Modules linked in:
> 
>   CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc6-iommu-next+ #1 1d691d7aebf343bde741cf4c8610d78a2ea2d2d9
>   Hardware name: System manufacturer System Product Name/PRIME X470-PRO, BIOS 5406 11/13/2019
>   RIP: 0010:__iommu_probe_device+0x10b/0x510
>   Code: 68 00 74 28 48 8b 6b 50 48 85 ed 75 03 48 8b 2b 48 89 df e8 87 71 06 00 48 89 ea 48 c7 c7 90 dd 2c 8b 48 89 c6 e8 35 83 77 ff <0f> 0b 49 8b bd a8 00 00 00 e8 77 ab 85 ff 84 c0 0f 84 ad 01 00 00
>   RSP: 0018:ffffafba00047c58 EFLAGS: 00010282
>   RAX: 0000000000000000 RBX: ffffa00481301c10 RCX: 0000000000000003
>   RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000001
>   RBP: ffffa00480ffaee0 R08: 0000000000000000 R09: ffffafba00047ae8
>   R10: ffffa0135e93ffa8 R11: 0000000000000003 R12: ffffafba00047d18
>   R13: ffffffff8adac1a0 R14: 0000000000000000 R15: ffffa004802c5800
>   FS:  0000000000000000(0000) GS:ffffa0135ea00000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: ffffa00baca01000 CR3: 000000082b838000 CR4: 00000000003506f0
>   Call Trace:
>    <TASK>
>    ? __iommu_probe_device+0x10b/0x510
>    ? __warn.cold+0x93/0xf7
>    ? __iommu_probe_device+0x10b/0x510
>    ? report_bug+0xff/0x140
>    ? prb_read_valid+0x1b/0x30
>    ? handle_bug+0x58/0x90
>    ? exc_invalid_op+0x17/0x70
>    ? asm_exc_invalid_op+0x1a/0x20
>    ? __iommu_probe_device+0x10b/0x510
>    ? __iommu_probe_device+0x10b/0x510
>    ? __pfx_probe_iommu_group+0x10/0x10
>    probe_iommu_group+0x28/0x50
>    bus_for_each_dev+0x7e/0xd0
>    iommu_device_register+0xee/0x260
>    iommu_go_to_state+0xa2a/0x1970
>    ? srso_return_thunk+0x5/0x5f
>    ? blake2s_update+0x68/0x160
>    ? __pfx_pci_iommu_init+0x10/0x10
>    amd_iommu_init+0x14/0x50
>    ? __pfx_pci_iommu_init+0x10/0x10
>    pci_iommu_init+0x12/0x40
>    do_one_initcall+0x46/0x300
>    kernel_init_freeable+0x23d/0x2a0
>    ? __pfx_kernel_init+0x10/0x10
>    kernel_init+0x1a/0x140
>    ret_from_fork+0x34/0x50
>    ? __pfx_kernel_init+0x10/0x10
>    ret_from_fork_asm+0x1a/0x30
>    </TASK>
>   ---[ end trace 0000000000000000 ]---

I saw the same issue on Intel platforms.

Thanks,
baolu

