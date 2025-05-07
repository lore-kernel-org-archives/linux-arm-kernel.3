Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1C9C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMpiX2oAeFJGOcPhonwGxFO2XwnOZnyIjVcioz4mPT0=; b=e0eIuvFhe52XFM4jSJoKaVJsjS
	CjJ6qc1WhuMQe3UVAPvSDbcF70/TU77qEact+jaZBr2RcKaFS4w11OvfOzqCbMjZJRaEZxyfbF7a6
	IH4MLRfwwE2DNh+6CC9M9OzSzmKO2GGZdmnqikkkaodhMRpUHoeB5jLWE5vRELuFMRcCFsLDMWE+i
	57ESaotnDcyFJyE4bh1ztUjjxyKVMHQXSbWdRauz4sCiz6uqM/zMw/HgKOQnZNdRnuIaVWOi/WuEM
	sxRg5XS6sHFYNEyfQD/NmYwYSQMD6SU5mM9IOWqjgG34HXwgUQCFwcW9DGtmpHQBns1VY37KEtXvI
	qe3+Z33g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWo-0000000GIHS-2Lyd;
	Wed, 07 May 2025 17:25:54 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh95-0000000G41s-3vx4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:57:21 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6f545ae3c59so748006d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 08:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746633438; x=1747238238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMpiX2oAeFJGOcPhonwGxFO2XwnOZnyIjVcioz4mPT0=;
        b=CCEHMi/4WH7qmCfhgvysIX2DOVpH1t4T0XUGuKy7ZxA231OHxTh7Y4zaq7FoTqNDL8
         0azy7BxAD2++1wpqU/6CPXiVECgKBNLJZyuUGvQEjQoc4SVSdWNvcG+fl8/qXZF2nu3A
         Cwe8jWp1M8AFSgP16Am8gDtNjdNl1f7tUgJWC6Gk0qmvsre/MMv4VGMik9jrXV/JdN3D
         bdXA1CSvBWh2Gvus8+4W4YnzP8MhWsoDuut+ifTSbz8TqnvS/Y7A/r9MaesD+6e1fZTt
         ehlZWvFVpt21/pSjyX8Vj7amhazILXxEWpHaPmHP3LX3u8UkjpPsLa7kDYaRw0+v0RMY
         PTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633438; x=1747238238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMpiX2oAeFJGOcPhonwGxFO2XwnOZnyIjVcioz4mPT0=;
        b=ap8J1JAx+YCykRCKOT7hZFSBUI0BTAkOkOoUoly1WM4E5yIjjQzeMNvLjYHdjEJZXC
         8G8FPMpQ7gKTaS+RTw5KIfyh5sapfg9Zjl68qMe8BtX8hMgGVRRACq6Y+F8hbzKEU5mw
         rqX6D9b4ekqXqFen0WLSQ9Qeru1mmp5HBXPP/fQm9QTeV/FSYFB3i+KAaE6cRs6Ejufz
         7iGRLTmvnd36F7WtapL4QLyUwdZXUL0yYeNEA3kV9gtM+CUvD4Gi2WtTJnDS72lPC2WN
         45/fyM+w3LVH9QUNpXYRfYcjmCvmR90ksNl8d1qSyvcgYgrxVeY+rsm7pbgc1DLe37jl
         H4MA==
X-Forwarded-Encrypted: i=1; AJvYcCUSwRNRmZbiYF9z4NpDjqClGrp6UHC38oYWrtUqKWOaciY4nbp/a1C8S7GIHYjQNw9rfNUAKwK2ud1XAIPyCJ1z@lists.infradead.org
X-Gm-Message-State: AOJu0Yzemaqq4Aw87OYS2CvZeCgxChnqMC/RO35q0y74XQ3vEsHSNDYw
	4gAXdjc7iyre/UXsOCYp8X+Sy7jFr87zSAw1GHs6R7TBO2eT+fzX6/8vnRby7c8=
X-Gm-Gg: ASbGnctTpMAcC2QzPMA0DGdqQb0Sj/gy5+x/Z4nCnHZrLlW2WLvpk5Il/yh7CESOXHr
	96SwJbqjg8mt1WPpdab5GbV78qQRgHtyOuo8xRJaewmWUBZCJcBmKAJbq3RlKCwm009VyzGnkxo
	ROD2jMfQUPYIZhd+wED3E2dqRGzLdtnoSAmLmTPO2p/IspmoYak1KBdgpXnX/0/T5bBXWkodhzl
	3W8Kw1QeEE/C9HI8H1kiEmT3XXHhKPaqWuDEI1L1MJim/DGokJMwHRX+2l6c1ptZuz2yoJuRobZ
	NAu/lcC5bL1LBsQbT9ioTa8gY9DHh9g1b1D3MNTI+kOExNvKTAI3ca2YF+0Mi/pcTo25N2pXkeA
	d9rQYBGgdKEt6GVG7UtUQ9bJl4oztiw==
X-Google-Smtp-Source: AGHT+IGY3INDtooQYmwyNQCIEwpt7xooKZ7sy3RzrPyXtK9PFRJuzWNKcBsIXTsgY0x3k40zEUppng==
X-Received: by 2002:a05:6214:e49:b0:6f5:106a:271e with SMTP id 6a1803df08f44-6f542b03fd6mr64088116d6.38.1746633438616;
        Wed, 07 May 2025 08:57:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f5427b31a0sm15299126d6.113.2025.05.07.08.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:57:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCh93-00000001CGI-2d0i;
	Wed, 07 May 2025 12:57:17 -0300
Date: Wed, 7 May 2025 12:57:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Message-ID: <20250507155717.GD33739@ziepe.ca>
References: <20250507142953.269300-1-robdclark@gmail.com>
 <20250507144038.GC33739@ziepe.ca>
 <8965ec0a-97d4-423b-97b9-7848454045d0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8965ec0a-97d4-423b-97b9-7848454045d0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_085719_976534_A825A85A 
X-CRM114-Status: GOOD (  25.42  )
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

On Wed, May 07, 2025 at 04:09:47PM +0100, Robin Murphy wrote:
> On 07/05/2025 3:40 pm, Jason Gunthorpe wrote:
> > On Wed, May 07, 2025 at 07:29:51AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > > 
> > > In situations where mapping/unmapping sequence can be controlled by
> > > userspace, attempting to map over a region that has not yet been
> > > unmapped is an error.  But not something that should spam dmesg.
> > > 
> > > Now that there is a quirk, we can also drop the selftest_running
> > > flag, and use the quirk instead for selftests.
> > > 
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > > Sending v2 stand-alone, since I'm not quite ready to send a new
> > > iteration of the full VM_BIND series.  And with selftest_running
> > > removed, I think this patch stands on it's own.  (And maybe there
> > > is still time to sneak this in for v6.16, removing an iommu dep
> > > for the VM_BIND series in v6.17?)
> > 
> > You should just remove the warn on completely, no other driver does this.
> 
> What do you mean "no other driver"?

The server drivers.
 
> From a quick look, these IOMMU drivers have some sort of visible warning
> related to the state of an existing PTE during map/unmap:

Many of them are just using this code.

> while these IOMMU drivers do not:
> 
> amd
> intel
> mtk_iommu_v1
> omap-iommu
> riscv
> sprd-iommu
> tegra-smmu
> virtio-iommu

Which I think proves we don't need it and shouldn't have it.

Jason

