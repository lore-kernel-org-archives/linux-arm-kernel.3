Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F06ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf9WqLb4fMZEFph0jHkD9+f3W/6St7LAtSwXtmX2PL0=; b=lIYc5MDAprZZvFTKSvj6NwRbq3
	7b9Dy7eaH9QsCgROHqmZzu7mJJXgI8P1YbHZWIbn7IjNrFvb5mzkeFU9WyPlRLhHHLT52xUFi+vtD
	ELNFCXpl+vGS/0wb2QS8iEuAwmP9K0m46SGt65Tp+M0R/T7YKWYXKZgjtd3mkEaO0/fKgtvf90153
	F3tWVu5T2wT7Pl9xY7E5HShVA+kZvkPTqZ49kjCcuduoqrKbikKsipp+wzPnOryM8x6X2DVQ6idWk
	4NqyL1CCYnuLQHi0cblRasJicu5u5zYvHq79k8O/9RP9mybgTXuTp7rDdT12op6ACa3QMt+7MUKhO
	4Zz3tRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0BH-00000008JDN-1q3w;
	Fri, 12 Sep 2025 09:34:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0BF-00000008JCH-1Mt2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:34:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45de185bf68so1410115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669695; x=1758274495; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zf9WqLb4fMZEFph0jHkD9+f3W/6St7LAtSwXtmX2PL0=;
        b=EOGvpmre+7KuJOhGNxOAxVHRL/lCNHPB8AOGznSuv57ExYzM6YNXYiTHUHWjCCGMkn
         f/ZAX96D2TT9jkltnlykUXSNOLIeQY3O3Bc619qsU7OIr9lfBQjukZEvUMFY7hkvUn1X
         kjyjE64KTH56GPZCKeLCLIRgY6xnawTWKUQXTkZoIErIHvj5TUz643NywNXjArPzb7Bx
         RkhilD45a6k7cJ1FUTdg2bMzD8MVpi75pJ9rRarerhfy0f8If0krJbdT1BDTrkcXUPou
         nMZXN0WPwpkdmPJaAtyehufMyvoMAIe+PmyZ1RdwweWn+4LR3Vg3c6+bs2+kfpDXYrrb
         DM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669695; x=1758274495;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zf9WqLb4fMZEFph0jHkD9+f3W/6St7LAtSwXtmX2PL0=;
        b=rgOKTTMQi7xEEdofvqHxw6RNMoAkGsQDAsP7XSrKJsr/abuBPHJnk4V/gpvRn6xK1P
         Dq5RUkbEtnlHJR4hCfRAlxSlP8L6a0s/ZSMKroWDvx2LJc9/zPHjf/LzcMNmWfZfMMha
         xS2qoygE8PFEIye1tI7uigxgy09rrrWejEAhVI8laCRRf4+bLG/BQvdEc8utqMPemo9g
         BTE+8ar14OTYgWmO2B2EF7tGhL4mNfzPcjq8O4Zfs5GcKLE7+RSFnCKYFhz+vp4JHD1Y
         7TtVfVBJlONwIFjkzM2IhYxdBtTE32LqztmwLrYRIZbQslYQUABbKEhcpAg9F/qz6mCj
         OKdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWSDby2wsKKDExZQ1RT72YiZBYaruNM0GRfJNgvZASncJ6DOnP3RtgB5mhHaD1NV8RvUswMhjAT6eQJeyaDjQ+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw8aEsryIiVAv1CZK4vp/yzuIhfZ/WrmU/r43x7pGkcuyfUgoB
	fjeqXilrVJ9aOTClp0zO7P4L1UT2nvuv4QBBpGONH18BmyOV594VpU4o2KyEwrIZS40=
X-Gm-Gg: ASbGncs/w6UH+Eq7a/3ZpdWN49ks3ra99R5g4v9NEhiJrKsiSqOnwpYovAnDRBr/5wB
	RYoAvfcLpbdvDFvNnKixH5QUO9d2WuBQUQ80pEgyk6IlxKG0RrJR+0IeRTC5PpXiQYItDtzBxRJ
	Blp4/axLuoOYj78DNXd7szNO/8rosOKVFwHRMSJP2WJNtVPODBG9rnSguhH9A+vxcUME+ifPoXS
	CBdUgh+OD3ewRoomSVA4Y0ha65rAkxyfxYGs/neCgu3RInk/U3ary4osvGgyy1nqJWR7Go5sRG8
	7DPGhek3FtBhO8C9PNWOa8UngAMmnIsbQzskmUHj9z6xYmpbA2ZE4SHnsPJ+WCu1c8ZkEPfQK+l
	k0uVoS3QY28WuqQ/SQVskqsBbRoOPjK3uFW6b5hNMITKWwzKePOKJyg==
X-Google-Smtp-Source: AGHT+IGjXFRlSmZcHZGIXD5Id9GFvrzWUXYRNPBHL9G4yT0TLddXsGiJtkt4F6BcP3pf0TZ8fGw5tA==
X-Received: by 2002:a05:600c:821b:b0:45b:8a1e:3b83 with SMTP id 5b1f17b1804b1-45f228d5cadmr8419815e9.8.1757669695226;
        Fri, 12 Sep 2025 02:34:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0156abecsm58835185e9.4.2025.09.12.02.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:34:54 -0700 (PDT)
Message-ID: <c5df4196-b951-4f8e-b2ca-c63fba63d1ee@linaro.org>
Date: Fri, 12 Sep 2025 11:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Simplify printks with pOF format
To: Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250912092423.162497-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250912092423.162497-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_023457_396135_22DB6497 
X-CRM114-Status: GOOD (  14.49  )
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

On 12/09/2025 11:24, Krzysztof Kozlowski wrote:
> Print full device node name with %pOF format, so the code will be a bit
> simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/firmware/arm_scmi/bus.c                | 13 ++++++-------
>  drivers/firmware/arm_scmi/transports/mailbox.c |  7 +++----
>  2 files changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 24e59ddf85e7..c7698cfaa4e8 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -401,8 +401,8 @@ static void scmi_device_release(struct device *dev)
>  
>  static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  {
> -	pr_debug("(%s) Destroying SCMI device '%s' for protocol 0x%x (%s)\n",
> -		 of_node_full_name(scmi_dev->dev.parent->of_node),
> +	pr_debug("(%pOF) Destroying SCMI device '%s' for protocol 0x%x (%s)\n",
> +		 scmi_dev->dev.parent->of_node,
>  		 dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
>  		 scmi_dev->name);

Heh, I misread the docs and see now in the testing that my patch changes
the behavior. of_node_full_name() is just node name. pOF is full path.

This might be desired or not...

Best regards,
Krzysztof

