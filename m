Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D6AD38FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvlZDl7Sj74xagDLD4MC5KELnDbe4Vh9GRDyybbfdBA=; b=OUmcss/4FUsXq4dbVL1y2jXGAp
	YMcbHBxSiIYLKErwUzCYlPY+lkgfcRgD9ihL+hNwur+761XzIsCtsNtmLBtqPrzB1bHp8mal5xnbW
	ttio+arMzGi5SggDNQ5kyYsFCxjtEx0RZENKgNJLP10+uUmrfWirDHsu4g+DPjza8p9dcjJE5Kltm
	Dm2//AMIEJ87Czvrn7EzSQHFd7TrcnqFnBQAadQI54miRa210obx4STw4N3R553zyCsobf9TtgH/s
	32tczHPWbdsNNOzkDtPTkwhPOPimhoa17Bc4UBAuAdAhbOT9iIxdSWlbXDfeR6v8HDU+Oyu02jBnp
	vvGQhfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4DA-0000000A1Mf-1vZB;
	Wed, 14 Jan 2026 16:59:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4D7-0000000A1LM-1G3S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:59:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29f02651fccso93805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 08:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768409948; x=1769014748; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvlZDl7Sj74xagDLD4MC5KELnDbe4Vh9GRDyybbfdBA=;
        b=qJpMyHh6ii/Yp7c+jgc7UCJHpeyF1hetClWDePj31dsVeCuvBsMnzvp8Sd70u0eDf/
         TKfarE1SZ5duPBlqH2HPjsmOBjEegoZudo3zoXIXkmB+Zpxyt6eTYfX7QR43NB6fz+o+
         7nkrPtNGNV411+8hH0GzHpwb5upN9JxjY/EmZdGxu7sImjeZP4FIcZh58lMzGy1Gg39m
         /YPmrOA057AFHMr0N0b6PsUyJbAbSTjgdtb6NVQzgp0BCnnbGo5gW5QDlWPAqeFHY3Yw
         ZyotCEIcGadUXPWiXtbHYW/0zchzDciA0cPIh7kSTHfuQA6AfoHtcIzpeSt1soj0aNjm
         F4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768409948; x=1769014748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvlZDl7Sj74xagDLD4MC5KELnDbe4Vh9GRDyybbfdBA=;
        b=ILkc8F8cD9j9m1JXp1uE4hEbQB4QgPXDPadCRp4PW1xMDXKnA0eBZ2Kvx2Fz+BYwUS
         XaxwuweKQ13CeL9uSZjmddkxn565dnhxPRZW/soGg/Di6XWMJklZXHzrdeVOzqhQprGO
         X2k4xQz9fYykJKPqc6kfHuDFN45UT9eyY5CQxO7iqHSjDQTum729Geh6an1AhG04SbTW
         78yM0FXb0BoPUIP/TcAFH8yZ+EE0Ta+rrLH+JqL69eq3oxAr6QO2Om9WiwZieP7/xhY5
         GS6jJ4ldv8OjuIeZ3gYpZDwy8vPqfHMfxsbxtoQebu+92lfgKfasP/HJ1oPJxxRvS1N5
         o96g==
X-Forwarded-Encrypted: i=1; AJvYcCWElYqMTx49KQWtm8mW2GbV0BTFPHaL9yG3Li76zkWq05DNGBwJ4j5EVgWozlx92ORxRurkkdZLc8wPe1b5USt9@lists.infradead.org
X-Gm-Message-State: AOJu0YyF+b5whqEBHMGFM3Lk1Qwy9lckQCXjwZD10TrZKO1qKzTtPBCH
	wNtkhsVUzjZkhMfFU8n8TW2OMNan6HaeD8aO83/SGazq2Yd2EzcT3XTP+2p/4csEZw==
