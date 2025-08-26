Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF40CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bARKiXzA6hGcwZbah7s5OpMlMCRfJH9Ze1dsDZvGjrI=; b=w1MA1MgbBkDdgqzU8XVwUuipH2
	rblC2Y/I8g0z5EJuGurjZrzvmU+MelD2v1/lE32QT2FqqYeFHIvCQt7MWJk8Of3vza3XRmPj2+b4k
	p50N5bNne4520JydYMG3U6jCCMqLePGqUUieHMnsm4eBnzwttkvBOJvT1gPCWGybci9WT9JM9GWFg
	hlzQajWu9PWWkUDHnVCN9yaSkf2q7/BxY1HWTMNpMK4WHat7XmXUqCMhUCgCO1W1O76UGHKUs5li9
	s6fwX+arKg0d5pZWcHiWTNqHp14rtfgnkkdwYjGgHkDf3eTtPoq/x+Y5CKOnmEqbOw3AQ/H/KWkWs
	ZwUwOaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpw8-0000000BNAa-1o3m;
	Tue, 26 Aug 2025 09:25:52 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpoY-0000000BJuZ-3jKZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:18:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3c79f0a5c5fso2060703f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756199881; x=1756804681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bARKiXzA6hGcwZbah7s5OpMlMCRfJH9Ze1dsDZvGjrI=;
        b=b+QIKgRiuGBNPF6ujOfqch5zLbJwnFDuLjz9gUtlp2cx/5jqllv9OuIOV+TdtPnP2k
         g3X5InwijJnw++tXxBu6pu1T3l17UriPyJX1VXbxN5RpUC7tO71v+M1lYlCjL92MPUtv
         1lTuz9jcLcGgHicaR78KQhWO87TXgNODisj27QmoAxjARvI1wK3D0/uEGasuncJUHX1k
         La0bPYGwt2bUb0j+LYSKHylf+zbBTyU6jVYtegGfDv5G6VYhTyOPgD/A0rhxm9gxvfu2
         +y/Frd7K3Wea8JL8yD6FSBBjdUDbawjdlNnqHwZ4gs63lg1MauQG+agQm7Jf4fAC1pNC
         7IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199881; x=1756804681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bARKiXzA6hGcwZbah7s5OpMlMCRfJH9Ze1dsDZvGjrI=;
        b=Ta2Dhgkc9eqGJV45t4NA6e1uKfNMUJoZAZoAPtXfHiaKsu7Ct2SX75n9yd+g8L4Gs+
         zWeM7/vVQrCRzy1jLvf3e9eOGMvTpkTgx6hzHf0LpaFPGg5BgWXZSTKPSbm131uhdT4G
         KOEjh/2i8bhygZg0Z414qSWiNQdOcU2WETGTt8s28sPUziyqw5qCdvh6O36RcNRK7E7U
         mS6OEsKnLOtMjkakpwWYwK9Zsv2TYKPvsYk8qmyaEL8sBZo8iZiGfUWMgxxaboS6bRXh
         uHpgzCycwNga6Fzd/5q5SRv/FecpTNoUNAaAQZcK8N/gQc5GnR5p1p4IZtkyyoWSjMBg
         jfrw==
X-Forwarded-Encrypted: i=1; AJvYcCV+BQKZX4CXmG6Sw1IGua1gs9MCo8EucOLLoL1NNaic0XtSwZzGy1RKvojW84mY63KFso/PIskSk+iQPsRvzSgU@lists.infradead.org
X-Gm-Message-State: AOJu0YyB1Uar1ykshngioVOQyjPT1in1yfr2xdkUz6LlZKNBGZiUB4jA
	rgt7LDelsFudU+MoIRTVMu9tpqR158lA7SPJoy29br+JytMYEZLJWGbL4ingyf926w0=
X-Gm-Gg: ASbGncszeL8DKACt4NKAgMffvYZKNpGrwUdNG3uT9jkSTq9ll5PwkgEQcVfjEkBD3ol
	EELXj3kYFpPRieFXt7JfEqSOQc+0PbNbByny+kKld5Oivx0l/aj6h6nc4OieIXC/9hlcBdq+9hf
	ewCLCGsIFd8RNeZBIFtyU5bPT1l/lHYw1mdLOSj/T809wf4HVoL84I6GXm/YezHqLkzgL2ApqyB
	KoId0IFsiFeZOH0toSNMI5uhmRg58ErJS5/ajqF9xLnPDbizVIKDlVlEqWXtvaBMcctgViz0Zgo
	u8FS1HkRx/sk/qVVltd26nZO3H3TDGkyI25z9mODBLufQEtDGhDN0g/ulZkoTkO8VbyYV7V6ryg
	/Xy7m5JLufBlpTfoYnzSX3Z0i/Hg=
X-Google-Smtp-Source: AGHT+IGAZEs053vHudyipY3XTEBo1QStAY7/xTMg751YeNtyJEeHMj0XEwwbWsuR8ch7OFkISHSqhw==
X-Received: by 2002:a05:6000:24c7:b0:3c8:1df2:540c with SMTP id ffacd0b85a97d-3c81df25723mr6978339f8f.43.1756199881181;
        Tue, 26 Aug 2025 02:18:01 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753ae41sm142300465e9.9.2025.08.26.02.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:18:00 -0700 (PDT)
Message-ID: <ef2267d2-a6f4-4f51-be44-687a4074a4d3@linaro.org>
Date: Tue, 26 Aug 2025 10:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] coresight: tpda: Add sysfs node for tpda
 cross-trigger configuration
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_021802_939837_139655A2 
X-CRM114-Status: GOOD (  12.28  )
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



On 26/08/2025 8:01 am, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
> These registers define the characteristics of cross-trigger packets,
> including generation frequency and flag values.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpda  |  43 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 241 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++
>   3 files changed, 311 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> 
[...]
> +#define TPDA_FPID_CR		(0x084)
> +
> +/* Cross trigger FREQ packets timestamp bit */
> +#define TPDA_CR_FREQTS		BIT(2)
> +/* Cross trigger FREQ packet request bit */
> +#define TPDA_CR_FRIE		BIT(3)
> +/* Cross trigger FLAG packet request interface bit */
> +#define TPDA_CR_FLRIE		BIT(4)
> +/* Cross trigger synchronization bit */
> +#define TPDA_CR_SRIE		BIT(5)
> +/* Packetize CMB/MCMB traffic bit */
> +#define TPDA_CR_CMBCHANMODE	BIT(20)
> +
>   /* Aggregator port enable bit */
>   #define TPDA_Pn_CR_ENA		BIT(0)
>   /* Aggregator port CMB data set element size bit */
>   #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
>   /* Aggregator port DSB data set element size bit */
>   #define TPDA_Pn_CR_DSBSIZE		BIT(8)
> +/* Mode control bit */
> +#define TPDA_MODE_CTRL			BIT(12)
>   

This one is missing the register name prefix, like TPDA_SYNCR_MODE_CTRL




