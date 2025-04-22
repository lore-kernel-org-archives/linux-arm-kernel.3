Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD37C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOK06Gy+USdFFUjUhlRbDrQoZuj04eP9w8IDxAKpvDk=; b=BPNhoQOm32i4w30brP5WDpMj+o
	pxxWEGPWcLI6RB2DtAx6SPLxhjdN7WsxT7rUqT2kCsa7mG4RI2hYs3c/Zj9RtMrzQfBv+bBJzQnoo
	IHxlPoS2ILpkEKM0nbzO2AJqr9d9qNjdFIAGgetXDGMI1eh7pX1vPdl8dJVBpDd0bHQT5Lg1K++48
	xCCf2vz2SaM1cr2PXf5wzVe7oKyJa/dYUJ1uL+myuCV9GxXyKp/WYp9OVEnf+9HFkD6zsm/01ZJHe
	laCqjnkRwCqcH7vgAJ8i0ATXLWg3ZQ3uSTVaCDGLzfO28352elNXQp8DGmoY/kag3itZANYLeZWQa
	3LETRrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79zc-00000006ZYL-3h7F;
	Tue, 22 Apr 2025 09:32:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78bU-00000006E5m-1RJj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745309018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KOK06Gy+USdFFUjUhlRbDrQoZuj04eP9w8IDxAKpvDk=;
	b=jKY8Iapx3SRFnaFHJaNpB4itDV0W3GH7i4TklFo3sckSTHLOs0JYd0SXdhUSx4sQiaimuy
	V4sa5IPIa3ftS7oXgVK6irWVt/KYIxdSa7ACw/3e+sY2zcYF1OfikFVSinaCqoCRbbPiqc
	iJ5ow4OkAFVEQlV89j0FjKJEu/ePtDA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-rXjZ7J7AMyaUjq2fX9YTfw-1; Tue, 22 Apr 2025 04:03:36 -0400
X-MC-Unique: rXjZ7J7AMyaUjq2fX9YTfw-1
X-Mimecast-MFC-AGG-ID: rXjZ7J7AMyaUjq2fX9YTfw_1745309015
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39123912ff0so1205143f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 01:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745309015; x=1745913815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOK06Gy+USdFFUjUhlRbDrQoZuj04eP9w8IDxAKpvDk=;
        b=epqppYMD6I6nTi01/qi7JyMsRMnDpqTTj4bOnexyb5kDmIwuRWnp1fwKXRTcTyicLb
         MEAu/jRR8fPdxLLa08QTWMg92bCNZDSpUdBkt6VtJnI2gAfVtRCfcTmIin05GmMx7FMq
         YWl/3/B/2XK/neILh03d8+KAMA4aXc3HS6iyHX2rIfeQ8nXsTVtfmtvnAtJX66PWnh/F
         Dv2zLzXQ5rUKPct/IyVrEtAXF+g3YXT3BbF2rIr5cL3o/C7G8aHhVxm7K8rjTFXvRIZ+
         giMcng2m5hk1sIwI+JaUx5H3sbBgXzEENRmnMI6eXN7HiaCCn8gfNR5uYyEeiALlgzSF
         yjCg==
X-Forwarded-Encrypted: i=1; AJvYcCUS0znNO2HGNFODospO7cTpUW51Ho2Fitwdu7X8QpCTNNlG/Qu/jROXshtIrEwNNbLLeK3C0Ldfgme4jr9DZJtU@lists.infradead.org
X-Gm-Message-State: AOJu0YyydqacGiJej8SKKnGX/E/uHxcoYFt6f6Zz+zlFmtZAlnnhC+4u
	TPRDTpV28SiPvFRSP4sQ5QDchi9FsOTkP5j5+66Ax0OyjDw+dF6YXX2ePgB2oy+WCNQjdWg90Vm
	bvCM33EYdVUS+DusIS7jpfa7CBHIUl9nhuCmIdX+z40fOTjNmDj7VPwNfMFWBzZvXtIGpZM3n
X-Gm-Gg: ASbGnctaRMsR3r7mtVPrbJs5Eb9aNBBlujOweF96jzd/a1nqMcs/2Gm1h1ybxZQQcPH
	XY+V4wvAZBfh3HVKNmRB3ZtqPADfavzvDkeCtGI74QVNvjdTkmD+nIhAgeGyNvCgFzG4Infqruh
	NvA9tRTwCHLt161+HfOjptFZc3MH3X1HYaiqng5BM1fVdhGXY+L1k+Row7ap828n02YQ2xjVHfN
	Hp8m8JvqSAcFKb0Z47HSiXQpPtMMu6ny6T6cBQOL3mhR2owTsdrVxBixIDbCC1Ur1PYkjgqs3l1
	5dJOizw/LztClgYSPFqT6ymJglsLSPKLNjokWMlnK8EJt4PcCVs=
X-Received: by 2002:a05:6000:1acb:b0:39e:cbf2:e23f with SMTP id ffacd0b85a97d-39efb949514mr12348676f8f.0.1745309015359;
        Tue, 22 Apr 2025 01:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+QyOm/Vu2YE4p69xcQvAMQItgNodGSQLc0uE5uT6jNKC/u0jIIwsbmq+1mCMLdKIAUP3k4A==
X-Received: by 2002:a05:6000:1acb:b0:39e:cbf2:e23f with SMTP id ffacd0b85a97d-39efb949514mr12348638f8f.0.1745309014968;
        Tue, 22 Apr 2025 01:03:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9ed9sm166802545e9.3.2025.04.22.01.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:03:34 -0700 (PDT)
Message-ID: <e18bccaa-bc73-4d7d-a708-688284b1d15f@redhat.com>
Date: Tue, 22 Apr 2025 10:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250418165059.560503-1-jfalempe@redhat.com>
 <CANiq72neXsmmYQXQOYxndFWkyp1NKa=x3skekZZJOVE-wMZeuQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72neXsmmYQXQOYxndFWkyp1NKa=x3skekZZJOVE-wMZeuQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _9e1D4h_YA2CIzJXjoJEbcoL89OE_dELTLZwz6oaJqE_1745309015
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_010340_452076_D303C1ED 
X-CRM114-Status: UNSURE (   9.99  )
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

On 18/04/2025 20:18, Miguel Ojeda wrote:
> On Fri, Apr 18, 2025 at 6:51 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> 
> Thanks for fixing that -- some tags for your consideration:
> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/
> Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")

Thanks I will add those tags before pushing to drm-misc-next.

-- 

Jocelyn

> 
> Cheers,
> Miguel
> 


