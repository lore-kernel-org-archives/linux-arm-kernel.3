Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3909CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yV2xHUADIUVgzf3tVjzFgnathlyFhibAgpCijuTGhQ=; b=JUtcpFzUNquKSmdcXuFDHe7R9P
	SIgcdeON4YnIOLLx2YTSVAdLVfLDYfROj93I2Ka8DV6edpy6sW6gTSySooc+pyXPZfCna+rrRcCpw
	fTqXWn9w9faeflTvByGN5tBCxNL1oS5oVMlKeHk6RGl4B5Ggtins/M3+1WdaP1kB1mKdzNx4g/sUt
	APVKNfNmEnqkq6MNP8C6rFAz3nL5ZqWUeaJs85muv2iijEtbUk0EjweBTn58JrfZiDWTQ3JxGqI53
	g+xNRq0l4GZ1S2jYx8OwfZu+alME+latbd0IjFKeYaaYRIbo5Y07EHMum3Kr2yvrL2N7h68vjJE71
	Btag5tqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzMel-00000001ISq-1acx;
	Thu, 18 Sep 2025 21:59:11 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzMee-00000001IRU-0lOt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:59:10 +0000
Date: Thu, 18 Sep 2025 14:21:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758232740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6yV2xHUADIUVgzf3tVjzFgnathlyFhibAgpCijuTGhQ=;
	b=sk1hzzV1vpw6seiRIzauAmhjW9Wv6WImdrBjKPjkWSHvd0sCttC6o/4qulnF+/TLMfXiSs
	ilhFLgfEqC+Eozqf9GcAAHh2nnqg4/mAeKxJSXv3Fp0ufGnacyuEV5atDFYhyAAfgZxO32
	6sVM4RfVhqUJ1aA47p11qdnJrY9z1m8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, sebastianene@google.com, keirf@google.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Validate input range for pKVM mem transitions
Message-ID: <aMx351jkCPIv_j61@linux.dev>
References: <20250918180050.2000445-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918180050.2000445-1-vdonnefort@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_145908_495324_DDB3AAA2 
X-CRM114-Status: GOOD (  14.93  )
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

On Thu, Sep 18, 2025 at 07:00:49PM +0100, Vincent Donnefort wrote:
> There's currently no verification for host issued ranges in most of the
> pKVM memory transitions. The subsequent end boundary might therefore be
> subject to overflow and could evade the later checks.
> 
> Close this loophole with an additional range_is_valid() check on a per
> public function basis.
> 
> host_unshare_guest transition is already protected via
> __check_host_shared_guest(), while assert_host_shared_guest() callers
> are already ignoring host checks.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 8957734d6183..b156fb0bad0f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -443,6 +443,11 @@ static bool range_is_memory(u64 start, u64 end)
>  	return is_in_mem_range(end - 1, &r);
>  }
>  
> +static bool range_is_valid(u64 start, u64 end)
> +{
> +	return start < end;
> +}
> +

I'm being unnecessarily pedantic but isn't something like [-2MiB, 0) a
legal range if we had 64 bits of PA? Looks correct though so:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

