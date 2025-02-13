Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237A7C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LL+aPdnFR/fkXCURRzOeY8yP7Oiq1xCa5VfoFeYynkw=; b=Lt4m4bc/+tRzMxJOCn8SR7rsMU
	bkr+Ox1ZNA/yPL0NBHVfV4H5lRn6Lqs6IhuZrinfhleZN6U7LN6UIV5DZ/jH2D0Fb5EROjYo2FYZe
	Hp3Jav5G6KAu3Qr0x0gUeyEEN5HOuAT7ez6HzO6Wemjryh0zjhYdVpncAEO5qeLJnU+9pce46/Pux
	ZaaHciW8QW0QHKYSthOoGaxdfLCAN25wTXqWUdeqhPiiEQ69kkWQ0uc6x/aSDVGLwPn4N+tT7y1Yp
	sLrb0ljtVjjUHG2KzwHgi4nc1zR05MPdqWRZanNFycLARt4R4gZIyTv+/mLvKKOQCZrouNC76M4rr
	2bwNSBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXR3-0000000Arkg-3fon;
	Thu, 13 Feb 2025 11:31:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXJy-0000000ApUf-2kLE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 11:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739445833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LL+aPdnFR/fkXCURRzOeY8yP7Oiq1xCa5VfoFeYynkw=;
	b=Dpa7cMb+judlLDy0wXs2g8zy30bhGz7ioRnh20TAP3m15dp9N+SoUK8pmQ80VcEvbvvJR8
	DXKqr0mtwTVAzqfzikQUjDH4I6vwBH6MSdAUNwfn/Mt37lceEmFuyFc7TMnHUjYnjn3tfR
	3+mSwsi0IqGSdMp3gAhcAv1ONc/zauM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-h1VEEvw-P6Kks-nub2bFKg-1; Thu, 13 Feb 2025 06:23:52 -0500
X-MC-Unique: h1VEEvw-P6Kks-nub2bFKg-1
X-Mimecast-MFC-AGG-ID: h1VEEvw-P6Kks-nub2bFKg_1739445831
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-438e4e9a53fso5601765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 03:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739445831; x=1740050631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LL+aPdnFR/fkXCURRzOeY8yP7Oiq1xCa5VfoFeYynkw=;
        b=V+f7zp/M16cZ3ayBgrtmWRp0qCNmOFUTUvlPS3ypFP393xXG0zoyhvuN1gPiwB//ln
         zYjs4HE0BrwRNMelRlirc9qd8uWdcYivX2SQ9pmWVAcpGYtql4YoS/jH5dr+2kU786mx
         zlXWK8My5rjSF9W4rK1C8WWB/01TikymGayS8aCe2xMgApCa9fLZIRNRB6xQCBCP5AnO
         EzQe9FMeW31FdeyAYweWcdbMazcX968bjUNEFwFlbnhbfUbL2rWIn/QlVruxxBE6NNA8
         zgtGJcLRgwdmd6jxF4GlcZ/bWc7aL73PSeqYv6lP5hAlGdyG31x8q/AdFgJWEN/9gfNv
         zvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdRq5Nh3J/E+3kkwkUD8U8Jve231GXtNB2A60YmeRucZZhUw4gcVYBg/jDP+9jeOtSY0V93Ghag8slMNzqWrgl@lists.infradead.org
X-Gm-Message-State: AOJu0YxD2oLPMHCeuwwEhOKz3HdfrwoSL7ZhYmoGemxgLjEZOfwkepdL
	JfDBgV3TdshQ0UZKi2Spi5JTzOpCcFV5t31JthetdZi6lpF83ybBJ+rR11l/5oAa4x8pypUk6qo
	LucySSUgG3tyXsbeL97Y5JoH8rDVDgNcD2KV8c9Ch1zzE/HRncYtI/Pi9rmYpI3mSgBYEbCCg
X-Gm-Gg: ASbGncu9AwLzxusVzUhVYslw0s0tFmRY+j2UPlY/9ch+Bo+M/HtY0MEpAPbJS+JxrMR
	Xe26ggmj8nHIrxaBSzHOzXilKfD9B/1oNI5H4wP+dibFyGbUy8Q+Aag3Lw+WE2/hUTGbF8DYhag
	hxzk0AuR6sSheEU/PAaxrBsBcnwJTC1RtPT/cANiA+l8yzgRAzaefS6Y6G+G/6gNLhJ6mTcfBFY
	0dgOpQe8DlZvO+cdLwKCjHfYiaOREGLpdBtLUrUQew0o8c5aGtYE+i2UjnJi1MFOmeWibivbRiI
	Z2KSy/AaSt53yOIjRF9hibt4lN6qt8nkyfI=
X-Received: by 2002:a05:600c:870d:b0:439:34d3:63cd with SMTP id 5b1f17b1804b1-4395816f381mr65177105e9.9.1739445831373;
        Thu, 13 Feb 2025 03:23:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFtFyqrjbkfQQqT9IE89MU7ZaXBN7z5Cz0szfxnDWNjv1Rol7DbNd/LzOv6OpYD5KnA0J+fw==
X-Received: by 2002:a05:600c:870d:b0:439:34d3:63cd with SMTP id 5b1f17b1804b1-4395816f381mr65176865e9.9.1739445831072;
        Thu, 13 Feb 2025 03:23:51 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394dc48d9dsm41234445e9.0.2025.02.13.03.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 03:23:50 -0800 (PST)
Message-ID: <3a979b56-e9d6-41c9-910b-63b5371b9631@redhat.com>
Date: Thu, 13 Feb 2025 12:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: ti: icss-iep: Fix pwidth configuration for
 perout signal
To: Meghana Malladi <m-malladi@ti.com>, javier.carrasco.cruz@gmail.com,
 diogo.ivo@siemens.com, horms@kernel.org, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 danishanwar@ti.com
References: <20250211103527.923849-1-m-malladi@ti.com>
 <20250211103527.923849-2-m-malladi@ti.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250211103527.923849-2-m-malladi@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VyuAX9liJEGTNy16pWmsNfdpo0aOGg_t_64PNdRrYJI_1739445831
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_032354_769568_E9A6D755 
X-CRM114-Status: UNSURE (   8.27  )
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

On 2/11/25 11:35 AM, Meghana Malladi wrote:
> @@ -419,8 +426,9 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
>  			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp));
>  			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
>  				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, upper_32_bits(cmp));
> -			/* Configure SYNC, 1ms pulse width */
> -			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG, 1000000);
> +			/* Configure SYNC, based on req on width */
> +			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG,
> +				     (u32)(ns_width / iep->def_inc));

This causes build errors on 32bits:

ERROR: modpost: "__udivdi3" [drivers/net/ethernet/ti/icssg/icss_iep.ko]
undefined!
make[3]: *** [../scripts/Makefile.modpost:147: Module.symvers] Error 1
make[2]: *** [/home/nipa/net/wt-0/Makefile:1944: modpost] Error 2
make[1]: *** [/home/nipa/net/wt-0/Makefile:251: __sub-make] Error 2
make: *** [Makefile:251: __sub-make] Error 2
ERROR: modpost: "__udivdi3" [drivers/net/ethernet/ti/icssg/icss_iep.ko]

You should use div_u64()

/P


