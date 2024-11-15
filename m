Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFA6D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gb7hmFy/0l+JpT17zGKACyUketzLohMMo6Nszps9h8Q=; b=HnVo4GU9oS+8dQWjBmfzEXsawj
	ZGKLJcZLsMMk1f9fKa/Es2kSNYl3ssYMBNjBMfN914o9N/GgZTbHyDgkzWCWJH2YcY3XkKM29B8Di
	DY6oH07xc6lg/r09QBHPtu6JPfB4FhvEEqOZVvN3pU/AWCQhU+Md4JP//FxqLmdYSwG8LUBCn4tsE
	rVR6LywzjLjcRz0I/YGgncvifTeLessZx5oJo2f1kxJyKu9LeIKjsqtYZZGpk9mp8UHh3IEUsIw0J
	zu98P5gt35v2tL/5XwcpTqPo8JfdX7e3c0emJ0u02EEspzIpAbQr1qlnKiuC3FKnkIkJuYfgGQulL
	Oa1pZm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC1r4-00000003ppK-2CmR;
	Fri, 15 Nov 2024 19:19:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC1q8-00000003pdH-2jNW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 19:18:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso3875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 11:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731698322; x=1732303122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gb7hmFy/0l+JpT17zGKACyUketzLohMMo6Nszps9h8Q=;
        b=ZBC/fHrUVi+1g3lLGC74PHbasr9P9rnujEcljlJt1EcOI9YoARCCiZHErFsYFvz0Gd
         A4VhP7EXw0ugjOXx7u3ag7h+UWr7+1yfJroMVYIkd7UE7Af37URxbyc+8OB+bf+jDoO6
         XTSFnEXg1DCkzHcjIhbVs5WjHXOvfM7Gcer5tkHNbGFMaFaE34dcKcuxcUrIw0ff3Cz4
         Y8exTJdlXMie1Qy+sLALftwRfndfITJuJ9mYZ4Y1ipmFlnT/QM7Rzs0rKShwELhSCGoa
         PiE7+m8KSN1yHQKWXp0iuIiqKI/SSUVJ5xnwkQ4T/H1q9o3b+0SaXA2KiooSNe6iERBu
         Hcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731698322; x=1732303122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb7hmFy/0l+JpT17zGKACyUketzLohMMo6Nszps9h8Q=;
        b=kqAAAwfBtiHlN7dTMrUV6oknpAS8lvWkEVyMyp0JzPDTBAWlmz4l1m7z0EZwU3h9d2
         P3B6NtmobL1foVWeRcbQ8d5oUF/pWbPu1m5E4QvchXzhTVLVrO67vFShbUqgWlY+sMS+
         FqqyRUzVUtGH96gmtOeI2V3l9aF0cqG6iT6pNme7QDdIgA/lE/m/2AQfPg+29naMn37M
         4vpznaVKMVmymgLlMnLm2+XSAUh/M8iljf92R9VM0WhKMhUhNszv630nNxf0RYrJawSA
         wFRbFp/olQVjlrTwHORzdgVAzT2VlS7LFMEpxDL6Bmr1FgckP7uoRthQjQpjxfU9s7gr
         4Reg==
X-Forwarded-Encrypted: i=1; AJvYcCUk1d1UD3kbFfL1fLjLGRDl7uvvtjxTcsoNkvFNHsYrJk+Fl3OJvbMOI1vo4L7YDvQrDkrnQNjUgwNPlhxLKiQO@lists.infradead.org
X-Gm-Message-State: AOJu0YyjykKw6PTQiJYajdq0oWvExY3nV9D2j2oJjLuH4RG7Qvi/LWVv
	t9mO/0TCzin5931IcwCY5NCZbKTi4jXhGsemMDN/bPYj9QCFisWhiZesUwiBYQ==
X-Gm-Gg: ASbGnctSxPpYZeTttcFVCc1+NZWNwMA/1y9UH1tL4swIugf+jxoyp6xXwquUZ3s631X
	JZnjmSAIWgCRaazGs2Y2u5Ks0yu48LSu7B4THieJCIIFkFhwM4RWNCTl80W+p3Piq8hQZPTwOYx
	eCcg/fNZdD6d2NhpQNhV665ZmSGelhvzE1GzikqJBfCtPLW7W9ApYQGcYGxloIkdYWmUq6bePFQ
	2Eq31H/wKyvKJ56uRvoAmGaqBo/8QStQ38kYDgdi1gOYSSd0cqYV9bAM+h1U+z2sEp++bdAiW7/
	BBYclRTdnqMO
