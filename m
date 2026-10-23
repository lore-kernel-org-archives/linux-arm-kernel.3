Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DUgwxQPJ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=q3Hcq4sV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7T7kd87x0lCdwlmdk5J8PfZrtJwoJ5GFmRHEwdyDdq0=; b=DUgwxQPJBA+7i8lBHrzVU+ZPvv
	5H18LJd31D1QIzyQq46Epijiu8ptzJyFzJToj/EgKqHju7XK225PCppEdnLFKaykEBi9S5LlH+ZBa
	oywbLRZYDvVQYtS0a07L+6DRZ8p05Ks9APZA7wfEblks7AjOcWFFSiPz3gO4BaMFTMdmbURQlG+Bi
	3WhvkSsTBpWvrILXmSiPknNNkgEhjcg7svlnFBYAfKYBWsWSVsh02HFATlRuIG/5iQSJP1cdd2HiU
	aEZAwWh5lviWmsDqvSF3Xg/1fVQDvdXYr6fbCn+74jQAaLO0eAHO1GMj4bJ9zidadeV1mcRM5gy8f
	RPfRDr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFok-0000000GSPZ-1fpM;
	Fri, 23 Oct 2026 14:00:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFog-0000000GSPA-2y9Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:00:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3CAD1C00;
	Fri, 23 Oct 2026 07:00:12 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B91B3F673;
	Fri, 23 Oct 2026 07:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792764015; bh=jDuuA52OKdaceJrZOXhYdj0GY5RdsDJoWvfCSCKFrG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3Hcq4sVEcSdBz0n1dXGKQ0Rle/LBvWVdcAXAyMkZLP2LXqlL7dem96mWVmTAOkqH
	 akm/4/OKq79UikWvGY1FIlXhImj4Pifi8h1EHNQKhwqfggzjJa5mQ8jemw2YedCzPF
	 KQJDL6pYu6e/1QC5GpwYDwNOsT5NkN5uFTa/dM+0=
Date: Fri, 23 Oct 2026 15:00:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Amir Ayupov <aaupov@fb.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
Message-ID: <20261023140013.GK26205@e132581.arm.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
 <20261021164332.GI26205@e132581.arm.com>
 <024bc6f1-eb73-4f01-84f3-738bf68bdc93@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <024bc6f1-eb73-4f01-84f3-738bf68bdc93@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_070018_794323_B097C2A7 
X-CRM114-Status: GOOD (  12.09  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 10:49:40AM +0100, James Clark wrote:

[...]

> > >    * a device that matches one of its classes and has all of its capabilities.
> > >    */
> > >   #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> > > +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
> > > +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
> > > +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
> > > +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))
> 
> Isn't this recreating what GENMASK() and FIELD_PREP() does? Can we use that
> instead?

TBC, are you suggesting using separate capability bits to represent
TRCEXTOUT0-3? Why can't we use a single capability bit to indicate
whether the feature is supported and caps->num_event to indicate
the number of external output signals?

