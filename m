Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5CACD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/z2DCk4dynGP3EOhfGPH5RufQFwqe2sDUjasxzmGDhc=; b=T6lirRNHS0AyO6BH74KrB6BdOd
	xF8TeAcBbQLHWMkkbX/xeSquxcpgT+JR8lmNrTqU8W3o+VBzfRaNM/xKE8uRx88fmW3aqqtgin91u
	xuCSK3r6tiOED9VruBlQQbJEeiO0yOxDn6F3us07G10IYoKWEmUHZf/o+FWZCg5L9FEuPzdIPEX1B
	V6vLZc6KCg154Whj5QhKZAv4ys8EfoX/r2hpCeJ8OGKRWPE2gh8HGCGKgBBgCjbOspgN3hyXTIuD8
	iv+YBduAK3cvhdf5yxmdo5q/MUv5gCDFDBFvSDpBdQ2upk+QuuFMZ+HS3PKbh1bK9IcRoC8Vd+ZZ5
	S9t6Xv+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc7k-00000009B6a-1HWG;
	Thu, 11 Jun 2026 09:54:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc7g-00000009B5C-3jkA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:54:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso65336455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781171691; x=1781776491; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/z2DCk4dynGP3EOhfGPH5RufQFwqe2sDUjasxzmGDhc=;
        b=oYNMuxK70xijrEOXdfo1++OuK7hB8n1QC79UFTu11fYltC7vbjRrdxUQMAptyoWJHL
         dtLV9sZNjT5jbZmH+1BTAVa6pno2W3EbMymVT5f22t8rQH4f0ealRKQyAG4ncly50blE
         bir+Kz3x+shpdlnA9tTxrPsQKrLwDTHP3tj6+Pb7OoaI5EPVLddDgktcQw+sGNtxxyju
         5u/ai4OKd8SKGCV2WL46YNHF5NL4WHunt8exK6fOB6WVKmFZxni0N3STi9AXyH3fLgLS
         +cY1aLgnQohevDmAdoIAVABFKHt1QpzRuOm6StJdxU6gDjpBjDEQywM1VEU7ETLMP0hB
         yUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171691; x=1781776491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z2DCk4dynGP3EOhfGPH5RufQFwqe2sDUjasxzmGDhc=;
        b=U51TsXZWG1oazHkC5PgNY/B/RiMFFw1sFVf+ZDRwhxUYT7wI64jL9KJengz9r9u7Uc
         hhZpEQQ8BdLxYSieATNFkqW4/wkCbAtyKyvpevs9IzBemS4cdHJ12W/4WeUUjr1ke4GD
         RtuUuXxNs+O7ikvisq1KfOWevpUYyKJTfo0MgQPNFx3cdJN6ohEO55bUe56sjpJcTllE
         5TxE0+7B/LpqgG+iFb5DkFYKOZtTdC4g29MCj1m8lHgExO3RPRBdKhkkJKSA5n5E982W
         BkV7yZwMXZVnCkQy3rRfnB3iCQjltrt6VB67oluT6fydI9mP780jV+QjLlOX9EIXvyt1
         S+rw==
X-Forwarded-Encrypted: i=1; AFNElJ8kiLipgc1w1Ej64VQ/zUyOCRg9oLvXEP1B9PWhwPoGVgVqT7NGtDdj5w3E4auOpufjzNvIx+VhAgJtdQ1Hi2r2@lists.infradead.org
X-Gm-Message-State: AOJu0YxIWhQZRuskkXGxz4lo/iJS064o/c0IJTErqrbAMlc+5OXYPeGr
	NajFw0YhPxPQDxyNTxmXubY+XgNrfaAfjMzEiv8FuHcf77yb3HONuHIlGMgAheorY3S4ZIAvd0a
	7AmZx2Rw=
X-Gm-Gg: Acq92OFEfEUI0p/gTbzwgZKjnb/1veqfj2AVt3OkdQb9lqS2HHTpo9KQJp9hFOc7ISo
	RKDLJZ5lAauGej79jO2GA1Jurmp3ZBowN7SjZ1FbnRhn00iZ1WZxHWcNQ7JNvi4TOSiYQRtSDEd
	b31MCBI3a2xznQu8nrzVh9zy8HhjcYe7zZmoCNHWtBmIU8ILwO9H+qqHduSDI2sswDLW1dC8myp
	ToAppE75k9dR/JessqqpF1oC+OslXJk/kLwr8r09iSh1ZfJOMTKbbzHSccd6yWhO0DH8xiHZrsO
	1XTI0g281Y27g72IheGESw0sqSSIemUdUp04o9Y/VgDXw9UW2BlqgXl59YkFwbxowpkHs0W6s1M
	kKlBcXTWlWzdivWOzBWHwnLxWmWTt7yRkbUHTQY4cZDCf+ppKpnXb8fsoZ5I/CKXQA3yYAdfNm5
	jGHjqC5PV4+Aq3VVKbwG0o0zR+mjmSan4061AMYYJifCPQcw==
X-Received: by 2002:a05:600c:c0d5:b0:490:44eb:c1e5 with SMTP id 5b1f17b1804b1-490e5624838mr23357035e9.31.1781171690745;
        Thu, 11 Jun 2026 02:54:50 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e52ac9aasm36942655e9.4.2026.06.11.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:54:50 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:54:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <aiqF5mh1PvWpH3L5@linaro.org>
References: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_025452_947684_4D17158B 
X-CRM114-Status: GOOD (  24.76  )
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

On Thu, Jun 11, 2026 at 03:18:51PM +0530, Mukesh Ojha wrote:
> On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> > On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > > If a subdevice fails to stop, it indicates broken communication with the
> > > DSP. Continuing to stop further subdevices against an unresponsive
> > > remote processor could close rpmsg devices that could remove the memory
> > > mapping from HLOS and in case if remote processor touches those memory
> > > can result in SMMU fault.
> > > 
> > > Change rproc_stop_subdevices() to return int and abort on the first
> > > failing subdev. Propagate the error through rproc_stop() and
> > > __rproc_detach() so callers are aware the teardown did not complete
> > > cleanly.
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > But what would callers do about this? If you abort the teardown sequence
> > half-way through you now have an inconsistent half-stopped state that
> > neither a new call to stop() nor a new call to start() could recover
> > from. That doesn't sound much better than the SMMU fault. Or am I
> > missing something here?
> 
> SMMU fault result in device crash while other is non-functional remote
> processor. From Linux side, we do not know the state of remote processor
> when the timeout happens..cleaning the subdevices can result in the
> debug data being lost for hung remote processor.
> 

Ok, but how do we go from here? Do we expect that the system would have
some userspace monitoring daemon that would collect the debug data and
then reboot the device to make the remoteproc work again?

With these changes, I don't see how you would start the remoteproc again
without fully rebooting the board. Calling start()/stop() on the
subdevices again would lead to crashes because some of them are in
started state and some of them are in stopped state and we don't even
know which one is in which state.

Thanks,
Stephan

