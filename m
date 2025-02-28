Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDF0C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEsc6aFAVmHqCUEwNlGCIO1d4hA0FEHyKLGIUo13iGE=; b=VWVj37eeqXq856raREuhku3Map
	Lfr23KvrYn42a8eI5HrO2U5/mUsaNAj2p5vjJR+7Asp4AWwJuf6nKcL/9vNxX02pUCinnsyed44rV
	wDvurACjkd5L4Q7amnvkxdcV3LAarhv3+n5dZiYKMP0J9br46/0+Pv6U6V5jWG7IJoA1Yw2Liw1DL
	+2byDCJCwx67rB9rqv8Hth8VeiVtzCd5k+iiVQrvbQSbeXcDZpM/1lcpfQMHnC+doSk799KdCFU4Q
	Pv/Rvdwdab8zg9s9UD3lMI8qpQKOyZ8q+5rfsxZmGdH8PE3qMCEzc8g4EKFjBgBCWGQg9jJ3qK4qC
	28lgZrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5xG-0000000CLwh-2xr7;
	Fri, 28 Feb 2025 19:23:26 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5vH-0000000CLdI-1uGF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:21:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4Z4J3N0hTjzmJ6L2;
	Fri, 28 Feb 2025 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1740770477; x=1743362478; bh=FEsc6aFAVmHqCUEwNlGCIO1d
	4hA0FEHyKLGIUo13iGE=; b=upmCO2JH6k7i3rWpPugyDfSQasJDc74pLu6GVEVH
	uaA4dFIsnJIDjEvR1aVvWBtL6gcasIvAWnxDehVAs98C1VuAaIwEdoSByHhzW6UY
	oTalkwNtQBy3ZIC4yVQj4nN/NIzkZFbP658Ilt7SNgG5fcHu9BfHNUANlKuxrLbf
	Pq0zftpPGLInvRcrxzlAG/7bcbIHUbzEjXABizCnALDeheyB4Ee4/v5fPRKWkv1y
	drYdQqNenvwCQPMaP90FAuSzZehLZ//ofuBTQJFMRZ8KWlOmNFwVxtZrAZK4bDsz
	kDwI6qpPWn5L5iWPxqB34/kto77mCgZANSODanszmTdyuA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 2XrMjxKRLh1p; Fri, 28 Feb 2025 19:21:17 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4Z4J3F45vCzmV7dH;
	Fri, 28 Feb 2025 19:21:13 +0000 (UTC)
Message-ID: <015ce85d-c62b-472c-8527-33217ad815eb@acm.org>
Date: Fri, 28 Feb 2025 11:21:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] scsi: ufs: exynos: put ufs device in reset on .exit()
 and .suspend()
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 krzk@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 ebiggers@kernel.org, kernel-team@android.com
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-7-peter.griffin@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250226220414.343659-7-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_112123_564383_BC282E1D 
X-CRM114-Status: UNSURE (   7.63  )
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

On 2/26/25 2:04 PM, Peter Griffin wrote:
> GPIO_OUT[0] is connected to the reset pin of embedded UFS device.
> Before powering off the phy assert the reset signal.
Does the above apply to the GS implementation only or does it apply to
all SoC's with an Exynos UFS host controller?

Thanks,

Bart.

