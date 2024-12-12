Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2928BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QbSLomodtXNKB8cDOH/2MSoJ6Cktb0r4jHRLsWzOts=; b=oaezvEwWnP1mFkR6/MVLVoHSUb
	GB0IXaguIRVhXgv04HXoknjgGYDOjDAaaUMaIOpsaaU3oRYyR2MNsZRfCtskRewj+wnxmrxJpGGRr
	2jZK37QcBtPbOuraY8XxOdpZ5bKzKP5HvDWjGcClTbrdGHvzqN8RiOrVz3SRdSAdgliGB77W90rQu
	Sh3ylI11cV2IsZoq4WNmG+ZPQ7DujDmo6GGtRrtjaAb+6niSx99QdsgYPbmdjPLiqHiU8Sm/2C3HG
	hhiG6S8kPda2gJsK4VN/S1VXiCPJbKojt5NTpmtHXnDL1COSHJmEcBCjC02Ql72EI15RiyiksU//d
	5DSn8WsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhRC-00000000CCX-2HNw;
	Thu, 12 Dec 2024 11:32:58 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhPy-00000000Bq0-1ZJk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 11:31:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9096310408F81;
	Thu, 12 Dec 2024 12:31:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734003099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QbSLomodtXNKB8cDOH/2MSoJ6Cktb0r4jHRLsWzOts=;
	b=SFjtowlVpmvGKND9khoyTSnNS8n4mbpVDH45y4JsiKx3cudr+nM8ZVRGAoNia11+fzj/SL
	HJ0oEjXlF410ZaD2+p/HKBZRhp9ep1cMUA4TpDhjd5AjcvJu9hlZIb/9w7LpXSqq54opKe
	zKEdbU0wjqvr/OQvfFZiwQBSp+4nxp6/C3WEh+ETV0ZljfkxNhDvc/6YTB9qXmsS27HoFW
	onS68TeKgtDsDrH8AhAwUbB4Hb9nJnXW8kz97ep+y2wwEBeQMLpSVoX7wCXF/Ja3uzFYyn
	hTp+IdA0w8uVnxN4SVn2cxheRxA6NwilmdH5PMLcLbMf1krbXfw4JdsFThLI/A==
Message-ID: <51671397-3bf4-40a9-99dc-262517634109@denx.de>
Date: Thu, 12 Dec 2024 12:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: stm32_iwdg: fix error message during driver
 probe
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-watchdog@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
 <20241212102050.374501-1-clement.legoffic@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241212102050.374501-1-clement.legoffic@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_033142_558430_79E0C510 
X-CRM114-Status: UNSURE (   9.96  )
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

On 12/12/24 11:20 AM, Clément Le Goffic wrote:
> The commit 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> introduces the support for the pre-timeout interrupt.
> 
> The support for this interrupt is optional but the driver uses the
> platform_get_irq() wich produces an error message during the driver
> probe if we don't have any `interrupts` property in the DT.
> 
> Use the platform_get_irq_optional() API to get rid of the error message
> as this property is optional.
> 
> Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Marek Vasut <marex@denx.de>

