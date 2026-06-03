Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB6ACD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkdC3dWZFs3uTmguQZS1ztKpgkqPeW1kWupRwLRFJ1I=; b=1tGGglBhQGi8kgA+/cEr89YGvD
	dN2x1XniERpF1x3eKG3rQRXDRbXANDwpXBZUKKdwsINt+vD1SP/mzp/yrYVd3NXgdG9hjgySQCwvu
	KfbV1h531eZean53XwABBXhvvJrDYAnUVVoZM+i2bb3tqtBwuFHul3iLH4Bf79aDeaMzKnrgiDfOM
	psH8VLrI4dOp7KpN7WLfN+iMpB10VmVsZCbDL/RNz4gN2PR+xeRxcxaDLCrucmvVKWPY7uhc+Rk3U
	mkdriPNghEs0pni1IiQVKtaMdtIYQkBDQ/mXNCAO++vyaSdwG4hvHBZeYDWfe3HkoE6QZ52KisOPY
	5QuJ0S8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZyy-0000000E1AY-12ps;
	Wed, 03 Jun 2026 01:01:20 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZyv-0000000E1AC-3CJX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:01:18 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-91550c6ea8eso463928985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 18:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780448476; x=1781053276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkdC3dWZFs3uTmguQZS1ztKpgkqPeW1kWupRwLRFJ1I=;
        b=c+AzQ8ONd1BNAHls0JEtvV22oSs4IzDQao9lx0w5z0FI2lDduulLv7bsfZZX37Y5Aj
         uXD665W1dqjHBQa+ueFsf8csCB6BJMRt5Q2EvRD7MftA0iZTvT3DJEvd8LxSUdqEtiCh
         U3p6ocCmdQo7wqpRSeQNRubBmeyvq/t2NXTKJalUW2CLys5P3PR5viwU3pH7zgIT436w
         7OFOeGsBWmgtBfQPQv8/bxak9u5Y6FxrwCL0CZDzF/ZA0KiBM/c5eb46xc1JFllFZ4In
         qTtfbfZkTBcsxuyTvm5cQBJGC9QUP0Z1v+9IqfrZVMKOcCeAME5oHVYxuz6+W1ufy3c7
         pWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448476; x=1781053276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkdC3dWZFs3uTmguQZS1ztKpgkqPeW1kWupRwLRFJ1I=;
        b=R/YgYidcmsCBWDbgcmz1jBkhqazj7nF1z+TYZUnnW5bzNv0zQOmrt7J0NXe6x+rP3C
         YpB6xTF6m1+RFwGJ8k0e7xikEYMCguaWvJ8e234pFe66LO3E+0FPeDPuzxpjnIwYDbUk
         gkRmjiX+RoO9Pc31V9pmsvlVVX0UWQgt29UVhJK2hDr42bkKs2KNaAGqPKwzCPt7Sb17
         pxa+tsEYGc16IdKCi9dI5P/bPR6RytjU/1Tf09xisksHhymIYpH7Sej7agWGxV58iDCD
         1acwBB7/FnTYj2ORvn3j/Hamorz5CAftI8453ZN6cWVJPdWjqGtx7Bvg1c005OJrKFhV
         l7mA==
X-Forwarded-Encrypted: i=1; AFNElJ8naxtv5r84d4clA3mAbENXbjX+dAslBYap/WwIbgdBzXvlZPLER4jkTYuNxCUHiR+xWd5ib4DPUEpdpiqvc5Vs@lists.infradead.org
X-Gm-Message-State: AOJu0YzXBAhQLToX6BpNXuyzOYWU9M5CrxP4hLHedalicza/hAnjnEV8
	s1PMkN+H52WOeHHmiZRE4KPJ3zxwOQnc1AxYblvOxurkWDQoznFnlP1ne4uRew/jPcs=
X-Gm-Gg: Acq92OHwdixxC/x94vIvtJGkpbtUiGE7XBseTgae+pIV6kjrO64mpJPauIYPeVKi4FC
	DE3Q+QOy4KVgg5h4qVBuMz3DPdWbMMG0bqlfo3qDjk2SLbe2d6Hp4xbQco4AZ2+h5aOEV2hGuep
	yyW3oqIPKeMbmxxpoD868rnW57fHJAu00Nnbh6Mexk+Tvzx4oWZVMU7nhBrfRzjBq2EGB7Bol08
	VKzBEB5lkqo59BwVnKuEx1/GJN5/BMfmkkL3ptA70WBHoV24TzeSI1HabZNGZIPf53N5YnF98HY
	+Gw4S6eK3EYM88gTG7MJ2Il9bM987g7LMWPiWD26h/DpnX0S71tVQnunL6yZY5+QwDGnUjCqPGN
	EoccUoVPyfCsiFaGcB6lPOKk30Fr6AvdCNf2tfSFS8rapvT7I9uUSPMKA7b3vnC9QP4X+HcvJH/
	+3cPKyv58Y/S72pv1j6UVo4r2LkN20XdBAnNW6vK+tp0s276+Aj4h2xhVHA6FWyBJ31ezGXY4ul
	eVvId/vEZYxgL5Ryih4yQQt+mc=
X-Received: by 2002:a05:620a:21c5:b0:915:6c4b:eb60 with SMTP id af79cd13be357-9158a7b6304mr201153885a.29.1780448476209;
        Tue, 02 Jun 2026 18:01:16 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afbcsm101995885a.9.2026.06.02.18.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:01:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUZys-00000004xXc-0zdZ;
	Tue, 02 Jun 2026 22:01:14 -0300
Date: Tue, 2 Jun 2026 22:01:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Ashish Mhetre <amhetre@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, nicolinc@nvidia.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iommu/arm-smmu-v3: Issue CFGI/TLBI twice on
 Tegra264
Message-ID: <20260603010114.GO2487554@ziepe.ca>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-4-amhetre@nvidia.com>
 <ah87dzHOOTNGBBmt@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah87dzHOOTNGBBmt@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_180117_810686_8A601568 
X-CRM114-Status: GOOD (  16.44  )
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

On Tue, Jun 02, 2026 at 09:22:15PM +0100, Will Deacon wrote:
> > +	/*
> > +	 * On Tegra264 (see ARM_SMMU_OPT_TLBI_TWICE) re-issue the same
> > +	 * cmdlist with another CMD_SYNC to satisfy the erratum.
> > +	 * Callers must ensure the batch carries a uniform opcode class
> > +	 * so that checking the first command is enough; the iommufd
> > +	 * VSMMU path enforces this with arm_vsmmu_can_batch_cmd().
> > +	 */
> > +	if (!ret && sync && arm_smmu_cmd_needs_tlbi_twice(smmu, &cmds[0]))
> 
> Can you move the arm_smmu_cmd_... part to the start of the conjunction,
> please? If you make it a static key as I mentioned previously, then
> hopefully that should mean everything else is moved out of line.
> 
> > +		ret = __arm_smmu_cmdq_issue_cmdlist(smmu, cmdq, cmds, n, sync);
> 
> Sashiko is also unhappy here if n == 0 because we probably shouldn't
> be inspecting the command array in that case.

That seems like an AI mistake though, we shouldn't actually ever pass
in 0 sized batches? 'zero streams' should fail probe, not get into
this code, that might be missing but I wouldn't add checks here..

Jason