X-Google-Smtp-Source: AGHT+IG+0JQ95//Ajrq0lgO/WvKJa6AW6bqohkm2IbIyY8g9NlthrnZKtmPcJ0NxaAiAhUmfbGf1Ng==
X-Received: by 2002:a05:600c:3512:b0:426:66a0:6df6 with SMTP id 5b1f17b1804b1-432e609ec5dmr52285e9.0.1731698321726;
        Fri, 15 Nov 2024 11:18:41 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab78918sm61906695e9.17.2024.11.15.11.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 11:18:40 -0800 (PST)
Date: Fri, 15 Nov 2024 19:18:36 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	joro@8bytes.org, Daniel Mentz <danielmentz@google.com>
Subject: Re: [PATCH] drivers/io-pgtable-arm: Fix stage concatenation with 16K
Message-ID: <ZzeejJL3Tt4OlFdr@google.com>
References: <20241115172235.1493328-1-smostafa@google.com>
 <888e6542-2aa4-43f1-b31e-79432c1ad199@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <888e6542-2aa4-43f1-b31e-79432c1ad199@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_111844_690674_54A8CA87 
X-CRM114-Status: GOOD (  32.85  )
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

Hi Robin,

On Fri, Nov 15, 2024 at 06:29:20PM +0000, Robin Murphy wrote:
> On 2024-11-15 5:22 pm, Mostafa Saleh wrote:
> > According to the Arm spec DDI0487 K.a, in:
> > "Table D8-9 Implications of the effective minimum T0SZ value on the
> > initial stage 2 lookup level"
> > 
> > Some combinations of granule and input size with stage-2 would
> > require to use initial lookup levels that can only be achieved
> > with concatenated PGDs.
> > 
> > There was one missing case in the current implementation for 16K,
> > which is 40-bits.
> > 
> > Cc: Daniel Mentz <danielmentz@google.com>
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   drivers/iommu/io-pgtable-arm.c | 14 +++++++++++---
> >   1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index 0e67f1721a3d..9a57874a5cb8 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -1044,10 +1044,18 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
> >   		return NULL;
> >   	/*
> > -	 * Concatenate PGDs at level 1 if possible in order to reduce
> > -	 * the depth of the stage-2 walk.
> > +	 * Some cases where concatenation is mandatory after de-ciphering RSRKBC
> > +	 * in the Arm DDI0487 (K.a):
> > +	 * - 40 bits with 4K: use 2 table at level 1 instead of level 0
> > +	 * - 40 bits with 16K: use 16 tables at level 2 instead of level 1
> > +	 * - 42 bits with 4K: use 8 tabels at level 1 instead of level 0
> > +	 * - 48 bits with 16K: use 2 tabels at level 1 instead of level 0
> 
> This confused me, since per R_DXBSH, that last one is the only one which is
> actually mandatory in general; the others may be valid per R_PZFHQ and
> R_FBHPY. The additional R_SRKBC constraints come from the PA size, not the
> choice of T0SZ (and thus ultimately start_level) itself, so although I guess
> this probably works out true in practice based on how the SMMU drivers
> happen to behave today, it's none too obvious why.

Ah, you are right, I got a bit confused, it's not actually about the
input size, but the fact that the SMMUv3 driver uses IAS = OAS for
stage-2.
And constraint R_SRKBC is about the OAS size.

So in case we change that IAS = OAS for stage-2, we could end up using
concatenation when it's not mandatory.
I don't think that's a bad thing (I was actually thinking of changing
the code to always use concatenation if possible)
But, I can re-write the code in terms of OAS + granule instead so it's
more robust incase we change the stage-2 config in the future.

Thanks,
Mostafa
> 
> Thanks,
> Robin.
> 
> > +	 * Looking at the possible valid input size, that concludes to always
> > +	 * use level 1 with concatentation if possible or at level 2 only
> > +	 * with 16K.
> >   	 */
> > -	if (data->start_level == 0) {
> > +	if ((data->start_level == 0) ||
> > +	    ((data->start_level == 1) && (ARM_LPAE_GRANULE(data) == SZ_16K))) {
> >   		unsigned long pgd_pages;
> >   		pgd_pages = ARM_LPAE_PGD_SIZE(data) / sizeof(arm_lpae_iopte);
> 

