Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702B9CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 07:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uT5ydn+EqJZsAMkKj0fC6IolXW7qV5RfXWPNY69Zc+Y=; b=KBRM6QFL5OyrcrLXZC2Q3Ec9yw
	JdWNSPgbMn1r0uxRjlfASBOlEP3i7x2yEAG3/4AFIPczAsXzLbAYbrL0QqTn2z+6yroa/raJr8dXp
	dMSXRITtSH1PeRWYGWaJGhYok31kSA+KOuK2dmkH62Rp8QR9B9F+8lnY6WhjUM+l3zmfeIkfRyvFB
	WLCj1KVRAUFcFH7jR7LrIQ0eCWsNnWPK7eLffJGZDMEGj2evfl9NbPW/OhB9Sf1c8nOP7rDz6V1Uu
	fFKPG74bC53AOVWgHnJobl3KJ8OFPpmFQMXNSykF3kII4j/VZivzDbFude+Yr4XK/8zfxNIHlK5Es
	xukOSbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7aC-000000025NZ-0Tjo;
	Sun, 07 Jun 2026 07:06:08 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7a9-000000025Mu-0oVv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 07:06:06 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5177d1ff061so1077051cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 00:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780815963; cv=none;
        d=google.com; s=arc-20240605;
        b=RlqhQD67bfrH/oGzF2CuUVZAC2q4sqf5jl/Mv1tE2Qodu9qxNuyQ1HOwzVckoIwHBx
         vtJIJAK76k0dYC66R7vGTO0Mu9W17YgYR5Emmlf8Ml8VjBHTwWag2ROxS5Xona8bX++b
         Y5VZ6Zuwp2BwSv54bzDanSZ7efQ6b2MYoiCLqSYsL6b11YK03SUqxVaDyb1aX41RQkLH
         3vuR/0EGsmdGwGcxpI3f08vyk9sBRbbyYzmfum/VD+sy13qQpGRTfpzsKAy6szPCPZM3
         gM5BUqsX1/xphuWvAvkyqXd3mqK8YqpfG6FFHXO3yNgUYgtYQ7UlkI6rlynoRS/OkKht
         exsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uT5ydn+EqJZsAMkKj0fC6IolXW7qV5RfXWPNY69Zc+Y=;
        fh=csQgSg99ygkIAFkTLPV5HQrqVPlCME/vxJMHC88JXVY=;
        b=W1QDC0wMtqrO1HxJmsZAVrLLGklGwlwqs5nMBN1F2zkiHH3eW7YLNcNXC3xQF80JRA
         fPJFnhLCy3o0m2UgPG2Tp5G9tai7plyY6wLiZWWXtGq0zChTO0J8itF8G3BKSYPB3lRO
         uRCTOThy2sBbijJ79xo0mPd8God46iBgEJIvMmykJbTK08aZUa/ri1AyxIHTZ28xz6vt
         amUX6l/fE4pimsPR6I+quYpq+qj636iAQp7/p7c+3rwoGF1ZrgzyMjzCIvhaPCb/46Il
         QGRqERzQVCMpJQ/TT42Rv8xodlTa1dwzclKu+jM3Hp/RrlYsXO1bhlUY5+nL/8GjTVSD
         cXpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780815963; x=1781420763; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uT5ydn+EqJZsAMkKj0fC6IolXW7qV5RfXWPNY69Zc+Y=;
        b=ezN9Ok7PJpRETbR/Gfds+3Y/vhJnoeeL3suTsEOxTe5msLPz40BfHGbEpy2wnvx5l0
         ljo5eRYR1WvIDRMcO6XUv0zceGdHXxuIk1y47oniZHBZGCa0nNqfHHlKmmncCv/QYH1l
         h/cVh6ZPqo/vXvINmqh3y6pukdNVBgJkwvT50266ah0gWPbtNXul6d2+KzTxTuj9kUSf
         HsMAtV/BNBpcPPx1nWbMYvexrZeJC2x/wQ2yb4PKJrpMMwbTxHOwIVxhvqxG8FqSb7r3
         MJvAYR5c3huFnI49OOYkmkNCwqjcEjPyJPX4xUub/zKAjiCYfA89vpWdZJchC45rgZt9
         SQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780815963; x=1781420763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uT5ydn+EqJZsAMkKj0fC6IolXW7qV5RfXWPNY69Zc+Y=;
        b=Yi3g/hdlxw1lprY5iZ9hdaRICaPVMkgV0xLJ264CqqoNYHENCNeGTFZNcsilgzdRlk
         ZCXPC4DNXP3cPHJfX2NeEtPmQkA1Xxu14h8ZW3/6zFlEUxZz0CHNmmp0LCVKJys32Jjs
         tjrvsnT3xMuOHtkKlIEXbWZIg5tb7Zaj+0Uyk2McM0mmeFnioa3OgUu8xV4TjnzHP5Ng
         FTp75spRzWeRYUx1sqmUE64iWAyCnXpvFU9aJwzMB76LblnvOgqD3cU1lui6ZA4SGaIY
         VpHQw5uM/fa95iIX13YQ7uzPfjKrfhwq1YQsfF0V2vCrrBYHBWDYDLmXT/NmNyv2ZS/I
         ECcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SRNIXEDbLPnN6MswKdrQaoqKR/grREgPam8l1gPoty/tne96SnYRM8gdb8KYbfQqrt+deaGj7b8HEhn5WKMW6@lists.infradead.org
