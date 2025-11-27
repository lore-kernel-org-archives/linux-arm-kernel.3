Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62F1D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83hpG3KpOyYbzNcVBvdfV9E+VqWR6SbsIEC43auV/o8=; b=cKElIdh7SzoRF8wIvflUQ3fpvN
	/56g5rOMn62uk5uEtUosN/wEnSZzV4KZ0wZVDzoZ7qsg2PakbW/cLi2mEPcOsMs3xO4A/1ljGEsLE
	vf56PuD0n6pUvYIY0CcV0pfvHeF75BSsqdmtdkC0ZXJb6nxxcM+rNR58YGqNpNzF0KMRKuuBdCIsF
	UM8WbK1chCtDxLnslw1fa9ylG/nQEXjDa4+mkrTYbsawQSPxNzjRYWF7J9CLx7R9RE8GiZNHhpqLA
	d5OBVK+eE32AbUW8yvilP41mGH1ilv0kpgg6sW3R33+KzK6prG1AKv+P0kccHHTqTp5WIqUEDHjR2
	ltUCLnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYkO-0000000GKgK-2ud0;
	Thu, 27 Nov 2025 09:57:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYkL-0000000GKfo-2dv7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:57:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AF271477;
	Thu, 27 Nov 2025 01:56:57 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A7DA3F6A8;
	Thu, 27 Nov 2025 01:57:03 -0800 (PST)
Date: Thu, 27 Nov 2025 09:57:02 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
	Mike Leach <mike.leach@linaro.org>, suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
	mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
	milesjiang@google.com, nickpan@google.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
Message-ID: <20251127095702.GP724103@e132581.arm.com>
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org>
 <aSCbJR9aT1vOpz0a@google.com>
 <05babb6d-a588-49f8-a34a-c82d5f58adf5@linaro.org>
 <CAJ9a7VipxW5-2roAQA3y212sQWr1kq2HNbLK1jmLNP1jFseYiQ@mail.gmail.com>
 <68efd5a2-3b65-4f37-9bf0-40c4e5ade480@linaro.org>
 <aSgPhd4u3Oqi3Ymy@google.com>
 <20251127092231.GN724103@e132581.arm.com>
 <bed84247-c3c0-47b8-a491-9af9e51ca5a7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bed84247-c3c0-47b8-a491-9af9e51ca5a7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_015705_948168_DBEDDB0C 
X-CRM114-Status: GOOD (  20.63  )
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

On Thu, Nov 27, 2025 at 09:30:28AM +0000, James Clark wrote:

[...]

> > > -	for (i = 0; i < drvdata->nr_cntr; i++) {
> > > -		val = etm_readl(drvdata, ETMCNTVRn(i));
> > > -		ret += sprintf(buf, "counter %d: %x\n", i, val);
> > > +		return sprintf(buf, "%x\n", val);
> > >   	}
> > > -	return ret;
> > > +	val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
> > 
> > It is not right to read register at here (it cannot promise to read the
> > CPU (cp14) register on the target CPU).
> > 
> > Please refer to the same function in coresight-etm4x-sysfs.c. I think
> > we can do the same thing at here.
> > 
> 
> That's a different fix than the display bug though. This change doesn't
> change that if it's already wrong. The display fix should go in alone and
> then if there is an issue with not running things on the right CPU that
> should go in separately.

Makes sense. So the pasted change is fine for me.

Thanks for correcting!

