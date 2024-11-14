Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD4CD6A226
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+act8H8vBI0kssh+d2SqywPLeFhuuqkPtiKdY3nWas=; b=gVzf5GJPpg1kl7NcYQ5UU+nRxx
	UYrvCUCOb3iVpdKpCFQIRmYhxiJpP3x/hWCgDlfoHe74mO6Ykbo0ikshlhrJaLo77ZUIf4FaAW2Fi
	zVy0UMcKVcOM960kSEpL0a+MqpsdbxdT+nrDM9+RUP40GZrf+7msLv2MqZnWbNgr0DkuHPJ6685wL
	9xjDtYaxjebsHWKsRR9nwqX1mfAMMWeEV65RAPxm9yUq5w9l+gaolYeN95H67CNN6ig9NJjlaEdG4
	xIKby+ykNAFhuVXTsqCxsgR8z+a141aF4SmKrjDbde5sR+0Om4ttgLlwoqxY0T2K+xvBadRBb0q05
	soRasM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBezU-00000000XSB-34YF;
	Thu, 14 Nov 2024 18:54:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBeya-00000000XHi-1sba;
	Thu, 14 Nov 2024 18:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F+act8H8vBI0kssh+d2SqywPLeFhuuqkPtiKdY3nWas=; b=Q3hnrySJxpyM9RHt/1VjpPFa90
	+770ZIVtEe+h4X9JIVhsl6mYjHadQCn6RN2Co0Fzo+nxBmfzDOW8UoAiXsdPUAji/b38SMdhuTWUW
	/c6G+tHXdR6tPn13yxsL23Km+iHpRoNqB/DlPsWhZkvtCgs8HKtTMhX7A3PgxHOLOA4FK4gIl8QDW
	qZqexfNN2GOKF7Xgar5SM5NtBPejqy8iVQTDmxV6c1UC0IvAPGpWHf0J55QCmLJR9lNMUE7h8odvQ
	ORn2yPYl5Z6bdloeQPPAEZFd/UQh1+MqsCBXQ//7rn4H92YmjYft2WZemoBjebXPfzgUQck3WJ0+l
	EjpX28jA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBeyX-000000009Ub-05DY;
	Thu, 14 Nov 2024 18:53:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso9174165e9.0;
        Thu, 14 Nov 2024 10:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731610429; x=1732215229; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+act8H8vBI0kssh+d2SqywPLeFhuuqkPtiKdY3nWas=;
        b=krEALQD1cDvDXHx1M4kbIYvUMRpS5VEdYyHNyqLPCj0EjAKeXHS+G1YevbUMp1feC5
         11w9tclXBTwd4Mxy0WlMbQwbII+FtDhCmd8JVykC65NH0yHTeNkyO63aFDJZD6EWFya+
         ckc2wCm26dQjB3iVW3f4RumhcbrNjJ4IWyZ+86lFYSiAKN3L/dArJC0LleGnrJ2V4zkf
         h/byFdOD1Z6Ac1Pwh9XV61m6b3fD3tES5x41WRyWHg3CQkdfxQd+SAIX/+datZVpiROd
         UvYY5ELMk5m19hrHfYNRHUXUK5hCvP7WwvhXAg1hhgd2uDBnF9AtcN2+9fN0xRpzqIrZ
         +Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731610429; x=1732215229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+act8H8vBI0kssh+d2SqywPLeFhuuqkPtiKdY3nWas=;
        b=spNukcaaiK43vMXGeU0cxRUY6XxX/d0FhlYpK73WA1ouJP4fiTuL/CuE5CZnGGPsyK
         yfaErHediyPAi2hwTozStNHFNoDs1NVoa9KrSaxhrNUCg+LZnZ9fGwjtzJ4s9/u93yPt
         eSUhaUxjkjFXF005RztZHLnJO42k7sHEJPDmgnwixJDtBg7UsLVL8yyZPAVkcyUCsPny
         zR7cxkmtpGzwvZWb7KXNjF1g2hVylFegSz3DbCRuDqtbVpajar+92lFEgrMCg9jXFhR7
         6gI+LXAmGrMxnUsrTG4Rr1TjfXRtAYkI0kLu24yYuYovY6PHIlMKLrvTyY/L2rqazQuo
         FYtg==
