Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69729C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKA+Otx0H3SSzEwciVvwkw/A8oV7+p3SzrtXzaI0oPU=; b=AF7xtMSUycIxN//jzGQ6CFxR7b
	/nSMUjeDVffjMmn2ARX/VdqIl15/ZnwIRl3XovRdtDbczdRMpmwAQvXNvpCi4FZX07V8dAKfQ3U7g
	wD18elX8j3JSiea+8NlgB6gvAZrKw66VC7YypuaDFBy5i+tDIxoFroAgsN48LI6esjSegeWpfvdMh
	HQv2Q7XFwD7OrtMrkl6ecDrKLaPXF5ZTO0uIAgQvyzUQxWsiRvysNpIYqTiK38jE+eCb8C881lG1J
	PgbQbFCWkDswwO7Fdx89zkpJWeRXkQI22bWlwXmAD08NqA236O+3ASBCftj6ypovHYwI8vDADx/vu
	49QgN2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2QW-00000000CWk-12qW;
	Mon, 03 Mar 2025 09:49:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2Ow-00000000CIJ-1Ymu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 09:47:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso456641f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 01:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740995272; x=1741600072; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CKA+Otx0H3SSzEwciVvwkw/A8oV7+p3SzrtXzaI0oPU=;
        b=VemC/vWuXW+XziNeMzof2tEsxkVNHF9eHA/W/ezHa0c8bG1AQGWQee8g2gUeHuEvlS
         hN6jFSJ4p35MjWpCJZoKLLXTjV+D8sNA8eFPjEu0b+IKQJRgeciDjYTFjfalnqC7hjWZ
         nsVA1W6eYKbcnQa718fJfvLFqixLtesORKMHCurXucD62ntl7/VLdT+vlmMf71IfiiL8
         eKag8fAHuJF31Z72SuOWirNhfkmKT1N4sDDfAcb4trLlvph6WlxIR8vcycljFfFzjcrf
         w96+H8gAuaICiP/VfpnTiyjb0NpOtndFM/Nrhr1bMBt20Ngh7Tb3u8fqhv6ELF80zQyc
         5FYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740995272; x=1741600072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKA+Otx0H3SSzEwciVvwkw/A8oV7+p3SzrtXzaI0oPU=;
        b=FdFmkOjt1+4HLkrol8XiWr1WeuECOQpFl+m7NqbyZeQcjUIoi3brDyP9NXy5fHBC7k
         08BQ4n3qKeCgIRL3KtStmVYx4qSfTgBCGX/A8pH329d2HHDJSKBFV/i7o1HazovVQYRA
         nQEFRNoZGHSfMcA1jOR8yGsF4wm6yK4LOms0Y76Z4Z3++8LyxBz07NJ2zerqFaxkmBNs
         DWqxV3duw6Tcnq5X4GTwIXtQSpdaqbix72Ux9epL8XkrrMg5bFaKOU0jbBWOvIBeRCVB
         wLGQxg5M2asQwIWsLaSU7diKqXISnUOn0HoSEY0OF6uuBI7dx3vBVmE9SrSVOieg+Wyx
         msaw==
X-Forwarded-Encrypted: i=1; AJvYcCWbmmCH3WTOBphnv1figC7UnGncb76TZnraLycGa3pxbx0C75S8Q2ZMLTNDPd/LvU+LYWS7Tbv4b45Qh0L6VRSi@lists.infradead.org
X-Gm-Message-State: AOJu0YyRkGtb7iH798NWuy3/8i9BOuMQKTVRAVqxRzcke6Iqt98PSAQU
	7ZZaLrn/JAqZHgJHbB+DMBgMsg1tlx+Zqru1qxXajECNqExE1WZz+Cm3iOGi2A==
X-Gm-Gg: ASbGnctCJSXLf1FOErofOW/3btfHPht28uFxKboMOv5fdXy8vj/k8QLnCuwFB6KhgTW
	lBF1152qL2UqxWzthinBAqghmTSu/WBIcra0t29ll4hrpcVtnRt7sAGSCWCmpqD1hTMd7Rj8vGu
	rOplhvaJ5GMCZ6944qBoZgCO/1zokGK5ADs2q3Fclgefy5mMGnuWebJ8SdqB3P+0/aIJnUjukkO
	aaB6Nu/mnmQKpNMyoKAlBbYsoKupDYnzUWX4ifOmaJuLFLKx9Khjgye9P3ewyL7YHCQk6OceDm+
	qKmzyLhRaybpShRzO+p2REQnKZspSCKuTGsFBdMvXL9XJnh/lXQkTOSO6cVOq4cFEtdVP1Xf27m
	Z3hIyOHaVfXSh
X-Google-Smtp-Source: AGHT+IGZadExtmq2ZKN18m9L/PK1JThIrBLdkTgdsuEaaAEPwP3+f2+949dpjiKHv0jHI9BGV6sDlw==
X-Received: by 2002:a05:6000:2ce:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-390f9d0075cmr4936619f8f.1.1740995272497;
        Mon, 03 Mar 2025 01:47:52 -0800 (PST)
Received: from google.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796051sm14170400f8f.12.2025.03.03.01.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:47:52 -0800 (PST)
Date: Mon, 3 Mar 2025 09:47:48 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] KVM: arm64: Move hyp state to hyp_vmemmap
Message-ID: <Z8V6xOVCPp7OOX6g@google.com>
References: <20250227003310.367350-1-qperret@google.com>
 <20250227003310.367350-5-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227003310.367350-5-qperret@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_014754_408547_E17B3489 
X-CRM114-Status: GOOD (  14.30  )
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

> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index 1a414288fe8c..955c431af5d0 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -194,16 +194,20 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  
>  	/*
>  	 * Adjust the host stage-2 mappings to match the ownership attributes
> -	 * configured in the hypervisor stage-1.
> +	 * configured in the hypervisor stage-1, and make sure to propagate them
> +	 * to the hyp_vmemmap state.
>  	 */
>  	state = pkvm_getstate(kvm_pgtable_hyp_pte_prot(ctx->old));
>  	switch (state) {
>  	case PKVM_PAGE_OWNED:
> +		set_hyp_state(phys, PKVM_PAGE_OWNED);
>  		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
>  	case PKVM_PAGE_SHARED_OWNED:
> +		set_hyp_state(phys, PKVM_PAGE_SHARED_OWNED);
>  		set_host_state(phys, PKVM_PAGE_SHARED_BORROWED);
>  		break;
>  	case PKVM_PAGE_SHARED_BORROWED:
> +		set_hyp_state(phys, PKVM_PAGE_SHARED_BORROWED);
>  		set_host_state(phys, PKVM_PAGE_SHARED_OWNED);
>  		break;
>  	default:

Are the SHARED_OWNED/SHARED_BORROWED still relevant since the introduction of
"KVM: arm64: Don't map 'kvm_vgic_global_state' at EL2 with pKVM"? It doesn't
seem we have any !OWNED pages in the hyp anymore at setup, do we?

> -- 
> 2.48.1.658.g4767266eb4-goog
> 

