Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A86CC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WINo3MBcFwoSNDQfzt2Lle9+HR9ovDEJnLqZu/S/ymg=; b=seKh4oQTAzRhHRjftD9vFCJPdG
	B5Etj/W94xRXJelc+OfHwd93xonsmw+UOP87amX4OaD1fgTdr46XeHudxQqUoGDG79a4DI9/SPob1
	WyUza3SGcSfqorfIfIVMTjBsUGkJR9IfwoC6Dpg/mIwzNcfdabSeHzy8uFxJo0Mfz5MZ01IR1PATt
	SENW+GyzJMB3yne6ORhyFv9hxmOC2weSv0pFfBLQe2MDa/IjSvqLnba11ed5Gn8vmBLo0bHzAKwxR
	PTdRusJsKq2z66MPjzE0uTuKLnUUkDm2fwfnV9X5xxkzBcTHNs3BKWBx6fa40POZ7aSUuoczlq1jZ
	lPDCRfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bdd-0000000Dxy2-4BCR;
	Thu, 10 Sep 2026 10:04:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bdb-0000000DxxN-2Kxj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:04:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-485888b3c3dso6901719f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789034649; x=1789639449; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WINo3MBcFwoSNDQfzt2Lle9+HR9ovDEJnLqZu/S/ymg=;
        b=Fz+1zLuZLXvSkPPO8WFhHMNNp4zUOzSmJGp0qew8ANuBeDmdqPiPmlvSv6uXNSNMzN
         nYytS7eahu8UGTOfIhNnkf745oIYJUuboLrmRcMF5OGkb1LuUMfDwpKJ+np/Gh0pLG9I
         f4ReI9JOUgK9XmLyuOe/DgCb13V3gsjRJ/ZhsUSYtUGEp1xizSAHj1lN+XawePn7NOXV
         YijFQq/+J5bm5jjQH5E8ASY7WO5U+BNRXtxL30eUo32bHA7+y4py5NSLaVuZ3DVFULQ0
         HEPDQOAG6Sxo/QF0WP3bJn8cH5IpUKMifXdu/H8EP4E+FGn9J4DYnuzS/TeioTYzak1/
         Beyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789034649; x=1789639449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WINo3MBcFwoSNDQfzt2Lle9+HR9ovDEJnLqZu/S/ymg=;
        b=Uwd/4T0xKkbbOU/3LvZEnGtlje0GRwruqoQ3HNo/r0mb4pfoJW/be9r0QXDUqpBTRt
         Kw7h+bBgV4hUOdiHPVRYAwGxukMJvB5A6iQ9AHLS7RJmTOuiodRowYjKqjMRzfVKJXdz
         LLq1XyPT76Y70ulSsbWuJkc9tQKOzAUGxtM6vCHtzEbPJ6EjmM+xXMIs3k5H9PFIcPHK
         fgsDlbB6PjmhIPrLRp7bAcdkULlnW3DIMiJ6LAndZ3Q90MFGR0wweycr3UmA7QhOgXwN
         D1LfXiaihX89YhJbsAfxDx95470MUh9uW4Q36XWO45NAtJhPbFfGnLauUuDi+ZfLli+H
         t/wA==
X-Forwarded-Encrypted: i=1; AKwUvByA3TKFFuFEDXxhMkIrWb+fzhkKbEbzcVEmZ1mGr06h8L5xmeK4lan/gLCZ6PVaGkZ8+ma25m6f6PluHOHtKoXd@lists.infradead.org
X-Gm-Message-State: AFuF++k5EkJqMI1cfp0QoXtjw+2hjxeNGx2Z/aPDsoLK06OcsowoAWBo
	lrTR9sfMJAHx+zIYiPRLdMikzSI9fPg80fzLL9vgy/Kl0HqZxuN6XdgEQs/LM0n8CA==
