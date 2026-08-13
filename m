Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481CFC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JN2pldkYM0RMPQtKgx5//Z+4qj7wz5yY5RCZ6A/tGpk=; b=ioxXhD3aKuB6Drn7nbVieMkCsH
	HyEgVKMsaeE/QsmXgaJdaklVJQO+CrvuIL3kAXQVUVMICkOwEfaHCdHLyt1QFza0nESQYOze+4xlo
	nvjVFfO7VGfrAb6w3uGEeadzRfcJ7hYnp3js24oJPFXElwShWT8JfmN3r7m8j4oqJKhSFp2eR1cw6
	ZVFDxs/BWfhNpiGsFgW1m2ioKmpO35eUWKEiBsXYEYlWaB0Su1p7moqxL+eMoSVZeB6eMFRypc/Mb
	MsmoNEl4ATeb9aUlRGSWHcMy1PZYbqFBuOJgKpohKf4D0zcsKu0GM2aF7Qw/D4G8+w0+G/Vgw7pDz
	/OUHf6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPye-000000001LU-2D03;
	Thu, 13 Aug 2026 07:35:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPyc-000000001K3-0yYy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786606544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JN2pldkYM0RMPQtKgx5//Z+4qj7wz5yY5RCZ6A/tGpk=;
	b=adST3id3YEfv+AUmzRiyExpsAYDEh61Ko/uZ4Gn/U6rjshbGTIssSHkFrIcOyOUO4VZ/7Z
	nFmCTLZHAm5ekjJdr2WcwhbHtGgAtkGjqujoQz9+vPkZcMeL6JlI8H0qaMXk54FF8no/+y
	ALjrdla9OKp/rr6D5d0TUVSruPGd7/k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-ci6qk9haOJqdbQRtfLuyKQ-1; Thu, 13 Aug 2026 03:35:42 -0400
X-MC-Unique: ci6qk9haOJqdbQRtfLuyKQ-1
X-Mimecast-MFC-AGG-ID: ci6qk9haOJqdbQRtfLuyKQ_1786606541
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4955e865174so2049305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 00:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786606541; x=1787211341;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JN2pldkYM0RMPQtKgx5//Z+4qj7wz5yY5RCZ6A/tGpk=;
        b=iwRsSh+ZBO6np+COU7NlZjRBRmTSDBxcAfeV/2zr81ACtsQA9DpYRxlgqqAT/d5RWz
         YdBeQnEjpyHFLArbEKHMjJ6iVl83eCk4JC3rccz/t+EVynjkZ9ECzmzAOF6gZweycKds
         xlVigc6cpBt0iOxGtCdoaGJspGv3MecHVGFJQhNKh4f9f8h8hwI3fdBUwUMb/iJRftBw
         e8e9oAYP1QItERSD74OS1fLdlwBuo3cvo2Y3+BNmKRTpv5RKlbije+p4wSta7R3Ao4AQ
         13GBJgJrhJO9q0SdJsrfbxbD2VUs025tyiLz1E++a4cYswrZBYfr36jc6zHthc0HBNSW
         8W+w==
X-Forwarded-Encrypted: i=1; AHgh+Rqnx1h7Bx4bSQpQKcvkyJb3rtrUosmJuDQ68QJRT0+BL+GQWo5l38D77r+WUcCjUVvT/0FKKvN08EH5a9Ntt8Xw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjylh37wWI6gOBahULlQuf239qRIpRSee3ltmcPwm6s5Hyp7Da
	u4r/3KY/qbc/OpcPGUrXPL4iOKcZdzMS+g8RBQVhkBuRjiInSiI1oZeAmweDapN1pTD0STFRKVp
	ojl79c/AWhWNJcSvSieX4ueDXvsQvhypkNiTi4B7oUdfDFQertQhH3sRGuLVxdYu9rr5i+945eV
	AU
X-Gm-Gg: AR+sD12blRV6dLeq4nGrGPMkAFkSmlxnM+hiLz5xX4G7LJz0CS1+qJtV7d1KWCnyr2P
	7Uw8OJxGvtuZJQeJ77OKPJxV9j6hyZYBAD79HtK9a/tGDJ0kaEMGgCNmRauzSc2ylvTbtz54lJh
	PGPDLev2LfdWVaJGXRqpJR4LM3Ff/jmW9qeBighw4tJS1yVVGYHoz9URXuC6C7Dpg8hm7v8KxOf
	HzKc2h0mt6FYjUj3z2cK+GYfvZw1/cuuqE/DsNFNRQQh9xJtK2YV2AGTkluWO0bSjHGN7x1YYX5
	KC8dA9l/0NfhMEXb45IJkRtOGXGEp5kppieljpnky71vy+hjudoJpEWiInzy8l9sBq5yuEw1
X-Received: by 2002:a05:600c:19d1:b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-499821f2a66mr36070065e9.13.1786606540836;
        Thu, 13 Aug 2026 00:35:40 -0700 (PDT)
X-Received: by 2002:a05:600c:19d1:b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-499821f2a66mr36069425e9.13.1786606540475;
        Thu, 13 Aug 2026 00:35:40 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.115.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981d9613fsm105709945e9.0.2026.08.13.00.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:35:39 -0700 (PDT)
Message-ID: <b82da069-b76c-47f6-bf8e-f47701cb318e@redhat.com>
Date: Thu, 13 Aug 2026 09:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: imx: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header file
From: Thomas Huth <thuth@redhat.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260619122448.188046-1-thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260619122448.188046-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9YkIkr82i-GpGoYhh4_C0UMnpwDsfajuSx-99UGokBQ_1786606541
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_003546_358551_32A12D81 
X-CRM114-Status: GOOD (  19.31  )
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

On 19/06/2026 14.24, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> This is a completely mechanical patch (done with a simple "sed -i"
> statement).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Note: This patch has been split from an earlier bigger patch of
>   mine to ease reviewing.
> 
>   include/soc/imx/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/soc/imx/cpu.h b/include/soc/imx/cpu.h
> index 0bf610acafd06..8c53150acd76e 100644
> --- a/include/soc/imx/cpu.h
> +++ b/include/soc/imx/cpu.h
> @@ -30,7 +30,7 @@
>   #define MXC_CPU_VF600		0x600
>   #define MXC_CPU_VF610		(MXC_CPU_VF600 | MXC_CPU_VFx10)
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   extern unsigned int __mxc_cpu_type;
>   #endif
>   

Friendly ping!

Could anybody please pick this up? Thanks!

  Thomas


