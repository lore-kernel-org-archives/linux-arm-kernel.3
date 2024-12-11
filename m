Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89609E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCBMc5V1Q6INqCw1DV7Kyq9p0CzJoNlOKxNfceyx2rg=; b=ec5KwDqkgRrgm2U/4dTmbGSTBX
	UhMlaTbykX3iu5GcpwdQXc7KybvBDGB23n32sSaXFRU8/6w1KfgChPrbtIG2WJZubil8t6Nb5hNXy
	PR/0N2O+5EO7Zvm0VnpwX8Lsf6okkreMymiR31DL0vZ1bLa93flN9fNwwrdYZTQzlv94u9y8I8aXY
	/7bxx6KuAQGDY/KurGVJBCbvZLsc+dSI2dft8RL9giekiyx6IINBRomXByVotzk9vlDqPeDbEJIk8
	QDfN9Pxv9ojzBIAaKvg93scgDfcvirFp+qwZ95dE2tMDi3fRinEbbIzu8XpQCBWfFWza/y/44VQdg
	BymRnOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMKo-0000000EuOo-3pJg;
	Wed, 11 Dec 2024 13:00:58 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLM6b-0000000Erzx-2kol
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:46:18 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso4565292a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 04:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733921175; x=1734525975; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zCBMc5V1Q6INqCw1DV7Kyq9p0CzJoNlOKxNfceyx2rg=;
        b=xpe9lFuh54QXu/oADf1qCJHmIej/fJQXeQEs8Uhxrs8LrFLOpK9xcPLAEl405WemOd
         Rk1gQBiP+CQmz+fCID/LfUJueWB8l5GMe2oDr0n1e4T0+yH6Wf6vGxjGdjd/jYL1mZ24
         gwJ4qdvcuOPsh+fOnun3KUvOEkS8xWrz7pSUfBmysfxmawAc4spmz7lZwdUjLkKHtrZg
         Tsnc26CoySO0dnZbZ/OT5+cIYWLzbepOQZSX4lxfBC6YC/tvuUDysqFXRtBH9NgNST/K
         q/97WDlXVnITavG3W3XEIh7e7Kbe2jBnbf2sIcmk5vpFqmVrWmowxRRdMchLU1QmXtKe
         Ydew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733921175; x=1734525975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCBMc5V1Q6INqCw1DV7Kyq9p0CzJoNlOKxNfceyx2rg=;
        b=YyWrLkeWtlevqzxz2PrAXLCvjNYXQVdk8YhRGtPDSbcRsNj03Xg1cMyGEcAcaFlcSL
         tCnFsyoWOYWGO/UpRkbepqiasHDO+zLvKF2Fcv+RNclzfuoJa5xXSdXEFvX3I8yhIXCs
         bAF1bB4l5KFbC0c7MPkRGO0cgCdvCs8ibQpVo0ydyVjHRsfxxWRVA29cJviFWVPsU1uO
         HMqR5md3Xf3Iv1+Xf4hmi1S0+CFTdaExRSM95KY2Dygcr2IuG8Daq8akeLe0C85Tx343
         FLptP7yVds5if0UtZ7GE8L+clTDJVVMUxzQEv8RpVeNWxqaAYddgo4aaG4OK1JyQ8JrA
         3J6w==
X-Forwarded-Encrypted: i=1; AJvYcCXfSUmnpx46PDLHnLScASucVKl10ZK2Pm9ub2ducegrhX+JQ8dZqNvfeIv8f9fw9VRh6VX7apdnUeT9HGId3qn9@lists.infradead.org
X-Gm-Message-State: AOJu0YxnFQ9rp9nDPFEIh1MuChHVT6QCJ3iCKwt9FA9IrkobzRUCWwLp
	FK18zMFz9L2Qo4QUJXMEH2FllBlDCrbhsVE5VPXrgjKYSn++KDc2QIufC+A7yw==
X-Gm-Gg: ASbGncvzDdJvyEFqaqdBx9523th1jlMfNbuUQdnTK3Fyw1fxGS72oBWmfSzUeTV8cjc
	cEZWBCsxSG+sqFhe5k2ethj2I/eDvj0yhomBFcIkwd7yzVBnTfKP+TYfZueixiQJ2PjH0SJN3fK
	Rogor+nvV5NsnEbH58Wz/ohAJpri6Zx7ughtp2UCeWG4BOUvAvIdJJdz9tc9B3QfQGg2O/8xgR4
	z0T2OPRQ/T3geUakk5vqAwk5Dv2OiRP4HlGRmcJQF2zbWLsrbLQOQYEA+tzE7Xfmp49Rwfb5azW
	wUnNNbu8FOGO
X-Google-Smtp-Source: AGHT+IH/RE5oNf25c/+lQTgnA7YehMT2JtPDIfujCd0btPu97B7K6upI7Fo8An7YN62TiZ5r0yZtQw==
X-Received: by 2002:a17:906:4c2:b0:aa6:84d4:8021 with SMTP id a640c23a62f3a-aa6b14f0ec0mr224014566b.61.1733921175479;
        Wed, 11 Dec 2024 04:46:15 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa689addd0dsm444642566b.6.2024.12.11.04.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 04:46:15 -0800 (PST)
Date: Wed, 11 Dec 2024 12:46:12 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v4 10/14] KVM: arm64: Calculate cptr_el2 traps on
 activating traps
Message-ID: <Z1mJlF-H5R_-f83I@google.com>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-11-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202154742.3611749-11-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_044617_693991_B8F53A4C 
X-CRM114-Status: GOOD (  10.70  )
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

On Monday 02 Dec 2024 at 15:47:37 (+0000), Fuad Tabba wrote:
> -static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm *kvm = vcpu->kvm;
> -	u64 val = vcpu->arch.cptr_el2;
> -
> -	if (!has_hvhe()) {
> -		val |= CPTR_NVHE_EL2_RES1;
> -		val &= ~(CPTR_NVHE_EL2_RES0);
> -	}
> -
> -	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, IMP))
> -		val |= CPTR_EL2_TAM;
> -
> -	/* SVE can be disabled by userspace even if supported. */
> -	if (!vcpu_has_sve(vcpu)) {
> -		if (has_hvhe())
> -			val &= ~(CPACR_ELx_ZEN);
> -		else
> -			val |= CPTR_EL2_TZ;
> -	}
> -
> -	/* No SME support in KVM. */
> -	BUG_ON(kvm_has_feat(kvm, ID_AA64PFR1_EL1, SME, IMP));
> -	if (has_hvhe())
> -		val &= ~(CPACR_ELx_SMEN);
> -	else
> -		val |= CPTR_EL2_TSM;
> -
> -	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceVer, IMP)) {
> -		if (has_hvhe())
> -			val |= CPACR_EL1_TTA;
> -		else
> -			val |= CPTR_EL2_TTA;
> -	}
> -
> -	vcpu->arch.cptr_el2 = val;
> -}

Mooh, wasn't this function added in this very series? Not a huge deal,
but is there any way we could consolidate things a bit?

