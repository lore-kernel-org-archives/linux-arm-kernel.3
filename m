Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC08CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzIEK6Y3mdF98EhIAvT8i3Drct8km1nTgvw7YT+e73M=; b=SuWWC4ESoScITAeBO1maUAQbyV
	zoWEPTvr/EzC1x0DCGOMCisubYqFdhw0Wd899TrJsXTA/SYEypPUwb9N+U2SyqIpf4FdobJkcRANt
	wj0SZUsVPsJxgqlnNdgjZINdcaOJKABgHobfEVxzLem3WQdg4P7aitZ5fjGylvuyI38Fo26+QNRgS
	bIeHG07gT8U5AxIUUti01C03+XYURrlHHDiyd53qBJoj25+vCr1lQqz8ZkR2vhnZ5tQ0QyCB1aHq3
	RDjZYnFqAqqL93o3GGLH/Gy0PzDxV+wtlY44JaBzeIOQapLS3mexX2mYN8+gromygXq+5tZIUptZl
	C9L0ck9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInb8-00000007XE7-2tQN;
	Mon, 19 Oct 2026 13:40:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInb5-00000007XDD-3WE9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792417213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zzIEK6Y3mdF98EhIAvT8i3Drct8km1nTgvw7YT+e73M=;
	b=D0L8gxaQxdb1v5Ij5XJ34uGtei/b1Yw3fwcbhwQwK7YWjmNCkmXNsUiqD91oBjFrSHBwta
	HyBJLltv4BuewVmf2DoWQgiK4TAwKzCbLS9cszQtsvUe3eJBVY7E8H1rzyoA5aopscCxYc
	5xddVhogK62QGUFe+1/LLnMj6iTmqcY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-dm5nEoA9MbKz4SqJDq1nww-1; Mon, 19 Oct 2026 13:40:07 +0000
X-MC-Unique: dm5nEoA9MbKz4SqJDq1nww-1
X-Mimecast-MFC-AGG-ID: dm5nEoA9MbKz4SqJDq1nww_1792417206
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so1438540f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 06:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417206; x=1793022006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzIEK6Y3mdF98EhIAvT8i3Drct8km1nTgvw7YT+e73M=;
        b=Uw2ExLzB34L81xSMukAfEjPg3fbNMNsdRqC59atRn+ZHCnGjWVgliKBIjJcFxZ64sN
         siXTg1Qu0RpnSZ4z36sbPSOpmjGqi8Vc+qDmRIoklgFOGLX8+KctSflbG5mJ9B+TQQVj
         36KvUPioc+GYSnjpJqiUeB41E/230VGD0Z0C73jXunYWW7miIZy09YZkiAwOMUtI0x9i
         7UdxfrIHf/bb0EjKGw3mfOHGTcPV6j+OrEQ6PplS4p5VmcusLfMjrFIcPM1w8Rw9e04V
         emSq3WBPKZG/w2K8Ju2C7hdiHKhaC4OlWB7HlxroKkrqrWjS+gaJ8jcOd7P3Edbjp2S/
         cV0A==
X-Forwarded-Encrypted: i=1; AKwUvBwkqOs3rM4GCqDAiFiCs+bEusaxkW7vVj74/9HiJ/gBsEAxLhmIw7ks1xdjEuWlrKWH5Woci8uvNpGTJmW0oZ+3@lists.infradead.org
X-Gm-Message-State: AFq9FYIlHsbJz9cK7dDoYyx9Bu6tIGnhdGHAUTADliPVAGiiJAGEsqJ1
	BROxRxbst7T+vN6tJ00YrR2BcFizouDJN6q2aWEEzjJ8RaciBflj6tOATf7xbmLn7SPEA+fXaJl
	yvxJ1lFzwxjSgwxOZqDEyU6cXzGrvSjZGnmA7Mltl1B/OB6B71WiRzoCZmoPYCgZkdgbeM3moF2
	Rz
