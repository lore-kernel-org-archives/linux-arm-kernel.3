Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8AFC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZu3RRCSZ6fAo+lWLsGDi7lH9XSyk6eapVHs6gKrrgo=; b=YBm2mNGci9M0TO3mMWRPufdZcx
	ynznJIjTvq14ll0AVEoNkPO1kWBrhwYQyc/4nla/EKapF1423opNWFuNzrOesCPF7d+J+cXajCG1V
	0nHK28xzwPoavWHeVMDMDxNi2Vde4X7tkKYeCnWz406pMtbxuwV/lnF80vADzbIEPMN3HhBrR/WKu
	zSfGhIXayhAKEiAsfip7LoyF7H8aLrA0u1rTuVkcWHKxTzd9DppisZodlFXt66RjYu7LSCoTrtnKb
	dXxyb51DCTvv6K3SZ5NUMISRFEEHowZkNHG1wSvaadKbxTTsfPCl75NHCKBLHbg2LAZKbWxzZEqB0
	FTEoTKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzYN-0000000BGx8-3Anp;
	Wed, 15 Jan 2025 09:19:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzOk-0000000BEv4-2Bqh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:09:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2166022c5caso100986585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 01:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736932154; x=1737536954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZu3RRCSZ6fAo+lWLsGDi7lH9XSyk6eapVHs6gKrrgo=;
        b=aFcahPMHVvvarpy66s7ZfHgvB/BzoU6qzrtlnrCxSnFt2wUnqD4vIG1yTNzQ97fc2p
         0xbrDprakfPYQxW7Qii8uQlQZhgfBEBjghyLQIMgZnl3vrMNXaOlg46XKp7DEoTEghgE
         YU/KEHDYmT4DBVFnZDTh2c/d5DdAxHQwzNmtooNup5/V5IxEINUrqINMNbUlEIta04J0
         0nty4kgu+qLvaPhPHX0IOxvZI3x7ZG5PJ53m9/TXW3lmqZQHdcepq2B64uOyMy2n8KjE
         TMr8LPxaRnp9X3+NkwFaA7rliwqnp/pDlnw9Q7mtxdHaKlOA5aQGPcKZGWMbk8DykeLQ
         cOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736932154; x=1737536954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZu3RRCSZ6fAo+lWLsGDi7lH9XSyk6eapVHs6gKrrgo=;
        b=RrmGDvsVDvbBRpHuidud/VjxTaNidBeF4/lz1eizh9OoIjAgRZSe5h61TCvxcYqeFE
         a44LhAtq+NlufIK+LBfB86D+s6sPmpWWK8sk2O+maK4PejHlIuOBSQ16ODxB7d+7mD8W
         NNYeZC71t7gbv3zTVbIt3alcjzD0/TxwtcJQDfgeXFA5kPFK3+YpHX05AT0W7Nuib8ji
         +KMOa56XBI+z/TcaZF8LJ1+EQaYfv4n1LiqD8yJSvIqYg538ULQC2DBqQJchoZGVCH2w
         d4BiHP5SwVDMcARaA/naw+CNpVM57a7w/f24DPxbGCIiidaL4fgUtkCV56l+/GDk7ShU
         h7JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBZYMjrVsWI3il85iFb6wWI+YEeVhA6DfpgVP+Tz7w/rY18RDZEVXuzwtV63PN5jKCR14wdyQtTpyjsbp+WWzc@lists.infradead.org
X-Gm-Message-State: AOJu0YyQubwbU3FgBgxKXVxd+hgQaNnLMJZmakbSfHM4qv6nPaOn6bHs
	71Mj4J6muRvFgNouX0eVRs9xeoHQS7PEhH2Ds4IeZ2tSawvXfOT5FHvQug==
X-Gm-Gg: ASbGncv5eqE712HnGsqILfYzYuZV3vK/ufbF4WmoJa4b/y17Sfklv4h1wDs4rCSjXA5
	wMho/X8Y2+8SBrzIBvaSZDOnspdWRtEgNNUdBARz2N3hjkn/cl4G5uHxe7ZZgoc/pC11Jyy3TqN
	nIzTKTA+sL40y6YC3EZnllqDFrOTvSM+6xrSi2oDqOBoKVbcCzYLWedR4oEEhuQKdI6HC+sQ0Zs
	eD1LEPE07xpOLvVoeGCsfG+/q5OmMt1X+b54b6GM+8TYo1yknQ3b5+LBCIKdvP38ApPd70a5UMk
	/OymMDs/AdK6BYm3+RgrmdmmQ/zgRto9iwQ=
X-Google-Smtp-Source: AGHT+IFzyRepggFFHtQT8D4fkFN2tkBOOiPSmaRhjKsx+myOrF3U4xxdVBjzw1AHpDW/+2qMjfDQIg==
X-Received: by 2002:a17:902:e747:b0:216:3c2b:a5d0 with SMTP id d9443c01a7336-21a84002a70mr352529525ad.51.1736932153585;
        Wed, 15 Jan 2025 01:09:13 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21a21csm78826285ad.109.2025.01.15.01.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 01:09:13 -0800 (PST)
Message-ID: <72e993f1-bb8d-43fb-a9cd-210f1f8f02c5@gmail.com>
Date: Wed, 15 Jan 2025 17:09:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew@lunn.ch>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <20250114153323.527d4f63@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20250114153323.527d4f63@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_010914_560549_7BDA8552 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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

Dear Jakub,

Thank you for the reply.

Jakub Kicinski 於 1/15/2025 7:33 AM 寫道:
> On Mon, 13 Jan 2025 13:54:34 +0800 Joey Lu wrote:
>> +	regmap_write(bsp_priv->regmap,
>> +		     macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, reg);
> This is a pretty long line and you do it twice, so save the address
> to a temp variable, pls
Got it!
>> +MODULE_LICENSE("GPL v2");
> checkpatch insists:
>
> WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")

Understood. I will fix the warning.

BR,

Joey


