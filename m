Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6E3C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKZFjZR3oGAf3wmW5AspCS7cLC5s5rSIpfT6xlfMbhs=; b=J38XXqmAuY5PGXfuwxpYaIp8FG
	x0y013q5VVPNoegNNiVhhrUwjXBPvxRMaWmQrTVMFh0lsb6o9//UI3JDBBMz1w6DSnulWupOIOz4F
	RooD9g5OSY56xOmguFDtcfptfMY9HdbEt1WdP2JuRlmi41+KAaydqUIBrJggMuqtcobL33Lxg8gKd
	Qu2Xc4S49cK8SIsOZhqTnEu3Z27mdhm3NJgiXZ4tKZX246wb7cySboqlWJ+otLuo244c10oL6HpZ5
	tInmzqSYPzMoO+/TGCYqIhxr6TwTrE9LZngSi5Smp286Fz7FB8o0uxMRsb43WSuvzyTyyXRWCFcc3
	MzmjwEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SJM-0000000Cphz-35TZ;
	Tue, 01 Sep 2026 17:30:16 +0000
Received: from out-11.mta0.migadu.com ([2001:41d0:1004:224b::b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SJI-0000000Cpg4-0tvy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:30:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ULSR5be2YtUyyk60Ms2Rw0/VkY/Y5pS/9BTkgu36FE4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788283808; v=1; x=1788888608;
 b=ZwZ74tGTouA20nrjEmkoi8/II7RNPLtbA0CxNSyuXpVafqmDUISc4mngMrqxaU22VDR1CHuh
 yfR/I/XnVjM+QBhcX5eLguhLiu8SQnlcZzfLKtD04XrlQ1mDZFr2JXvpQC87tJRiIT3vlMFX2J9
 AW7VeFl5z7EE/v4Tbu7bPw+E=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 263de0399fd3ef4f;
	Tue, 01 Sep 2026 17:30:08 +0000
X-Mizu-Trace-ID: 263de0399fd3ef4f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b2a8173142so279e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 10:30:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzYsUyJq2fPq702F3fOv7sISXwLOpVNtPCEInihZNb+nyjFBd/LePI7LP0YEtrxNwo5oIO09YnyuyyPpfH0Gog@lists.infradead.org
X-Gm-Message-State: AFuF++kTSSNB+WgBlL8l93SXBBe3TVYkc/7j2QFZaOTKsYIooVR5WSr7
	g/7pjNfnuqrt3rY7qOVR3hPAuUgBl/NXefKD8it+FAKyF4S7JR9GKC1GP4XovpZOUdQ4XXD1znK
	IkSGaUOtDBBB0ZurAbCOu/obWRuD9KxQFXFP0p/DQ
X-Received: by 2002:a05:6512:158b:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b606b396b9mr6047e87.4.1788283807433; Tue, 01 Sep 2026 10:30:07
 -0700 (PDT)
MIME-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com> <20260901080941.997769-11-vdonnefort@google.com>
In-Reply-To: <20260901080941.997769-11-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 1 Sep 2026 18:30:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw91tzLNXZDoRfty767vxLjao9bADkVD=vyhH64chLyDw@mail.gmail.com>
X-Gm-Features: AcwNN1VxnCRhcWk2F0atM0MG2flGmEqHcqfsD7nDrWqtoce5L066OBj30S3ayJY
Message-ID: <CA+EHjTw91tzLNXZDoRfty767vxLjao9bADkVD=vyhH64chLyDw@mail.gmail.com>
Subject: Re: [PATCH v5 10/18] KVM: arm64: Add a shrinker for pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_103012_392308_BD2EF441 
X-CRM114-Status: GOOD (  21.99  )
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

On Tue, 1 Sept 2026 at 09:10, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Integrate the pKVM memory reclaim interface with the host's memory
> management subsystem.
>
> This allows the host to automatically recover unused memory fom the
> hypervisor's heap allocator when the host is under memory pressure.
>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 366bbd5c854b..976fa65522fe 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -19,6 +19,7 @@
>
>  enum pkvm_topup_id {
>         PKVM_TOPUP_HYP_ALLOC,
> +       NR_PKVM_TOPUP_HYP_IDS,
>         PKVM_TOPUP_HYP_ALLOC_SELFTEST,
>  };
>
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 7821f2592eba..ea96744f41fb 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -133,7 +133,7 @@ static unsigned long __pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long tar
>         return reclaimed;
>  }
>
> -static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
> +static unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
>  {
>         unsigned long reclaimed = 0;
>
> @@ -154,7 +154,7 @@ static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsi
>         return reclaimed;
>  }
>
> -static __maybe_unused unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
> +static unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
>  {
>         return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
>  }
> @@ -360,8 +360,39 @@ void __init pkvm_selftests(void)
>  #endif
>  }
>
> +static unsigned long pkvm_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +       unsigned long reclaimable = 0;
> +       int id;
> +
> +       for (id = 0; id < NR_PKVM_TOPUP_HYP_IDS; id++)
> +               reclaimable += pkvm_hyp_reclaimable(id);
> +
> +       return reclaimable ?: SHRINK_EMPTY;
> +}
> +
> +static unsigned long pkvm_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +       unsigned long reclaimed = 0;
> +       int id;
> +
> +       sc->nr_scanned = 0;
> +
> +       for (id = 0; id < NR_PKVM_TOPUP_HYP_IDS; id++) {
> +               unsigned long r = pkvm_hyp_reclaim(id, sc->nr_to_scan - sc->nr_scanned);
> +
> +               reclaimed += r;
> +               sc->nr_scanned += r;
> +               if (sc->nr_scanned >= sc->nr_to_scan)
> +                       break;
> +       }
> +
> +       return reclaimed ?: SHRINK_STOP;
> +}
> +
>  static int __init finalize_pkvm(void)
>  {
> +       struct shrinker *pkvm_shrinker;
>         int ret;
>
>         if (!is_protected_kvm_enabled() || !is_kvm_arm_initialised())
> @@ -377,10 +408,21 @@ static int __init finalize_pkvm(void)
>         kmemleak_free_part_phys(hyp_mem_base, hyp_mem_size);
>
>         ret = pkvm_drop_host_privileges();
> -       if (ret)
> +       if (ret) {
>                 pr_err("Failed to finalize Hyp protection: %d\n", ret);
> +               return ret;
> +       }
>
> -       return ret;
> +       pkvm_shrinker = shrinker_alloc(0, "pkvm");
> +       if (pkvm_shrinker) {
> +               pkvm_shrinker->count_objects = pkvm_shrinker_count;
> +               pkvm_shrinker->scan_objects = pkvm_shrinker_scan;
> +               shrinker_register(pkvm_shrinker);
> +       } else {
> +               kvm_err("Failed to register shrinker for pKVM\n");
> +       }
> +
> +       return 0;
>  }
>  device_initcall_sync(finalize_pkvm);
>
> --
> 2.55.0.897.gb25b4bd76c-goog
>

