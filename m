Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4E7CD484A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1t4Q3YbgMx/6e1k8a1sHgBJ6iv/rwR+3bFc9xbIXC10=; b=tpSRCkJjvZI4oL3ta95eLEntGy
	MFoM6BfYdlEu4B37+nl76BUdVoCKZOdIrlEPfVD9lkpAwQKdIOibh/2bhXVGsQBNkKdrkz9SVRfJ3
	2GBOoiQr2FNCU9XKjWM/U3vw0E0W6cXYrKL4W8ueofItGJJmig2N3ZlDbdcAIug58XnKkOKQCyT+6
	AGIIZihNSKxGeknCJ4oj0fy+DOdId+8Xt8ABMLWvcLdGWNjHdSOjvE4SjG9EsNTNHcVk9D2xmwwi/
	c/SXOOwzv7Wv5YQwS5PtmPKb8MHaiSRFgORiCYtSbe5t7ggPUK1Hx+waJFoXoY7p4Q9ydFrH4rET2
	RCWGoBQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRew-0000000DuoM-1QLx;
	Mon, 11 May 2026 14:31:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMReu-0000000DunV-1ASv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 14:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1t4Q3YbgMx/6e1k8a1sHgBJ6iv/rwR+3bFc9xbIXC10=; b=moXKbWcCbKKlv3xZ1YwdKsrfnK
	rggu4NWSpkEFBpP5cOqHie5ehwxvO7YW7wQ6POT3sGWisFTABKf7wwbrN7+0sx0KXXEqmAXtNRiqI
	RRHRRKOv3U/X7bZyhPtafaY26Yia4BkP1r9cz3aYFI8tZ48SR2QG51/jirHmJGSbksuEM8cCG+9cU
	US80l6pXRXkHYCrvqYtbF/+2FXcHT2XnUpGCuh0tglywL1MTF6DDk8m2gO0R7jYV+6Ybno2GOOjgq
	BAdQJST2QKVQd7nIs7RXoj/V8p3A61PKL4RQ0n6bJS+a+wVOj+ZY8ZNCtZzMwE0Su6qxOxPrmffLS
	8kWCNHQw==;
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRep-0000000Bz2k-3NYt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:30:58 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-514ae601e01so15857321cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778509853; x=1779114653; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1t4Q3YbgMx/6e1k8a1sHgBJ6iv/rwR+3bFc9xbIXC10=;
        b=dva7V75Ux166O+FgwtyguypidXZNEkDgbgs2QucvZLJRAVoocTPahUZ1lFUpIO41lf
         z9VwRw572vdZ1PWIh0swXGOznITwDrefCsXbShUAfccXEbM+6dc04UyHRRtqBWRTNZge
         6WOEMouJ1e/9tY6ijy+KbxtetPAkdO0+0i4mQ29/osLl9/v3r9rtxU2OCmNyPu4aFG1j
         4yprN89MndpB8GvghmTsD8ZwcfWk5OfhaVkWJ1CMU7Zk+o0Qup7hEI92uT/2dqGpX3Ce
         hMyKGaBZb4bbR8GpGhC35ewELi/iuXoy/n7NRXUd3YJ5HhqVOxHnqDPKOhAGge97l6Vf
         u3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778509853; x=1779114653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1t4Q3YbgMx/6e1k8a1sHgBJ6iv/rwR+3bFc9xbIXC10=;
        b=hZ6w3QwKliArhPQxJok9+Cqs7ZnJ9+5VDOYMirlXV7S818Vl+5NfI8Fg7LRxJe/q64
         aiAT40LX9QxBVr04TOsupSR8xyRM3JuOLGdYxdBoqaiPbDDPBXjTagmN5Qb0WkBJ+ai9
         roUZDo/Os/00yfwnxgkp/d/GUy2BnGx2I85tzZnyGeLngwAxuhHr17Rc+JYuwYnvm6xA
         LkarUnKTCFPvdI3d3WqZqDApq8l55PWfZK4N3aQWfixDfQnLbBI+GyXTjTLapK0y2xJh
         6K20lf5aE89T4+7y69FCy34/HJYDT5qANamVk5gdiSkuWH5A6G38ZaNOaipTaQdPA6JY
         MUWQ==
