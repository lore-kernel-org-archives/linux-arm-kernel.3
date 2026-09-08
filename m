Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59064C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJghjsjeZZE/MAZEqL/GCrOia9QwjdEjzWzYPWrDgxY=; b=EPS2loDez4169XZQh8DTiPp3u3
	P5bnMGPbye3fUaocW0e24tj9MkZgsyNiM+/bBpCSsbibZvBuIp9Fbqc2QyGK/sCu0eOBAashZg0e0
	3ZV/WyW94wpmv3wmWGE1F/+9ki510lw377yUpUV1ihCSMABdUdeEyNja4vIStsKIT8+RzV6WadXG9
	231J8memfnTo4d1Ds8OaSVILlc8e3M/3kTzlONH/gXJfU31rgRoOfzU1io59P0/qMv4AFviOkyRQi
	lGLBtHqm43KErCPPyjP/WB2B0MtR0glYKSFwOXNg90Eb0PgGhJHiwgxPhs4Yo3Z+Kw6WGveIVLb6T
	6q/oN7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3t1M-00000008lUb-3jzC;
	Tue, 08 Sep 2026 10:25:44 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3t1K-00000008lUA-3sVB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:25:44 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-484392e3d33so3161269f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788863141; x=1789467941; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJghjsjeZZE/MAZEqL/GCrOia9QwjdEjzWzYPWrDgxY=;
        b=s4KIZ7WVBtf24Ush+ktvgWsZ/JETEn5ARL+kAb0V1Ir1eKm3XW9xOpbee0fYWtzGeO
         m3URtQ8kyq88t0lTkbGnABstemN6LzeiMB1NQaGqYlHCs2joszOzjtwufzMaC4bw8mPb
         cGrK0p3aMr1zCPaHU2lZhbmZU0v+CpkyF7IhcS1DwSElzC0zx/TPOOD1TiF/0UZZOQ3L
         WfaZDuhNui6tO2shcHuvAExRm0wLwkXrw8bt7GUpGzKkIznBmoIK+aSrVgHiy4mxOKaw
         6p4jvLQV0gBTAv+6aNo0ur8FHZEeTx29GDp0BSI/w8dAj/PF6rNI+g6nd4kpPlfenNSZ
         M2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863141; x=1789467941;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJghjsjeZZE/MAZEqL/GCrOia9QwjdEjzWzYPWrDgxY=;
        b=aAVp91SAxJySlOelduiOWSdzPd6WRILjjVGPLydzzUxz+arGORwysx/pf4bffqJM2I
         DScdiCFfOTNAWxTDjdy9fUOlfwqrtP9Zjei6i5vQlWMHO/ogftFgyNZU4yk7sO1uui4c
         067aX3TzEWtN7H1AiSfQTHGDvHjTCKm0RHB48ISjJxO5QEcXqDT1YJcQqWt0UuGLg54H
         1ueWpkP32jd4rykHArkUqDSRIJxHGT6ugjXj9hVUM/2Fxq8GettS8yHLJHM4jS7nnoYu
         U+yNkKhF3DhEsn090OVEzI8X6y8YMqwPbqP+MrliE2G6vssUEIKASmRxSoD6aFtHZa8b
         bWJA==
X-Forwarded-Encrypted: i=1; AKwUvBzpBFMExJUraTjUVmawxo3CREHl70ywwAabUsY+ueOpseeKBgXyUPFnv5Smkfzq6GBiWtIry1TeVKL5PalW61oW@lists.infradead.org
X-Gm-Message-State: AFuF++lc5z4izycSWazo83yB5B3nzbEDW9iqmaJu6xWfrWKuiQNq9NQE
	k5HYWzmZ4EXH9ebMf6RiLVO2oWeej5aFO/MkQbLOTFznUv7iaO31OpFxAUaKt6VCHw==
