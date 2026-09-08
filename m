Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287DFC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHS6yYjSbAaC54uWl8jqLgZr/zQfkYnaHmG9AeL9Lf0=; b=xhvYEq2AF2+vEI36VxAWqS8WZE
	YsC/rupVbQ5420a/sh6R+gyFv+4OxLmO6urcTO15ODosQWa3RKL9TtOncRTduf96OUXaw2eyxHCki
	ICiD9Nv2bAmTdfAAHWe5oNYNxBTNzTKnIhMheVnv7AXnYn1tkyVC9f418IsUzsg9cWT/vIUP4paHV
	tNbH13+5mFLTcGSPNaeNNul8pZL3W6qYSt0IirL1YCGmfp/MKseDCd8YkEIeSUFo6udN/rN7FKJbl
	e7FzenlrWHsAUPaid0nIKAAU5xEOTZF+gSNpoWqmCkCCZeacNiTK4Gm8orXqChYPEnwuxFT6LsBsv
	yNKAr4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yWe-00000009cOW-2gDZ;
	Tue, 08 Sep 2026 16:18:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yWc-00000009cNn-0afy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:18:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFB2E1476;
	Tue,  8 Sep 2026 09:18:16 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08DFD3F7B4;
	Tue,  8 Sep 2026 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884300; bh=5KmsMGRjTRCkCrZBj1mOXRRUXRJYE8pnrPLj4tCEBhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/1bBiPRjZbw6wj8WAAIzJpzYC+lfB+d+VxzHZSrlPYbbLiX+ZQuXSX6pQOIL6xC5
	 zN4ITrTuVWbB4lm/xWH8AZIoXKu7M6OVC9gbRtXWbgCeGCmkcIgl/YXOvDXhMFSbIo
	 jrWv7W8PnSa+j5qd9kw8jqMp5X8rMXyE4RAnzorc=
Date: Tue, 8 Sep 2026 17:18:17 +0100
From: Leo Yan <leo.yan@arm.com>
To: yingchao <dengyingchao@kylinsec.com.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>, jinlong.mao@oss.qualcomm.com,
	qinyungao@kylinsec.com.cn, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: tpdm: initialize spinlock before exposing
 sysfs
Message-ID: <20260908161817.GB200420@e132581.arm.com>
References: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_091822_228685_41FF7C24 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 25, 2026 at 10:06:47AM +0800, yingchao wrote:
> From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
> 
> tpdm_probe() initializes drvdata->spinlock after coresight_register(), but
> the sysfs attributes registered by coresight_register() use the spinlock.
> This exposes a window where a concurrent sysfs write can lock an
> uninitialized spinlock.
> 
> Initialize the spinlock before coresight_register().
> 
> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
> Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>

Reviewed-by: Leo Yan <leo.yan@arm.com>

