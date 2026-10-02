Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EE9CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyT67JBWmU8a3Diw010Aiq6t7ByqroB1mQnZlP3DzI4=; b=aVoIzKJQsrHY4JP3LMeaPrJeJw
	5ODoYkewR4/rLN7ikBOlu9pkHzKi30FEozcuuwVRwcI4dNqyfTeAppQcL2ANyYnazdeWoWRa5mAmJ
	ktgYBFEaYlzspZlgfv7YLrQ0RBBcFPvQrBSJ97RjIJ6H6s44g0nCNxEEZVvJNK8Ly4F9W75mv7cz1
	IlU56+u/eGkuQtabU583uxEPE5vGqfYMw/o7FmnzDSlbA+mkN0b/zZ6uQYzFXsPuikG6jPQ4c8CiY
	HAUlIKu1URwwZhChqpIAYSgkA66VtXSsHVhYqighdgce0sOlTy0RdhLBvmxEMsH2ql8tquXxitw8G
	nbQLo7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfDx-0000000Bvcf-10gj;
	Fri, 02 Oct 2026 15:31:01 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfDu-0000000Bvc8-1k46
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:30:59 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so7288e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 08:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790955056; cv=none;
        d=google.com; s=arc-20260327;
        b=ULNANYvvmSb90zivWpFis9rsBy13Ros+WCRJ3dsaQSAiJPU49zhnplnFs8kS1DgDdp
         SPien9rPt4/I4WBkY8oncK7F/VsSbu62/0XqyE3E4GlFhSHHw0xtwe3c0Wk1cM2pzQIo
         yS29duz8aUcXdnWXnYNs92kFI7oOrv1mNdbF6/mBt8PmcAirP4mq66/zhdYTfMDSdX3i
         Uf5PsHmnCgob7puH3GKi41fuY2Z+x4lRh7tZAVL+1B4OMUqY90GgmEt31x9nmT6q5qXf
         AK+MzrilonMdjoAErQbEN3sEroxz/y/7BTci121Ms2dNkMMLtQclIFNei4N4gW0waenR
         xVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TyT67JBWmU8a3Diw010Aiq6t7ByqroB1mQnZlP3DzI4=;
        fh=V9yUi+32WYQmvQTknuTHwXZbJE5HFE5g/NJEChnE4XE=;
        b=mczXFRSk97iniztFJoeAUvVtM8+CybQnUfDB3XH1bxftke/658/ROtkwljHUArhixJ
         YfNMGFqX4R3+tC78+IZOk3o9XwcNZsDSOVP+WSkHxQGLlWDigVCuNo9we/iHKKdMoS3y
         O+XNm8NxwooK8CkpQYwAut9uJ+19+WrBqzJsHwW6yRR42BfBPVtBFhA+icN4K3F4zUCa
         jsgpcCFRpevDEnUHuycisEml3PsG0Z1mgWzi0/sdoKgNd6gWQJLjFR09wpB3dQqCmLKC
         +7Slkvj9g915ekYCRqNo4iL92alZ86I+aRX70CnXAW57+U59IUousQioBlgm4YuKfAaB
         Lbig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790955056; x=1791559856; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyT67JBWmU8a3Diw010Aiq6t7ByqroB1mQnZlP3DzI4=;
        b=JvmZaIiRLXxXZAMjyrJv3ttitwIYDo8m/wKKU7jL/hvONMgQ+SlhljY9CLQlqyxgiY
         cftad7xj+rw3K+YQGtB4jM3TjzO+gkeXlxXcEPej1tKHkw/pnQe9CrULE2qYDTkSwgTI
         j7+kM4w5sZwvQrGI0/EPxF1Ns8zWYlglxADKRAImpZKtCZpT++dUeuk+vn1fZ40x2P70
         vrcr9QOiv4OtBoUDcrVyBXYcuqXtE+MGKKPkUqLCzng2kCVwxcwYpzWxQDAF4dl62gqc
         Mvm2sKJkDc0Q4QHDHAFSLOfK02JqZ2e+tL15YycVOVLtJxL974R14WInKqIhBAgyC+tG
         rMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955056; x=1791559856;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TyT67JBWmU8a3Diw010Aiq6t7ByqroB1mQnZlP3DzI4=;
        b=O9PWGhVzKMYyvvfslzumu1PD5iQYQtxDpLBmaFK54C+t19oxDoGfwqsW3TlxBV8GRs
         3zqrNbG/Dh6U8MNpRMPpmGHeCP9AfwWsJxhx3AmhwTAL4pWyFTp6p63JtZ/0uHz9n7zd
         TgVw87ILtQrGw0QQ/D1zfDZNpLZxjrzMFUpqeMSlhMrhF67Wr3GoIX8HDN+rOxfrAy+g
         hat/8zdEwhHQY6N4bcS9dsGpT/XzUNwPuriPxWwWAjmB/T1rpouD34ETIbiJYzRjxiwo
         uVwMDuzFK9mFAvfChHGkNJfgZR4juKALeEo+jeme45bGEEe8P+LKOuBGTnSpxW061x4m
         0rjw==
