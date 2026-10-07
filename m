Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89955CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=; b=3ZI/MBQYH4y0nWY2hA6zP3Dour
	bWrsBiBCbKbrQ5OVO7HUjDbomDK34hmI6hxXMng9+396hqqdYlE4Fvrse1GPmhzyP6RCqaIp/VzhD
	doUzoZhA6Wl39PDLOyOCY6REw00BgaCMddVglH0HHpaVcm9Azg2VbHngh6lgOWDJWbozsZ1q+uKwW
	Ralg78PydacfxHDNNra6mzfNQMj3ct2GxFcxl92aAm0X/GplaIqeR6bZlDczrpIOCOfYvSa3/ZNZ3
	Euhj2TpSX1r8/6H9RZXC+7hKgRK5wcDg/QuMw38y8wMn2nr+m2RL5c34U4JkVt5JnHWA3TbjWlKUk
	TTJJiISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPaW-00000002HbX-0ZAS;
	Wed, 07 Oct 2026 11:13:32 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPaT-00000002Hb5-16zg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:13:30 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so7590e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371607; cv=none;
        d=google.com; s=arc-20260327;
        b=HW5YJ02JE+N4yzADkfh7K7420buIjf040XIwcmYCU7mGSbbeVjjbibf3ZR/P9SWzuL
         L97JoO2UR/Qo8OAEpsWwUKfJUn95YERz5Fsr3j8Kh5tqr5f7mc2Jg/BOhhceqUCWfqoa
         Bxfur1xfdto+6sX7Zi8dsXtBQNjXl+MzQI5lVtCt7PUgv4W6Sj42+GRvqHZFHGpIu57W
         kN5VeFTtfQqqy0TXlSeIW7Qr6xA45QyybVJNhTJw315qlIcRbcrhOGJPHflaHQ22T+4E
         KV4u3UFv5GzgG/3nW6xI2a39d9tdYfcREczpONW+108PT/6xqG/kSe6ZDOqCK3qvoGQK
         K83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
        fh=rMvd/KgNTTIGP//vPpaUS5akYZ7vvBcrR0VEtnfYVsY=;
        b=Wj4n8lefgUaYO7lBZfpxu1FAuGnWSdZ92S1L7JoSkLVW/+sbTW7a5bX8IN3iGN4JJK
         j7ieYqvP8P3FGDZ7v9Opzb7bguETXCEH1ed8k7yAKA86qx8NiQS7e/2bMJbVmVPQhpZY
         MpB2rFY8ai9q25CIfy0yOlSaJtgY0GtKaBxCIlNpjqgZc5ZzZfYUGtaAcLwdKlfkH9FJ
         hbNaIUdHKU9KJ4uNS9XZPBRY2Hr/3hmpQNcjSqglAjWStG4hxfF0UOGT58Xj21lGStcY
         HqJstwi0I15Mzsn/y+A7EWscOYPV8uUtjcpLJ5k9Krr9UseylxxteTXNnzIOUM0HbuOH
         M9sw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791371607; x=1791976407; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
        b=rITkf6tdhncfOo3BjEX3cXDeMWrDbdQ3OLGY6UZFPh/bKld4VeUV7rkDNX38ZLsXHN
         YrLvXgBQxYoVAxr2KyE/dRsAnxqvESoVM7l25U5GWxO/gIuF2tfHqK207dDvq0UKcS0M
         Gk0E9XZgdz+3XWrABkvBbVHYPGVYZ5lUHs5m4yjr8rqFEB95gzXSq33pCBJmtm9G7JaL
         hNgNrkmyVWO3QwBP6GjPUPt9LOwpEHR2tpT63BMBZhBHzfUcjc3+rpcav4Du8ozkQGh1
         q+AVOBx7PQWrq5JS+QLZXd01yywLHZSIJVQls7BfJbVgzWtwaFvqiI01yOPjXtIq03Tx
         QZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371607; x=1791976407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f+RisWKCQLZOEfrvNgEfr/uIKD0wCzcM3ghzQdvYe+U=;
        b=KXQG1t5msDMptD5B9SFaDQ0c+oGGltNzWYyM775fF461xelg+k1CFCaj+o5g2yNgTN
         mmnJHSTUqxXsFTeDDRuXiKIkPzFRT+F3/Eu+/auMzhfvq278nO2NqHntfhzOPxbfoJ0Y
         c67ak9M6LmpeGwzdKegubQOzbVnCuDzGLi7P1dAMnV9lIlJflohVj4uy/ZR9Tm+A+Vvj
         MZLcJT4Luz5RDyMI71PcLx/f21Q522oYjWA3eMi2hbnmRwC/1XNYk03yfLM+D+xkmzRv
         /51kvx7iKmbuUlNQNh9Ew9MwmNXwOzg4joPvOcxW2nyfMc7ZAp4tR8pOF7W/bG6Ag8/e
         JEVA==
