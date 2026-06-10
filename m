Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A76CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/a+aF2FASI2PrgPXKTQczzpNoIJIj4s5NhzwmvJ4C9o=; b=KIxqm8PiqKlAcNUiQwLmrKIV1e
	a7F/Lnf2p9lTRkJVGvfQTMZ7lSK6MqwGCNVJOKDWkAVptXwdd+iE2YwexOk+kQS6m7Y4sOb1lMWCV
	+mvVs20Hqsp/kgUxbCp171zJ6nFCEknnWwG/0xBeNpWjmEPEN5MRpt1wG1MVy2Txqw7KLaV7/BADk
	syyAeVBD73rHAQzQ9VmSHLe9tmB7c5iJet8yyb3uLKAF+pi8RA72T7d6RiKjWkTi4bRr4GHBhk7XT
	aW1xdJCmnidi+BiJz7eRAIpnxzrVFEMnFtqJD8QE3uVK8vfM7e+woQQF3BrjnEvGQ0FExPDdBh2ZS
	LpTjlAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFYb-00000007J0N-0HZu;
	Wed, 10 Jun 2026 09:49:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFYa-00000007J0D-1Nck
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Jun 2026 09:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/a+aF2FASI2PrgPXKTQczzpNoIJIj4s5NhzwmvJ4C9o=; b=IZazgVLp+x1pyPg4CY69XOlh8r
	FT74LAvG86LEKrSvvj/ZufhsWKSxZftwPIIaq0vNIhm02jtuKJLtIDdi1/RJ5kig5ow4V3FG+0niW
	vSuK7yPUg2wEkr/1I5K19eoGcbuQk//Fdmxiujk2Gumf+x/mjF1FqVzTKSXVh2dWUt9xFEouataMd
	e7kdeW3Qx7nxS9g+wQkTTW7bfI6B53Ap4ezUokDK8DXuNKzbPSjdleSlZxCCbtRorPekU/AMGW0op
	/lr0f/2FFD/P85f2M+mpo+gomt7klAuOfJ65ZrkaDp891Dxc9zaX7mCS8RMV7UnNvItQ6qHGWiehw
	+cB1cEFQ==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXFDI-00000003gc8-0TfU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:27:10 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-bf84a2b2077so342742066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 02:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781083624; x=1781688424; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/a+aF2FASI2PrgPXKTQczzpNoIJIj4s5NhzwmvJ4C9o=;
        b=YiseiffzuZMD+S+5BVCtQHfvJJRv+j6eWx5Moowy6w6j3FYsTsaaWkRKHYUWnNli3d
         Ak/ChbFa6Lf2AVwnP1BxmLEu8NZDKDB1YVxyTd4JYqJ3Gl2LJXsHEvcbKgzMex1RV6i3
         uVSelyEE5Ft7CsKTzTWkgHDsRE//1I9KVLpKQHMeeO119KxnEERvfYv5x1bB4jNjPKP4
         ThCkpLAYWib0niBGQqK61vhVcxaqKk4GrNUEiRUbVYrVPK1m+UBljSDkdsNpJVJ/sT86
         nvVG9D8AwZPCRYot6MkSjrf1gOLjJGGWDXWOwKOG1Oq66pmqr1EyGoeQpB5r0XrVLp12
         7dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781083624; x=1781688424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/a+aF2FASI2PrgPXKTQczzpNoIJIj4s5NhzwmvJ4C9o=;
        b=JKNkQ4zr3FKFxxi6x4zE4suAUPNdaEneo+B2imv70Aul5Fbw2szjcuEVxWFoKtoLgX
         uFluQlPYDMpf6+OWlw+0id6Ose0rd0gjJtx57sK/cWLnq/BXFMCMZRmeYDY1zN0N5zfn
         ZQB/1seMw6vN1ZqQSs447iVZQJ1JGvrzX+jWCcSpj5fDIVsWs74gfXYnGKSW4hQO4oJb
         /2RtkcmRxSuR0GfxNnQY7VowX8rUEVf3SYxfJgHollVINiq2Kb1abUwjFNyHQbFgz0OJ
         +FrvvWPHxihbdfMIDhBXzcdRVtM5DBmXtQcEu82jmBy9cl1aFkBisGnxUsjyPb/7gqLn
         8z+A==
