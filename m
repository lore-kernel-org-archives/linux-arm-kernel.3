Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA825D185EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+tihbqUE1EbblM//rEnVenEBX3R9t17BCYh0GNCNok=; b=IueadV05XbcjW30stuHb7j7rGC
	TxZqe5i7TWFZKoP214GA30QPnF5O2WabA2ZNg+6qEcRYxs8cTrRHZtUyKIyu8ha+Vbkre0t9m3E2s
	X8PFl220mq6+xsXHe/q5disAEFRzHHCOvS4vCixJMLuPSH/u1CqgJqTWQ6jAbwo2gdgllcLsLoe4m
	mLywciHyMybWhtcZtnWW3E+jS2lhAPiPydlZa3Hq2bH2jBuKUpH3JFc9eUVVdg9XNiGPvodVQwHV/
	TtQbi2+rt+btYz3gONE3WJPGzuPzq5BVzYeEVyCW5B3iYd/bYbhx2v7WV2f3KvWSqVRQkZUJZniDM
	kOO+Gv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpc4-0000000H5Mj-30V9;
	Thu, 08 Jan 2026 12:59:40 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpc1-0000000H5Li-3LaA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 12:59:39 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso19202156d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1767877176; x=1768481976; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p+tihbqUE1EbblM//rEnVenEBX3R9t17BCYh0GNCNok=;
        b=N0BKfkh8+w3py5TUc0vAYAbnZA2wYguZI/IcCIhgL9GIgkGT1l4KFRef3r09rAnGJI
         6L5vtDiveuCXxvfJWmSRQW7hB6GFR30AFJ0iA57xz33zMHKMAYMKvL24Ig+zwCR6dovQ
         7bU0rPWHpuAat+dVtWAw4q0it7682JAfJXHR2n4+lq4CGKi8jfXePxmiQYnkiwMQ4maD
         wdCzvuHVUXe2+TTTMRO4wI96+vkO9cqvAzTnx3SFM9Xr1o45kUC+Yq388q3KM+ehEcJX
         GJQErpo8aqJORVPqJMgpfpKOQ9+zqwizK3BZER9jQLZQpaEhAsRrot6NMRk4ctfTnyt7
         ew/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767877176; x=1768481976;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+tihbqUE1EbblM//rEnVenEBX3R9t17BCYh0GNCNok=;
        b=NV2J7mMhY+r/r2BtZnFMsyRynMpCBQg53arGVxuoGnSJxL1HFnoZMqUOzWwdEtRKhr
         vPPWyZusWq6JHiIIgROUDJ056jCjU7ZiQUCSbLgNISq/5OCcAs+VbtLgTrnFtSuu8Y9F
         +QuM1j7onHVZMYzp7skHbCJM7FWqWgLESyOFt+GggVeIu3bewLOhW9JhTw3Ebrp25evD
         e4hw3XD5f/+qBRW0cE+utOhlNmOTBB052BqncQM7BTM4ZdLua+n3EAJGtaknC4JMY4F2
         E38+YHt7xC/6CUmte2tO0Iwqr1TBfrmKEw7RsHcPebNUdxDFm6vnlxSJ/p05e0VJfR86
         e1kg==
X-Forwarded-Encrypted: i=1; AJvYcCXnr2Kx3FeG4784YRJQReQI9/+oxn9HlQFMySQwRyoxYCDtzYDGK2P5bg05lNTmh7m+1OxGTmlJEFBZy1OedqjD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/V1EX5PhFBF5Y1iUhvxA5+/kwyN07mqAM3+YAVoIf3QGfybqp
	/+4GX3tTygCdTvRm3fttmOOx5sEe/PSNsWuv+R9TCsDirOVi5f4ed4U7zsVxmo1nQ5o=
X-Gm-Gg: AY/fxX5GuBGsTlPHJ650JSxUKofEUB+Mk9ErkmgB9GV5i0H3R9n2qQzbk3d3wUzE/Uj
	zTPLmnmh52F1EMCMs7fGUFeYbGkGyT+nHrw9gmkkYEDIB71NPFUNk6jcwlCcfCV7EEhdc6olZHD
	AlHSplMWdAOVNfekSfrQGhyf4cMJBeIo+Otq+1YbKU85Zm3lGPk+J/mRHiffOsYJDwp7bn7+e0G
	ntEyK0eP6cdbbw/hurKvPIEfEFAxkMb3cKp0Pz9FNvhnQwu/hbOZBGdXGIjiHAjQ0qecgQ4Kupj
	0fjOQPi/lF+p4T9X6tLIGHVxdCxcl5UtF1zLZc7aJLkM/oAmlse00wDa3QN33+thk4knJ7dtgXX
	YfayFLpOyn2o0llmUWIdga1c8Ol7q1v4LGgXdx4vQP8/QbImmZNC52WXy+FITlcAk35D5Wc5K2P
	Z+eUw0bhAgXvLzuRoBXtgh5hlnPdNKsZjAmngfpOLMlcY1DPU5bLdeYL/jFPAT/1XvVAU=
X-Google-Smtp-Source: AGHT+IGK4Dj4/NADNs3lIQ6ILPYQuAK9EULOU60X6gh7oaJwS0PLStMhP2giOvf6NQHsl1JfKzlisQ==
X-Received: by 2002:a05:6214:d0a:b0:88a:2b3d:31f with SMTP id 6a1803df08f44-89076a3198bmr127336966d6.31.1767877176202;
        Thu, 08 Jan 2026 04:59:36 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772682besm52485796d6.50.2026.01.08.04.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:59:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vdpby-00000002LK7-4BCK;
	Thu, 08 Jan 2026 08:59:34 -0400
Date: Thu, 8 Jan 2026 08:59:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org
Subject: Re: [PATCH] iommu/io-pgtable-arm: Drop DMA API usage for CMOs
Message-ID: <20260108125934.GB545276@ziepe.ca>
References: <20260108113846.56179-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108113846.56179-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_045937_959536_05295547 
X-CRM114-Status: GOOD (  12.14  )
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

On Thu, Jan 08, 2026 at 11:38:46AM +0000, Mostafa Saleh wrote:
> Jason pointed out that the DMA-API calls are not really needed [2].
> 
> Looking more into this. Initially, the io-pgtable API let drivers
> do the CMOs using tlb::flush_pgtable() where drivers were using the
> DMA API (map/unmap_single) only to do CMOs as the low-level cache
> functions won’t be available for modules.

This isn't what I ment at all, the iommu-pages.h could do the flush
inside itself using the already existing
iommu_pages_flush_incoherent() instead of open coding the dma api
calls everwhere, and maybe that could directly call the arch function
on arm (as x86 does) which would be easier to implement in pkvm's
hypervisor.

Then it is reasonable to have a pkvm version of the iommu-pages api
for the page table and drive rto use.

Jason

