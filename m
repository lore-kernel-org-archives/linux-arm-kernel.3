Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACCECCD190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=; b=XHcoYDqRL2tzOUQU5fJ6dCJTLS
	14N2VLwo6cdFSC9jU78tZtdqeGYB9CG0XK14XG1ofYmQRP2lRZuuiWEB1hQo1i9upsykOZTjUTTTT
	K5jDRlBA8swVzBys+cuqMBEsdKaC/rRMPOvqJCStIblsLRZZpGP0TSacH/UPsVKOoPtuapYX93tnd
	IPvElZ/qoEB1lIqUV+ebNX5hCnFoNqb+MXxdd31sudxFLy6ULIkCvQWr13u/1aP3BVmu6NGF4H7U9
	jWUp82OnXBqX8tiaAhEpBjy6bxVlBJTbinR/+T4Yylkxz4AiU79l/RnVJ4UebRXqW4LDssNFntNjB
	ODTUuxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wLf-00000000pTY-1kOG;
	Wed, 15 Oct 2025 07:55:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wLd-00000000pQm-2x9M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760514900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
	b=NzM5BtOu3qmEnGdS7HT7FCh58w2etqg6Ofu1cTOqcQAgpLq6nx9dEiGWiHA8b7ZBf17bAR
	Jhi4mFTdxBwG2f8xsHz0kDnc0ed/+KVTb0RWYj2PD4SfC7A95R+ND1suNdN9/w69rKIXGH
	TpJ7Mv3kplyPrHuZI7dU75vCgnxGBtg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-xNe3cA87NbmAnqPN8TliRw-1; Wed, 15 Oct 2025 03:53:20 -0400
X-MC-Unique: xNe3cA87NbmAnqPN8TliRw-1
X-Mimecast-MFC-AGG-ID: xNe3cA87NbmAnqPN8TliRw_1760514799
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47105bfcf15so1432695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 00:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760514799; x=1761119599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
        b=D0yP+ikwkRDX5xpDseYNSmTT1quYadq5wFRGdCAGBco30ihPi5VBQ36O1lAifX1qge
         ORyQ3PnueJyg1oyCRhoU5MVa9Ej2aZ8buzMWR4chQYb1mi2FyffiCupVlJna9qHbJuni
         TNi6iV0VuX4vfBvTWLCWOuqEMryaSqFrr781hlbutDGEuGjBn2Jjxd4XnioRzFFszqFO
         QyW8LJWdHPBPT+SRh79dMc3LTQSwfGosVmMpgZp2WeyxDq56GYHMsJoA8M4kSQETzjon
         hMldk0SnURqGah1Qx5xYd/XW8vuK29Qm1LjX3RIlEn8XXaY4avECNMA+pmS+AclzI5I7
         Y1sw==
X-Forwarded-Encrypted: i=1; AJvYcCXRK8PoZZmRLdqRggmPUHttwwd/V/nFtkiDulhiUTr+0oqo0jcum2KhDxcbHciky0TzkGzrnf1cAkrEshlAf68w@lists.infradead.org
X-Gm-Message-State: AOJu0YzH7qszme5e+7LLGbIiE4qkK52EGzbtBzfG455Ck49j2+JQBte2
	JGPWkwg+ByWLJTnOKftS3UDjSgJyNnSgo64NcWYSoAnOiIHjHdju2nQZ4DFu6BoQkg/CShTT2Yg
	tQr00zinXVEHVSwD71Fv6iBH4+hBap/uslV8S3S7AsX4ep7Gv0kpMV5f2Jd1oaL1CptU17eok/E
	am
X-Gm-Gg: ASbGncsjPze+DQoIU3jyW2mzIYalzsLxGdMfa1l6tdIHRvQ/7XkpzauLoTT+F0EEgfA
	pSowgVJWlH0oCXM508N7Pc9qQXMdaoQD9N+3hvpVFJvmz28Z9jSd8ERvNV6LC91o9KUNtO+Q92m
	qCVvCR2dFj2MeawxM83m45GlfY2vs9pfn0WLhGA0dN9hefnQphOQDUK/5VsEzoFQWq1WTKTxETA
	so2dKWsAykMRZeLycATFN+lz+14lgPbcqAE7W4JR5SyiTyQO+Oi/FMjdedvcihFE/v0bTfIAF4K
	JvnizoJhnUgdyAG2R/Bdsw2py24HJE4nCJGPeiNtzwusn24JLtoZgkX/2/5skQkfEaENaPbG06v
	MisFP
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46fa9b11746mr202661405e9.36.1760514799493;
        Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZf7d9TK63edfjPsh4LrX74Y6wRlhtOgKLsjlyk6mKGtY9U4BbM1bQ2mcLbjosAJUslcGWjg==
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-46fa9b11746mr202661265e9.36.1760514799084;
        Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c21805sm14875785e9.10.2025.10.15.00.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:53:18 -0700 (PDT)
Message-ID: <c256b8d9-ec9e-4841-9136-1198ad2d590a@redhat.com>
Date: Wed, 15 Oct 2025 09:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/log: Add free callback
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lHYdmIAkupPxkxYwhJzafncvl4-XuntqJ3BHd-nCRLc_1760514799
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005501_825499_586B7314 
X-CRM114-Status: GOOD (  17.94  )
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
> Free the client memory in the client free callback. Also move the
> debugging output into the free callback: drm_client_release() puts
> the reference on the DRM device, so pointers to the device should
> be considered dangling afterwards.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 116e0ef9ae5d..470df4148e96 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -293,19 +293,26 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
>   	}
>   }
>   
> -static void drm_log_client_unregister(struct drm_client_dev *client)
> +static void drm_log_client_free(struct drm_client_dev *client)
>   {
>   	struct drm_log *dlog = client_to_drm_log(client);
>   	struct drm_device *dev = client->dev;
>   
> +	kfree(dlog);
> +
> +	drm_dbg(dev, "Unregistered with drm log\n");
> +}
> +
> +static void drm_log_client_unregister(struct drm_client_dev *client)
> +{
> +	struct drm_log *dlog = client_to_drm_log(client);
> +
>   	unregister_console(&dlog->con);
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
>   	mutex_unlock(&dlog->lock);
>   	drm_client_release(client);
> -	kfree(dlog);
> -	drm_dbg(dev, "Unregistered with drm log\n");
>   }
>   
>   static int drm_log_client_hotplug(struct drm_client_dev *client)
> @@ -339,6 +346,7 @@ static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lo
>   
>   static const struct drm_client_funcs drm_log_client_funcs = {
>   	.owner		= THIS_MODULE,
> +	.free		= drm_log_client_free,
>   	.unregister	= drm_log_client_unregister,
>   	.hotplug	= drm_log_client_hotplug,
>   	.suspend	= drm_log_client_suspend,


