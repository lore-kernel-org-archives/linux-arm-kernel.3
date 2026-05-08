Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CACCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSX0WcNOlkvsZCAblteUbbAr85dTr3acCULxV7BG/80=; b=A32FgynRJ8hVMFT3aFS8zfGtZE
	u/vHGvU672DaPhnmTT5s3bsSZr7ckFdlCTkXgJsG9nBH5nZH4FmJ71rCNZUx6pbmdy6JjKGjjt0r9
	L4CtL6qEtm8mNr1ot7Tjm9AB+Z8fpFly+xQ5ZMcK/E+pbaIDPlBPRgwzfRZ5Bdk7h6JmAqqsGCQ6c
	vmPg9wPWp7z9hV4Nd5G5RWgipNpBXeauEqc61/oTXbnYM3AHgKNPeHvJLL49yqLOlSh7usID+K/5t
	rDFOexJITBlfKvhaFJ4tC+7mCHX8ApY9NaFK1m/AYK4I2LR81/SuFuSqWRd4QhTWMMbipwLeXaJCw
	U9B7YstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOZB-000000073q7-0jBZ;
	Fri, 08 May 2026 17:00:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOZ8-000000073pW-2EX8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:00:43 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ba180a022dso114755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 10:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778259641; x=1778864441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KSX0WcNOlkvsZCAblteUbbAr85dTr3acCULxV7BG/80=;
        b=NGp6NT5SD7Gqog8v/ZgrHFPbwdbfRaIIZfLpsH62U/t+MWdY+3C+rklTaMxWREI08E
         rleg2JmSJ+ZZUwTMapXtW0KsSjLGRAXGcIdE6WfpOrksJl/oz53lc5pYCVsI8VxLtV+L
         JjYeLnfn5wHR9nQ5qsO19eqs2KVTsy4yhbZmSrn58EB3ez5wEpTNwymFnyY4FL+tg54d
         xZWa1krt1TnJenZp/Qk8E4ISLrO5gCpFQFtlDQJv2Gs1N33kJEra292bguhzLe1uQ23+
         pwE7hbKRNl/VEID+q5Gd88o7NHlGPLnRqhkRFwsySb5nBW6OluxUzhV+WzOKVAVujN6l
         wA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778259641; x=1778864441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSX0WcNOlkvsZCAblteUbbAr85dTr3acCULxV7BG/80=;
        b=qeSmqnEKNE9JeqlYCNC3VQNK5Co7jw6A97ygUYnnJ2Nwf5TpK8b57K3pRBSBHVVJ3B
         wvyPz57fwVJsJJcHxAxKlp8D9qAd++v/LzinEB7o58NkDzpT14lI1MS9QgbuR0UUzHr3
         riuuQKYgX3MRM3LTPuqOoVayWGjc2O7LWMptnhN+wBfBVPg22z3C37QdrS0Dnpx63Vyf
         BPDxp7z8LiKT3ImhLR/kbATDrllL7i3WPskXMlGgNIKy0PAys/ZSOPK1zQnJxWjjiWHk
         +XUJXGETX+KWc0EzBA/L3lX//bpSuB6ju4WE7qHIsvQdvRC4/cXB89iXw3OZiTc16Sqe
         xv5A==
X-Forwarded-Encrypted: i=1; AFNElJ8ObvvrVgvwA/01SYcIyRLvF/mAxyjKzw3KUu4raiX2G5SeO06JPaq1z/nT9z5V2drTmmUrOjqBnZg8/j8G3tqC@lists.infradead.org
X-Gm-Message-State: AOJu0YwgyT1MygWryFa4ZtMm4kAihM/R1mHgHo8dxBOCYsbgmSkpCbU7
	v0c55kdDJHtBHQsTp2+QmvVwwP0I+yU6/hO01uK7Yxz7PIe6cjKOaZ1UMUqIxQJ3qw==
X-Gm-Gg: Acq92OEd1PMNmknxefRMduh8HgBYfH/eYQMafrFGaQC6Z18DSeSdgZeBW5+idHcdjxI
	1o0QffJ87Yc9ym4GEs/gn2KLPSScRzlRB+cXgSCmU8GJ1b0aHDXCbdpxoaGYV6XIRDCPAbOdD4D
	py2PuYh2Dg3JvKgpNgEAMQfwiHa/BPhyhBhhU2dEmbWo6eQrBfDOUpWDKPBDIIHA2jiPAgQC81B
	2P4rUYB2HMBf5D+tpgLS4ZH+l111w8YIQTlJ8kGTvQib/YkZe4tb4gVpi8wYbl/PLqG/ClJpdDa
	nt1XzU/e7etmNdd57w8vdzLYQFipY761REzh4nCquXboXotV2gsrLobwHmExEmbJA3vbaiE3aLy
	Ekd/Ii8aSchOD7msXNYpLb/X3Pma+rvXF3f0a2blbGmvHLWpBzpR9AcfSH5Hk1lzQrGWcHhFIhA
	ge7ScdxZgs5CkD9hJCR7MdbUfNUDzdJvop9wo8o/CeS+lLvGnRIOyeBtgAaQlpGNXn46PR
X-Received: by 2002:a17:902:da87:b0:2ba:f71:57a8 with SMTP id d9443c01a7336-2bae9e663eamr4007225ad.10.1778259640757;
        Fri, 08 May 2026 10:00:40 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d26944sm25742125ad.10.2026.05.08.10.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:00:39 -0700 (PDT)
Date: Fri, 8 May 2026 17:00:32 +0000
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
Subject: Re: [PATCH 3/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq
 submission functions
Message-ID: <af4WsCVOlOFBzy_Z@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <3-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af2ebtfgOPzJMXFK@google.com>
 <20260508160041.GF9254@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508160041.GF9254@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_100042_587564_6AFDF41E 
X-CRM114-Status: GOOD (  16.83  )
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

On Fri, May 08, 2026 at 01:00:41PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 08:27:26AM +0000, Pranjal Shrivastava wrote:
> > >  /* Should be installed after arm_smmu_install_ste_for_dev() */
> > > @@ -4823,7 +4826,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > >  {
> > >  	int ret;
> > >  	u32 reg, enables;
> > > -	struct arm_smmu_cmdq_ent cmd;
> > > +	struct arm_smmu_cmdq_ent ent;
> > 
> > This shouldn't be uninitialized, we only seem to be setting ent.opcode
> > later in the function. 
> 
> Yes, that's how the existing code is.
> 
>         struct arm_smmu_cmdq_ent cmd;
> 
>         cmd.opcode = CMDQ_OP_CFGI_ALL;
>         arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
> 
>                 cmd.opcode = CMDQ_OP_TLBI_EL2_ALL;
>                 arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
> 
>         cmd.opcode = CMDQ_OP_TLBI_NSNH_ALL;
>         arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
> 
> > Since arm_smmu_cmdq_build_cmd reads other fields
> > of ent to build the cmd, we are potentially sending stack garbage in ent
> 
> Ah, it is tricky, it doesn't:
> 
> static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> {
>         memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
>         cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
> 
>         switch (ent->opcode) {

Right!

>         case CMDQ_OP_TLBI_EL2_ALL:
>         case CMDQ_OP_TLBI_NSNH_ALL:
>                 break;
> [..]
>         case CMDQ_OP_CFGI_ALL:
>                 /* Cover the entire SID range */
>                 cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
>                 break;
> 
> Only opcode is used, so it's "fine"
> 
> Later patches remove ent and this trickyness so let's just leave it:

Ack. Sure. No strong feelings here. 

Praan

