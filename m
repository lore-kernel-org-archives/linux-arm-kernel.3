Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75628CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/TRD6BwLaJ/NfMLCCm5dSOuj3VkkC7kRDobdLq+Uh4=; b=XfpHjMYtrsOFwIVSGalrTXTsIh
	ptndrKu+D1WO55PjSBX/p/9zHPGdqKaWMdGW5s5Gvi12YTLzo5y1BQLm0TH7GVNacKIPWPiVtKgPW
	UqCn3FfjHPcti3GKq88lLqZPkkhQjs9inNXxdsNeqRAWDCqhgxmGTb1Voebhcvn8syuoXunD59N/F
	oIeM1LdtJLc1uzo4vCySKYeICL+HJb2FXT5jS+MZM1BvyypSmeVRhqcC8KXse0+jqZfQtBWeQ3Tay
	c/rK0TlYsrSkcDltxiqPBLMafgpEBneap1CgQxaAhLL8N20aYWePtB6fILdNvOaapgTA/RM+bZPm4
	dZj1cx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDWg-00000006eyZ-1buY;
	Fri, 09 Oct 2026 16:32:54 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDWS-00000006evp-2903
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:32:45 +0000
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e56c287b3so533625585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791563556; x=1792168356; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e/TRD6BwLaJ/NfMLCCm5dSOuj3VkkC7kRDobdLq+Uh4=;
        b=Lix7FC4tpe5Dw2zj7Ga0aPw+Q5EGly2jj3GIFefhSeulqAt5EYCdKDBdeQvPlGzT+f
         uEsQe/M/W1CIhAJJMKGZDaPoyLcncYVHathRth7rhpX54SDzAJgeq5G+kxrf6CM7eMvi
         E3K2oJqPPztjTimLnle0Y8Ubq0y495oRvA7pt6kPKkZBN3llNcXR2M6JKd0FtLWUz7sk
         UfvigrD352ktV0BLQDcYTDFj45mDprCPc2mY4wkOwjirgA+h2/u0G3e1184qcrNcaZIb
         c1PurDSLnNJpUTf+LXRBxEslwlC4DMTmYOGu9H9xM6XiFCWufUDtnU4VPb8WNpMfxIgv
         cW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563556; x=1792168356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/TRD6BwLaJ/NfMLCCm5dSOuj3VkkC7kRDobdLq+Uh4=;
        b=dhqNQLs2oilM/XlgAQAQZtu7KJQfxvCZVd7IAJUWrDAVZ2Vi8SY+1ZPDeIO+71VGVB
         tfCQvdp09TBxhFkdz5LoY4wIj/352a19INQ1YSkX7CyaV8CfV+Gn0ee7h3pYN5zE2x4G
         HCywI/OscfXcICdogHNOpzWATt+66jInhcCaEaHtu84xznEJZ+jOJxqMyy8eMhmBkt4M
         HXOn5Hc5el9/U5OogwEMbg9Q0DJJGey4IDksfj2FCXMPr2B1SaKsl+E2VI8CX2FluBS8
         G/yvHW6AMcQuCLI53/KOght6+fa6gEbDxcZJ6quc+26P+52zlqPO00JTNw0qMnuDS181
         Yj1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9N9jj/d+97u6fWT+JV5hLwxmoq9IRtNLJYvFpPsm1/sCs5bTjPbi9cxIKz7SoJLrFgca6lGCPqdydgy/ZGdFu@lists.infradead.org
X-Gm-Message-State: AFuF++krR+CxfxQ2NsB0qYErid5LonjHidTNBbIkfj82Nq/lvUW/95eO
	2UWXedrCP1vFyIZfYcG2yiRlckDA+282Xv4Xr0VeBPHaozRZQaFVcpH95AaZmRKJsH0=
X-Gm-Gg: AYBFou2txW4fXRrxgDYZHKiaU0Qma7bQVzf0+nLBrv/CsSiM2HAjYFBmJmFSIzm21CP
	5zZWWl35uNIKrFmXkb+oeCl+Y5FQ+OziQFCdyl9u47vhPtkYQC7Mu7mjIJPM5AQQu+OYK8lGe3R
	u+G0pQ38o378Oa6VXJBDXhxKy8uRPDrhW8fTM/y+AbuWRxHVDgkqixi87PMedeU9oLkhhqzjafC
	QzGoS1vIITob6pBL4Fh3kUSDRMuEXLw5KtQzGpKP7cx8KrljiIgty17pZxzPZndTDPlHDxPvy+t
	ACAxHl7FMptxdpCbQ2ROguD14ubH+1Tdv7dn1GIQmcGI32nfFZtzaGYy+7ORmsHE8bI92vRUAil
	1Mp7jhSHxqc4/QQ3pDX6sPRUgMQYagzS0yxyF6wecN4I8L6TGB6AcHD0ipme1wAbWOmTkRWyA5t
	Jv2lj55EstFWuFBqvUTO0xyiZRYTm3E9N+AB1zdXDaeP1i7SFBDNiyOQvdJY949kr1gK1lt8Ouq
	b8CUYnO+Pm09waFVRKp6B9F+qe0j7o8KBbxrnDX0ze/NWNyDYopetmS
X-Received: by 2002:a05:620a:4456:b0:93b:be6d:4f3e with SMTP id af79cd13be357-93ebd1b7386mr410267085a.25.1791563555872;
        Fri, 09 Oct 2026 09:32:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98906c3sm225037585a.26.2026.10.09.09.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:32:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xFDWK-00000000Kpb-0HpH;
	Fri, 09 Oct 2026 13:32:32 -0300
Date: Fri, 9 Oct 2026 13:32:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Daniel Mentz <danielmentz@google.com>,
	Will Deacon <will@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20261009163232.GB14213@ziepe.ca>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <20260924001502.GO1540250@ziepe.ca>
 <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
 <20260924225340.GC16465@ziepe.ca>
 <7ab6eab6-ec6e-47dc-b387-eb380e2e365c@oss.qualcomm.com>
 <52ba8a64-2d3d-4c3f-ae8f-54ab4f0f164d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52ba8a64-2d3d-4c3f-ae8f-54ab4f0f164d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_093244_119059_6B135EAE 
X-CRM114-Status: GOOD (  16.73  )
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

On Fri, Oct 09, 2026 at 04:37:08PM +0100, Robin Murphy wrote:

> range size being unmapped, so even if the total gathered size exceeds a
> single command, we still wouldn't split it _within_ any single one of those
> ranges, only at a boundary between two unrelated ones.

The question revolves on when the iopgtable path flushes gathers.

If the gather only holds a single page size and always starts aligned
to that size then the RIL splitting algorithm won't cause an issue.

It isn't a question of allowing CONTs to be split, it is about when
consecutive unmaps can merge into a single gather. iommupt is very
general here so it can create gathers with mixed up page sizes and
trigger the problem.

For iopgtable we have several layers of logic splitting and flushing
things. I keep forgetting about this bit in iommu_iotlb_gather_add_page():

	/*
	 * If the new page is disjoint from the current range or is mapped at
	 * a different granularity, then sync the TLB so that the gather
	 * structure can be rewritten.
	 */
	if ((gather->pgsize && gather->pgsize != size) ||

I didn't try to do a full analysis that it really is enough for this
series, but if size here is the PTE size including the CONT effect
then it seems like it could be OK. The gather has to be aligned and
has to have a single CONT size within it.

My original reply was mostly to be taken as 'RIL alone isn't enough',
meaning write an explanation someplace why it is safe under the
current system. The commit messages for the SVA and my later fixup for
iommupt explain the general concept and problem..

Regards,
Jason

