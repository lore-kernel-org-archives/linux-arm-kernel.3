Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AC7C369D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqfmpbjW7riguud7DMBTVyGF+ZF1AdVA9f8c2C7hnLI=; b=yoRmF8OS4z5lfBFerLOO4nXL28
	WBox8dcHHnOMcB9EbzY96yGDsH552jpmjCNtcTJC8W2RDbbikecHHRPsyf7CzIWAB2/d4/4hddv4W
	LXQ06UaLAfnSyvlyWcB9cn4BF5J47j/3x5KX7x6fApsz4B7jd9cDGkByjva0IonJwE5KJ0SuPh1Y3
	8yqVRpev9eRPvNf1voYO124DQNxFpX7jc6N9njJhrtPWvUMbOaMUdPdnUy79rBthSu8tC5JT2m7xe
	H0yQkvhD1h6AePIUtoL26IMAFS629JRmmNm+J7HyKOexzYqcgDBwn14nr0JFpxb3tx7AmsccwSLcn
	yhyWeqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PAd-0000000D7ME-2AYK;
	Thu, 17 Apr 2025 13:20:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5P6J-0000000D6mE-0Vm3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7021A4B394;
	Thu, 17 Apr 2025 13:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B78C4CEE4;
	Thu, 17 Apr 2025 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744895777;
	bh=JOB3Kk/EM3/vcVbO0LHbslX6iAjbGgIXo4UEDu68gq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6ThyFqA8noKENc0TRm+jM7qkIhPqeNxxbNYDgUD1uF9by0kXywDqsDo5p/U9cuUE
	 YMMXm+EIDwh/MlXQbHRpZ9VAGvonfTIZLAeUM17+YAoAeFQkD0daIYSj0c5M23Y7ac
	 +gDbFX3ebm+od/yhd3ry9t3/q7ZjF0g+wWbfK8kmuIuE/+F9xPKuBJxd4pCCdSB/IH
	 Jep+YB1r1DIuhn2zqURutMz2MEm9klog/jRzeE+UjsmL16RwrkJal5yz131LSvZFiM
	 v+o2Pkyd3L8UbSkMr/tVN2Ctnkunw2kkSI//U6DYbmnbUXcetX6NZJxstjwNAtsdoV
	 knXwfFuq+hi5A==
Date: Thu, 17 Apr 2025 15:16:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/6] Apple/PASemi i2c error recovery fixes
Message-ID: <kw3iierscam5stq7igwxpj2std6hwc36y2xbbqliheorbaouxn@zspp5ltjxrus>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_061619_231963_844B8EBF 
X-CRM114-Status: UNSURE (   6.76  )
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

Hi Sven,

> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
> 
> Sven Peter (3):
>       i2c: pasemi: Use correct bits.h include
>       i2c: pasemi: Sort includes alphabetically

I applied in i2c/i2c-host the two patches above, so that you can
start from patch 3 as there were a few little notes.

I didn't see necessary the Fixes tag in the bits.h patch so that
I removed it.

Thanks,
Andi