X-Forwarded-Encrypted: i=1; AFNElJ+DX7QNuMeawP9jUBGyq65lJOz8ek+bX6XsKGV5U7zdmEY7h5RQkkYDotYfGFHST/knuvruCFNaWbzW2CoQPX9O@lists.infradead.org
X-Gm-Message-State: AOJu0YxFmhCvxmmPsXA9OdAVb5U4QYf4pGp0z8gIEz5ihpKWQakkIhuP
	4FGubBbLC02uvXlK5IUsnnRWMHf9obYitRz7lN2I0bVAQcrmWZu8uuRIHJ1CtFATSQ==
X-Gm-Gg: Acq92OGo8sIqW0hEWtJCHaCEndueN1wF2VLXc5QhmgZ+tceWT2GBjkbneGf6HPNu5Ii
	TdiX2e/V+fQHwFkrLvD5HOQoQixAzdsJWPQMxFcSwrNR7aGpCml+R0+/r8p5XOom1DpHaQ8Fsgd
	jSSegIVIcIUGIApkBU02H4KWAiHDjla5VMkVo2nTomicQhMgkbbfUG8+BhXupcQpM89j6e4QaNC
	e5+dbO/oLB4+uzqqdmU40Lp60Uvqd3VoT91/yjpJOFSCFpLGZcE2zCDj/UAqih3A9yGyQg1It61
	l4JY9KPteHpY9Na5CcXjCPYA7n23+5r9ziuPcho1yotFWO4ZiXYfjywlOFYCTAJTloeNc2sqxkb
	5lPdR9R2okg8sBLkaH7fJY601c6frE5VhTWj31J/bHvzc548AA3eMBMqmbxsZYhA/BHJ7AwQhCs
	YxsiZMt/TCEDBEQN/aztqEQWKuVyt8ioisxxoET5rYINDFG4mGFkVIsPduyE6c5TsJLnoa9UeGG
	HH1OIdCssw5P+Ah
X-Received: by 2002:a17:906:794c:b0:bee:dce5:739d with SMTP id a640c23a62f3a-bf3749d4005mr1209578266b.49.1781083623847;
        Wed, 10 Jun 2026 02:27:03 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0522834dbsm1145247966b.27.2026.06.10.02.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:27:03 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:26:59 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to
 TrustZone
Message-ID: <aikt44sVnpL3_dYi@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608165549.1479409-1-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_102708_447757_249E4355 
X-CRM114-Status: GOOD (  22.32  )
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

On Mon, Jun 08, 2026 at 04:55:42PM +0000, Sebastian Ene wrote:
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

As it is only a relayer. Is it really important to check SBZ arguments and
fields on behalf of Trustzone? It doesn't feel it brings any security. If the
host passes broken arguments, I don't believe this puts pKVM at risk. Does it? 

> 
> ---
> Changes in v2:
> - enforce the MBZ/SBZ fields
> - split the calls into separate patches
> - rebase on 7.1-rc7
> 
> Link to v1:
> https://lore.kernel.org/all/20260501114447.2389222-2-sebastianene@google.com/
> 
> Sebastian Ene (7):
>   KVM: arm64: Support FFA_NOTIFICATION_BITMAP_CREATE in host handler
>   KVM: arm64: Support FFA_NOTIFICATION_BITMAP_DESTROY in host handler
>   KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
>   KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
>   KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
>   KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
>   KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
> 
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 190 ++++++++++++++++++++++++++++++++--
>  1 file changed, 182 insertions(+), 8 deletions(-)
> 
> -- 
> 2.54.0.1064.gd145956f57-goog
> 