X-Forwarded-Encrypted: i=1; AKwUvBytco0b99G2n3N7/dR7FlY0WE89CcaIPrGaIp9xq00F7ISxb02AB0TMMuWqlDWqSS7Kjnlx1afqXn55/C2QqgyS@lists.infradead.org
X-Gm-Message-State: AFq9FYKKNkMCZbQ0Of0iQKfUmjZgFI80z0lRaoxvViYp77fxAd0mhgRc
	gM35KQa4yoLaPe3RO/82bAF4F7La80KGoXVJv2us0kBIUnk+rtTfZh0FqZxOmWIfp8zUNDry0hW
	IKLhKuYPoLOJlQCa1mbeT+2njWSv7UhESujTXsttn
X-Gm-Gg: AYBFou1H4sbPKnfeOMptl7KIoFtWL12ycrEDqyVFJYInSiHXuFbuIfbEtS7azPEsMKK
	vmjbJ7I6wLJRRBAzAYUNugXnb8oX1RGG+TEQ7L1wirtaTNwhYYnlRwzyGjYcYZAt+/W2qyOjMQ8
	FMUFO4RZ3EFfWYpA8fZnmkT4MRuMBFU1hd+ztXaeevzKvuVIIzn5saJldYpueBQGeFEOaQmG6HW
	sFv7LygLlu4Tvk+FQ1HoaTFfEChDEsafSf8aUPne44dbSXkjAgYmxRF/EK4ugucZLGgpdVPAuuq
	W5Bg4kz+/DwQSgq6Fwhor5goFHnLQ4VLeYKeK4cub7siNxx46k45p/MbpaNaRl4C6g==
X-Received: by 2002:a05:6512:135b:b0:5b8:f142:cf3 with SMTP id
 2adb3069b0e04-5bcca65b3acmr273089e87.11.1791371606791; Wed, 07 Oct 2026
 04:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-8-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-8-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:12:50 +0200
X-Gm-Features: AclHuK8WLpu77qQsvdg4MDduFoR68Hrl6zUyd6Su64I0GC1JFRH6-dZAB7pnQNs
Message-ID: <CA+EHjTy2WuCui_O8sYXviCmgLQfZ-j-jOBQqRY9NOXzMGQ5k+Q@mail.gmail.com>
Subject: Re: [PATCH v23 07/14] KVM: arm64: Refactor the vcpu_load to allow for
 VM specific callbacks
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
X-CRM114-CacheID: sfid-20261007_041329_358354_F6F02984 
X-CRM114-Status: GOOD (  11.91  )
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

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> To keep the VCPU load/put handling cleaner with the different kinds of VM
> types, we are about to introduce VM specific callbacks to do just the right
> thing. In preparation for that, make some refactoring to add the change
> easier by mainly feature specific configurations to individual wrappers,
> so that different callbacks could reuse the helpers.
>
> Adds vcpu_prepare_mmu()/vcpu_put_mmu() wrappers to load/put MMU related
> configurations for !pKVM guests. Additionally makes it explicit that
> kvm_arm_vmid_clear_active() is not required for pKVM host.
>
> Add vcpu_load_pvtime(), vcpu_set_wfx_traps() wrappers for handling the
> corresponding configurations.
>
> While at it, also make it clear that the timer loading constraints only
> apply for the VHE.
>
> No functional changes intended. Based on a work by Marc Zyngier.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

