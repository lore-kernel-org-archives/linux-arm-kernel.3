Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8335CC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHcWMQ1Z3aW3bHAxm3qzvYkMiIOMbOZVWxnCDEHnj30=; b=sAlC2mPBQftVF0LWKkxZii4MVR
	RSOrhmHxkShit19YMGkzla8I651eEQXVYRGSvj0ttSgMtBAMoae4OIHufX2tVkuakpdwhmKQ9vSIC
	19WH0ZWGZI49fNM8wOOBQMuEr4wpHZIVwSMofv4xXyALBSOmZu7a18kRlRzxkLVarwhCraSkoPwKq
	LkZsW+I7+MvxN5gc9D9fH711MGHa7mRxNAsPRWk3C/ivTAHPSVZp3dssYsQFp4718YXycvNBfqHoD
	0tutr/lojNjid4PbHZf9KQ0NtZaLLOqjmgRHQP2njYfpqitvLFkacYQydztd6YPT6h50RCnMp9gnz
	tYifoCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9msh-0000000BgaK-08Yy;
	Thu, 24 Sep 2026 17:05:11 +0000
Received: from mail-qv2-x0f.google.com ([2607:f8b0:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mse-0000000BgZV-1eDz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:05:09 +0000
Received: by mail-qv2-x0f.google.com with SMTP id 6a1803df08f44-91058dd77a2so886226d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790269506; cv=none;
        d=google.com; s=arc-20260327;
        b=GuuJV4HsJ1sq7LPBO3e9cwZXFis8pnyrjMEXGH1VrNpM2aSFWA4GRyzJP3nUjRkmbC
         hVOXycodHo/bxhao434rxgXU+w2tMWRXp0pegt8SWWfdNHbPhao4wnioATATGGoyp27N
         EOyIKOqwOkWY0jSN+1YtNsNzK0K1ih4rfW66mLNhaWVj6RDmatZ2yZTM4x9b2dbzDrAq
         J+ysXQHZkf/tUyKe7c/eKiuNDLGQaFRhFZ8xmbW7egDao96i0UjIIDYG24D/zljlFKkT
         TQ+kDU3iuajmy4+sSVNut2L9uN4FA4NK3gPBHJi0MpjXKT65Edq1m84ByD5nrvLA5t3N
         rylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OHcWMQ1Z3aW3bHAxm3qzvYkMiIOMbOZVWxnCDEHnj30=;
        fh=YUopP+hQQe5K/xogOLhuYtYKvgYovri8YBmPABkPjKw=;
        b=SB0XXgxw+a/z5hA+GUEGXpQwkVtPlYyyM72fOEjYYs/NFfcDF/LTaUZkGPoW9tOVsF
         zcKEM1/EUQzuiikbFeSjWq1cG04w2BBfS8OEx6WiBNxmeyCO9grZKJ/45O30YCFBYhah
         VpjbbuT7jj3MEYULrPVhEU6uFLUQkXqrZRc7TRQvAnv/FlxcyNIaXRtOwDpfr+CGfEod
         m7KGSAQF/1HaIU5P6zOY8EwdWj034kUHF8cM4PcZ596UVvroG7Cxchz2X8+r4T3erhLU
         lYn9y6w25gLvJF4BV+lRErpBEZYdb+0cOedGYkqKyH6HQ6Kaa4UpdVHBmW997HH00dFM
         YzcQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790269506; x=1790874306; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHcWMQ1Z3aW3bHAxm3qzvYkMiIOMbOZVWxnCDEHnj30=;
        b=aYM/DTlPq6mmwn7Wvq8OYOSw1ZsPA/h/yWBNAKTKidKJz+lWL/XxjtmseVZmfigVEQ
         IHlDpBHPXJiTfwd6I0/TVxuzGWeF0tTV6Cv4p+jSId+9XEAVQrujEcBOOiiIK+ax0RSL
         h9o687ZOSa5FAZulVdhPW3YOBZMpymlPxO2u0rHBj5L2zjM7kMjb+BYDjEGeimOfJclO
         HESaV5D2V0/ozGgTjhlNYEk1To+AsOreVzZkruxRGMUNVfw4bBd2ET5z9XE9kSXqQrwG
         KM1JSag+Efc8n7KudCUqwXZdJzfcZxHtztO9uIXGQQCLAFAJP8huLKA6BfX9mhiLCV7n
         7Ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269506; x=1790874306;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHcWMQ1Z3aW3bHAxm3qzvYkMiIOMbOZVWxnCDEHnj30=;
        b=lTz0sUrcE/miVO6eJi//lH3ghRkdtM8h3imHSLcqZJuPFw7XHZJJFn/M3tQAN6+CJd
         CbeZDsS4IKbewHhjuP2noETySaBAaPsXY7FM6B4bCXa99ZuRQuQJpWvA+3Y1gepMt26I
         QqOQtG8cN5XytGAzL6BLVNQqUn8vIgk9tExn1IVjfF8/s9NnHaOWtMwgBkOR3a5XZPSt
         bLIzFaNn0d0UOH7v3hwDozvoMbGGNq1OpodQYGk//atZ2dyj6SyIKO5Xv81IN0msJoyi
         yNcqc3wHurkptHMaDOP1/VdnwU+joqqwEOcWXPdjV9ZOrsywBttfUJsIDyfTiuncFdxu
         Na7w==
X-Forwarded-Encrypted: i=1; AKwUvBzYSHL54IuuR6sxMAC9/I3OE0lzr7Rcd9mSfoaE7oY0M0nsCbEFqgCtKCFQgyMsqyWULXZLfT4Ljufjt5ZLMxf+@lists.infradead.org
X-Gm-Message-State: AFuF++k9do0oF8y3BtJybjcasy6d3+Cy53FMcqCFMndvWdk71+saTHEw
	WYNPjJb8MK+eN1QK29xYaZK7sWhvo/H6xAbsttlmQKGyYlcYiTo3SolGTqlpxTECz+82+KAXdAo
	6+mhru6Ju/sWuWM8q4kkv6eKRdFYkO01jtXSJ6JF8
X-Gm-Gg: AYBFou1S99r+uczfbyqwjpj76ZIbe2la4TT5Ul1ZF6ZyQ7fTn8kd+tkUuWvQHYgb9Vp
	ymOI6uvdQExG5hJ620AWEbL6l5X3f5W1Z03jcr9t28NIvy3/Sv7eFGkZ39fIL1w6jQFDHtHY+3G
	DfO+enGH1+CHh7sYW9ZOu75jwGMouJHK/qcqFdf21IWr26SldqoQkdkdBN3+bPSdG5LobCRIa/a
	5wmDp/UARH538XjtWFY5fD0+e8DCef9r/jvtn71fzZWO61RrRhdeiV51so/IZgbFctCS/hzC0dv
	SUAqrKEu4QK/HuTvjLDw2e5rtfqK7WGiQCZTLJURInnXEti+i7u8PrYa7UADiA1gakaU1m1beeI
	VW801w0wGmIiGLlhdv0zUQxPrGciQfqAi+oIF/0J5Hg==
X-Received: by 2002:a05:6214:4a83:b0:912:cec:7450 with SMTP id
 6a1803df08f44-91421b1851amr31284116d6.0.1790269505101; Thu, 24 Sep 2026
 10:05:05 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 10:05:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 10:05:04 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260924135201.850038-2-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com> <20260924135201.850038-2-suzuki.poulose@arm.com>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 10:05:04 -0700
X-Gm-Features: AclHuK_DlezgNpJkyQ6-N0Dq0ZFyu15Ut5n5SPUx6_YH9nitYJ5xMl_wRWW9wVM
Message-ID: <CAEvNRgH8Hwt6_VaFxJVvytZ4La1R7bUN2emc37_fWecF9j2-YA@mail.gmail.com>
Subject: Re: [PATCH v19 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, 
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com, 
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com, 
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_100508_445550_C2645F90 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
> +
> +/*
> + * Note many of these fields are smaller than u64 but all fields have u64
> + * alignment, so use u64 to ensure correct alignment.
> + */
> +struct rmm_config {
> +	union { /* 0x0 */
> +		struct {
> +			u64 tracking_region_size;
> +			u64 rmi_granule_size;
> +		};
> +		u8 sizer[SZ_4K];
> +	};
> +};
> +
> +static_assert(sizeof(struct rmm_config) == SZ_4K);
> +
> +#define RMI_REALM_PARAM_FLAG_MEC_POLICY_MASK	GENMASK(8, 7)
> +#define RMI_REALM_PARAM_FLAG_LFA_POLICY_MASK	GENMASK(6, 5)
> +#define RMI_REALM_PARAM_FLAG_DA			BIT(3)
> +#define RMI_REALM_PARAM_FLAG_PMU		BIT(2)
> +#define RMI_REALM_PARAM_FLAG_SVE		BIT(1)
> +
> +#define RMI_HASH_SHA_256			0
> +#define RMI_HASH_SHA_512			1
> +#define RMI_HASH_SHA_384			2
> +
> +struct realm_params {
> +	union { /* 0x0 */
> +		struct {
> +			u64 flags0;
> +			u64 s2sz;
> +			u64 sve_vl;
> +			u64 num_bps;
> +			u64 num_wps;
> +			u64 pmu_num_ctrs;
> +			u64 hash_algo;
> +			u64 num_aux_planes;
> +		};
> +		u8 padding0[0x400];

The union + sizer concept is cool. Technically this one isn't a padding,
it's also a sizer? (same for the other structs below.

> +	};
> +	union { /* 0x400 */
> +		struct {
> +			u8 rpv[64];
> +			u64 ats_plane;
> +		};
> +		u8 padding1[0x400];
> +	};
> +	union { /* 0x800 */
> +		struct {
> +			u64 padding2;
> +			u64 rtt_base;
> +			s64 rtt_level_start;
> +			u64 rtt_num_start;
> +			u64 flags1;
> +			u64 max_num_vdevs;
> +		};
> +		u8 padding3[0x700];
> +	};
> +	union { /* 0xf00 */
> +		struct {
> +			u8 padding4[0x80];
> +			u64 aux_rtt_base[3];
> +		};
> +		u8 padding5[0x100];
> +	};
> +};
> +
> +static_assert(sizeof(struct realm_params) == SZ_4K);
> +

Does declaring this struct as packed matter? I guess the static_assert()
has the same effect.

>
> [...snip...]
>

