Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC1CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 19:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luE9KNFBY2yc7R/r8kECD9v8u+QS5s1DIkupBbe0SSw=; b=2M5rDnF/5djUVd1DDL9NDVIDEB
	9dVIChq4W8uhBYooelb7COTUrv0xvXqR2y7v3pXnUpydg95Uuodb2Yj59oAcS6/DZidRKNDktD0ye
	MLj0eJ/Of56I6sxcsSpXws2DHPOMuesKaRX5vWQO/dVU3CiplkBMjqBKnkMiDhIwfe7lyLE0VOwu6
	3iweOhdJa9JzmzwhBTkrNqiICSevNRSK3lFxH9AzSs2KFLZyVDsMHKldAU9d73H/utjSY9mYOwS9J
	6SaQyjtW4rsXipLsZAun/SurqzxfVxzGsJGSZVOv50mAbszeKn+/tptbdEcLLPazgbxBdDh6gunxy
	LRqIyVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twnm1-0000000478u-3aWf;
	Mon, 24 Mar 2025 19:47:49 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twnAe-000000041lu-3thV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 19:09:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CA52102E64C5;
	Mon, 24 Mar 2025 20:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742843348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=luE9KNFBY2yc7R/r8kECD9v8u+QS5s1DIkupBbe0SSw=;
	b=EIVD1Puce9GrbbyT1REgTbYEiv/mzMu+ZRfY5ES/3/fMYFUQXKfknvvd1b5InJ9Eu6037N
	MlWSub3tdlXkUWWZLL9Ww86CskVGBYSTFXBLSe1OXl6bzdiTcQFBc9ryum/GelslPY4Kse
	qY7kNLYjJ0fN5NTayPBDktZKK2ue7mko3nk2nHIFYzYY5FK4BOin0JMko/LQVGjKW0VUfD
	uR4Mv3JRJLu+mS40KfEJTCn8t7CRLTN+zB8YIEoMqcWR7Li++KbCeLsBiEv2X6UyktIx1I
	pjoqE0y8H6y+qr/Z96/asN+t3K3T12cXKvs0DmYSgDpx027o+j00SAI1Rl65Jw==
Message-ID: <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
Date: Mon, 24 Mar 2025 20:05:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250324094333.7afb17a1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_120913_124575_9D8A585C 
X-CRM114-Status: GOOD (  14.15  )
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

On 3/24/25 9:43 AM, Boris Brezillon wrote:

[...]

>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>>   
>>   	panthor_devfreq_suspend(ptdev);
>>   
>> +	reset_control_assert(ptdev->resets);
> 
> Hm, that might be the cause of the fast reset issue (which is a fast
> resume more than a fast reset BTW): if you re-assert the reset line on
> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> up in a state where it needs a slow reset (all data sections reset to
> their initial state). Can you try to move the reset_control_[de]assert
> to the unplug/init functions?
The reset on the MX95 is not really a reset, it is clear-only 
set-never-again bit which goes only one way, the "unreset" way, so I 
don't think this has any impact. Also, I commented this out already and 
it made no difference. I will give the second part of our suggestion a 
try in the next few days though, and also try the updated downstream 
firmware blobs (sigh).