X-Gm-Message-State: AOJu0YzwfDnn1sCJZ79Q8PZ5pf/xHJG0DSPmYPZsDAGX42JyyQSsSiJf
	Gsf6Mex3BlU6BW0sVAwwGYsuRJvV7m3mm9svmRQFUHaRAnmtXmLWBPzYQl1CHZOvpIc=
X-Gm-Gg: Acq92OFhpuKREz6XNfXFTKbYFe3Io8QaNjGU0YiDN5F90bDfsmp8tZ2bJlN4AMUsPDa
	nUGj8YOLIhf1o1hrxSfETvPUweniswJPdp9yyhHUBD69yh/Du1+Bm0OroejVzef/lNdau8+/jVa
	vWchkD/nWuoNw5DeLwqvxO/y5t/ODcizvZX+tjgFX/fSXo4v1CIxyu5ru4vXIOEomwv/52okrUc
	NjI28x8c5UHZ0ElyKbOG4b6AIbDsO6HjlXRGStJyV2nQE+SwxK+h8emMir5Ub/+/4esBdcwDVBm
	IreJtpXfgdRQcFKcWbLnF9uetzM/LJHuffOgw0v3xGxpuj1gKNFnFQyAIDPZjXYEk8lRCcLpCjQ
	gU0QwN8ocHle6O+Fi8kW35W4eXbUUctoY6nqa7xwMpJCFPRbkjiE6v0pQO0U/cCyd+Y9HPb4FME
	LshsXPPhjPD5NUY7UVS5e8of7sV2Aa4XcNTjIifdXtx6hPPo/Wyr/wFLbwduuBjO0t7QGAF9B1V
	mFrCw==
X-Received: by 2002:a05:622a:d5:b0:50d:2a76:43c5 with SMTP id d75a77b69052e-514619de7e5mr335362441cf.2.1778509850538;
        Mon, 11 May 2026 07:30:50 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83aa2bsm90525421cf.28.2026.05.11.07.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:30:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wMRej-00000004oIk-12xC;
	Mon, 11 May 2026 11:30:49 -0300
Date: Mon, 11 May 2026 11:30:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 05/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <20260511143049.GR9285@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-6-smostafa@google.com>
 <20260501124716.GD6912@ziepe.ca>
 <afiODW2sVMeOj3Ag@google.com>
 <afoagb/wVBJD1IX+@ziepe.ca>
 <afofSPQbepd_fpom@google.com>
 <afsQTwO3eW+Ks2fe@ziepe.ca>
 <afxlufh3t3hRe4-G@google.com>
 <20260509233443.GK9285@ziepe.ca>
 <CAFgf54rJqq_bJONpx85p+uB68i1oVAGZW40aZA1ufid_5fqwQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgf54rJqq_bJONpx85p+uB68i1oVAGZW40aZA1ufid_5fqwQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_153056_709044_4EE3DF1C 
X-CRM114-Status: GOOD (  21.85  )
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

> > Copying a bunch of functions into a shared .c file exactly as it is,
> > then compiling the shared file with some #ifdef'ery at is going to be
> > long term better than trying to mangle the whole thing to avoid using
> > any of the core types and not directly share the code, IMHO.
> >
> 
> There isn't #ifdef'ery at the moment, that's what I was trying to
> avoid by introducing shared code.

Yeah, I think that may be a bad direction. Ultimately it feels like it
will be more burden to maintain this careful split, while some small
list of carefully selected #defines will let you reuse alot more with
no code changes and I think that is ultimately going to be better.

> What concerns me is how fragile that is, any change in the main struct
> can easily break the hypervisor, unlike if we have a clear shared code
> and defined API that is used by 2 entities.
> I will think more about this before v7 and see how intrusive it is.

IMHO so long as it is easy to include pkvm in the compilation I see no
issue with build testing the pkvm driver when working on smmuv3
driver. So I'm not worried about this, any breaks will be compile
breaks and can be delt with.

What I'd like is to minimize logic changes and maximimize re-use so
you don't have to make bad re-implementations. Like pkvm shouldn't be
building a weaker tlbi, it shouldn't have different logic for errata
and FEAT, it shouldn't be doing STE changes without the
hitless logic, etc, etc. All these things are easier to solve with
greater direct code re-use..

Thus I feel the trade of off 'use the code with no changed via
#define' is better than 'try to carefully cut away and avoid #define'

Jason

