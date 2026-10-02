Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F920CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2aHjvSPxe+vAP9qLitaZl/l2SuTqD1rpV9O3EUjP1g=; b=fsewbYOl320IGpD3ti1XWcl+KT
	J4ONLBK2UhkosTH2ceR8sK0ahEP0qOCE5gNzuj8DuprNdLbx0r6fWIjbGi7beKhW+hqBl96hSrJuK
	YycjXwNdld455xLE5BCxwMKFOZoDTc12ARsIuEKjwTAYM72zp+CLYvFNisaldma/sQpOhBIGFjQOh
	JKpsbW1XELp97SsQ0BFx8aZE9emh/OjzfpiVILwh8FaYTAbjjnJIvASSxZ4GWKdWBFu27KtqderZF
	IgwprUSCys0Rscf+yUUpME9gsTRCpv2bnnRACNRdQG2O+ZndFRnu4I20Qbb6sJNURtZPAeKrn8w6s
	84prYMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaAu-0000000BG5l-2sUV;
	Fri, 02 Oct 2026 10:07:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaAt-0000000BG4l-0Kd2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:07:32 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so4762e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935649; cv=none;
        d=google.com; s=arc-20260327;
        b=DfePUsodpoRTzGaPY1kcS2EFcg6xgzQVvqYpWAQGzCp3YOPnUfHHloTYOPtexYzIS7
         SiVItQxw8zLebigUSpdIhMA39mHkyRkKwxWoOuMzz/O0X8mSBKsMbYXuFkt9fjooPKex
         TWoA1y3S+g9ojuFktNUC6kEypb4rgTRQw7mvBK6OYMO653AFS3PrsgLheWhHgAY8Y1cy
         Wh+h/i741KkKPniXnN83MzYWPa4butXSzYMBXC+MVlvDtp4b2EdSrDM/7ETSzgUGJUpu
         ObKliDSlcfgJzj2o5C9cxuPXVWWmXMYvYkaf5ePzrDnmBY1ufxHMZ802k3n3QeVRBRS+
         X1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W2aHjvSPxe+vAP9qLitaZl/l2SuTqD1rpV9O3EUjP1g=;
        fh=BMdtDvW+2/rVObfFatFcFGcrK1nxgkVRacK2vYqGkVo=;
        b=heLFbrzmjoUZYHBXAgPP+BN9EhkOEP/w9jIrEKziWXuG0TgDGXs5rgPksbjqpQWLS4
         Gq08H8KuKtfN5ilMqTaU/GXcZsYrMVJUo2ddNka6dZWRRvXEPmJvT4N/x/lbrE0gVq+2
         LqfnYRdfc8wGC7dJ4mcSW0S8k8sXvbrQU87nFFpM2YULr1WQqL0mc8d58rwcxwSrmAVf
         6jYXuJCt+XQIChRDPDjQNnnDU3fT7MDa+uWv+0areZ8Nw7wAwXbj/N+GX5QKhKhyRTqj
         vFbWYyvhJhOtSfTLHQlHciPvbWuttZmWv+sbIePMsW+eQEr4fKfvc2d8R8REKVletOfh
         QYkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790935649; x=1791540449; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2aHjvSPxe+vAP9qLitaZl/l2SuTqD1rpV9O3EUjP1g=;
        b=ZrzoTAg52Gg9C7bU5CQ2Dt61KuzV4DfQh1qCL0TrYiqdyOy2TNy50p9Uvr6cHa3qPm
         s25v1nmXSxnSvoE761idljDvzQ9gSGv1oaUbIL/IQ5H9r0W8SpUrBdBc8LXrMlABJFGQ
         CGjLOgHAHq6BKY7f+UIpAh+r5zuZAuGWQzT7wcQQu1fWpmU83YsBfkpXdiW+dbpotazQ
         dAutHsJIsIRuV2tZGMRUoGtPQh0puzVQCTVc8knRow8B9kTMAYTFdSwXnzPKNR/nCC/X
         AGI/7wY5qcPm4rcKMqB3WPUWvVE/TAEPj77yAYtxvSh7PnzfTOkipG3yXiwWTBrd2Olu
         GOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935649; x=1791540449;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W2aHjvSPxe+vAP9qLitaZl/l2SuTqD1rpV9O3EUjP1g=;
        b=sKPcCW3iNgfkCYtwWITX6jD7ECW3di0B8iTxZ8KzLviosrfCzCTvC2vif8t8rr3twi
         PoXlAJY/EBJfwDOlYsnIyyIvF8OdBp9uCavK3RIV7Lh+PqjRwVi0XIh3h9IFfXaTe5Nf
         X8F1pv/HCTlNs79fxL+wwlO/dtDKhBXFgJL6cpSNlahgQqnptXc1h25uJtGot+RjhPlF
         SjDDKBBKqnfBikXZwjl4NnBTl1xq7QIJUs3BtgBYmPvOFna05cCkvMQR7Uwky7B3qaON
         y2DCplBHBBWNH6AbxJFClvc2S+/7lPovfAaDxQd1MzaW6hndOxs2nST6H4fImsSjjrLX
         f22Q==
