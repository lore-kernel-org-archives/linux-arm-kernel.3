Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E44CF2574
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 04:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wa5GyeWvpSlizVqAymczK429eN7FLePDGG/H+2skk1E=; b=EjREd5ZAw6tdNW5PSv1dKj6Woq
	sNddOQbgnUqlZ+Nka27cMGIu2aRfnXIQkc13MeKzQzoep9XBXkTV/REmwWlO8YwZesj9kjUh1kwNf
	JgZKcVR1rhI9kCt9JXcKOq5no7auMS++9SFtuumwpS3W2505CyFsoBpOSQF2NOG5Z37BEkfKVyv/B
	NFa4fULgaQNdzjXA/88goUlhkcPQA/WowZ0I+s4fFPkKQZH9OnAq+U2XbpZ7Wz66mXPkxhpjdecdy
	8BUpCrj9jnAy3/x7ipE8ZEkFX3e/gtCnlJKFGLAx7bFlXSbMqy5zWMlTKiPImDQHbSJisUXlH0GfZ
	QGIsOBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZTF-00000001XRZ-0nPf;
	Wed, 19 Nov 2025 04:07:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZTC-00000001XR9-0KSW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 04:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763525220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wa5GyeWvpSlizVqAymczK429eN7FLePDGG/H+2skk1E=;
	b=FHTS4HBP844L8Sk9uacX6E3MULeeUltG4BNc1ijkXSvajDXISI8GcguN7D7XTiGIYWUMOO
	UYm5qvkk6IssgFOuyvqp+Z5K1FFqLGu1kFweH0x3fUOwP6maHiHiYeUd5jXYrafh8wzxaX
	JV+CSSlJ/aJdlGH3kLmRLWHR7NSOVEc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-z2bYeCosM12Kub_NEzkh-w-1; Tue, 18 Nov 2025 23:06:58 -0500
X-MC-Unique: z2bYeCosM12Kub_NEzkh-w-1
X-Mimecast-MFC-AGG-ID: z2bYeCosM12Kub_NEzkh-w_1763525217
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340ad9349b3so15523872a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 20:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525217; x=1764130017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wa5GyeWvpSlizVqAymczK429eN7FLePDGG/H+2skk1E=;
        b=TOEwwF0OdW+mHugw1lFkpdeYKX9nVMyw5XreLQx4+hivg+0sODpXFDnFoLGGL1BVK5
         UIkBWFAO2B6VbFp39Jo37U5/zHG5eedkyaSEVTlcAv+3mkTOHzU/EXd3t4HSDtTeR3ha
         gKi+8JGN8GgqFIR2lKSeE0fMtAx16lq27XeKKxswBmJCsmgwU7JuknWnOZI0kaPDLsGI
         lqdSj2eL5T6iOzYn3sYj3+noPLcxOAx0eU/1TXMZmObXPGH/fTEBeP1s/fQu/hzdQPYE
         U4ky1RuvrrS6s4wxrvGB2lrlu3UZaezBYysxwfY/G9J2tKb9RBuRP5QXJMUPPCyIK52L
         aGgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK/wNdvvaywI6heOSyrXzmTciv9XXcD9dMsS21W9P7rQHqsY4D+kAtJWGTaCOOnY1lF/P9pbRRs/4BPiKDIWKM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf9wZEDrTjgeL4xu8UJNaT/dJMmkYESmLly3fsOf2s7b2LUJ4T
	yUqwMHLgiq4LW/AXdXhHpwR//b+8PULFCY6B78A9hHlJE/ltRBDb/PLCI4ZauHV+T46tvXCFHTF
	jrdytbKdRXfHeF30lDcI/C2bIgssHddrjqgw7TbavbLxUOLBEFclOpTIPqwSY9/YtGM+WExpg5V
	64
X-Gm-Gg: ASbGncvO71X/95BKcFzbBzffKoDdixBSFKHcDy9wZB8n3DsWDtOZOfG0ti9l9eJQWbk
	cHmlQ+1dLllYJ92XU/n8ZUZZtOph6XCb6ZFOteskJR3UDsh729oD0g6zPimVl88h7pQBIlwPf0s
	A+Bgbd+AWZRtpHjtDw2OPeChBRUAdFz8Bw6SYKzklOShQLqKlIU9K0Lg8SnQVfld8IGbDpM+nLF
	zFdYWxMHRSuDdhBV0paBaMcuiO1ghoz/jIkTdKv9LJeK42H3X2/8kgJ7IXTLp6LfaMRCamUQcga
	dAbtSHYELlSFGcOCvPsxKvLZcVp99DnY+c6Y/osmCioHTUwBdqNaHInyHjEq+qhikpJXlvBZZne
	lO5dIvGj2FjcjVEqVqJxQaJjcBII40llAmxzL31831VSb2Tol7A==
X-Received: by 2002:a17:903:2b07:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2986a76a1edmr188721635ad.51.1763525217182;
        Tue, 18 Nov 2025 20:06:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFybKZJ5dfVKQv3kow6RIEu6ZMStfbHdxTnbwIkRbQ4dZJNBjn5fnddYH54ZsnsU2+P3UQoEg==
X-Received: by 2002:a17:903:2b07:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2986a76a1edmr188721185ad.51.1763525216817;
        Tue, 18 Nov 2025 20:06:56 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346b8sm190579485ad.16.2025.11.18.20.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 20:06:56 -0800 (PST)
Message-ID: <1a8cd97d-4aa0-44d2-b25e-5e07786b0631@redhat.com>
Date: Wed, 19 Nov 2025 14:06:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 34/34] MAINTAINERS: new entry for MPAM Driver
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-35-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251117170014.4113754-35-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kpF80pDc6TRIxAeeQZt647FKppS01Be6J2gNohEZhqc_1763525217
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_200702_197193_58010A86 
X-CRM114-Status: GOOD (  14.71  )
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

On 11/18/25 3:00 AM, Ben Horgan wrote:
> Create a maintainer entry for the new MPAM Driver. Add myself and
> James Morse as maintainers. James created the driver and I have
> taken up the later versions of his series.
> 
> Cc: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46bd8e033042..ec9b2b255bef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17463,6 +17463,14 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
>   F:	drivers/video/backlight/mp3309c.c
>   
> +MPAM DRIVER
> +M:	James Morse <james.morse@arm.com>
> +M:	Ben Horgan <ben.horgan@arm.com>
> +S:	Maintained
> +F:	drivers/resctrl/mpam_*
> +F:	drivers/resctrl/test_mpam_*

Maybe to squeeze those two lines into one if another respin is needed.
LGTM in either way.

    F:   drivers/resctrl/*mpam*

> +F:	include/linux/arm_mpam.h
> +
>   MPS MP2869 DRIVER
>   M:	Wensheng Wang <wenswang@yeah.net>
>   L:	linux-hwmon@vger.kernel.org

Thanks,
Gavin


