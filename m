Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DBBC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crDfVMRTURCJ2kMvoxcTffnKsS81n5x7VpWJfYEfCY0=; b=miop0ffxrSMMGPjg1KkfWMvIg3
	NxbobgxXvsrH3iL0Elm3ZbD6Gi/REnHpuGrSe64qtaj61PxX7LsTc1AY+ykz1rD6iJzkvYdjg83F9
	ayKjya5pFCW0egOmIxFKHMELGyes6LQrogdWXlit4IXzsZt/UKaR8Mqv4EytXyUg34+wWQndty717
	7BK0I5kC8cEei0re1kK5KzVSOrBME0mIDniSoR7CHHeOzi+J43Z8RCa27qfg/dawHOo+GwT+gDgyU
	EvQbRIs9PjRb1k1cvFvVD4mv7iwxoHaKl6fF3UJy09EFDJALah7wH/KmYhZvCO0UUHomfILcsuZQ4
	b3F8U2Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GMG-0000000BYFE-21JY;
	Wed, 09 Sep 2026 11:20:52 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GMD-0000000BYEN-2KLT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:20:50 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so5825e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 04:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788952846; cv=none;
        d=google.com; s=arc-20260327;
        b=NBLUcCehfo8PXMdIwAZNjrpHNp6k/PQsREQlb0W4gXsf+EWen40+AWtePoPW5mmn2I
         2djeEBIFB28JDLvm8c8VVFjycEr6YdaCwI1b+oDgkQ2g42YynaOrPnZpk6TX1QaDpXwI
         InqrQxab0FSREP6fUtc1PWSGYiSymtLh2SslTg72ZXnOH8DA97eCRuBad1zDrTmMjte3
         6bap7J/b1LYwu72ldZARUtUR+sf6LPiOhYB0RttedEu/0KpuNDBd9hLY6B8fOl/XQOUU
         zEDX69GLCGInEIKHNPcDc8ROqXPm13h3Ig2WGEFspE+Wofh0nxf+i0APc3kNdlTGKJax
         AcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=crDfVMRTURCJ2kMvoxcTffnKsS81n5x7VpWJfYEfCY0=;
        fh=/9ONHcW4+yCKDXy5jDs+4e3w/Vt0yS72/GPe7t7JiFQ=;
        b=BSW8L8BK0beuav2cDByuJV1E/FSoNSTDzt2m+UwEWRlKFPy0APLewe8/6MR1p+CzX9
         h0PHa06pWd0rT1vSXNB9/LokJCj8kIEqcmc9Zy+A1Tz/i8FlwC9v8kVugAocKyuG+K7x
         q7iRmq3Rgq+9z8tBkvPswvSSoseCZ4Z871xtttynAeC76JKlpi+xJ3HVqoVa8cdQaise
         yXP4ZFxpJZUvDcMIeGaYgrvuZ+DqzPQJHpSf5TSJVmxWqcq0eWfkJoQVUFSrk2CM5gcj
         zeDTruyxVZ7hcaPfgditkWlHdbCHX809RwQaqPFoP+d/yiltCfvfIURYJAE/N8hO1bFD
         uX2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788952846; x=1789557646; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=crDfVMRTURCJ2kMvoxcTffnKsS81n5x7VpWJfYEfCY0=;
        b=BNjeeT3nEwaFdr9UlJNdfDyOS1vk8ViyRqLpE2maxKYQ9HDGYc6u5FJ9DcvC9Jx1Ka
         RAtMTDXPdfa2KVyAz0ZDQTYgy2VDRwxPT55znthil7JrvCSXIVxK23vrwDcFm3zPXFCe
         YocMBrb152OzmlWUXLAq6RgE0bXFp0ziJnQYLInqjYEHfjwKcFblNJF00lTuh/weHCoR
         1nB/MrTll38eLUryC56MABvENRdACWPz8ovL369hwdmjxis4+tF77aCwEQB3nikU6kHe
         dClQ2rMAUruAjU/Kucduz6Q1OmKA/+qeb2lyYbR0PrN/dZdU4CT85of40+t3/9+v650/
         B7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952846; x=1789557646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crDfVMRTURCJ2kMvoxcTffnKsS81n5x7VpWJfYEfCY0=;
        b=Uwfm3J3YWo+GfoahwjSlgm6IrqsGSWPGfD1UDVyxWb4Ko2L3dgLSW0YmM+taBwidzb
         weNbxrhCEiwvkf5vidT4ygVyXA+t0YiSkLCqNGkhcITNwogMkFgZxiPCX9H2q6MJcCDJ
         sHsWTkhz2bOgyye4BJsu245OFH4b7oy0VZ8GenFHv2Lk9VWVXs4IqYnsxqOXHZqvhfEP
         UQHic/Yw8oiRVmJJCpjw3BSLJWO/G3zFvFujwFi64PMNvBCDEHojHdS99NOO+pDNBnjV
         aebh1swONVP8jXgm7IXW6O9HNCAcY+puJ9Re0hYbuTMvK2PFRxfTBJlzZnxXmgIhh0pF
         D3OA==
