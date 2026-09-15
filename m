Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7400EC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9GzEG0V2MFSbPgXHqAbp6UbKpY+Or+jzCuC6xa616s=; b=kqVV1AItaIzERLBOlRDJRDrNfC
	fRT1HeEpq8gZHBRaWylOD1zHdAzYL/e1J8VfWxCkjT6J8ZTHQL7h3HrMgqi9SwHEeo07KLw9iZtLx
	CxP6oSFx96ye1kfo3pI8Zxt/KJ0DJn2X6U1K7MOiYAwehNswVGCrgJtEDeZBKlhddBiOinNqg+FAr
	/B4M6+6QeSmZkJ3rTKWes7FaaboU/uATIunvcP2tBkvs/ngznwazB0LlVGZ7/yPR+4dNW2i0lMoUu
	TlC3u75IE2HmoaVsg+7Xe4Dr/AXBpf7rUvRclTn4XbtLFWdQIvdhY65ItWmeGxDkz0Z5ey9X7Fh7M
	uWrqEO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nn6-00000005UWL-1kHA;
	Tue, 15 Sep 2026 07:41:20 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nn4-00000005UVw-2IEq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:41:19 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356f6bso2289599f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 00:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789458077; x=1790062877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r9GzEG0V2MFSbPgXHqAbp6UbKpY+Or+jzCuC6xa616s=;
        b=P1EVoCnquvxpw/VHkqNFFd1f6hEocrjLdZ8P8RAEcbWepa116Mv+2EU/MBbhny954P
         9wv6jeZK/aI3DGsnWOj6oibRTgiaac6XiE8pJXkFmTTNQRef0/MmApzvam9nhHVQo0V1
         eTwKa/zZU0vVjTSw7obBkWMaom3S9ZZPw88Ljj37CaI6xXpCxouB0XVb+87jh1uZt+eZ
         6ToyRn/ea+87aTh/jZMVfD5iWGo0Fwcc8gTAcvFyk4aULy/GMkWtuKqNmpKC+kl0Mgar
         GeID1FjgmOK6+8symmjSJykrvonWdaL1Eii5ldjqJqmqdyDVpxtb9faVYHvAKoOIG4Vc
         7v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458077; x=1790062877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9GzEG0V2MFSbPgXHqAbp6UbKpY+Or+jzCuC6xa616s=;
        b=fZXaFl0KbU+jncAZB4S2pHIuV/N+gv0c6cayZDuyQ6fasiJJKKhVafpqatPk3Ri60+
         Gdw41/70162BgOFBv+5WJcY9HRiCwW3r7MNiYHtQNhDAg3YtZetthyUP6Inx86aqh12/
         2mARpsJrl7f92BgS8eREhIkvTiE6MI6uBqPXv7viZoYdB5X6WxfDip9mhlsvVPGHnA2r
         Iz49r9LYy1vQpQ201LRaxLw3psylh2jSS8QippEAyXV+oqudvnovrT+PRYGY5Yhw9Hda
         um9H3AvDZtvMUXDMzcXzQKpJSLpU+N+1Lu1hWSrAElDkdlzMDQH3LkwIA8bNdDL5dgMl
         951g==
X-Forwarded-Encrypted: i=1; AKwUvByYKOrFSgJS0fqOU8xTJbrFMZR86EqwebtyD1h42Jh2pgamUWFywxRtRY8fxGKD4h0+Wp1ExRGG2cqMuWU8XjcJ@lists.infradead.org
X-Gm-Message-State: AFuF++l/8+mwG6Xiq29IKqwdlrALjN55H52vXeEnXg4MnUnEDbGHHtfc
	WhWC1Cr31Bdo9dCVI71HU+Ztx6VYqaVZ0JDHZBZVdWp3pOWZ7uTvZySfNoAqmKBNXg==
