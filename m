Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A923ECA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m84CgV/Y7UglEvbuUGj3BolEOhWw75j2DbbKv7GV71s=; b=ivdnX3sCa/BfHHic2lw28F0M/6
	v92FIc0IAkNjOeMFFoVdq6twjh03XRF7HxmCDXVpeId2JinK3VgjeZ9UcjlZo7qvMEtwsxx0DK56g
	apm7Uy6jx2xUrgy7SxyRzQRErYzvs1gaSzZYkHM6LCHobv3CHAdyVbqIVcCm+PSjpBVZZPPZnrnN0
	n93H8EkDJmVPwhdQndz1gMZ982rMpvaj07s3RFhoa4cQN+Owt3GEHEnl8xMtaDTYpZ4KMFLhvRcvP
	PyRn2ydGIppbf/ekLDSzep8WOZ5nqDFnm+SF/SFCeGCFWH1o36eAxTrAFUlytL+/q5dBQCOCFKKnZ
	QWT60Yag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHaX-0000000EYFq-2op8;
	Sun, 04 Oct 2026 08:28:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHaW-0000000EYFL-0KCM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:28:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB4351691;
	Sun,  4 Oct 2026 01:28:46 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 193E23F763;
	Sun,  4 Oct 2026 01:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791102530; bh=hj5R5jF5CRnw0juE1ALnPF3mWFQ78K4oiIdBkUbQCNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUN9v8npEC8SGO/RxSEmPQC2sQGykfXJWkXlgSQ+H7NiZbD0DzaRZSWGXs/Kefaxw
	 MFOUX7n+Ch06tPJP7ok5LKxzwd10SDr574CtBNocbU0H2zPxgrfKe5t1Supdr64YTm
	 Fmzxqj8c40492Nh0Y9p1Oh57ilLUP1lFrjXm7Nj4=
Date: Sun, 4 Oct 2026 09:28:34 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v12 06/25] firmware: arm_scmi: Add basic Telemetry support
Message-ID: <asIOI0C2IrurrLlj@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-7-cristian.marussi@arm.com>
 <20260928130134.000019ff@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928130134.000019ff@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_012852_166889_7462A849 
X-CRM114-Status: GOOD (  11.63  )
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

On Mon, Sep 28, 2026 at 01:01:34PM -0700, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 10:19:09 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add SCMIv4.0 Telemetry basic support to enable initialization and resources
> > enumeration: add all the telemetry messages definitions and parsing logic
> > but only a few simple state gathering protocol operations.
> > 

Hi Jonathan, David

so I posted v13 which was under work since a while trying to address
more Sashiko issues and I included some of your feedback too, BUT still
I have NOT split this patch in smaller easier chunks to easy reviewing,
since I did not want to change too much the shape of the series for my
beloved non-human reviewer for this iteration :P

...but I will certainly split in v14 this patch and the next (both well
over 1k lines as of now) while addressing more of your feedback.

Thanks,
Cristian

