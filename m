Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3A1E83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fex5v7o8CPkY7hhbst5vKC6sK9Ovg5CdBS9vwalDDZM=; b=MS0XVJoP1I9RP7NdrvA7YE34+T
	phoFLO3nHwVezsGtxdU3P6LT9dzOHkbPlLA1Y6nmEdhDkABkya2uFtEhC9tAVW18e61eyxaYH7Y8z
	dBsehNZ1EmtQLda88AyjM7KaNnJxZAgxaBB6YZGcDJzOpcT8Qj3va4OYfSre+NIvgvHuLmb7eyx2Q
	WLdSl2WIh3HVmwIKMNKFtoLESGbEAzZ84ehPMOUzVeQG+UG1KR2rHubhEV4Wu5HPtKCDMTWhv0E0n
	1Q3tNIUB3rz0NXg530DgxunNmW9o/E3Ewgg68TIsKKF8pWCAYNK2uVtzFX8mvkItx96z+vzrqxMP7
	uPgTNp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCuj-00000006OhY-2BNg;
	Tue, 03 Feb 2026 09:41:41 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCug-00000006OgW-36Iy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:41:40 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5014b5d8551so275081cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770111697; cv=none;
        d=google.com; s=arc-20240605;
        b=HDGF7+xNdptqrFkUZXAqDMxihUmfT7QoTkoWQKG8Va5CFQlfVvReM7HRyAoaOzZXst
         R2uysja4ZP18pY4RrXZXjjEzW8odTuDaSbsSSUPZkroCWUjpClrraILSeHXuzb4LDRNE
         WSJhtC1WWsQTeUXbwAAiFvrXAS9HFLYKOAa4VuidPLQje9cW07EVxf7v4tIyZGSN5lbS
         QFQ+9ebP6kZGCQzGh0I0cHN8p2Lz1M9VYincwiDUjk9jSmutKSGIrU/M9C0LZ/W7HGSd
         irzkR8Ir3/qXbTM3FDSO0nLcmIfWgXRMrNcnzMbF9i6R8p+KTlaTvo6Mjc4+n+/jwusg
         IAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Fex5v7o8CPkY7hhbst5vKC6sK9Ovg5CdBS9vwalDDZM=;
        fh=OaW8tWDPsPsrLhjrrp32kkoirRdbZKD4tLZaoES4BTU=;
        b=hnfebawLf0ZJNMyTHrXQpqQpgxS4RAeJj0zsDMGcm9fKWO6Vc8nwNL9W/XfPbls5eS
         W38R2Ywos72Rwb8k8velsVHGJbgT144gU6d6GP3iiL8RN4lauLaWSINk3gDdDZrEkncl
         1q0mW8qsLPSWTginiCtClebzs0p0J8vYpG5RQ5WQNetqmP40psNGYgsnbTjzUllqS9zd
         9ClSPwBR/J0fkZRks0cfMJpWHm/f8MG+x6LtpQM6b+lkPxdNULc80QmaJhCWo+c7qKqx
         ROECmGl7osR7Y/o2t/OMa/qBXftTipOwFVO77JYfb09XUrdffdKfHjXbdZA9rkLflPhT
         i1fQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770111697; x=1770716497; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fex5v7o8CPkY7hhbst5vKC6sK9Ovg5CdBS9vwalDDZM=;
        b=eCN22F0enbFkkOOhDvXmeloyj6vK3bc0h6YtQxYQ7qUL7Wa+HpJDQEYCpKfbpZbvSO
         HTwxQqdVIakM6D6dMSsdNqOr4wev3NwLa1QL2XgbYmjPiu/uZaR5mJhTxQwEAczYk4db
         QkqzMzZkTtPVmvR+yMByAknZRK017MnzEd0mAynMQtS6rUSxahQetrkgXNYtXEXu23Ib
         0nH5ndF0hCCRj9uAiNC4Xx28DaX49r4uuGVY1lt0LsI6/nKPuNlU0Lu2qgXXVeCtoAx3
         IZqb//olFF7yXsXMuiDr8i9YMnZbSKRXyZ1WuLynvpfww4Ry24xW3S6C2UOdUD+wWUV5
         JHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111697; x=1770716497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fex5v7o8CPkY7hhbst5vKC6sK9Ovg5CdBS9vwalDDZM=;
        b=HGwCV0cjdG5WrowAsJ/SVWFT1KgszbRrwcqTM1AX+NVUBVDZJOhZV2vxUKh7LaysJ8
         bLaPHhSi/g93BICldJ7h5O+cBrUaiWCRHrL1+uZ7R04uqTdFXiHYckevnW4/2o1MC+iA
         AzQimp3VHFeJN5V/oSbLz51kLJmdckF8Fo3Kf1OQFEWo5Tf68bF3CkZh1eQG9uoN7/A2
         PjxIx5er/vshK082lXSe1tzzawnhiEirb373YxyVOWl9dRlv9sbgaib+6LOTHMfeUxwU
         fs0ffXcR/Unbk7cVtghxiNA0V+queC4UMM/uBvfegHJl+Q7j0eXlvmDz/vc2sQ2ZY60G
         UX5A==
