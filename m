Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D892C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2q90HEwNHGnz4Upnp0RKX2HlMlf/DYcXUBx0PZgzyaI=; b=zVzxhFcXojdprKW9ceuEwrMK1s
	15mx4YBoHveGNWDWk8IjRXKjMJQPYizt47KoOp64XMUDqEDS3UqUxit/Up/6QngiIDSCGujVxOG1d
	+FeSK4O3kwhwZ4s3gpzrt3b+EtFctXoH+pTRtX0m9BliDYRiZshQXlgld1TdQNTPnNhvh4QlND54i
	4Y8i9CsiCrsjMDlfE8FkEVcM+TpQAtoLhkePMg0BL7ZZZpUQ3HybVv0QAl806CLXtaWMHR9Z/szuc
	IZKP3wRAAaWeXp23f7mwY5O5PD6LniKIx5NFgry+a/fnMliq4VMkR+Zz+BuZaEhN049PtdnMTf6+N
	w711DjVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU2x-00000009Syx-2r3F;
	Wed, 25 Jun 2025 17:36:31 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPM0-00000008ds3-25b8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:35:53 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so10361011a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 05:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750854951; x=1751459751; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2q90HEwNHGnz4Upnp0RKX2HlMlf/DYcXUBx0PZgzyaI=;
        b=nArMGl6qL3ihrfv9bJXkNCoNW94YdRh3CZps+Z6Zw5v3A63/f6jzYDHuNkY8Dp+RUk
         Zmv1vncM9N7Oy90mfgK1CA/IXzK7JD1o6Y7BeW3RXVUc6ixUDp/knd272/cbfMm/Vac3
         rRR4AIZBrlaL9S/fu+BFzgYDeflUIQwLQaNvMpe/WdMC+k2z+QrIfYZ50QSKzY5FPrIZ
         MiNxu1jIzFFNYAhyxqoLeO8fP5bh8ks0oBhP/SPbe6cxW4X82321cbmGb5qP28mv6jAK
         gGkBGdU0wUG4dSdHQB6H/Zbr//yZdKx9d422FGPJHxEt9Xt0OXGE/Daf4FYIGdwzypVN
         ehNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854951; x=1751459751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2q90HEwNHGnz4Upnp0RKX2HlMlf/DYcXUBx0PZgzyaI=;
        b=Qidf4ayJCXkHBrfDw4l9g4JWZOLHbs6j3+0aOuZ75FOy2Nx0U8j00g3sMbX13q3ifu
         /2JjRjB7Spt0xF/aQHujHSPC68aVXOWEtPQpTVPg8Xycz2wJ3H/Xdpx8YK4ZlsNF90+K
         SBWb8mi4ICHyeGYdqS5XHiFB/+qydSElZAvf3oykN90R85R1Jh2VxaF1wUFRVXxiQ499
         XGkjhmOTk9ELNkE2YhFlL72SMAyH5Nu1/tzmVbOWv55q7nurUWyLjyetRwN8LTii8+xk
         e5NTFOe2GH2OvOa2as0Sk1+EsIXGBxAguhGEi3FhzEY6NTL60q48FAckGhULli8H0rHR
         f3ww==
X-Forwarded-Encrypted: i=1; AJvYcCWRioFfm6eXYxCKslutYOM0LTqvFRNF85trmkBk1pGatRgfZys51aGB1NAaK6zu3IQk/k8iTDXSEor6RinRB5Lq@lists.infradead.org
X-Gm-Message-State: AOJu0YwpcLETTciYYGz/iJfxVdohdcTwDSdHc45dmO/2A2niZxXdr+4t
	cWieYgRABpC/eWZDCRvKvGS0S/9Tmkz7uexyM36TOYjSLBZW65KFWTUA3LXQN/1bBQ==
X-Gm-Gg: ASbGnctXLlOGUZvohJ+ycoZCKh8skpgg5EHOX02SAabySPUY0Qfs0LM8DZet+66tykz
	DhzUcmPIwz3YmKX2WikGPmkFvDBh+okHa+IEsiGvAEkkr9JsUwztgL7B8NehiLudjK4ilx7gnzl
	EXVk8zHuNq93RWdwSlJFwYVJItLU75E+dED1HjuRjklwveFmDkMJAvNpnKlZn8u5Ub39isyCuOc
	DywclLi58lqe+4xJn9WLnsKsH35cOzUBNRxqtFRVo2d0IQLtOPAcbPD6dKLeRnakR8sKdy09jU9
	KQA0DYfTrb8auviKL2aLukw/EQ7Yd7bE6R5LDnVXbet1nBQjRBLydLMBy8uHIT3Ir1Wx+L6MZ/z
	dOeUfQkCD2/OXf+lmqmT+4+xkZ+KUCWA=