X-Gm-Gg: AYBFou3u74Kfn6reBu1N85DDegUYea7irr7GP2Q/5M0a4E6vJf0PNzy1tqEPH3VFLPh
	64URW5VSdUV+uB+b4M8GFxdg4VF8XhKazsFJJJshiYGLINDPp8UF/3kdpdXXpr3hyPbaJIXG+Jq
	wziQKxeRqlWreeXXTtI03xgrwS7DYAGnV7jptIoE2YoSWWwmlz78NgVuiKtU0KXwsLtF9WM/+JQ
	L+Vo4FjPxqztJj1dqHR2GCy++thNvZCYLCDE4SmyFBuZJd6OBrbed8I6DYCvPu70SrklnQWimZ8
	hFJQGbBU4AJ9sn2GVbjVX6In5mVXFAnjlbsm+BzPkOn2xctqSEy85KUiXMZH7AKCMa0M29Yjt+j
	kE2RDKYLwx2D8J41yE13bKkKcJmtNuEiFqL075vwPgdK9qmUxB2PBMYqMOcE4qPanhJ3XSAPei5
	92xRQjo+fMBEg/4Z6qlxBAJTdNnzmFP3toMWFD72dOIDzfXweKAc3o+Iyk1keYRGD5+fbuxhBnL
	Z7bSvlS4tEcRp27mHRZEutS/THKiCIB
X-Received: by 2002:a05:600c:a0b:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49cf8262133mr282239435e9.16.1788863140078;
        Tue, 08 Sep 2026 03:25:40 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60bae6sm555597215e9.9.2026.09.08.03.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:25:39 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:25:36 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 11/20] KVM: arm64: Add a range to pKVM ownership selftest
Message-ID: <ap_ioANYZN2_aogf@google.com>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-12-vdonnefort@google.com>
 <ravrecwvcy2okwdi3h5buzneyfilfjgx76c374r7l7jtx62lqc@rom2sxozz5is>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ravrecwvcy2okwdi3h5buzneyfilfjgx76c374r7l7jtx62lqc@rom2sxozz5is>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_032542_966886_9926298D 
X-CRM114-Status: GOOD (  17.23  )
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

On Mon, Sep 07, 2026 at 03:58:13PM +0100, Wei-Lin Chang wrote:
> On Mon, Aug 03, 2026 at 11:08:55AM +0100, Vincent Donnefort wrote:
> 
> [...]
> 
> >  void __init pkvm_ownership_selftest(void)
> >  {
> >  	unsigned long pgtable_order = 5;
> >  	unsigned long pgtable = 0;
> > -	unsigned long page = 0;
> > -	long ret = -ENOMEM;
> >  
> >  	/* Memory for the VM page-table */
> >  	pgtable = __get_free_pages(GFP_KERNEL, pgtable_order);
> >  	if (!pgtable)
> > -		goto out;
> > +		return;
> 
> nit: previously this allocation failure will print a message, but not
> after the change. Is this the intention?
> 
> Thanks,
> Wei-Lin Chang

Nah, that's a good point, it should print something.

-- 
Vincent

> 
> >  
> > -	/* Page whose ownership will be tested */
> > -	page = __get_free_page(GFP_KERNEL);
> > -	if (!page)
> > -		goto out;
> > -
> > -	ret = kvm_call_hyp_nvhe(__pkvm_ownership_selftest, virt_to_pfn((void *)page),
> > -				virt_to_pfn((void *)pgtable), 1 << pgtable_order);
> > -out:
> > -	if (ret)
> > -		kvm_err("Failed to run %s (%ld)\n", __func__, ret);
> > +	__pkvm_ownership_selftest(0, pgtable, pgtable_order);
> > +	__pkvm_ownership_selftest(PMD_ORDER, pgtable, pgtable_order);
> >  
> >  	free_pages(pgtable, pgtable_order);
> > -	free_page(page);
> >  }
> >  #endif
> >  
> > -- 
> > 2.55.0.508.g3f0d502094-goog
> > 

