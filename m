Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAAAC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUrSKghuESWPVo/dW96oFPOfRQeq5DnIatYi5FWLDOg=; b=Makjij8ZA/Nw1VmkKTBbBVnPIx
	UQ9/bWGyEL6bWbZ3uyUMq3VMeiONbgPughOCPUCHQq7QOkF2s7VJcPaTQldJds+JqJIE/Srs++pCy
	j7cL0AVYGBDu2iiHKYXti4OE0y5DXobR+G9eH3Hq/OywxuuHme6U9uoIg54I+yjalw/Ven+cl6vZq
	YrvTbhif77GLsG3fPTqnoBNY4m8gzhsqlU0zBurJPtUZz6kVJUDpO/B4qyx2c5eCc30S8/PxYsMSH
	t1CGyfl5TNBNPeMGstML/NQD8X9+0Dm76P6rO17ab4IOlDsR1Sl0Gx/oQxJA3ZwoglDJYRpAxiElu
	nwYJBv2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wox7l-00000006xlx-0WcF;
	Wed, 29 Jul 2026 05:46:37 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wox7g-00000006xkJ-3Zmz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 05:46:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ccdf36f63dso73075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 22:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785303992; x=1785908792; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUrSKghuESWPVo/dW96oFPOfRQeq5DnIatYi5FWLDOg=;
        b=n0miV3w+POmPm9aigPVz14bq6W+xJvP+E1IFaZs4sO/ZKdcSHGAQB1u2jPMbIFyQGG
         uO8dCw6yLgVRCiQlENENaNa5M7nUO7b+RmPqcIS7vU/vnSmTxDSkrgsZFAd/R0NzJ8tZ
         LTI8fg4g5lW1Negh42cjpzUu4LY8+s26KcJt/70NZqc4YUhc88Ewf4CT5aELzm7vIGSp
         irQLfX2dVfxPRo4EfXwJdTbDNziwUppE/+etajq5ilLR9aNdwdkLP+p3+dDv12NCeWkI
         W/QSBoKwcto9fsMdjMbqeTDHJLgfOYQzQ0Y+dcgQo0lAEty55fMYyU7Zd9w4RvvnGNsI
         fdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785303992; x=1785908792;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUrSKghuESWPVo/dW96oFPOfRQeq5DnIatYi5FWLDOg=;
        b=kS8iEbLR6N+ZWEzM93eSoKeKwsc8BrcW7Gc+9IXZ37mKSx+6PHXBzUBkKJCoD+Wmth
         I8YaY8eBqM1OsxDVlNMpHPJMeUOteDiNwdUMU0WCtuuFDAuA0IDtGSU9w93EM56ur5I9
         D5TR9QZFXl9z11ZQJ0hpNLxFjn+ZQNUKUfxHuFzFhn4mvoO5vrOLoy2vrPW4cJB4jgx7
         rSj44LOtdyjxuEgTIzjxg/CgU3ziYV9VOJ3J13VXlQYviNfO2wbOB58G+7QuS1m7GNgL
         x14NIRzyKZznAEHk+1pMTrUHyMhcrB7Nrl6WfslkzFmwiAvlPxFKO+Ns0F4iQjdgc6Ba
         7xdA==
X-Forwarded-Encrypted: i=1; AHgh+RpHSFDPZ5Aw611ep4AiaiX2tknOZH1M7O0g5nPJC9sxIs5jduXPj6PUt+5R71SMkgh8YsiBziZFDXNnX/55WD//@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk7aYlmGN35IWR0l6D1M1oXbWTyip0KISaNq7gjukOpAF5cvID
	OIkeZYvzwAiqWqDhVFzfK48FaRhyyCdo0UKeQ7D5rvlNVbNM5/bXEu2Hd0klmv2lZA==