X-Gm-Message-State: AOJu0YxfckxdiMP5nB25meq5vYlWCbNkzsr6lHkWeK740RqGrQBzvBz6
	84g9Bm1J5PX/qW2EhxlMtRXyOscqFNovdB8ErZZhtMMjwvbMbSTVKXdaV/0VjikGpLVke71GT89
	1p3pVEeUdR0RZw+FcqzIVZLTJ6IHVFtldk+2Z/Gx7
X-Gm-Gg: Acq92OH9aE6Jv6vfjEX7s/V7nzOfZyuMWSCd/F5GU9jWF9RLgzNqn15qNwK8ULm8IK+
	rzjLdltIW+ooRsXrOD9lAuEZngNkAW0S4irkMfXmAa1+X5q94gacNSFOdN/Nly4Au9w1wdkezKq
	ZVXu7yssKCB4lN6gqw1xjR0+P+omVW2G/eNNjnAnm2m5VM7JdVEvdj7yz9w0N04ku0ljUDENxPu
	yHo6UDyDqs97JBVXICFmyTVQZf/XwPaa/mlBuUndDnVtcV+b3vBhv5DcCPI5erXRlS13OmFQFDx
	8WFDw+yULj1hwogFLGA=
X-Received: by 2002:a05:622a:6d01:10b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-5179806b242mr16836941cf.7.1780815962364; Sun, 07 Jun 2026
 00:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260606175614.83273-1-imv4bel@gmail.com>
In-Reply-To: <20260606175614.83273-1-imv4bel@gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 7 Jun 2026 08:05:25 +0100
X-Gm-Features: AVVi8CdRhmH9BYOsHsmFgRsg2rtea41QIta7Nrzuj5tjiY1ErqsUXnoxLXLi0HA
Message-ID: <CA+EHjTxSsPvT11WRUJ5hRS7c6xNwmKK2ZbU_mCcBLBqdFM=xNw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] KVM: arm64: Sanitise host vCPU fields copied in flush_hyp_vcpu()
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_000605_241382_A6C24567 
X-CRM114-Status: GOOD (  13.72  )
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

On Sat, 6 Jun 2026 at 18:57, Hyunwoo Kim <imv4bel@gmail.com> wrote:
>
> flush_hyp_vcpu() copies the host vCPU context and vGIC state into the
> hyp's private vCPU on every run. This series sanitises two fields that
> it currently copies verbatim (host -> EL2): __hyp_running_vcpu is
> cleared in the guest context, and used_lrs is bounded by the number of
> implemented list registers.

From my side I think you've addressed Marc's feedback. For the latest series:

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>
> Changes in v3:
> - 2/2: replicate kvm_vgic_global_state.nr_lr into hyp_gicv3_nr_lr
>   once at init (guarded by gicv3_cpuif), instead of reading
>   ICH_VTR_EL2 on every entry behind a gicv3_cpuif gate. (Marc)
> - v2: https://lore.kernel.org/all/20260604151210.1304051-1-imv4bel@gmail.com/
>
> Changes in v2:
> - split into two patches, one per field, per review.
> - v1: https://lore.kernel.org/all/aiFe-CXo-XVTFz1g@v4bel/
>
> Hyunwoo Kim (2):
>   KVM: arm64: Clear __hyp_running_vcpu when flushing the pKVM hyp vCPU
>   KVM: arm64: Bound used_lrs when flushing the pKVM hyp vCPU
>
>  arch/arm64/include/asm/kvm_hyp.h   |  1 +
>  arch/arm64/kvm/arm.c               |  2 ++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 12 ++++++++++++
>  3 files changed, 15 insertions(+)
>
> --
> 2.43.0
>

