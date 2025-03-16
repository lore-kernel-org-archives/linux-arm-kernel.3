Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aGDzIIB1SDMlvmmrHr6tMJYPRSKx1nQtrENem7E1/I=; b=eW8W6lVgc6N4M6INr4Q4WJ2dtr
	mJJfBEO60O4TPMu9Qn+lquXMYFfcnX1ymw6SO6bipYVP6DMe+9Zn5B7pWUDg6Nf39d6EphZzkeQD4
	cEIlUN89kzn6vMYSc/KOcLFYCe3uGk4SXQ5XjG1CJ4AEeVELbNfwU8VWnovsVXSXHbgOKgyzidJhO
	LigF7vqpYEttqxVAMHnJqyf+FYHfh3gTrexbpZB1sBJBXOV6xMN9GkShFkWr5HiF+RX0CMR6WSES7
	AQJPagwaJ5yArMNP0B9Cft3vKR6UBuaIxdViD021XHmyqxj3Qd+Zp1AHlJty2q82hyxOyE/f86+Ck
	pKfKjO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttpBK-00000000HG3-2Ozp;
	Sun, 16 Mar 2025 14:41:38 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttp9d-00000000HBt-2Sj0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 14:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1742135987; bh=U24OhOAH6S/GRZS+90t754J6q5L5H+DV2q1WOFlNH+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KM0C25Ro+SWthMKvXdxMr6g1TRsO2C1SyQ0JpgCggXeI3LJeEEEzEwEebtXPWOsXJ
	 uOILUUG1ZdFyjlKd+16ZtELgpcDtfPONXxIX5eXrPvFGrZP8YeZTmYc7bzqrwmr9zH
	 lySNCkhzj6Lcmykraen3X97c8xmx1/teZNMEvzaxUUAkaHaPOrWc8WmmcSWZuS60F3
	 p4hT534le2Gyi6TDsSIcW/fsltcxWqRggWq3NLEUnYJtxFaKJigp9IIujamrQRHXrn
	 SXbknilmvKz9p7NVNS0WWfJh7SIvIFzsBqWa2hPl3Lr0T7IhHFTiKoSCysJV4U6bPt
	 P/tCCAqphJpaw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id BFB8C3A92E8;
	Sun, 16 Mar 2025 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1742135987; bh=U24OhOAH6S/GRZS+90t754J6q5L5H+DV2q1WOFlNH+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KM0C25Ro+SWthMKvXdxMr6g1TRsO2C1SyQ0JpgCggXeI3LJeEEEzEwEebtXPWOsXJ
	 uOILUUG1ZdFyjlKd+16ZtELgpcDtfPONXxIX5eXrPvFGrZP8YeZTmYc7bzqrwmr9zH
	 lySNCkhzj6Lcmykraen3X97c8xmx1/teZNMEvzaxUUAkaHaPOrWc8WmmcSWZuS60F3
	 p4hT534le2Gyi6TDsSIcW/fsltcxWqRggWq3NLEUnYJtxFaKJigp9IIujamrQRHXrn
	 SXbknilmvKz9p7NVNS0WWfJh7SIvIFzsBqWa2hPl3Lr0T7IhHFTiKoSCysJV4U6bPt
	 P/tCCAqphJpaw==
Received: from [192.168.0.53] (89-109-51-30.dynamic.mts-nn.ru [89.109.51.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 5C78839AE8A;
	Sun, 16 Mar 2025 14:39:47 +0000 (UTC)
Message-ID: <0f6e358a-c723-400c-a619-b2672a893b60@mleia.com>
Date: Sun, 16 Mar 2025 16:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: lpc18xx_eeprom: Convert to platform remove
 callback returning void
Content-Language: ru-RU
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <a7ae0d780ac580ebfed59d197ae1e6486c74ed54.1709886922.git.u.kleine-koenig@pengutronix.de>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <a7ae0d780ac580ebfed59d197ae1e6486c74ed54.1709886922.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250316_143947_802041_B03B36BB 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20250316_143947_802041_B03B36BB': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_143947_802041_B03B36BB 
X-CRM114-Status: GOOD (  13.06  )
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

On 3/8/24 10:51, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

Thank you for the change!

--
Best wishes,
Vladimir

