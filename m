Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0601CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku/eYwMs4k9RlMYyzo8Mity0phIggrCvFlztJoPxNag=; b=GRtBl468JedjgBgxJhzTqkigdA
	/3m5xsx8F2lgbLD+iXasg3D8QuKdl8amp4FpYNikK5bIxpL1rCTu4LbNfyPBqGglEKkJMlm+9BFpu
	QlbvpCC+u4cIMhUaLBdIhPGgYJnC0l0e8PMa89gc/fMyjvsWnU+guJxLwkzQGrVkCfptR19AawaA/
	Yv2be8a/iaQthv89wq7lgaGtVS5YbxtpROkWCWfaZnutWIr49PH2kaX9ymGdM6+qIVBjjGS9fpk06
	cFZX4uH18O3AaM5eZc7RF24jNLHBjBGvyZIc8PVbkkEhIEUY3hiNu22lZqNnKx6LC0F0R2g9UKYMx
	+kA4Pxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQYM-0000000FYar-2bUy;
	Tue, 16 Jun 2026 09:57:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQYJ-0000000FYZh-2LJS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 09:57:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490bd64ca95so42115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 02:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781603869; x=1782208669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ku/eYwMs4k9RlMYyzo8Mity0phIggrCvFlztJoPxNag=;
        b=pT6VKemV73+S4fRAvR/oGE3ceD88zJ2PtfXaRcbEi2F1IJbjvKxlXmnqaPzu1daVaV
         3KnK5qiKW/ZdfV1LSOOmn/IBQ72+tWZ0AE+BJUxFdoHgyDsafW3WYOmvFnnYYLzr1c/3
         eGqs4TVWOpOCcjpW/soxU95xFef95Eo4ig5hKZ+3MCecavrLdFATubeHQ1fkKDn6/WnC
         bUEupV4qPN9BW9kUVldWoMq3FnBkbHEc3GCnOSNZp13weCzpSwZlcaC+nFSy0YQtSXX+
         XozCGIQRq3catebY7z8h/3KCBLnxBGQwp2UsLiMfvPOXvFq71SgucJ2/HVeSaJCRgXfo
         3PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603869; x=1782208669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku/eYwMs4k9RlMYyzo8Mity0phIggrCvFlztJoPxNag=;
        b=EDGBVF21qHTUrM0RL0hkj7QOAIWBvuVssolP4kB5AcgrMs0ZPfcXgfS+hpghhBjQ/I
         7Ws+fUKJTzi2D4L51ue/NXTul2+YtV6bNI9AGAERsREE0tX3ipceAcuJt7kLwsn9rbBF
         JG9bJp3innndHaHybZGVryrnR1gB15WLlijmOSkF9qP/Lw5y0OGmL1tbPRAj2xuw5ItF
         ueIFdcW3W1a7R6l+X6oIg8az6JOHUTMWdgkqU95fwh7AapAYpVAv/NKb7rPKpDv+DFil
         gxGPczg2qRcowzd/wt0w+oqLb8j1oy3hS4u6EmhV+vJi0gg+0uMJnnkfTe0aH72nHFoi
         znBw==
X-Forwarded-Encrypted: i=1; AFNElJ8bl8xkrWBSU5LkhrrdTNExUdtDrC7fp6XPBf4iXNHw4bOEo1u/XWJOaSKNgoGWYEteHJXBrdrD69LtbJT8rP3A@lists.infradead.org
X-Gm-Message-State: AOJu0YwnqojcMgVJ0FEa0o123UgWbeqU7t1xe4BrYKNDghcJOLg2H1qT
	tkBBgc34hjl1AiUKdrm/TABdNNsBOClZGdkz0ppKKv3cEdwNcKD7eKbpa+NuN9tWiA==
X-Gm-Gg: Acq92OEyspYINZ3S1g5strxcb3gL8e4+eyfcOCvZOoCDFiQR9ZN7XoJVr8xDMCTSR91
	V7o0HSJf4FCrmkjYl7y1sk1oHGsYd+OtOIibiYi928oom64sRBThhGHVueAc5UD/EIV0ysHIYTf
	5eYQ380QoDeRgW4soGYCNhZ23LbfcQaVOR34AybMBhF6YpBYULDXn7tcUEKyuui6frQL1nbEObM
	XhhGcZ1ea2I6kyCUPagmAWJJsWULLeg0FYxeV/tc63ySXWP97K8/P4NPLx+2b2v6+eNAasj92rZ
	/OC2NjQWtiexN9tgvSmGF690QwABRP7kdN2vtrPnyRHJHger8UdPgKqPHwLwU3Vr16THyVJKfs1
	nlIBKMpjIei3y1pYbk4w9KBq1oB876AdtzJOp4tL7OyoQi7rgAxFLM/Ylacymmup1UPR9q17iYN
	QtiVCL19rg+etllUtbJWYBlovWTmp0+QcgzODKwRMHuPNwAHy3iZavAJACFxm8WlK8b07X+A==
X-Received: by 2002:a05:600c:68d9:b0:48f:d634:b18d with SMTP id 5b1f17b1804b1-4922ffc8997mr784545e9.8.1781603868080;
        Tue, 16 Jun 2026 02:57:48 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c473bsm47034584f8f.28.2026.06.16.02.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:57:47 -0700 (PDT)
Date: Tue, 16 Jun 2026 09:57:43 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to
 TrustZone
Message-ID: <ajEeFxNilwaC9hQg@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <aikt44sVnpL3_dYi@google.com>
 <aik5MtvOlnQDmzjr@willie-the-truck>
 <ailVcN-bxY30-XBF@google.com>
 <ailXKA1VG8vyKNfV@willie-the-truck>
 <ailtCAcEaJIgZ5Ap@google.com>
 <ai50fgNHGUqz0muP@willie-the-truck>
 <ai-tO-sSNGp7mjAU@google.com>
 <ai_KQTJj4n1dZS6F@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_KQTJj4n1dZS6F@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_025751_634991_3983371A 
X-CRM114-Status: GOOD (  23.70  )
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

On Mon, Jun 15, 2026 at 10:47:45AM +0100, Will Deacon wrote:
> On Mon, Jun 15, 2026 at 07:43:55AM +0000, Sebastian Ene wrote:
> > On Sun, Jun 14, 2026 at 10:29:34AM +0100, Will Deacon wrote:
> > > Yes, that part now seems to be missing.
> > 
> > I am a bit worried to apply for all of them the check from the relayer
> > (ffa_check_unused_args_sbz) because of how it's written in the spec in
> > (11.2 Reserved parameter convention). To be more specific, there is no
> > mention of what the relayer is expected to do here (which is what hyp
> > does). It says 2 things:
> > 1. the caller (in this case the host driver) is expected to zero out
> > unused args
> > 2. the callee (Trustzone) ignores the values in these registers.
> > 
> > If we enforce SBZ in the relayer but (1) doesn't comply with it, we will
> > introduce a regression. I left it on purpose without enforcing
> > ffa_check_unused_args_sbz for the others.
> 
> I think that's ok -- if the caller isn't passing zeroes when it should,
> then it's already on borrowed (no pun intended!) time and it will need
> to be fixed.

Ok, thanks for the confirmation. Will include this and then spin a new
version of the patches.

> 
> Will

Thanks,
Sebastian

