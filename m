Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76308C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FLbYc6DJ86SQdhqAmrNYoz6E78qOWd9IB6ZElcruN4=; b=UmU178DVvHHBOrE/i27PavpBO0
	pdBCwgfM+vWei86W8/M2slLy05oiUiEiqeHPW96ZwsmlWFzrwhWzZ78mHpKVAgoPs9/h8MI6K76Tz
	rKy8QLamV4sPJb8Ul/RKjWCJRqdy8IioBxL/l51Y+qunG7jow+dFesYvyCtbXZQOgB7HBFTCSKxWq
	IFXPvW7rr9d5uWsgN76vZOBmRZiePUBnWMDhP7xyeb4WznPl3Xe0uX0kFYQ53/MFqn1ywuAwrTCcl
	vkZ5OzqdCgZD8kOIwylzFbtvcmNIYTb+bKSLnGTD+BQbQT6pqwSNWcXn6fY6Ce3feSCKrvvOmSAlH
	LrGcHdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTtX-0000000936h-2AFk;
	Wed, 26 Mar 2025 16:46:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTrn-000000092pk-23Jt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:44:36 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac25d2b2354so3573666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743007473; x=1743612273; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5FLbYc6DJ86SQdhqAmrNYoz6E78qOWd9IB6ZElcruN4=;
        b=E1X0XOTOJmBTLlqj2/c+kU/CGSA4FaHNjg6vqlvWdSv+GbPp84jU/AnjUSMurIuWBm
         7d45lK2RXtWxiVoNUFBNBwyF7BZO+OVRP9pcwu1r4TFgeI1vQ6GUu9/vsSS07v9EZ0UZ
         uQaVjZPGpEDuvBM8X1dmT/bsvueXpUwjbm3L8QcNICbvgU0f8qP8SeUBNLdqePTe6X6/
         awOnfjj4VSy7N+kxxrxvUxbHhpoUp7YH3ZGr2aPggGz44SGzbZXwqWKGc4pu3Im6+xyX
         i0JXDQ4Gv45lRa0WT8Nu+hCEGG/RjzLSjs/FbbIBLbu3GPwfC1jlmft53rIa9mi2iavp
         jw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743007473; x=1743612273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FLbYc6DJ86SQdhqAmrNYoz6E78qOWd9IB6ZElcruN4=;
        b=UM586CPpuPe83e85Gzo9tjINtoffkBRzvfRqDDCtkL6XuuUdFyS4ajPL3LETaOGA9z
         uUN8tL3PJg9uO1Nah6o0lqA5VzRMmZFvIf7lShXcmMlovdakszic5kUcbpgKiHBAsLZv
         +1cjox8iHFSTyDlHDxirLOZcI7+vE58cX5IYCS53t/dqbussu6MeOaxWVEKEBKI4FDeG
         15N4Oc7wjB/hTHWmM7xNW3J1A6iW/J1MHuilg4KN0WhNo1Gmbw5MoOmtePTHF7LciHze
         +EfwZBvd9curu+k5Elrf3Ktk+uzzdsIlX4r5C1VvAKCRAMpvPA2/yM1CWKcu7GpWorT6
         fZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdRejoG1zFtR+cxC+IJEBIZwtF7ua7Fagm1jc/InqbhcgSFZcc2qLzLf3wPPVTGxdO3yFyy4G3kG5nGw0yltqv@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlv418U9drmoJPCe3GXftwfM4yvrl1iMdPbKt90kgX8jcRK/wc
	yxdnOD1z+WCyDZ+xmPqu5cS0tafdBou9gfhpv3tCuWuaYmRzrQZ6YDEWMy8i3Q==
X-Gm-Gg: ASbGncs7Yhy8r85rqkbfAJfQ83ejeeRLPV8QPHH/NWu2o2UrYYvSAGgbyDwlykpU6Xq
	7gi/8cPeW2W0aWpXMx9v1soxiTjA5nha1cSQPDlmj+lVBVMFpvPwe2CLcSjh7/L1tKfaomvuuCS
	Bs2f9n+MB6b6jDx7sEuOryR5eX/DNrPxU/ywCXwKHCqgkJquQgZNSe5SpAaKJVY45K2TiF47oFE
	PIV4/xB47C65CxEzVt9QdNo8UKpMxD8fLeDu27qL5/csRWvb6BiWBewbS+ygaOWUzpnSjKdg1zF
	wfcgO0DG6k5UtQ74xf7obZHoDFotQz3hjbv9t7gsBTvMybk141ckPbzUkznlKOvghNcXwHqqyc4
	++AA=
X-Google-Smtp-Source: AGHT+IElc209Ee2L3zjrpSie3PIBXbdLz1F9LHwLhTXBJRf87bcz8LqAbv5vE8ZPP/e4GdP9Kaf4Lg==
X-Received: by 2002:a17:907:7f25:b0:ac3:b126:58a9 with SMTP id a640c23a62f3a-ac6fb107f18mr8924066b.40.1743007472752;
        Wed, 26 Mar 2025 09:44:32 -0700 (PDT)
Received: from google.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb6588esm1066894166b.90.2025.03.26.09.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:44:32 -0700 (PDT)
Date: Wed, 26 Mar 2025 16:44:28 +0000
From: Quentin Perret <qperret@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	will@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v4 1/3] KVM: arm64: Use the static initializer for the
 version lock
Message-ID: <Z-Qu7NSg96-1uimk@google.com>
References: <20250326113901.3308804-1-sebastianene@google.com>
 <20250326113901.3308804-2-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326113901.3308804-2-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_094435_525239_886EB0A9 
X-CRM114-Status: GOOD (  17.38  )
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

On Wednesday 26 Mar 2025 at 11:38:59 (+0000), Sebastian Ene wrote:
> Replace the definition of the hypervisor version lock
> with a static initializer.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Acked-by: Will Deacon <will@kernel.org>

Reviewed-by: Quentin Perret <qperret@google.com>

> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index e433dfab882a..6df6131f1107 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -69,7 +69,7 @@ static struct kvm_ffa_buffers hyp_buffers;
>  static struct kvm_ffa_buffers host_buffers;
>  static u32 hyp_ffa_version;
>  static bool has_version_negotiated;
> -static hyp_spinlock_t version_lock;
> +static DEFINE_HYP_SPINLOCK(version_lock);
>  
>  static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
>  {
> @@ -911,6 +911,5 @@ int hyp_ffa_init(void *pages)
>  		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
>  	};
>  
> -	version_lock = __HYP_SPIN_LOCK_UNLOCKED;
>  	return 0;
>  }
> -- 
> 2.49.0.395.g12beb8f557-goog
> 

