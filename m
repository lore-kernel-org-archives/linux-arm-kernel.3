Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED31DCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oL4K+QK672gIoy66WKRaPU9V44+cmRA7Tr0h2RK+8nw=; b=V9uRd3bXCn4kh2JvxtFhm6piwQ
	wOWqtZJWme/4jik2ROf9UB+uIRG+Ij/6VSwwiPeDVRL2/RnVTo/9AFT1lryG/g9SoMHaw+oclZxxz
	FNvC7ioIaoQwo4TiXRj0hL++QWp3QFtOMXsreyDbFevwL/D5iMlSjjh/+7R2ZA+EGPCGm1GCW7J3m
	b0Z7YmCqe7X0bz9aGL15FihMYBgNq0c8JJLXKN1qcMnZGqBTmH0rfPLv0+PQNqRbXUZph7jwU9jFF
	fkumIU8pHCzw82PYw/wGEQVbwH0MGJ0kEHSYMQDw3tCR4rNmKJnqg/whncdFFUDh65SL5NSVGLfhl
	25a9DjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBLh-0000000Eg0U-1UED;
	Mon, 15 Jun 2026 17:43:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBLd-0000000Eg05-42yW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:43:47 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c67ea316caso4385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781545424; x=1782150224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oL4K+QK672gIoy66WKRaPU9V44+cmRA7Tr0h2RK+8nw=;
        b=tkh7V4Bfnj90qJWzOuqf1oOaNJGe/AHwTFgDcsBbZa+ZQoGnSG8p6YVzyCfR4O42z5
         8+cQztlHIXw+1IiDvwrFn6tTLugEDt4UCEAuqotX0f3XIw2Z+XSYtSaCUBc4ci7xs8uJ
         y7bposmNFHohRNI7RU7thJ8PZ+jdLfb8RuNLN5ieCTuCH9gOqxY04AtRRbWx0sBpdV6f
         VAX81Fjt2VSjdv34uoXEdzBoH+f1Q9yTGEse1qj8I3bGJOMHIyH5nH9Jdk731vCDvhEH
         yls5WfABw0LTr+eDiH+NHishPZscL0pe2itXuy+F5100rL4VIb4lwssV2cp/ZKiJPWzH
         VD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545424; x=1782150224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oL4K+QK672gIoy66WKRaPU9V44+cmRA7Tr0h2RK+8nw=;
        b=EM/1C/OBoL3eqKNrg9yMBlj3GevxkTTfA9bnHwzdJmxO15Dpw46TvclJMLi9c0PXRj
         cKb0Om8g6kdz8SDTZ3NxGEkfigAKJosUgn5Szh6TvdQsVs+0CuAq+eteQzM5+gE7gJ4h
         8HG/eIslear3SiRcxGQB105vV//h9MMk4r+j5bC0UuEtzZb5lqjKtWInPuEG1B9J1CfC
         3LM1TUQcAzCtzD2D/0uUle+4PAOZmRQtnKyKlAXkcOwhCLH1kBbFC2BMFMEqSowpnQqJ
         mAfZn7lnMpLtpKkqohQcCeMXwGhceR0mQAnbtanl8TCVvMlHEpX10CTJJYh9y/E3738w
         AiZg==
X-Forwarded-Encrypted: i=1; AFNElJ8r4NhX2ge1JV+HBZHYW3ozQ1XiPOR2LJiU5ekhr2p+rnYGsRVcygAvOuXCLm0v/fdJj2DOTWgGaZjwfLGnVJoy@lists.infradead.org
X-Gm-Message-State: AOJu0YxcySYOQy5dv+tjlvuvIMVupOUBm12rqFaw1f3DsHUADkYZ68nT
	6soenNihJcT2X4JOXWAx9pilF2o1WewGL19KqmnEcSmDGyMyFOjvjXAD8TPuUQIGOA==
X-Gm-Gg: Acq92OHJvxECDwneS2vpXFrCzXCVvGNZ0njQ6GGVo3i+yTasVfDCmIJlhZ+czjj2Ohp
	TUkLt5w1kuKMRJX8X3JV1MwQiLW8JJFzc5JS4yr6NF9OpXdBHVL3hjoUE7hOHfEq71x4XeBW65g
	SZKqP9JDSydWsO3z5MIJfzB67s28ihKSaakfoYsgMrpKuZa+nYtmpN3myWXJIt00msx2AS7+H4F
	9pVyF83xAptFKKvmyKwxUhOomMEU0lR11vyyU5nynEWd3bDuqs/MtoZbo+jHGZDfPoCyf2R/SIL
	GXaSDHFmze+mYmaRP1h0dfYp8T2YYVBQJJvoSwHUCcyQqLFmtn0UnL4OzmImRX1ehR0lU+jlBA/
	/cLZMUylhKcDwi/UdkMapubqg2vz+cTzIoSQl0EdO6uVc3mDTI9WGKomZLcZLrO4GgItNRt5+9u
	bDL/lNMC++7c7WyJ16Gvf3XLbMzw6SHGvYlWfuPaPwV4YBeDn53Qfo1OVvq29Ir+upgJNxOpg=
X-Received: by 2002:a17:903:3c48:b0:2bf:2e8c:db96 with SMTP id d9443c01a7336-2c69a3335d6mr167635ad.5.1781545423670;
        Mon, 15 Jun 2026 10:43:43 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ad03fdcsm10547347b3a.24.2026.06.15.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:43:43 -0700 (PDT)
Date: Mon, 15 Jun 2026 17:43:37 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 04/12] iommu/tegra241-cmdqv: Restore PROD and CONS
 after resume
Message-ID: <ajA5ydtvTy4hw307@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-5-praan@google.com>
 <ajAv7pvRlAgLR7cn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajAv7pvRlAgLR7cn@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_104346_028992_2A6CB84D 
X-CRM114-Status: GOOD (  16.06  )
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

On Mon, Jun 15, 2026 at 05:01:34PM +0000, Mostafa Saleh wrote:
> On Mon, Jun 01, 2026 at 09:59:01PM +0000, Pranjal Shrivastava wrote:
> > From: Ashish Mhetre <amhetre@nvidia.com>
> > 
> > PROD and CONS indices for vcmdqs are getting set to 0 after resume.
> > Because of this the vcmdq is not consuming commands after resume.
> > Fix this by restoring PROD and CONS indices after resume from
> > saved pointers.
> 
> What commands are exisiting at resume? Won't
> tegra241_cmdqv_drain_vintf0_lvcmdqs() drain the queues and make the
> PROD and CONS equal each other anyway?

The SW prod / cons are indeed equal because of the queue drain before
suspend. However, the HW registers in vCMDQ reset to 0 on a power-cycle

Now, if we resume with the software prod/cons at 100/100, since the HW
prod/cons is at 0/0, when the driver then issues a new command and only
updates the PROD register to 101, the HW will see (CONS=0, PROD=101).

The arm-smmu-v3 driver restores these indices correctly in device_reset
but the Tegra VMDQV driver doesn't. Thus, this patch was added to
restore both indices ensuring the HW doesn't de-sync.

This was added after Ashish tested an older version of the series [1]
with Tegra,

Thanks,
Praan

[1] https://lore.kernel.org/all/6afc3e46-489e-4741-96d5-8a2f72a8b431@nvidia.com/