X-Gm-Gg: AYBFou2S+onwguA9c5Lg4gDWOMQJaauq93fg8gNV+KjOiLSbqP1JIComiF+wprLmC25
	JlcWvkj18HbzD9tzJOxjjLJlCb0g3WK9By+KF5Kf/W3JtSdG59mx4terB2FL2SQOdZkkXFGsjJa
	QOfhnHO3bB/g+F4wFGaeTvKYMtpuFW1E/RNVQ9W/tV6K9I6R5UjjWN4nPC2WiC5xuer6rZh2sck
	isyrOruqMMEI8tC5tvl9QAhzgv6xRWEEB2j+Ml0Y/yDs5Q/dI78QxN5xUl54OH6CSAmntpLFuqT
	1DzBAJs8adI7ma21fhKTEsaicsLXvoTmJm+kDyu4zxonNv476nQYo/S9QrGkSawhinQWGLHKdW8
	fBr0MjZWn1Ol08815O1nPGT1nezsjor3CT1dVd6uvewampI/qW2dugzZLUYSZswgDx41hIJZVmw
	==
X-Received: by 2002:a05:600c:19d2:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4a1d76262e1mr160994705e9.31.1792417205029;
        Mon, 19 Oct 2026 06:40:05 -0700 (PDT)
X-Received: by 2002:a05:600c:19d2:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4a1d76262e1mr160991705e9.31.1792417202770;
        Mon, 19 Oct 2026 06:40:02 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc8ee409sm292224555e9.13.2026.10.19.06.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:40:01 -0700 (PDT)
Message-ID: <de6dc65e-04bf-40b2-b5e6-d7035d2f9b7c@redhat.com>
Date: Mon, 19 Oct 2026 15:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: stmmac: disable TX checksum offload for
 jumbo frames on bugged cores
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, boon.leong.ong@intel.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
 <179190522792.434549.2113659711683261245@kernel.org>
 <as5PVATLFOcTHbkV@lore-desk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <as5PVATLFOcTHbkV@lore-desk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SBY-teny9WqPPwWlYHIA762_WfhV70ngGl7wKuSKvrE_1792417206
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_064015_979784_9C660128 
X-CRM114-Status: GOOD (  15.50  )
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

On 10/13/26 17:33, Lorenzo Bianconi wrote:
>> Thank you for your contribution! Sashiko AI review found more severe
>> issue(s) in other patches of this series. This mail is only an FYI, in case
>> you want to address the nit picks below when you respin.
>>
>> Low priority / nit picks for your consideration:
>>
>> - [Low] The commit message's premise doesn't match the tree.
>>
>> Pre-existing issues:
>> - [Medium] This problem wasn't introduced by this patch, but
>>    stmmac_xdp_xmit_xdpf() never looks at priv->plat->tx_coe when deciding…
>>
>> --
>>
>> net: stmmac: disable TX checksum offload for jumbo frames on bugged cores
>>
>> This patch turns off TX checksum insertion in stmmac_xdp_xmit_xdpf() for
>> frames longer than ETH_FRAME_LEN on bugged_jumbo cores. It is meant to
>> match the stmmac_fix_features() workaround that the skb path already uses.
>>
>>> The XDP TX
>>> path bypasses that workaround, so once XDP is allowed at MTU >
>>> ETH_DATA_LEN, jumbo frames sent via XDP_TX or redirected into the
>>> device would leave the interface with a full checksum insertion enabled
>>> on those cores - exactly what the workaround is meant to avoid.
>>
>> [Severity: Low]
>> Can this scenario happen in the current tree? XDP still can't be used with
>> a jumbo MTU. stmmac_xdp_set_prog() refuses to attach a program when the MTU
>> is above ETH_DATA_LEN:
> 
> This is actually a preliminary fix needed to remove the MTU limitation when the
> device is running in XDP mode.
The point is that this patch does not address any issues, no it should not
include a fixes tag. I'll drop it while applying the series.

Also a more explicative cover letter would have helped.

No need to repost.

Thanks,

Paolo


