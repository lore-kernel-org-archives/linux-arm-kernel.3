Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24BCD64063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAglfK8k8Y0MKv5RAoBuzJI+tWSGH0T0pgwSR8dkA9A=; b=yQHka427TRmE3AJpZEUHHLM3gt
	7q9FHctjqKiTkQ9l8nicIDzSHlSFl9VhsLqbIS/0+z9SOTMmSN2/MdVpWkLIzwnJwKEngipwPwnqN
	/KDsPOqxwj1JsshGJQnYO72/QVeYld8EBPTB9cUhP3kKwY2jyq2oZW2J5XL+fsJ0RXuujLFdbufA8
	XLiu6p0awNs/CoIUOfitP+rbxB//pPcKLoc5Xk9i9YraILtJM+Y5E808ua+3i6JQ5ACaAu3MkRhj5
	iCpy2l1xLLi6ASZv8gYxWmw53/GkQ7s3ZgMLOdp7Eh9o/JxuzLuPMTI8dV4hG1P3iJ5SWaWgB8v/R
	ITCc5+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RuW-0000000BDsF-1n9b;
	Fri, 08 Nov 2024 16:32:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9R1K-0000000B32U-0VWg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92A80A400AD;
	Fri,  8 Nov 2024 15:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFB4C4CECD;
	Fri,  8 Nov 2024 15:35:31 +0000 (UTC)
Date: Fri, 8 Nov 2024 15:35:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] kselftest/arm64: Fix printf() warning in the arm64
 MTE prctl() test
Message-ID: <Zy4vwYeaIiQrWfXO@arm.com>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
 <20241108134920.1233992-3-catalin.marinas@arm.com>
 <4bbc179b-73b6-46d7-b414-f3b14079b489@sirena.org.uk>
 <Zy4telEzvU1DGih1@arm.com>
 <6a1669e8-1654-461d-8709-3cbcaff7da67@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a1669e8-1654-461d-8709-3cbcaff7da67@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_073534_246534_2856C088 
X-CRM114-Status: GOOD (  13.25  )
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

On Fri, Nov 08, 2024 at 03:30:11PM +0000, Mark Brown wrote:
> On Fri, Nov 08, 2024 at 03:25:46PM +0000, Catalin Marinas wrote:
> > On Fri, Nov 08, 2024 at 03:10:59PM +0000, Mark Brown wrote:
> 
> > > > -			       (ret & PR_MTE_TCF_MASK), mask);
> > > > +			       (int)(ret & PR_MTE_TCF_MASK), mask);
> 
> > > Shouldn't we just use a %lx here?  Casts tend to be suspicious...
> 
> > It's more like the ret is actually 32-bit and should stay like that when
> > bits are masked out. But the bitwise op 'upgrades' it to a long (in
> > hindsight, we should not have used UL for the TCF bits and mask).
> 
> Hrm, right.  Possibly put the cast on PR_MTE_TCF_MASK rather than on the
> expression as a whole then?

Can do.

-- 
Catalin