X-Forwarded-Encrypted: i=1; AJvYcCWklt8ti6AsrE6XKNX6No+JZBg0ckGY+ssMX4laBO1Y1RfKKwUNEvQcuOmzVbX4H+PdVn+9KnwiiGlO/a3eEqDm@lists.infradead.org, AJvYcCXbuaCl8LYdiHPNtPNf5wrV/HInLjkfGGP/A6RQn/f+oWtCA+nwItOCMHGfuV6hLAHB2PUvkEpLqn8D3qhp+UY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt6ioAu8wz83O9wzSYavsOagP5sE07OJKfOW2GA+TOkjluI+ql
	9AUXAvNMc4HO/L7iq11Z9rzoNc4EZ1dCN5M+yqzQIm8tXc9EEPc1
X-Google-Smtp-Source: AGHT+IELUfVKeMhRwtzYKmzZRv1LYcmCpcb3hbTxVOGXrsYtHnsfVttlc2lV8lA+TvnfMtpATpXodQ==
X-Received: by 2002:a05:6000:1785:b0:37c:d244:bdb1 with SMTP id ffacd0b85a97d-3821851c6a4mr2752224f8f.26.1731610428830;
        Thu, 14 Nov 2024 10:53:48 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adbbc44sm2208283f8f.45.2024.11.14.10.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 10:53:48 -0800 (PST)
Message-ID: <6835fde6-0863-49e8-90e8-be88e86ef346@gmail.com>
Date: Thu, 14 Nov 2024 20:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v2] [PATCH net-next v2] net: wwan: t7xx: Change
 PM_AUTOSUSPEND_MS to 5000
To: wojackbb@gmail.com
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com
References: <20241114102002.481081-1-wojackbb@gmail.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241114102002.481081-1-wojackbb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_185353_259461_010B78B2 
X-CRM114-Status: GOOD (  17.97  )
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

Hello Jack,

On 14.11.2024 12:20, wojackbb@gmail.com wrote:
> From: Jack Wu <wojackbb@gmail.com>
> 
> Because optimizing the power consumption of t7XX,
> change auto suspend time to 5000.
> 
> The Tests uses a script to loop through the power_state
> of t7XX.
> (for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)
> 
> * If Auto suspend is 20 seconds,
>    test script show power_state have 0~5% of the time was in D3 state
>    when host don't have data packet transmission.
> 
> * Changed auto suspend time to 5 seconds,
>    test script show power_state have 50%~80% of the time was in D3 state
>    when host don't have data packet transmission.
> 
> We tested Fibocom FM350 and our products using the t7xx and they all
> benefited from this.

Possible negative outcomes for data transmission still need 
clarification. Let me repeat it here.

On 06.11.2024 13:10, 吳逼逼 wrote:
> Receiving or sending data will cause PCIE to change D3 Cold to D0 state.

Am I understand it correctly that receiving IP packets on downlink will 
cause PCIe link re-activation?


I am concerned about a TCP connection that can be idle for a long period 
of time. For example, an established SSH connection can stay idle for 
minutes. If I connected to a server and execute something like this:

user@host$ sleep 20 && echo "Done"

Will I eventually see the "Done" message or will the autosuspended modem 
effectively block any incoming traffic? And how long does it take for 
the modem to wake up and deliver a downlink packet to the host? Have you 
measured StDev change?

> Signed-off-by: Jack Wu <wojackbb@gmail.com>
> ---
> V2:
>   * supplementary commit information
> ---
> ---
>   drivers/net/wwan/t7xx/t7xx_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
> index e556e5bd49ab..dcadd615a025 100644
> --- a/drivers/net/wwan/t7xx/t7xx_pci.c
> +++ b/drivers/net/wwan/t7xx/t7xx_pci.c
> @@ -48,7 +48,7 @@
>   #define T7XX_INIT_TIMEOUT		20
>   #define PM_SLEEP_DIS_TIMEOUT_MS		20
>   #define PM_ACK_TIMEOUT_MS		1500
> -#define PM_AUTOSUSPEND_MS		20000
> +#define PM_AUTOSUSPEND_MS		5000
>   #define PM_RESOURCE_POLL_TIMEOUT_US	10000
>   #define PM_RESOURCE_POLL_STEP_US	100
>   


