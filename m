Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9C8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 02:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6MgoXC4jIcUDKauhvWR6PqJ71dM5+J5YjsOoEDTJlo=; b=P0BEs5ATpeWvAy+UiQFBwwcdF7
	ArvjSvEw7lS3UlZPGb3AYhrEfsI+fAPFuU5+hUYFwUFbLYHhxyDVuIaCQcGTzhIEs1f81EE4+2EUL
	CxOSppeWUIbo6+mfwks7/1NBtPLfW7CjZNDGrPIoAZGzVwkyJTUdkhwcVXuSGrL3E2S/IyBGCKaOe
	nHBkV9enqFLTKX/qiJ+7V5TURmwC0K82VeSAk1IESxw37Hs9A4uNCu1f9b58zE0uInnMxwTns4hdJ
	z8ek7ORxXUV/TfF5acoABIkuiPh7kSvgnPH7uv+Xk+tv9YF+JNrr6WLzyN8NbD/MsPHGk2w0SBZso
	9I6IWU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6rd-000000080Co-0QV2;
	Mon, 13 Jul 2026 02:57:49 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6ra-000000080CR-1UBT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 02:57:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8484f229529so1227911b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 19:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783911465; x=1784516265; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6MgoXC4jIcUDKauhvWR6PqJ71dM5+J5YjsOoEDTJlo=;
        b=SlTSxb9d7Ql5If3pXFs0mlyOENsx+qjIOHaVxYd95jYxNF1x4lmli67XNSQ6U6Yuqw
         l3txM2sGPTEiFW/8R8/lDcb54Uyn8HDrqwlintxnyrKURk0eVqj53sxhE2OpNRZKK6mb
         VNLwQJ3td/Owla0DHEh9/LGPeBL/YgXMdsUr6MaWywhOWPJK4uFiNJT+W0+Wl2uOwgCR
         ZgYUxMKmGs8kw4Uz23NO3ob+GUu+vD3Gzx5tAqKzDJWa4EXTT9dYFXivNfzVg4de4wM/
         avmVKtMSHpOGo/Qx1bN0Op5Wl5Mpmp3WcbReu08pPp7nGbXPnJ9U+yN8FOemoyeTAITh
         MBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783911465; x=1784516265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6MgoXC4jIcUDKauhvWR6PqJ71dM5+J5YjsOoEDTJlo=;
        b=T7uTsLLYbdXlD7o9e+Sl5NT0+tJWzIH8s+wpG8b618c8qtYkHqHD5+peB5bQ/cOtm9
         5YgkdDu1i+d9A2t7Q8r9l35ssqAKQnrYUUni5/bT+/DIOuc7jCHORf4/9tb3odg0IZ7g
         KgSkH1AVE9e8ryPKZVrP6hnpKZfqGDuAm47E+fsE2QfoOErnXbtZ6O8TGYBOHhFtcmPX
         SBkS8n7OY+IizK3lFtokdzKj5qWDG/hN7rMn3BZ0EKe0bTYHCz1q1vt06x4cb7+Qmz+l
         9S2POcfEl1hrKlLSXdVw6+5/kdEJ8sCkz3dFxtp2pQ11l4q1Z5Mf4AaKJyn/QyQrMkmc
         wF1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrIessoXXJXF4ndLRjoW1ierwPL83WsJhR5+u9qJgYVUi9QaWKvS6J16aNwARHUmY4DAqy8JGvLkrlZwSfhE0YF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkd39DzlP3leBPCRFG7eDMXRcZn2qbuC9ugZrjmn6YU0nDsExA
	QVWU+qgfe6SmZFsCkQMfH/lKvNTGRchnkCDTL0PuhxRzrw9z21yqeMn0
