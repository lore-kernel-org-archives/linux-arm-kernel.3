Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2DACD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMsfc8Zbf8JIkTQeMv/NJIxXAe3vZVoXdywLBqyZ2Qs=; b=2oU/UMldc8VdUo/S0emPow5Pjm
	f3NEvqdPVSS454T9clxCAijyXBvvXfKK+JW89Vk+sjESOeMKYnyjVzHflTH+XuSNadtcWN+b+bHo4
	dzTkVbaIPQoLJ7iK4kTPT4QUYz6xQdnAjh+9J7fBNE2ZlUXdesYFm357gleX0PZhjt3v9tRRag5i5
	vsFeE++8MKgZBS95O666hBJJWU0YwF3AgGHktMkf67EOikhP9AlMtSji9XbLkjJr83wQNSl1EQlXm
	bT9H310STZZo5s9P+tRDQ5GVLiUM6hvSDj/VKY0fvLjrhAkvpAhWG5993OisxhhGaDIPkhNpSKqV2
	rzt8fapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM9No-0000000BQux-2QxA;
	Sun, 10 May 2026 19:00:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM9Nm-0000000BQsV-47EE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 19:00:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b46da8c48eso375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778439605; x=1779044405; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bMsfc8Zbf8JIkTQeMv/NJIxXAe3vZVoXdywLBqyZ2Qs=;
        b=r5Jd9GgRiwZQWLmut17hjVHvmeN6ueCf0vfrTVSAsMo8AGG/PfB2axFbU6lkOsjkI5
         K4ozEedTaqOfuXMxNGoES16nQxuGBwMI1EkQcI8Llplmvnu7S/sRINmNcqVXAnVl9hvL
         MJ97YCQ7UJZjpibLSJoyV/kg4yMDdDpxWMJNsitHPMRx5vHAQr3Z+RoBbCDSq4485jZY
         aY0XInqrPvlYFVDQiNxhHEpJqeTY3LQytbunY/1Nv/GTUG3hsk45hg2TY9f1GV9pvvUu
         TDW/SiDmrjkKWNiYKH35KC1HRsfrUmyO8Y8JU9dfCpEswVlSOtxCPUXvfgFaDhMPhAtj
         mfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778439605; x=1779044405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMsfc8Zbf8JIkTQeMv/NJIxXAe3vZVoXdywLBqyZ2Qs=;
        b=jEVfZkHDY9JFY7gnG2A7xcP12Z6pBFa572hMSSBW6xdYI65uiRI3cM73wiA2Oh/RrF
         SoWPKv8AU8jtKJvYfPfLUe5nNIZpBRGg06z+pz9HwmxPuTLLcOs4oZ67kuhCxHvkOUsN
         3yVJyCIN37uh1F5a0IPgt0zfJLW3F3NWMRW7a6ZPk8DAmV1bx6MvH+rWUZbvIdKwcs2x
         4+bbxqp0wpKJvpmL4IvYEnoBJ8bsVG+F/Yn0OGPxRj4yu/Yeb8qC0f3ORqacNuLXfSTs
         yeg6HnR4XAd8Kbm3fCigffRGlYQ6hbs/g1lwRhuwAd9wX8YxMeU91H5DhXcPAGzhF6Tz
         eZyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CXw8giNI2MkX87jkqmTkwcGglCXgbcWKXFmxbGR0NtNXb3iEZF8oAKTNRA4BzVIpvOr//uJDeIJBX09o7JGJK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9/eIOx3yeSEH62wNcFdRxtd2lF7+P0WmDzG9J/pHpV6exxrCO
	/oIqcsqrG1gcWkq5d2Nt2fXE3tpjIdxk/stLHk4WtxieL6vTWbz5eGFRmKP+5c34Pw==
X-Gm-Gg: Acq92OF4Kh+9XXJRL6XJqFGKnzJwSReWCpX/3cpmKecCbv33F+EZAz4iqcVKe/zlf+l
	aJ1evHGOyZIOP4BTy58Lv8jeVAGOVigKsjzCuYlSQoRulR5XrDWhP4h0gXisnxowpUr4M1thHKZ
	gZ0EWzJSDZQt2+xnbaTmMXfYYkRwEBZ7kjmoXL+ijnsJD4Am8Y9ilqekldj1M1mMjFxBQjNiNQE
	XhSUjv19wSNf7bwBtEafkr8eKHkw0Daz1drvE9yJa2p1WKZNDAYxMhZnuk/yzCvNSnvDgYOAor0
	8DGcVD1RKa/CmvZKmfJBfYPPS1o27sET9LzV454YuYZBohG5u5cwIE3V5kZvnhiH+j6w5XTyfFL
	MFb9hYJCNZRCAInIEEewQ0ZG6dRJGqx9O7VVcKHNBCynTHago+hK5sL7GvTE657U0Ue+JJzeOFM
	G7IOknOXNIEMZNHQh1tmBURkx7lQ1nUrzgso/MaBrbPH4zcmbRk85Wqfc1EUq0apwr/Nq7
X-Received: by 2002:a17:903:8ce:b0:2b4:641a:6b7c with SMTP id d9443c01a7336-2bc7868490cmr2499495ad.13.1778439604484;
        Sun, 10 May 2026 12:00:04 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a8125sm18060689b3a.61.2026.05.10.12.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:00:03 -0700 (PDT)
Date: Sun, 10 May 2026 18:59:57 +0000
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
Message-ID: <agDVrTUTAIt1DpZ6@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <6-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af3KDBt8vhClSKEF@google.com>
 <20260508173736.GH9254@nvidia.com>
 <af5C_ax1a3LbtL1Q@google.com>
 <20260508233629.GI9254@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508233629.GI9254@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_120007_059283_A7508A48 
X-CRM114-Status: GOOD (  21.24  )
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

On Fri, May 08, 2026 at 08:36:29PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 08:09:33PM +0000, Pranjal Shrivastava wrote:
> > > > > +static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
> > > > > +					  struct arm_smmu_cmdq_batch *cmds,
> > > > > +					  struct arm_smmu_cmd *cmd)
> > > > 
> > > > Nit: Same here, why not  __arm_smmu_cmdq_batch_add_cmd? I understand
> > > > that _p just means we'll aceept ptr.. but the name's kinda wonky.
> > > 
> > > Which becomes a fairly widly used public entry point, so I didn't want
> > > to have the __
> > > 
> > > Though there is no external user of arm_smmu_cmdq_issue_cmd_p()
> > > 
> > 
> > It's just that we're calling "arm_smmu_cmdq_batch_add_cmd_p" at one
> > place and using `arm_smmu_make_cmd_<cmd_name>` at the other. It makes
> > one think what's "_p" in issue_cmd, only to realize "_p: pointer variant
> > 
> > I guess I didn't like the new _p ones but I guess it's fine. Happy to
> > leave it at your discretion.
> 
> I don't much care for the _p (and yes it means pointer variation) but
> do like it better than __ and failed to come up with another idea :)
> 

Yea, I can't come up with much either (without __ or _p), maybe we could
leave this as is..

The only alternatives in my mind are arm_smmu_cmdq_issue_cmd_ptr() which
is similar.

Thanks,
Praan

