Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43EDCE9D65
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwkvkcWyxTfbsBLkYMdbStPrn+nfObXSdUlXH9TTP/A=; b=ig5eXjuf4GNXKhPTQ7fUBYTTXE
	drsCMrbKI+kaH7sFgAvhMuwQz6LYNHjVZMW9bOJtDpf12PB4HeTDvZxq309ke/UKJsDfbpgwYU6dH
	ne/8pYhbfoeKjZRayawwmwmh1TDH3Lwy4ZsXTrwUOyIJq36KX/JwgdGY33RtEn3NlZjlUAuayb3gz
	wtcApTxQI+5EjGLsTmA6jP/BoGMTZcrFOt2MBX+18TUvxRMvC2tzZHl1JEpBmbm42vKR+vFY7kKbY
	uCGcmtVfY5lv9MiNG23GQQs2iCKIQLIa+Rsrm2rf+o5Z3NI0agNH2ZzO2hZjuP7WKW9ymzEYbJkc7
	FKCzZkAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9Fl-0000000DQjk-3p40;
	Tue, 06 Jan 2026 15:45:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9Fj-0000000DQjI-1QXc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:45:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so6723675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767714345; x=1768319145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwkvkcWyxTfbsBLkYMdbStPrn+nfObXSdUlXH9TTP/A=;
        b=YmhV43htB5gX6G5kQ3G0nuQec6yY36aM+IltOXzQQJIXyUtv/m7JyeIlaL2rxJmFzA
         HT8L0hZEwKtpwEeYda94JlfFFxFQgh4acl0NAmfVAJ5dYzfoWy8HVLbzFPHrply/u/Zr
         pvK9BDzQ3bokOMr0gTMyLQo/Ej3aRpZIvOcL6A0p9UaQK8ZE+neTkq6hCoptcKtVjnzQ
         1dcTxsm9rJZQfAQpdDfOwb+BJj764P6UpgzngRqapxEOY2NqtAQiToMc4Nxv9Ld38eIj
         3b+UBQb5LIxHHHtniXlg/r2eOItoDZrWp5nMd67j1bUE2l+QN5QXjIop5AK0nrToDWsZ
         VApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714345; x=1768319145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwkvkcWyxTfbsBLkYMdbStPrn+nfObXSdUlXH9TTP/A=;
        b=VpaicVsGgqDpa4m14SD5opbeAXd43sYNUnI1SrhysOX0ilMcaIYo2GWcW3BY+ZLjgH
         eCwpGeRYINPOtqtZDMH2H9aZyzFhFQs99QiPXErygsQsgjeuFrTqy5ngmb2iCNKOBdRs
         qtZjSvPGZJdnROeQW9QTwuFg072IIKJoXDKskN0LJiy2SaJyYj6MitKTiwV8OWUqbX+x
         hZkVKvf6GGRXWG+jegMbMFvSEx3eWMgLEs2A8zStIn2MsQkd19XVN9UYMnsQNtfQk7eb
         Nhf/LR7xUAA+m46/2OVYZG9QYYYIhPI3eXsTGIqQ2JyiuxVDUxB4j+plk4G/WqZ+IQ74
         +UsA==
X-Forwarded-Encrypted: i=1; AJvYcCVfut9RPKE9twOdlLqedh7HYPmX7naNoDEJ4usQwqqrJDSM57bQC6NCHXxYlxAzPvqpN4+SjRldy0jVMh5w5S1P@lists.infradead.org
X-Gm-Message-State: AOJu0YzijibE9j7IRQ0h5XGbhfIBvniiOSsnm38zmiMPI1zKC0tZHto0
	MaD2IpmtiEmgk4ZuCMh2VhDrE8vthb4AHn6bdcfs/O1eAJJ3XnG7M0EDgozLbXzTTg==
X-Gm-Gg: AY/fxX5wmOTMXHABsswT3OY6TeDfuD9UMUOWsdZHdNBXeZ3z9UJ+EE3NMd+5kyaoqV0
	EO6RyKhhB1FpOBD+2ai1a5SACwN5aNSLH8oAdtPMqt9IjwCXcTEdFXMlDeH4rLeip63brJdHfdt
	tiNz0BgPuWoPbchkcJIqvAkCLvOQFqtCHt5D2l0Q6lApds2edCq5KkmYLMuEZqoKhJTjNqsebna
	UDFdoJfcDwmUi9bzIL2SAQ4oaP9qZXkJNb4vDwrQVT2lmm94MxVF3gjduGrBEBqlDKCuvvD3E8W
	rKEbf8Q9sGaUk4x6xft6c1gqRN3oJuzSwP5Z6BAI+fN80bh+UDcAHydVG385ULUUnf4BKzGlb1A
	Gaclty7ESGQUo5/nSoKTDotvObDe3xzrIslPGzIBT+IpyZfPCE6pP/jPMe94cPioFOBLGowuhJh
	vRV9y6yDz+0h3hjeMXlrXkUBDhN6dxXLRhOvvPkt+GLeZajfF2/g==
X-Google-Smtp-Source: AGHT+IFtTU8v0TC6GJrNdhgpjBrqhdm4O/5Wgr4IoH2l3qKTodlEKzvW1qkwoysFQFNCHokEYgD4gA==
X-Received: by 2002:a05:600c:4e16:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-47d7f09d505mr43410595e9.27.1767714344644;
        Tue, 06 Jan 2026 07:45:44 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184cbsm53680785e9.6.2026.01.06.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:45:44 -0800 (PST)
Date: Tue, 6 Jan 2026 15:45:40 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 24/30] KVM: arm64: Implement the MEM_SHARE hypercall for
 protected VMs
Message-ID: <aV0uJDtZwbu2iKhs@google.com>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-25-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-25-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_074547_410866_85F2CFDB 
X-CRM114-Status: GOOD (  11.47  )
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

[...]

> @@ -952,6 +1004,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
>  		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
>  		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
> +		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_MEM_SHARE);
>  		break;
>  	case ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID:
>  		if (smccc_get_arg1(vcpu) ||
> @@ -962,6 +1015,14 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
>  
>  		val[0] = PAGE_SIZE;
>  		break;
> +	case ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID:
> +		if (smccc_get_arg2(vcpu) ||
> +		    smccc_get_arg3(vcpu)) {
> +			break;
> +		}

I wonder if that shouldn't go into pkvm_memshare_call(): that function has the
knowledge of the argument content since we pass vcpu.

Otherwise:

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> +
> +		handled = pkvm_memshare_call(val, vcpu, exit_code);
> +		break;
>  	default:
>  		/* Punt everything else back to the host, for now. */
>  		handled = false;
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