X-Gm-Gg: AR+sD12L0bWmF0/ph12KWLPZdeI5bVLgrSP/cYoNisXc+xAxQXnH49l4GWQnuVaYirO
	O4bvh7QThwze4IWVBHaNRhvDi07wPJMD0bXx9Ee2ZLcfAwOlZuwzU0sMvMnSeBHpbejSKfUVYNQ
	jJKwRLVrxgiHzIMVCjl8S50xOOippLt1LJeCkphY2NftVYVUHPjAWV/fQVaEdXtkl/ZzR+kOJSZ
	5rZmR8THY7rZsDALeJxllkZ76GfgYGwxI0lCzJ1rctuuMWho8uLRWD/nGsXo0saP42YFpjDDoPQ
	h99xRZ9vVRE7L8idmuJ30QxozxzUKwF7Hl62DGOIic2ge9w//va6fzb/eTer+0k83PQ/n5/Zp3/
	YYxYfzFYelfUiknzc8wOqIhWXbp/xdGHI3SpcEBsv5lTqioDih0ZgZhmJabW2LiqugHi0SBDeoT
	mNbLgMRBbHw0RRz3TOaZ6T3xG30yqguuvcloEPmJn/IIOdQf+eiTaRqE+Cces5V0oLg9aLdjE3Z
	NM+1mfiB8+tgmyyWJoASho=
X-Received: by 2002:a17:903:4091:b0:2ca:be81:b469 with SMTP id d9443c01a7336-2d026c4dcc4mr1313315ad.0.1785303991374;
        Tue, 28 Jul 2026 22:46:31 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642fbf74sm2219437a91.17.2026.07.28.22.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:46:30 -0700 (PDT)
Date: Wed, 29 Jul 2026 05:46:23 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	bhelgaas@google.com, kevin.tian@intel.com, kees@kernel.org,
	smostafa@google.com, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
	bbiber@nvidia.com
Subject: Re: [PATCH v2 03/11] iommu/arm-smmu-v3: Add
 arm_smmu_drain_queue_for_iopf() helper
Message-ID: <ammTr2kvjpiOHkbT@google.com>
References: <cover.1779944354.git.nicolinc@nvidia.com>
 <a62db13ab63916e9a62cddeec41a74a98cdf6a8f.1779944354.git.nicolinc@nvidia.com>
 <amkcQRVylEe_t-yP@google.com>
 <amkqZbPJs9qly4pH@nvidia.com>
 <ammMf5z-Gl-Wygk6@google.com>
 <ammO+4W/dGC8kTCr@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ammO+4W/dGC8kTCr@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_224633_015591_282C4532 
X-CRM114-Status: GOOD (  14.41  )
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

On Tue, Jul 28, 2026 at 10:26:19PM -0700, Nicolin Chen wrote:
> On Wed, Jul 29, 2026 at 05:15:43AM +0000, Pranjal Shrivastava wrote:
> > For PRIQ/EVTQ, my only worry was the HW producing more events,
> > say Device A is detached (we call drain from attach_release) but Device B
> > (still attached) starts an agressive DMA with multiple PRI requests/evts.
> > 
> > Maybe we should go back to snapshot based polling for that?
> 
> If you look closely, "pending" is the snapshot, regardless of the
> growing prod.
> 
>  * With @until_empty == false (for EVTQ/PRIQ), exit once "drained" reaches its
>  * target: "pending" (i.e. prod0 - cons0, frozen at the entry time):
>  *
>  *   cons0                cons                 prod0         (prod)
>  *     |<---- drained ---->|                     |             |
>  *  ---+###################+=====================+=============+--->
>  *     |<--------------- pending --------------->|
> 

Right, but we write back cons to cons_reg only after we see queue_empty()
We have a do { .. } while (!queue_empty(llq)); and then we call
queue_sync_cons_ovf(q). Same  for PRIQ handler.

IIUC the helper relies on cons_reg being updated:

cons = readl_relaxed(q->cons_reg);
drained += Q_POS(&q->llq, cons - prev);

Thus, if we get a storm of pri reqs / evts, we may never leave that loop
and queue_sync_cons_ovf(q).

Let me know if I m missing anything?

Praan

