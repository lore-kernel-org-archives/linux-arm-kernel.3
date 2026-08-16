Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745CAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 16:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vHK21ZfMoXP6dWuV4jOPFkA3UZYyqzqjngLtc/WPvI=; b=L+Djq6lOSjHUO0TyPWU+Dmij0G
	icBKG2Upx6fKEdOL9nHG4KWBXyzdx2Xc/Lq30PgA+zgpIyF1Xr1sgzmC5/OJtCSyAPsD+JIf2aUEh
	V3oLQReTwjIyBmDyJNS3h6F5Da3eErrs/830ttQA4x9zmranxazr1Bur4gn0eAYsceI3y3ownj0mi
	BwGgHRwBJfOWpEsx/CUkF+6ZSFXyI/xhEEQXivINcNccCJEtq8J5t3JO1jSWI3g4YM65wAz2PbIBR
	gl95/Eq4wVplUkX2nhhI/HZJeVaBJuF4gkuFgAjLTrIVPMsB6JNzdQD3/q4Gx7dex71S1XHZFOs7R
	xRlupGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveAx-00000004uOp-3C69;
	Sun, 16 Aug 2026 16:57:35 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveAt-00000004uNO-3KA3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 16:57:34 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-92e7c6ec9dbso120249885a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 09:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786899450; x=1787504250; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5vHK21ZfMoXP6dWuV4jOPFkA3UZYyqzqjngLtc/WPvI=;
        b=ZPZHp9WVgK8rdVvcx5bqGT2Ih4Nw9BSOxFyeCtbt3GL4GsMRo5QuoS5QHlddl7GlMp
         yt2gimDHegBDk2ptK59Rh4+MJksUjR+nwvnmoe3/pss34I0fpZYwMijog2KCBQ1ZvLEh
         MStSQt/OKOQsqbreYmnYwzVSqS1MZtHD3hiUE0+jQ8mtmgGqM6vy1zCRfeLsXntAx7h8
         J0mAe2QtGa2c92vHUMkuvYJn9SWq8TsVVKjAjH6Kx+qiM05OnCELLzxWFZ+0QVSdNs2A
         q7ttDQbEpMfrzgcOkv4pg/J64iTKNfub3F6jy8UaHukUZfd1wGdXTm1gHyivtozg5FK/
         JrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786899450; x=1787504250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vHK21ZfMoXP6dWuV4jOPFkA3UZYyqzqjngLtc/WPvI=;
        b=ZGTb85LJPQfa8VMODRESYyNyPRBn62j851kmJWKUEuNHAATOpX19Vv5kCFCDWcBEwW
         dzeiLoUxcm9a90zY0s3eJSeld0vQ5ey18o+PmLRZKMjtkkUjzfobVTPWNEr/lF/tteYF
         waJUImGjWCMAIh50psCm5BsbdxSvZPjgX4HlDlazXmc+68GhvfBXDjGpdZpEAzO/Li1/
         5l6TjVk/QjySmKdB8kgW7fdguLCr1kX1hlA1ntNK+LKyDZ2dZRiq49dmTRBhG6oWvpBm
         m7hvQ8FegLd1jwN/uTsxtXkTq87uKPh3lDDRnHO3mgYEf/XJaeSOXp0V9j1hLLY0dx26
         khGg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6WBF8Ys8ufcoiYOR1tkhW3Y8j3HdWGwrFtrihqbfab901M74uQ80BFGkN0LavSW17q+PK3ZNsc38VGBjmojzt@lists.infradead.org
X-Gm-Message-State: AOJu0YwDMUV6tQ9ySqITgcV5pTQArX3UkhkZJtkVLkIWb9OCSf7b4sRW
	8nrkYPwASCA4sVC42lw6RA1+rDQZcqe7raC7JB3ZyL52ABXrvVm8LgPmmz7mnZ4e+14=
X-Gm-Gg: AR+sD10h7mLuAC+HjHQ0O7uZRlFNh0cx6XPABKPjRxPpQpAUwODocQQl4IX0A0M1LPp
	yc2NwPniL2pTlI7U4PyfT9xGoh9wjX4vlr+Al75rZVFBCCcKoyB1lcr+xNUBtfAXmt4Trxo/9MO
	ymfAU3pcRDS9hNU2SF/wz3hxwMf030Uer0OVL2wa8iUuS2aXc5FzzsoTKKnGYLARCYXjTr9vVMx
	ybwlpvbGWCfVHWzW48whR+c2T0yqB+dh+nEss0zIac08DQRnTsQXianydmo4yL4dsrM5jqGfxST
	lUqW+kDXBqYrDHHIrmgwUyuvm8xQukNcXW9K5IZD0hvKL5ZumnQ0ZmWxMGsQ9Q2aqj8TapX65HG
	Wkoay/lQ5mQ1n4bAV5uJhrhDEMMR8tCQHqP91UYORQER32WvMqSklcdyoIVI5NO2/Wxyhk7AWY1
	Ep+X5Bx+bwZt+HFHwg43np7JgBhPyeXLf3PuXbVKRcib+7ovxv
X-Received: by 2002:a05:620a:4089:b0:936:e08b:733d with SMTP id af79cd13be357-936e08b78d9mr1435615185a.35.1786899450058;
        Sun, 16 Aug 2026 09:57:30 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936ce0898efsm784134485a.12.2026.08.16.09.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:57:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wveAq-00000005W02-2MZ2;
	Sun, 16 Aug 2026 13:57:28 -0300
Date: Sun, 16 Aug 2026 13:57:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Drake <dan@reactivated.net>
Cc: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
Message-ID: <20260816165728.GB933791@ziepe.ca>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
 <3e7ba95b-51e7-48e4-aea5-f86db1739ac2@arm.com>
 <amlE8rEgryPqrUZd@ziepe.ca>
 <d6bb859e-c1e7-428e-b765-7b471e1ce005@reactivated.net>
 <abc25cfd-0c7d-4719-b6af-9034c87e9f88@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abc25cfd-0c7d-4719-b6af-9034c87e9f88@reactivated.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_095731_983896_608E1060 
X-CRM114-Status: GOOD (  12.88  )
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

On Sun, Aug 16, 2026 at 01:50:32PM +0100, Daniel Drake wrote:

> Let me know if anything sounds off!

It sounds reasonable to me, and at least from this starting point you
could imaging trying to build a scheme where individual devices in the
group can use the group wide paging or identity translation.

I'm not sure how that could look, but at least from a DT and driver
perspective it is not such a big leap.

There are several unrelated topics going on where it does seem we are
not giving enough control to the end driver about how translations
work when the core happens to bundle streams all together into one
group or even one device. So maybe there is some merit in coming up
with a way to have multiple translations active within a group to
greater expose what the HW can actually do.

Jason

