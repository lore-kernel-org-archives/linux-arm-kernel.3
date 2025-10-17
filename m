Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79FFCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uOtMpgkdFsT3xs6ZaMKy6KvAAsnI9htzuHhcFlR9Cc=; b=HmnGbeLVGzNK/u3kT4dlm0tyha
	ipR+1GmrtzKzEl6+92aW1iCZbXpD0MnoZldL/atz7f4oWUzevwBpTs2JKLGDek9NKHSOjVPyjDjK+
	4M4Ppb5QkNI/8/Y3/bhRs93q4Z7s4ee3xiIYPsOay59T8M3yQd7Hk7WH/7kuBmZ46+CrF242VEdlq
	ASGS+L4e9FZ6qNd5u/ALPpIYMDClYoE5l+IGRaQojXKU32Kxp9UioBQrnYLlAvsPBJGc32g7GGFa+
	Xv6konYHjBFKDa0ZIwni1Tp/qct8qnEY3iau2/QSWO1ez3XM7PRfH56eorsNZFtiwwJqRkE8GVWN5
	k1GDxy1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9k8g-00000007sA8-0sBz;
	Fri, 17 Oct 2025 13:04:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9k8e-00000007s8W-1L06
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 13:04:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47105bbb8d9so53655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 06:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760706294; x=1761311094; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/uOtMpgkdFsT3xs6ZaMKy6KvAAsnI9htzuHhcFlR9Cc=;
        b=1gwHWlY+p9+g+H1auuoe7WOqqJqnj+Ns7mF+2g20ijItH2JP7ucm3MFjOwCpCB2oU4
         fCacJc9UpGiYPRp3rbW7AJIqLOu7z/WQyMdCo+hKkN8r8KDydNRiAty6vOSgKxWwmt6V
         4Uru0B9gEc91mbE+fysJyU8YhKGNu/kjjNdYShiBPCEeVX1TmIlDsisyfVptc8vg8Hl3
         pw53pBpLt4WHvqDVg8d687gzzV+GKPtSQM5aTvUrMsr86sflZj1t1eyTWgMyz0Ow6v/B
         7/IeRKI2hQj0jpvtdZMJipGuaVejE4nu/1jV5Pv4m4k6ZL7SFefLIMt0GhYjZYaBw6Ou
         /vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706294; x=1761311094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uOtMpgkdFsT3xs6ZaMKy6KvAAsnI9htzuHhcFlR9Cc=;
        b=EvEpBTHqSkZiW2TUPGaIT74pp4wu3UKmO+0PfqzJ0Zj1mTGgSerGZMPo/X5/RD6/oN
         eJoKdvrLuh2mlpN/DCs0IjNkjoJc+o5CXZ7mzBa4Mx4fMJJzRYi3ce8M77TPMmxDkJd7
         LebpK2NmK5fBcf19h/gk7L/eJgMjiFtDRrCA8ueeRbDZRhc/rK/A39Yd6NO6qc1MDwyR
         5HscqpPROCTSzPDl+8i63IBPHV8s8zovRyNsTl/ytLZn+nD3AOrTcSULCrbvDcWWE4lR
         ox4tm2U5tG4PyN0Ww/CqKoSj8fAcIeBFFRCc6f3Y7AT5Cf6/G0UhVviSMHG4Lmh7jYjy
         9HEg==
X-Forwarded-Encrypted: i=1; AJvYcCXgzY4DSK7cnwxIThosoqFQ4jaehMFpno79JoLYkDfbeC61ZNXMbZHME47DdCmPoC34P5IciOm+2HEMFm/Xf8YG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy0kWQ+z4wwo8cWkDuojO8+8xp0Na5jQP9710WBdwgntFDX5XJ
	kqKcRX+uD8vwknSim3P54jBUTRPWzSOpZcZGmz3LZfLNBqOQA0DMXwOpViekcEv1hHJ8URP/89N
	wmir8tQ==
X-Gm-Gg: ASbGncsk9gEgJDlJm57JwdOjz7sDZof/3K1/oRu3PixGMPs4Mn9feiRHLXC1oZ388qM
	Ya+H0EAbjAnz7cNTDlctnF62NgMp+mBE9QmhNhcUbYVptQhziixqGgpZHyZQsdoSfJpKkleOmYU
	J+hrtRg1jkkkpgqsNm5XhXu6+LWWFutPbHjqAU8wAj6YTrmDjsZfvfDCM720bZ8QhZKT8BtfL5V
	lVwHYzyZOhks2py4DujnlUFpUr96fXT3poD0x7Mbd8AzGgJEaNGgrrBlNxmKLd3lvXUikkNC22m
	ntvOlVVDdmU5wZRDO9hWS8BsUyQ5tq35JDmxrnkF6oRBNdsUz7ldc1Ni1Vr0pusrGJWmLMfPHd8
	Rd0aAlAnw+XwLA1y2CraIM7+/xfUyUlXHoy9aIf4RygSOZIIHl2TJWv1kSvRESduAp3f7tNUa/1
	84+R7N44TrjB9TigK7JqhtnQd7jrNN53VJMI3c3w==
X-Google-Smtp-Source: AGHT+IHHqOInInZkrsgUSaFHEdB/oepCnSzJpUuVqDSMtpMN/dAjmVaOtZHBHO2hfRyQeEAhX4nWOA==
X-Received: by 2002:a05:600c:c117:b0:45d:f51c:193 with SMTP id 5b1f17b1804b1-470ff2e9797mr4996635e9.7.1760706293693;
        Fri, 17 Oct 2025 06:04:53 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5d48sm83222295e9.9.2025.10.17.06.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:04:53 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:04:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v5 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <aPI-8YfqC83QlltH@google.com>
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-5-smostafa@google.com>
 <86ca3918-4992-41a2-894f-f1fd8ce4121f@arm.com>
 <aO9vI1aEhnyZx1PL@google.com>
 <b48193a4-a37b-41ba-b4ba-8b5c67d812bd@arm.com>
 <20251015151002.GH3938986@ziepe.ca>
 <73a1d5d0-8077-450c-a38f-c1b027088258@arm.com>
 <20251016172524.GN3938986@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016172524.GN3938986@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_060456_375638_1A53DFD4 
X-CRM114-Status: GOOD (  16.36  )
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

On Thu, Oct 16, 2025 at 02:25:24PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 16, 2025 at 06:17:35PM +0100, Robin Murphy wrote:
> 
> > In this case AFAICS kunit_device_register() can only fail due to OOM or
> > something unexpectedly messed up in the kobject/sysfs hierarchy, all of
> > which should already scream (and represent the system being sufficiently
> > hosed that any actual test results probably no longer matter anyway) -
> > otherwise I would have suggested a kunit_err() message too.
> 
> Yes, I think so too. Which is why I think the simple
> KUNIT_ASSERT_FALSE is fine - we don't need to over think something
> that should never happen.
> 
> Basically it is a simple logic for the test writer, any thing in the
> test body that doesn't work as expected triggers a
> KUNIT_ASSERT. Infrastructure included.
> 
> At least that is how I've written all my tests so far, including the
> userspace ones..

Maybe as Robin suggested, something as:
	if (IS_ERR(dev)) {
		kunit_skip(test, "Failed to allocated device!\n");
		return;
	}

Is simple enough and verbose and can distinguished from test failures,
it will look like:
[    2.095812]     ok 1 arm_lpae_do_selftests # SKIP Failed to allocated device!

Thanks,
Mostafa


> 
> Jason

