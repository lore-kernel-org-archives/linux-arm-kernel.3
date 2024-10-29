Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B05BD5B85D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 00:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18M5G6gmC2uJZssfsnK5gMVxO3whYHwKOs0IPtJ1EAc=; b=U3FO6GL2D3F9+Q2ZWpfqTz0fy9
	88B8IRDAZJhD7y9zULxDi9scSXvG1bkD5Diir9uLWpIkCFjVcIRL5LHjgNlXm6abRnES6/atgp/0O
	4euWT/2j5Vha54r6k53VhxZrTUTLrsDPalq3/66JC+FcyHg6JOtuI/eOLYStmE65CGpvHSBNMSON8
	ed+ejElOCIHLMIc5nY9PFcBWIButHqudPuwhBa5mqWR4/dytZTbfByRskcDeptWiENVvbjP/dUIdk
	OhAPPpzKRR5S5vXC+QtBJcm6pnz0SiPsRfuDSzmMzsGXB/+CN9jjTxAVm7mQgQgMlqb1vszPCu1JJ
	EQLrHmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5aa7-0000000Cnq8-3jhd;
	Tue, 29 Oct 2024 00:59:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5aYU-0000000Cndc-3t7W;
	Tue, 29 Oct 2024 00:57:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so50292965e9.2;
        Mon, 28 Oct 2024 17:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163473; x=1730768273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18M5G6gmC2uJZssfsnK5gMVxO3whYHwKOs0IPtJ1EAc=;
        b=bS4t37cHc6mrOzr7ncN4OXDmoIQxakzJZiLzHzbgbxrYAPjLtIyfO9VEAHRqk1lY0g
         fyy9qmhlj0FObC1dIhhyk98lGQSoBi5mNEVl2B2A//GAUBGIbnY+IE0uodZ7KhRH4cfz
         gJjWMqjKvVUWDumtwg5a8ZGM0G5EHX34jlbhxWSt5yAbYOo9CRiIVPZDiRo4MdXXMPs2
         kVKgK367ES69BvuLVZG/xcY9huBfNIHNnBMvdlsoqGMAEvAlmZ4QdBhJRkywI7xcaKUU
         soYBhKsaZPOQicw6aUBS+PsQ5Rp83Nvoj4zhGtiX6WR8YlY/FBqJ1/ZYTlAy7GPc+S4p
         FsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163473; x=1730768273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18M5G6gmC2uJZssfsnK5gMVxO3whYHwKOs0IPtJ1EAc=;
        b=bGVSXqR5dswL3Q5wcMmOd6pm0dDq0OG779MU9OWUF3+9jWQmJgo7K8UtEI1CJbRRoI
         nGAODLR8HNfR0gDN4xt/OxpjmavNrxOMBaFPal0JIeT2Hw00OUb/9EXCiRul8rkhezYs
         /Wg3ADWU6xHzExlSOcPuYX2Whd+RmZuIf56bmoqrln0xVvaF5VfhTuF4ebGuvh77Om1u
         BOrVctKsFzepbZNvF9uSIx2nhXzHA2hR/MelXda8RM4Zecq6IqLiBN1+S25i7aa6S602
         mxrZ60QNhP/Ljv42WbxsooLnYyFuIRMqEswQkFixbMD4se0csbLU0OjrO+EtTeelCPyW
         1d7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmjlJw/GsCkQVTrlmZdfeS1flVn1oi1sA6G0YI0swhGnQAAnHrDjNOdnPbyrR6bsIjGGA9lcWi9ByJXxIz41Kw@lists.infradead.org, AJvYcCWo10Sz61tyW11zEfKCBoczVyWqX/d1i6I8mHpRumlXTF2QZ6xHJ8tAWjF6PDIaKbBMzIt2nFPPjIEhvodbb7A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcviCdrFs2fNooN2ZoVfF4sv/cW+qCA4K4LwMSY9fzsw0jnoyH
	EfrZXAezMHf1o8/pbb2/67PYfmnF+VEjRVis3c0jHg8P2/UdIUz5
X-Google-Smtp-Source: AGHT+IEDznCPCf6wq2CmGJYXSoKXPyBjdKEg5qpjuhcayRcrcniC1z1J2mBHun/cnOqlR0goHC+pPw==
X-Received: by 2002:a5d:5cce:0:b0:37d:446a:9e60 with SMTP id ffacd0b85a97d-38060ffe8cbmr7494789f8f.0.1730163473057;
        Mon, 28 Oct 2024 17:57:53 -0700 (PDT)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70d50sm10974443f8f.76.2024.10.28.17.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 17:57:51 -0700 (PDT)
Message-ID: <11e25027-6987-4c88-ac06-c1ba60c0d113@gmail.com>
Date: Tue, 29 Oct 2024 02:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v2] net: wwan: t7xx: reset device if suspend fails
To: Jinjian Song <jinjian.song@fibocom.com>,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 corbet@lwn.net, linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, korneld@google.com
References: <20241022084348.4571-1-jinjian.song@fibocom.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241022084348.4571-1-jinjian.song@fibocom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_175755_002402_C20B45C8 
X-CRM114-Status: GOOD (  16.66  )
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

Hello Jinjian,

On 22.10.2024 11:43, Jinjian Song wrote:
> If driver fails to set the device to suspend, it means that the
> device is abnormal. In this case, reset the device to recover
> when PCIe device is offline.

Is it a reproducible or a speculative issue? Does the fix recover modem 
from a problematic state?

Anyway we need someone more familiar with this hardware (Intel or 
MediaTek engineer) to Ack the change to make sure we are not going to 
put a system in a more complicated state.

> Signed-off-by: Jinjian Song <jinjian.song@fibocom.com>
> ---
> V2:
>   * Add judgment, reset when device is offline
> ---
>   drivers/net/wwan/t7xx/t7xx_pci.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
> index e556e5bd49ab..4f89a353588b 100644
> --- a/drivers/net/wwan/t7xx/t7xx_pci.c
> +++ b/drivers/net/wwan/t7xx/t7xx_pci.c
> @@ -427,6 +427,10 @@ static int __t7xx_pci_pm_suspend(struct pci_dev *pdev)
>   	iowrite32(T7XX_L1_BIT(0), IREG_BASE(t7xx_dev) + ENABLE_ASPM_LOWPWR);
>   	atomic_set(&t7xx_dev->md_pm_state, MTK_PM_RESUMED);
>   	t7xx_pcie_mac_set_int(t7xx_dev, SAP_RGU_INT);
> +	if (pci_channel_offline(pdev)) {
> +		dev_err(&pdev->dev, "Device offline, reset to recover\n");
> +		t7xx_reset_device(t7xx_dev, PLDR);
> +	}
>   	return ret;
>   }

--
Sergey

