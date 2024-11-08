Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F78D64088
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=975RhISS9snOVR5cT+Z99sFnn60KIbe7YuBqYHMl/W4=; b=K6pcWk858jHy2t2aX2hfdHVzIN
	apKDEDdyxfTKnlwepqaKBAUrI/YoEJoBnuYU2t0RpaM0raBGO01HgCDpj38IkRmkVyl1Bx0BZ9OEC
	TDHJpexi7IpcDq1KKYWLSnZfrZWgphw4Tmdvt+523WWd/riVoaw8QskXQR5wZN/Voz5SPwq5HGWQ5
	kZIrKhtnH56vEbznOwOjG6jHQF5W+1opaccFw+2++MNjhpmU+5zPiKrj4DGEAvs0Im6ICg9XZ8FEp
	BUnzKoEQlR7YcQ+B7YZ8O2fmB+1KYfwvYo5VSVoNxwJV4DY2Tv6IeiVQ61t3wHI1TFSGgehUqVS/f
	lVWCJZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ViI-0000000BuRH-2ujQ;
	Fri, 08 Nov 2024 20:36:14 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VdF-0000000Btrm-2cJs;
	Fri, 08 Nov 2024 20:31:03 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c941623a5aso6351749a12.0;
        Fri, 08 Nov 2024 12:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731097859; x=1731702659; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=975RhISS9snOVR5cT+Z99sFnn60KIbe7YuBqYHMl/W4=;
        b=VqZ2SrqkBkTIAOJ/1uhwVzAbnPND0gJgJZcEd/4SdptcvjvUr8QDWPA/JUND+pQAw9
         3DrY9tsZHMzWGz6cgOa7MBVoATuGi91JAw6a3nakBx3uX8ajZoBJcY91obdSAMxP5opu
         Jv42nPNSjAjCFiafaUoDRXAA8FJk1XtSrkBTMdk5OJqKF42kdCWlz3gH2ss/FuPsA9Sh
         qQJ3ilez/RcvsrNIlGsb2NaakjGbcyaJ9BSwJH/R1gIUS61zqqe0G/EgZ6Iia7krYRMj
         PZ6cOm+RL3HoIpaetaDjjzpOTyjfvT0ldzEW0XwrQ4tvq5sULviibELQ37OuDi+2TR+t
         CvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731097859; x=1731702659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=975RhISS9snOVR5cT+Z99sFnn60KIbe7YuBqYHMl/W4=;
        b=JvsmZZ+H7eIyyGa7HSREvKjB5bTlM/MSogXaZ19meckz/D5bc0YhIQHYbL7r4rEFoP
         9t3Zb0pzSICfyftxW0UOZeD0G5byAM1ywaVlw4rOh3dVpEC8QennHEeRz512q4QPu3fQ
         wPP+Fi01tKcTV8zN5qITO5TxKsfJkI48PWpNsSOJAk11BO4PVXZex8OYhUyWfWMkR83E
         2bdffqIyjyt6FwGBP3f4/CeMQ2+5W9y4gCkSgd0GlbloiH98KxSlVQQa/dxOz9UeDy3X
         wuizBWcQ7VtZWuGVvuEz4Cg+wrlrFgIMrNkk6CKY7E/iCKZ6mnO/6eXrfrGIPHiwm3GE
         521Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHMpZDwV/8dGdu5mGmzo2veCXkXDOuPeJofWjTxflL4SGT4RTuXGhQzF5QQo9lLO2xhW28nhj45ru5zF8A84DGfw==@lists.infradead.org, AJvYcCWLGWVs1fXkdZlZYpQbCGT7nvCSqr8TZuKm5NuvGk7ezlhWX8kiQSYXdybY03l3tX+KSZQo9URJCf+MqzL8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8YW5i7w/Mt7Kqw6Dr65CjnNJIEngVjxv95q08ANs74fAIYOwk
	tlv8zt/SFhyC9zXygakLES3c2SyRc6ec4cAk+U/IuM4Jy/ROZRzB
X-Google-Smtp-Source: AGHT+IFnA8B3gdMncl9joVkiKED9mz5HN7VDKygr8RmfOVjjuIdQIDKMdQdT9VxpfjiqrYuVhJu+RQ==
X-Received: by 2002:a05:6402:2552:b0:5ce:c7b1:e052 with SMTP id 4fb4d7f45d1cf-5cf0a49307cmr3860824a12.9.1731097858843;
        Fri, 08 Nov 2024 12:30:58 -0800 (PST)
Received: from [172.20.10.2] ([37.63.10.207])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d7c3sm2329997a12.16.2024.11.08.12.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 12:30:58 -0800 (PST)
Message-ID: <d5d3f934-4f1c-43d9-aaf9-8de194d1f3b7@gmail.com>
Date: Fri, 8 Nov 2024 22:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: clock: actions,owl-cmu: convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241107143431.728669-1-ivo.ivanov.ivanov1@gmail.com>
 <a4begcrmbtotl2imd3eaxpdveagvwridy6ev5zmwzvjqt3ovfq@wyj2dj73xe3e>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <a4begcrmbtotl2imd3eaxpdveagvwridy6ev5zmwzvjqt3ovfq@wyj2dj73xe3e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_123101_702916_0E37CB5B 
X-CRM114-Status: GOOD (  21.02  )
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




On 11/8/24 14:16, Krzysztof Kozlowski wrote:
> On Thu, Nov 07, 2024 at 04:34:31PM +0200, Ivaylo Ivanov wrote:
>> Convert the Actions Semi Owl CMU bindings to DT schema.
>>
>> Changes during conversion:
>>  - Since all Actions Semi Owl SoCs utilize the internal low frequency
>>    oscillator as a parent for some clocks, require it.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation: Please add
> Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
> or above your Signed-off-by tag. Tag is "received", when provided
> in a message replied to you on the mailing list. Tools like b4 can help
> here. However, there's no need to repost patches *only* to add the tags.
> The upstream maintainer will do that for tags received on the version
> they apply.
>
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
>
> I cannot add other people's tags - toolsets ignore it.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> ...
>
>> +maintainers:
>> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> +
>> +description: |
>> +  The Actions Semi Owl Clock Management Unit generates and supplies clock
>> +  to various controllers within the SoC.
>> +
>> +  See also::
> Single ':'.

$ rg --files-with-matches "See also:" | wc -l
110

$ rg --files-with-matches "See also::" | wc -l
94

Having 94 matches of that out of all 110 definitely leads me to
think that this has been done on purpose, and is still being done.

Could you elaborate a bit more? If it's wrong, then shouldn't we
clean all the other bindings from that mistake?

Best regards, Ivo.

>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>