X-Forwarded-Encrypted: i=1; AJvYcCWRKtlqdYZP2HgOb2qt6vcvA25jElTmaz0xECl4COxPo7x0dI6FgGaf8rG6XeD+j77XVVN/4ubLZpm9nATMSoMo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5HaBJtwV0qiGsvwEwEc/eAR/5mzBodLwUSbn9+m0G/t1PwQZt
	dx4hNVXtJGAJhfnW9lyXTPf/9FUw2iZh7wo74qt3vC1VMCaJORJ889GYtgvA1BvYmzAFki2Mlbu
	9vD+z3mM5CRYfqL5vwmY0bQFl9U6bairNrckQeDVH
X-Gm-Gg: AZuq6aKPcjLhA3NMVhNhOjmOXILSgK8G65TU/u7DH9FJRTKuGT7IzGJNBLK4r01TAzD
	x3BSuq/Ci6pOTZjACVskk6/XbOva9nvhuKEVqZhesR2ugW3UwIDsL1Ox5Uf74FF312+TG2QOMxw
	O7Pjkg31/MyQO4lDs/fPXEKhwc/aNmHtP1HMPJBUzYG2saCj1DIx8GoMzq4xS31oPhoMh5sp8po
	KYCcyPe5ZP/2OIbki+/dbIRZTIuLPHqZPR/huNvvd/e21zWsDFuXw6SpOjwxnVpLPJrADH7uJW7
	OxrVl572D6NxjCbNs6qGPZuZ+g==
X-Received: by 2002:a05:622a:610:b0:4ff:cb25:998b with SMTP id
 d75a77b69052e-5060f0d0fc2mr4910981cf.12.1770111697142; Tue, 03 Feb 2026
 01:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20260202184329.2724080-1-maz@kernel.org>
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 3 Feb 2026 09:41:00 +0000
X-Gm-Features: AZwV_QjqZ1UnCxkfe67UIBzq-4b3eaUyZq-nxMFFw9q75AKQJgz1vWaiA_7G-bc
Message-ID: <CA+EHjTzyiOFyy+Zf-2Zxd8W3vap=88xjLUF7bA4OWZOGTDOR4w@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] KVM: arm64: Generalise RESx handling
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_014138_788569_B4590501 
X-CRM114-Status: GOOD (  22.53  )
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

For the series:
Tested-by: Fuad Tabba <tabba@google.com>

Thanks!
/fuad

