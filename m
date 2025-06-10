Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4087DC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpDlecI+FUquIWOKVi5ub4W4d9DHal5PDcmOLDMRDsY=; b=xLIXZcLrtoFf1Cem0HePoEszWR
	GhTxmoe+26wCXqMyz5hAe7PgIXcvkRGInws5Cgx1It6d47zjicwQf9+5M7fISpF8LprmYJglPL2n6
	TJHeNiGNhj+Km11JkaTpgaAoFl9hXn25L7+H80VflDICOMf/d4fgRVbWh+/lSlWJKzEq71ZQRBiBH
	P6A4zq+7PBOTbhVbv1tPs+T25kb5lJ0WhhmACPzWbTP/wGyLBClxGYT9YFl+/jH2RkKmLi6Ba2dnz
	Bnn2KwvxLz1a+i76N7pnqOjyepzAZ6tK/r9ZEUpSaBpIG3qfWIRtoqP1KfC2J3BiS3NH5931U/YsX
	vWLWNs/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyFM-00000006nQG-0KXt;
	Tue, 10 Jun 2025 12:38:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxhz-00000006i7I-20rF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JpDlecI+FUquIWOKVi5ub4W4d9DHal5PDcmOLDMRDsY=; b=Q9N5pgKwIzHowM0YkN1j7f8dBV
	2SpF/Y7SM5MFJ8f/kZgNKp8IaRi5w8i/n6ykzJLddVFOAwG33X22fl6wHWSy2pn1TAaOPbnmTOWYy
	J/DbeMl2k3faQ6Spzf1DmCbHi464RlwH0Hig8SYrRQLOMJeqqYVUH/pS/6JumBVVVFCBUBnP2AQLC
	yNMTaIdmNlBcNrxY4P7T83KJ6CrPNxUD+gZflgCk2mEkwhZ6v8fMJWN6+necjLZTVTy1CdHMaZzcV
	NaKnLWPNGJDTlUvvRG58PeaIxH//SFPN+A5jvzgIV6qxeCrwRQA2AEWUeZPTzpYr1HDJJTc6bbs0r
	yvoFCc9w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxhw-00000001nL3-2fDz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:04:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92B3014BF;
	Tue, 10 Jun 2025 05:03:37 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D1B13F673;
	Tue, 10 Jun 2025 05:03:56 -0700 (PDT)
Date: Tue, 10 Jun 2025 13:03:51 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
Message-ID: <20250610120351.GQ8020@e132581.arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
 <b30fc361-a04f-4a48-b8e2-f7c2da213e6c@arm.com>
 <20250609171413.GO8020@e132581.arm.com>
 <b20a6309-ae31-496d-a1ad-61ea358ad7a9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b20a6309-ae31-496d-a1ad-61ea358ad7a9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_130400_830353_BEA1ED9B 
X-CRM114-Status: GOOD (  20.60  )
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

On Tue, Jun 10, 2025 at 04:09:32PM +0530, Anshuman Khandual wrote:
> 
> 
> On 09/06/25 10:44 PM, Leo Yan wrote:
> > On Mon, Jun 09, 2025 at 05:58:34PM +0100, Suzuki Kuruppassery Poulose wrote:
> > 
> > [...]
> > 
> >>>   static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> >>>   {
> >>> -	struct clk *pclk;
> >>> +	struct clk *pclk = NULL;
> >>> -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> >>> -	if (IS_ERR(pclk))
> >>> -		pclk = devm_clk_get_enabled(dev, "apb");
> >>> +	if (!dev_is_amba(dev)) {
> >>> +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> >>> +		if (IS_ERR(pclk))
> >>> +			pclk = devm_clk_get_enabled(dev, "apb");
> >>
> >> AMBA driver doesn't handle "apb" clock ? So we may need to retain that here
> >> ?
> > 
> > Here checks the condition "if (!dev_is_amba(dev))", it means the device
> > is not an AMBA device (e.g., a platform device), the APB clock is
> > enabled at here.
> 
> Just exit early for AMBA devices when 'pclk' clock is still NULL ?
> 
> 	if (dev_is_amba(dev))
> 		return pclk;

If it is an AMBA device, we should return a NULL pointer, as this
indicates that the APB clock is not managed by the CoreSight driver.

In this patch, I did not perform any refactoring and simply made a
straightforward changed.  The refactoring is done in the patch 07, as
you suggested, where the function is refined as:

    if (dev_is_amba(dev)) {
        return NULL;
    } else {
        pclk = devm_clk_get_enabled(dev, "apb_pclk");
        ...
    }

Would it be acceptable to keep this patch as it is?

Thanks,
Leo