X-Gm-Gg: AYBFou0TqOMMMwbDMP3OtkI+P2rT61hDnI2bxfuMSG9tYrJUOhH357+uotyAgPvnIRc
	h4I84EmMton+cE8oAr/jG1TJwdvfE4DSrJvtfVYFWAPghA9Oepo3xeoYn6W+eTRr9KfBbmdTovT
	lzUBjLmx4hyx2rlHOv0pa2t2SxyAXouCcAW91zfArSIA7wK8b08szl+CxSsep6PeQNf94b602+f
	J609H1pOfNnO1/eqtlIiJEIPfg7WYjkPBgbdL2pQXnSDMZJjqI5A/uTUQLQ/dApami/d0ydgqa0
	gnRVfRbgk40e0Z8rHEBSueadi+1Sia2md0U47g8iudY/NhPDToVrtwO3LtAo1GCODBuJR/69YaM
	COXm1eUUJAspQ9zoYjAuPz+X3z0dae2McZG/OAn8AeFTLHXQiOhknMfJCJfnqIELDNYVizNzwhy
	mCq05mHnXbmV1T3x+x2/65GbHozGN3TlmP40RzkrpmuE0BtJwnlfiyynZ04Br9g+CYPcfGmEyNx
	uJFMgwsxskkvExmD/KTHyzwj2i96q074IJA8Zgw0mwv
X-Received: by 2002:a05:6000:41f0:b0:487:89c:3adf with SMTP id ffacd0b85a97d-487089c3b93mr2625551f8f.11.1789458075963;
        Tue, 15 Sep 2026 00:41:15 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33e020sm34226386f8f.18.2026.09.15.00.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:41:15 -0700 (PDT)
Date: Tue, 15 Sep 2026 08:41:12 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com,
	tabba@google.com
Subject: Re: [PATCH v2 2/2] KVM: arm64: Pin the host vCPU before adjusting
 its PC under pKVM
Message-ID: <aqj2mOjeNWJD6726@google.com>
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
 <20260915070418.3209779-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915070418.3209779-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_004118_612038_A1295D18 
X-CRM114-Status: GOOD (  23.24  )
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

On Tue, Sep 15, 2026 at 08:04:18AM +0100, Fuad Tabba wrote:
> Under pKVM, a page the host shares with EL2 is mapped at EL2 only while
> it's pinned, and the host vCPU is pinned at its first KVM_RUN.
> KVM_SET_VCPU_EVENTS with ext_dabt_pending reaches __kvm_adjust_pc() at
> EL2 before that, and dereferencing the unmapped host vCPU panics the
> hypervisor. Any process holding /dev/kvm on a pKVM host can trigger it.
> 
> Pin the host vCPU around the adjustment when no hyp vCPU is loaded for
> it. A loaded hyp vCPU implies it's pinned. A pin fails only for memory
> the host never shared, and the request is then dropped like any other
> bad host pointer.
> 
> Fixes: efa1368ba9f4b ("KVM: arm64: Commit exceptions from KVM_SET_VCPU_EVENTS immediately")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 9a3b92e626adb..4cb7347db2514 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -542,8 +542,25 @@ static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>  	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> +	struct pkvm_hyp_vcpu *hyp_vcpu;
> +	struct kvm_vcpu *host_vcpu;
>  
> -	__kvm_adjust_pc(kern_hyp_va(vcpu));
> +	host_vcpu = __get_host_hyp_vcpus(vcpu, &hyp_vcpu);
> +	if (host_vcpu) {
> +		__kvm_adjust_pc(host_vcpu);
> +		return;
> +	}
> +
> +	/*
> +	 * With no hyp vCPU loaded for it, the host vCPU may be unpinned,
> +	 * and so unmapped at EL2: its first run pins it.
> +	 */
> +	host_vcpu = kern_hyp_va(vcpu);
> +	if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
> +		return;
> +
> +	__kvm_adjust_pc(host_vcpu);
> +	hyp_unpin_shared_mem(host_vcpu, host_vcpu + 1);
>  }
>  
>  static void handle___kvm_flush_vm_context(struct kvm_cpu_context *host_ctxt)
> -- 
> 2.39.5
>

Reviewed-by: Vincent Donnefort <vdonnefor@google.com>

-- 
Vincent

