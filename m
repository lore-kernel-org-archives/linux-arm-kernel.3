Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E02DD6E2AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71/t+zukONFmhteBzEJIyiLt6qukZUCn3lZ8Jl+QJWQ=; b=nfXNo/jkND00o81RadpdcRmmt5
	vvdIMNS+/+d3Xt0KW3RiLssB4bcmRwSpufD2v7iN7F9eqn6XahsaoUWKwiHp1BWitIcHXYgTSJhph
	fyTFo4WEm1B8as5HTMV5DGxuKF4z+Nq5QUioei9hQrIbs204AcQex+4cTm/P0W2Jo6Vk03XqjGiEj
	3vnUB5qn+iYneaEJ7Hqm0zdX55j7tnyyAgax/PWYmE2lFClrzosjbH73zHvec4vykJtL8rijkUFJW
	/DqK3hhadgOmMkrWxKuKTRHYNIwpOPSwmZnIze+vt5U/vu9K62mZnJVyd41tPLl05EaUNrRVHJjGb
	3Hk4ts0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWHAJ-00000008r0C-32cv;
	Thu, 18 Dec 2025 16:47:47 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWHAH-00000008qzq-0r4Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:47:47 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-477a1c8cc47so85485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766076463; x=1766681263; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=71/t+zukONFmhteBzEJIyiLt6qukZUCn3lZ8Jl+QJWQ=;
        b=0CF7aPJeVpeQO/Tkirn16SOvnFPWiFXdK19owmlrLNqTvo+SdD/FMLRnPHAXJxyFap
         lh7RsRGMVyUmzhbm8PVd3LWLZYE1rbMjWsojO8Ae6bqnEYtJwQ/lhbQoXmvTL4bvU1El
         LRHW+r899qa4NzOTFXGDYU2OS7R8OT7HyJj6yXzML1pLl0Udyew43wxV7w7dLuROVPbi
         Y7GIDz7C6g/Fn1D4NV9jmdC+HGwXsGmzl4xkw+EKAw++O+VagOG4ySXO0cc4XSwOmQ19
         hJZpQOKjh4lvg9lonr3yxKYNkujCy1tJl1HHjk7dujIni/zIG4TBFZL80xxeu4Drg/9t
         EVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766076463; x=1766681263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71/t+zukONFmhteBzEJIyiLt6qukZUCn3lZ8Jl+QJWQ=;
        b=hXZYxn124dbasC1A2jVtRTEFW9fGs+h0dcItKfEhM+9VClI46EJy2oENMtLegZ9hyU
         HB2/X/cEPKvmP6Iv46rBpjnh/lXZMZIdl+1vT5Vp9878dXthz9rCuMFNgxvF7+gFQa92
         FClIKvpw+AJNTiMmB4RgE8J+4AfXThlJ1Av7ngq0XGFMNdhP0NgoD9dADnHqmNJex/hb
         6kfA/xJOPmKg9yWAUlG3z9Sk0BJZSIwJ79XeOeS0Xz/8HrtgriTErpCYvTxt+ULJFHMG
         5xet+B8Dq5elTC2NuLSIZMy2FO+1pS0BAGOfWXaXCdysf1fgxQVOibl2CFTyJX4MQEGr
         y8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0YmF6HLFlbRen1STkP5IESRUiqHF9PmPKx8EFaPR6IvAadKyNeosKJi7wl5iCpso3Mci1jcAkxSRXtKi7me2Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzmOONFWIiLoEB6grwvkKV8ainiO0njHv6VUhD+GGvIw/kxDEov
	Hi9amROEeC1HuNeWlIoAS+BENoeLVrn/zs6t/fQIcOHB557MItjAcbLIzJ3idCG2MMvtiYP8/lY
	xnY3Ir15K
X-Gm-Gg: AY/fxX6oVYJKA5nl0qi7WB/0aCvbn5AGMpODD1wsB3ynq+B/88NTLbs6zPTLuIzV2BD
	OziLfyydLqlIuMuh+lnwk3Yn17zeADpZFz2Y3K9EsRFVTlcqlhTsd0zwB+qZhVMP7kLAvYXr1O8
	IoKGSQep12rHEr2OqIjzBz4WQB3GlKd1qD/XLaFhQKkrTLR4Q17rftKDdhR3V9wInWulWN3XIVY
	I30dL/otfS5lPP5UEP7PY7crJz+pbMYg2DnB2K16Uoyi/O4cNmR+GhwL/BmNJxuaOdZKt9WeBQ6
	XHkLL3I7vJLQdQ7azrEgLM/Otbj4lZiCuP3s01PTjGrU1koU0+jgtZCQWitlFx9hP9+qBz5SRrm
	dBtegFpZZEV7rNa7bUjS5ZlsKk7uEgZ5VqL7aRft4u0o9pl56KHRxx6tn1LKsc/xHMQdZS0JKPy
	3XaR0qXrZvRrGLHFdl5RnNQ/t/ib78PSoUHsKxM1Bd7mn/zGS40xdEBbHitNH6ZBQ=
X-Google-Smtp-Source: AGHT+IEwA6XXBbBrnkNpDSyMMUjDvcXJmGq2sfYYfcaOAM4R5To9TrPd6uo2ODMIhod3ttVZXOF0Qw==
X-Received: by 2002:a05:600c:8888:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-47c97d92b03mr513515e9.2.1766076462804;
        Thu, 18 Dec 2025 08:47:42 -0800 (PST)
