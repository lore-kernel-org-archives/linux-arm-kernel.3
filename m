Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02018CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8vW6rhpY6U27yrvq+cL3jtxn+ghN/KxrfbsoSDlntc=; b=bXp/ezfhrCDDcPx0TAlyoPcXfp
	T8CJzB0PFbeNtJqknvBspn/A3r6bzHqVhCwSYB08dIcBkX2vvfrEnFHulZLZJCqEc9IlLFGnqzZvm
	KhIPzPrJVGLyMoWwr+dKXlxO63bzK9BHChLNNlOCZMazJho0LzkbfhpFb/8OqQF7DrbKWCEl4XJjo
	7Xth1pGkFVOwv6c0Fx+rhcha0QMvcmmqHiNZzpv58rRF+j2ulNd+71ODYdtdin3p5YWxe/Gsh/0ap
	bw6bk+EftgZDXtIjpFhybWRrfmlYP4mseCLi0A5p5H6jPFQI/VXGVDRPkF6bEsbUhYDlB0FRx5RD0
	/jl7ODmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVo7-00000003NZK-2yFV;
	Tue, 29 Sep 2026 11:15:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVo4-00000003NYh-3e0g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:15:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A4DA1476;
	Tue, 29 Sep 2026 04:15:27 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF92B3F85F;
	Tue, 29 Sep 2026 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790680530; bh=EtNt9F69mUNykSq1XAoSHpVt3uxqbxoxtVDWc5Yc2vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKKnIXWO9ePgXYN5lZU7WKIkJ0Y694l06KK62Inm5ufByUbczpRB9bQBMtH9v5bnQ
	 AQkn5Lmrvfbs93lO7iRfn0fUAa7py5AwI87D0K+JsmeaV7B0LWyNW19HOQLOPTjr9a
	 oZT4lHdURk5GeAsxycjGKA6wrzyHdzI0gOaRcxuA=
Date: Tue, 29 Sep 2026 12:15:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
Message-ID: <arudWVBPXcnUvYNh@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-6-suzuki.poulose@arm.com>
 <arZmXFw5Jw2IbAmA@arm.com>
 <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com>
 <araketG70TIKeNuf@arm.com>
 <12e83d88-de4c-4230-aac2-1796123320ad@arm.com>
 <70d47475-e26e-40e1-b409-b0c16aecb8c0@arm.com>
 <195cdfe4-a55a-453f-9c34-620738eca244@arm.com>
 <arqrZ_Auk9BYOopa@arm.com>
 <0f68dcff-1dfe-4515-9912-515ca6457674@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f68dcff-1dfe-4515-9912-515ca6457674@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_041532_977035_F07367D3 
X-CRM114-Status: GOOD (  13.79  )
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

On Mon, Sep 28, 2026 at 07:28:20PM +0100, Suzuki K Poulose wrote:
> On 28/09/2026 19:01, Catalin Marinas wrote:
> > possible, to defer the RMM activation until the first user (still do the
> > RMI probing as an initcall). If we run on RME-capable hardware and
> > firmware but don't care about realms or TSM, we still get the normal OS
> > functionality.
> 
> Would you prefer this in the first drop of the RMM ? Or is this
> something we could add as a separate series ?

I think we could add the deferring as a separate patch, maybe together
with the KVM bits. An advantage of keeping it here if we merge this
first is that we still exercise the activation path without full realm
support or TSM. Otherwise a lot of this would be dead code until the
other series arrive. Either way, do it as as separate patch on top of
this series.

-- 
Catalin