X-Forwarded-Encrypted: i=1; AKwUvBzGB4spg73fPLRUBsJWClmAKtJGj3YbweGrv41Yx2RcUkHT/+kiGmGVtBvAeskrVapT5NLIPPjpK+W8FRLC+c+Z@lists.infradead.org
X-Gm-Message-State: AFuF++nWh1gOXgA8j0qoSLLL1zfFeYBpeZEIxCfhJLDTh0lzWzNDc7cl
	nQQvcRarX91aNaux8K0PZ0ALEroiUikwE8XiP4h/7dMJ622+1+X8lOlnO13WcEXXGNE0/tb1ilj
	ghX+1GVl08sMk+pjYiy9VoJTGTnL/eKx+PiWYR8sA
X-Gm-Gg: AYBFou1yh1qLQqZpxrgVFELq4zk/Y5D97D/RMTsVnKU+jZcn9CHWUN5oCkctuiS6Zi/
	oRmr0r70zFxceZEjBoPVcqzt/nsiwvcq5Auoz43jfJ5QNhMwdrIdOsnhTi9vZdt4WbulnuQEBH9
	z7x+2eOBol4pcHF8PqHQGzK7oAKuotRruSm4coa3FFcdXpljHtUB3kVi7BexV2ssLImCX+5yiuS
	jP1TsPlhe+dvHqiGjxZMdr5P/w5Ugp2m24a7cs5eHkUVK6+b8PZhtqYgHXqwG3XR0fzXA0eOBG1
	fMd3SoofAxQy/Jgx4jSQzoRhKdkbZ3j4laxcwsFyzG+XPtGuNo8G8FqKfuQQ3KBfhYFfVFQ2M78
	++mwgrKqGJws=
X-Received: by 2002:a05:6512:3f22:b0:5b5:e890:1953 with SMTP id
 2adb3069b0e04-5b764bcde12mr149151e87.12.1788952845618; Wed, 09 Sep 2026
 04:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com> <20260908162223.1683432-2-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-2-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 9 Sep 2026 12:20:09 +0100
X-Gm-Features: AcwNN1UBL7PwhavrAXm1ihvLqEvgnaWmqxzjHA3KjiWz2CvXQREmUKFugkp-B-A
Message-ID: <CA+EHjTwSwGUGT=6GWaOyav7kBQey0+xpL0kJ03ABtp23ZgD6RA@mail.gmail.com>
Subject: Re: [PATCH v17 01/20] KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_042049_615588_BDCFB654 
X-CRM114-Status: GOOD (  14.13  )
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

On Tue, 8 Sept 2026 at 17:22, Suzuki K Poulose <suzuki.poulose@arm.com> wro=
te:
>
> Fix a potential build error (like below, when asm/kvm_emulate.h gets
> included after the kvm/arm_psci.h) by including the missing header file
> in kvm/arm_psci.h:
>
> ./include/kvm/arm_psci.h: In function =E2=80=98kvm_psci_version=E2=80=99:
> ./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
>    =E2=80=98vcpu_has_feature=E2=80=99; did you mean =E2=80=98cpu_have_fea=
ture=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>    29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
>                  |             ^~~~~~~~~~~~~~~~
>                                |             cpu_have_feature
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
> ---
>  include/kvm/arm_psci.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
> index f86a006d67136..06c20612e9e7d 100644
> --- a/include/kvm/arm_psci.h
> +++ b/include/kvm/arm_psci.h
> @@ -10,6 +10,8 @@
>  #include <linux/kvm_host.h>
>  #include <uapi/linux/psci.h>
>
> +#include <asm/kvm_emulate.h>
> +
>  #define KVM_ARM_PSCI_0_1       PSCI_VERSION(0, 1)
>  #define KVM_ARM_PSCI_0_2       PSCI_VERSION(0, 2)
>  #define KVM_ARM_PSCI_1_0       PSCI_VERSION(1, 0)
> --
> 2.43.0
>

