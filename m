Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F999CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 12:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l68RUmvnVcTMObrLGNummA84I2vZ1XwcyaM+Znecl0o=; b=QgU70EhlTnklV/+ngEWAiLXuRl
	pB43l+J47PYRBhjC8P0DWRoZ4nq9FLL8lAzzdD2ozsLl5XszjEJhdWwdudHxWWUWg/IZjqCU+r3Iz
	LA5vBNIzxWDl+dgH/TobwIq67giPgc7jauxmjyJF3ttMZbvh+bpM5L3AdgutjHL7/eqPeNObPTnUZ
	pDVevkrRZkPIlQ7pLgn8we8JJjYroKWH7PVwhrnqPBul9pYB851NQ49HzfHCwq9xKni5odpAKFPKo
	fi/7x2MnmFqTFEQZS0cWOR4+zySlsq55e+O/3xMWCyH5nz7gS42PQ9XSrM17iDZSzctn9JKpzj+Y6
	HxhEaOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNyt-0000000CwwC-3QCc;
	Tue, 02 Jun 2026 12:12:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNyq-0000000Cwvf-41bA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 12:12:26 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bf22c18ad3so725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 05:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780402344; x=1781007144; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l68RUmvnVcTMObrLGNummA84I2vZ1XwcyaM+Znecl0o=;
        b=V3XIizGH3JUnLqDOTz42DIubILnt4zwL+cNiPzQ7KyuGsYcLPm6CuLrro3+Z/tG8Nf
         3GHTQGPPOAQHfLl18u3TAMBeBFmGatZE75OLrnI4llEzSbp94R0dgA4skIYluLGLbeCn
         7sOk74Tm6oLq1pbLzCHXWhKJcB/io6JMDHcYmXpTjJ6qOTTkzWY7OODr7ECZi8H7HhE+
         VxxP1Ax37C4zdoRSuvj6Is7Aq2Lo1DPA5pYd8ZNXiKESzCzkcw0H4lb2XeVxr2h98H/R
         iMtYGik0Rdrxwx4rbAseRFoti78ssjpOuyeIQYfAB0CKnKk3E592td86WF24E515Grs7
         gpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402344; x=1781007144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l68RUmvnVcTMObrLGNummA84I2vZ1XwcyaM+Znecl0o=;
        b=C5c26tXacKygRnz6L+yPAVQshrQeZa0CAuNoGSzMkSNF6RerrsRFVj95RgiXsP9l61
         7V8ZRyzBbm+LRwGSJR4J3bbLMhRfXjoabrEI5UXUliUdE7QtQVEKy5xNcimpealFLO9N
         bIYb2sZJLOv+/X6W1qH3h53d2GwAdcItbkohfNLaWAfSnhQo5QuaPBk7rbo6N/3PXLJO
         a7VODMW1TLbKK4GVllND7a5rU9ajnM7xQWnh/YLanf5VXNYuYp4tVEWBHPEaAgHBo4jY
         o6bM4dlIdt3tZEG+gAF32Gt4xQ3WRyN0n6HkgYMHmllhERfMduxiMxOf+G/JtP0j5bGd
         KdWA==
X-Forwarded-Encrypted: i=1; AFNElJ+iBPl36tTGOOI5kCLZxWRZ/K9lXBMZaUULb28Ph9F0wfPv+cKB6fZD2g7S7i4qbWCgfxyzV9OksbY5bGdreiQH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh8hP/XS36YPRJamtekRttxbH8uSRmFjLJj/OU/SPpI8/KGm/o
	UicXlJA9juqwB1ALyy+1fP8upGu5ByPk4Uzg1MP52pC/lir7FPNcbCb4l/6pDwKYGA==
X-Gm-Gg: Acq92OF9eiq51akTG8X+k4YkNXuPmhW80p0ut/if1pNPq/anLIlAFpAbIWcudd5ctML
	kaBTWaFcc1jrXxHzp/zGaULqx6pVXCEBmxnlwLFzqgd5uMaWY/lgGaLKptMv5EDlFvEIKyN5ow3
	W5AicmHOlgAg89ECa2Bgujr1XOEZU+KMWihsF/uQj/43B97Dyuq4HF3U8GsPmyXc5KwRIACEUpS
	CcmBCulTk3WMnZKA8s4nWMqbzwJ5HDfMBBmne2+ktOLhlxOi6dNx7sE5JqvFHxulhaH9fdjFWXY
	oNRdlOIA0hl4WRKm61ApLQmgDjoLD3p1RnNAU4XNqNx4I7qwJS126FeXuPuJNe2K3zAhSgKoo6V
	nedZZm+wlYmpnbMmgAoqEnVEzvXIDLGLr1xsjfmyiSlvFqp8nVuafGnlLUJlN54i/GPBKUinefA
	yR2rAG4YmW4IIAjgvtCh8LQKaQ+yVHfZp5TF/py13q8sePvakdkQJv+KktmQw8TZFudS+Bc7c=
X-Received: by 2002:a17:903:249:b0:2b0:aee4:afe7 with SMTP id d9443c01a7336-2c10e85e5dbmr2816395ad.10.1780402343406;
        Tue, 02 Jun 2026 05:12:23 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422e712309sm10139561b3a.59.2026.06.02.05.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 05:12:22 -0700 (PDT)
Date: Tue, 2 Jun 2026 12:12:16 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 09/12] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
Message-ID: <ah7IoJqmRbK7xK5-@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-10-praan@google.com>
 <CAE2F3rAYWMq6DO5k20e4iMtPbh_X9JeiU8kUfw8nsS5xs42F_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rAYWMq6DO5k20e4iMtPbh_X9JeiU8kUfw8nsS5xs42F_Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_051225_004348_C2AE9D3F 
X-CRM114-Status: GOOD (  16.04  )
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

On Mon, Jun 01, 2026 at 10:25:41PM -0700, Daniel Mentz wrote:
> On Mon, Jun 1, 2026 at 2:59 PM Pranjal Shrivastava <praan@google.com> wrote:
> 
> > +       /* Drain the CMDQs */
> > +       ret = arm_smmu_drain_queues(smmu);
> > +       if (ret)
> > +               dev_warn(smmu->dev, "failed to drain queues, forcing suspend\n");
> 
> Can arm_smmu_drain_queues() be called after cmdq->lock is 0? I think
> that way we can be sure that no other thread updates smmu->cmdq.q.cons
>

Hmm.. that wouldn't work for impl-specific CMDQs as we STOP and drain
them together in a single function.. maybe I'll factor out setting the
STOP_FLAG on impl-specific queues as another impl_op, gate the queues
first, wait for lock == 0 and then drain_queues?

> > +
> > +       /* Wait for cmdq->lock == 0 to ensure last CMDQ_CONS_REG is written */
> > +       timeout = ARM_SMMU_SUSPEND_TIMEOUT_US;
> > +       while (atomic_read(&cmdq->lock) != 0 && --timeout)
> > +               udelay(1);
> > +
> > +       /* Timing out here implies misconfigured Runtime PM or broken devlinks */
> > +       if (!timeout)
> > +               dev_err(smmu->dev, "cmdq lock != 0, forcing suspend. Polling CPUs may fault.\n");

Thanks,
Praan

