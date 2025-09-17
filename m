Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8CFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5mwCMXZll74MsKobdLnh2paEF22CAKr4juHWA93w7A=; b=ZB+XisniD32jKdQ9CmNJFPjvBq
	7eJ8uRW13URuw9TUHt/EOCGcxEA+009JIh1UrPEHPjvpwE8Tgn2p6E6HQgB2Tl7MKjWzvMalmfSw4
	/WT9MiNRjZPsKMfZqGGwbVrREf2qYlTbu40QkUtjf+hG/eWHkjEQXIxNv0eGpk7SEpjArU0OSS168
	9WaBa3Qd5YSBuhd083Fhm7keTZVB8HH5aKxSPIazCuAibWniAtniaEkBqCNsrS2ch44htHOUlpV4k
	pn7Hpu1gQ9FuhsaVFxRN/eZdD3iolJrYluJrxI8z06h8Vye22NRYs3AJKjGhYBOBeuQthgQdUXjnJ
	+0ntJ7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyttN-0000000Ccqv-0oJn;
	Wed, 17 Sep 2025 15:16:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyttL-0000000Ccpm-40qK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 15:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j5mwCMXZll74MsKobdLnh2paEF22CAKr4juHWA93w7A=; b=pGQAtcieEBXhZd2AWFaZu7wm1a
	nQlqnPGhrtrDKDy+ExgwDhLMHNX83KndBnAy0GVC3j7lb/E/x7/e/OeyhuxEquykW35sLtVUK2twn
	BNbalD5uNZYNMsGCyqKdQouOoENp3CkHnoGvOewxgxSGY1CJy5o9zIq/17T1RcqikCWzV6zzu0ooD
	q4v0gIJ1afvyjhig69oLlsz+10Nna36nDq8rfosvHudVvOb0yDTivBQPQ6C+m6NIx7240h3Bm0baY
	PG7Fwe0SrPDuH0m20mGopJyC4vgm2R35P+H44PTNMs6k+PuoUKqCcsUvOY8kAmeyh2qnPINq1Cu1R
	M3scFlbw==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyttI-00000007Q1u-3Z7R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:16:18 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-32e34f4735eso4127298a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758122174; x=1758726974; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j5mwCMXZll74MsKobdLnh2paEF22CAKr4juHWA93w7A=;
        b=il5d9TstfAoLWjWddd8tRvsppn2/Is/r+BgGDE7U3ZANROVNVpUukUTXr5iXRiPuNr
         j5sSOQP45NDHBUrsN4A/CHC8dtvxzMR2oM8LyeqhienXoWOwuB38JVBlUHSQsTYopGNQ
         QLS4YMIEA/8uRz0RM9oiArg0VhqmLQagNdVxTcANVao3sTvX1oGbaWAr46Up+SGcSp/V
         eguGSyl+Qu4xa8ngd1FID8Z6iaszPgOaHgLQEKmaoA1yyCYVclgdOka0kFjm8I2EZzRY
         ebKfGwLGNgiBUit3K7OdHbjDwrYX7qp5qgBbwL4BEm21wUjjAu7JL/2P4u697UaLxcy5
         QNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122174; x=1758726974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5mwCMXZll74MsKobdLnh2paEF22CAKr4juHWA93w7A=;
        b=oLsHo8V7WzuBfQFqdz6e1xMJgiXI1NyVDdLGbZBDruvuaVYZRkdP2MoJB0fHfBgXpK
         ZlbvpIwxCX2tiF9IPKIVpDbhBia3oj4u2k9I2jxPeFpOuPdbzykSrPPItfeATaEJHKfq
         f2ktBDYLKbzJxlszgCvmYfDAkbFpmvYTNJP/Zmx16hPaSZqXDJMH7nJfdjHBorxU8Ugo
         NYLfZY26HaOxPiBDaXM9XuOB1jAwbH86oAA+UFaNnC4lmR9gd/OehtcGUN8imFu3NAZP
         sWbtUcHxmtrY4l2edzhOd+fxjfzswUZ1IgturdsUaBYGtff+X8mHFjEmlL8Z+APJTOfv
         hHAA==
