Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5BDC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoCA45LQ4z+3BUUhv5YOm84o93I32Yjtpc3HcvkQ194=; b=KdYvZYiD4F1RGH9NBxNBnTkK5l
	ICca0K7wmnzkncWHJYhBexYACyWTewMzB2zlxkq61OuQZu1zynS3DXM92/6fz/8ZKEwuLlfFSekZN
	zAt3w31DWJJXUsRF5LmhY0nndaijoulSU7kHO6rBSNiauhoGjRnxt6aN8jeCj9PjKIAmignfegTns
	bIoPiAniEfvMFNEXGuKVyb4GSBsDeQP6+GTb3lBiEjruzT4f4j2QXiRmMft2uw80qBZnKuyH23zZK
	pca0Pjf4Zoz/Xd46dYvSiFPcpOMsX0X7/tfxTuBW/f/IPlAcmrp6e5PXl7N6wDRIDoSLr13TKx1+c
	pe/jtaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt809-0000000AZRf-2Eek;
	Sun, 09 Aug 2026 18:12:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt806-0000000AZR1-1kZZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 18:11:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-476a130c138so1110754f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 11:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786299116; x=1786903916; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WoCA45LQ4z+3BUUhv5YOm84o93I32Yjtpc3HcvkQ194=;
        b=QdgXcNrjg7Bc1SI+OSqRfchAWZA4DW4E2vMObTDQXhetS103Jv9XtuZ4dfI+w1Bl2u
         8aDtjLy7b/oQpE0zoQRGM7H0tQyqjT3wIwVKmAe9017bqdLbxuS1h/8Kf44G3vtJwusZ
         NILEjjbMUts3yjYbUP2On3Epih2Ph+reo1juBLFYZJq+Zn6MacBfzba9mlaOHAJ0nZ6P
         YZ2GLNlrWZAuMHESAUurSJKbMLZMnYdyneyLEYwi/PjklUV0MeGPFoINBIUy/6IPYZiF
         UYWcCuPFIbJG6PWtg2uUe4zMWCcdhxlA5ln12YgILh3sAiN8dO7Zi0CER8cwjCIa8w3G
         1ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786299116; x=1786903916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoCA45LQ4z+3BUUhv5YOm84o93I32Yjtpc3HcvkQ194=;
        b=PBdn8YiPmdnvsnMUJ0frEOKrtrtEiP17AoMeIRIq0SWlbUwqkaGg90YjBv9i7C+QYS
         nVEkDdTZTvteYt9r3OIElnhOhzSVXQJWcvuiT26waB/kWO4C3Cp2kpxfEsgyf+/UEalh
         LNfnhUn+/HrWl7ffMbbGHDIowDMmyfp+Jxt2AdWAS8P9X3yLK3NZ/5vbcIPQj15DKE8Q
         vRCfGGgcGBm29U2ccTi2mypaHtYsxVWdson9s+sJxZhA+5A48tMn4SrWkfBTyn1yTYOp
         W3JlynDp6n+/C8BvY3XqEhys60e7Ml7dddJTxSoiDUPC7EhHwd/TJZt+BdcsnDcGnB1L
         1bSg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6/CA7ao2xy8XDDzoSNWUdCUat0vlvLEg/sAz8tQZsHJmf0m5GbyZeJYE0/CVk1dT7u3q+hBeBwCiudqxi6Gol@lists.infradead.org
X-Gm-Message-State: AOJu0YxENF2WIL5AKYXLuIkntKmOoU8AyiAhqoJ+g35aorczJOj0+hE7
	UjqE7LikAizt2z6woNpO4SHnqDBVP6xc6SLW32pvwe+xU57YsuCbt+Gru9zGxxoS
X-Gm-Gg: AR+sD10DMubauoboBNey1D/+lBGBOLbk0QDZOvuK4xb98lp0RDu6FaqOqM+jg1v6MpJ
	ALHasDRX9sb9Gd//LdwCujU0xInLSuWHLVJtKDJoSoMESHHSI17Hz1osboOG0amuLITiKnTZAaI
	epGzz5S9b1dHHP0jMAB57zPFahFgOFc5ugX2jZPIdQm/pVDfcCzQBX7ddxgUyFAXBJ4eNqMb5CN
	cJgn6OzCqsKig79+0IXJ57CLFCfVgkSyTxc4Uyd6RZJ9xKISQlfnDHg9wu1FvrSf0t5AATyEkpo
	MMpiFqmO0826jWsglbKuuJe5mqB1JW7vbUxWJzWKouGqM+Ug/SFqNsEcDJ4HkrSc2mQ8VJvWMg/
	W5U2BF0buQ0jJmJD0cYn40SYCbutJ3si/hoqE1tPTbgUe8bJSztL6zGjpq62MsJMJVDTmghNjht
	oyExIdeONWL5xqVEGF3iqs/0CbrKbe9e8vDEt4SA7gbFJA2lXxYGcdycYeJFS01IQKpuDiEtRqI
	6vY8fwOa8h064jvWQaHZrhZzsZQ1SLSU0MvY1RKVVxkI6zbkdPL9BSVb9StGYspEzAFgaKdTI+/
	Q1IMR683Pji6fQlyQq+pH3KUVZjcCINYafQEHuslKsgqkgSS0S2Xn4mX3uRvqJtiuvOaFCE9rR2
	XeA==
X-Received: by 2002:a05:6000:22c9:b0:47f:e7c8:3fe9 with SMTP id ffacd0b85a97d-47ffd15cb0fmr36249046f8f.0.1786299116224;
        Sun, 09 Aug 2026 11:11:56 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-ac88-a501-9c5c-9666-3a00-3cdb.310.pool.telefonica.de. [2a02:3100:ac88:a501:9c5c:9666:3a00:3cdb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480020be8f3sm24111242f8f.0.2026.08.09.11.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 11:11:55 -0700 (PDT)
Date: Sun, 9 Aug 2026 20:11:54 +0200
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
Message-ID: <anizGXThM-haqQXU@gmail.com>
References: <20260803224405.41468-1-kmehltretter@gmail.com>
 <86mrv2arf2.wl-maz@kernel.org>
 <anYNTW2e3HalTqTk@gmail.com>
 <878q6fplpd.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878q6fplpd.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_111158_599667_CC93F491 
X-CRM114-Status: GOOD (  14.86  )
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

On Sun, Aug 09, 2026 at 12:39:10PM +0100, Marc Zyngier wrote:
> My current patch is as follows, and so far, I haven't seen much that I
> like better.
> 

Hi Marc,

Thanks for your revised patch.
I think one correctness issue is in there. 

> +		for (i = 0; !ret && i < S2_MMU_PER_VCPU; i++)
> +			ret = init_nested_s2_mmu(kvm, &tmp[i]);

> +		if (ret) {
> +			while (--i >= 0)
> +				kvm_free_stage2_pgd(&tmp[i]);

The increment expression of the for loop still runs after an error.

I reproduced this with failslab. If init_nested_s2_mmu() fails while
allocating pgt, before mmu->arch is assigned, the for loop still
increments i. Thus while (--i >= 0) passes the failed entry to
kvm_free_stage2_pgd(). The resulting log is:

Unable to handle kernel paging request at virtual address fffffffffffff650
Internal error: Oops: 0000000096000046 [#1] SMP
Call trace:
  _raw_write_lock
  kvm_free_stage2_pgd
  kvm_vcpu_init_nested

Thanks,
Karl

