Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C978C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXJyhLZM0wQnuMA6BY86fx7l1XvsG57/1opLs9TF2k0=; b=S2v2PQOuKDrb0o80v0LJH0+lOZ
	O6dIFcNt//4lgViMoe5VJ6B2NO8mRzM+L/C7vbmb4FGxP7pNSz6Vs/h5x32MTPYR4TOokjH0/jtk6
	B5NPDTaguyl9F1DIuduWqVaMt7PzxuBbjr5fKN1asilfmqPnFF+ko5s+g6iNscLyB6VMmCzhdTQsO
	uSK1m+0cfQkyBoE4QZvdnvHZJPiUZoEwLCFzGFOp1Mdc68KC+ywlel/z5iC8JpEyOPqSegCuvqoxy
	4rv+LFtWEy/5/kLCQiM1f7R1pCFf99rMz/yLLHW0M7lAKp68cNNiN9ICLU7z2ubi8aEstzUQfrWXr
	pULDzLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7YQ-0000000EfoX-0wdv;
	Fri, 14 Mar 2025 16:06:34 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7TO-0000000EevS-2WMP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:01:23 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZDpxw2lf2zlxdd0;
	Fri, 14 Mar 2025 16:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1741968065; x=1744560066; bh=rXJyhLZM0wQnuMA6BY86fx7l
	1XvsG57/1opLs9TF2k0=; b=aEo7PzKDFvqEu1SpnvxvHFFD23HwXN7o7B14pn+T
	nkwZ6O9nOQH4aWdeR8HCx33d5yIF/mdttl6f8EPzQkHK89SXd4Aho16S0ZythcsP
	cA55cJMCbIm1djaeOSyu/7qaO7aeA1833OZRGaX9DadZ5HxBo1TI1cr9soH9bfHD
	wnaUbzJ0XHfIC70bsVsj8EiPqpvZcUoYWhej0mi5Gfl2aT+H6gq9VNVScFj+5d+n
	lzoAfEyyK0aWgBiIJ0MXXoOJ/s9zttde3/k41PbTePU2bK2JJoKHnHnf5CLeSXOU
	60V4UHspkVUPt/ftllQT+ZYtSTbT+s52m5FjnGxjdmKcPw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id DP3PM_usb6m4; Fri, 14 Mar 2025 16:01:05 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZDpxW0567zlfdj2;
	Fri, 14 Mar 2025 16:00:46 +0000 (UTC)
Message-ID: <0d7a8cad-adfc-4cac-bcc6-65d1f9c86b43@acm.org>
Date: Fri, 14 Mar 2025 09:00:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add dma-coherent for gs101 UFS dt node
To: Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, stable@vger.kernel.org
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_090122_705791_F4A4B78F 
X-CRM114-Status: UNSURE (   9.42  )
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

On 3/14/25 8:38 AM, Peter Griffin wrote:
> ufs-exynos driver enables the shareability option for gs101 which
> means the descriptors need to be allocated as cacheable.

Shouldn't that code be modified such that the shareability option is
only set if the dma-coherent property is present in the device tree?

Thanks,

Bart.