X-Google-Smtp-Source: AGHT+IGeu1vPbCuiY2js0cAMuyaqjySismzGJ98ewnju3a81TdzXuUCosTL/BoTdvitPihCLhN4tkg==
X-Received: by 2002:a17:907:7254:b0:ae0:c5a6:80e7 with SMTP id a640c23a62f3a-ae0c5a6ad05mr220312566b.16.1750854950527;
        Wed, 25 Jun 2025 05:35:50 -0700 (PDT)
Received: from google.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae085beb7e8sm604860966b.41.2025.06.25.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:35:49 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:35:46 +0000
From: Quentin Perret <qperret@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Fix error path in init_hyp_mode()
Message-ID: <aFvtIn5SuoAmlvvD@google.com>
References: <20250625123058.875179-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625123058.875179-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_053552_537510_90636E5B 
X-CRM114-Status: GOOD (  12.06  )
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

On Wednesday 25 Jun 2025 at 12:30:58 (+0000), Mostafa Saleh wrote:
> In the unlikely case pKVM failed to allocate carveout, the error path
> tries to access NULL ptr when it de-reference the SVE state from the
> uninitialized nVHE per-cpu base.
> 
> [    1.575420] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    1.576010] pc : teardown_hyp_mode+0xe4/0x180
> [    1.576920] lr : teardown_hyp_mode+0xd0/0x180
> [    1.577308] sp : ffff8000826fb9d0
> [    1.577600] x29: ffff8000826fb9d0 x28: 0000000000000000 x27: ffff80008209b000
> [    1.578383] x26: ffff800081dde000 x25: ffff8000820493c0 x24: ffff80008209eb00
> [    1.579180] x23: 0000000000000040 x22: 0000000000000001 x21: 0000000000000000
> [    1.579881] x20: 0000000000000002 x19: ffff800081d540b8 x18: 0000000000000000
> [    1.580544] x17: ffff800081205230 x16: 0000000000000152 x15: 00000000fffffff8
> [    1.581183] x14: 0000000000000008 x13: fff00000ff7f6880 x12: 000000000000003e
> [    1.581813] x11: 0000000000000002 x10: 00000000000000ff x9 : 0000000000000000
> [    1.582503] x8 : 0000000000000000 x7 : 7f7f7f7f7f7f7f7f x6 : 43485e525851ff30
> [    1.583140] x5 : fff00000ff6e9030 x4 : fff00000ff6e8f80 x3 : 0000000000000000
> [    1.583780] x2 : 0000000000000000 x1 : 0000000000000002 x0 : 0000000000000000
> [    1.584526] Call trace:
> [    1.584945]  teardown_hyp_mode+0xe4/0x180 (P)
> [    1.585578]  init_hyp_mode+0x920/0x994
> [    1.586005]  kvm_arm_init+0xb4/0x25c
> [    1.586387]  do_one_initcall+0xe0/0x258
> [    1.586819]  do_initcall_level+0xa0/0xd4
> [    1.587224]  do_initcalls+0x54/0x94
> [    1.587606]  do_basic_setup+0x1c/0x28
> [    1.587998]  kernel_init_freeable+0xc8/0x130
> [    1.588409]  kernel_init+0x20/0x1a4
> [    1.588768]  ret_from_fork+0x10/0x20
> [    1.589568] Code: f875db48 8b1c0109 f100011f 9a8903e8 (f9463100)
> [    1.590332] ---[ end trace 0000000000000000 ]---
> 
> As Quentin pointed, the order of free is also wrong, we need to free
> SVE state first before freeing the per CPU ptrs.
> 
> I initially observed this on 6.12, but I could also repro in master.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Probably worth adding:

  Fixes: 66d5b53e20a6 ("KVM: arm64: Allocate memory mapped at hyp for host sve state in pKVM")

With that:

  Reviewed-by: Quentin Perret <qperret@google.com>

Thanks,
Quentin

