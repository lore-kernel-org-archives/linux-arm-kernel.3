Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C37C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doAHq/zHtnE1KHeKd6RxRjT4stuTslQt9T3rfwQh0/I=; b=u0IwVUG4a9Bf3/UtLbiKFTq25u
	pT6ML8qYKjk8o1i4qZKwZPgmbws19qoxhe8FihV6Nac1/vxWDvKrDp8qYg4IJhwNPbgJlyh/49IQg
	F48p2MaoFDCaVksAd2BmloV5B0YuG50ihtzxzQMSchKx2rMfG9moA0ns2TErels+YmVwbBdhSZsYu
	jAtt847AlhxOpM2URgtMW7+fhbV3B+jbCCkBK7JhD6FDqolphw+zsjIohc3U6QdVGe7+5NDjZ7gJG
	/fYGAepbgyDPdQJk/IwvXhLMY8aNK+7eDpRfphCfY4PS97lUgBAT4gNLhK5zznUtmO4S6wRWsLiNB
	5GpRsWcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlGh-0000000DPdB-296e;
	Thu, 23 Jul 2026 04:42:47 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlGd-0000000DPZ2-0kym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784781763; x=1816317763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yg3eH/AksYXmLjITuhwy/JXmoWSYo/p5JLciT/L9N6A=;
  b=GyTILEqjtvwVX50YrMNm1sZSQ+l9zEWPetQxqPrN2MI4l3HXX8iLV1OZ
   YZg80k3rgTojUeTB2oOl761MEbqymZ0Pum1GJvI6AQrnFIKyS3f93kuBq
   HPh4CsRii+pUK7eejCuybO9fK03MPQFDn771/PjEfljys9F8nBnMredN3
   72EQJCyDZDjSdlXr6bfhQRGjUnxMEfBIf5KshtZEsLTBYpRgWGDlpdKlv
   l5niXvGZkRYOWSXR/b1nA1mT1WJKbDR9lAUR33jEiVYOZ/RlwnvpKu4qu
   D/bf0oiH7WYG7mVEkrljCmuPrs9HCDv+8r3jndnF+C0/6MjT0L2J1PWDd
   w==;
X-CSE-ConnectionGUID: 0PVJE9hJSSuCAtowONpjbg==
X-CSE-MsgGUID: wdr1FlFYR4GmiM0JO9wkgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89106095"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="89106095"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 21:42:42 -0700
X-CSE-ConnectionGUID: ypeAySwaTf2gSxXcElTkBg==
X-CSE-MsgGUID: kVZ9r4DyRii9OYwzze3NaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="257741144"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa008.jf.intel.com with ESMTP; 22 Jul 2026 21:42:39 -0700
Date: Thu, 23 Jul 2026 12:42:38 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Heiko Schocher <hs@nabladev.com>
Cc: linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>
Subject: Re: [PATCH v2] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Message-ID: <amGbvtMWHXjpE35D@yilunxu-OptiPlex-7050>
References: <20260721114258.3324794-1-hs@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721114258.3324794-1-hs@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214243_268903_89002238 
X-CRM114-Status: GOOD (  11.38  )
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

On Tue, Jul 21, 2026 at 01:42:52PM +0200, Heiko Schocher wrote:
> Add csi_b and rdwr pin support for the xilinx,selectmap driver.
> 
> In current driver the pins are configured from DTS and set to
> GPIOD_OUT_HIGH. This works in case you have one FPGA.
> 
> Extend this to really implement csi_b and rdwr pin function in
> driver, so it works with more than one FPGA.

Please help specify in changelog: what do csi_b, rdwr pins do? Why they
now work with one FPGA but not with 2 FPGAs? How do you select which FPGA
to reprogram? thanks.

Thanks,
Yilun

