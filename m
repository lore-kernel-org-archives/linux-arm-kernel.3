Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104C4CE9D63
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mz1wbrQcnjuO79QSOtWIYJrTAe9ZLjIXP7SQUWoez/I=; b=jZEDQY3SGRRV1tNduhgK3Pxmmb
	dWfobUabk9w+CzwG1y7GAls4Eu8VQk1xZYE0bmrlI3rT9Q6qwp2u639LagiajG+La4pmLgqXmBGss
	rAfo5HIEsRXpOMS6yzgqsWNqxrRjxCPvJt9Xu5xat6zzdtf5Mws2MtbADaVJ3ZMGMMXssfMMYloiS
	zwMfbhs/2ABXxoNr2HE7osWql61iSf0PyqDlB3GOezoxSmWu9KmVVzg8F0VH9ZaxGqbOCxOfM7Dh+
	YqP6/P5wJGA6KihkSxrdXE4iXAaFAKV4qTXZ535JqhT9mguKg8ht2GaEnAswLZd3N5cWBfMNUnEym
	BftQghLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9EF-0000000DQS0-3s89;
	Tue, 06 Jan 2026 15:44:15 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9ED-0000000DQRO-29j6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:44:14 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59b685d2b79so684072e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767714251; x=1768319051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mz1wbrQcnjuO79QSOtWIYJrTAe9ZLjIXP7SQUWoez/I=;
        b=W5NQCZ3zNqG+9GtXh8f9byB3mSQmZQ4TCoo6tzBvAG33WSMPFNfFiPFuo9tRNX3LEl
         ypunMThepTyrRjoau3nL37+KLnt2g+NjBnsJtVY6Arg8QjldKQhDqEQgkYqB1NINs5kM
         gHcaBprz9ww2hHHAf0GyATiYe2nSJ+keeV0xVFrMuONYVjEd9T5suGdmvqC+TysXxmS+
         FyAYLN2fuQ2kKRDr+ZYARUblMquTmn9Qtlav27mr5ry27QK1+5gf73O5VE9tduZ2ZAnT
         +sLkk+Q8IxLkFNlIjEHZrTOQGOxI/DMZzogjLTftlQ3ShV0yJZ48Fon1yDlJZX+whioo
         WgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714251; x=1768319051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mz1wbrQcnjuO79QSOtWIYJrTAe9ZLjIXP7SQUWoez/I=;
        b=bFxbGWJOzaQAiGlTWEn2iSwQcMU+JvZ7TGLpVaLmhbDUIjWfRYfO9udRYvFtpQhatZ
         HDO8VsQmLe2UtDL4SWv8wFyfhzjpVxK/n6pQf17UW4L5JX3Y9oSVvMLCct+pkw7cGFvT
         4sxOLHFcusPKt90xiRZ5NhXU7Z5Gn4voKcKgGWmMT+VAwKTrjzWdEsvt5TOeDA9YcN1t
         gblGIaQis08azrS5H+jiW2RaxSmKOijePaA+RkJffYcdT1L0yzh+Wfo3FmU1MFQsW3XW
         Ene1/f04D3ZQfi0WPuIBI6wKy0Nz57jFFPsIxRsFQuN5t2ZhM5T+P/zgEPph/xdn2rXL
         p/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6EHrTSr+OhhsXn2DtFiFhU4YIRWHe+hIoGResifqXuNA8l/b8MKLR188KzvBvaWGhqade7t1hlfkeBYGi1IPC@lists.infradead.org
X-Gm-Message-State: AOJu0YxPSPSc42h8jVGRQmHUtU5+R7rRkm2PLy9wa7ZyYlbrH83hnndw
	tv5zeHmxnmSUX9UrAknWNk0L3LKKBjVHq55ij7Y7kMV4Js7DhpvR6DdDrsSBRpmNRA==
X-Gm-Gg: AY/fxX6S0yBo+oNI5LwyPWbB6tgO0oTcUu1CiGSeVE3ARql7QFAh1yXVGX9oKmfgbfV
	zok9wSfWc3mj7+lho+dhX41phpaGg3nkABXun4evOlO+MBWU+A31OgxeJbq3GrDJNVYIAdFqwoU
	GSo6VhV6FaErXyhJ8ifzVUx0OaKvdtkg7G4A9Ep9mvmsr+tZGFMEYZlyl5quiZdpxD+lyWzwycY
	ySw67IA6bO/5v5YA8BJBsBqpEvbcQ4BBxHmSGHIalHQotLCS6HJ5gEh9OqVdlSkHk1TXw0eIeNY
	c2cKYMkouRwbFgie/HX4wDd237KWH7SsjlrHvEWZPD267cHDSBHUJge9tfQaFVnZ7WlSSIftFkz
	Inp39BMoy+CaNH9UraRqhqPA0xXvm7VNio2x8KqulxzIvoo7k5ZYY22hzR6mzKyZtO3Q48iL32O
	rewOfq1wqeRGkPBW1/eBy9wL7GljhWT53240BvrIgr1l6oJB25
X-Google-Smtp-Source: AGHT+IGkS9tlwTbYGvATESU7hxY01HF7hmBh1v9elXEG0+a5tz+AGtmUgQ/CHKlyCMpkq2RD6my7zw==
X-Received: by 2002:a05:6512:4010:b0:595:8313:3bce with SMTP id 2adb3069b0e04-59b6520ead1mr1016775e87.5.1767714251076;
        Tue, 06 Jan 2026 07:44:11 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65b89842sm649851e87.0.2026.01.06.07.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:44:10 -0800 (PST)
Date: Tue, 6 Jan 2026 15:44:06 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 20/30] KVM: arm64: Introduce hypercall to force reclaim
 of a protected page
Message-ID: <avfs64mpioh4ckdo3gokndinpjdrgfzz2pjhkyyh65v6spuai3@nz4zih4rbv6m>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-21-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-21-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_074413_586484_3E950267 
X-CRM114-Status: GOOD (  12.25  )
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

> +static int host_stage2_decode_gfn_meta(kvm_pte_t pte, struct pkvm_hyp_vm **vm,
> +				       u64 *gfn)
> +{
> +	pkvm_handle_t handle;
> +	u64 meta;
> +
> +	if (kvm_pte_valid(pte))
> +		return -EINVAL;

Nit:

I can't think of any cases where we'd end up returning -EINVAL here that
isn't indicative of a major problem (e.g taking a stage-2 perm fault we
don't expect) given that we've extensively checked the state of the page
already. Upgrade to WARN()? It's fatal, but the system is unlikely to
make much more progress if we return cleanly anyways, so we might as
well make it obvious where things went wrong.

> +	if (FIELD_GET(KVM_INVALID_PTE_OWNER_MASK, pte) != PKVM_ID_GUEST)
> +		return -EPERM;
> +
> +	meta = FIELD_GET(KVM_INVALID_PTE_EXTRA_MASK, pte);
> +	handle = FIELD_GET(KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK, meta);
> +	*vm = get_vm_by_handle(handle);
> +	if (!*vm) {
> +		/* We probably raced with teardown; try again */
> +		return -EAGAIN;
> +	}
> +
> +	*gfn = FIELD_GET(KVM_HOST_INVALID_PTE_GUEST_GFN_MASK, meta);
> +	return 0;
> +}

