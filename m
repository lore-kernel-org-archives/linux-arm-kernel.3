Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19C8C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riIyAnp1BqzCauiLRUDX9IVtOvAZ7JXvsQQRo+JNfy8=; b=XNrCUu+GvpcDa63oco0OKSkgiS
	pMSMga/qwZECtfa3K2uKUmcoSbRA/+FkNDb2Zp11dzx5tdVDc50rnPeptUecwyUycnlS9N9knyGZQ
	qBsBrFhvf+cYio+XzAg9kT3jmO1nC0i63M1q+hEcj/A9YJIDxgWYBNVCJYTMkehrSykIyKP7WQorl
	lSymj8gOWZ8Pfrak5eC2apiVTcEa4Kk2m1y5LjtD8mifesFXt2VN/XiqGHDdLJjHxRjjH2EcCp5U2
	4PmA14dziqwGhfSPMSzV38BEkhcqM90ZXbXL5knUlav/sqOathI6wFn/AbpGt4CQ91lNhPgic0rAk
	E4mwA2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmBH-0000000Avcx-3zBk;
	Thu, 27 Mar 2025 12:17:55 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txm9Y-0000000AvVN-0L9Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 12:16:09 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-549b12ad16eso952679e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 05:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743077766; x=1743682566; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=riIyAnp1BqzCauiLRUDX9IVtOvAZ7JXvsQQRo+JNfy8=;
        b=keijofzTRzi5uceIxET+cD40XaysruPT4H7HU4i7fHxU1eW4HHZC2risIrWtLYkG/V
         33Q2VaHkDxRT1JDoM3fQpmdEA1H1A9vMTcouPQYl947c6sQ42U0TECdE1g1QmX2WnToC
         ycchjp19gNp1e0wUlyKOvcXa4cKJu2OvosrT0oQRj6DeXB5XFVnAS2zuZGG1hGNBSrfk
         JsSISGrwZuc/byKkWXYwDJULwt12sy9KVPDB5ZRarbdOehqiDaosXSInaBKaQhfW+nwc
         +tlvQPFhOew5e1oBKKeHTWsLNlbMT9X8VkzPUQdWreOkm6HQFGtwdJvou2xMBGktvx9/
         uUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077766; x=1743682566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riIyAnp1BqzCauiLRUDX9IVtOvAZ7JXvsQQRo+JNfy8=;
        b=ve/M/1fxRPNq9j9JnzT5CNzyX6SOxvdWwjgDoiLg2YlWfsRLKqBurnOnMrlslLoBw9
         XA3hhT4zKW6ep7dLPWzWdQ6Cq3WgAupWTnR5ElFUZ4489WfdWu+K1xDIZhXaEX+HE3QL
         cfHnaT9+cVW7fo4zMniRk8LK50A0wbZ9MLvco3AQ5kO1RRvR+Q3Mmp9ahQZY/XYFWEjz
         Pwq3lMVZ5I91dzh6jaIeXg+IEEUtTaGSdBdlT+s6VQ0DnJBdXn8g5B+kgH8M/DQojMru
         bm232bXj1NfXJ8Q6skkcVom2F9cho3veAJloPSu1ciH3SPuDP+zciqXrJgn+o134nw3C
         VR8w==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4oXvSGpE/V5s4YFmD+TngpZm3YFdXyOHukXK27sVZR8I6nIIPA+IFyZ4CyP7ZJ97laqkxcz3TYcQiNMpMAwW@lists.infradead.org
X-Gm-Message-State: AOJu0YyC1RVIKJSfm7+02wJMckg4ymehdGu4LiTXJroW7P1o1SmZRo4w
	4r4XLGItZE94eP+k3fEwmf2ydO7AqVL6ibrDMFA3mVUBHiYK//OS
X-Gm-Gg: ASbGncstgmFv3EBBwooFAReEu4368pt5XuTiQ2JVIFK7SG66q4gkvdNwg54qgPdrLFH
	pb1guemWs6P3ApoRQiJvsmHtVGKl5uoM3H/N5m2Vd0ki7J4LUCwkw0tN3xtEV08U9yAXm3l0qSm
	bPWBbI2vZjgRLU/lq573m3WrSb0cm1lye4h0NjZefm9FdmKPt58HVVRYbGGPgrfO0JJaLrb5PT3
	3YvznmX/9w35IQb3MNVWT3fAG5t4C7CDMdDlc20s/O5764FyAnPcAwLULusSi9Xtdn7sTKzyiCv
	yYd2042+PhfvNUu6sjzqyteLHwrAJoKUHoVR72D23JEWR/yZKOYmA3MJDvaEwmXnpcbZOlaxE3S
	uhQeKUB1q8Q==
X-Google-Smtp-Source: AGHT+IF6Q/FlvS/W+sjXPXjml1B00qK8pAid4lpx6MIvDMx1ASAjlsu76O0mMJzHYcFbUWuElE70Eg==
X-Received: by 2002:a05:6512:3b25:b0:549:89ec:f6a9 with SMTP id 2adb3069b0e04-54b011cd797mr1152580e87.9.1743077765307;
        Thu, 27 Mar 2025 05:16:05 -0700 (PDT)
Received: from pc636 (host-90-233-221-122.mobileonline.telia.com. [90.233.221.122])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6508142sm2049380e87.172.2025.03.27.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:16:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 27 Mar 2025 13:16:01 +0100
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/11] Perf improvements for hugetlb and vmalloc on
 arm64
Message-ID: <Z-VBgcl9LJGlEzy2@pc636>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-1-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_051608_124404_B8DA8046 
X-CRM114-Status: GOOD (  17.71  )
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

On Tue, Mar 04, 2025 at 03:04:30PM +0000, Ryan Roberts wrote:
> Hi All,
> 
> This is v3 of a series to improve performance for hugetlb and vmalloc on arm64.
> Although some of these patches are core-mm, advice from Andrew was to go via the
> arm64 tree. Hopefully I can get some ACKs from mm folks.
> 
> The 2 key performance improvements are 1) enabling the use of contpte-mapped
> blocks in the vmalloc space when appropriate (which reduces TLB pressure). There
> were already hooks for this (used by powerpc) but they required some tidying and
> extending for arm64. And 2) batching up barriers when modifying the vmalloc
> address space for upto 30% reduction in time taken in vmalloc().
> 
> vmalloc() performance was measured using the test_vmalloc.ko module. Tested on
> Apple M2 and Ampere Altra. Each test had loop count set to 500000 and the whole
> test was repeated 10 times.
> 
I will have a look and review just give me some time :)

--
Uladzislau Rezki

