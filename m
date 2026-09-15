Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47C9C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZzsGaXPUVqWdbiJlm0sqmPG8X19xHFYaAJPDTPlT8A=; b=txfrSvZReCiNiE8SBJ9RIL7cRf
	IAQVdUU7FW6PN3Msr1dPIcHVp4AELxCwszQ/GYcyeo96ZsYjEuOGCaMNavv5HmPipXKjC8ybxRZ5v
	SBHzknHT6NdBL2R54JmeLCZK8guwRQA6eJe1MrbabzkPb+J3JXyjN7MgvEbOrClS+HAoBcemiyUrB
	sfcPXloDBYS4Ppp0UVspcBjikD3S37AGjClaWVjTMCMg20+bkxMZfTiYxLsyG2CKbojHTURefH9dX
	M1m7JBJm52+JngIiSm6pgUsz3uDLntL8Px0qoQ3agCEDG2pLsSoFjE5UTOcP7hZ6FO6q8tisHSLRj
	sLx1ldBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bxn-000000082Yd-3qUJ;
	Tue, 15 Sep 2026 22:49:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bxl-000000082YV-3eKP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:49:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 364C260008;
	Tue, 15 Sep 2026 22:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DC31F000FF;
	Tue, 15 Sep 2026 22:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789512556;
	bh=kZzsGaXPUVqWdbiJlm0sqmPG8X19xHFYaAJPDTPlT8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FpiSvfNsjtOquI9DAMwpgwxVSzGM0L4KGw3+pi75m44IuyDlheeQQIl1+YMvU9oFQ
	 AbAdF1z1neMsu20+Cn89GlfetfTJNG6KskbLbYv6g9hFfElcfrjntm+dBC0GUSbbTj
	 JG6H4DK7Hfom1M7NsWMP8Prhjk2OdKvC39flf+OkUHVpSTKq7djpYOapPadN5IIAcx
	 RGR5l84P/9GoEiQsdexAwg7wccAeY8+B1QPAP3lmms1vMOb4SV7xboNBz1kb9fkGFH
	 e4FBNL/+nhZsr6j4HOfJeYxLWTAEQownhFAJAx5t6pd5ZuWyVsA8PX7hx21cv9sZlA
	 UyV9uuhTWBXNg==
Date: Tue, 15 Sep 2026 15:49:15 -0700
From: Oliver Upton <oupton@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <aqnLa0_QSGlIs2qn@kernel.org>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
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

On Tue, Sep 15, 2026 at 04:42:58PM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v6 of optimizing the shadow s2 mmu unmapping during MMU
> notifiers.
> 
> This version fixes a few issues, and adds Marc's space optimization
> for kvm_guest_s2_mapping [1]. Please see the changelog for the details.
> 
> Tested by booting L3, and running in-kernel targetted tests described
> in [2]. v5 got some tested-by's from Itaru and Wang (thanks), I didn't
> carry them over since some bugs fixed in v6 are non-obvious. Some
> retest would be much appreciated!
> 
> Series based on v7.3-rc3 + Marc's nested mmu lifecycle fixes [3].

Looking pretty good to me, thanks Wei-Lin!

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

