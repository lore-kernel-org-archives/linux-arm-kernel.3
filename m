Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3ACCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuyjNGNTaeTrwozTD0DPhcs6tJEVH09iyMIGVlGNB8o=; b=UrPuxlu/OQx00RW5tsFQ0caYAs
	biTOFpjKevnRveAj3cPFgPu9LYqJ/wyOnVXXULPmKRuTtEEfgooIg2e6xWvpQ5U2rOqDcbN/5xCpJ
	Zjs3qwZCaOwHOm1e2BJuURbI+a0e55Tl8zMH/9wIMozDh5zMxjaxEd99BdibwWyGOabKn+QVhSXvO
	Hq9R5Emv6/oAIe1NeFhkFqk91WgIQ5GVC+J8obAvfY1m9SbzNYUbYn6PHGRN7qNkKlgNq8gGwotNv
	LvwqXc3prRp0NHt61j6yZgB5UUhF/6T7J3RVgEhlguxWLlMUjCO3564u535IcJ5Pn88F3I/nkTVeU
	dWF/OfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZfC-0000000BAJ0-0l6Z;
	Fri, 02 Oct 2026 09:34:46 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZf9-0000000BAIS-0aJX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:34:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5ba4065fa07so6482e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790933681; cv=none;
        d=google.com; s=arc-20260327;
        b=JAy2SPPUrddeFefC9czNBcYPhJHVBftTzSYdjRB+NuzKX0bu+3v/+kB4frbDBnPo/Q
         1psVufg4+0H2NHcXKvH5MKMfzAuslr1LkM3mo1g3AkH/ntv1cvBEFPNspuvFXNYFpYvI
         svVqzXSfQUMW2qN9Dr1rAncIR1/1e57DeAPrryrvdkN+y4AAqYVOjKaSPeONdgsklGi8
         NZ6LyUSMHm5exDiMLPjw+6BoMZjCaUlJn051WoRBzojeqt7fPLUcJOMnE4BjGDw+sIDC
         74VR7PbqJj+chzoUVpYkwqQF4WNLAX1tGHOxvQFnzqeuafdnS2FAV1RG0Hco4W3Oqlzv
         frcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SuyjNGNTaeTrwozTD0DPhcs6tJEVH09iyMIGVlGNB8o=;
        fh=ZcAouS3bRdHHrh9IAAZOW6+nvXTJH3yVBnjMCOYr0oY=;
        b=CfYCz5ZUc603JBTaaHmZ577TvIscA2bcL4XTD3VLWPP2zD/iW3vkXxAI8nt3KVq+3M
         9w1ZgfFNXSwatBbnN1FaYW1vtXJWzrbjVqSyaU2QFuLWEBv6yblxLZKrGL4JBzCn1lQT
         FN8rZthpj49G7ZKq5TqUdQVk01r6KFjZUGz/Ro9qn9aZmkGywuXh8AgQoHLgioyHVLIK
         MdqGksPwhZIXYW23I0YGTlza9w1f3KzPRhs1bMC+tARH5YtTPzKwCDhDjQT7ZIE+fb/L
         Qb158OTCcE7phqrh09YWWHkqvMJe7oTkUIJ+2MDtKuhBdb62Rk+WrgBg2d1cYyYz6UWj
         adnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790933681; x=1791538481; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SuyjNGNTaeTrwozTD0DPhcs6tJEVH09iyMIGVlGNB8o=;
        b=IIzWGeXHJnn0tyiwGsH/4C+o7292keyCsnfo2f7BH+Q4sgPfVSQ+DgacTSXAoB3rv3
         yPNrp9KKi8bpMk+dFd81Ee42RU2u1ex1gpyA62ptSEFosK9wCxJ7ZRlCwnPyj20c6mrK
         Gs37FjrnozLLgtuOqDq9edLW2SDse04rbhX6jxGA8wn4iin2QDl+Gql+OgGVwjCAa7ho
         DhEfTowgkQg4UNwX9Y6tAcS9huNmtYORtPITbRzG73gWyey2K4I+yhlZ8I1Oe4yZ4UPC
         OX/m6Dc18IFOZbU9XXpGUoqWc/k/8tP/wSCN2zCmSZCovtr+orsrFtc2M0i5OmkPEfFc
         DSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933681; x=1791538481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SuyjNGNTaeTrwozTD0DPhcs6tJEVH09iyMIGVlGNB8o=;
        b=WHR8rm03to/U9dDpUQdKLLe1crrFIwO99JtbhDSug1QsXgE7HdLKxOCKaGbuT3wh3c
         iEUwuL7t7VDT4mV2ZsO18I1kzN60qbirWPw2W5MzceIMyqwx8otX/iJ43UVpygf+pFv9
         9VdJGTpGUWBnBhQp0xO9taQ/2XUL1xzLvb3tDmGFQo3LIS995HOrV2rdiaC1DN3PW2yq
         cq3DlBWz3JXGIsmJwwokOxARK2YCOytBEjT38PBRUsctDxrmzPhwYL5IsEnljMXE6t/G
         N9V5eRAcr1kjIWjVwxbIRlXgcuTtfbARW06AoIYrpgVew2zHuhq2Pyq49oV+J6CTdpoH
         gVZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpEU2SE6FwTdsbbSX5jNE1bkxypkYmEekeX8Tfg/YvwkE87BgaJ55Z4z5h8e6qQoAo41Qmqg9+XOus1uwjWwTL@lists.infradead.org
