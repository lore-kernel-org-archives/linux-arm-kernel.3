Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18B6CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4w9gz1EStBnmNqFWjlwX42Oe9RoSqgVszNo3p/wZFA=; b=RB37rKbURr465Zj36qT/t3qe13
	7jiQRXB1HHoJxmryFvaFROTo6KINTDpzbXt2am7OlB4aIYTsKJM1xUmtYf3OquJkwwNtBBC0OUITy
	LuN/Wyc1/7llRFXLKvng0UorlVaDGWLhnym3MxVrqT6x1huU9qVpsZocBdc9YsaZNOvT5h8Jn8s+R
	AYn+uh/mxdGSZNbzs2PYTPFiTSwruaRZlbQ1RGn1VfHlMw9SOjwXnPK1CzzLeA+x0VLxovFtGGuC5
	Rqvm0/QIGJ86CopSTQUgbMI2Ounr0LADE9+9/N3KkzliOrw6et83YnY6WFSN3Uli1/ItwqRq/BUsD
	VZZXFg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa9z-0000000AnYB-1NEE;
	Thu, 13 Nov 2025 16:26:59 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa9w-0000000AnXb-2d69
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:26:58 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 43FAB7A018B;
	Thu, 13 Nov 2025 11:26:53 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 13 Nov 2025 11:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763051213;
	 x=1763137613; bh=f4w9gz1EStBnmNqFWjlwX42Oe9RoSqgVszNo3p/wZFA=; b=
	HY1WGiKv3Dv07Gf3cqg+/2xDskMOOGV0jt5JvYBUdKYGp6ztUDzClykx6Yq17Duw
	AdDTNfCFup0Ghro47BorJ7YyzNRprjkhReyrsefVCOTvP7DxuWB4betgNyzaRrQ3
	Fq5R5qpljb7tsmJXKnOtzmhuBFn2NpTOgIbsVpsmjTdxLlvWXPjMaJF34pu6DD0T
	UpGf5jg88gaglTKnSFUleWb7ZSaUk5kXySVo6FXlEni5yrnNqnK0tE8Z/U67Ij4t
	wfZJYZI3+XcaUGVbK+vCrbiM4NhPHEBPrirHcNyLcPo1gN9iDlRoVzLDiHv1f2D3
	XC/9Gp9wWBe6xPKbSz/8vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763051213; x=
	1763137613; bh=f4w9gz1EStBnmNqFWjlwX42Oe9RoSqgVszNo3p/wZFA=; b=H
	cC1NRHL27jqhuSEpLo0hwXaS2f1KKdPRh8xFXia70l7kBPmocwH2nwm4eHk7PlL1
	BSyF4eZiByo4Oz70F+LgVGdHWC8063zS47uy5HGdTZOTpftjQb1VCJpk/JtcDl7m
	cV1ndcLV3SGgEGhJesGojGIN3oBOgKn2DhqF6VG9sYA14stpx2HXSqjpkCFdB5MX
	p6bYaG6Lf/0h9LFpAZa2eD7d+e4CCW+fO0OMem48xcgOUWwdXfZN3zS6YVdKy7pp
	yIIafaTgcoLhwB5FKosXge1UV5kEEFuOjWsx8ymeKejZiVMV9QnEQUJCOj+hNJQc
	48kUJIS4OwFwdc7usv+Zw==
X-ME-Sender: <xms:zAYWaedsIvVhMymcRHbxPns-YWGddKglCyyT7BLfEAv3PBZME49jLw>
    <xme:zAYWaTC8AuB5Ibtt7FJZj7TbzF7UX0gT4qhdXcy75S8_O8N0T1Wc7JdkG4U_8_hWW
    kpvMSTeVQk3GOevWt_FUJ2AiGoZsQRNhY1v4p7K_H1AtW3usHi9GI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepgfeiveevuedvkeeltdduieehgeekkeetheeuhefhvdeihfefjefhffdvtedttdfh
    necuffhomhgrihhnpehptghishhighdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhn
    uggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohep
    jhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepshhuiihukhhirdhpoh
    hulhhoshgvsegrrhhmrdgtohhmpdhrtghpthhtohephigrnhhghigttggttggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepphhrihhmvgdriigvnhhgsehhihhsihhlihgtohhnrd
    gtohhmpdhrtghpthhtohepfigrnhhgiihhohhuudeshhhishhilhhitghonhdrtghomhdp
    rhgtphhtthhopeiguhifvghiheeshhhurgifvghirdgtohhmpdhrtghpthhtohephihuii
    gvnhhghhhuiheshhhurgifvghirdgtohhmpdhrtghpthhtohepmhgriieskhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:zAYWaSQh-VUXUXMuKp3YKXX49zc96e8ybu5KeSqtVRi-NGqS-GuFoA>
    <xmx:zAYWaUfAs0EZwWfmLsUhJ5XZXCpgQUn4BF39u9WtqlYVtlyIc5OqaA>
    <xmx:zAYWaTuLqsV3A1Hm_nT3-0anhLoaaMsJ34oAAJbycoX15Y0fZ_vwKg>
    <xmx:zAYWaYI93oTD6qaeLFmdZlMcrFpy9skIDJnqow082zg2CBrQdG1Xpg>
    <xmx:zQYWaSzSFz-TDnYp836JkDeyCCoj0TvI3ZZI8eS_Ii_Lv4E5qiUkMCUI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E8E0E700054; Thu, 13 Nov 2025 11:26:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ALjut8WcExBk
