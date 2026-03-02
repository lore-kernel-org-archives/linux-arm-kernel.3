Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDD4EB362C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 20:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1X4gJkwyUg1gOs6Pr7zwAYXH4kUMTQbImGf+aQ1BHI=; b=ZfM4i564/tpODP+vq9DJgooWuX
	HVQc1XPwslQoavyBZIwg05hhKsiCpUqx98mkdpsdwOD22RTJ91Cr4PjyiodaUnHDrWzS/e0s+o3vM
	SNjU0q+Jz7GF4AXaAPhXjQhpIAF+BsQyPl4VOFKCaTTZVUqAV+L5IjApyFmjAVCCiJXX9MSREKNY5
	kVfaMCeEQ91feiFi9ZgVDOetZyzrDLJCB4Fo7D1e+j0ViVNQfzOKswnEVbBklGQpurswjvsW+gZvk
	MUwXC6VTTR4+LvB+KC00keFCERg/lRzvKwHlciZ7jyHkCddF8DzmuWRUCL7mBpjb5w6Wp8arvIUGx
	yEiGslcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9dp-0000000Dmw2-2O3f;
	Mon, 02 Mar 2026 20:13:21 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx9dl-0000000Dmv9-0KaV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 20:13:19 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-12758ce1e8dso6299074c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 12:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772482396; x=1773087196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1X4gJkwyUg1gOs6Pr7zwAYXH4kUMTQbImGf+aQ1BHI=;
        b=aspHXXZO9Agabe0Y+26n7HBTyRtxjw1GLVgF4B7rWKo8pOmvr+NzKJH7JGkQ9SiAZh
         6tw70ceEDKi3ZoXR7gSHRZZCe6yebYYJRUUwHJDcrDKLoUve8wDvF1DDGmMQCpNedAIh
         IbvrvJiG+7B7MnEAvCUENphZh/4wYexpG5zOqyu5ra7uTAqXz2gCNCob3UxmVVUBgkQJ
         2UpyCQ+3iSluy1spMMC/U39OeGc1rJ7yN53V1H1RWEW2V2DjEblMSfV+Rq6YjrJ9Iuzv
         b5pgbIJPsxS3ZUav8f6UBzjaYQ/TzoIRQXfvyHy6gW9+EWURaQ5dO5queiADWp9dPHdq
         v8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772482396; x=1773087196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1X4gJkwyUg1gOs6Pr7zwAYXH4kUMTQbImGf+aQ1BHI=;
        b=wnu6ATSHe9qCCa5waUMsCI6Ub8ibZvewhav8Gu61HM/+FvD5pqIuyB8GEIonmoP4hu
         4PFn+f0nHXa0NXSbmeR7SfvHaD8+xqOseEPuZ+dchmHIHHz3qeGZbG5hB15SfNLFttRH
         XYq8mJopwD2N/gSM2c81OLVOPz9MbHAQ6rHbeBBnwSPjn5YbVDOJvAQqytQCORYwSj5W
         G3U+q1vcQ/pBGz7zsKodX5G6D4VuZRzVeXFG2sr4dqDXeupQkYgtiGeNAj2SVyA9nHXd
         SNd6XKaHo/GFQZXDzjzuruIHk+qjowWtZFU1Tv9IargntHpMyZdagw8Vm7VT4K/etXSC
         zvPA==
X-Forwarded-Encrypted: i=1; AJvYcCUw56RM/hCHXLe74q51amFr8eXw9Tk2f9bMdzTV8roND8bPYHQ+7zW//7TFwhIfOhjZXalH9hAaHReKvVly1qWc@lists.infradead.org
X-Gm-Message-State: AOJu0YwLDLE3ff0vt6MimNKKc7UIYn4I048nO2+QCw0L4ed+E27w780z
	vV+CUBmalpoORopBw5mnWXSdG1Uali5t+pYJnVteZ4r3jO3CBgtI8yDK
X-Gm-Gg: ATEYQzwZS1cZgVJ18TWh2kZZu/mXPpDVJD3uXM/Lj11n7KLoui7VSwbd6uKfgkp8vmb
	3SGaYAAg7JCrp566uZ53V7qlu9N5DM1k7m/NOf9F65TyzdxV2+On0j1OB8PwEOYYhyAgVj8dGPb
	bsuo+PHuFBfb4Jf448hYhPvXX/srvJngV8HnMn/4vFqYtlVbAokI9jEVYeHHOzMmSs/2BTw+8ib
	rOn1KMRLQCsFf53/jkmB6rnkocUUlrb/Kxw+vTVsaNtoMGdoCV7XgBhK2pxL2MILBq/nFZbvtpd
	r7abL+soSmLMjoa/0rAHUeN5b2eV2bMDrxdXvP+YYZV2a4qlAEDQ75tbED13xPmfYC2/QDPZWKS
	ZalXRdbUdj1u+hUUNCnmFI15OGD42QULi3LkaHXdFTfxOThf4WAXN8vEpatboKPubNVml0SYaGd
	WlAHJsulKgo6qROxdwav3gQVe2ml/sB2x3uZSOiwErZsncUhcuLg==
X-Received: by 2002:a05:7022:128f:b0:123:3bc6:1ffe with SMTP id a92af1059eb24-1278fccbe64mr5198425c88.15.1772482395640;
        Mon, 02 Mar 2026 12:13:15 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1279cbd1993sm6108046c88.2.2026.03.02.12.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 12:13:14 -0800 (PST)
Message-ID: <1f69a0c7-7e8b-4886-b269-87e754294a08@gmail.com>
Date: Mon, 2 Mar 2026 12:13:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: bcm2835_wdt: Switch to new sys-off handler API
To: Andrew Davis <afd@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-watchdog@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260302180853.224112-1-afd@ti.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260302180853.224112-1-afd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_121317_120357_ED18F101 
X-CRM114-Status: UNSURE (   8.29  )
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

On 3/2/26 10:08, Andrew Davis wrote:
> Kernel now supports chained power-off handlers. Use
> devm_register_sys_off_handler() that registers a power-off handler. Legacy
> pm_power_off() will be removed once all drivers and archs are converted to
> the new sys-off API.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

