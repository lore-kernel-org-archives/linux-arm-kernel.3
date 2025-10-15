Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191CCCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHykXUHzy3P15VrWtRxCqfqVXwzZ2Ylga+RWIrK7dZE=; b=EYKdcdhE3wE8CDmNwVs5slP4e4
	9oTOkRO6MrTuvvBKcTsHRboZMxwWX/93Zuy05yCLUTmWlYXoUw+2qsxbfe6Mcr2ILQuFmpuu2OCHX
	jAG6ueUonojPDzOVQGQ+IbFtY1d39wYuXUnr67Tt08ptxprxd42EXMqS80W4NAFmvT5HYyPKVt4yF
	X24xVj4eKwi+ZMBkpDCGbC3XChrdGbP28qyDA+mmQ6J6RWNMUditsg23KMNgOWSV++wCpfhD2GEjX
	MVLoAkY21JEOBjgz33SPYFjeKrPicmzXW3UfCnMvLA1MbRu/fU3mLyYDL0b4D8uSPm7QIUgRC29y3
	B/3RfstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wL3-00000000omb-3075;
	Wed, 15 Oct 2025 07:54:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wKy-00000000ogD-1z50
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760514858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHykXUHzy3P15VrWtRxCqfqVXwzZ2Ylga+RWIrK7dZE=;
	b=R8esv9iU1h1wzgeFAPhVFp2CxA36ktpBIybmMOhGTF54dMWcDTb1g4p6DZ/bA3zbTKLwD7
	SpQRm/c9q7g820Gu4YviTXIOuAtL2wQSZ8wF2i/Aee8xoRvTken0HlAIXQXk2qn8ht/yCP
	zuSd64T/FV4ingKSxgYIXYd+WZza88A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-GGT2LeOuMXSLXYlOQcIo6A-1; Wed, 15 Oct 2025 03:52:44 -0400
X-MC-Unique: GGT2LeOuMXSLXYlOQcIo6A-1
X-Mimecast-MFC-AGG-ID: GGT2LeOuMXSLXYlOQcIo6A_1760514763
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e36686ca1so56133855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 00:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760514763; x=1761119563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHykXUHzy3P15VrWtRxCqfqVXwzZ2Ylga+RWIrK7dZE=;
        b=UGWw7iPHnDAL+YW+f9KPtOSrhx4mATwpAaHIBykmQDFu6A8F28gVW6snU+RpVQRLgO
         3hNEmMIlagfxE3ILRu7JR7uxfYkH527lZ1GGZxYQPDGc0sADjEf2MZ4dLnfPYAKHLxZm
         7Oz1309XBawUTesakBlOJThbIAB8h6n0u6C+Z1cB21Bh121tu7AggOjzomelOBPUX3hl
         cBzjLqgu+abz/4HDZ2PqH00CMe9rGz5oWIRGlQqhm0w81VafqlRgudYajiUCKhaPBA/M
         ilN/R6oGoFsNaA/NVsfSrNA9Dc1l2O4SvzIcIuQttlppgNysd7Yv93v2/kdOmawFpKwf
         7ekA==
X-Forwarded-Encrypted: i=1; AJvYcCVoQttYaAfKxhiueCLLMV8PnvQtwnuPou9uPHRwjaEu8lKwY6hmoT1DE7tnpaV4m7qTm2ZYTowJVPBGq4sh1TG7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Vzi8cLPF9jBHzbywNb1EIk9++hx1p1ZDkEIblIag/fGhViIV
	SH9fS8IgZMVRcXCUm9daFEi3WMfRrD2UjaogltPKdcX519P8kFb6lWGRvJpPd8im/G6CHQDcysi
	EbrJx/CLwn8MtgbwT1In1NgB/iTED9PqT+0+1zJ0gwJB5JYINfC2F8tK5zhOHstDdTT8iYFyf1+
	QI
X-Gm-Gg: ASbGncuuR6XORGQ4wWSBwdxuGrEm8R30OQlrXTCDeRSJDWkr2IbpoDzM6OnWekxNCou
	B+qla133L2xPKryO6KdFrihKbpT1r0oX5LDNHUlP6Mja8Z/W23PRYMvZCQ3CP1+N1PJl1wlP6ga
	KbSl/AZgpuxFbKvULO6yP8H+l/Q3uahUX/UwuAXoz9FxqxfHKDHHyMOKjrRmPncZMikEgM4Oopd
	qtOEeQNu3wbCMtT7Sdm6FjSwRI7u1/y9ut6vEDdc8YlCCk0SmwIYNVF9PA7l3g8Rc37Sbin+TmR
	YCWVL/efzva7GwM0h7DTW305JODYzltMX3O2M3x6Glgd6zevO8cnRlCo7H23PNN+whJrnxql6Xh
	TQ0dR
X-Received: by 2002:a05:600c:34cc:b0:46e:59dd:1b4d with SMTP id 5b1f17b1804b1-46fa9aa2076mr211303465e9.16.1760514763144;
        Wed, 15 Oct 2025 00:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW2ZDBPJxUfYCX0H6nLEKOLye2i61674dJQY/ZLYYwFVcv5Uohdp1HeQRReQYkGVWqF+Eh1g==
X-Received: by 2002:a05:600c:34cc:b0:46e:59dd:1b4d with SMTP id 5b1f17b1804b1-46fa9aa2076mr211303305e9.16.1760514762767;
        Wed, 15 Oct 2025 00:52:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47106fc97adsm2155395e9.9.2025.10.15.00.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 00:52:42 -0700 (PDT)
Message-ID: <3d07c6ba-02d6-4d3f-8684-65a41b128539@redhat.com>
Date: Wed, 15 Oct 2025 09:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/log: Do not hold lock across drm_client_release()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x9LxDdchvztZMBeKV-Gnf0qBN_yt5LXvepdbz6g9YZs_1760514763
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005420_579242_6C82E303 
X-CRM114-Status: GOOD (  16.61  )
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
> When calling drm_client_release(), the client is already quiescent.
> Internal locks should therefore be dropped before the caller releases
> the client.
> 
> In the case of the DRM log, concurrency originates from the console or
> from client events. The console has been unregistered in the previous
> line. The caller of the unregister callback, drm_log_client_unregister(),
> holds clientlist_mutex from struct drm_device to protect against concurrent
> client events. It is therefore safe to release the client without holding
> locks.

Thanks, I agree, it should be safe to move drm_client_release() after 
the lock.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index d239f1e3c456..116e0ef9ae5d 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -302,8 +302,8 @@ static void drm_log_client_unregister(struct drm_client_dev *client)
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
> -	drm_client_release(client);
>   	mutex_unlock(&dlog->lock);
> +	drm_client_release(client);
>   	kfree(dlog);
>   	drm_dbg(dev, "Unregistered with drm log\n");
>   }