X-Gm-Gg: AY/fxX4MI9hDIfmmgfctAM/0npuUSbzsfQ+Q6/xEQVdAApJSBRbhvTj2nzdQMlfftC+
	r41yIM7PIQGjiTfobUuq1WRr/rQdHUqj7/jNQRw3AFKpA0pK8v4DW/JP3w+LgeUEp+s8cYDcH4G
	n1keYqiOT87byKoaF6ln8kKnOFT3SqmORpB4Xd05Epe8957FqNJe9Lpw/3M1rj6WQJN5XeaFb0j
	pVZhnmSxnJ07xEUIXUuvWSwBkd4tk025bqT7PQXjpF5SgOq4QYQ3c35gNo9m/Z7BmrREmL/kwHi
	JTvaY7BsGlDV2CkuQ7YaJg/CBFXztJ2yjEDJoq9UcpPyWrcFGV+I2q8jZxn6kL2BnE/1s/6uRC4
	I0iVF80N2ma6aPqTz5PNUwMojpEo6OK0jCT7h2Xk8cTNcRElT3M9pHpW15vddFt2av8Jb9DHNd1
	cdLMFQlt6msfi1g3CssLeoRh6/anen6XQXVwpz1PgwzlipUZp6
X-Received: by 2002:a17:902:e890:b0:265:e66:6c10 with SMTP id d9443c01a7336-2a599a24a2amr3823475ad.4.1768409948061;
        Wed, 14 Jan 2026 08:59:08 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e381d7csm135568b3a.0.2026.01.14.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:59:07 -0800 (PST)
Date: Wed, 14 Jan 2026 16:59:02 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	xueshuai@linux.alibaba.com, smostafa@google.com
Subject: Re: [PATCH rc v6 3/4] iommu/arm-smmu-v3: Mark STE EATS safe when
 computing the update sequence
Message-ID: <aWfLVlDNZR5ecesC@google.com>
References: <cover.1768248467.git.nicolinc@nvidia.com>
 <b8055e0f0f1b4473db2583586350b4f7aa8f3b4c.1768248467.git.nicolinc@nvidia.com>
 <aWe9C8wwfszvqxR6@google.com>
 <20260114161557.GB961588@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114161557.GB961588@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_085909_337634_596237A0 
X-CRM114-Status: GOOD (  24.33  )
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

On Wed, Jan 14, 2026 at 12:15:57PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 14, 2026 at 03:58:03PM +0000, Pranjal Shrivastava wrote:
> > > +
> > > +	/*
> > > +	 * When a STE comes to change EATS the sequencing code in the attach
> > > +	 * logic already will have the PCI cap for ATS disabled. Thus at this
> > > +	 * moment we can expect that the device will not generate ATS queries
> > > +	 * and so we don't care about the sequencing of EATS. The purpose of
> > > +	 * EATS is to protect the system from hostile untrusted devices that
> > > +	 * issue ATS when the PCI config space is disabled. However, if EATS
> > > +	 * is being changed then we already must be trusting the device since
> > > +	 * the EATS security block is being disabled.
> > > +	 *
> > > +	 *  Note: Since we moved the EATS update to the first phase, changing
> > > +	 *  S2S and EATS might transiently set S2S=1 and EATS=1, resulting in
> > > +	 *  a bad STE. See "5.2 Stream Table Entry". In such a case, we can't
> > > +	 *  do a hitless update.
> > > +	 */
> > > +	if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)))
> > > +		safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
> > 
> > I understand what we're trying to do here but isn't this implicitly
> > saying it is safe to transition hitlessly to any non-zero EATS value,
> > including S1CHK or RSVD. S1CHK might have other config dependencies?
> 
> Will pointed this issue with S1CHK, Nicolin has a suggestion to fix it here:
> 
> https://lore.kernel.org/linux-iommu/aWarF90zBqxD0Gef@Asurada-Nvidia/
> 
> It would block RSVD too.
> 

Ohh okay, sounds good then, my client dropped it somehow. I'll defer
this to Will.

> Thanks,
> Jason

Thanks,
Praan

