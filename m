Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC0ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=; b=IdwmBy0tzazup9ttJpoMU6ozNY
	I+EpWeApQb6D0aR7EsKoe1aFh+3mVuGmJb2u8pEdCUQbMYlOF63K5B7hAAX2W8iZAKSL3NqThItnY
	dnjef7kNSEUcAoQqrk3AdaGsfmenyG0Kdsebov8o63sGrCII8LMwbX3FZ8tNxDL6jHPtd+ipCyVul
	k3ke+sj7rj+Gu2wXkBLnPUWp2BR7x/qiXnEqba1xJU9Ek0n7bGFMDCxJv7JoVVK6nmlz+BCqCj/uc
	whWbd4IlufNEfDhHHs80JVfro5K5px8XA3cDjmrZ9PTRF3LuelL6uSNBzfjFYbCflyP7JApbrSoRW
	ErzmmLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wkg-00000000t8T-0fXO;
	Wed, 15 Oct 2025 08:20:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wkc-00000000t7A-1LPd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760516449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=;
	b=JOfLyAd5BIsXGsx9Oz7hu9boXLH2G0GAoB0pGg+5hMITbciLUmHJ/pwTqK7nKg5VLJ8CVz
	GN2unXteq7eMZjrO5FgTys+huHsyPcDK8tBtP21nKcN5v33oRKZnVBZKTTZlET/6ooe6Y0
	9HL6RXykMK5POxtcNcfVVI8x6vvLa1c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-Q-sWotI3PfCAHUP_Urk9pw-1; Wed, 15 Oct 2025 04:20:48 -0400
X-MC-Unique: Q-sWotI3PfCAHUP_Urk9pw-1
X-Mimecast-MFC-AGG-ID: Q-sWotI3PfCAHUP_Urk9pw_1760516447
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47105bfcf15so1611315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 01:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760516446; x=1761121246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=;
        b=uE+0Jnej+/u3QyoVV1COUvPxS1Oev19EDXHxmhjk6V3WRyAkrbg6WBHN2iC/aKmlla
         tATTQXuSyyxjsSLIqSLCD6taTFHjFmammZaRIXOqHXENHKKhP8eA4txTe+LccO3AZ5l6
         0qPFKzv9VKS4OGB8bOwY5iaIixw9rbfOtgtuAmhTV24dJb+gkS+YGT+kUhKlV3iW2Ig5
         29Ap8pegXoHEnoJvnPCFJcDeUPmjkiWn2uzmo/9KhJRLqBUnh4ZWvRjZxHcjeGeQpHFH
         EKwgFX9pCJ+f9a6hrnPKEAyKdKVzv/r+hqaBU0IO2xqZ+awQ/KFwVhn71b3VoMDWR7kl
         WD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMgl/XeBDV/RJGWfXJrIGPJ/o4J2vIMhncXFJvqUi/J6yHRFI/CUNBgkD4HiUErbmsXKU77axG2CuuQ9i/LtpR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1YIYiemGHHeGJKCrqZamj1Pjl0DBeT8/rro+G3Ruz6z9ugxQO
	FWeWaHtQdk1HRQ230bCtMMcHaPqH6GKAJWTknMAcTIG6TNMCMri4qWmcJV02JywRSOzA4kCOXkH
	lmdphT/LpHuehZzPTm++m6hy2Upn8M1txFTLSM80POxw56qiqPuc9Imaumg/K51HdAUjBA7i3vh
	MP4rDRsfkidNY=
X-Gm-Gg: ASbGncsPQa4EDOBzI6Rz0KSUvt/qxTHdik6nknGdxTk8Wax05P2YsOv983vU1142qp/
	BwwdEvW3UNPebIrBCFyaLuavdqRE6TNbzrjunhCIeOGC1BSJEgSgc6O7+2iirXmreQ1uqYbRrsE
	ITi13H0Y91oPuyPSTu53CXSlU0aVjbepyP165roKcbExK5nTbvxzdDHGDzaQSosZ9DaNx4o+bC0
	fZ9DrJOGFQ7FzcHyBMFWDq6Q6vY3ylBdhedtHVl2GsYSWN0PTV27TkBILxuDsRh7SWJZfU4kO9W
	rnHtfGR8V55Nqn6gVTDylo3xIi9kSLBvz17y4bt4R68JnUCspgEVMkW+xvh9c42vp0tDmgVPspj
	M0GzX
X-Received: by 2002:a05:600d:41c4:b0:471:7a:791a with SMTP id 5b1f17b1804b1-471007a7a96mr9522805e9.7.1760516446520;
        Wed, 15 Oct 2025 01:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKG0piBaN7As1r+PD/K5QtUV2Z28HHZlEUD35iBfCWvoyf69YaDGLCaS5NwDRxAhyjJ4bu3g==
X-Received: by 2002:a05:600d:41c4:b0:471:7a:791a with SMTP id 5b1f17b1804b1-471007a7a96mr9522475e9.7.1760516446097;
        Wed, 15 Oct 2025 01:20:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9absm327503135e9.2.2025.10.15.01.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:20:45 -0700 (PDT)
Message-ID: <c85d528c-6787-4023-8883-3519b7498627@redhat.com>
Date: Wed, 15 Oct 2025 10:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/client: Do not free client memory by default
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SkH3ki8I_cX_xuAFDBKxa-qFu7tx_WYdaZ9MBqW8ePs_1760516447
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_012050_429495_8EE99C5B 
X-CRM114-Status: GOOD (  17.77  )
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

On 09/10/2025 15:16, Thomas Zimmermann wrote:
> Make no assumption on the allocation of the client's memory. For
> example, amdgpu stores a client within another data structures,
> where it cannot be freed by itself.
> 
> The correct place to free the client's memory is the client's free
> callback. All existing clients implement this.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_client_event.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
> index c83196ad8b59..f36fe0392ce6 100644
> --- a/drivers/gpu/drm/drm_client_event.c
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -39,12 +39,13 @@ void drm_client_dev_unregister(struct drm_device *dev)
>   	mutex_lock(&dev->clientlist_mutex);
>   	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
>   		list_del(&client->list);
> -		if (client->funcs && client->funcs->unregister) {
> +		/*
> +		 * Unregistering consumes and frees the client.
> +		 */
> +		if (client->funcs && client->funcs->unregister)
>   			client->funcs->unregister(client);
> -		} else {
> +		else
>   			drm_client_release(client);
> -			kfree(client);
> -		}
>   	}
>   	mutex_unlock(&dev->clientlist_mutex);
>   }


