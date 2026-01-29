Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E1BD73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGRHN0NuHwElPQUY8BXhrl0wGLg1RNdWY25QjXUQOmc=; b=BCC6Ox0SD1SJ+T4eKxHxaCEwae
	ywpP2ZNKb0vXe/kmthQ4ueYVE9BLTBK3oe2DEVf2LrJmF85FWxrc8YAB19Q8Q56TTw/mjd3Srwgg8
	ubpFn1rfL5kWQsOlmbdJoh3pxoMaIQHIzfS97I+6/XAhwMYfgLDL1Xr9jfz6qDPk2651HVWQ7eDd5
	VUur1LqimDRTFkuGOCwrVbMjOW6wSsW1319DlsUg7SswVcfIxpGbu+R6M2n+QECxq6yMLOzU5iYzQ
	mIzLQv8m2FA3Sg3hWKrJxLnUDcZCY1SLZ8JjBVaEtW50e0Gikxcl2531NklCrnx8J78TFS8SqNWCz
	aN40P1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWo5-00000000WJo-0EJr;
	Thu, 29 Jan 2026 18:31:53 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWo1-00000000WJV-0iC8;
	Thu, 29 Jan 2026 18:31:49 +0000
Message-ID: <0ed08d07-5736-4874-9a0f-0f848e8419b6@infradead.org>
Date: Thu, 29 Jan 2026 10:31:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] stm: class: Add MIPI OST protocol support
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, quic_yingdeng@quicinc.com,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>
References: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/29/26 6:25 AM, Yingchao Deng wrote:
> diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
> index eda6b11d40a1..daa4aa09f64d 100644
> --- a/drivers/hwtracing/stm/Kconfig
> +++ b/drivers/hwtracing/stm/Kconfig
> @@ -40,6 +40,20 @@ config STM_PROTO_SYS_T
>  
>  	  If you don't know what this is, say N.
>  
> +config STM_PROTO_OST
> +	tristate "MIPI OST STM framing protocol driver"
> +	default CONFIG_STM

	default STM

Other places where you may have seen this (and copied it) already have
patches.

> +	help
> +	  This is an implementation of MIPI OST protocol to be used
> +	  over the STP transport. In addition to the data payload, it
> +	  also carries additional metadata for entity, better
> +	  means of trace source identification, etc.
> +
> +	  The receiving side must be able to decode this protocol in
> +	  addition to the MIPI STP, in order to extract the data.
> +
> +	  If you don't know what this is, say N.
> +

-- 
~Randy


