Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFE6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 20:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NntvXvtWhzJ6OcqXMIfgs9i0GrnRvBUhZKhhcyppfos=; b=x0GfPrm+IFZFvAZLOi/L8+X24l
	Lkippf1I1B7/uY4bL0acUJvpoL+q+5EVpbRI6IcHBMTIaiT2g0yK7yYSTAVQN1kuAEgmxbbNhmQQH
	L9Q8DJZEkaDqfP5cmP3CuGeHauLd/DtsRlXKwNvb14ADeBmPL/DZgTSyqgglHhYlXSuBNoYLIsR6I
	Iht6t9EzQBwQ9UB7lsLa+fCIO8DZOSRdFoMqgTNyfs1rwIfnxq2YyzVbJb8ZP0vN/wMNgbaZoizeB
	jRAnNxRbnW9BLBqvACImDzdOYn1b/1KKYiTNJUWVpiGcpQN4y1Yf44f2piNSIB/bogUsQZ1ZrD05w
	02ZX5Wnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviz4-0000000GANw-0oSy;
	Fri, 21 Mar 2025 20:28:50 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvihQ-0000000G833-3o62
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 20:10:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZKD8W4Ty3zm8Stx;
	Fri, 21 Mar 2025 20:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1742587833; x=1745179834; bh=NntvXvtWhzJ6OcqXMIfgs9i0
	GrnRvBUhZKhhcyppfos=; b=BeX9sO6k4WzpXNtsHcsp6DjnpMY0Zih21JisnYN0
	KFhaiOHHFGhm5T6dCGbULAsNlImXcz92dNL6FIlVdSkmIHfifpRzGM4PLKeHDZGs
	WDGwckOK0/Y2eXq7eGrFkhrNVdasSm7N1cYsgweCHk3gub9JIy8S+56uPNeMZc7q
	S68CoHQIbFKziQ14d4cVlCOL9j/WY0Z0h1T+dCgGcuQdVs1TxlnoJY2w4d5qqXB5
	Y1AZlQryhEsnJ+7cpTzfw3pU/3mAaiSgn4N0NCQgXsyNDzSkmyNG9NTIMt3uyEVr
	3MRSjIvE9gkEcFozIOkSJTKNdzeCO01xO2Rog5ncVgFwGA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id wZ0MmdshLZIg; Fri, 21 Mar 2025 20:10:33 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZKD891S2jzm0Q6C;
	Fri, 21 Mar 2025 20:10:16 +0000 (UTC)
Message-ID: <8d5fd977-b600-492c-b888-2318130f46ec@acm.org>
Date: Fri, 21 Mar 2025 13:10:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] ufs-exynos stability fixes for gs101
To: Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Chanho Park <chanho61.park@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Eric Biggers <ebiggers@kernel.org>, willmcvicker@google.com,
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 stable@vger.kernel.org
References: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_131037_057024_D248BC44 
X-CRM114-Status: GOOD (  13.60  )
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

On 3/19/25 8:30 AM, Peter Griffin wrote:
> This series fixes several stability issues with the upstream ufs-exynos
> driver, specifically for the gs101 SoC found in Pixel 6.
> 
> The main fix is regarding the IO cache coherency setting and ensuring
> that it is correctly applied depending on if the dma-coherent property
> is specified in device tree. This fixes the UFS stability issues on gs101
> and I would imagine will also fix issues on exynosauto platform that
> seems to have similar iocc shareability bits.
> 
> Additionally the phy reference counting is fixed which allows module
> load/unload to work reliably and keeps the phy state machine in sync
> with the controller glue driver.

Although these patches are somewhat outside my area of expertise, the
patches look good to me, hence:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