X-Forwarded-Encrypted: i=1; AKwUvBwdZWKXPbcDDlNufWiMV9QI+fQXeRPUfhD/zQQbSBsF0CUjan65zpekQp+IrfQYJR/geBYrCwvSWEWSQWONNOCm@lists.infradead.org
X-Gm-Message-State: AFq9FYKvtMl9UWg38uKFbbIvuQpQOWNEGpPdtKMFdWNuqBMg5xQCGEsQ
	dT/mwXuMdBM6au0j/R0vCE4O2RTZjygK4HHK+DmaEy5EFARWllUkpwa03GPqP5Tbz4Dnw2m/PCU
	CiMSL0XIKaxvJjnFWjV6os698iGKyQllwj5CuTcoauoc3xu8yVaZYqUz0pYY=
X-Gm-Gg: AYBFou14e4lf+rcfi6uGBdUS+mRclAmgmVqFPvVtBlYEh42j1NjcH8mrShOszT8yFe0
	9Z22R1GXhLDUVUfWhl6eAGfR9ckItaViTfZ91QzaenPlkgXLDiZJMwS3xWZwomORFY3Yd7xlDXp
	W3TNnszr+ladpk8n+9CxyxRwd332vvV+oYD0Pz/qxRV0EbYb8k2ZlL1oJ/RTP0XBfr4IeJbWLCc
	i2Nsu8NYatDEUmJ+STGgmRtQLpmP8Tw+JczbJr7IcCLktsQ0ECFqvbPo3CWIU8kdGHHGDLQJtEu
	yoYWh8B0LbnEZpdqCT5D+fuRi5avRaYat7AXFsh8CgWTPXCWHtxHMTw+VywgzR5lHE+m75tijsw
	oy7oIszaLVliKgiah9fp19NTF
X-Received: by 2002:a05:6512:3b26:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5bb7c91a8a0mr183008e87.2.1790955055657; Fri, 02 Oct 2026
 08:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com> <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org> <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
 <86pkxs2npx.wl-maz@kernel.org> <CA+EHjTy4rb+6z0bqh7sPqACES0EDpURdeoyiFGmdw3p0PENcOQ@mail.gmail.com>
 <86o6dc2ka1.wl-maz@kernel.org>
In-Reply-To: <86o6dc2ka1.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 16:30:19 +0100
X-Gm-Features: AclHuK-WxuFGXDBt-i8aW4clYrHg0y_cefCod2ajVZ-nmk2Rl2Vmyq6bDATGZwQ
Message-ID: <CA+EHjTy9wTbjFpgvDOX9Xexw4jpx4uHMHM9ckXYZw8H0_QbAvQ@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083058_597583_16D8A4DD 
X-CRM114-Status: GOOD (  14.77  )
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

On Fri, 2 Oct 2026 at 16:29, Marc Zyngier <maz@kernel.org> wrote:
...
> > I know this is a sketch, but just in case: that's inverted. The sync
> > only applies to non-protected pKVM VMs (EL2 ignores it for protected
> > ones), so it would be != VM_PKVM.
>
> See what I meant about this stuff being completely intractable? I
> still have no idea what it means! ;-)

Yeah... what is a `!= VM_PKVM` ?!

:D
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

