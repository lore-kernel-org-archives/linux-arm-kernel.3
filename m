Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D7CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 20:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zu32dzAdarKxbcjgwX2AWV9AveqcvXYvabaFeB6Rgag=; b=Ov4TKDXhYKPuqln816oLzKP5hn
	5mezDJjazx14U2GF1u5/GndhzFXPqO+RZarwpi7talB6h4OTI2GWci5zfuPj+bfVd05xspjyCV7Mx
	NpwP7WMAHjYS2llG9+xfz6Cz0/c6JOT71Wi7yCB42B8tQFEWuBNbPg5hrle7rnM2Jn3zBKOlJU0We
	DO7Gty3uw+yF83RhnwXaEA/ovNJe9smBIe4LRxD8NSF47ZlXpOsY6/dzXhKuPvBWHfl5JNkA7aReT
	HsIoBOo19YJldg3MqgH1vMVYYOX/EtQfVMbtkzXXt2UMAVMtqxzLu6ijkOmKQHdG9BejW2MZIGz4K
	vD1Vu4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRW7-00000007QHI-0A9x;
	Fri, 08 May 2026 20:09:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRW4-00000007QGg-2FFG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 20:09:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b46da8c48eso1025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 13:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778270983; x=1778875783; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zu32dzAdarKxbcjgwX2AWV9AveqcvXYvabaFeB6Rgag=;
        b=PrFOLz4tL9N6uJD+KR1pYpkS7G52uHTrf2Y8ZUdakxRONWqVlV6ILzBg6Y8aTyiobP
         wK6bTjCmxDGzYg6i7/OjD1IHsOjmdfrdGSZ076xdPeZf6xrjxkTn4U/qI3QrRyHQ+u+X
         jqf2BVw6DizvXITLjEoOc+Q9T0kQOj2pAI80zyv64QnDSRbrTy+K2zRHHn/ZsA/ZoK2L
         FHjbHurEhlKUZJFWPCwkAjotbbRj6ktNpClmYFMnrS+isyqeLhpX5VYnxrFBxcLPMAny
         RiHfVgPMQfCI7irVkQW58/dkMUnE8IlHp4QuF5bagaD8F1/Hv4Dzdj5KKbbS43knMsuO
         4kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778270983; x=1778875783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zu32dzAdarKxbcjgwX2AWV9AveqcvXYvabaFeB6Rgag=;
        b=jrHjho4uKkBDavwLguaaSm/lDl8NWUgJpl3y6A6ByC1BVIWjVhROI4j22+oDTYEvsJ
         SS0ty/lpWMM9sKk6OyzFkS9FjyXn/JbO2TOp9LPqTHY7cpDgvXx7DD/bes4qL7JPtbf1
         ol+Yk7qBhxSJWXTNyHd6s2kCKXee9wjZu+rUpbY8FNPhxPyUJfxKz9aMmQzwDpezqZn0
         C7leGuKckPzSvgnh3j/o19ONdDH+Vrmk7NIP4zVMJwISaYFP++iYTXq1Gv/mRb/sjDEK
         9tdBHjE0BEuv6WVFkq7a7/NU+cE8lJYuHYLc+2X/QeQIdo1l6mJeO8hUGI4RKbijDY7f
         iQyA==
X-Forwarded-Encrypted: i=1; AFNElJ8m0+IijYPwt92V22l++m2Hf8XyH86C9LXQV1WY9KZCSTte5XY5BIMw7A7yjaJvAMHXXlgRdQZVKM1wErrenPDX@lists.infradead.org
X-Gm-Message-State: AOJu0YxF5L6R4LOeuKnDl2pTsANLMtVfNbumaiBTpgOyrP12h4DjiH1P
	+ILjVjC4RR64wEWFkyzrC/iyKrmfn2WBSfld0zAutOG/D2GVWoLkP1q1QlFuFTRRwQ==
X-Gm-Gg: Acq92OEiGyT5U+GB8+FWaCBGNF9+Ck4Z9WiYRgeDcOvNUaiGUIJr6W7QM+nxIkCh7PV
	Ewk0wUuQMIcZ58IXpt7BNuoSkm4gKTMssMVpGJEP7IbZ5Ytu2jef15TZLtkG70bZ23ZnBQHnQVv
	ZJ+6p1DBw6NnyTQHuMeEapm51ez+0MqY+PzGMS7HuDTCvAo+09OvebBPsv25o0OrE4I0mc9Jhjd
	a1FGQ+UhtTjszRXEODGkOdK2S3PRiRXcHF/C+DdP9CkrqJ0wOXA+aovy9XCBiI+3javVJaESQbK
	SJVxNiKx5t7Va4MW7BW7ejch/3w37tUv+H0VvDGexjZGRURlmawZshAMw3BzNYd+dsJv0PrHcE/
	1xvYOVEsu3OAU84MFHpjhuMYr6Ca7W/K8togNm/FV3GGO+SbemN+2HwOlWrQ3jPW+dZ7cijPhRN
	TdSzTK8NsqOA7ICC7VYZZRjWlVBIZPHD7IkPmM76xh2u+UrOl8lucP+S9zCW7Yczx+f4h/
