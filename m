Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12F8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQv8x46eYXApZo970LUOsV6mmTMwe7go+DO7Uot/fuU=; b=s34aj4heoCtIq3mwVMbmen1t4D
	bFkzVT1w6xDYTbA0pb8xOl29Q6HioHZ/fvNI1KLW1CV5W5WwIaPuILdqQL3jM4kyge6hytrMyELS0
	bWuA2rYIsdKYkxSYDqb64uIYkngevgjLFeP7ZdTv80wd1ZC1dSLXeFfvkBYMvTYKL5FoIAMb6dIoK
	uzTy+BM77Ek1oxODet9GENKuwO6BCZa7ZWIAg9TgrPScZUuTWvPvZYK6OvNnm9UkTYxHlaFIia5cn
	LJ4nhxGndkPYxXkbaF06v2CTqYqkf/5HeCrGOJ9aT4XHi4vTMYxjYSHmNMZiUW1mDWtUi3g4wdtDm
	y+Y0ktwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyted-0000000CVDQ-4BKX;
	Wed, 17 Sep 2025 15:01:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyteZ-0000000CV6v-0GGo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:01:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45f28aba94cso90145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758121260; x=1758726060; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQv8x46eYXApZo970LUOsV6mmTMwe7go+DO7Uot/fuU=;
        b=ufZDUVg4iGs3PpCD9qvFyTc9gjepypQAHwGKuAowEReb0KliQervcvLzu5mMN1D87Q
         0q9dQsH29bHYhOmqKQV9i3fgvURf9NIJDcBtDF5CwhArmebzBE5hBaiG7e184oYf6Cqz
         r2nxPkZnM2OYkBR1gmLZ5MnUhWP6cBIh93HJhZfiVCx9fZeThK5ByHO7EbMKN7CQxHxp
         d4cDMybXtqR0tTsU6SH+0yHJBd0rsGNp9F+dEpxSUP4Up5nvpTtSSky2irQ8dcXSgKGu
         ngxVxjuCDM9hf/yoqeUqCjA52gm5t75l0A9ArswbPXX36GMCR86sZQbCshTT+2EHDI9+
         5hUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758121260; x=1758726060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQv8x46eYXApZo970LUOsV6mmTMwe7go+DO7Uot/fuU=;
        b=NRsRQzzw8ReGATUsmerGYukwbTt0z/PLshBR2P9m0F0shd5R9PAKcdGBSFsntdxO4P
         oZ5dyKJ1U2iKgKBE7ZPEAXOHt0ZQsq199bGwRBHZ8t+Aer+/uvs7qe4u42sF4fjRt13z
         hazwSsSZr+No6SeCHIFWH1HGpvwdUIvDefOT7/u/PqRl46R/s1fg3QJnfkAgg0t5nk9a
         N1G9mcemJv7QXNTXHkcJyy0dO2Se9Yfsw4lH7CfVL4hGHTlmFtTLBwMnRp5GzMYkmLAG
         swpB7p0WOh9neAGrTWqOvCkfkIGIBtFWLdXcTC/f8hUhCSHgSQ5cMgVkREAvPxMNEMbq
         YbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaECvNFp53GuIIkymCWDmlhRgvH3SjwWOS9SmJublXD7zp/YTCcH07P2GGwWyRRhENASJ7xpYtwKOhUDjWZbgN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd0GYOuSdVuyPVNjk38qu8ZPgjHD/9TSSNWF1zanxuQBHreGFb
	lQsak/IPMtXRsBuDRydlVBjRTlR2agZ1lO+IMnmQaPzAnf115XMP26Jq0jN5IAPVOg==
X-Gm-Gg: ASbGnctX5LcVorZDmoeLI8iKTaM+9VMUiW0QFziko2pq6X5HWFdjDF6zU9KjEPRiy0L
	9IcvCSyLDXUKhJE0j5jQ8+NPfJ3GSUMNqYrITXNrAG4LUytNCxykCgvbgOZyYp6BghWOWzZMObH
	rIXLhoxWownU6EZIg9wuokqda0IY/OURFndY0veHzW01T2fg43ApWYi0ziZdWifSH487tQNAzBw
	KSLddbkm9V8Zyz+53dWxBLEUpUDKYXKPuTvCceKvoG7XX1DAUPLR4rHN9Ca6wuO0WAkGi7J6VkN
	1v69NtXqNDeOyo1DSLUqNTCmSNhKfukVZTlU9t8uCrMkZLE271b1PomYj2sujurRV7MYaqINkxD
	HoG8OBUu/ttFEICG3q2tN76vZ4yyjDKkzI64AWAJ8UVUrMSW9XlbKSnrRGCxX/ERsKzhXjQ==
X-Google-Smtp-Source: AGHT+IENFLjDgY/V9nMPy/hERD3SF2EFRD4h9LqOWJ4wBVjA8e0W/iIDo4QRwD9b9SDaGu4uXHig9g==
X-Received: by 2002:a05:600c:4850:b0:45c:b621:9199 with SMTP id 5b1f17b1804b1-461a1cdbcf5mr875645e9.7.1758121260129;
        Wed, 17 Sep 2025 08:01:00 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-462d525fdb2sm18471915e9.13.2025.09.17.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 08:00:59 -0700 (PDT)
Date: Wed, 17 Sep 2025 15:00:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH 0/2] Move io-pgtable-arm selftest to KUnit
Message-ID: <aMrNJw3obyu8IvBL@google.com>
References: <20250917140216.2199055-1-smostafa@google.com>
 <20250917144435.GE1326709@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917144435.GE1326709@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_080103_113102_82900EE1 
X-CRM114-Status: GOOD (  16.23  )
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

On Wed, Sep 17, 2025 at 11:44:35AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 17, 2025 at 02:02:01PM +0000, Mostafa Saleh wrote:
> > Instead, we can remove the __init constraint, and be able to run the tests
> > on-demand, and possibly compile it as a module.
> 
> I think you can just put the kunit in a module to avoid all this?

Yes, I don’t see the point of trying to run everything from __init,
relaxing that allows us to use more of the kunit infrastructure.
But, it’s more code to do so (it’s just longer to explain :)),
I can add a patch in between, modularizing the selftest before kunit.

> 
> alloc_io_pgtable_ops() is always exported, and I didn't notice any
> symbols crossing from io-pgtable-arm-selftests.c to io-pgtable-arm??

No there is not.

Thanks,
Mostafa

> 
> Jason

