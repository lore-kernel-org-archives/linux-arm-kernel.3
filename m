Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9414AC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KujuDXjufsH4fQ0xRNZyj2JY4LmTzir+J1KJ4jS+lJA=; b=hOdeE2X1z7W4UJEDexJTJEqUZE
	j2cNWjaAKqOET7BTkGiBEx47BnuKWlwwJCF5yEEd5NO/GXx/xQ42J4p1QB5bJI3qIX0Dy4yQX1o5V
	QBYLIKw73giqIuqDb/ZH5KX9FKsHE8ubor0bNPPFzl+TGeYWArwsc6qtXMGELxiIahWcHd++13Uvd
	ZAoXWDTE0j9+bEjoV0gL4RaYankv1Q8HGACJlKEJlT2Mi5/uUGxjlEpHcr1XgbiQLjEPzGf+HdI7A
	mc+0aWwECtnGy4hhZo8ndzJ4oASSy53uWOQSnvtNtnDvaKfuz4ssY4FEo2yfmVs5XbluPaCvUVNAL
	pr19A7Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtYY7-0000000CyPM-0dTQ;
	Mon, 10 Aug 2026 22:32:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtYY4-0000000CyOr-2pNS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 22:32:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4956869750eso15681615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 15:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786401167; x=1787005967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KujuDXjufsH4fQ0xRNZyj2JY4LmTzir+J1KJ4jS+lJA=;
        b=AubdGc4sF40PKBpFy4QJjWdQYbWHOnmgoSSY2FBjaVeujHWezdDxN6t0lqEvLWB3cJ
         ScrwISyf0FrD6W+KuF1xmgf4CimXx9CNYFIi08I/Snq/XqGYmw9lyj8pYbR9K5gLMJ7h
         tkL6K3z8Zwwy91eZK9mXse0BB/Ko1thZvkmGt1e0Ouskzua5GIoh77yFOWJyjoLnqK2K
         qqDrZXXQCVBOsgDl4U6D3Ol8DwPtvF5LwBZ4lnrhhBVcUzZpbVfwm+vzrteTYUYlicL7
         sJKUhT9DFVeLlOjJPKPlkDXLpWnCsO6+2LqcBzxJIdloLL5kWl6bmpvhrGqdL45E7KaD
         ke2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786401167; x=1787005967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KujuDXjufsH4fQ0xRNZyj2JY4LmTzir+J1KJ4jS+lJA=;
        b=UvvKMB78Yi2/P+t/JCn1GHkG+NagCzp2dgjBzV3kgYeCsWn9wWuBfdewnmW6XEXUWz
         wyZ8+edRDdwuvn+JyKh8DPu5JkNB0zSsqFRhaWtfFsmVOcyzSWO02TBYHJiSs5RbTove
         xuiChgTKoINVeSl4rS3ZHcbvYGEiaUoxLSPTd8HMMPqWEH54DmDKkBogtH06126ePEmM
         FnG0iGoszL7KqYZNeXx/bjcvxccT8tit813OBx9EC7b7StolGf1ndsvv2L+Dt5uhMqql
         n4/ySjWsEK0fSeDj3wh/TQNdPIm6XbAvwkCgox9yc03fVSUQg3xfhecwUA3vm5CMPS/j
         ebwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJ9xizQdSVekOrwDjwZv+OIWtEDn2XdCeOrXnLIhy/qY//VQ5BptL8HxdDMo5g7bsllfnTxWT9aqZB5AZs0QKl@lists.infradead.org
X-Gm-Message-State: AOJu0YxkybCsFpvMm/I3ooJHc6t+vTOvrESOwOQYNySOyZYLBD9zvnPZ
	sWPCG0l9KZjmmjekEM2YpDD4vRMoIz7ThAT0o7rpJL5jArgcTIMXGIaR
X-Gm-Gg: AR+sD10IYAO6CJzeSS4MkyoY6znbw3XrTectapXtCKMdEvY8hL0iXC2oXQVvSYQDtlC
	s5fZ5TORtirr1vSMNVc6zBOZc9VsgdepQDyZ0u83cDp6QuZKx/N3d94ii7RoOre0Wap97imCL7P
	JgMD5M+h/1urEBGZAutNoFuCRh6mh8b/Ndr5vSYRwgqq1VYwLWgXAnF2HzpSZacESsSBEDY74A4
	7SPOpemPPuSslT3wqVwSZheFrJAKYjUjc3ssYDqC6r5SwpvwODQUSSk8YqDIeGY71Zh+nOXR67A
	+vl5vdIW5uvcRDADGZtX6W9kCKLf5zzEZI3PIOwZ5VpAzuHf7vvk8HQpQENKzeUOo6LPKQktuxP
	9NaviEdjCd9jj/ILk3eNiw4eNhYaYXyqOPkB+nw9ublBny+/45cfKKJ51S9uvnpuzcbtD3EVORp
	ZEFDBBMD0M+sKNO7RdHJ9zsWpIs50ETZZgPDTGAFeNh6ZsF5kL3vCUmUeLgz1svh5q0Qms7SF+A
	3rV9FUv/girCQcgzP/AwE+LNrnYo4ZLtmbyTGnL2mt2XUGqFLS4ToLOwCrHTxY2a0hxcV080Oyb
	KEhs4ouPzS8FE+3OFw+PpVvHqaXo1+n/xtLCsMe6wghcevwLDVFPs5oWIIknDfW76iYOwiE=
X-Received: by 2002:a05:600c:8b17:b0:499:726c:50e with SMTP id 5b1f17b1804b1-499727b1011mr49652125e9.14.1786401166552;
        Mon, 10 Aug 2026 15:32:46 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a1e8-7401-316d-6c00-7a9a-8fac.310.pool.telefonica.de. [2a02:3100:a1e8:7401:316d:6c00:7a9a:8fac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995d85254asm153382245e9.1.2026.08.10.15.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 15:32:45 -0700 (PDT)
Date: Tue, 11 Aug 2026 00:32:44 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: nv: Allocate the shadow S2 MMUs
 individually
Message-ID: <anpRMrGG_54yO6CL@gmail.com>
References: <20260803224405.41468-1-kmehltretter@gmail.com>
 <86mrv2arf2.wl-maz@kernel.org>
 <anYNTW2e3HalTqTk@gmail.com>
 <878q6fplpd.wl-maz@kernel.org>
 <anizGXThM-haqQXU@gmail.com>
 <86v79i9zl7.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86v79i9zl7.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_153248_723801_5E35E5A3 
X-CRM114-Status: GOOD (  12.36  )
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

On Mon, Aug 10, 2026 at 08:58:12AM +0100, Marc Zyngier wrote:
> > The increment expression of the for loop still runs after an error.
> 
> Yup. Should be fixed with

> +		for (i = 0; !ret && i < S2_MMU_PER_VCPU; i++) {
>  			ret = init_nested_s2_mmu(kvm, &tmp[i]);
> +			if (ret)
> +				break;
> +		}

Yes, that fixes the cleanup issue. I have no other concerns with the patch.

Thanks,
Karl

