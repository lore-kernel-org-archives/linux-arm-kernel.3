Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586C7CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1i1oDfCJW72UVj6tqHkuUrHq9UVqOgjHQzojRLhWq8=; b=wx+JqKn62tFc9lW5fB4+s2kx7i
	wWx8g4b0tHRz6aWF5SLBs5ZwLsvf+n/hWB+BlMHCfsGxAqatK09QE9rxhltZyHz6DQPuSJjp/GoJe
	HTWoeHUhXfTKttqQfWPPLIwQ/hyOxbGSbc/YTvjd7fr0r6BOZyVa3MiECR1RnniC4lxV6Lfu8XTqW
	BIyriwrEuzlxAhEyHy725fhc4uoLnseQOZuKDMdNuCkBasbzE9bcsFBFTM84aBNuh08P9ESYWtlS/
	dXH/oWSVUyMYK6/8Ep7pirYScSdCkF5a24Gz+M6cUba2rW0BU3C/0rnecNiKW2oXrQ5HIpU7ZHPZb
	zA+AEhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzFQ-00000006BHh-059R;
	Tue, 23 Jun 2026 11:24:56 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzFN-00000006BGw-2Fyd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:24:54 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so7877732a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782213891; x=1782818691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G1i1oDfCJW72UVj6tqHkuUrHq9UVqOgjHQzojRLhWq8=;
        b=wOZpThLT1pmYIf93hXyCwI/H3gEwSs0nLCP7tzyjHp4inUXoxT8SCnnh6Fz1Oc8Aby
         dcQhyILN20bVKq9i7NX0TVlyS4d1AjXlo9SloxpA0mJLPsgo4HrM3XupQhcK7k8L+uyY
         +muDi10nqL/hVRXSVzU9vksNlSw2Curol22rKfyB8XB3usceJjnhbt5PoTDWm3UTRgVt
         4hYqvg3c+IrrW5XtsoB2z0rn5yd+Ma8Yjyc3ZaoxWCeiNEbT66VdaHp76CJB4TinzXns
         9kzDp4Stkjm1vcK8RVY+ELYswl8j0yaBGm+JnABqim2Edbkpdb188uBdLiEht3/2L2Ft
         y83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213891; x=1782818691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1i1oDfCJW72UVj6tqHkuUrHq9UVqOgjHQzojRLhWq8=;
        b=HGN7P97pDLxa81mOdiddGuv8ElPf32qx6WsY33KDIMbgpWziRqG9/pGxp4/z8UoW94
         Zcu8jK6fUynjy7E4AylDw+PR213BJ2uZ6HbC0Ylhw3iLtU3pP6qGYjzWqWJgwcxoGndY
         r1WVOKN6QmOyBI67bxkKGaLLwdMLc1wOA+UaIrQIE2qyGYh7A7VRqffpfJuwuogT5yQF
         DIgHGfUuQv7yH/8e5LEd0xwtNcDUKz2f2pQO2fBKhkl6bFYlgDeVidzDpt7F5He4aknN
         WK8o/jqGqMmfH2cw6HKGwXRSF7BZpA+vacpsscc0kztjR9E79aYAmg1pYT96z3yclu3O
         CTbg==
X-Forwarded-Encrypted: i=1; AFNElJ+grRaz+CZ+ZYA4izivtnHW64/JRgeH8+Ksx+N3KsuGX91O/f8Nw+3n0VESW77SDlvkSAIJF/5aqky5UWi58plR@lists.infradead.org
X-Gm-Message-State: AOJu0YztgYR8hFDhxh+7675bRb3GYTiKRzOPbK0y5ADlSPf4RzdRr24F
	YoLUgqOoU+8MNJIEFFa4hZ1hdDUiTQjgcR/+bh9Yz8kUBxrMOyOOfQeTUaSUDJRHGg==
