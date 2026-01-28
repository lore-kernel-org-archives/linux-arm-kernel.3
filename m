Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FC4D46C04
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 22:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtTFfkYldxZzY3XmqF9GsFpiCifORZYJJpaf1Zl6Law=; b=iwPJGBEOvxqENLno6ZTQiY0z6I
	UYxrbvc0GUDAqUwH28qZUCF4k7BwAD8i3iJ5WcHhO5sUaznDWLBSP0OlCngxUltskAUNj/rXXyyoD
	GVcEUO074UJyApzyFtPCUrHFtS8oQt22qPNV3Oy3B8GqbBHpawsuPMiW1JqrvW7bo+wRvhG+vSsMt
	XG7tnOZ6hfuw196cs/WmWts4WNxGLFhshOSZO5Xz6KTXLHnFd2YjBE96OgUbb//a5xALsJZa9Fv5V
	M6ZeSRe2OAPZrPu1VLBfcn0jBch1iguP5EcU9yrCQA3LnEO/h4oSByyyY8Jf9ivRL7QawLNIlfQrO
	X7rymUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDtA-0000000GsmC-2BX5;
	Wed, 28 Jan 2026 22:19:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDt8-0000000Gsls-1m9A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 22:19:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F0F2418D1;
	Wed, 28 Jan 2026 22:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5AFAC4CEF1;
	Wed, 28 Jan 2026 22:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769638788;
	bh=t9x66D0KYT9q052pysiu6d/Z2LJzxP385DPcblnwOfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXQgTE+RsdLgh7WtV6Huq2XBZpCYwlg4+YmQ1dQBu3Ue8nig7Hmm6se/v3Zn9O6u+
	 Vm5lUdGigPM/lwQ4t1mS0/rucFdKEbvuNJrbwWe0mk1JrIcTk0DYMTxZyLWxzVIh8u
	 j6RDW6rEehF/EyZzXm9pqQuBDXaO0sYLKuWgPZCRKyRG9lHDF0VT4ExBF4clz+ZDO4
	 GlDtvnDcINxglosGIYXDyl0Gu9oZh60OAyHE3PG41t0psWxxlkebLjFRnFAbak6h82
	 VxAx0fOFHZDpb5vUsUaj1DcmUvEOSj9/whlJgRG3Zr954LHR92qkUdn3bLvwQt2iFE
	 bZI/ec7KqHkvQ==
Date: Wed, 28 Jan 2026 23:19:44 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V3 0/2] i2c: imx: Fix block read handling for invalid
 length
Message-ID: <aXqLI-tYnaP_P41u@zenone.zhora.eu>
References: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_141950_499162_31F37A1A 
X-CRM114-Status: UNSURE (   6.38  )
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

Hi Li,

> LI Qingwu (2):
>   i2c: imx: preserve error state in block data length handler

I merged this patch in i2c/i2c-host-fixes.

>   i2c: imx: add abort path for invalid block length

For this patch I want the review from Oleksij. Oleksij? :-)

Thanks,
Andi

