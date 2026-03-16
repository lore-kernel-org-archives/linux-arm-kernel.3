Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354AEF53D96
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbszYKJSUQZ+CFv0gEYGu37cZ2puJInffZF8dV4znTc=; b=3OMM1wt1KH8+CBbXVntdMGFeHh
	m5TGv0eV9x4zGd9vkBmlmvgRLpRroryqN7QD0XdcDxAhlUZJi6Q4xny2quaFF1vGd2WVvLTmeqAgM
	F8D6kaDntq2KL/TYg5G4jJaO6wvN4dgT+8JVxNmNz1pBeJK3Zo5tpOuUFabfD8v54O582yPRuMvXU
	0jJhC1oOYJRfj4Vp9KCsbH/OH73X6o7VVdpUlLZ2GCbWchfXjK8FZb6atVrxm0oVSMiZq369CUldK
	x0eeW+gXcRU0EPo281van9KQrKqNEJtZen+gPe2lpV521bHZkWMUnQcNMnauaSjU05h6mrH8LIGNZ
	PXqmN22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EWp-00000004oIJ-1Ogs;
	Mon, 16 Mar 2026 20:27:07 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EWm-00000004oHv-3Q28
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:27:06 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-50906a98ffeso171911cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773692823; cv=none;
        d=google.com; s=arc-20240605;
        b=jGld3quchZJas7vWXs7IrrcSPMyV84bg+YFZcu7lJ8Z9Xc81xm77ZjnXfBLojOgBAK
         7iw8nfIK0Ae/x4oond/15gsQIRmZN6mnOsDtlEuLvH6kArm3iHPrkIylkVD0McFzCtiF
         06FDV83nAf4CTJ1W+ekFVrEA+cuJL+eL9jSYK5Dvy91QhOfyjSxk00ZcW53dmJjR5Ysd
         Vu/DkmRdYONqCiz21o9P7LZDy9XoS9kcBvZ19ZAm/L7S070oEM+T4mkDakMmP0CMbjcg
         7SYuSC//e5jb8yv9crNEQacag27YvxJNwyDNTsQZVcwy2FtOufffn8qFYUoAkFQk/Kwr
         IFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TbszYKJSUQZ+CFv0gEYGu37cZ2puJInffZF8dV4znTc=;
        fh=zA+OmgRdgHqua+6eB1E1X1frO334RBVQmlxD/xVj+vU=;
        b=PAjjyHCPgbE9jZkCK1g0bDhXw0zJ7EZ4dJAVt0cOelJEPV2BN5gCiH90oQLJqfOb2J
         N9zPTmqnYrN3WZFZ8CmAcEqihKv87VCbublMTJCzH9uxiUA8JYm3hps7GK0uh21smswG
         SDTWFtETkAbl5cazvLixlWi5NOjXhatcvEg8WgnvRnUcggg+yi+TUMyupbcD4ocxDhcX
         yyF6yTMHc3rOycn+h6AhMQT7R7ifHYxdBhUrLHHuyGAaU6G+dZzW04WkAj2J6oW1qita
         k8CFgzRXzB6W2SgZGf8WD45gfETObsl/8SogYjxl9U5/2g5WZP/YXf3vv8KBSoDM3lFZ
         MmTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773692823; x=1774297623; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbszYKJSUQZ+CFv0gEYGu37cZ2puJInffZF8dV4znTc=;
        b=ttqDzJRPK14yeC6bEmuo+mpgY8qoDyOKMZlfSvIYI55D7f+5h3rFhq4sqEJmY/Y+i/
         MYtgfbhfoQ1WuBsCmS+V37I/4Vm/ISH3qp/eLQsShPUWSIf/ovrToVZ8kwxRx84leIFa
         5bfilQrbTnsivX0khWsTXCuim2nLJnpFE0tZscUfp/lFcfBArwWyGomqm25NRAd8lfrJ
         pZRVxyDcEgCRzf6tApfkasu8ryj0/D/qlqdAf3x85RsZEgePXTr57Ych90nHTIxB9WEe
         hNt+eKhpAjuF8tljKd9Gyq4z+lWpRb/ECFWEP3ofZLnbliKmOnRkChwquHlStc4cw6Jc
         OSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773692823; x=1774297623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbszYKJSUQZ+CFv0gEYGu37cZ2puJInffZF8dV4znTc=;
        b=jEm4qAP4/ycdyjZan2aMbIX75rGV7kaTbfv4QXfDjHVYY0wNUITQkRbQu9mYavrWyk
         JtXEMk+QhYG2/1pji4RonaWCGTGWTy3F2ilupC2fviybcMRV4w5IiGfMfOoCEZXLdPxP
         gntqCX5+yB5QgZ/LGj4aXfp8tIAS4yfui0X0a9G4U6nvixEQGn3LcMMeImqs3Bh8+aq/
         oD0hzotoZomDlH3ucJx3XdLwbCG1fVXSPoii5rl3gBxOFPgeobH8a3ea/xEfwEpP0Omu
         tSsQwddzYGyzwTM/X66OAyXMMKkk+WLUT4B2dveyZ6Rq6YDpdRfQ+NangDIN2rw7wluR
         ljUw==
