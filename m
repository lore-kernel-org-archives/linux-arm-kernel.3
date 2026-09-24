Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84440C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkHFg2PAsl7Q9sZ/6W2u68QBDReBA8b5w0p9gEJFVho=; b=E7ed4tRU6L7HxY3osFy3MIYnZr
	YvVORje1ACUAujEjE1lbO93DqimdoIs2DV5I/DXJdoKrg82PUi3h3dgeffNA5gShQg93ERrFnCGCD
	Ij/oOynK5xpI0A6B6tReRChJYXiZ/dt1+XOmZC6lX6/AduH+L3vApasuSLMmDw/J7Ou9dXHkrz3u4
	XeoWk8g3raABgranvW94nX0JxcfDNPEUaSNVmFJMmYlc2TV2mKcFIvL3zuDDL7KHunqf5Ouq2xGHN
	pevl+jtM1CkMhC8MSaLIMUWCcD6uNKxx4V9eLEbGdVz4kzrvCG17Tal4qvJtN/af8Y3o6YNwA3pcx
	rdCUcXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sK1-0000000CKc2-1mKQ;
	Thu, 24 Sep 2026 22:53:45 +0000
Received: from mail-dy2-x26.google.com ([2607:f8b0:4864:36::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sJz-0000000CKam-0N1J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:53:44 +0000
Received: by mail-dy2-x26.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so333533eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 15:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790290422; x=1790895222; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HkHFg2PAsl7Q9sZ/6W2u68QBDReBA8b5w0p9gEJFVho=;
        b=YzYdLoadM7Ogi/NXUyHtW7JQDrKZG+0UAKCmBiPwIG9oJ097LGU0T9EcJ0+gP+V+Lx
         AxgfevLIviFGmGtTpGHj7gXs5gmE6czsp8nz/XPwTKuUP41m5oBIZY+wS1hCh2m+4s9e
         u2OJQP94YhbPo1ogHAaPcpFzpXGSDIIjfzFmzS4fiV9BNGH1KM12TUz47jmRW9LOcjL9
         2ztZAu64FAnj4BFJ2u9j6issa8YltbLu+usU1LTPZgX9gjjGGo6x1SId6QDkoS8o8anT
         ikpnI3wIqJkbluhW9irlavziD95ktE9Kx8krrLiIZJDZ63rGwFLMrjRSaa7Vl7SrWiPT
         tTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290422; x=1790895222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HkHFg2PAsl7Q9sZ/6W2u68QBDReBA8b5w0p9gEJFVho=;
        b=cipGoxgsjU36tNCyodCcXojW8bgMJ7Mw9ZG3Ygk+lSK1UmKRGiXBMpWEeFeWTeNPkB
         SZ8vL+IoG2yCVWZ7Ambcr9dftnlMW2atlfCuzW715P11VSsTfXmedPAES/wIBc88bgJy
         ZJCCzAuoRPyOIik9nM78jszJbQmC0jNgqGV/FUNBGXh9UFUoZkKqqAaGbkfvJ9eyclXb
         VZ4npiorXdpwgOs3+qfEPNHkXci4FnDpdMS2hsEPlxUCW8bAqNPOX9FMdF1QAHOFbjFA
         p5/hvEwpsmClS0iUPYu15WH2Aw3+Jk1iSO+ZQ9zA5px93AAkabB1W8vXMfFhyHv1B0wz
         DcUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpgyMheeCN56D5oo2zbizaoEkCnYitdoND6UmccsQhDXMNSg5buXjf8XurSnTsGvoRMlZsApaI9MQet10XStYv@lists.infradead.org
X-Gm-Message-State: AFuF++kJsvy665n99I1be29OFlegVcajSBRRX6HgtX1z4zOsUxqDDB0r
	Udn+/G+u1/keRktNsnDCR+RLP6kb0m7GwC4jvC91Ur59RCU3KB6bqdZMAWHHwcJfKtU=
X-Gm-Gg: AYBFou05y8HLV4AoNtgcVWwDAP1nbHjRvEXGlci9zDHcU6LqVmfBLkfJwXjD76OGiS+
	U4ghTn63R8MJL7qn3uNVWyi9cnAeADl6LQmtxYpYLn6T9GVBylJ5IqbGOcobKTnsa18xHil7iDl
	lA57YHh5NbHJgv73rQHiUHy2wvZYzIVXL3+2AHi05awuHlOEebID97wb33m6fvLCeYY+sAOBXPG
	4//C4EB+pa+yIaNFhS/9CK1t6vyyRXmlUmCyyUg0+likkiR5eEzqURRqZCqWRSiruox9HCVKGKo
	ov6k4H3r8MV/EV8t3mDw8bFVIzyRneHfdq5A7mNTOQ5YI3RXa9a1sZqu7NMJpqZV4bgzNrMpVL3
	HXWh40/YxpgH3AExdZJjeh69GGyyHls2v6wemTxMC05LPnZAhG7oD85qfpXxSjyWUQR5Qdy5kqP
	pHyz7C37n15XQCweB9r0OMCg/qFA5pkPFKTLIuwlTk5wsruA==
X-Received: by 2002:a05:693c:829b:10b0:33b:d89e:9fb2 with SMTP id 5a478bee46e88-34000f36181mr3727679eec.4.1790290422026;
        Thu, 24 Sep 2026 15:53:42 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm1631877eec.4.2026.09.24.15.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:53:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9sJw-00000000efs-2Wk8;
	Thu, 24 Sep 2026 19:53:40 -0300
Date: Thu, 24 Sep 2026 19:53:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20260924225340.GC16465@ziepe.ca>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <20260924001502.GO1540250@ziepe.ca>
 <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_155343_135901_701241B2 
X-CRM114-Status: GOOD (  26.23  )
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

On Thu, Sep 24, 2026 at 11:49:50AM -0700, Daniel Mentz wrote:
> On Wed, Sep 23, 2026 at 5:15 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
> > > From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> > >
> > > Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> > > When a set of consecutive PTEs map a naturally aligned contiguous block of
> > > memory, set CONT on every descriptor in that group so the hardware can
> > > combine translations and improve TLB reach.
> > >
> > > Advertise the supported CONT group sizes in pgsize_bitmap. Callers select
> > > those sizes through the normal page-size selection path; io-pgtable-arm
> > > then installs the corresponding tagged descriptors directly. A partial
> > > unmap of a tagged CONT group is rejected before modifying any descriptor,
> > > so a rejected request cannot leave the group partly unmapped.
> > >
> > > The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disable
> > > CONT support for hardware with implementation-specific errata.
> >
> > smmuv3 has this errata, it must be disabled there too. I didn't notice
> > it in this patch?
> 
> SMMU is an architecture specification. I am not aware of errors in
> this architecture specification that would preclude the usage of the
> contiguous bit. I understand that Arm MMU-700 has the following
> erratum
> 
> 3777127 Under invalidation in TBU possible when using contiguous page
> table entries

And a neoverse one too.

> The recommended workaround is described as
> 
> "Ensure that contiguous page tables are removed using a single range
> invalidation. Arm recommends using range invalidations to remove
> contiguous entries anyway for performance reasons."
> 
> and I believe we are already doing this.

No we aren't. Go read my fix on this:

https://lore.kernel.org/linux-iommu/1-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com/

I have another patch that fixes it for iommu domain mappings too.

Jason