X-Gm-Gg: AfdE7clq2fWpYdXCa4RBrmcO8miHjANIyJtqeVg24Up+OObdw88QhRhrganxlym5UQP
	fweP7hbuIyK8UnxxXgUqvkuyCLt9wWxFEf4k35m2lp/ihryNaU0VRZW1faHtYFyxf5j+7D5nhQe
	6kZMs11IR/DthRmpmtGKbGXf08ScuygxCbbrU7v6oOrrh6p4K8jtq9a3T4M22N3fsGgcps5/RNJ
	h/R7XgtwZAwzvGBfckBjtKzwmPnmYx+M9cs7qhnY5Xp/lizDMj0pKJzIL5idfMyiwZwqeFA7W17
	PQLD8vAoDrNFuzO08h8BKKtRxYCW/ChMG+nehHOME4E1LYsaQy+vyMkQv/4owPBEjzATRcIndWl
	o/dqIKd3crxO7R16mBIQju7EfZ/SIBfcYplhWMjZL7fzQVQfkXRI00I0wv1onU1gfwzBXoLuRQZ
	jIr/VeTWhB5QSrc7wp51qFcHaf4tLdFa1JaGePe16aDurCoUdPnw0+VCC+8jqnaaqNDky5FA==
X-Received: by 2002:a05:6a00:909f:b0:848:2f74:d8cf with SMTP id d2e1a72fcca58-84889833b4amr7034427b3a.64.1783911464761;
        Sun, 12 Jul 2026 19:57:44 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm13503512b3a.60.2026.07.12.19.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 19:57:44 -0700 (PDT)
Message-ID: <825a3a1b-8891-4172-afd6-8de6077fa129@gmail.com>
Date: Mon, 13 Jul 2026 10:57:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Arnd Bergmann <arnd@arndb.de>, Zi-Yu Chen <zychennvt@gmail.com>
Cc: soc@lists.linux.dev, Jacky Huang <ychuang3@nuvoton.com>,
 schung@nuvoton.com, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20260708082457.460710-1-zychennvt@gmail.com>
 <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_195746_406973_8DD09D81 
X-CRM114-Status: GOOD (  33.15  )
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

Hi Arnd,

Thanks for the clarification.

Shan-Chun and I are still maintaining the MA35 platform.

I have reviewed this patch and it looks good to me.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

We agree that the current maintenance path for MA35 could be clearer.
We will work on making the MA35 maintenance flow more transparent.

Thanks for pointing this out.

Thanks,
Jacky


> On Wed, Jul 8, 2026, at 10:24, Zi-Yu Chen wrote:
>> Add controller nodes for the four Bosch M_CAN blocks found on the
>> Nuvoton MA35D1 SoC.
>>
>> Additionally, configure pinctrl and enable CAN1 and CAN3 on the
>> MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
>> the CAN controllers receive the required input clock for 50MHz operation.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
>> ---
>> Resend note:
>>   - resend with the complete Cc list; no patch changes
> Hi,
>
> I don't see anything wrong with the patch contents, but I think you still
> have the wrong Cc list. You have sent the patch Cc: soc@lists.linux.dev,
> which is where maintainers should send the patch when it is ready for
> inclusion in the SoC tree, and you have sent it To Olof and me.
> Olof retired as SoC tree maintainer a while ago, and I'm not going to
> apply this because it should go through the Nuvoton tree maintained
> by Jacky Huang and Shan-Chun Hung.
>
> Please send future patches to the maintainers that are in charge of
> applying the patches, without adding soc@lists.linux.dev yourself.
> The maintainers will then forward it when they are happy with the
> changes.
>
> I just noticed that we have two conflicting maintainers entries
> for ma35:
>
>   - Jacky and Shan-Chun are listed for the ma35 SoC, but have
>     not sent any updates after the initial merge in 2024 and
>     don't currently have a git tree in linux-next
>
>   - Andrew Jeffery and his team are listed for npcm with
>     arch/arm64/boot/dts/nuvoton/ listed as one of the file
>     locations, though that contains both ma35 and npcm.
>     Andrew has the bmc tree in linux-next and has recently
>     picked up patches for both npcm and ma35.
>
> I see there is a lot of activity at the moment working on
> ma35 drivers, so it would be good if the maintainers could
> figure this out together and provide better guidance to
> individual developers. I don't mind pulling from one
> team or the other, but I would definitely prefer the MAINTAINERS
> file to reflect the actual state here.
>
> If Jacky and Shan-Chun are planning to do the merges going
> forward, they should add their git tree to linux-next and
> update the MAINTAINERS file to list the git URL.
>
>        Arnd




