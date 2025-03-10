Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7939CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGB61au9EEk11/47YvWNrV6VgtI7CN4so6SIXkNbToE=; b=Zd0xa4rUEDooIpy0FaMFogUmtv
	gUK8ngLKV62SWc2NHy1hvQyf7dby8LzouGzuIxpjJA1pWLVXrBDD6KCfpNHxT4N5grBE9JQyiKYKe
	EAmWyCcjYjGduzY+To5Jpd2VXsSZS2k2WzMMwqDDPM20W/KPHT7JHfKteo1YmSF/rdPdETDUnBlf7
	MwxxVSGiwIaG+DHpn9osxN5MXH3tQc6yUoCRv9Q6kp6Oe5TxHI5ajF8ECvXwg7FL7m0kqr5NNu4wq
	ruFszQw6axwk6ppekranSVtGoSNu3myJ0+9RXmFasWznMa8ytR7o5kE9eq1AcBd9Uo5yMEPpHMjPL
	q34Uzj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZhf-000000028O5-1w4W;
	Mon, 10 Mar 2025 09:45:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZOj-000000024zI-44JE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:26:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1867975f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741598768; x=1742203568; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGB61au9EEk11/47YvWNrV6VgtI7CN4so6SIXkNbToE=;
        b=WW40wActXJ/JVd0pcCSYPHyyAm4LLEQh81bqob6jf5xtV7VoKtQnAFA8SDdjsy1PHi
         GS7zP+iWzzuLVxV2SyHqUSf5lUrKrlza98JLDrunBLzA8Y89/R4VSP11Or1C+uNGIuF4
         4oJgdIHjxXJixn+5wSJCW93BQqwj4jGWVh6J8DV0l7/CwSFXVuobyMfTBCc6MAvL1Z6u
         c9OJWcwxGHuNbsb+lG77AB5CczZE0ftySQwY5HiZ9vHqU8fxB/dkH4heZFfjdXfPELIJ
         loC+lbRLPzAScvKMrDB3GDvdA0wf5bzgLRrKNPgs7hNOPuKVXNa0HdC2psei8Tw+bdUm
         49Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741598768; x=1742203568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGB61au9EEk11/47YvWNrV6VgtI7CN4so6SIXkNbToE=;
        b=tQVOpKAML7/DDjkJFO4ztHjVDAwwSde9EJBwPJjCIm0egfwtbrI9J7BbhyxIjnfWZq
         91Gf1tBtpauuBYQQ3xoCF771lCTxs1SQspcg4Lwd2y+VoDOdCRonkCQxA9qi77gpQ872
         Q7084A4Z9XhJnWhGvzelIuR7AXtIRyBIoXTH2w23TAecT1YhmdGdQDrU2dZ5jCMpzG8d
         /+vc7Zfix2FiIdpffFFhu0hFJJkLWNdIzPBLgTr6lG6XsHqNRtu5/OVANEN6Y5BOsAv2
         NFg7HqNgWDLM7gg2T13eGTP3zvKE7EKOD/+kCivCLy967ef/paa7PiIU7N9GiDXhFhR5
         S4bw==
X-Forwarded-Encrypted: i=1; AJvYcCVDYxnQppYVhh/Ult9v30dXoNUBLD3JRG9WMIAZX0s/Ou/xADYwot5BBqD9GGC4y/65kbbVKBHK2CK5fbz0JdaL@lists.infradead.org
X-Gm-Message-State: AOJu0YwJFmcyeajrhm8P8+ACCxTJ/z10u5w5M57X4rk3L/ye4zpkrMYl
	GWXQ/dwwkufk2UTHR3Aur7Vr74LZZPtLT1IlgQPUumEBGE+Efze7QJ9VQ9AeTWE=
X-Gm-Gg: ASbGncsLhqePnq3PTiDRu2nueSJPholueGcJWUALUso2X+VhYerFb2uSIeHS73//P3x
	ByNrZ06e3pBEd3oNoHlmzRO2g3qN1+e+Z/XYXDuWgnyclp16E3BmqEBv7MhyA2tTpwMJA6PCCsv
	iRjbX3iY+w2HUmSbQ3MhZj9EOlAah/mZWrfGFhylR01hvSn6tyRiY87eUsaAdFw0o1eAUu4wYJt
	/RzZQ5ASRyaE+MG3Ho5UgV2m60KggeLLyI6qBLt7umDaeyPpNYS+QZ8Fubu9SrsQjIv8b+RHNXh
	Yg6EKBm/Min7Jxm6y/5FN7c1x9S7nugnVQVjZjcAN/AZy0m5IkHdwA==
X-Google-Smtp-Source: AGHT+IHryabbGhXkC9Vb4Dl3n+sRYRJGNrbBaByC+g/CDOqA7aTuvCvu/OJK9Tr3atCxJvZm8QWu/g==
X-Received: by 2002:a5d:47c1:0:b0:390:f6aa:4e77 with SMTP id ffacd0b85a97d-39132d3a8f5mr8462588f8f.15.1741598768044;
        Mon, 10 Mar 2025 02:26:08 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2f39sm14097826f8f.80.2025.03.10.02.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 02:26:07 -0700 (PDT)
Message-ID: <282d3519-8ea6-4a42-97e2-d4cb9ad80c96@linaro.org>
Date: Mon, 10 Mar 2025 09:26:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: Remove unneeded semicolon
To: Chen Ni <nichen@iscas.ac.cn>, jassisinghbrar@gmail.com, krzk@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250310082628.845544-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250310082628.845544-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_022610_018596_1E836D40 
X-CRM114-Status: GOOD (  14.66  )
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



On 3/10/25 8:26 AM, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

thanks, Chen!

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index 20049f0ec5ff..2320649bf60c 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -57,7 +57,7 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>  	if (msg->chan_type != EXYNOS_MBOX_CHAN_TYPE_DOORBELL) {
>  		dev_err(dev, "Unsupported channel type [%d]\n", msg->chan_type);
>  		return -EINVAL;
> -	};
> +	}
>  
>  	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>  


