Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7647C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 04:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMmjELfXfZxKi4w9DEkV0i4Qf0MKs2wgka2indero8o=; b=lH2XsSsoPvfX28bkYJVsgaQlTX
	XzMmdq0w/OXGacAZu2Ly2WLBzI28biscNCLUGtUtz+ehF9cAZnqmyBg5dOAv8rzVIssSJKrYpPtn3
	jPpBTBbXDgf1MZYSfQAr+n1o78dtWmMD0DhDUFeekr8P9FKDT7J+YpeZNmaEv7OySCgIQE8fKO6j6
	6d+D7D5lrMZS0Mp/El83WFn83m6yUKXHOWn9sj1XbzzRuDPOE5A/8IKUpiXYpoXGIRB4Ql2ifLjEc
	czPu37xb9I+itidNGan8PzSPNpNHDrKrvDvqKqCr5dYcB7MtUSHAVBwMlCvvNsd68z8y5vBwuIDJK
	R2Tj/yqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpgcl-00000006yj4-2aLg;
	Wed, 05 Mar 2025 04:44:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpegJ-00000006opL-3KBW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 02:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 322D4A464FF;
	Wed,  5 Mar 2025 02:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D47C4CEE5;
	Wed,  5 Mar 2025 02:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741142422;
	bh=8+OFgPo6b9+9XBbw+hWdHGjxyyYbUhWhivUtycenzYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhkTQQI9ODCRNJfQgTWoHfxNqzQUcCKh7yXkkD+KnAe/jpWRRpWGHlz8AZIbmQH6s
	 L+w/BwR/QDKer4xZliHwtjiJM+vBDRCuFXb8Wn2AwDrvKwncT1h5e3N5djv6MQjEp0
	 0bzAf5hfptsuqXiLGcGQfWi+srCrpJ4F1EJdAqoaF6eSpU8ayXnGkKd7MuiMuhXYHz
	 zLlPvVVUKoGiR1mqQjOo9bOmmWVcGV4rT+j3WBVIa92AcY/jR+V5iGywiISyi3iB0t
	 9Jjh1s+pTWsA7ApHMdmL7isYOa7tyS/U8zK9yNUu5hBYkU1zWcdp4oq93QaIqpqgoC
	 +JKeDuvMiPtzA==
Date: Tue, 4 Mar 2025 18:40:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com,
	martin.petersen@oracle.com, krzk@kernel.org,
	linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	willmcvicker@google.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, bvanassche@acm.org,
	kernel-team@android.com
Subject: Re: [PATCH 4/6] scsi: ufs: exynos: Enable PRDT pre-fetching with
 UFSHCD_CAP_CRYPTO
Message-ID: <20250305024020.GC20133@sol.localdomain>
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-5-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226220414.343659-5-peter.griffin@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_184023_890812_754E3AFB 
X-CRM114-Status: GOOD (  10.73  )
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

On Wed, Feb 26, 2025 at 10:04:12PM +0000, Peter Griffin wrote:
> PRDT_PREFETCH_ENABLE[31] bit should be set when desctype field of
> fmpsecurity0 register is type2 (double file encryption) or type3
> (file and disk excryption). Setting this bit enables PRDT
> pre-fetching on both TXPRDT and RXPRDT.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

I assume you mean that desctype 3 provides "support for file and disk
encryption"?  The driver does use desctype 3, but it only uses the "file
encryption".  So this confused me a bit.  (BTW, in FMP terminology, "file
encryption" seems to mean "use the key provided in the I/O request", and "disk
encryption" seems to mean "use some key the firmware provided somehow".  They
can be cascaded, and the intended use cases are clearly file and disk encryption
respectively, but they don't necessarily have to be used that way.)

- Eric

