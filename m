Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFEED44D57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viBOCzehHuQdv8Iwl+euZ+ymNEyX2jv4vzW700Lh2lM=; b=en+OaqXUZCU2nNE1G+lZ38JFQR
	8oHHE4ttyV9BPg/J1L7zSmqYGrCU2qmP/8diEBvnZxvXLGihHDifhSaUoB2zngergJLzflhieyUTx
	ldHxAZRk5pzdshYK4HgXD2qzllCn0hFM3wwY6b8Plk7Mml1tymx+1DYb6PqGoaUSWBfaYH+m0jYcH
	mTlzUCP+Pcm0B9BA7ndgcsaJf2PZCQfd4HzFpExqodi7E/aDHB9UR1ZhCn5d8XPGbOfbaC2agd+Gv
	FM+MflY5HFrv9jfDhcLuWFeEfxAlV5AuaSoHgrjQbeqHzHcdaVOmArFv1rE8WfMut+MbRIa09vrBC
	ARnEg+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fCS-00000003Cek-0TSt;
	Wed, 06 Nov 2024 12:31:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eOK-00000002xHV-08Be
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:40:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E05FA436C2;
	Wed,  6 Nov 2024 11:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DEAC4CECD;
	Wed,  6 Nov 2024 11:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730893202;
	bh=LfdnWgo5Tult/Ytob/TpTZCRMLZX+e2O5Aaq1lroTOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMLUxF40Npvnh/AMFOwVE8QdM/kIH6EKpa2TMU3PnrLvzoByUUD2PJ69DHK6+lvXM
	 +P1Xf/ScqLVAK+44sbMBY+wWkgGaoK3rUU1ax1KCIxzmGjyFkYor/nNZOHWmcLs4YQ
	 tnDumX4PAM4bmx/Oc4/+ER7sml9dnjUBQW/iCLsOv6QV78QamVA/0ZCprB0U6wdU6O
	 zvUUGCE0sESuBvyd/P2dJx7Hh0YWN3Klb+47AFXFQFyamEyQLdyPOz/uy+IZ06p5My
	 JKou7Ixdg9i4eg8fqzBi9IfsCBT99V/ga/V2zDNlCy3rlBYsiulnKPsEgVnQq2ASjd
	 ejpqgVZZChPPg==
Date: Wed, 6 Nov 2024 11:39:54 +0000
From: Will Deacon <will@kernel.org>
To: Haris Okanovic <harisokn@amazon.com>
Cc: ankur.a.arora@oracle.com, catalin.marinas@arm.com,
	linux-pm@vger.kernel.org, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	pbonzini@redhat.com, wanpengli@tencent.com, vkuznets@redhat.com,
	rafael@kernel.org, daniel.lezcano@linaro.org, peterz@infradead.org,
	arnd@arndb.de, lenb@kernel.org, mark.rutland@arm.com,
	mtosatti@redhat.com, sudeep.holla@arm.com, cl@gentwo.org,
	misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH 1/5] asm-generic: add smp_vcond_load_relaxed()
Message-ID: <20241106113953.GA13801@willie-the-truck>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
 <20241105183041.1531976-1-harisokn@amazon.com>
 <20241105183041.1531976-2-harisokn@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105183041.1531976-2-harisokn@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_034004_158994_27819960 
X-CRM114-Status: GOOD (  19.93  )
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

On Tue, Nov 05, 2024 at 12:30:37PM -0600, Haris Okanovic wrote:
> Relaxed poll until desired mask/value is observed at the specified
> address or timeout.
> 
> This macro is a specialization of the generic smp_cond_load_relaxed(),
> which takes a simple mask/value condition (vcond) instead of an
> arbitrary expression. It allows architectures to better specialize the
> implementation, e.g. to enable wfe() polling of the address on arm.

This doesn't make sense to me. The existing smp_cond_load() functions
already use wfe on arm64 and I don't see why we need a special helper
just to do a mask.

> Signed-off-by: Haris Okanovic <harisokn@amazon.com>
> ---
>  include/asm-generic/barrier.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index d4f581c1e21d..112027eabbfc 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -256,6 +256,31 @@ do {									\
>  })
>  #endif
>  
> +/**
> + * smp_vcond_load_relaxed() - (Spin) wait until an expected value at address
> + * with no ordering guarantees. Spins until `(*addr & mask) == val` or
> + * `nsecs` elapse, and returns the last observed `*addr` value.
> + *
> + * @nsecs: timeout in nanoseconds
> + * @addr: pointer to an integer
> + * @mask: a bit mask applied to read values
> + * @val: Expected value with mask
> + */
> +#ifndef smp_vcond_load_relaxed

I know naming is hard, but "vcond" is especially terrible.
Perhaps smp_cond_load_timeout()?

Will

