Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CE5E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 17:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2xxKVmqo/G9RIHRWeTC2HYdGopJIE+Mth9Uo0KlJd4=; b=GJx9yqgzwfzQhesdqyyX9tIuHC
	5+oOY5db/cc8Xc2/MdLdUTzmmv7grCFRjFjs7MiqANtJdbwR64GYlTEHskHBn15bQS9/jR+Z28cvN
	XhrL1rJZm8HqFit9SLmWe6fBEP+WjwYjuyKlWuOWC5rNzimYUjyeJq8PXPfx318S4/h7g/p0Vlacw
	dejhejexP0dGdGafoSK/qRR+YNwVOnXgWo8wG4cgEQpQRjKXN2/X9Dudx4WWaVVb0FKBYpb26ZWzm
	Ihrf5oGxsuen0YhD7qyC60aXUH8tQTw6Be9O/Ys08oiVY+y4Ft7zJtzs5iV+aoSrtJJ/FARt5HJ4z
	tTtJ6laQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslB2-0000000A9fy-0a63;
	Wed, 18 Feb 2026 17:17:28 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslAy-0000000A9bz-0JVU;
	Wed, 18 Feb 2026 17:17:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771435028; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hi5kGH6lyRdefVCwuBY9IIWF3vRopGJ8dV4E5SNT06hNIRk/kTJTW/h/0TOaEO+XIiLGlbH5ezNwAIpoqUOJj+jexBAXl0VYR869ZXtBzFAWpjBPFRivz3tMbcrthvHdTZkZI0PmMCjkN9MtHHivG2VZdCpR92BWcYAXwET02e0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771435028; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H2xxKVmqo/G9RIHRWeTC2HYdGopJIE+Mth9Uo0KlJd4=; 
	b=gHQSfD74rF1+ApPqyaT6nYIIeC0UO7PVxocbaxzW1QRqUSrvAF0jdSliGN9F6Bl7rkH54Ar6Nnly3oFCyIwdDCgqoNBqcgF3Q7inYDXcI5MJ6DmDQOWiTP4FcYJmoF6ppfRuElMzqiSunzFyCLy8PmvgtsAI2P/o6ZpSIBnJo5E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771435028;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=H2xxKVmqo/G9RIHRWeTC2HYdGopJIE+Mth9Uo0KlJd4=;
	b=UnJCmaEQFt5FpIqdLUI9xhfIfn4rUuheKM2nLAAz5YcEyAhgA2qx32H6kGkl6CG0
	QStucyzTOtBqDfcganCPT9F6CJtrX8VAQzu3tZqscRCBRiJ9vFKuvd0JRMIJn+b1pPo
	gtkDX47ldxCghBDUH/p7utuSAVlKgL8Z+UUeOLf8=
Received: by mx.zohomail.com with SMTPS id 1771435025979786.7325301917416;
	Wed, 18 Feb 2026 09:17:05 -0800 (PST)
Message-ID: <86644ac4-6ffd-48c6-a79d-8e8144f18e2e@collabora.com>
Date: Wed, 18 Feb 2026 12:17:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
To: Mark Brown <broonie@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
 <DGI2YVYBECUM.3O0UN9VMKF7FJ@bootlin.com>
 <34f61d25-607c-4967-bc67-3c7517c7fe14@collabora.com>
 <DGI8RSUWQ7W8.MDY7YGXPA5LX@bootlin.com>
 <e1cea076-fb1e-475e-b6a5-383370a69722@sirena.org.uk>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <e1cea076-fb1e-475e-b6a5-383370a69722@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_091724_186994_A1D4880F 
X-CRM114-Status: GOOD (  10.16  )
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

Hi Mark,

On 2/18/26 12:10, Mark Brown wrote:
> On Wed, Feb 18, 2026 at 05:51:51PM +0100, Luca Ceresoli wrote:
>> On Wed Feb 18, 2026 at 5:01 PM CET, Detlev Casanova wrote:
>> +		if (!mclk_rate)
>> +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
>> With this, and DEFAULT_MCLK_FS defined to 256, arecord is working again.
> I did have the revert queued, but a fix would be even better if the
> patch could be sent?

A fix will follow a bit later today, then.

Detlev.


