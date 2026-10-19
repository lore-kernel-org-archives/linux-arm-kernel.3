Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E27CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2HVMRDXjkeD++qT8O5sU//IhqXywOmYn/Fh/Fdivpg=; b=RY95LHA468ydbCb48BHNkVPDcS
	DHmtYpuLnUKIqBQcmwBVrjXbZhVAUPOjLyX675UygDbgBNFxaQR7iSRiFx8zh3b0T4ScN9NkNMer3
	FYqOiXgdobte96ns8K4LhTctDjmPadNHRsmZSATu0dDfBi8L+E0prdgydVuJwAkjEaFlfVW3xotKN
	KSK/JLoGAvSt9hwmkqkSNtsCHyIylPyHMhIZVUBSCV422eWYuAhy8nfrNLd3bV4Dl1OIXHm8xUybp
	MTmA3ewoYkZSYNah+vSxoQwlGk5HW6hbiQcs3F2Vi3VReEwoHsZywBXLhCcv5KnIMzgLcaB0MpW1f
	w16eBGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjZg-00000006yut-1crh;
	Mon, 19 Oct 2026 09:22:32 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjZb-00000006yuP-1RP3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:22:31 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261019092220euoutp019a30ea6f4ef1ddc128d5f78abb8d2530~f4_Le7yrZ2251922519euoutp01x
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 09:22:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261019092220euoutp019a30ea6f4ef1ddc128d5f78abb8d2530~f4_Le7yrZ2251922519euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792401740;
	bh=v2HVMRDXjkeD++qT8O5sU//IhqXywOmYn/Fh/Fdivpg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pWpArA8adCY0weZo06h5l7f+VKdwx4bquomWpvYh9iJveXLQISPiB1M5/C0fPFs6P
	 zdzEWpmLaORbBtXLFjLaDxDEA04nZJi4Yk7HAE6TuCAlSRgCBkpQZdQyYANL4aH+M0
	 UutmKxFlA9EDm9mTYWRYD4ByP24c0ZYOlr5oTAYo=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261019092219eucas1p22ca50383cc0e4c3f1eb14d4d334983b4~f4_K8T5X92231722317eucas1p2L;
	Mon, 19 Oct 2026 09:22:19 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261019092218eusmtip2172e5354d5c27789ffe4a60232b45023~f4_KBOKXV2833928339eusmtip27;
	Mon, 19 Oct 2026 09:22:18 +0000 (GMT)
Date: Mon, 19 Oct 2026 11:22:15 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, k.domagalski@samsung.com,
	k.tegowski@samsung.com, cs0617.lee@samsung.com,
	abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
	sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com
Subject: Re: [PATCH net-next] net/stmmac/dwxgmac: Extend MTL/DMA support to
 16 queues
Message-ID: <atXhR0sgdW84YxcQ@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20261016193823.2711773-1-sagar.cheluvegowda@oss.qualcomm.com>
X-CMS-MailID: 20261019092219eucas1p22ca50383cc0e4c3f1eb14d4d334983b4
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----6Yzir0.DT2R1UiBbNh0_rPWXcRyD2CU8yss_stBlwropLZCy=_18d29d_"
X-RootMTR: 20261016193835eucas1p128cb1712afce0314b1ecb65b0c0fc841
X-EPHeader: CA
X-CMS-RootMailID: 20261016193835eucas1p128cb1712afce0314b1ecb65b0c0fc841
References: <CGME20261016193835eucas1p128cb1712afce0314b1ecb65b0c0fc841@eucas1p1.samsung.com>
	<20261016193823.2711773-1-sagar.cheluvegowda@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_022228_735708_0CE751B2 
X-CRM114-Status: GOOD (  20.96  )
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

------6Yzir0.DT2R1UiBbNh0_rPWXcRyD2CU8yss_stBlwropLZCy=_18d29d_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 16, 2026 at 12:38:23PM -0700, Sagar Cheluvegowda wrote:
> From: Jakub Raczynski <j.raczynski@samsung.com>
> 
> Patch 2/3 of Jakub's v2 series:
> https://lore.kernel.org/netdev/20260601162537.553512-3-j.raczynski@samsung.com/
> 
> Jakub has confirmed he will not be continuing this series, so we are
> posting this patch on its own. We need it for Qualcomm Nord, a
> 25GMAC-based SoC that implements 12 MTL/DMA queues. Jakub's authorship
> and sign-offs are kept.
> 
> Changes vs v2 2/3:
> - Replace the netdev_err() + return in the default case with
>   WARN_ON() + return, following the review feedback on 1/3 against
>   message-only failures in void callbacks.
> 
> Tested on Qualcomm Nord with 12 queues: the MAP0..MAP2 registers were
> checked to hold the expected RX queue to DMA channel mapping. The MAP3
> register (queues 12-15) is carried over unchanged from v2 and is not
> exercised on that hardware.
> 
> This is needed for XGMAC-based hardware with more than 8 MTL/DMA
> queues (Qualcomm Nord has 12).
> 
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++

Thanks for including me as signed-off.

But I am not sure I like this patch being sent on its own. I checked Sashiko
review on patchwork and there are no comments and that is actually (not)
impressive by Sashiko.
Issues I have are:
- Does it work if macro MTL_MAX_{TX/RX}_QUEUES is not increased?
- My patch 1/3 was doing some prep since new XGMAC have unique setup where
  number of DMA channels differ from number of TC's.

  How does it look like in your hardware? 12 DMA and (8 or 12) TC's?

  I agree with comment by Jakub Kicinski on my patchset 1/3 that I should have
  implemented it better, but never finally did. Issue is, stmmac driver
  assumes number of DMA = TC and uses {tx/rx}_queues_to_use everywhere.
  So proper implementation would be spliting DMA count and TC count,
  where both can be verified by stmmac_get_hw_features().

  Of course, above applies if DMA!=TC in your hardware.

BR
Jakub Raczynski

------6Yzir0.DT2R1UiBbNh0_rPWXcRyD2CU8yss_stBlwropLZCy=_18d29d_
Content-Type: text/plain; charset="utf-8"


------6Yzir0.DT2R1UiBbNh0_rPWXcRyD2CU8yss_stBlwropLZCy=_18d29d_--

