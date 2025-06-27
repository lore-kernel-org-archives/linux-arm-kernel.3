Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D52C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNCLtd/5j3xpGlE8KxmjKTA6IB3ovsHWJ5xcxyIyoHI=; b=F5np7tCoVQG5yHuOiSVMqZd9g8
	BSACH1SRTqxWOxqA6xT1aSjqi2WAfn4pbHK8Ica/pl/B2hRISiMkXslIUlRK/uyEZJSqMGZkxzqKM
	+hfpylYcisl9c1boGTU+7dFhxlMVcQ59wJVKsfTUuD3SbFqyYMW57c31hXiEYo79dQS5yGUWb53QR
	HEtl8hA20XB4Gi73M1zc4ABe/L66Zi+DGJWEmtTnR23s3zRN511QChsN9sofwi3cac3m2hX+y/xlD
	UWBqoKgb7QvQ+GhYAs3tXcQAM4f54Dl7XvUEaGset+tYOI8OcuMPOU1zC4cCqeY/sAB2wpCkEBx7n
	DS3/BO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV85V-0000000Ed3y-3kUW;
	Fri, 27 Jun 2025 12:21:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7dX-0000000EYc0-2UW3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MNCLtd/5j3xpGlE8KxmjKTA6IB3ovsHWJ5xcxyIyoHI=;
	b=feZqPXdzh1xozJFyNBy/Tr4MBifSyxUsul5iHOXvA8KwbJwxDGUNqS/4yZtJ9SgzyMrFZJ
	O2Yv9fXXtvbszWEmwuCyQYLgFgXZSSoykplCQTDMVG5SIAoYmjzpGv26loazSdcy7RQGH8
	Kil1pQESPmxOxgPOXXwToAZpQ+Gmt30=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-K6GooeAzMHuRqTGozrWJnQ-1; Fri, 27 Jun 2025 07:52:53 -0400
X-MC-Unique: K6GooeAzMHuRqTGozrWJnQ-1
X-Mimecast-MFC-AGG-ID: K6GooeAzMHuRqTGozrWJnQ_1751025172
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450eaae2934so15190645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 04:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751025172; x=1751629972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNCLtd/5j3xpGlE8KxmjKTA6IB3ovsHWJ5xcxyIyoHI=;
        b=UrjzFgVFtDSyOfdvem8EFb98RTvMawO6qTNPkZP+hzX2blhD/s9rsHRY9e/g42gM5R
         7WYDzO8fr8QGiPZdOcszw4bTIMp7cpMq6oX59w5bBUS7Bd2mWe78i/lO5llzLqtMnp1t
         ZNUN/cKRKnSzWktteT9bpPhqd+02aiO3o41ZGsdez1b/0ihmhVN8z2xtkRyE3943BBK3
         /yAvT13nfoLmYtS19XfZu46jTIIfsO7j9Ht/ipEog8BSzDB8WTD/8nHZC8SniUJ2398B
         TdkHI42I3GSjeDn2wzzL1eAYg2K5i/2SEF4q6aPkW9Y+4vA0bQoNF/1wKYED0h/XsiQP
         nu8A==
X-Forwarded-Encrypted: i=1; AJvYcCUhnU3sE8jjusRAECvTP7zDR9P99eALD+ejQRENLAZsfN4W1kExano2sVcihnVABHpMCWZjg17kbu48nBedQCgW@lists.infradead.org
X-Gm-Message-State: AOJu0YxIPQfaLcHh+ztFC738Gy8eMRRJrXPlfcEo0BRsjKr1JXTuL0dH
	IMxQAibhMZHSMe2XuBYFgZgvBsvPEhMbHyQf23lzg8o7SmaR0MShuIfcY8dmNQjEbAEIepHvfyN
	euEkY9ffz46bEvtBp9yZ+49NmLimvnXYXWqtBpnGk3ZqWi5hhRSIN/m7DgAWcy1PNtpc7Za6zmU
	Le
X-Gm-Gg: ASbGncuSicScjDhEyP4b0raXiyP6JAi4lUvFimbnjOANho2fOci86KEE+71voUeMqPc
	qHBsmNaMmqGymswA7meXSWqzcvX7KBVefg6coU93tMI2HZESiPe7ti4EYul+cWaLOCm27BFwfKL
	3QyVdnNUBYWnrsM9yrDVJvv0Sb/yEr/dWELop3SQCnh5f50V2EJrjImOeQbXldVEgeZhhAXV9te
	w0B4nWkLmqhHkV+n1bmNWvpkJnS4zWRJ89qNk+mO/eShbJRDV/qDv8XrSKqLGcM8oIXyn85KfpX
	bR25Rxp/XiUyl+08eAvUriZzKxIPHr5oYLNhdZbA2tf+7T4gy+Kxy15HIVucfw==
X-Received: by 2002:a05:600c:35d1:b0:450:d3b9:4bac with SMTP id 5b1f17b1804b1-45394179dd4mr1049545e9.28.1751025172093;
        Fri, 27 Jun 2025 04:52:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPo2dBKUZ/Zkw1L6EzaaAtBgiEo7s2NtlnGP+y82PmhNo6U42m+eKNQAeG/uBgsf87Iii9iQ==
X-Received: by 2002:a05:600c:35d1:b0:450:d3b9:4bac with SMTP id 5b1f17b1804b1-45394179dd4mr1049205e9.28.1751025171615;
        Fri, 27 Jun 2025 04:52:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe0efsm47851935e9.24.2025.06.27.04.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:52:51 -0700 (PDT)
Message-ID: <bc3cf135-5432-4cdb-8992-7c400e728a97@redhat.com>
Date: Fri, 27 Jun 2025 13:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250627094102.770689-1-jfalempe@redhat.com>
 <CANiq72=aiAnn3n7ADgmKUNNSp7HfBjRc1ftG2qSD4EFUkS3jqw@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72=aiAnn3n7ADgmKUNNSp7HfBjRc1ftG2qSD4EFUkS3jqw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kuHZcACfCE8kXRCkU6v1YsLv97CBDnbAdOISdasMHAA_1751025172
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_045255_700990_CA958019 
X-CRM114-Status: GOOD (  13.92  )
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

On 27/06/2025 13:44, Miguel Ojeda wrote:
> On Fri, Jun 27, 2025 at 11:41 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> +/// On arm32 architecture, dividing an u64 by a constant will generate a call
>> +/// to __aeabi_uldivmod which is not present in the kernel.
>> +/// So use the multiply by inverse method for this architecture.
> 
> This sounds more like a normal comment instead of function docs, no?

Yes, I think I'm still confused between // and ///, so I will replace 
with //.
> 
> By the way, formatting:
> 
>      `u64`
>      `__aeabi_uldivmod`

ok, I will do that in v2.

> 
> Thanks for fixing this! It is nice seeing 32-bit arm taking shape.

Thank you for your reactivity

> 
> Cheers,
> Miguel
> 

-- 

Jocelyn


