Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A08FA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdgCAqNkZh5ZPsycE8zm74NWIwUscD6iQ05BC6RkYo4=; b=fMT+yV9hQ1/AFxhjhcSf8FFXPm
	H/xnyOl9DDEgExr3KpI37CT8pfr1tkg/oGZFufX41Av2C90cKQ9IiVxEm6ChszGhyrtuzp8EkoGft
	7NwntiOdKTcfoL0qg1twKJ1gmtMX+ZNQl51coRdmNqEsJMdfoTQJsAeQjSP1X5QZ9vRbI9Ikj5J4e
	eMe+Uxo62X0xhpFoTEdsb6mkD/Z3XzakFaaVvAnvqrWoKS6XAbOrPSPDgoqHIBf2PG3WgJrR4HOtm
	uXdZI9KKtHBuAKNgEk3zdZaciuwZzEmfl8DeSmVdfOk4vNIi6IbGf3/0dNIMRpK6VXN/OV93E8/7n
	MT6lNCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjsQ-00000008d8J-1ieP;
	Fri, 02 Jan 2026 18:27:55 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjsO-00000008d7E-1eO9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:27:53 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so2295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 10:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767378470; x=1767983270; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UdgCAqNkZh5ZPsycE8zm74NWIwUscD6iQ05BC6RkYo4=;
        b=ql1JQ3oIhXJTjbu6063YeSVbp7dxR75Zw5cspuTUGuYXVYRDgxoFwXV1QpIUUfn72j
         DwuldXz9bxm3JP9TUyNQfwhYzdJWwhOEtyuwFD5SdKuPfrN0lCEZY5e+Vb51F6W3GlMB
         GKNgA9IYlpFISeQnz3fh6R8woZvxHPgbNG9z2GotuMGhSvQ/teO0LIltP/KISkT4PgQ7
         Nx5fjf0qtj9/guagAwvPWsoMAHlFXI6sXTYy4BdiD4w2/DS825tD6ckcEM97fo2LD+sm
         caV4Qdu0lSqWgpycpLcChTimU6bAWa2TGB3729QWVOZ9jutytsxNwDdY/L0Fxsvm5G61
         ODbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767378470; x=1767983270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdgCAqNkZh5ZPsycE8zm74NWIwUscD6iQ05BC6RkYo4=;
        b=dM6icYz0lDtl5S6fWwGHpPZZ+q9tHHV23ArJ1t2uOC8EMqbyA75SB5GiK+daUBRNYM
         iYKaLzO5rWUA5+m6OAYxQkllnkRwiSrPHaS73W7nI0swM58r7X/51w/Kl/62eboCHQQq
         SwX2raA6u5b4PQTeaN7cCN/u4j0yoK8swDtBVhOebfWnpd8ab3w1TP2aw55pXrapLqJ+
         WDNucGuDZpL7MW93s25Gf5yAJvy2VF/6AYpdPLGM+hMYebiR5BRKfu45QtZZ58KQ97XT
         6Mf7oi/rxBOIXJArr5I8jbaYg22CYB4P2XHLSJa09yxyHnTcMhKmTd99FfxxRM6gRc/y
         PoXg==
X-Forwarded-Encrypted: i=1; AJvYcCXge2h5X5AQEfBekwUG7ZbHY0QqYrAMZG0jUYcJaseQjC63iLR3hQP5fIvTc38Kt5Zjh+xjkFNNYlCH3N4qWrMJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZTYsKrNMhGGdPhd3wPTY2nCh+qgVBmJiB3NSSJCvB5KAFDgLK
	UifJrnsUe52nvihUIFtqQ4eVMd7p/VlgLXLH7NtwtTLZd8Gxssc9QcvbA7oqr5xqOw==
