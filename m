Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C96CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loKnNwev14YsoZE1d3o7thL81Z2AYxmRTfk6YoLUrR0=; b=OUjGP62yvzguAuDMVwfAFM9PAk
	EYNN6dgqdP/cxr+Cb6723nF6gonMMGVAyix0t9rJha8aFG7o37spcl7qhN4YlYKs5iYKA76wo/Vd2
	O1mnX9v5XpzbwkQrww5xbChvJdiyP71Zq/3GYDQgz8QQvBLyse/4ZL4VliQBEKS07hapctVSEqiVl
	bj/GqhcWTljQDXNOH5OyuHjJUfrUfdUku4kxscIYQ0cZHCLH5qqzOIGTZjGLHGHEETWoRsx3ViryR
	KcYD3qFypUdfNsxssIItNRKd5F1GXcA9RJRmjfXxxddxAWk4F79dcwdoaBqLh1P+RGAro2MHsxAoe
	CxabBYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnOi-00000001PTc-0WWQ;
	Tue, 26 May 2026 08:44:24 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnOf-00000001PSz-0Uhl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:44:22 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-366015bca9bso8480754a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779785059; x=1780389859; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=loKnNwev14YsoZE1d3o7thL81Z2AYxmRTfk6YoLUrR0=;
        b=Wbz7MfqSpKh4zhqgdYWWyiAZND/pWAj4Ipobb1oOFusdl0bnrhXaT1SN11nEQoxfoW
         PCRYI++D0fmTn1w7BJbI83T+neEVNpBxvqea5RLhIbR19IcaRTx7BqHWqO62suJbJT6o
         LKVQU2+wqqXoLMhRQRyfHqD9U/IgUIm4CVGoIXBQxmoE4yzuu8vgPy7INLdIDSeLSg8l
         zOT7nLSUnCpL9OOn/DJGSfMcT813dTeaCM2TDYSA82kOmSAwl3/bLzBTNWhK1NOMTLFf
         vr9I14dJO2ODCRCT0InMAKpAG+sSeBsJP25w5zOc8QPKQRFIJ/obvlOe/D8pzE81ZjuK
         Fj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785059; x=1780389859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loKnNwev14YsoZE1d3o7thL81Z2AYxmRTfk6YoLUrR0=;
        b=STDg54ddV5Tq+gs3munhehQGe4q952OnhTty0dIRuOg944P1LMUENq7wxcj4bqJFkl
         1bzkeHd+x4rXl9wx6Z8qCVmyN1VuDHebOSC9uOuH9X4PF/aRDJ3qDw1SjaTvgbhQHez6
         G2ziXoEMuOp8fnSIYlIuoSEJqH+rPs9Y0ieBw2lWUCS2ZhCceHMOQsqIZBgIwaMFwEC7
         xsOMpHueiYyPsR6LLmPB+o6KJjktr8Kg5vEnf4LaqEOrJOPSRSumAVfNwdBd1/CQinw+
         QjZNLHKLXtp+oCe7Bo4JdhyEkg1yCQ94AxtywVwP6f44GPZbtQC2fa5/4yFjT0nrzRTn
         HNtg==
X-Forwarded-Encrypted: i=1; AFNElJ8nJcy65g6C+XCu4Jrmg/VmUOpp5qvIy8ch+/5u28J2HjVXQPZm0OnLyGCBn+RUItJie4F8r0tK8fP4aPBnM+EI@lists.infradead.org
X-Gm-Message-State: AOJu0YxMD3WhzdWSGAzBNyU/Q4vdSp2cKb+r8tmA+YJ8irSHi6sICdDP
	IuxZtY1S3ahBvyZv4JA5vfXqUO3g9SL/cNHFo/2S03CzBjXJn2o6IjAr5AIgUKPnN+6R1oU3gc7
	arDZDZLKw3f/EIkpkhKmD9PX1LA==
X-Received: from pjut3.prod.google.com ([2002:a17:90a:d503:b0:366:dd9b:644c])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5383:b0:368:7d4e:e778 with SMTP id 98e67ed59e1d1-36a6c78e968mr12498373a91.11.1779785059258;
 Tue, 26 May 2026 01:44:19 -0700 (PDT)
Date: Tue, 26 May 2026 08:44:17 +0000
In-Reply-To: <DM6PR11MB3690699A3178F1559D4BE1CA8C0B2@DM6PR11MB3690.namprd11.prod.outlook.com>
Mime-Version: 1.0
References: <DM6PR11MB3690699A3178F1559D4BE1CA8C0B2@DM6PR11MB3690.namprd11.prod.outlook.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526084417.970873-1-joonwonkang@google.com>
Subject: RE: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: kevin.tian@intel.com
Cc: Alexander.Grest@microsoft.com, alexander.shishkin@linux.intel.com, 
	amhetre@nvidia.com, baolu.lu@linux.intel.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	hpa@zytor.com, iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, 
	jgg@ziepe.ca, joonwonkang@google.com, joro@8bytes.org, jpb@kernel.org, 
	kas@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nicolinc@nvidia.com, 
	peterz@infradead.org, praan@google.com, robin.murphy@arm.com, 
	ryasuoka@redhat.com, smostafa@google.com, sohil.mehta@intel.com, 
	tglx@kernel.org, will@kernel.org, x86@kernel.org, xin@zytor.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_014421_200533_9F5D6A09 
X-CRM114-Status: GOOD (  23.60  )
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

> > From: Joonwon Kang <joonwonkang@google.com>
> > Sent: Tuesday, May 26, 2026 2:58 PM
> > 
> > > On Mon, May 25, 2026 at 03:29:24PM +0000, Joonwon Kang wrote:
> > >
> > > > Currently, the only known expected user of the new kAPI is our team.
> > Since
> > > > I test if the patch resolves our problem before sending it, I believe it
> > > > should be good enough. Do you mean more than our team by
> > "accompanied
> > > > users"?
> > >
> > > He means you cannot send patches like this that only serve OOT drivers
> > > to the mainline kernel.
> > 
> > Hmm, it gets back to the chicken-and-egg problem. So, do you recommend
> > deferring the patch submission until we find a new in-tree user of the
> > new kAPI? I believe we will not make our module in-tree anytime soon.
> > Or, is it like I still can send the patch and get it reviewed although we
> > cannot merge it to the mainline?
> > 
> 
> It's not chicken-and-egg problem. Just always send them together.
> 
> so let's wait until your module is ready for in-tree review...

Alright, thanks. I will wait until any in-tree users show up in the future
and continue working on this then. Please let me know if there is any
request later.

Appreciate all for reviewing the patches from RFC to this point :)

Thanks,
Joonwon Kang