X-Received: by 2002:a17:902:cecd:b0:2ae:45cc:aeb6 with SMTP id d9443c01a7336-2bc74753517mr653625ad.6.1778270980413;
        Fri, 08 May 2026 13:09:40 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35ba2sm33602775ad.50.2026.05.08.13.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:09:40 -0700 (PDT)
Date: Fri, 8 May 2026 20:09:33 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 6/9] iommu/arm-smmu-v3: Directly encode simple commands
Message-ID: <af5C_ax1a3LbtL1Q@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <6-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af3KDBt8vhClSKEF@google.com>
 <20260508173736.GH9254@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508173736.GH9254@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_130944_582830_D720767A 
X-CRM114-Status: GOOD (  34.04  )
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

On Fri, May 08, 2026 at 02:37:36PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 11:33:32AM +0000, Pranjal Shrivastava wrote:
> 
> > > -static int __arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> > > -				     struct arm_smmu_cmd *cmd,
> > > -				     bool sync)
> > > +static int arm_smmu_cmdq_issue_cmd_p(struct arm_smmu_device *smmu,
> > > +				     struct arm_smmu_cmd *cmd, bool sync)
> > 
> > Nit: I'm not sure why we need to rename this? We can still define the 
> > rest of the helpers like:
> 
> I made it have the same naming system as this:
> 

I know lol, I just meant why are we prefering  "_p" names. No strong 
feelings here though.

> > > +static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
> > > +					  struct arm_smmu_cmdq_batch *cmds,
> > > +					  struct arm_smmu_cmd *cmd)
> > 
> > Nit: Same here, why not  __arm_smmu_cmdq_batch_add_cmd? I understand
> > that _p just means we'll aceept ptr.. but the name's kinda wonky.
> 
> Which becomes a fairly widly used public entry point, so I didn't want
> to have the __
> 
> Though there is no external user of arm_smmu_cmdq_issue_cmd_p()
> 

It's just that we're calling "arm_smmu_cmdq_batch_add_cmd_p" at one
place and using `arm_smmu_make_cmd_<cmd_name>` at the other. It makes
one think what's "_p" in issue_cmd, only to realize "_p: pointer variant

I guess I didn't like the new _p ones but I guess it's fine. Happy to
leave it at your discretion.

> > >  static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
> > > @@ -3464,7 +3405,7 @@ static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
> > >  
> > >  	cmd.opcode = inv->nsize_opcode;
> > >  	arm_smmu_cmdq_build_cmd(&hw_cmd, &cmd);
> > > -	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &hw_cmd);
> > > +	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, hw_cmd);
> > 
> > Nit: are we passing it by value here? This would be a 16-byte stack
> > copy? As with the macro expansion this looks like:
> > 
> > {
> > 	struct arm_smmu_cmd __cmd = hw_cmd; // <-- Redundant 16-byte copy
> > 	arm_smmu_cmdq_issue_cmd_p(inv->smmu, &__cmd, true);
> > }
> > 
> > Why not use arm_smmu_cmdq_issue_cmd_p(inv->smmu, &hw_cmd, true) ?
> > Although, I see this is eventually cleaned up in Patch 9.
> 
> Because it is eventually cleaned up in patch 9 :) The point was not to
> change this logic in this patch.

Yea, just trying to call it out for a situation if this series gets
merged in 2 parts. Not suggesting this would happen but helps to know
for bisection etc too..

But I understand the point on keeping the intermediate diff clean.
Always learning :)

> 
> > > +static inline struct arm_smmu_cmd arm_smmu_make_cmd_cfgi_all(void)
> > > +{
> > > +	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_CFGI_ALL);
> > > +
> > > +	cmd.data[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
> > 
> > Maybe this is a good opportunity to define "31"? We already have a 
> > similar definition for TLBI: #define CMDQ_TLBI_RANGE_NUM_MAX 31
> 
> I went with how the spec was written. The CMD_CFGI_ALL has its own section
> with a direct encoding of 31 in that position, no field name.
> 
> While CMD_CFGI_STE_RANGE has the same op code and names that spot
> "range" and it would be a NUM_MAX, we don't use STE_RANGE..
> 
> I'm inclined to leave it for someone who adds STE_RANGE..
> 

Alright. We'll wait for someone to add it with STE_RANGE.

Praan