X-Gm-Gg: AY/fxX61EuMy3k3QyYVbB10SzksvqnnOn0UKjFN81E70lkLHMTpcn7U24rYb2B7VTWc
	EQb2mNqWKeFBJJMhw3sC93YrQGLT5+Y+hIpxjMfudHsPictUHalD7vd6U43wz/E9qTiCRuZx7dI
	d2pb81vMO2G5a3MsETYSTZaEJKxOV22CR8ru+L7b4J7WdLof/4QDx21LOUUn2faD9ytQaeBnmn1
	0Ty7mHrbEpi/oQppGqin06FUNmZ3BkXkNkJWXC/w2YKYAGpGqIzcbpdc3m8Zq2r61FHYiqLtunc
	HZ8tuQQqJHiRJGIJhvMiRgntSeyiG5CfGoZLVa9LQuQNZysAu+5vfofrnX0IQWTXkuJiDJ7ISlz
	zUgbtJAzwyou+TcKvlkaQN+eT7Q8QGSopKlXmyzveFPTE4zLr7pn6wTndxIcld7Za2CfZerKb81
	70S+CnkeZXPDzYxHeX/+ERwbm0iCfrSESciXUI718zXDs+4taayT1/
X-Google-Smtp-Source: AGHT+IEx91EhhV8c0GunswPgms6CpKa884g+uF8BO4bQNAeeUoTI6cnVz5taHMhdrNBCz6Dt0KZDDw==
X-Received: by 2002:a7b:cd82:0:b0:453:672b:5b64 with SMTP id 5b1f17b1804b1-47d6c328d28mr15475e9.2.1767378470275;
        Fri, 02 Jan 2026 10:27:50 -0800 (PST)
Received: from google.com (171.85.155.104.bc.googleusercontent.com. [104.155.85.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227casm85164260f8f.15.2026.01.02.10.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 10:27:49 -0800 (PST)
Date: Fri, 2 Jan 2026 18:27:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com
Subject: Re: [PATCH rc v5 4/4] iommu/arm-smmu-v3-test: Add nested
 s1bypass/s1dssbypass coverage
Message-ID: <aVgOImSnVorozaJH@google.com>
References: <cover.1766093909.git.nicolinc@nvidia.com>
 <68d48a88a64223a1d9b76b59c05f4743f1953c9c.1766093909.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68d48a88a64223a1d9b76b59c05f4743f1953c9c.1766093909.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_102752_459542_636E1EE3 
X-CRM114-Status: GOOD (  21.46  )
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

On Thu, Dec 18, 2025 at 01:41:59PM -0800, Nicolin Chen wrote:
> STE in a nested case requires both S1 and S2 fields. And this makes the use
> case different from the existing one.
> 
> Add coverage for previously failed cases shifting between S2-only and S1+S2
> STEs.
> 
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index 5db14718fdd6..4a072c2c367c 100644
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
> @@ -197,6 +201,18 @@ static void arm_smmu_test_make_cdtable_ste(struct arm_smmu_ste *ste,
>  	};
>  
>  	arm_smmu_make_cdtable_ste(ste, &master, ats_enabled, s1dss);
> +	if (feat & ARM_SMMU_MASTER_TEST_NESTED) {
> +		struct arm_smmu_ste s2ste;
> +		int i;
> +
> +		arm_smmu_test_make_s2_ste(&s2ste,
> +					  feat & ~ARM_SMMU_MASTER_TEST_NESTED);
> +		ste->data[0] |= cpu_to_le64(
> +			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_NESTED));
> +		ste->data[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
> +		for (i = 2; i < NUM_ENTRY_QWORDS; i++)
> +			ste->data[i] = s2ste.data[i];
> +	}
>  }
>  
>  static void arm_smmu_v3_write_ste_test_bypass_to_abort(struct kunit *test)
> @@ -554,6 +570,35 @@ static void arm_smmu_v3_write_ste_test_s2_to_s1_stall(struct kunit *test)
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
> @@ -600,6 +645,8 @@ static struct kunit_case arm_smmu_v3_test_cases[] = {
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