Received: from google.com (171.85.155.104.bc.googleusercontent.com. [104.155.85.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac4c1esm16379985e9.14.2025.12.18.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:47:41 -0800 (PST)
Date: Thu, 18 Dec 2025 16:47:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com
Subject: Re: [PATCH rc v4 4/4] iommu/arm-smmu-v3-test: Add nested
 s1bypass/s1dssbypass coverage
Message-ID: <aUQwKot1Ao0lE-C1@google.com>
References: <cover.1765945258.git.nicolinc@nvidia.com>
 <6fcdd663d62dcab4005401bac2d23d18dd28e0c4.1765945258.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fcdd663d62dcab4005401bac2d23d18dd28e0c4.1765945258.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_084745_272772_8C9FDAC8 
X-CRM114-Status: GOOD (  20.67  )
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

On Tue, Dec 16, 2025 at 08:26:02PM -0800, Nicolin Chen wrote:
> STE in a nested case requires both S1 and S2 fields. And this makes the use
> case different from the existing one.
> 
> Add coverage for previously failed cases shifting between S2-only and S1+S2
> STEs.
> 
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index 5db14718fdd6..8255a02f4efa 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> @@ -33,8 +33,12 @@ static struct mm_struct sva_mm = {
>  enum arm_smmu_test_master_feat {
>  	ARM_SMMU_MASTER_TEST_ATS = BIT(0),
>  	ARM_SMMU_MASTER_TEST_STALL = BIT(1),
> +	ARM_SMMU_MASTER_TEST_NESTED = BIT(2),
>  };
>  
> +static void arm_smmu_test_make_s2_ste(struct arm_smmu_ste *ste,
> +				      enum arm_smmu_test_master_feat feat);
> +
>  static bool arm_smmu_entry_differs_in_used_bits(const __le64 *entry,
>  						const __le64 *used_bits,
>  						const __le64 *target,
> @@ -197,6 +201,17 @@ static void arm_smmu_test_make_cdtable_ste(struct arm_smmu_ste *ste,
>  	};
>  
>  	arm_smmu_make_cdtable_ste(ste, &master, ats_enabled, s1dss);
> +	if (feat & ARM_SMMU_MASTER_TEST_NESTED) {
> +		struct arm_smmu_ste s2ste;
> +		int i;
> +
> +		arm_smmu_test_make_s2_ste(&s2ste, ARM_SMMU_MASTER_TEST_ATS);

Shouldn't that be conditional on "ats_enabled", I see the callers of the
new tests already set ARM_SMMU_MASTER_TEST_ATS.

Thanks,
Mostafa

> +		ste->data[0] |= cpu_to_le64(
> +			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_NESTED));
> +		ste->data[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
> +		for (i = 2; i < NUM_ENTRY_QWORDS; i++)
> +			ste->data[i] = s2ste.data[i];
> +	}
>  }
>  
>  static void arm_smmu_v3_write_ste_test_bypass_to_abort(struct kunit *test)
> @@ -554,6 +569,35 @@ static void arm_smmu_v3_write_ste_test_s2_to_s1_stall(struct kunit *test)
>  						       NUM_EXPECTED_SYNCS(3));
>  }
>  
> +static void
> +arm_smmu_v3_write_ste_test_nested_s1dssbypass_to_s1bypass(struct kunit *test)
> +{
> +	struct arm_smmu_ste s1_ste;
> +	struct arm_smmu_ste s2_ste;
> +
> +	arm_smmu_test_make_cdtable_ste(
> +		&s1_ste, STRTAB_STE_1_S1DSS_BYPASS, fake_cdtab_dma_addr,
> +		ARM_SMMU_MASTER_TEST_ATS | ARM_SMMU_MASTER_TEST_NESTED);
> +	arm_smmu_test_make_s2_ste(&s2_ste, 0);
> +	/* Expect an additional sync to unset ignored bits: EATS and MEV */
> +	arm_smmu_v3_test_ste_expect_hitless_transition(test, &s1_ste, &s2_ste,
> +						       NUM_EXPECTED_SYNCS(3));
> +}
> +
> +static void
> +arm_smmu_v3_write_ste_test_nested_s1bypass_to_s1dssbypass(struct kunit *test)
> +{
> +	struct arm_smmu_ste s1_ste;
> +	struct arm_smmu_ste s2_ste;
> +
> +	arm_smmu_test_make_cdtable_ste(
> +		&s1_ste, STRTAB_STE_1_S1DSS_BYPASS, fake_cdtab_dma_addr,
> +		ARM_SMMU_MASTER_TEST_ATS | ARM_SMMU_MASTER_TEST_NESTED);
> +	arm_smmu_test_make_s2_ste(&s2_ste, 0);
> +	arm_smmu_v3_test_ste_expect_hitless_transition(test, &s2_ste, &s1_ste,
> +						       NUM_EXPECTED_SYNCS(2));
> +}
> +
>  static void arm_smmu_v3_write_cd_test_sva_clear(struct kunit *test)
>  {
>  	struct arm_smmu_cd cd = {};
> @@ -600,6 +644,8 @@ static struct kunit_case arm_smmu_v3_test_cases[] = {
>  	KUNIT_CASE(arm_smmu_v3_write_cd_test_s1_change_asid),
>  	KUNIT_CASE(arm_smmu_v3_write_ste_test_s1_to_s2_stall),
>  	KUNIT_CASE(arm_smmu_v3_write_ste_test_s2_to_s1_stall),
> +	KUNIT_CASE(arm_smmu_v3_write_ste_test_nested_s1dssbypass_to_s1bypass),
> +	KUNIT_CASE(arm_smmu_v3_write_ste_test_nested_s1bypass_to_s1dssbypass),
>  	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_clear),
>  	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_release),
>  	{},
> -- 
> 2.43.0
> 

