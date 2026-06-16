Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B56CCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bkaQdVB1icoUbZrrnd4GITgcdZYxSW0MNtl1DcuHmc=; b=rIyoetv4K6Kvt3yTRmBeha8Rsw
	fLMuv3OwV+RVtiODEHHKXPLnOnePc/IHy30AfKUHGBfCa3szuhZCB98AlmjfHgBOFpfxAuxkaazXo
	Ib5Jcl1SfOBzYFhG5qRuTKx1oxeSFn8JcS8JscRk4X+dIL4sId9gbvIaRkbGk7r/Eb7/Xchblu8lq
	FOJ49R3E4wPZGuknRqB4S8pDfIEu5NXjQRzYTd+ewSXLsb5ZQ7XCOt4z2gFQemvrKpotnywHtWYqu
	MIIFTeu5NApORegDvi0LCTK4BlKUd4DrO15+IbKpo0pFyHjNrT4lpZki/ERjcwBJHmHodGlqhjl3g
	Ir2ESg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT5o-0000000Fm9q-17Kg;
	Tue, 16 Jun 2026 12:40:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT5l-0000000Fm8y-2Yyi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:40:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso33673675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781613630; x=1782218430; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9bkaQdVB1icoUbZrrnd4GITgcdZYxSW0MNtl1DcuHmc=;
        b=H6UdcpmVsyZEhClAqEVQt7Val++++1L6MjdH1Wy4DLYimFhW4jmqhVdMM9DXusz2Bk
         d8vRWgP8XnFxQSS8abU2eFSDSjkuW8uDp2IEr5vNXt0jbXdkoyYXtiPXOuDWqfcnj7Zn
         4mI8YcCOhD56dKHhlCM11Awg2Pd8XT8E2bkoDOISsHAttVAW+kWNH7agSiQVRt1RBFe7
         APpB4wdHqgyqJy7rgw/asgFWy/dpVmO8dtYkjLrSmaCDGG80dPs1Z3PDjtLX5yqGVLn5
         RdPMUyopG9JxHh2r4KTwubZ3E7CCPA5SgLOGNN8gcHmA9Uc1uIm/y+jvZ4mg7EaBfDHX
         kImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613630; x=1782218430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bkaQdVB1icoUbZrrnd4GITgcdZYxSW0MNtl1DcuHmc=;
        b=igmtgOVKOD4zwCGxSp0KIPIp64bqGGgT15xTSR6K0/jI+FVGlmxRZ/UDIj/gtqL4fY
         0NH35/Aeted6cASKOlwRZ5HCkLZP9RH021EvTDGUnDtLOzO3jJr4WvuOzAa1gVwx+ulN
         E0v+vqlvaEZgBbEWj39MR/0kJCh1kV/Ob+qyxxkxeoMpJowojSAptBswH/DDwyW20VGK
         ZdwL+9gfX0dmZG6ZOFhTwQFRlAE16NnYMq0dc2NzTIhuJijYLRRLCPBkiWaGAi4t2NHt
         3/5g2Aw8J/7qhWj91fU6dcYn+bwoiHNBLGaPSel2rFZtyzfDGedTeu7AOKobV91jYEOo
         Pdpw==
X-Forwarded-Encrypted: i=1; AFNElJ+luq0oXF8KJxCfRu9NfOE7mG0btOl+tUv1RW+VO4vRexThQxcKMEa5jmKkviIUZ0kn3pOB8lw7ep4AXrrrRYC6@lists.infradead.org
X-Gm-Message-State: AOJu0YxDXtQ+mhyd7QEbPuMvF823qh5Z0JYpiP3o4LwYvMJcHdFo3jbG
	nDugmyP/Tq+uiabCQRDXsxQLu7XFG5Xvr0okV0SSfWAJz4Mer3OHVsLKbE7um59nSA==
