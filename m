Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184ADCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 20:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYMU26G80HSBFv2mfmxmI1ldCw66DlxUZPOrNSRANLA=; b=E8OF52bUss9bcQAinDU3yV1I0v
	tgmxmMXJUfLMkbEm2J6dbK9cb9hkc40SSQtu6V6+EM5NIfsyOoU3q/f5J4BqXkIzyl9FlQpovDlZd
	Y+tczJKQoqWQY3V2FaeVurhukbhZ/I40E0lX2QnnpaGh5lLJ3A/K5qT3zGK40e47Xc6Ri/1tLZg2c
	SOgi7vf34iceE42YH5WG6L5fh5e4dFfJReMO03mVI+X0JQewxVc8cbWr6M7Xex4OAUkaDlQ44TpW1
	5EPq652HFXvZAJP/U1axtDyqiqTq6XxTM71iPqExjSVpwBUyLIVssrKOeQXdfJv/I9DQ+G63BtPX+
	i8qK5Kiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vED5x-00000002qp5-0QaE;
	Wed, 29 Oct 2025 20:48:37 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vED5u-00000002qnf-3fdP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 20:48:36 +0000
Date: Wed, 29 Oct 2025 13:48:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761770909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JYMU26G80HSBFv2mfmxmI1ldCw66DlxUZPOrNSRANLA=;
	b=mMtMSGoznU8oiC3CKM6I+dZhCTlWmvw1ubRpmyM4nMyhNicLPb4oETsm6a/gY/kM3R7A2l
	uMgoibMrNKqc42fs6rPaWAvbqqk6ib+dkdFcS2rDB6TbbvE9MZFY1tZHKxSlsaF1oejGB3
	2up1KEUWUmjPt8uzMnMoLhUpcai+VD4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Ben Horgan <ben.horgan@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	shuah@kernel.org
Subject: Re: [PATCH 1/3] KVM: arm64: selftests: Count test_guest_reg_read()
 as a test
Message-ID: <aQJ9mC5_j6HQ_jbg@linux.dev>
References: <20251014102108.2442391-1-ben.horgan@arm.com>
 <20251014102108.2442391-2-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014102108.2442391-2-ben.horgan@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_134835_061057_78B5C497 
X-CRM114-Status: GOOD (  16.55  )
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

On Tue, Oct 14, 2025 at 11:21:06AM +0100, Ben Horgan wrote:
> The test test_guest_reg_read() is run without announcing its presence or
> contributing to the test count. Rectify this.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index 5e24f77868b5..6878ee23310e 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -655,6 +655,8 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
>  			TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
>  		}
>  	}
> +
> +	ksft_test_result_pass("%s\n", __func__);
>  }
>  
>  /* Politely lifted from arch/arm64/include/asm/cache.h */
> @@ -786,7 +788,7 @@ int main(void)
>  
>  	ksft_print_header();
>  
> -	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
> +	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST;

TBH, I'd actually be in favor of a patch that removes usage of the
ksft_* harness from this test altogether. I don't think it adds much and
we use the KVM-specific test assertions anyway.

Thanks,
Oliver