Date: Thu, 13 Nov 2025 17:26:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhou Wang" <wangzhou1@hisilicon.com>, "Marc Zyngier" <maz@kernel.org>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Oliver Upton" <oliver.upton@linux.dev>,
 "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, "Yicong Yang" <yangyccccc@gmail.com>,
 prime.zeng@hisilicon.com, xuwei5@huawei.com
Message-Id: <c72411f9-a77e-4a72-a401-5110b919a2df@app.fastmail.com>
In-Reply-To: <b1407660-9b69-7e21-328a-0f969fffa554@hisilicon.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-6-wangzhou1@hisilicon.com>
 <861pm4vn02.wl-maz@kernel.org>
 <b1407660-9b69-7e21-328a-0f969fffa554@hisilicon.com>
Subject: Re: [PATCH v7 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_082657_001900_E548FD11 
X-CRM114-Status: GOOD (  24.42  )
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

On Thu, Nov 13, 2025, at 15:40, Zhou Wang wrote:
> On 2025/11/11 19:15, Marc Zyngier wrote:
>> On Fri, 07 Nov 2025 07:21:25 +0000,
>> 
>> But this doesn't mean that the system actually supports this. It is
>> also trivial for EL0 to spoof a PASID using ST64BV, by populating the
>> bottom 32bit with whatever it wants (hiding ST64BV0 doesn't prevent
>> this).
>
> I am confused here, we enable FEAT_LS64 and FEAT_LS64V in this patch,
> so only LD64B/ST64B/ST64BV are involved.
>
> Sending the value of ACCDATA(maybe a PASID) is defined in ST64BV0, which
> is not enabled currently.
>
> If a bad system implements ST64BV wrongly, isn't the fault of this bad
> system?

As far as I can tell, the design of ST64BV/ST64BV0 is a bit vague
on this, both on the Arm architecture and the PCI side [1], which each
leave the meaning of ACCDATA open to system design.

However, when the intention is to implement a shared hardware workqueue
in the style of drivers/dma/idxd/ [2], the only sensible implementation
is to follow the way that the corresponding Intel instructions work:

- movdir64b/st64b is a nonprivileged instruction to produce a posted
  atomic 64-byte write TLP to a PCIe device, which can only be used
  with a dedicated workqueue that is preconfigured to a fixed PASID

- enqcmds/st64bv is a privileged instruction to produce a non-posted
  atomic 64-byte write Deferrable Memory Write (DMWr) TLP, which can be
  used on a shared workqueue from kernel space, using an arbitrary PASID
  value per transaction, which would normally correspond to the
  physical address space when the kernel initiates DMA.

- enqcmd/st64bv0 is a nonprivileged instruction like enqcmds/st64bv
  using the pasid from accdata that corresponds to 
  current->mm->iommu_mm->pasid value [3] in the kernel for the task
  that initates the transaction in userspace.

A PCIe device can tell the difference between a posted write and a
non-posted DMWr, but it cannot tell the difference between st64bv
and st64bv0, so the kernel must disallow st64bv from userspace if
it can be used on a device that expects the PASID value in the
low bits.

Things would be different if there is a PCIe device that expects
a DMWr transaction but does not use it for a shared hardware
workqueue with the PASID in that field.

Are you using a particular device, or are you trying to enable
the support in general? If you have a specific device you are
working on, does it use the PASID data or not?

Things will clearly get a lot harder if we want to support a
system that can have devices with conflicting interpretations
of the ACCDATA value. Ideally we could always use the
iommu_mm->pasid value here and enable st64bv0 globally like
idxd does. If any devices requires the use of st64bv, that
would have to be mutually exclusive with another driver
handing out access to shared hardware workqueues.

     Arnd

[1] https://members.pcisig.com/wg/PCI-SIG/document/14237
[2] https://www.kernel.org/doc/html/v6.1/x86/sva.html
[3] drivers/iommu/iommu-sva.c

