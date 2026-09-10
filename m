Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0FDC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 04:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWqN8pAr1wdx4kZRPhAzuwbcnCMgVkqix3qBD0G3lS4=; b=dOwa+kFWN5ynCiZQYJBJS+o8Yo
	6WurRmAW1veRdWpkmlGU+vo/pgekC3PXDVYvbgMfnC14ZwjCpPwUM2Kxum8vi2bLJkraKmrXvFlys
	J/RJ8UIav1rE1oa39m4B3W38+/X5ubE31QF28k3StgWFMCg4Vhj2MycXwZa8o75IWvWXJWu4J4zbf
	eEM3QohCttYXPgc3lapz76g9asVixFz+jdmGKGz2lCeQz691KGIc2BjICgkXdnBQuLf/PljmbjRAB
	/O4BviE5DjlTAimfP/9vF1oxdXtItnhpiIniVjx1E+dyFhc4X51cajugt03TIHbqclrexavIBsw+a
	bkFQQGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Wlk-0000000DOva-254P;
	Thu, 10 Sep 2026 04:52:16 +0000
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Wlg-0000000DOuj-1D0u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 04:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789015932; x=1820551932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nBF6tOIyB/K1smAps/PmomhzUk3BKaarthp+S5mLB4w=;
  b=anFzMx7ayTVZil/RpR1Ht87g0woHXAsqnaApoXl1NcvYs0QM4/rf1BnD
   p7eaIpZXlFyv0gxdZkfewTsuvLzFI89oWhVmjjWnWxZSHfA/pzFQRdzE9
   TziJxAt183NkiJWrD+RTF1g9r71Kta40ZZV4r3GWUxF+OGSdv8CZFpg3P
   8Neuvz6P4SxgdZ+UISYNnIjdFRtM2jHn3eeHxqgesd0/ojxZrT2MRQsNf
   LhvV/njyDtVzKQoXmJjbVJpwwxjdKf7IHZVH0YVA927wMbSqB5wVfKDoj
   f1UIRrf7qIVwpe8FT58JSE5PsxbJgbnOn9Da3Fk15J85Fhb1UMtUhsyCP
   w==;
X-CSE-ConnectionGUID: 4sMvKXjPRViWc/z0eUm2Bw==
X-CSE-MsgGUID: FC8oxVlnQoepVV6Q74WwOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="254551407"
X-IronPort-AV: E=Sophos;i="6.25,271,1779116400"; 
   d="scan'208";a="254551407"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 13:52:10 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D41291C1C73A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:52:09 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 86DB51400350
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:52:09 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.22.105])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with SMTP id DEF3B821217;
	Thu, 10 Sep 2026 04:52:01 +0000 (UTC)
Date: Thu, 10 Sep 2026 13:51:58 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, joey.gouly@arm.com, tabba@google.com, 
	yuzenghui@huawei.com, linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org
Subject: Re: [PATCH v17 0/7] firmware: arm_rmm: Add RMM v2.0 base RMI support
Message-ID: <aqI3Cewih7oobhdG@FCCLS0092175.localdomain>
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <ap-C6NLnxuWWTMzi@FCCLS0092175.localdomain>
 <9086ca6a-5dce-493f-ac76-487dedc60758@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9086ca6a-5dce-493f-ac76-487dedc60758@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_215212_628858_B6F3C751 
X-CRM114-Status: GOOD (  14.34  )
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

Hi Gavin,

On 09/09 20:52, Gavin Shan wrote:
> Hi Kohei,
> 
> On 9/8/26 2:09 PM, Kohei Enju wrote:
> 
> [...]
> 
> > > 
> > > [1] RMM spec : https://support.arm.com/documentation/den0137/2-0bet3/
> > > [2] This series: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/fw_rmm/v17
> > > [3] KVM CCA v17 integration branch: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/kvm-integration/v17
> > > [4] Gmem inplace conversion https://github.com/googleprodkernel/linux-cc/tree/guest_memfd-inplace-conversion-v12
> > > [5] TF-RMM https://git.trustedfirmware.org/TF-RMM/tf-rmm.git main (commit: 134266ae)
> > 
> > I understand that QEMU-virt is not intended to model a realistic
> > production platform and that QEMU-SBSA is generally preferred. However,
> > I sometimes use QEMU-virt to test functionality quickly because it runs
> > slightly faster than QEMU-SBSA.
> > 
> > I tested this series with QEMU-virt and found that RMM initialization
> > failed during boot:
> > 
> >    [...]
> >    INFO:    BL31: Initializing RMM
> >    INFO:    RMM init start.
> >    ERROR:   RMM init failed: -8
> >    WARNING: BL31: RMM initialization failed
> > 
> I also ran into same issue and attached TF-A patch leads to a successful
> RMM initialization, please have a try to see if it can resolve your issue.

Thanks for the patch! It works perfectly for me on QEMU-virt.
Much appreciated.

Thanks,
Kohei

> 
> 
> Thanks,
> Gavin



