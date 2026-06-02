Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F686CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 03:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iT9NiZ066lEA6a1E5mdikMGDXU15Oav2UD45+kGhYA=; b=KydyWncMfRNzD6WCGa7KonAaH4
	Dk5O3ighy519yx8UiaR5WrOSU/PuR7qbDvEh7qm3sHNp1LXilc4JYnQ4B3F78YxYLeXcJYUDtQxl8
	zB4Mkkq4mC4fo8ck07mo4y7g+/24LPdGUtO7RZGGP6t3bg94GGqSmN2b7DFR4eQEQ7TK+p0nN+Uk3
	Nws3JgV5rmZWuoM7o7Ovs8DeEKqVFdqZ6R69lFvaqYxvxxIK47SiPiwofdEQ0mrKnjr2LPUg4GBUZ
	uEmMFvw82vtVaKAb/1CKsaturZbKuDyFW1Xl1op+j4A26xOraZUbvqOe+dieOgKvhwppOjwN6ODIF
	GhtIMN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFoX-0000000CE8o-0HMn;
	Tue, 02 Jun 2026 03:29:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFoU-0000000CE8Q-2iUu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 03:29:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0b1a48855so45ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 20:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780370949; x=1780975749; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9iT9NiZ066lEA6a1E5mdikMGDXU15Oav2UD45+kGhYA=;
        b=lg6kEFc9J2k1+lJVBU/nXnm+EMOMLyjk7Jk8qqxI0ojC2M/yvr0r4gqZdEuiuLYmaJ
         cGGzw25ybk6WyUzUY2M4uiTuncV9ck607pcbhxVyqxBMjxwB5CMNRZLI2suQCTnaBGhL
         5AzHH1lNKZKD+nUt5Tc1LMRisEk7DsK/kPfPGK7/3L4PyirPCKmjUQ/LJWW2EdgVy8xy
         p0dPlvIij2rvyLL5RU5efAi7oIWXsJxH3yh8WRFR3AFEblr5oLnMCPF5G/QcWu9NMvEU
         Z0W2icxk+hqjhKR1IyU+T2oZZXPgAtDH2CkCqo3OnxTlX4UApNbVx3v77M+TPWXcM1++
         6law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370949; x=1780975749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iT9NiZ066lEA6a1E5mdikMGDXU15Oav2UD45+kGhYA=;
        b=jwvYjF0mEkRXk0HtG+kOWaawZb786YzXdjD7HXq7tWzAk0XmhbFRbfJ/pRxC3X85Qh
         HVhB+RqI75Qaxlw4l0mUsUpR9VXVMm2NU8ktHXnerEcrIKPS8EH+CukLSD9w6tuph1bf
         3l1vWWzVaJd63afT4g2NTJtgxgzJb3pFpaEdMufmtbpAD6DL5Barobnd6lRd9Kwgddsu
         xWwdHLWE40gr4CFkidqJYB+iOMy7jD2G0WhTXucTEc1Y6j53Bl28bNUrat0Of+xMedX1
         c9sY3yo0TAAtcRlN9w5aLT41NFUK4JeLk6PpOmuWCn7ZB+hk42snHUKl85UgIui3wOWb
         GgUA==
X-Forwarded-Encrypted: i=1; AFNElJ/ibDlErba81Jam18sAN5eL5PXHa+2w7Mk/Oa7Hf4MF06NRcLpTzyVeA19508UZ9lm/bwsrfT7QMxwCVcaRmqep@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbt4kUpkYtyKMqH/Bfrpp+hpI/m860M1KxlFLBF2wjUVe+FxWB
	PAX5Adwn8IHPldnLdIqP7wSWJR/77bYfNfiN0rq+tOj3I2ZD76HrMaklUqBvpN0PYA==
X-Gm-Gg: Acq92OEbhelh6rICq2J1Mymcw1NGyj0c2qYirlBqtQ7Bp9Vu/JiYLL44wszFhF8XK16
	BRzL76veouj10cQGrgL04m/IaMeT8V06QVwoOS0QUHA9wNpGCGcKW4DJ2rSOqSFnxAVu4WjFk2M
	p01B8ahyFGQZibEoaDgumnSUgh/3aEpDVav/o0EdMMe1K1XxH7DSpr/SqbqOZdxWHN9zuzOc20u
	WaMpraKzyth3G9Sue2Iz5NEcq3QIUcSiiYQ614+JqUflK3HJGv7W6FKgpcj9OsSqnzC4Tlzz/SI
	13p8FZv+tS6oz5TPFo4o5w7yYPLsfRHZEWp54+xTs5O5Ts5+dcsRnS0/T8WWaLpXtfA4sVXf0sx
	B2a6zsBhcNs3YB0UdoUk5qjNfg7ABuGEIASyGcSOjkMEQi2gy6UK8VzfzQqQVtYjYUJdZrfyA2H
	YazKXx4rzBR3MSTXenKKXVvTHspqBGQn/QTkpfHc0nE+4RRX1NU9RXnGi3NmDQxNcWmZEYKBI=
X-Received: by 2002:a17:902:ebcd:b0:2c0:c3ac:fdf9 with SMTP id d9443c01a7336-2c10eb2b85emr1851245ad.14.1780370947983;
        Mon, 01 Jun 2026 20:29:07 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f856sm1045999a91.3.2026.06.01.20.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:29:05 -0700 (PDT)
Date: Tue, 2 Jun 2026 03:28:59 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 02/12] iommu/arm-smmu-v3: Add a helper to drain cmd
 queues
Message-ID: <ah5N-3s6NrM8dJrA@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-3-praan@google.com>
 <ah4f90HTmum4ZxbR@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah4f90HTmum4ZxbR@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_202910_746048_28347025 
X-CRM114-Status: GOOD (  18.80  )
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

On Mon, Jun 01, 2026 at 05:12:39PM -0700, Nicolin Chen wrote:
> On Mon, Jun 01, 2026 at 09:58:59PM +0000, Pranjal Shrivastava wrote:
> > +int arm_smmu_queue_poll_until_empty(struct arm_smmu_device *smmu,
> > +				    struct arm_smmu_queue *q)
> > +{
> > +	struct arm_smmu_queue_poll qp;
> > +	struct arm_smmu_ll_queue *llq = &q->llq;
> > +	int ret = 0;
> > +
> > +	queue_poll_init(smmu, &qp);
> > +	do {
> > +		if (queue_empty(llq))
> > +			break;
> > +
> > +		ret = queue_poll(&qp);
> > +		WRITE_ONCE(llq->cons, readl_relaxed(q->cons_reg));
> > +
> > +	} while (!ret);
> > +
> > +	return ret;
> > +}
> 
> Hmm, this is not the unified arm_smmu_drain_queue() that you sent
> me lately? Do you want me to change this function to that version
> in my series? I thought it could go in with yours.

Yes.. I thought it could go with your series 
   
If I were to include the full unified version here, I'd essentially have
to include changes from the PRI support, which is still in its early
stages. I'm keen to keep this RPM series standalone to avoid coupling 
its progress to the PRI review cycle.

Anyway it's just a clean up?

Praan

