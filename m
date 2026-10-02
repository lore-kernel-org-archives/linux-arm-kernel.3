Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853BCCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWVQCSwR0aUoymLEu54Qp5SBrR33qbmFDxb/OCitD2E=; b=2canJr4IOzKoYrgA11VmAxGtcy
	CuzrZsa4AwrBQZOKj1gCQqYSnBl/1yaPBTSl0PHYAukXGyXf+gy4pHqcRytFRhfoUbT25hl3gAGWO
	WMuSrttgKwrHJuS5QYwcvHTA4p6I5iYZzsF30i6dPo8qc1gzbgOM4Brzz/3+ocx2OOvsXa5iLEJv8
	40zGdhIyAgR03onRCKJAjFmNIVMB0rWRNRiOHtnsFBp6a0LNvJvSMpHa3UOVSfasUe/i1wxUX2ZBo
	X02fkz+S7om4lWWjxBlkLGQOm6Xunk5bZdkdJD812Kl+mG4imF1QfeiWDCXODKzO5Avh8FgEhv7zh
	6fH2Z1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaNb-0000000BI7j-2Kn4;
	Fri, 02 Oct 2026 10:20:39 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaNY-0000000BI7L-2r94
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:20:38 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5ba4065fa07so6732e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790936434; cv=none;
        d=google.com; s=arc-20260327;
        b=F+odlX9HhWZrJao6CpSEX8SIDrywOijaIXVj2ltmW4erabPIskFpz51mzBdDEK8Eaa
         1ntXm88J69m/P+PB4j4pzwooL1jsCu9Hy6X9kxc+TAM4i+9lUdwdCWrB/lvi68Vkv0z8
         5eEyou208AtjrbkEO3k0beoGCWJ4GGckKrKqNJIRCDhIxmo3V9QW+/d/UaQjkaUUxNyI
         9vk3LiM95I/RTSQ6SpIehGOXZsT4TlmhqEegs5KNJ4LoUiRmJx+x9IfVdIwueD6l+Qi/
         XtbUj+4rE2THF9HPVe6R4zK8xBU7/Ugcx0YTD9DcOVIpjUMPk0hvCKwoUZv3TJ0YE7kz
         Fj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AWVQCSwR0aUoymLEu54Qp5SBrR33qbmFDxb/OCitD2E=;
        fh=ifxlCql/pBdmVMppZ+W1OWCIwbEkv83Tg85oaPA0mLg=;
        b=VOb5/NBf10VN33ZPpV0YIDqzmAluHb7zdnCKRkfVqpNL8LSrQikgcsMbC/xqYcSeyu
         lacA3mjEjj5hIRpFKGaHyB9kF7p8goplqJcpauDJYAnSCkSxqlqkpMcADxuufXQRchS/
         BnKlXrNQc2QwnrcGL3TVKUyTwVRuvTz2mPGmNb5XwMEQPvXauW5GdS1jyaCVV6qgqYqr
         GpIDSo1U0qwkXvBi9+M+aNDwmd+UKkUvMxlbqgD0+FVYvkIY6FCOy9dTeA9q6PHni01a
         NkKoP1FV7be2bO0PWU/4Xe4It7S3F9sYfNN0HMpkP5+WSRu3nf0t+AvzuYTRMmgxZtH3
         vVmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790936434; x=1791541234; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWVQCSwR0aUoymLEu54Qp5SBrR33qbmFDxb/OCitD2E=;
        b=XkuT6knGvZ97vRblW8rU8Rnil7guijQtNVNZQXJ6rqz+W5gZtUZmiEY787hOpatt/q
         t98/N1ruxuWl9gf0FBVKnJaUt+f0BogLH4Jsr7dGo6GYib1yY9YQHmG/7JcberCCDrOj
         sSPrSnMsGfCE8RbRMwWNVIuA0aHXKCxT6x7zRy3NCyyYwRcUTOZQfsuLC9eZ5BUq3qBs
         isIjZNtZAlGydQuZUjGy73mHQTcWK9wDGdaBFwC3221Jb8Mar1TKu/4E/PwdDA7LYqUx
         3pmPYTg874OhFFe1ozIsvHTx8AVbMh9yktLg7Qk9/Z2WsJWWdt1/q+MndWpz9pNj1laM
         sGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936434; x=1791541234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AWVQCSwR0aUoymLEu54Qp5SBrR33qbmFDxb/OCitD2E=;
        b=apcFVLxeMqOAETyUAyKIpEHEGSwTJrxXnwafKSW9QdWhwTttHJXddB/eq+mFRs+vjq
         FwUiyzHhGQU4KTi1Hm+KNZkhimFcQTqupPQYPrhKUSKLC2dpSlofYW24q9D9TRrBuETU
         08wcPPiezq0q5EpXqFfZEgcM48ADpmMMuWHYNBkpmGg56epB/a3FRjveQ0N5ymXKu7vV
         PKaK0miOlI7PwAH8GPIAab340xeS0qflKM1lBUIBoUjEog1ZWI9iYPI6KmVFJI/E4/WJ
         +M6I6BgWntKXt5ronF9XGFcQDwtSL/mf5A5WLTTp83GvGmH955lVSbsMIEVvv9IhHuks
         VhOA==
