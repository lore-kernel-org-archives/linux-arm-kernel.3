Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DA7C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 02:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qz/X6Qao4hkq/WmmhO+7YkP8uTQtOMAlbGqxvJ1uS7c=; b=KpOqLULO35MuE7BU9dKj6mqO+6
	mRPl9kepzt1tA8mR4bdRbcN7JUUVlEP0ZjTeogBCnbAMhnKd4TWb+XKPUa6Xa4j9xQC/IK8nx0tKQ
	b8R750ES3/kfa270r5CqXxhqGgTZVOAHrDIDRHdC4qABVeZMZ9W7BysylTYD63niPx5P6ue3IwU6d
	Kj3kSqE5NgU7nUJLAZZYjV1i46wDMEcNH1ElkpuCpxDT0hgI2Nxa5V9ZcH4i/gpssiObOmlFG37Aa
	fWHJmo8wm39Vla8Hem7qCe5cbFJ5tWuVbmVOAjQfzSgPZq2pQanWx/fkEnbiBa9uudMJSXzqvvwte
	QydnNSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2K5K-00000000tnL-3G9n;
	Fri, 04 Sep 2026 02:55:22 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2K5G-00000000tmd-1SzR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 02:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788490518; x=1820026518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M50a07QYaknMt62mPLnYdnzYtmToSOSevFA9tewdmGg=;
  b=DVDJHWv0mMPgqZ+scSf4NUH2MOgdxRTNwor09KgVhE8NhM+MDgcM+uRU
   +ql0mJTsf79iZfBP0vVSNOjFmwJrmbww/BxYLK4Z/yvWAeXFmprhUZMFp
   UsNikGMStx4neIMIzlXa2s4w/qvH1WU4zbjp0870af+vRDprDO58ISjwe
   cPQQ/Ut0ia30I/O7VNKIhWU3UlJnI6s8PRBM4filVOLAP0AH7pxwKMdRo
   f/qBpnkdidh7Lo4k74yj8I4e9IBnsbw8TEgC/oOmK4JmW2Hr889TTpjDe
   jlLVdFIETzOWklVHCzPeAxp5eSzO92ArnhshsyimhtXh1KK30/HOle7er
   w==;
X-CSE-ConnectionGUID: 9jFK+suVT92OoZxXEQrMhg==
X-CSE-MsgGUID: eZVFqImxTwqD5ln8iuXiIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="232724723"
X-IronPort-AV: E=Sophos;i="6.25,260,1779116400"; 
   d="scan'208";a="232724723"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:55:13 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C11C21C1C708
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 02:55:13 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 77442180025D
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 02:55:13 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 5532740D1B9;
	Fri,  4 Sep 2026 02:55:08 +0000 (UTC)
Date: Fri, 4 Sep 2026 11:55:05 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takayuki Okamoto <tokamoto@fujitsu.com>
Subject: Re: [PATCH 0/2] 52-bit VA guest mode ID support
Message-ID: <apozCZSi00UZhqLJ@sm-arm-grace07>
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_195518_972560_42638418 
X-CRM114-Status: GOOD (  19.57  )
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

On Wed, Aug 26, 2026 at 06:18:33AM +0900, Itaru Kitayama wrote:
> This patch series extends the arm64 KVM selftest framework
> to support 52-bit guest virtual address (VA) modes in addition to
> the existing 52-bit physical address (PA) configurations.
> The motivation is to enable validation of LPA2 guest memory-management
> behaviour in configurations that use a 52-bit VA space.
> While the selftest framework already supports testing 52-bit PA
> configurations, it lacks the ability to exercise guests running with
> 52-bit virtual addresses, leaving part of the LPA2 functionality untested.
> To address this, the series introduces new guest modes for 52-bit VA
> operation, adds five-level page table support where required, and
> performs runtime detection of host 52-bit VA capability so that
> LPA2-enabled guest VA tests are executed only on supported systems.
> 
> Testing:
> 
> Built and tested on arm64.
> Verified on QEMU with a V52-capable guest configuration.
> Confirmed correct operation of high virtual address mappings by
> exercising guest memory accesses in the 52-bit VA range.
> 
> Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Reviewed-by: Takayuki Okamoto <tokamoto@fujitsu.com>

I'd appreciate any comments on this series.

Thanks,
Itaru.

> ---
> Itaru Kitayama (2):
>       KVM: selftest: arm64: Support 5-level paging in stage 1 translation table
>       KVM: selftests: arm64: Add 52-bit VA guest modes
> 
>  .../selftests/kvm/include/arm64/processor.h        |  2 +
>  tools/testing/selftests/kvm/include/kvm_util.h     |  3 +
>  tools/testing/selftests/kvm/lib/arm64/processor.c  | 87 ++++++++++++++++++++--
>  tools/testing/selftests/kvm/lib/guest_modes.c      |  5 ++
>  tools/testing/selftests/kvm/lib/kvm_util.c         | 11 +++
>  5 files changed, 103 insertions(+), 5 deletions(-)
> ---
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> change-id: 20260825-arm64-52bit-va-32f1f4cd050d
> 
> Best regards,
> --  
> Itaru Kitayama <itaru.kitayama@fujitsu.com>
> 

