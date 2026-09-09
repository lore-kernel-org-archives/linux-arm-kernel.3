Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286B9C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STg7xRV8j3OkHmv1a51bOo5IRu3aXP7QERSx2DeQDNI=; b=KdqdnvPP+5By7eKJ8SwV6fLmwq
	WHYY/lPhUi9qp3OcDBI9SjsqXUrLFWoExRyAfPrB7L93dGR2+WiPj8u+Rve27xEJ7mOvVrJRBmxIj
	lzKDOnpH0le0cPJRHMlhDYYNHY3UvNWeMn1q7D8Vl5AawTFDnbh6B5a01kFgB18Jxnck+yBRKCts8
	3Q8jDs2/yhxJV5Wx1uQ5+3QfNji7vQ9Xioyi1yuglHCrSrH6x/BYBhOlHL2apJyxHRfbB0J+2aiIv
	+zRg9CtjlN25F9HHDm/oNgGYtoxGNrjc8HxyhJy9uZEfiYkHF+r2CsslnqUsMf1lhqqOhV8hR1LCn
	JXziRqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ID3-0000000BlrY-2Tyc;
	Wed, 09 Sep 2026 13:19:29 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ID0-0000000Blqz-3lzg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:19:28 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so6950e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788959965; cv=none;
        d=google.com; s=arc-20260327;
        b=iqP/JF4yeM04iQavZa9MyL0CJFNop/v+bdzHfmS0BDSqdwkT21vD3qr/e5ZocWpFNc
         9Z6fRfOAB0Ih2qyTK+cj3NPGioNZEcdwvizT9Buh9vf+uHqFNQi/5zlD+cq2eE6gFWqK
         4QxAs3tHHfzK8tVzlkNKcgTj6dPFQno35cy05gj8UxRQ3rwI83d5bTX7/nTtpOUiOQLp
         VQW1U8dUqCNUXobb/A2P6RTIA3fI2qG1S5rYi2RYMSpm0ByUcxQCIp5hBgo5B3V2PU7f
         myjWy3nv4lv0Q9fKfWlPxXsZB64URGjOyKz+bbwxQH+eeSW1r4E/fnxxRDgnnS+/4YeJ
         4/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=STg7xRV8j3OkHmv1a51bOo5IRu3aXP7QERSx2DeQDNI=;
        fh=2ljRehncOvO9mi/xkNM62wO7F5tIE3LiMy4Zpvezq4s=;
        b=iFnADQrUiqmOvYPzw8w5eRsR95bGII+IQHJjf2nLS/JFFMO0yGV1q3x0/szASz/y7V
         amru9kAuXOmUoon+K+n5eA1jTEEGSmC5pKhLx2841MzxE/a8/+c2uFOf5fKZ9+jqoRzt
         M1MG+qO7nQWda+mx7MfR1bAJkgGoWLGVT4oscLBnLILlgQaBCiv4zkRd+hjuQP5hGiZU
         ST/LG78vINrSBnIvMZ9gIz5tdaQD5WrFuGYCqWNytywdpBckcekur1ou7M+KiPgypIII
         D/VvfIyzWUw5C9lfVuVnyfirdu5qLPGTvpXegyBhKdnmsQ0oshgN60UD3zfAb3PduCtc
         Kimg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788959965; x=1789564765; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STg7xRV8j3OkHmv1a51bOo5IRu3aXP7QERSx2DeQDNI=;
        b=IV2WUXkBvC0PgZf36mh2ZbSbYe9nmF5k3/cShGHKeQORBIDs2hp0skLLXahAEkFKzq
         OzIog2PJoava8CSfm49xumeA6jQf8NWs8f42/XDmB7rqHuIHGZzAM2/+3m2HvOO62Xbe
         +75z47+WdATt6vIXv3x72bNucHQyJ8V/1ezNj+elC4LH5AOwcrZ/54qlo98C7appcPyl
         RExq/NHU0fpliB91Y5caU/e1i3qlN6LT7uIXYLq5SGyTMGLdqkQjeG1sjzGX6cP58s3g
         3s5jvlaGO8clEekYVlzvnFYD4UIrXi3qMk5vK2kst5A2D9vkogclZDn/qQpG1yIqhmBg
         GWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959965; x=1789564765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=STg7xRV8j3OkHmv1a51bOo5IRu3aXP7QERSx2DeQDNI=;
        b=FiwBdTA8Iwbo4wbWUA8z50QDauSJ/Lownsc8rWS7lxQDDCttVLarlRAu8je8TTZHZQ
         M9KQ/WBuBKv+MPt3UV6zEGjQg+UX33fy+nYy6ad/PlUxjouK9cHoRRgy8FSmUD3WHrHc
         S/ChrIH+M5M6DznSPpfZfjGjmD+QYXHXbJl4auq860AYVVL/IiYDgtj+npCTm93gfeBb
         pCu7FZiWNGqgW9wd3GyAWmmtVY44Oov5+Od47Bike+8Fwumzh14Sgo5FmQaOZbzi91vb
         ioiO0UNzaAdhMQw9DkQSp4OL9jZRkmn4Ns39iaWniA/xh5jte2O2mlheuHcnmSD0kIGb
         nFHw==
