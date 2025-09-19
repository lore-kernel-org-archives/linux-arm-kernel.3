Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1670DCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 22:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXFpc6ThiFcP26DmQ5iR/Po6IMjawdunmjqXPNzL7xU=; b=GVM8pvmJhksJX9e6bH2/MW6nqA
	/cRKF2WKrQE+ksZKVH6iAF/WHGP1XN3t0yAIPQZxcR5yzVAn1Y3bhh8BGMQRyHHOje1/cmyfpHARt
	87TLTOSf8O0q5fkpjviL68NVHw5+a6LeL5fFTWG3wcy6hqnt4394Bc7UXNd7fbCLGFIF/o+1/zlRM
	nKVHTe8XOYgHUzupyVUBR8hQgExOoYxEY3AATtKFNRxcGjvv+rNsnrnfpwx/O2BHChlhniM6YhbaF
	NeCv6CPju6Ac/hRghqjDc405Mw3+YrCt+TtUMD716cOwMQB32CPCfBMt2SW1k+OC4m+St37xCKWwM
	qlGL8bGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjiR-00000004D3L-1z0z;
	Fri, 19 Sep 2025 22:36:31 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjiP-00000004D2T-11oK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 22:36:30 +0000
Date: Fri, 19 Sep 2025 15:36:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758321385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JXFpc6ThiFcP26DmQ5iR/Po6IMjawdunmjqXPNzL7xU=;
	b=OZh7Dlt3NZ7BUlUFPjvmF1/oi5L3bmy8XMqUVWs0HN+KkAnj+j/kC6NdQnj2tvgXzaiH+N
	dbPBx4++rzSOmiimw92MHBmrzm1L4aqh4cVZMIVm2MfW59HqqESsCNZvhkHvd/FCo7+5Th
	9/5Akdc0/TlrWdygZOdq/Vdx8H4Bnz0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 16/16] KVM: arm64: selftest: Expand external_aborts
 test to look for TTW levels
Message-ID: <aM3a30SHqFRNgGcm@linux.dev>
References: <20250915114451.660351-1-maz@kernel.org>
 <20250915114451.660351-17-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915114451.660351-17-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_153629_441704_8656EE12 
X-CRM114-Status: GOOD (  16.39  )
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

On Mon, Sep 15, 2025 at 12:44:51PM +0100, Marc Zyngier wrote:
> Add a basic test corrupting a level-2 table entry to check that
> the resulting abort is a SEA on a PTW at level-3.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  .../selftests/kvm/arm64/external_aborts.c     | 43 +++++++++++++++++++
>  .../selftests/kvm/include/arm64/processor.h   |  1 +
>  .../selftests/kvm/lib/arm64/processor.c       | 13 +++++-
>  3 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
> index 062bf84cced13..acb32d0f27bbe 100644
> --- a/tools/testing/selftests/kvm/arm64/external_aborts.c
> +++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
> @@ -250,6 +250,48 @@ static void test_serror(void)
>  	kvm_vm_free(vm);
>  }
>  
> +static void expect_sea_s1ptw_handler(struct ex_regs *regs)
> +{
> +	u64 esr = read_sysreg(esr_el1);
> +
> +

Extra whitespace

> +	GUEST_ASSERT_EQ(regs->pc, expected_abort_pc);
> +	GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_CUR);
> +	GUEST_ASSERT_EQ((esr & ESR_ELx_FSC), ESR_ELx_FSC_SEA_TTW(3));
> +
> +	GUEST_DONE();
> +}
> +

Thanks,
Oliver

