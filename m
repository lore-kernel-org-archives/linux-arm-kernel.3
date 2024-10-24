Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BEBD2E03E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48CwJjAsdSou3wcs8Fa8VWjZbLOJu1DQ4ByQPapzYWo=; b=kB0ULTraH3PHMiU8uoUAyDrJNI
	/V1h9QlMo4YjT1wmmMJPffLD+xnetu7GSahdNFIOR2oNgajq3Pm1rQVJEgTNM46j+1jj6yL/0EZId
	/mZoxGByfUZLdsKLXKXOh8oWyQ7jOjBpROiUlDV/Yj4BzTajo44GGzXwJ9yGghvRIFvPE4VBD0fq2
	S1xVtMM5HFF6zzsduhCDh36oudIle8m7AeCzUt0HSY7J9YGjw+9rPOBP6YzXak87HzZq9JWEky15/
	/4+tVY4E7RmMtpN36ZenfMztq7NMWVc8j16SAF3NNAFImucxhYFQKOhXdCI4MAhmKlzDVU4GlS3DE
	WVQ8BYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3voB-00000000BSH-2oEP;
	Thu, 24 Oct 2024 11:15:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3veO-000000009v3-0YR4;
	Thu, 24 Oct 2024 11:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729767905;
	bh=EGRtjEC14XyE9weot/wRlXEg+l6X9AYHwtSTqY4Qwps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IXimetdm3fzWVQ4d8anSVCWgRQ8saj0/NDig3tq4roUOJY33o+H8erj0iWOOkEPgQ
	 1YX49ynPnbH8jKGNFCyxvwbfwdyv0L2KSmSouc6iY83bVvvr4oFlJ/3AxJ7ahJhZNY
	 BMPDIu7W9Py1CtAXLEQXYeRUe85BmEQFgK5vl7pZbRV5PrdaHaMMITEdECK5ylOXMW
	 /FUgShUJCgjrKx8ax5tQOKf4vYbvW/NHdFEliGEGUoR9wy3tbQfYbafhviyyo4p0H8
	 wNLx5l0rML7FuK9WXZqZ7GycDCmOceKc4Vb1NY+4lPTQBM4chBcokUuBvFQuzwinbZ
	 aRcwu59AOQA3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 848A317E1524;
	Thu, 24 Oct 2024 13:05:05 +0200 (CEST)
Message-ID: <f0386089-6a47-4751-8581-b6658c1535b9@collabora.com>
Date: Thu, 24 Oct 2024 13:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mailbox: add support for bottom half received data
To: "Karl.Li" <karl.li@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chungying Lu <chungying.lu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241024092608.431581-1-karl.li@mediatek.com>
 <20241024092608.431581-3-karl.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241024092608.431581-3-karl.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_040508_349973_B16AEB09 
X-CRM114-Status: GOOD (  10.14  )
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

Il 24/10/24 11:25, Karl.Li ha scritto:
> From: Karl Li <karl.li@mediatek.com>
> 
> Within the MediaTek APU subsystem, a message passing mechanism
> is constructed on top of the mailbox system.
> 
> The mailbox only has limited space for each message. The MTK APU firmware
> expects the message header from the mailbox, while the message body
> is passed through some fixed shared memory.
> 
> The mailbox interrupt also serves as a mutex for the shared memory.
> Thus the interrupt may only be cleared after the message is handled.
> Add a new sleepable rx callback for mailbox clients for cases
> where handling the incoming data needs to sleep.
> 
> Signed-off-by: Karl Li <karl.li@mediatek.com>

As said in the review of the ADSP MBOX driver, I really don't think that you need
an extra callback.

Regards,
Angelo