X-Gm-Gg: AfdE7ck/641xM0E1Yjf+UfRCkVkpcQ708Sb/o4w+vF5hz7YkYdV26fFs7KGghC5givV
	LjeAnutwkb5j23g1nuWQtU/XKGil9UuJuQQGHTnEYGSzw5vSo/vPB2FYdR5NzAyBqpaS5Th4gIc
	1+tdns5YPe6vfU3SdDdvCQJIROcD84+ldLe+ziToUQn3iBAEsp42VdYao5TCAm/eI1Q85jWOAuz
	vEmz4sZ56gOY2xqxqFdY8ciN2myliuoo3KqdqBbBwCB7CZaKvBzO/DSCo3bTyFroibisErjv1tb
	U7l5OB1HPGfjmTKUK+OYXX4I1kZaK5ZWV4ou6ql/pD1zfJ6jLuigjw+r3QvHFQ+8qFU8iyx67jC
	eY9XwweKumB/YHhbaBJ2GNLDaJniApgm1iLZbJRu1/AKyFWJPe/R6+tEx8fQjbOMZVskUxla1tb
	7pK3Rttt5UaP29N/EA+jwqgY+4A6h3glk0oOuioimWefSKlSmClvDcHn5R
X-Received: by 2002:a17:907:97d0:b0:c0b:90b3:ad25 with SMTP id a640c23a62f3a-c108eff706cmr105170566b.44.1782213889951;
        Tue, 23 Jun 2026 04:24:49 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0ff4c9610bsm157445566b.42.2026.06.23.04.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:24:48 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:24:44 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v4 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to
 TrustZone
Message-ID: <ajps_L72BDyofjG7@google.com>
References: <20260616154149.2763214-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616154149.2763214-1-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_042453_594556_AB9CAE56 
X-CRM114-Status: GOOD (  28.90  )
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

On Tue, Jun 16, 2026 at 03:41:42PM +0000, Sebastian Ene wrote:
> Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> FF-A proxy. This restriction was preventing the use of asynchronous
> signaling mechanisms defined by the Arm FF-A specification to
> communicate with the secure services.
> While these calls are markes as optional, there is no reason why the
> hypervisor proxy would block them because:
> 
> 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
>    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
>    Because all forwarded notifications are inherently attributed to
>    the Host by the SPMC, there is no risk of VM ID spoofing
>    originating from the Normal World.
> 
> 2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
>    operate strictly via register-based parameters, passing only
>    VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
>    not contain memory addresses, offsets, or pointers, forwarding
>    them doesn't pose a risk of memory-based confused deputy attack
>    (e.g., tricking the SPMC into overwriting protected memory).
> 
> While the pKVM proxy behaves as a relayer, it doesn't currently have its
> own FF-A ID(only the host has the ID 0). The behavior of the setup
> flow is covered by the spec in the: '10.9 Notification support without
> a Hypervisor'.

For the whole series:

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> 
> ---
> Changes in v4:
> - previous series(v3) had serious issues with the patch number and it
>   appeared like it used a mixed bag from v2 as well. Resend this to
>   restore the correct order of the patches.
> - fix strict check in ffa_check_unused_args_sbz and make it "<= 17"
> - check the receiver endpoint Id in
>   FFA_NOTIFICATION_BIND/FFA_NOTIFICATION_UNBIND instead of the sender
> - use hyp_smccc_1_2_smc all along 
> - check the receiver endpoit Id when doing FFA_NOTIFICATION_GET  
> 
> Changes in v3:
> - applied Will's suggestion to use the introduced method
>   ffa_check_unused_args_sbz for existing calls and added a new
> patch in the beggining of the series to do this.
> - merged the handling of
>   FFA_NOTIFICATION_BITMAP_CREATE/FFA_NOTIFICATION_BITMAP_DESTROY into
> one patch as Vincent suggested and create one handler for both.
> 
> Changes in v2:
> - enforce the MBZ/SBZ fields
> - split the calls into separate patches
> - rebase on 7.1-rc7
> 
> Link to v3:
> https://lore.kernel.org/all/20260616105417.2578670-1-sebastianene@google.com/
> Link to v2:
> https://lore.kernel.org/all/20260608165549.1479409-1-sebastianene@google.com/
> Link to v1:
> https://lore.kernel.org/all/20260501114447.2389222-2-sebastianene@google.com/
> 
> Sebastian Ene (7):
>   KVM: arm64: Enforce strict SBZ checks in the FF-A proxy
>   KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
>   KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
>   KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
>   KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
>   KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
>   KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
> 
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 211 ++++++++++++++++++++++++++++++++--
>  1 file changed, 203 insertions(+), 8 deletions(-)
> 
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

