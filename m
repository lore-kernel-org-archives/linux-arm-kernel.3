Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C37C02192
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 03:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHXeN8LIM9w54fK8BX5YrWdpuop7tLiyGoSgZk7eNoc=; b=QBnhrhX1rJxrdzZNc1L5QowOXQ
	dCAnu+xg9HNpMB62AVD74sERbKEKFAjpI3VDfrcYSckPwFWRq0krSFDAfUrNHRrs+UrrmurxSKBDG
	7J3IU1zJ6VkFO+uo2Bp9wJGTAAnFxckUmKlwzt7Tot1YZIDok+nvX+hphcWnGBW1jJ6Wgiz6nKn/F
	cwHBRmMD2anyPtAy6pXzfssd58ATvlh3iRFfSdu7Fziz9HpFxpMotPvIDuy4SoFQ7qOPwlH41BPIJ
	HfJqnb5Lvk9hgd8IhIhVXPrgw600Hxju7j/p7dPvJ6MW6Sw/J/8Lf8ZWKPLe4SubnF8JgRALZ0vpb
	/AOcgzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsET-000000056Yz-2Jcx;
	Thu, 06 Feb 2025 03:07:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsBl-000000056Ei-0jpn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 03:04:27 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab744d5e567so78917466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 19:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1738811063; x=1739415863; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kHXeN8LIM9w54fK8BX5YrWdpuop7tLiyGoSgZk7eNoc=;
        b=CvAL2OcWmr7AzXiuf0Dawu1RNBPYmFaB5pespeRZDAfyVjBoSRqgAGI/4LCmo+TbzZ
         Y7wVE4Z00SGg5l6Kq8mPO/tmig/5hWrSunovN61u8HqsldMkit4GujnkORIMNx4DWZb6
         xUk3C5qmc62GIfcE6uz1zEdMlhn07PCiRvV3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811063; x=1739415863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHXeN8LIM9w54fK8BX5YrWdpuop7tLiyGoSgZk7eNoc=;
        b=i3I684fZSfnSwqCqB9PFxfNsDsLTfAXFQ7kMScwcFYJOW5jcWJuBBcckOiyNt9fCys
         SqNPI3jloagaUaa8/CtLm1wsth5zp95CIuNZlxm7ZIy9C3zv+zD2Y+t9Mchus3Rkx3EL
         x1/xExAwO/DxpTWhV8rxsDEriUaF+8YRyiA51YY3nVCLzpocKMqRW7PDMQT9J9hxaMhM
         vl5UG4oCfy64J1WhZNap4OaCq3hgs3jic7f84KeclAyTG98WRRP6FFkDrdBGzdR3kZl9
         X7dp4Iy/50m6ZNIqC6vV6vHTvoy5YIKHkC6skSOQDxkIFmoMpMLhOfbXSzOhRxPzOdwn
         Yfww==
X-Forwarded-Encrypted: i=1; AJvYcCURN/+74SQPKZsj/xP1stoD/2yP3xtkW3SiDVxj+WaL+TjNM8tFOqDugry8pirF4SBv+Fjv4S+dDo3VCQtw5lvW@lists.infradead.org
X-Gm-Message-State: AOJu0YxH06XoAe9QgT0ycAT0KZPvis5tK2EJYUTrhPsdyEaGhqhcKY7N
	cYIXxI1ejYjsmYSFoMmtn4uZwUoFv1ubjPqfO1cySJbnJXkT/SFOYzyTDDdyv4aQUe6p6uKM4Hm
	q52MTtbhP1rqTr86FpC0iUcYDDCI=
X-Gm-Gg: ASbGncun9JpbHPgowH/5AkRhbmizCyJXMkIivre6ckyF1cZzEe0Nme6jrw0DEYBl0L5
	XOxnY1k3CuRXSuzYvJJv/8yg6CKPZqHd0JM+lkS0VjzYQkCNeOX8Lcn3wGm01PqYo4Hf11c+x
X-Google-Smtp-Source: AGHT+IHqxAD/mAroNe/du82YKfNv9KCYjKV/xBzj38++g3h5xV+O074K8SXXeCFqLMo6ZY+71Vf5+TGBbTDseAZx9Xc=
X-Received: by 2002:a17:907:72c1:b0:ab6:d575:3c4a with SMTP id
 a640c23a62f3a-ab76e878417mr125480566b.9.1738811063095; Wed, 05 Feb 2025
 19:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
In-Reply-To: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Feb 2025 13:34:10 +1030
X-Gm-Features: AWEUYZnF0CfsV_4ImWi4JVAR627wkvGoxLYm6rTH2Jjlr9IDQ3zsK4d4k_9LZjU
Message-ID: <CACPK8Xe_3t0n=BDcbFQLt+M1K-PTHMWGs37k=4B9P6tfsqEXeQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Mark Andrew as M: for ASPEED MACHINE SUPPORT
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, arnd@arndb.de, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_190425_307578_C1813F2A 
X-CRM114-Status: GOOD (  16.18  )
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

On Mon, 3 Feb 2025 at 13:27, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> From discussion in [1] and in-person with Joel, flip my entry from R:
> to M:.

I'm off the hook!

Acked-by: Joel Stanley <joel@jms.id.au>

>
> Link: https://lore.kernel.org/all/CACPK8Xe8yZLXzEQPp=1D2f0TsKA7hBZG=pHHW6U51FMpp_BiRQ@mail.gmail.com/ [1]
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: soc@lists.linux.dev
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa06545e2861abe46ea7029f9b4d3628e..305e5530560e53c10f0b610fa7b4456ca78fdfc2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2285,7 +2285,7 @@ F:        drivers/irqchip/irq-aspeed-i2c-ic.c
>
>  ARM/ASPEED MACHINE SUPPORT
>  M:     Joel Stanley <joel@jms.id.au>
> -R:     Andrew Jeffery <andrew@codeconstruct.com.au>
> +M:     Andrew Jeffery <andrew@codeconstruct.com.au>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  S:     Supported
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-aspeed-maintainer-dddbbe22da46
>
> Best regards,
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
>
>

