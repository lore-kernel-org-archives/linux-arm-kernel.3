Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F117ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BRCH8Q+sSIoCslEFIamY+nsMlk/tKqIeqWpZmZWSTw=; b=B59/DhV+X7j83L+kycv2mDgJvB
	VuzpJhrXj7ysP2Na9dri6ows/E5MrOZgg6/4lbw1TPRE66RwV6uBYaOWLrP4wdqVk8wvbnJhCDR7H
	WYKMhAhbvI+JYaaC81t1BT56oVxSzffBb5fZQfLsU/j7IPMbSc/TI8QpoegdnpdsUw3nLjfM2qY6a
	PXdwvGAStGzuR58x17nIgtRdUGm3pRVq1YcGYwuNv5zxpbjVCiafegLAjoVhZiM4K/bM8lAfkHsz6
	qeP2Y9bDtYFfCFdfaB9Npw/Qx4utacEvLovNvyXZ1sXcZGDNpH9JPQKe+kNBJS74dBTpAU/tDcv3W
	+rQBUBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk1n-0000000GO1r-3AKv;
	Tue, 12 May 2026 10:07:51 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk1h-0000000GNy1-3TpU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 10:07:49 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b4678c6171so56077535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778580464; x=1779185264; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4BRCH8Q+sSIoCslEFIamY+nsMlk/tKqIeqWpZmZWSTw=;
        b=oh7pjXACwpgRURO6cyeUl/OR2p/fa5E65Tkl4y2sPl2FXvF6ckRQYy0lkq2mSk6dGT
         F2XR1QD6HhrggXhMD8Gr4eiyCwj0nfOrHh+jgSrLP3iyueJ89huxLAA8TnQZb/vFma9N
         PF7tcwF41j5TkNP2CoIrEypd1208NdleCPGR/dLqyhJgjOOanqR5nvj5z5pWgMu4zeAy
         OvvbpksK1IFs1hyd0lDfqKHO+krNnQIEFCcsNdBrT1/yqeARbA+/WSP4OWMuKNqWciIP
         vj6UxsjS4iEatsKgIZaldD+dJuZZR1EIaJIhJydKFNZjeAzbTFEpNHwolQrtJAciFItH
         jRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580464; x=1779185264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4BRCH8Q+sSIoCslEFIamY+nsMlk/tKqIeqWpZmZWSTw=;
        b=ngMhXPS5nGDvyOQSdE2erj7zXVWtS8tA/JhwYgdMGgTljq68CRve+Hq3mHQ6yH9DWP
         U7DG2rMAAj7YXeqlZFT/F5f4xwTlyWbIfHLIur1yioUDM7awECfIu8TZQnPdw8lRD0+3
         9g6dNXOat7h6c0EvYotiqgeJ3Ae9tHi7La9mc3d4UpLsSVYhHiALbl5R9JbeM1D6VOta
         gXP0I2dtmFs6ecz7wwPsx2Fh/qyR3+kgB+sLBddef8On2efQDDRaikX6ZjEiM+Pgbhsq
         /F9oFikbs6Y29Ofpkf/Ndz85sJXXRycxMMEtmwUkfuYgDalHTTWMK4XUbOxJinsceTJ5
         kVNg==
X-Forwarded-Encrypted: i=1; AFNElJ+MqrsmmpMBh7FoX6IE1R/fWk76xT+NmNmzv3+Nhuvma3/va8kV3xqQ3e18MXMVMRV/0ejlvbllsSvISUelnHOG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqq0syobPDXBYgAu0yU0Rl2WKp17RLNlUjpZwsqGvz+zTKCHNx
	gr4jq/37OrAlH0vCByICOkEEDqnGVgYHtl0fq8n9dUHCquU/m9dgGgnW98aMK9+Kr/L20xBCKpG
	DZRoEnGXRS135mapzat8WOnUZ+Q==
X-Received: from plqu15.prod.google.com ([2002:a17:902:a60f:b0:2ae:c329:bddd])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1ac3:b0:2bd:7ca:e67d with SMTP id d9443c01a7336-2bd07caea66mr18092335ad.29.1778580463897;
 Tue, 12 May 2026 03:07:43 -0700 (PDT)
Date: Tue, 12 May 2026 10:07:42 +0000
In-Reply-To: <20260509171013.GF9285@ziepe.ca>
Mime-Version: 1.0
References: <20260509171013.GF9285@ziepe.ca>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260512100742.2522825-1-joonwonkang@google.com>
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com, 
	baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, joonwonkang@google.com, 
	joro@8bytes.org, jpb@kernel.org, kees@kernel.org, kevin.tian@intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nicolinc@nvidia.com, praan@google.com, robin.murphy@arm.com, 
	smostafa@google.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_030745_867158_F9D788B0 
X-CRM114-Status: GOOD (  13.24  )
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

> > We have multiple processes and a single device, those processes want to
> > do SVA with the same device, and only one process will do SVA with the
> > device at a time. Though, the problem occurs even when irrelevant
> > processes allocate the PASIDs from the global PASID space for their own
> > irrelevant purposes.
> 
> The only way to allocate a PASID from the global PASID space is to
> establish another SVA, so you have multiple devices doing SVA?

Another way is via iommu_alloc_global_pasid() [1] and it does not require
SVA. No, we currently do not have multiple devices doing SVA. But, the
problem is that it is out of our control when any device is to allocate a
PASID or do SVA for its own purpose.

[1] https://lore.kernel.org/all/20230802212427.1497170-3-jacob.jun.pan@linux.intel.com/

Thanks,
Joonwon Kang

