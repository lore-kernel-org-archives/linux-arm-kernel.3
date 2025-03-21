Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1099EC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 20:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ulsbme4hNQzYTq8vlOulaN2Y8LowM5FPAQmz8elBPM=; b=Bzx6rho3BfRFz0EHRLAH6Ow5JM
	es80EuDMdFkAgr3mV8ctMjA9KJUqJNijT2HdZadg0gwuiBrYRl9sjrpkLisbfAGXQabz0fcPM5RWG
	xdE4dk9ev1d6w9B9lSCVft4g98EPad+92zRaHcnm++uFs173JoVYbAw3m9Q7gJsfhvgXUR5A/QE/Q
	SzryEMckad/JGzpMjibTBXpla+6zG70Z9iVhhmD8Wlv7zV7MrYx3XeV7aPH2azuuci2JfGA+5e7WP
	dYyRJnxZZ+Qg4EOE6ryKUce0fSTS9mH4DEL96w0c4MgCxyPGWHjior6XwSNrYzsZ0pjSZsbHFrYLM
	r+khQQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviyw-0000000GAIE-3uEG;
	Fri, 21 Mar 2025 20:28:42 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tviZQ-0000000G6px-0zxI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 20:02:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A42E101E8FE7;
	Fri, 21 Mar 2025 21:02:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587336; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3Ulsbme4hNQzYTq8vlOulaN2Y8LowM5FPAQmz8elBPM=;
	b=VDxZ2EQ/5tg99PzI7sO7Iev5h1/wFCQ+DuZIPurcNhRu42cjUBDXfEBThUs7hHKYmEHyVb
	j9OYINwC6QB3Sd1o1XsGYvtnGKqSXJpNCTVm2g7uEiYxd112uSCJ8xvB29ci2Zh3RX/euB
	YddxYDnEYqWs9UsY0f9AWgBniVPLPyf4a32wbwjAvNiy73gpUA51StDBQRVb7BS5OiYfvg
	3hXbQJ3zduLUkKjTAbwn9pjp8jobnNBp1cK/kWQYCtY8Vvx46VeoZDzvVv2eXelpVASJI4
	5UnSh2YmrAM3yZ+T/+LNggwYMMjh+8oBMiFHZ/pUqesF43NhZK3OjJJIW4m7wQ==
Message-ID: <d19fa0b9-b07b-46cf-aa3f-3c2e65fecd67@denx.de>
Date: Fri, 21 Mar 2025 20:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-7-marex@denx.de>
 <Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
 <fa88c1c1-89ba-4a10-bd57-0819d7740c0a@denx.de>
 <Z8Wb05rmGW0ORnJB@e110455-lin.cambridge.arm.com>
 <20250303133523.2c5153ed@collabora.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250303133523.2c5153ed@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_130220_428769_699E88D8 
X-CRM114-Status: GOOD (  15.82  )
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

On 3/3/25 1:35 PM, Boris Brezillon wrote:

Hi,

>> This looks like it has been part of a R50 release of the DDK, which is recent
>> enough to consider it up-to-date. The issues you're seeing with fast resume are
>> probably due to some integration issues or other quirks.
>>
>> Boris has the most recent experience with playing with fast resume, maybe
>> he can share some tips on where to add messages in Panthor to try to debug
>> your problem.
> 
> If you end up with fast_reset=true, that means the FW claims it entered
> a suspend state from which is can resume quickly (fast-reset), and in
> that case, we're only supposed to power on the L2 block at resume time
> AFAIK. If there's a component that can tell us more, it's probably the
> FW, unfortunately, it doesn't tell us much through the FW interface,
> especially if it's not booting properly. Do you hit this error [1]
> without this patch, and if you do, what's the status reported there?
> 
> [1]https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/gpu/drm/panthor/panthor_fw.c#L1051

Sorry for the late reply. I get the following, so I think the status is 
"fatal" ?

panthor 4d900000.gpu: [drm] clock rate = 1000000000
panthor 4d900000.gpu: EM: created perf domain
panthor 4d900000.gpu: [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 
status 0x1
panthor 4d900000.gpu: [drm] Features: L2:0x7110306 Tiler:0x809 Mem:0x1 
MMU:0x2830 AS:0xff
panthor 4d900000.gpu: [drm] shader_present=0x1 l2_present=0x1 
tiler_present=0x1
panthor 4d900000.gpu: [drm] Firmware protected mode entry not be 
supported, ignoring
panthor 4d900000.gpu: [drm] Firmware git sha: 
8e5cfcfec20cc8aff8509d37e72babc935d34a3b
panthor 4d900000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0 
Instrumentation features 0x71
[drm] Initialized panthor 1.3.0 for 4d900000.gpu on minor 0
panthor 4d900000.gpu: [drm] *ERROR* Failed to boot MCU (status=fatal)
panthor 4d900000.gpu: [drm] *ERROR* FW fast reset failed
panthor 4d900000.gpu: [drm] *ERROR* Fast reset failed, trying a slow reset
panthor 4d900000.gpu: [drm] *ERROR* Failed to boot MCU (status=fatal)
panthor 4d900000.gpu: [drm] *ERROR* FW slow reset failed