X-Forwarded-Encrypted: i=1; AKwUvBylee0ukTztidVTQZi9envuprRmmT7FVooW0CpEOA1MlN50OQks/xRGAHCK3o+zzB6C0gfsfdPYE2Pv3r9o6a4S@lists.infradead.org
X-Gm-Message-State: AFuF++nCfmc3r4hWXtAfqeqLmcDsLWE+CqUtXWRh/3M3tPMhofo3p5A1
	yIqQY3Nu60ySzzttRHtR+5eLtAVEFSCqPHnIVSvLbZ0krIhb5HiI84U6pzpqi5rimUXHbDerPnT
	t7fSvYJ4AMRa65tnWZgeedZ9MkoWaPvauqr7iolWM
X-Gm-Gg: AYBFou1UsgZDEHu0E6UZLDXY2yRmd7sQOCkNSB4CKEeu8LFvtiVmMwp6kNySTL0f7Yl
	RNJoe8TxR5q7oqjnVDcrFjUOmkmgJzybWlsbYxQbGwYmzHi60xqnEGD7Ig649/ShP9UjkMVsPu9
	/663QFPSACKvtvs5ZtMv+ce0ZaOBBgWLHFtwVIPqcMGQ1wOn/8jz8gnyy9bhubtEgy/WM2sLw3Z
	p7tXwEkNg/IA4F9ndSUhmNgPB5HY1FGjC9s6JgfKNJPntmu91bWzO0ct4SvnGkLF/M/OTl6mPuA
	GJFaHSeWb41//0GRoNgU9cnY9XHzWdJ+p3PxbOFpFBVkuGAy94Pvxw535xVvi818f+F+3tHWp4J
	Yws/OK0BWYA==
X-Received: by 2002:a05:6512:234e:b0:5b6:bea:f091 with SMTP id
 2adb3069b0e04-5b764bba2f4mr141895e87.10.1788959964067; Wed, 09 Sep 2026
 06:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-1-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 9 Sep 2026 14:18:47 +0100
X-Gm-Features: AcwNN1W9J0hO2XvyP_iEth4oT8xwRLULtx1NyAOMY4yUoohn2-IYZWX_G_vBhiM
Message-ID: <CA+EHjTzr-r1FRuJ-X3E38_SSHsNSz_vdO-8sFOtBdsiB3V_x=g@mail.gmail.com>
Subject: Re: [PATCH v17 00/20] KVM: arm64: CCA: Add basic plumbing for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_061926_990685_1AD7FFC3 
X-CRM114-Status: GOOD (  10.03  )
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

Hi Suzuki,

On Tue, 8 Sept 2026 at 17:22, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
...
>  3) NEW: Enlighten KVM arm64 about the different VM types and use call backs for
>    the VM type, rather than spilling the is_this_type_of_vm() everywhere. This is
>    not complete yet, but it is largely functional. Adds VCPU and Stage2 MMU related
>    callbacks with support for the existing VM types.

A design thought on the vm_flavor dispatch tables. They're
hand-maintained arrays indexed by enum, and a gap fails silently at
runtime, not at build: arm64_vm_s2_ops[] has no VM_REALM row, so a
realm VM would get NULL ops.

How about something like declaring it unsized with
BUILD_BUG_ON(ARRAY_SIZE(arm64_vm_s2_ops) != VM_FLAVOR_MAX), as
host_hcall does? A non-NULL check of the selected ops' mandatory
callbacks at VM init would catch the s2_ops naming typo Sashiko
caught, where the rows point at zeroed forward-declared structs.

Cheers,
/fuad