X-Forwarded-Encrypted: i=1; AKwUvBwVD1nBf68VC2B4Efyyt9D9vb53jZ+lGm9t8oHKsgqy/2PeLeZhy0kEHuQovuD+uHBQ50PzWz3Gl3LeNpn2g2NJ@lists.infradead.org
X-Gm-Message-State: AFq9FYKwxFdi40j1K3LVOYQo4BvV43iX1AKJf42407OJrzHWOJeqPv1x
	2IX57Yer8vR6U50nBD9x/o7rl/p1lEBKZMxc6eQprt+tYUbCFUTS9vzhojUg8ARtXRKeWXdPOjW
	qFYYtGIc8PaQ7By39x2xL/Oe7zHRPUSMc26xHsX1p
X-Gm-Gg: AYBFou2ThRCCf88GFD102/TMNqCLjesh2dV0WxdV00Dv+n8i9tq7Aq5idEr6dyD9ZVD
	Irl15Hn1eNdXFaD9Kgq7CNdjZLBunD7SSfXwqUOn2BpNwd/FnjRpieN87fs6/KGrM6IG3JUsRTM
	mjtbpW4X9Nz7nvlIECCPs61SwisIzHz+YA3xFri18HtCWnEe6Ha5qgMJrXUjAgumY6nK/OuwF1s
	OlY8fgSsJ9DvgeQQ83ct3SbuwmfgUlmXg7Ze+7TdUziI66CJb2hnd9XcSat16qge4Tf3tHeKKb7
	hj5inRvzuYdZqM900qUQRQxjewiweg8PahEc9ehIW72NoK06gJZ6x2NVe1go5YBQY9YW7ki6mht
	d5oWU9jFrcT42SuS7Z+Ww9Fd7
X-Received: by 2002:a05:6512:1c9:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5bbe0806600mr67600e87.12.1790936433781; Fri, 02 Oct 2026
 03:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-11-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-11-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 11:19:57 +0100
X-Gm-Features: AclHuK9rOT56mg_GDAS-UKmKKcU8gCHcSak7k76HWhpeBX7f_dB7iE1PChHGrcQ
Message-ID: <CA+EHjTxCfmOqiJzYDZHunSuEyoZCbgHuzeSYC8y71Re+9PA6Kw@mail.gmail.com>
Subject: Re: [PATCH v21 10/23] KVM: arm64: Add VM specific callback for S2 MMU operations
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
X-CRM114-CacheID: sfid-20261002_032037_041270_1AE745E9 
X-CRM114-Status: GOOD (  10.35  )
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

On Thu, 01 Oct 2026 22:06:50 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.

The rows only differ where the base already branches (the pKVM TLB
flushes, the protected VM age and unmap, and from patch 12 its abort),
so the case for the table rests on the Realm row, which isn't
functional until the RMI backend lands. Beyond the flushes in patch
16, which operations do you expect it to override?

[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
>  int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
[...]
> +       if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
> +               return 1;

Every row sets it today, but returning 1 falls back to
KVM_REQ_TLB_FLUSH, which arm64 doesn't handle, so nothing would be
flushed. Could vm_flush_remote_tlbs be mandatory, checked in
kvm_vm_init_vm_s2_ops()?

Cheers,
/fuad