X-Forwarded-Encrypted: i=1; AKwUvBxp8GISlWU/u4NtcIywQCBAwTnvWKdQWwUquM/zBGrH3hO9WWeH0Y3VD53q5NYNNecmtFCeqwrD/3XquXHZETYZ@lists.infradead.org
X-Gm-Message-State: AFq9FYLIzGEzPFfservhCer4nayJsz5luTjjDWe7PjIm6a97o9sma089
	JB+D1StyWxw3FwxHj0tC4oXJTK81JGXtjm6w5IZjIYPwC0h0T6NfAe+h93wdT7OEt44A6vGAJX7
	+gJBi07FyptUmLfKBMVgnZIu6qehgcyHDhH+hWG6w
X-Gm-Gg: AYBFou1H3rhW97eDuMhrNQYAa3WGvDAhyigMvheQbDga+HN1ELS1FDlhI4zrMgAnFt+
	N2IHAhqG+PTa/E57VDlHQPNKetBdVKh7I7FhA23pA/cHr2Pa0BlcFl4VHiumqP9M+RwdFM42mC7
	2ogLamXuo9gR2pgd+BnLdAZ7sbrpQKuZaiieMBeIX9fL9b1kD/zKzuq1n9boHhS8n2/KVX9oUZa
	642m64WCNquUj4p0yBQdSHuF/gvxiScsFdSiZVmlJlwib/bBm03wqzFaeJ+EtaBmwvVQJo1saNA
	Ff7aOIET3Ns9d/S49OVpfFp5hvFRqD34u4nK6xdrNEJmieUIrkO3dyXrL8skTL/fxqNQHlJdl7x
	wJlE/8MNIkdH4xA==
X-Received: by 2002:a05:6512:3b26:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5bb7c91a8a0mr135912e87.2.1790935648531; Fri, 02 Oct 2026
 03:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-6-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-6-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 11:06:52 +0100
X-Gm-Features: AclHuK9UDCM_CxoGcsAnKo4MTwuWCAngd_IrvUFvtXNGuqDBjBBZg_tfUnO_TY0
Message-ID: <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
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
X-CRM114-CacheID: sfid-20261002_030731_136725_01ABBCDE 
X-CRM114-Status: UNSURE (   8.64  )
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

On Thu, 01 Oct 2026 22:06:45 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> +#define vcpu_is_protected(vcpu)                                                \
[...]
> +                        if (is_nvhe_hyp_code() &&                        \
> +                            !is_protected_kvm_enabled())                 \
> +                                __kvm = kern_hyp_va(__kvm);                 \

On a non-pKVM nVHE host, the hyp callers of this in switch.c and
timer-sr.c now translate vcpu->kvm and load vm_flavor on every guest
entry and exit, where the is_protected_kvm_enabled() check used to
short-circuit. Could they use vcpu_is_protected_pkvm(), and drop the
kern_hyp_va() here?

With that:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