X-Forwarded-Encrypted: i=1; AJvYcCWbfj/FA/cc9J03BUPBe/FXbrP1DNapgmxIvOlYjfMNERRgXCyonWD1e9HUs6vRIbyrNGQWNfWUgBQMwcthqphb@lists.infradead.org
X-Gm-Message-State: AOJu0YxMECOU3Py3LdJjZROG9IuiiskPGSIhjK/gH+yoClqZJmtkbqo6
	nQr0HxsSyDKz86Nmfe3RNCh/LZk74mCTly0tCS5jh/KzsbknA+CYT40SPkRXmnxoIfKS8hgIx1d
	1golvWWYWiPNuX6he8jRcxDNUsLhJ5Qkn9Pw2Gxg0MHKd7hZfV2ZiHG3YRHw=
X-Gm-Gg: ATEYQzwpexjt7ZwnaGEmwbXjw9d29lMV2hPhWsy8TnSuoz0qlvy2ZoWxaiNJEjPTra/
	ewQiVLCyUsYuLCMPhu1Uns4X0P08MX/NwRhEkIzEXaJruDeflMODdzzUn27euFtbI4aonPkrL25
	Wt84eXxGCIurz+XYw9W7XDvPQxf9V9d8GRr1enSS6SszKF1WSAIWTRnfFVu2rAFrwTDwu6pvBQ/
	6abtcAnRq71O0eJeZ4fkm29w6buflRfGfWRqKoN1jxZN8eLt5tBJmQRu6ldb8HZ7Y4qtmLWdXgO
	/r4bgoxq
X-Received: by 2002:a05:622a:10:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-5099ac7560bmr742881cf.3.1773692823019; Mon, 16 Mar 2026
 13:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-1-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 16 Mar 2026 20:26:25 +0000
X-Gm-Features: AaiRm510Pj5izIGMuhDvumE4HdikBCeLOgGx-bwidhVdMD7QfZGqbR37I1-sWLI
Message-ID: <CA+EHjTyBtM5idopKisJf_e10aRifubtKEpbkjkEnmrOqa9-SPw@mail.gmail.com>
Subject: Re: [PATCH 00/17] KVM: arm64: More user_mem_abort() rework
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_132704_867763_68D0CED3 
X-CRM114-Status: GOOD (  17.64  )
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

Hi Marc,

On Mon, 16 Mar 2026 at 17:55, Marc Zyngier <maz@kernel.org> wrote:
>
> Piqued by Fuad's initial set of patches[1] splitting user_mem_abort()
> into more "edible" functions, I've added my on take on top of it with
> a few goals in mind:
>
> - contextualise the state by splitting kvm_s2_fault into more granular
>   structures
>
> - reduce the amount of state that is visible and/or mutable by any
>   single function
>
> - reduce the number of variable that simply cache state that is
>   already implicitly available (and often only a helper away)
>
> I find the result reasonably attractive, and throwing it at a couple
> of machines didn't result in anything out of the ordinary.
>
> For those interested, I have stashed a branch at [2], and I'd
> appreciate some feedback on the outcome.
>
> [1] https://lore.kernel.org/all/20260306140232.2193802-1-tabba@google.com/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=hack/user_mem_abort-rework

The series in hack/user_mem_abort-rework is different from this one.
Here are the first few patches:

7243471061be KVM: arm64: Extract VMA size resolution in user_mem_abort()
3a8557ce6025 KVM: arm64: Introduce struct kvm_s2_fault to user_mem_abort()
9f3c0a14bbcb KVM: arm64: Extract PFN resolution in user_mem_abort()
98740dc5cf2b KVM: arm64: Isolate mmap_read_lock inside new
kvm_s2_fault_get_vma_info() helper
ea364906b626 KVM: arm64: Extract stage-2 permission logic in user_mem_abort()

The first patch here doesn't appear until quite later.

Cheers,
/fuad

>
> Marc Zyngier (17):
>   KVM: arm64: Kill fault->ipa
>   KVM: arm64: Make fault_ipa immutable
>   KVM: arm64: Move fault context to const structure
>   KVM: arm64: Replace fault_is_perm with a helper
>   KVM: arm64: Constrain fault_granule to kvm_s2_fault_map()
>   KVM: arm64: Kill write_fault from kvm_s2_fault
>   KVM: arm64: Kill exec_fault from kvm_s2_fault
>   KVM: arm64: Kill topup_memcache from kvm_s2_fault
>   KVM: arm64: Move VMA-related information to kvm_s2_fault_vma_info
>   KVM: arm64: Kill logging_active from kvm_s2_fault
>   KVM: arm64: Restrict the scope of the 'writable' attribute
>   KVM: arm64: Move kvm_s2_fault.{pfn,page} to kvm_s2_vma_info
>   KVM: arm64: Replace force_pte with a max_map_size attribute
>   KVM: arm64: Move device mapping management into kvm_s2_fault_pin_pfn()
>   KVM: arm64: Directly expose mapping prot and kill kvm_s2_fault
>   KVM: arm64: Simplify integration of adjust_nested_*_perms()
>   KVM: arm64: Convert gmem_abort() to struct kvm_s2_fault_desc
>
>  arch/arm64/kvm/mmu.c | 428 ++++++++++++++++++++++---------------------
>  1 file changed, 223 insertions(+), 205 deletions(-)
>
> --
> 2.47.3
>

