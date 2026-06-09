Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0569DCD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecA2GfucrdEO7oCnTDy8y1OegEJt3xWexov+P1SIqLY=; b=MH0ZF0EMZBXas2f9UEi2Q9aYdT
	nmK1cd3oO6CzSaTdipFNCCYuhulCtgEbinteYtqj7R9/R84RBNzWL6f5PzhsA8DrZ8UzPdMhjVhFO
	5QQFwPb8Z+Ejj15scIjuQwdARxX0OGlunVkDyUqsSaa0mEXl6LOkGegKkOtmkTyheDyTUJ8e+RzA3
	mZzklWxOIgnHU9Gy6Lz/1oUkTdsjt2axhno3JDSln+F5PsdLCibRjyBjjrOPx/VUowbU/sUrRgcZj
	Iti4oCBERJTCJ+BYFy1EY2a+xVyfHPwBlg1RjtuXN6TZo/ycV+IkwS5oqGdQvVaK/QFRzk5E39R31
	sJWjz7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtSq-00000005Jun-1fIv;
	Tue, 09 Jun 2026 10:13:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtSn-00000005JtL-1hHN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:13:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bf2911f93cso416555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 03:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781000020; x=1781604820; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecA2GfucrdEO7oCnTDy8y1OegEJt3xWexov+P1SIqLY=;
        b=At3wmyXgSZRekBVmqNxBxpSGdXj5L3LAaTIHsKBVcXEFm73OpT8JXcDdQlbEx8pjyC
         WfYj1NGttdqZbBQSypeJOdzL0l8qWvOjwHtSuAI2DWD5S22qwg/9pVJVtAKkD+O3zGWa
         hCZuL9n91lkLL6AlROPTWNcb7pFrJC88fMM+ypl3iY9d7/A78gq9eaaPgBQHFMgJJS4g
         62hrbtIgRwtcWQkyI65IbffdKLSjl/NwnNA/BflpJtlRquFK9BSlOhFf17wQdyWv8HtQ
         cG7g2I0IFAhy3TGBVL3SnPthW18/cZuPEiKOU1w090K1RB4QGNYQ9sazhkqSeGZksjku
         Kp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000020; x=1781604820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ecA2GfucrdEO7oCnTDy8y1OegEJt3xWexov+P1SIqLY=;
        b=H4thLbr7wa2r3O/60UsQIcKkAK5OpAeHH0ZZmlkWRZC93YbYMnHaHT1fB13Jzmsr8A
         85E97zVj3NhLmzP/xcyk2t3VXTlPyhxDGZUaXqIjMlNyPHmdjuD/3y9rcPzffEcUp/Vq
         Butt/efRFjA5Ci1OicgAzWZR38tqG6E50sxJA8a0qJemhNg5ZzEX78EJF+6rGCAIvMyA
         1KLgDT02+WSSHIajmALM3snZ+KeNqSBUZvQTUc5t44dYbuvjTrKE/PoyQOgUiNE1To8v
         W/s9VXjIyj6YTAx8s3wpiYAbabbeg2vNee2HhuMCo49hvsk0TLxBadTUCuVWC/hOjoOF
         q//g==
X-Forwarded-Encrypted: i=1; AFNElJ+wsp7vuBGOkOG+ip6ehk0+awt1busGBudnlvTgHZK7hoWMiI+7zwl8oeU6QSvffWaH9V3JK4I+syrqKyiLVIbS@lists.infradead.org
X-Gm-Message-State: AOJu0YyictTOwEFmWzDBi5aCLonCLztn234FynrIBWGrPGdek467znXx
	9hsV8QjJE2eTwmaOa1birlnMpwxH2GncW1z0tgNECQLhCJm9e4n21ThP5Q5LbzfMsg==
X-Gm-Gg: Acq92OEDTPxf8YxGmA5SypOEFyraGVXAgVDXcY8vYh+BVwKnCcPsbuhFwEdjnVvzwsr
	F2O8Ebfb3dSf4pB4KeQFEqHV5NPHRKn/lhSvUqPIwU7gkVM5x7a9OuZlSjmaCxg56zPeXf1t+xe
	hZFx9t6t8N4MO7ExRWuSpuDtabWkjYP6qQvTwSl1f/yPJzZOLhjm+b0EuwQ5PXDLBYO+U/OL9gQ
	QpuBg9X8JDRhPfODERzmrvtHGlsV7Qrz8GufquGMs6jhzN3qlyadCUSbOrqNZKZOI+/olL/NXsE
	vzki/3j2Yr7xFghBhSkNDTBnAcbfVU7z4JwLOgGp7BQaqZ8VNehFzOSYMvUqmb126PJ0Yhd0Ren
	dOnf4M6b0lZN8E0NUI04bLPqt2BLR33WFuZjWHOnWcgHz2pj/75KvwlcnkEpDTEGe60JL23yWu7
	DUR0AAmexJSQ9Rx4dnUq+qxJUU2Hmi+ksaP58oX6QJv7rKSICJxI7wJHzRCqyrcwUbcTIuuuo=
X-Received: by 2002:a17:903:b50:b0:2c1:ee6e:4e4b with SMTP id d9443c01a7336-2c1ee6e51f3mr7246875ad.28.1781000020037;
        Tue, 09 Jun 2026 03:13:40 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821c5sm19457245b3a.32.2026.06.09.03.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:13:39 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:13:33 +0000
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
Message-ID: <aifnTR_GAoZ76Yja@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-10-praan@google.com>
 <CAE2F3rCTHZOiSx5tTVmLmubJ4SUDtXvCX6oLqsdEsPAFTKJZ4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rCTHZOiSx5tTVmLmubJ4SUDtXvCX6oLqsdEsPAFTKJZ4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_031341_639068_B8C127BF 
X-CRM114-Status: GOOD (  15.43  )
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

On Tue, Jun 02, 2026 at 08:27:22AM -0700, Daniel Mentz wrote:
> On Mon, Jun 1, 2026 at 2:59 PM Pranjal Shrivastava <praan@google.com> wrote:
> > +static inline u32 arm_smmu_cmdq_owner_prod_idx(struct arm_smmu_cmdq *cmdq)
> > +{
> > +       return atomic_read(&cmdq->owner_prod) & CMDQ_PROD_IDX_MASK;
> 
> Is this masking necessary? Can't we just use
> atomic_read(&cmdq->owner_prod) as is? The only place in
> arm_smmu_cmdq_issue_cmdlist() that writes to cmdq->owner_prod already
> applied CMDQ_PROD_IDX_MASK.

Ack. I'll drop the masking.

> 
> > +}
> > +
> 
> > @@ -4839,6 +4876,10 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> >                 return ret;
> >         }
> >
> > +       /* Clear any flags from the previous life */
> > +       atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.owner_prod);
> 
> Same. I believe CMDQ_PROD_STOP_FLAG will never be set in
> smmu->cmdq.owner_prod. Hence, clearing it shouldn't be necessary.

Ack. I'll drop this.

> 
> > +       atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.q.llq.atomic.prod);
> > +
> >         /* Invalidate any cached configuration */
> >         arm_smmu_cmdq_issue_cmd_with_sync(smmu, arm_smmu_make_cmd_cfgi_all());
> >
> > @@ -4898,6 +4939,21 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)

Thanks,
Praan

