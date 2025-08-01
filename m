Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFADC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3ut2IZtB01vlovnDAd6xUWzFbNv5v2C3DILCLpVpw0=; b=B1EdEzEsUtWKEfGC5xgKCZT3aj
	0FHuLk5kiCUtJEPgdsPZDyE1vHnGedc6j4s/la6KdWMN5hAUJjTVG42uK4bfO4Rx5uR1ZYJpyKfJ4
	SahQNLbvBk6RfBmvOpT9uW5hNT9zpupMVBJHJDdlwIl2bsIn7Zvrn8RuPD/FYX/Cmw2K/33Nz91ed
	sannsTJKZdfPppesUuegbLA1OswqIZBh/9Qqfvs77dDZ2oUcfU3//fTWz+YQGY/nRkskqyKtggHlo
	ueS7v2By+D8qCDfSbR4HWBuc17eSuTUxa/CPj7E+Nnq+O5Zoa7pHLbfjcNV6qLJc1ncZaPpsHxRX6
	IpXAQHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlaB-00000005Ibo-3r4q;
	Fri, 01 Aug 2025 08:57:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlXc-00000005ITX-0VCa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754038502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3ut2IZtB01vlovnDAd6xUWzFbNv5v2C3DILCLpVpw0=;
	b=JmK7fO+4lbwH1PUzBEhaED0EakJJ4Vn+f5RIqP7hJg0gM4A/rz0olso1OvFlrbW/8PV+dZ
	oTQJKQGNTVAD5+gS8+eOlynFpCM64ltD4z6tkO9uTmYRIqUqeQ4cCHcDhZYk7viagsXx1R
	eLmlHML0OCOxzdtv4ZB4CuvB5AGr074=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-FbzW4e8DMfqFkK0bmrRT-w-1; Fri, 01 Aug 2025 04:52:37 -0400
X-MC-Unique: FbzW4e8DMfqFkK0bmrRT-w-1
X-Mimecast-MFC-AGG-ID: FbzW4e8DMfqFkK0bmrRT-w_1754038356
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b785d52c19so298094f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 01:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754038356; x=1754643156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3ut2IZtB01vlovnDAd6xUWzFbNv5v2C3DILCLpVpw0=;
        b=ime1fYlj3/5SftCkZpMpo2dJyzShYIT4nbHM6sEmUjXZevM7WIHEPstywLA75SsNtj
         rJ1V/GKnmNZ4+v4+havKvEokyzaa7W/uUFEbc1vmDaJaEc1LW8qjy6LPk2VSxgHBzvBE
         HjobPNoEWM3t0iHx8vGGVkEXa5Jlhj0ovU5vAFTnkCZwJ0A6a73pfIys77xyslMtJmbs
         ccdOn9uil/HcHZfLpDzFDHEC/r2/oNV9t5bk3um/wel6+DFW2h5jxGGjH1e8484Lc/Vb
         iJcDjHfjM4Wc2Q39u4iG2eUwCQUjmc1bVsZnLd7lLkraOnIiqoLOOy5cm2E0Gw31p6nS
         gIWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcnCHV13ENO3hNGRsE9xBxHd7W1w49aj6I6kx37xutEo0pbpu3Crl0J5Hw0BEjUB5i837QMUHWx6xQPHJCWhje@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2WCTARckfnm3Dqw30irIjx4rwZgALrKqeb9sIYtanQRYCpoeH
	+Zglw6jDPmV/hwCt8GVMOeHS2g2B3vhH1WB0GLSjTjyv7dKw9AC+ekdBoDawsEpBahb/6YGGUjv
	uQXAlzsPs2rx7TLasasV/9+f6sTwtZ1NwmV+1yX49oKMSA+ejzA/f61MkEFa5900h9HDeSRijbE
	Hk
X-Gm-Gg: ASbGncuYST/85Mzg26bIEbJY4y/FVEPLD3DbWrWxG8fkLJixC+BuRgw13LaPADb7H0V
	9Ie2cJ04Zmpbw6gMU/9KULZmZPGCBwlCMoCf1yX1USZ9/BYRaPFlAXA88zxcMh1QSYP9lb01Mjg
	mjMNJG6b8aLADSH8C1550tdl6eZo3KUo8Ci5uz2T4JMIEqOYoelB4QCZoYEtAosQ7fikaW0Qyvi
	qAjAzY9rAD27TSO5WRpcK2avGtpO64ed/shMV/CUd2Rh4Me9c0xjaukgLU/Y83uInuxTcKr8oA2
	h9E4DzdWaicq2s9U+HydrcHN09a7ghYeRPpAko0/kH4Of1QXyjKETi9ZtPijg+tPNWk2xEzc8wF
	iziU=
X-Received: by 2002:a05:6000:2481:b0:3b8:bb8b:6b05 with SMTP id ffacd0b85a97d-3b8bb8b6deemr3637774f8f.29.1754038355803;
        Fri, 01 Aug 2025 01:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0SO4q2RvFPtgA+PGMdbAXShTVcEjLgx7m1c3m1LKK7FMUDdGk4NLVg7RcdXJk4nSy5WynYA==
X-Received: by 2002:a05:6000:2481:b0:3b8:bb8b:6b05 with SMTP id ffacd0b85a97d-3b8bb8b6deemr3637740f8f.29.1754038355055;
        Fri, 01 Aug 2025 01:52:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db? ([2a01:e0a:d5:a000:d252:5640:545:41db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533e6sm5323520f8f.35.2025.08.01.01.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 01:52:34 -0700 (PDT)
Message-ID: <b04db6eb-03aa-43bc-bc09-4192e2a021b8@redhat.com>
Date: Fri, 1 Aug 2025 10:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: Add a u64 divide by 10 for arm32
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250627123854.921704-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250627123854.921704-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nfd8S7dMEnkP3mfmgX5aPgWSQqtJbCHIjspW3nRy-Rs_1754038356
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_015504_226656_D3703269 
X-CRM114-Status: GOOD (  21.73  )
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

On 27/06/2025 14:38, Jocelyn Falempe wrote:
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.

Gentle ping.


Best regards,

-- 

Jocelyn

> 
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index dd55b1cb764d..774a17de4f2f 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -381,6 +381,26 @@ struct DecFifo {
>       len: usize,
>   }
>   
> +// On arm32 architecture, dividing an `u64` by a constant will generate a call
> +// to `__aeabi_uldivmod` which is not present in the kernel.
> +// So use the multiply by inverse method for this architecture.
> +fn div10(val: u64) -> u64 {
> +    if cfg!(target_arch = "arm") {
> +        let val_h = val >> 32;
> +        let val_l = val & 0xFFFFFFFF;
> +        let b_h: u64 = 0x66666666;
> +        let b_l: u64 = 0x66666667;
> +
> +        let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
> +        let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
> +        let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
> +
> +        tmp3 >> 2
> +    } else {
> +        val / 10
> +    }
> +}
> +
>   impl DecFifo {
>       fn push(&mut self, data: u64, len: usize) {
>           let mut chunk = data;
> @@ -389,7 +409,7 @@ fn push(&mut self, data: u64, len: usize) {
>           }
>           for i in 0..len {
>               self.decimals[i] = (chunk % 10) as u8;
> -            chunk /= 10;
> +            chunk = div10(chunk);
>           }
>           self.len += len;
>       }
> 
> base-commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38


