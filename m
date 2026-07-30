Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6740EC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8Ig4gIXtYgwzGQ5I1LRNr2VPU7co1Asg23QpE3nNo4=; b=TNc8PES3FCAgVXNsiYdcJeEVQm
	WDgtNoZLNd+YKnp6415DsB9dYxj0rYneunaX+BVSaOhilz99oNac03M5W5I3HET0/yeWfXVIunRQp
	BKnByj5kNqLNoduMKumv2o6v/FJPjLao5aOmhzbtzNXTzcUrvoL7AZM2MadmH8PIjjPgUdrYDu9GM
	dIII+P8bOO3O5yTJ0yw4FEHUb87D6e/i0ieqgFJXyM/HsReII4rxwiten+q2DRY658YqKV5w+owP5
	WHglsXpSxlvHV7EZrc0mJ6xOawOfH96f3sbdUhc/PEXZdS5h3I3JMzlCzgB8pPgZCSssAL+lm6iqM
	+7QBSXDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpN5k-0000000A12W-2lsG;
	Thu, 30 Jul 2026 09:30:17 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpN5h-0000000A11T-2ISb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:30:14 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-69fec8b4638so10299a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785403811; x=1786008611; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8Ig4gIXtYgwzGQ5I1LRNr2VPU7co1Asg23QpE3nNo4=;
        b=LxNUzl59AdmtgmfFrJ1iD5+4IQvOXXydM2ujSg5bSBrufr1A4BX0b6VQziRXyGP5qV
         peBixQX+jddjDonLi6PvtCYTvVzCQWJSijjBHfdbd12Vghl5ue2fv+O6ScAjr7Zk9Mfa
         HniDY1TgXX+dB2WtXfalFgdTr+ExnC7470lYi0QMyZl3fMu+kZ2SGoQsyG11rpzhzrs3
         GQYC0lTdFEFY3BdBHoUBSdACXmVJbVn9XzXPWPXwVOJSyPP5Mrc8NqAbDWC4rnQkbAj/
         ysHmden04IdbBh8Ny1jUIXE2YjVUPqDOSTaRDM6qulMPXVQ9Hr+NauKW7uPnYObLrENY
         4TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403811; x=1786008611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8Ig4gIXtYgwzGQ5I1LRNr2VPU7co1Asg23QpE3nNo4=;
        b=Sq4jMwjlNIZJCLIciIaKEYvB9ut3L+6ZM/tcTCSdXNl26PjNAZlx3mvg+SgGXQRr7+
         LU+N4YJu62nR7TDnbr20dnChfd6Y3am83FC2zxGgc1wK2DSEDc1rkwgvgkZ68gYfXdDZ
         hJJJAJmPRlxXyRlQTGFTMfb3sISh6U+NgrMehnHZcmC6ffrUVLiwpy2FGgsFV/ywUH8F
         6KjicjIIMgXD8msIYSzxKn8h5+dAMtX5W3yLI8uF45zjvHz7iWgs2w2Cf9h2ft0wZ7QC
         POADQqdqGDZr6XvJRvWE6Q9lOmEjTe/e32KFYhU6yJ7RJyOi7ZjSwyVMXslm3IexCEfC
         6hcQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5WOMcADPnKSiqMyIY0NT+9bsZVvkaH3yvpfncGpM8O3yohEsEOfg/Tjyy9lgpHrjpQX6ywGyrhinQTB76G1bN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Iptaav/7xZCohG5Kr1FB54/B7DtVXQ5tweO/eQqeNUzAxjEf
	YL1wIkpNk87bi8ZYmjtaQPhpRhCr+OrblON+vWX9MjLbg043ENfH6SyohFWXlHuoKPwrEcMiND4
	eK/uBng==
X-Gm-Gg: AR+sD121sc7q070qYFhgghu42ruQ6iMDFrUFkf8HihtfrNfV9bmOV4crX10SFsX/BVb
	oc2iv5JC7jWA8jl4pAf4BdUWw0eSjHlnmIP7i1K2Pm4wKsX3US9Skh3KF/5/RYAeHCYS7TLFDlr
	BddvBJRZz1Vo2NlhqIxenUNman5ISCflkQ7pai3DJIuZQJL78YXaq508pQEj7b0ejxOi79kEHpA
	F0zpDXb1ScBYl6Ryg1d6j8PxKnD8qU9p7abXeke8V1YEUBFfUkUFR8GPOGY/UxtSyWqeNCdzydm
	RrDPkO7G3uP5qAxNAPbOY2xoM5HGdlh1nCnx3gn6G//tZ7S5Dn7xDAlAW4Sm6Vlp4W0a8NwA8N0
	3YHxiGfaP5ramc7UCIRlsyq+cielZyxVj7czZ1tFv8iuop1AbS+BQ+/BnnB4k9btpevfC3Rlx4U
	296Ex4BvYZSqcQZlfiwTqDFuo/4iajSzSyaj37n10Rtb4i4vnhvazIzUo9SV44u1VpALgWpdpds
	Tq5yQicB9IewRssVR21eAEwtKSZPQ==
X-Received: by 2002:a05:6402:1c06:b0:6a0:6677:37f9 with SMTP id 4fb4d7f45d1cf-6a07bcc1ec8mr29106a12.1.1785403809991;
        Thu, 30 Jul 2026 02:30:09 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d38318esm414754a12.19.2026.07.30.02.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:30:09 -0700 (PDT)
Date: Thu, 30 Jul 2026 09:30:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Linu Cherian <linu.cherian@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [RFC PATCH v2 0/2] KVM: arm64: Add support for BBM level 3
Message-ID: <amsZnfDSfWYpM9C0@google.com>
References: <20260723182140.4025575-1-smostafa@google.com>
 <amrDfR-6q3xAAkTq@a079125.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amrDfR-6q3xAAkTq@a079125.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_023013_606122_B30E9A20 
X-CRM114-Status: GOOD (  22.87  )
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

Hi Linu,

On Thu, Jul 30, 2026 at 08:52:37AM +0530, Linu Cherian wrote:
> Hi,
> 
> On Thu, Jul 23, 2026 at 06:21:38PM +0000, Mostafa Saleh wrote:
> > This patch series adds support for BBM level 3 to KVM pgtable, it
> > depends on [1]
> > 
> > Changes from v1:
> > https://lore.kernel.org/all/20260717130901.2239134-1-smostafa@google.com/
> > - Limit BBML3 to systems with FWB and DIC and remove race check.
> > 
> > Motivation
> > ==========
> > I have been looking into this for the context of:
> > - Page table sharing between the host CPU stage-2 and the SMMUv3 for
> >   protected KVM.
> > - Use the pagtable code to populate SMMUv3 stage-2 shadowed
> >   page table [2]
> > 
> > However, BBM level 3 is still useful for CPU only operations as it
> > avoids intermediately breaking translation.
> > 
> > Design
> > ======
> > Some of the conditions that BBM level 3 will be useful in (RWHZWS):
> > 1) A change to a PTE memory type, shareability, cacheability or OA
> 
> Could you please clarify how BBM level 3 is helping this particular scenario ?
> This is supposed to be a case where break before make is required.

Right, I initially misinterpreted the rule.
However, AFAIK, KVM does not rely on those, I added a comment based
on Oliver feedback in the last version.

I will update the cover letter. But looking again, may be we also need
an extra check to enforce that in the run time and fallback to SW BBM
as I'd be concerned about some of the KVM call chains as
user_mem_abort().

Thanks,
Mostafa

> 
> Thanks,
> Linu Cherian.
>  