On Mon, 2 Feb 2026 at 18:43, Marc Zyngier <maz@kernel.org> wrote:
>
> Having spent some time dealing with some dark corners of the
> architecture, I have realised that our RESx handling is a bit patchy.
> Specially when it comes to RES1 bits, which are not clearly defined in
> config.c, and rely on band-aids such as FIXED_VALUE.
>
> This series takes the excuse of adding SCTLR_EL2 sanitisation to bite
> the bullet and pursue several goals:
>
> - clearly define bits that are RES1 when a feature is absent
>
> - have a unified data structure to manage both RES0 and RES1 bits
>
> - deal with the annoying complexity of some features being
>   conditioned on E2H==1
>
> - allow a single bit to take different RESx values depending on the
>   value of E2H
>
> This allows quite a bit of cleanup, including the total removal of the
> FIXED_VALUE horror, which was always a bizarre construct. We also get
> a new debugfs file to introspect the RESx settings for a given guest.
>
> Overall, this lowers the complexity of expressing the configuration
> constraints, for very little code (most of the extra lines are
> introduced by the debugfs stuff, and SCTLR_EL2 being added to the
> sysreg file).
>
> Patches on top of my kvm-arm64/vtcr branch (which is currently
> simmering in -next).
>
> * From v1 [1]
>
>   - Simplified RES0 handling by dropping the RES0_WHEN_E2Hx macros
>
>   - Cleaned up the kvm_{g,s}et_sysreg_resx() helpers
>
>   - Simplified dynamic RESx handling
>
>   - New improved debugfs handling, thanks to Fuad!
>
>   - Various clean-ups and spelling fixes
>
>   - Collected RBs (thanks Fuad and Joey!)
>
> [1] https://lore.kernel.org/all/20260126121655.1641736-1-maz@kernel.org
> Marc Zyngier (20):
>   arm64: Convert SCTLR_EL2 to sysreg infrastructure
>   KVM: arm64: Remove duplicate configuration for SCTLR_EL1.{EE,E0E}
>   KVM: arm64: Introduce standalone FGU computing primitive
>   KVM: arm64: Introduce data structure tracking both RES0 and RES1 bits
>   KVM: arm64: Extend unified RESx handling to runtime sanitisation
>   KVM: arm64: Inherit RESx bits from FGT register descriptors
>   KVM: arm64: Allow RES1 bits to be inferred from configuration
>   KVM: arm64: Correctly handle SCTLR_EL1 RES1 bits for unsupported
>     features
>   KVM: arm64: Convert HCR_EL2.RW to AS_RES1
>   KVM: arm64: Simplify FIXED_VALUE handling
>   KVM: arm64: Add REQUIRES_E2H1 constraint as configuration flags
>   KVM: arm64: Add RES1_WHEN_E2Hx constraints as configuration flags
>   KVM: arm64: Move RESx into individual register descriptors
>   KVM: arm64: Simplify handling of HCR_EL2.E2H RESx
>   KVM: arm64: Get rid of FIXED_VALUE altogether
>   KVM: arm64: Simplify handling of full register invalid constraint
>   KVM: arm64: Remove all traces of FEAT_TME
>   KVM: arm64: Remove all traces of HCR_EL2.MIOCNCE
>   KVM: arm64: Add sanitisation to SCTLR_EL2
>   KVM: arm64: Add debugfs file dumping computed RESx values
>
>  arch/arm64/include/asm/kvm_host.h             |  38 +-
>  arch/arm64/include/asm/sysreg.h               |   7 -
>  arch/arm64/kvm/config.c                       | 427 ++++++++++--------
>  arch/arm64/kvm/emulate-nested.c               |  10 +-
>  arch/arm64/kvm/nested.c                       | 151 +++----
>  arch/arm64/kvm/sys_regs.c                     |  68 +++
>  arch/arm64/tools/sysreg                       |  82 +++-
>  tools/arch/arm64/include/asm/sysreg.h         |   6 -
>  tools/perf/Documentation/perf-arm-spe.txt     |   1 -
>  .../testing/selftests/kvm/arm64/set_id_regs.c |   1 -
>  10 files changed, 478 insertions(+), 313 deletions(-)
>
> --
> 2.47.3
>

