Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79F9CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TI7X52J6aApGzF9MwcE5Wp5s+0QmxzGTZI8IYa2JNaY=; b=4UORGQ8s2BCT/DR7k7UIritYnA
	+ChtwK1/2NyNdM0h8nZOWTD4sp3bpqxqnlkf4/rmk/hG02bFXHBQRAmTrNf98cCL1GkmsMOnrHurp
	1TXwWFVcn01bOr6GJ84ccijyLd2GuKkUeWXlu1kckKn5dbKymcdPdfz6UQPmT0u+DyD/882JxUU37
	56Qc6nu/aGzAbpru7WpxZ+s7TDfhsmeStaw/mBVdLyfJ8AUUAgn16VTVfY5Uh72ysRmdu/6//8GtY
	qoUi2x2xHnoRfUIo1VKlZP0fg7f/eukGBfZV0rpW458TQBJHvncbfbZFAGA0l79QqnBdLoon/mHoN
	DcNBO3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOpK-000000076dO-3O4k;
	Fri, 08 May 2026 17:17:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOpI-000000076cr-1Fk5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:17:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778260642; x=1778865442; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TI7X52J6aApGzF9MwcE5Wp5s+0QmxzGTZI8IYa2JNaY=;
        b=VinEjzy3F3LznS+LEoiyWvMwHugAZ7jgMHIEHT3Da6XNM0CuG5c95EOHo/tL/ShHsB
         iqg2W50oTIrtI1lrlCglIi/+vZsT8GRN4/H71fuMBZKzCwIOUjN/smFwhmkmi1XBCw7d
         VZTB3KHKtbfTcQsxdICDLiMf8nK/A/FMQSE6i4Gmc8SLKBdxejcmnBugfxEdtJWI9cxn
         fvJre2PvcQnCllqQmq6hf6iSDXRJsrywjFA+0jlXzpM+94/LRtKhE2GWn/VM35lBqRI8
         PFZYOqTe171D/iB4BfxtP+QqMmsgX3+S6CW7zjrz+Lkrhbvb7z94l9aCSoNBxVd/JIRK
         vaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260642; x=1778865442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI7X52J6aApGzF9MwcE5Wp5s+0QmxzGTZI8IYa2JNaY=;
        b=kY76ecGsZVQwbcMv+kTmr13QSjyjKsVz79BaHsiaP+pGudciVAPqf2W5tix80GyRy4
         Oc0VM3XrXWIrntiYtOmHX0rbXle53f/7Pkgt/dZZhf/hy1pX+yJaQkNLfejlsngkGHFh
         1+aVpfB/a+JSW2exotQheSzw0Fl4HTWUq3brT5xwRVLixQz4Len1FfcxqlrMKKwk5K1v
         qBIPcRrEAxmCAcIezP5gHNsGtcCAppbmxvSlJzQ/0olLahv2m3eivDI7V5CfYoPHeQY8
         EzeTj6IVLJf6YabT7UTv4H5bncKXCeqhV2ipQTVihCdFyxf2Gpt4JeaNqliyg6UGNaHU
         fYnQ==
X-Forwarded-Encrypted: i=1; AFNElJ//gZl3nmMGmEYB4KC7Yb0JV2mSgxSvE1WLaA4y+6Fa3NYRKfmU7s8x/YBaflbOAL25SyGRXeB1dRCkyOGTP7zC@lists.infradead.org
X-Gm-Message-State: AOJu0YwqUrgH0N9OXbAiE6j8dYjJ1m2sL800Hmuz/fQ/mlPGiAKi4Vms
	xL+TJvxmaPP4JpE/kLaTDtyqRg7nHrG5Nsl9QoGCgqXDX1HktWsze7MnRebv/3l0mA==
X-Gm-Gg: Acq92OHSts7LSRZ1+IkuYNP98jMZz4uECBq394JAF1H/yGfmwIaGilpv+fbzec9Roj9
	vml6BzTaq9syxAKvSkmEbkcAToy59JFfsSZGjkJ6LiIylAgwmEVsMqhcGe4YcZwmKKcLYDYkKir
	2dq88gQuuccMhMfQdWHT6ikpBNDTbc5yttrp688o9jyQYVtZRI2ei2D39FTZ2rPbGS5h4GtKEVG
	W+Hp1Nv72HmMpQYc7ep8Y6H4awYX8KNc4hmabUVLpRxKDcpkyaaQ5OjOH3bW8Tx7QlAOqXwKmgp
	oTkG8V0h7M0IBQ54san/UoCNKOLl8wUIY8SfvRZ4PdFODy3BXF4rW7qNJVnCOma/VKvmG2eCEfU
	CtzR/8Y3JXdUSWmifbolbnRDCVRadNpP9XePOWybf8nIgWWrG3wI+IWVmEugR+8nYsDJWrhDJ0a
	5evF5Kfo2che/jhPXZLcVZtGJN4VIKzfNy8LzxlxFQUBBB2FPyoPW2xkPhrlnOfqpSG8w2
X-Received: by 2002:a17:902:cecd:b0:2ae:45cc:aeb6 with SMTP id d9443c01a7336-2bc74753517mr64435ad.6.1778260641297;
        Fri, 08 May 2026 10:17:21 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367c2ccfbeasm311186a91.13.2026.05.08.10.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 10:17:20 -0700 (PDT)
Date: Fri, 8 May 2026 17:17:14 +0000
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
Subject: Re: [PATCH 5/9] iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from
 arm_smmu_cmdq_build_cmd()
Message-ID: <af4amt7Pzmq-xpLf@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <5-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af2w01YI01Av0Wg5@google.com>
 <20260508160236.GG9254@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508160236.GG9254@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_101724_348389_28F05B9C 
X-CRM114-Status: GOOD (  25.32  )
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

On Fri, May 08, 2026 at 01:02:36PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 09:45:55AM +0000, Pranjal Shrivastava wrote:
> > On Fri, May 01, 2026 at 11:29:14AM -0300, Jason Gunthorpe wrote:
> > > Nothing uses this, just dead code.
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > index b3ef001ce80d23..ef0907b1a2204f 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > @@ -290,9 +290,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
> > >  		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> > >  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
> > >  		break;
> > > -	case CMDQ_OP_CFGI_CD_ALL:
> > > -		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> > > -		break;
> > >  	case CMDQ_OP_CFGI_ALL:
> > >  		/* Cover the entire SID range */
> > >  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
> > 
> > CMDQ_OP_CFGI_CD_ALL is also present in arm-smmu-v3-iommufd.c
> > I'm wondering if we should remove this from the iommufd.c file too?
> 
> > This op code seems to be unused since 5.15, if a guest is running the
> > same Linux driver, it will never generate this command anyway.
> 
> Yes
>  
> > Unless we care about Guest VMs running non-Linux OSes, 
> 
> We certainly do :)
> 
> And who knows, Linux might start using it someday!
> 
> Guest emulation has to cover all the commands a guest is allowed to
> execute, and that is what the iommufd code is doing.

Alright, it makes sense to keep it in iommufd fir diverse guests.
No further concerns.

Thanks,
Praan

