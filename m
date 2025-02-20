Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CF9C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9z6CJ8GEmOUY+R90CcF3D8uqozLmZO9LjzSZXbDX8o=; b=0yN716jGlWHfyWZMteIEiNw6DL
	wEyAVO+s2L/HR3O9h48CYy9yqOxGxYNRA1cCfnbmDpYWEARORnwwSB/8XSexg5mPXDVUwEjLlqET6
	w9/Qq8UYBc1E2pQNV7/gD2abf1RikOVbvuuRd8rZs+OiecUNGIgYxBlMiPZoNlx6GtprCmiWyUuUl
	FtvsMdAntCBZ3LAafl6z8sYjVMYeOOO+Tgmtbz7jlNF4RhqzgQB+oeC0iaRNgCuyaOaEHwN+Xn8aZ
	7lPtrCd19mx0O+5h1cGcFP21ALqNwxYOfmASsJc4EqDPLQb7+HgBsczHzs70R452t8NqsG1x7Ebt5
	I/TvlAEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9L0-00000001qPv-2pxy;
	Thu, 20 Feb 2025 16:23:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9DN-00000001nu5-1SHM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:15:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22117c396baso172335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740068151; x=1740672951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w9z6CJ8GEmOUY+R90CcF3D8uqozLmZO9LjzSZXbDX8o=;
        b=V0IlOa2Ylu+ExNRCrvz4dJeODs6Ft6jB5IcuaP9rv4qP9LEcfMB1cJRDILfcIDquwJ
         vfs4IFgQij1l+vmvAiBXN6Tc+IpTJ1SQj38HbtlaQaOaY8nkw1utKeBExC3IdMY6NTau
         SCueJNasmo1Ih8tEpR+TXHeeBHBOqYzlRAGDg57yzQBrqIi5jlptDdljZ1d5thJakdSb
         hJT4Ve1KQBVfSvvjDDNH00NeXTPbvmqcLOxfV30x5+GsngeWCijluPBYqeeOcmZELEtA
         +xhSOSQNEMp+YHB+YifV6p7OYOzwCWvnKVMy0cTawJZl52ydVtGkodrTwPIWbMjVz14D
         8GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068151; x=1740672951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9z6CJ8GEmOUY+R90CcF3D8uqozLmZO9LjzSZXbDX8o=;
        b=EegAZPR548TSoAijj8qa8whjAsxDBOPXsbparV7eksXWJlmApLFQB5VsIlZnli+GQj
         fEF4V/PvgEqiR6/AZyX29LanDaioiuAhpCRlHurDXe1cLaDzVp9Vuu/4PbZP9CM3pCmI
         gjl+qbL3rlWJqYVwH4I4nCG1qo19U7EZ22QNBy+yYW2Fb7eoieJgZ1lLNgJlQxPMEk8f
         +iWtsIpuiC2+MEkL6e7xLRMCvQJnoSH2M9XQWl7IrL8AOo7NHJEPJW4ysO4du9M7tI3t
         cL82m3fZs/7CrH0DeYgRWpMwKQcr+ZxgTCjEzBiPtDMhjVsldqG6pFaHHIdZ/nt1x9qI
         xVyA==
X-Forwarded-Encrypted: i=1; AJvYcCVtLCXn0h0D2KEQ8aEHroi6Q+NGwuNFvmL4/e9ZbGIibxyddNb4+QGokWxHA7p/6TjTse9QS3R5CundE+Jhu21Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxR6OhI2pKX1/5rCTpu7WuH9GoS3IU1xyA6qgQkc6mL2tR2zojf
	OEbj2jH3nEVc/EMDLYZhkw8Xge/FD5BQQjcZJZMeH6cmlJcd+/Dx8dHJEaZ3ZQ==
X-Gm-Gg: ASbGncsNl+EUlRIsbA7cJkRea5sIRKVAmcFZdBf657HWEL/KW4ILreuAWKEdkV5iBaB
	Gu4V/a/OBdd7A6c5+i26wBo3QKhidnHDZZA3e4ac9CZgQvtDDts1iz4RynGSUgMjfa+5P0kakaa
	dNNy2vTZe1rACUtZqRjMfpYVQ0KuKL2GWAQhzrQcjWKFmwPVmyJMUaZZKKNqHr+zpVz7zUW/VR5
	JBmGKtUqBApLvStLFtxWex2adGuP3XUogRs2Q+n/Ub0p7P9ILwQz7ZHTr+LbLXMTWgf3lHqZ11e
	l6arP/va7hhDStE2S2DmGV14be6IpN5F9GnD4UacTcNvAuHw6NIF
X-Google-Smtp-Source: AGHT+IEeeNO5YXG4GrTFzHJDa5KXpncdRPcsXRbYIZYGBm4w3MV78t3++PWrZwNmDnY5dth9MgRnnA==
X-Received: by 2002:a17:902:dacf:b0:21f:3e29:9cd4 with SMTP id d9443c01a7336-2218debe8bamr3119545ad.20.1740068151245;
        Thu, 20 Feb 2025 08:15:51 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc7e9325fesm8522382a91.46.2025.02.20.08.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:15:50 -0800 (PST)
Date: Thu, 20 Feb 2025 16:15:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"Liu, Yi L" <yi.l.liu@intel.com>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH v6 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE
 for DoS mitigations
Message-ID: <Z7dVLNLhP7VfZ-Ph@google.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <436ac2021bb3d75114ca0e45f25a6a8257489d3b.1737754129.git.nicolinc@nvidia.com>
 <BN9PR11MB5276291C74E2DF0C8821BE718CFA2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z7TOq-gIGPY_ztW7@google.com>
 <Z7TXQ9EdyvHp/lmD@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7TXQ9EdyvHp/lmD@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_081553_384012_71D57D85 
X-CRM114-Status: GOOD (  13.13  )
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

On Tue, Feb 18, 2025 at 10:53:55AM -0800, Nicolin Chen wrote:
> > > Is MEV available only in nested mode? Otherwise it perhaps makes
> > > sense to turn it on in all configurations in IOMMUFD paths...
> > 
> > I think the arm-smmu-v3's iommufd implementation only supports nested
> > which could be the reason.
> 
> I guess what Kevin says is that non-nested STE should set the MEV
> as well, e.g. BYPASS and ABORT, and perhaps stage-1-only case too
> where the attaching domain = UNMANAGED.
> 

Ohh okay, got it. Thanks!

Praan