X-Gm-Gg: AYBFou1tis/xjWk6RFl11xT+aCQvFFOzIHrT7E/hQG8QR72XYCMUSjzMIUP1bdc/qtB
	wGto8x4AtlGgNTED78/qBqAZkPkkAR0p13SmyUXzRSR9ZyBI9BkPdcQIPxBccj4YMivTLj+Ru93
	xP1y5z+3qxAI7GnpxpYDSfVwJHaSOly9HPBP89aZ7BVA/9eZ7eSONudsXkt8V9N12onGldZPOW4
	8C/4O6Gdmgy47IuonI4scggPBbqTpsyOjZwnFEfdnY7likHq8ZI0G6j7VPK+o9MBMd2ImmaJeuD
	0GJhfrS/8wddzj4t2tul8oIuAmsOX+gNk7XLpE8ldtpwRfy3dn0o/QTfIWKGfJXVM8K4JZCzJ+6
	ctAn5ThGsBfzy7YDNst7abt7BHfECCQ9HUmf7bl8sfwAjJkzhJ5gH5SjEH8cNO3LpVL7cuZvL6b
	e3YZoh1rnVeES4YM93nVxHi2RMVbPACL9ICjDPlTOegy2gIU2rCRMa7fP/RM+xVXSl+1hIsc8hb
	xtBe9j905+3+EMSeGtS/9oNJv3RXiE1TEgUfELar2c=
X-Received: by 2002:a05:600c:4714:b0:49d:462:6eda with SMTP id 5b1f17b1804b1-49d04627387mr310806105e9.28.1789034647707;
        Thu, 10 Sep 2026 03:04:07 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm53204782f8f.10.2026.09.10.03.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:04:06 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:04:03 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 11/20] KVM: arm64: Add a range to pKVM ownership selftest
Message-ID: <aqKAk6n_DBZXnvnl@google.com>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-12-vdonnefort@google.com>
 <ravrecwvcy2okwdi3h5buzneyfilfjgx76c374r7l7jtx62lqc@rom2sxozz5is>
 <ap_ioANYZN2_aogf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_ioANYZN2_aogf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_030411_611135_12DB30B1 
X-CRM114-Status: GOOD (  18.77  )
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

On Tue, Sep 08, 2026 at 11:25:36AM +0100, Vincent Donnefort wrote:
> On Mon, Sep 07, 2026 at 03:58:13PM +0100, Wei-Lin Chang wrote:
> > On Mon, Aug 03, 2026 at 11:08:55AM +0100, Vincent Donnefort wrote:
> > 
> > [...]
> > 
> > >  void __init pkvm_ownership_selftest(void)
> > >  {
> > >  	unsigned long pgtable_order = 5;
> > >  	unsigned long pgtable = 0;
> > > -	unsigned long page = 0;
> > > -	long ret = -ENOMEM;
> > >  
> > >  	/* Memory for the VM page-table */
> > >  	pgtable = __get_free_pages(GFP_KERNEL, pgtable_order);
> > >  	if (!pgtable)
> > > -		goto out;
> > > +		return;
> > 
> > nit: previously this allocation failure will print a message, but not
> > after the change. Is this the intention?
> > 
> > Thanks,
> > Wei-Lin Chang
> 
> Nah, that's a good point, it should print something.
> 
> -- 
> Vincent

Ha I remember now... GFP_KERNEL doesn't have __GFP_NOWARN. So if it fails,
warn_alloc() will already print an error.

-- 
Vincent

> 
> > 
> > >  
> > > -	/* Page whose ownership will be tested */
> > > -	page = __get_free_page(GFP_KERNEL);
> > > -	if (!page)
> > > -		goto out;
> > > -
> > > -	ret = kvm_call_hyp_nvhe(__pkvm_ownership_selftest, virt_to_pfn((void *)page),
> > > -				virt_to_pfn((void *)pgtable), 1 << pgtable_order);
> > > -out:
> > > -	if (ret)
> > > -		kvm_err("Failed to run %s (%ld)\n", __func__, ret);
> > > +	__pkvm_ownership_selftest(0, pgtable, pgtable_order);
> > > +	__pkvm_ownership_selftest(PMD_ORDER, pgtable, pgtable_order);
> > >  
> > >  	free_pages(pgtable, pgtable_order);
> > > -	free_page(page);
> > >  }
> > >  #endif
> > >  
> > > -- 
> > > 2.55.0.508.g3f0d502094-goog
> > > 

