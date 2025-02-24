Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52ABC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCf5LqC48vAXtMhWrnY55abItj7vuNet4puF6xMEx1o=; b=JHtDwHdI04oWHNOUAamqBGHKkG
	7HsOd4t7ECrAusBwBrFOg1A3p+FherVJ3Hq09ssGeQ7nUHjZDWI2yo5W6X+eOX1xup/RLiWInHLbE
	mlefIMNoYCL3t0GG6cPZ7iuFKPL0S8+fs/cz5iULTK03sx3vD1ueRTCVtPsbRIbq+gZvzO5A/Ezhq
	/oU/RRmj43VIUkE909BMmKLCFc+eTfqXUtxmVT8X0MS/yy5+WQvmVAA/v0jF7cPvl6v95VZRGzBkW
	Xav+iQ4QjALtoTi5haW1Wb0BG92yhuFOBe8k8FkbgL+6+xOZJgEwDFV1x8PyzHq+Vxj0Zww/gkIPg
	5AFk8ztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcvF-0000000EkZb-28dK;
	Mon, 24 Feb 2025 18:11:17 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmctk-0000000EkK4-2vms
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:09:46 +0000
Date: Mon, 24 Feb 2025 13:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740420581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dCf5LqC48vAXtMhWrnY55abItj7vuNet4puF6xMEx1o=;
	b=KzGuzFwzVUZA8z++JLJuMsaluarmUd4hi6J59xuNydwpnDCqShcI9fvjgPi3dBPIftFarm
	ido4UpUcUdee+gp8FoXmS0sn9VgmaNTTncGPyStbyImI2fWI4I2CM2am7Nz+j8X606/ArX
	LKnawVpZCDtJwvHKWf+2yU/SRTk/lzW31vusI0gdTnhrJdLMUqkymInU2NlIsNuo/nOp6x
	QW/Y/n0VcEsHj2O2ZyJgeb2dVT5XzfGSLO98WznNTludm4wkUTFccBaIVb+0GOnbPz+gvw
	uY3xBL+6bu70T4usVXNX2GtLDLSby/XsFVtZ25S5YzgJ3f4jwttqENA5ScbLag==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/4] soc: apple: rtkit: Implement OSLog buffers properly
Message-ID: <Z7y14Q3ifu7U1tHI@blossom>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
 <20250222-apple-soc-misc-v1-2-1a3af494a48a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-apple-soc-misc-v1-2-1a3af494a48a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_100944_873133_5ECC1B55 
X-CRM114-Status: UNSURE (   8.00  )
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

> +	if (ep == APPLE_RTKIT_EP_OSLOG) {
> +		buffer->size = FIELD_GET(APPLE_RTKIT_OSLOG_SIZE, msg);
> +		buffer->iova = FIELD_GET(APPLE_RTKIT_OSLOG_IOVA, msg) << 12;
> +	} else {
> +		buffer->size = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_SIZE, msg) << 12;
> +		buffer->iova = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_IOVA, msg);
> +	}

The shifts are suspiciously asymmetric. Are we really sure this is
correct? My guess is that both size & iova for both oslog & buffer need
to be page-aligned, so all 4 lines should be shifted, and the bit
offsets should be adjusted in turn, and the lower 12-bits in oslog_size
and buffer_iova are reserved. But that's just a guess.

Anyway if this logic is really what we want it deserves a comment
because it looks like a typo.

(Likewise later in the patch)