X-Gm-Gg: Acq92OG8BoM6tYQFCnIE9WZCtqZf5P/2Sh90tcNgU+5+RQSDIyINbkvjrFPxK/3sXCJ
	23iGZFMlFid0JpvWuNhFV6eMEvbRhS0qgtP51vGTGc1Zc2kvSYWeqRG5zL6N9nLGfLTfjrswaRJ
	n83M+hEC+IFjS421CBwlgCOeUynRaGjVR+54GtQOb1s7pxu5pwWMFh9nSk+9pjPDzmuMX+a82uG
	8P4mVTxIcemHs6h220eqaZNefU5u/O38bCrCIgbVa/axqseK+zoqgt+/cFSlQdTeHkKmsn43zr9
	yjfSYZpFebdwL2TaskF7yk2MlTmKnxJ7A2iEqWnuiXGZg8vEY59iIe4LJmoTOJBL1tbHIA/Uyi6
	FFS4LiBrc998uqMp831P1gYUwmTsnMaRg8/fZKaaJJV3hUES6S+6ijmHlRgVYAtTqas2C4ONDMX
	cwe4XDSsrSTKdfpDXMdTFc8XIl1KB4kGiM23cvn1855SoTcoaF4DgVFvMzsoEd/jtWmo8=
X-Received: by 2002:a05:600c:1396:b0:490:c032:ae92 with SMTP id 5b1f17b1804b1-4922ffc87c1mr50927645e9.33.1781613629590;
        Tue, 16 Jun 2026 05:40:29 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a96d14sm54054125e9.12.2026.06.16.05.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:40:28 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:40:24 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 1/7] KVM: arm64: Support
 FFA_NOTIFICATION_BITMAP_CREATE in host handler
Message-ID: <ajFEOK3bVu5QRoCv@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-3-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616105417.2578670-3-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_054033_835985_7A34A6F5 
X-CRM114-Status: GOOD (  22.01  )
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

On Tue, Jun 16, 2026 at 10:54:09AM +0000, Sebastian Ene wrote:
> Allow FF-A notification bitmap creation messages to be forwarded to
> Trustzone from the host and introduce a helper to check for SBZ
> register fields.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 36 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 1af722771178..b1e5f9ee86ef 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -71,6 +71,18 @@ static u32 hyp_ffa_version;
>  static bool has_version_negotiated;
>  static hyp_spinlock_t version_lock;
>  
> +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> +{
> +	int reg;
> +
> +	for (reg = first_reg; reg < 17; reg++) {
> +		if (cpu_reg(ctxt, reg))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +

Hum, there's something a bit weird, as this function was introduced already in
the previous patch. (and both have the same number)


>  static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
>  {
>  	*res = (struct arm_smccc_1_2_regs) {
> @@ -676,7 +688,6 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
>         /* Optional notification interfaces added in FF-A 1.1 */
> -	case FFA_NOTIFICATION_BITMAP_CREATE:
>  	case FFA_NOTIFICATION_BITMAP_DESTROY:
>  	case FFA_NOTIFICATION_BIND:
>  	case FFA_NOTIFICATION_UNBIND:
> @@ -862,6 +873,26 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
>  
> +static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
> +				struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u32, vmid, ctxt, 1);
> +	struct arm_smccc_1_2_regs *args;
> +
> +	if (ffa_check_unused_args_sbz(ctxt, 3)) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (vmid != HOST_FFA_ID) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	args = (void *)&ctxt->regs.regs[0];
> +	hyp_smccc_1_2_smc(args, res);
> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res;
> @@ -920,6 +951,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_PARTITION_INFO_GET:
>  		do_ffa_part_get(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_NOTIFICATION_BITMAP_CREATE:
> +		do_ffa_notif_bitmap(&res, host_ctxt);
> +		goto out_handled;
>  	}
>  
>  	if (ffa_call_supported(func_id))
> -- 
> 2.54.0.1099.g489fc7bff1-goog
> 