X-Gm-Message-State: AFq9FYKtM033M9jTl12dX7Axs3Lzfy5t7y5t7S9BhN9L2YhCslpuxPXj
	J5XRkkmTePLrNTld1ULkcGUyA73ZyR+DYOIe/hq/lyf1I5HpBs1Ju6QerSchNH0RZ+r8hbQKJzE
	kZONGgcQVDub9ISwwtE2iJ5WQ/b7LUbbgRdIyRnH3
X-Gm-Gg: AYBFou0+bmbLBnfFVm8GR1YuhhjD/ATFzz4BMlcbEO3B37J5aBttSobjjjLk4mjlcQO
	wkrbN14NDlO3/RT1cQISbezrzMm7jJB5q6xtKuP+S1aULjkRh5QNLXQ+mJTpJX/K41WjSMh5K6q
	vYSweHBheHWNA6u8LqRdmGk0isWRUWfSfdwegHgWr51FqBsx22uZ4gUAu8hsBpZHgothhnQv1C1
	+J3uD29O5ntHjgT2TT18xoEWKKJmeoBxuMeMqoYyAA9Ru7/hGIyVJ0cdg72b5yhXHrnwmhMDWm6
	Sw3D9eF33LTJHUc/J2O5WfIs72Bp9X17wKfUdaf3M323TT5LzzPlWfohwSseFSzTCxSsVnaS765
	vfVQebhf1iYiTWw==
X-Received: by 2002:a05:6512:6d1:b0:5b8:f20b:350c with SMTP id
 2adb3069b0e04-5bb7c948658mr120571e87.3.1790933680638; Fri, 02 Oct 2026
 02:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-19-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-19-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 10:34:03 +0100
X-Gm-Features: AclHuK90hdLcclI22eF8PMzgsUup2Pu-fPsPyAyT7zN-k3WxhBppCUIye56E7qo
Message-ID: <CA+EHjTyyKxW2TT9XpjSDkdjWEuGyWmA_isDpOnoyri8ikxZN4A@mail.gmail.com>
Subject: Re: [PATCH v21 18/23] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_023443_222897_58BDAEAF 
X-CRM114-Status: UNSURE (   8.80  )
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

Hi Suzuki,

On Thu, 01 Oct 2026 22:06:58 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> +static inline bool kvm_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
[...]
> +       r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +       if (WARN_ON_ONCE(r < 0))
> +               return false;

The fix [1] is in -rc5, so a rebase conflicts here. Please make sure
to carry it into this copy, i.e., a plain "if (r < 0)".

With that:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914093838.1082637-1-fuad.tabba@linux.dev/