X-Forwarded-Encrypted: i=1; AJvYcCUNhs/XCZ5Eo2GTAHGz+rGz2CFAm1L+ylVroSTPAlsLVZnSFBdZOEhWGPSDgRARPN9o9B5AEo+U2Y1Up79tYD2+@lists.infradead.org
X-Gm-Message-State: AOJu0YzBbAMHXYhNDYVUo98KdgOW/w22M5WfFnUYQKxUimhOf3ZlCja7
	iBB7kKbS/UrCOSVHHXG4AoeqTg1FI9D+hpBMWEUpcERnAV2MP7P9eiAuWerZZSZWtcM=
X-Gm-Gg: ASbGncsQ7S2vUbv1T0KFzeDbdLM36DFpwk9viZilVzZpUH2+MuVPC7uJHqSnCpIxHl4
	I7XlG4gLTP9/s8L2T5ofQ0KKzzfGWZs1Pc1FyMo+pwEMfDkFFp1p420oIHQdXmkZgWypz6yEdCS
	9YwHNbKdboeyD28pGqhWx9sQH//iZxjFxmEwglbYwVxdg9ADTcJQbEYseKYaEf9CwWPpJQ/jHCX
	GINOXVKDhSh5yaJ3/Xn2j9UG44z0PV8hZuHbsoKqT7VdjEXFHQwP45Mw97iXfV0ta5Ie/afRwtW
	nZDKJdIDaqMw6VpAJ+mB7ZTWWU1IAbj9lzB6NBBvqUT1fiiT+K4Kd0vea3siw0UzzQ4/aYDt
X-Google-Smtp-Source: AGHT+IFT1177fnGaDPrsJvXBzm9YkFBr+A6b67xfQf6j5GBKuYGPXR9WdIUZ96yP+o/Tmx5sDbBqfQ==
X-Received: by 2002:a17:90a:d44b:b0:330:3fb8:3884 with SMTP id 98e67ed59e1d1-3303fb83a3dmr2234532a91.16.1758122173999;
        Wed, 17 Sep 2025 08:16:13 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff1a22fdsm28695a12.0.2025.09.17.08.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 08:16:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyttE-00000008NhG-2B33;
	Wed, 17 Sep 2025 12:16:12 -0300
Date: Wed, 17 Sep 2025 12:16:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <20250917151612.GH1326709@ziepe.ca>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-23-smostafa@google.com>
 <aMQroI4NDu74PDGT@willie-the-truck>
 <20250915163858.GK882933@ziepe.ca>
 <aMl_5j8G3IGulAC6@google.com>
 <20250917123601.GA1326709@ziepe.ca>
 <aMrNTny9jgZJd_Ef@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMrNTny9jgZJd_Ef@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_161617_000936_0723F823 
X-CRM114-Status: GOOD (  22.14  )
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

On Wed, Sep 17, 2025 at 04:01:34PM +0100, Will Deacon wrote:
> On Wed, Sep 17, 2025 at 09:36:01AM -0300, Jason Gunthorpe wrote:
> > On Tue, Sep 16, 2025 at 03:19:02PM +0000, Mostafa Saleh wrote:
> > 
> > > I think the fix for the problem Will mentioned is to just use CMOs
> > > before accessing the host structures, so that should be simple.
> > > If it turns to be more complicated, I am happy to drop the support
> > > for non-coherent devices from this series and we can add it later.
> > 
> > I feel like it is easier/better to fix the driver to use cachable
> > memory than to add CMOs to the pkvm side..
> 
> Hmm, but for non-coherent SMMU hardware (which sadly exists in
> production), I don't think there's a way for firmware to tell the driver
> that it needs to issue CMOs for the page-tables and the CDs but not the
> other in-memory data structures (e.g. STEs). I suppose we could do it in
> some pKVM-specific way, but then that's not really helping anybody else.

Not sure I understand?

I mean to issue CMOs in the smmu driver consistently for everthing,
page table, CD entry, STE, etc. Today it only does it for page table.

Make the driver consistently use cachable memory for everything
instead of having two different ways to deal with incoherent HW.

Jason

