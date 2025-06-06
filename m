Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435FEC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 13:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6k/v7MmiVZncaG0gAng2Qdjjf1NhngohmIKq82nZVQ=; b=AgfSHQsBmlzVJLyuaSI2H8IM4g
	/HKoSxaB+nJ7+FzrVGdIOWoEScV3gygV6qOdkXoPsbqbrgCT6+uAXC3EauuXdicB1UG0VrtO+KQIS
	7cZNNQR5+e4E4mTfXFlcNo1VLTkNi2WJhWYAJ8/WcrJEyeH8rKywDAozFssGjn6oEGI8V8Vatz9tf
	DXqPu/bfvpZKMVSHlxV56o0aJcQJHjeLm2IkNdH7zXVx4vBlLNfpnzsk/LIzUdfX+z+mgQsduzLwX
	DmDbrNbOxDJ+HLfRg2+nprmZw//XOElWU6i34VpwhQbJyqx5LmcBx1u3J/nW4lJ1HBcngCOOhRyjJ
	nR94uGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXGf-00000000Lr3-3cHn;
	Fri, 06 Jun 2025 13:37:57 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXEY-00000000LhU-47PC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 13:35:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso2010444b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 06:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749216945; x=1749821745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6k/v7MmiVZncaG0gAng2Qdjjf1NhngohmIKq82nZVQ=;
        b=cV7yDu0M5W7y7LCTQlZDlEE3UBhn966fL31US1YJgWxvVyliuHl+oC04LYgMVgfmAj
         e2og5LJ3ErcqVYDNGxDtDWRAT5vl1FogTfRgOkIL3ELF8G9xZeHEpmjbYcdXrmZbj3RX
         dCZeyY0f97hVFBycgDF/EcOrT7eZtFqdcRRQDmmaA1GaQpp9JyRmeMC2EBX0mi4xmAUs
         d8jdtzoxDd6IW2eoEFF0CvZHdBGCOOtV7aob8VjR2+jh6nX6qiclmyGzTQwkGkRBSIj9
         8otmR6Gw7kT9iRH9s3vTBlp7WZFmJLDTefJxjY19Ng0pm3pqjFLc/LJ1J1PKwb1Nnm+Y
         ZA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216945; x=1749821745;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6k/v7MmiVZncaG0gAng2Qdjjf1NhngohmIKq82nZVQ=;
        b=m2j9dYSiPE7aC/0kPxphbHVgZ8RGe0mKpKI/QMTfX7lu6bBsNnJBUT/OmLBQVQWIxb
         VOBqvCtBZAcFsvoGsdpYTrVHlvAPyrHZo2EntR1xZCKpZRuQ0L6ckrfwgl+7R4GDACXo
         v0zP4eFDWfW1hhfn2POtu/2J+jn6xh8cyeIwPy5ad8LNURLeYsyjWN57P5Fi+dyaa6R9
         R+1IFWO80YG85x7XyK39csPSFAhfG92HSsiUfMI8nWmpUEtPBKysZ88vmVbjGwWIHy/T
         nBMuaq2VYZ4aCABuUmgnMAvtj49QdvtniDJ/XiHKhivKr8Ek6NlYmh8Dsa9UmhxCEGdD
         Fp2g==
X-Forwarded-Encrypted: i=1; AJvYcCWZaw5LvT4qKnxWZO3ZSLHQL2hTq2+QaWgiJAw1i0b2J5Lf3OERkoCldhObEvE5/yl0LHLz6gxQKOG1EftrrUHu@lists.infradead.org
X-Gm-Message-State: AOJu0YzkOy/7sW+sp5yTf7R77JZGA1SVpL6psP+Rinh7dCSzstcl2T6V
	nb3g9zdml9axIXsbMYJwVTilTACQPkrDvanEHADrXQHNvPj6dFp4SZzWUJjbjw==
X-Gm-Gg: ASbGnctg2VGGzeoHulylXfbLraJA31DSDJQpsGwHntGm7GpHdHZHoXWRIw3yw2ZHRbb
	pLmwvu/PCwNMWCeBMl9YYUp0JIaMCmS909ng+kfJAWTNJLy7hC6A5r/lVwj8sS7ETIleI9otHTy
	IJlNCBMMX7sO8MjzspTC4AmXMrDGcuaQsi2dBljvdyOArSS/YldfgHSQjogY+4VVZNrJENgDPfZ
	cckPdtgIHsiukJvV3HsDRDdpn4m6UdR0m5PLL1p59VV5UZT8Z9Y+vAwwA1JHR9if4/d+gyS50XW
	eH+Cqmo/qDKryeyF/FlmjBVJnFlVCose+klzD8qnC1plt+wHptyrHyg=
X-Google-Smtp-Source: AGHT+IGVAVfaCO3WJmW8EZtwdSKaSpA2gT2x6UkvCUzMZbUmgdcLsdnbM0vABNk8ZcknIZtO7DrmhA==
X-Received: by 2002:a05:6a00:188e:b0:742:da7c:3f28 with SMTP id d2e1a72fcca58-74827f37c17mr4990489b3a.21.1749216945558;
        Fri, 06 Jun 2025 06:35:45 -0700 (PDT)
Received: from [10.0.2.172] ([70.37.26.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842d3sm1299017b3a.98.2025.06.06.06.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 06:35:45 -0700 (PDT)
From: Sinan Kaya <Okaya@kernel.org>
X-Google-Original-From: Sinan Kaya <okaya@kernel.org>
Message-ID: <7649f016-87f1-475d-8ff7-7608b14c5654@kernel.org>
Date: Fri, 6 Jun 2025 09:35:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: qcom_hidma: fix handoff FIFO memory leak
 on driver removal
To: Eugen Hristev <eugen.hristev@linaro.org>, Qasim Ijaz
 <qasdev00@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250601224231.24317-1-qasdev00@gmail.com>
 <20250601224231.24317-3-qasdev00@gmail.com>
 <3c6513fe-83b3-4117-8df6-6f8c7eb07303@linaro.org>
Content-Language: en-US
In-Reply-To: <3c6513fe-83b3-4117-8df6-6f8c7eb07303@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_063547_026242_C300A2D2 
X-CRM114-Status: GOOD (  10.52  )
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


On 6/5/2025 9:04 AM, Eugen Hristev wrote:
>> diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
>> index fee448499777..0c2bae46746c 100644
>> --- a/drivers/dma/qcom/hidma_ll.c
>> +++ b/drivers/dma/qcom/hidma_ll.c
>> @@ -816,6 +816,7 @@ int hidma_ll_uninit(struct hidma_lldev *lldev)
>>   
>>   	required_bytes = sizeof(struct hidma_tre) * lldev->nr_tres;
>>   	tasklet_kill(&lldev->task);
>> +	kfifo_free(&lldev->handoff_fifo);
>>   	memset(lldev->trepool, 0, required_bytes);
>>   	lldev->trepool = NULL;
>>   	atomic_set(&lldev->pending_tre_count, 0);
> Is it possible that the handoff_fifo is freed, then we could observe
> reset complete interrupts before they are being cleared in
> hidma_ll_uninit later on, which would lead to the following call chain
>
>   hidma_ll_inthandler - hidma_ll_int_handler_internal -
> hidma_handle_tre_completion - hidma_post_completed -
> tasklet_schedule(&lldev->task); - hidma_ll_tre_complete - kfifo_out

According to the documentation, the way to guarantee this from not happening

is to call tasklet_disable() to ensure that tasklet completes execution. 
Only after that

data structures used by the tasklet can be freed.

I think proper order is:

1. tasklet_disable

2. tasklet_kill

3. kfifo_free




