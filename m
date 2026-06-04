Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7133BCD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 22:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0t+VBqFHEPHbmxYITXwen7bG3EAMYQHm1cDflplkJjE=; b=ik6Q7xq9ZxBXuN+NQn7ZVwqfh3
	bo+YgxOf3mjDo+NErJmCvGGUQp+EBWef78kWu4UoVHLKWoU5A2B0xe6XE8DaNE6tjwa+ug+z/1r4I
	RH7v8CYONcxpab0Dnvnh6KogQjbeAwnQ+O0sGAps5mEaC9gFGS4JBFtkqX0+W43NwRK9iXK042ggH
	pHuW/hFa3CXfcsT/5up75BeRV7SyFJPFro/01Vr7VYnlTS0Ee/xFKoUAw6Qq6G1ScLJc5vUc1+2EC
	WjCl9qdspDS+qcUMNUkIeRTD15XjR2c+1KFyMRHz8IB9EcJyAebbcZqAPzOGwiiVKtfm9u/KXyBsn
	cjq8DELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVH1U-0000000HQMh-3Fcs;
	Thu, 04 Jun 2026 22:58:48 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVH1S-0000000HQMN-0QF4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 22:58:47 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c8604fbe71eso577358a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 15:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780613924; x=1781218724; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0t+VBqFHEPHbmxYITXwen7bG3EAMYQHm1cDflplkJjE=;
        b=bWI9uZhpsiCGvedgd/reF3M3xwlO0Xwg5IeFNEcSRjEkFsQ3mLEiTC8hNPmYax37n1
         gq8F+mUg9Ajh3jv9d+svgrBXU13RtWBFA1qkzgY1+SCNVjYIXFEADDinCq376594yPqp
         h+JUZRe3dpBOKjoxyXKWYus/svpT7fFkBt3L9P4ocb8Debb4VcSrWrvGWaYwrNXAPrVu
         XGjRWWkQm04uMtAqv/60MSRfRA9ZdQPTPx83vQqGEmJzMjx5uW0fzPc2LoG43kTnbpUh
         oZBeTpbPGcdJW6308aJabdzfqORrlsHm0Pk9/SFGp45JR5noIis7fXqeGTjzyTl1Ti8o
         xJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780613924; x=1781218724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0t+VBqFHEPHbmxYITXwen7bG3EAMYQHm1cDflplkJjE=;
        b=bow+F1tQXeTitekFLDdevi7/uH50FOJH9oWfiFQRgwdDeaZsCkZrWeJnAdkLMbp/uK
         HUD5v5jjRcrZcOBGSlrJJCrEMK+4AdR6ROsUDyTZXXWcWHZrVwbSrxVMe2OmeCCrltWT
         WnTOrg/GNVddygQksnkWy9Ht1ez3ifl5nStMIDBbrqI3fxW0oz/CR9ovKcLNNAfq23Xz
         KS0DnSN458q71wYp1qbx8VdBuihBBXQC055WUz66CmNiyjG2osPRsd7CCIW5G2JDq1Nn
         uLqT9IwyATFe1p6q3yU7qLVO2OsHyS6FLtfrrchv3CQfviqpS5Ri6J0zU8z3PTJ31e+y
         tN9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8S8MC9HVJd922ZdjwRWREpKem4wvOSw5NV/Am03AHrPAESedmvTwSsXsAT5NzPNlIrmRGA/bE+FX49t/vLmwbd@lists.infradead.org
X-Gm-Message-State: AOJu0YwAPJhfMzopfts1MBSZmJj0CP3/CEklcmKDJjOX/FnYjzUYQzAh
	8cfYxX2lXIvSVoSWwTRyePcbH7n+3KBMwBYu9cxeUvYuiXYOXqFasaGm+7tUs/uok/Z+4DVkk+V
	5jz0HdA==
X-Received: from pgbfq7.prod.google.com ([2002:a05:6a02:2987:b0:c85:69da:2c03])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a07:b0:3b4:85db:1bdb
 with SMTP id adf61e73a8af0-3b4cd0801bfmr1026910637.44.1780613923842; Thu, 04
 Jun 2026 15:58:43 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:58:43 -0700
In-Reply-To: <aiH7xKnprU9bUap5@kernel.org>
Mime-Version: 1.0
References: <aiHEKOeZMVwsRlvP@v4bel> <aiH7xKnprU9bUap5@kernel.org>
Message-ID: <aiIDIwgaFWAE-zEG@google.com>
Subject: Re: [PATCH] KVM: arm64: Reallocate the nested_mmus array under the mmu_lock
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, maz@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, christoffer.dall@arm.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_155846_138264_FBE9888D 
X-CRM114-Status: UNSURE (   7.20  )
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

On Thu, Jun 04, 2026, Oliver Upton wrote:
> The shortlog is very confusing, since "allocate behind $LOCK" is usually
> something alarming. Maybe instead:
> 
>   KVM: arm64: Reassign nested_mmus array behind mmu_lock

+1 from the peanut gallery.  After reading the shortlog, I was about to grab my
pitchfork :-)

