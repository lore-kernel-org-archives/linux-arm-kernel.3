Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC3CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcsR2lpNDjubFi27+my/+Mvy0uMimCUXPssMeKK9hBQ=; b=IPZqTwwCAbOJIGwH2kHkku9ubO
	6lvl9EUimHmQanZSmoco4gLYD2fUcpUp7VE8Q0kbwPi7ae7OpaMG+jZnPhuh3qeVpzF6SKRT3H6+g
	4XKMy3M6/n4oWuXGX4dKOqfC3Tti9XGEZ0MfuMVq4Y/Dwttkv3yHc+zK99qKMJCHMsYPbZyct8zMp
	dPs4Gmk7Yl9S+07B+Gs2XOzivZ0hCeexgZkbMZy1Wq+ul/Fq1gNCj8FXGojsZ9QacL+vAjjZo1ZtJ
	/Lmgke7yCChHck/dsLADSeoavNdcXwfYSdl6MTV/PKkhBPYQdJAk/69WX7miBGQoXatCXPDkjLtg6
	JjKpIeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJBR-0000000F3EB-2QCs;
	Wed, 13 Aug 2025 21:38:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJ6R-0000000F2DO-3Xbs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:33:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so1094425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755120826; x=1755725626; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcsR2lpNDjubFi27+my/+Mvy0uMimCUXPssMeKK9hBQ=;
        b=lrNFZwXKZSKxNSsRKy7FMfFV+YXI521WZeTb5k0WNqb5SNXaxqV4Li2CzfQyusdyJh
         342QXm0fZHzl4ys0Q9e8ohvmmrQ/ZRaQDRY6SixT59He1UOAzq1ErqherZP6FSbFzpe7
         zsuC4Da584KrqGKliFZDw+KVcylhCimSc9TRSyZwfjUbbM/AP3AuL+JHNVB65MyhlMAE
         lTmOGOf7tgoRJZkOxbr9atGy3WzqCQjncw7AtkADsxXGKQPTDjqm+DEzRolOkeWhKPvy
         7bPDjBqKecdeUuG+5I8+bIRhZfgmcGbcm2T4rzHN1HgNuwjuRH20m8mFhIfeETkZrkqa
         WEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120826; x=1755725626;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcsR2lpNDjubFi27+my/+Mvy0uMimCUXPssMeKK9hBQ=;
        b=NHENGG8Lo3xXD+PlKag54/ihR7EM/NyKGxhuvsJBkVrx1YUP6TNxgY/UmocdYP2TJN
         w4QaxSxbQ8cuidoP+/iPQkyAl4Dq3FsL9snHdOAVkNJ09ZEgwqzhZu9ucRXVQl8EAljJ
         SLduT7JWUR6UZ+IEQSXtpoH3vS0D/rBktEuExvasfHdAXhd79oEdVmy3zkB+eUH6CX4d
         IUp9u6AUBX0Ozic729ddRTFnobcq7jdigK5ZhM5zqnYq+Bwl1CKZ8CHgQpAUtgga4cmE
         76UcU4RXm/RxQVum4HoEdTCmNSV7a1pB6SLSWZf1+voNndqpVCA88uLcd077LLxbwDoB
         U/CA==
X-Gm-Message-State: AOJu0YyVqRzDJNRDgnrm5VzivgYmM5rOChMyKeKv0JlW97uImyD5HS7r
	HJBnKCG/N/xfiOo9tITp57mVmt+gkbGoXyOZexJp/seNN+g5Izxs0cjwrMaPd424CTI=
X-Gm-Gg: ASbGncvVg2L3etteMS6zvSalIGEbW4QfszqyfD8eZxyeYIyv2Ewa/E5x4p0rDnKkfaJ
	ZHYeXD9v6wEoCfn1rVeYM/u/cJuje41V+yGgurQyK4Nwrrx6cAU5z2bt42IRjHqzAjgWF3Yjxy6
	N5o9r0onun4zJp54lSsEZBU1JqJM7dpABJ7Ei1KtR1Mzb/3GGTob43aYoQk04WK9aVPgbkT3T5E
	tPKcq6HaCQtCXl++oZVNKNQjHrKeXz4APSPhS3DhHuX0nKjyipvyhGdNEJv6t7vqwlQn8RoLpPG
	2uXuW1seCEJCM8ygvoo2acl1yEsS1SD6PCQtionkCdNigCtqPR3B1hglZft7Sa0p95eH+iUvhiI
	cAEI2+rY45nWXKc6OtVG1ILUqC9z7LkektUmV91W0kD4kMRn9SCEL8mkagcNIMkwI
X-Google-Smtp-Source: AGHT+IFQrbl5wtElBhTcltssVqQElSDpYxXU1Tfejew44z/pIJJpOOHXcbKrIs4k71QsMA33PxUImg==
X-Received: by 2002:a05:600c:4708:b0:459:e025:8c5b with SMTP id 5b1f17b1804b1-45a1b674677mr2714735e9.30.1755120826249;
        Wed, 13 Aug 2025 14:33:46 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a53a5e3sm15602925e9.24.2025.08.13.14.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:33:45 -0700 (PDT)
Message-ID: <c467e3a9-2c67-4231-9d64-d64de08ec2ce@linaro.org>
Date: Wed, 13 Aug 2025 22:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] media: qcom: camss: enable csid 690 for qcs8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-5-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813053724.232494-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_143347_893502_406A408E 
X-CRM114-Status: GOOD (  14.28  )
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

On 13/08/2025 06:37, Vikram Sharma wrote:
> The CSID in qcs8300 is version 690, it is same as csid used in
> lemans(sa8775p). csid gen3 have support for csid 690.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index fc6a9787febe..664245cf6eb0 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -45,7 +45,8 @@
>   #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
>   #define CSID_CSI2_RX_IRQ_SET		0xA8
>   
> -#define IS_CSID_690(csid)	(csid->camss->res->version == CAMSS_8775P)
> +#define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
> +				 || (csid->camss->res->version == CAMSS_8300))
>   #define CSID_BUF_DONE_IRQ_STATUS	0x8C
>   #define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
>   						1 : (IS_CSID_690(csid) ?\

This really feels like it should be a property of the CSID not of the 
SoC but... anyway it'll do for now.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

