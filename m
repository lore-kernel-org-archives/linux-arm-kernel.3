Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BDCC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mdl6doeBbRhuv++z4Ic7f25SbHL5xJEu/1avDDNXqp0=; b=E+sZ7/kd0gdkUlnu1HowABYQkm
	PfumSvY3ixacSCyCG+Fb3L9ip+e5Oii8LrXaDG3tCpnVQG7gzp+6Ct2m9/pAaiEa9sig++zV+EJ7j
	3a81Ie0W0LfsGSvKieFiERxftOhUKMs6rTUu9UrM/fit5oxcJSx5qv/aheNU+xh+EdY8y/0MKs26O
	YS2hWNbxgI4JmpFEnJ273WpP5C3xot+kgwiYO/vYjh+LfdViTLKe09yN49AXWlqShUoEmBu4Mh1PE
	o01GMehkmHxsm2BeDOjUOb7clX8aUqus0GwJzuDw/c6UfFbKNvnv1dvaP7fY1WmMU2nutR3rPgMM1
	sNqhfusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfnD-00000003KWD-1Z4M;
	Mon, 10 Mar 2025 16:15:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfJR-00000003FSp-1deV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:45:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfe574976so4596865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 08:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741621504; x=1742226304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mdl6doeBbRhuv++z4Ic7f25SbHL5xJEu/1avDDNXqp0=;
        b=IWDxRiQ0oea1nLsrcW8jwkA0YA48KXN1vOOymxsuq9NMUMfxv4Y9+ruebMwCzaJ4pQ
         yaYX3GTn9JtbMBDSn7dHTVtV5Y1jMExN98bH3SF2HXVUBt9N6y08zgl+0GcX5wQIgw6T
         AuRozDcZ3wa+SRNOTfFmUAgccPa3oDOdB5TuQ/2L4lcIwavpgKsdlOO6BtCZ6yqiyaPm
         s2eLfy4N40gSE4FZaeNcNI93dgn//GQ6m951FVWvytQ3lbRrk5Mt+ywl5ihWhz4KTSRl
         SPAXeYju6ry/y2r+QaondEr8J3UdIEZ6ropme1dETeXELAUW0Jz2aloofp8mlm14f6LB
         7GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741621504; x=1742226304;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mdl6doeBbRhuv++z4Ic7f25SbHL5xJEu/1avDDNXqp0=;
        b=ANgHWV176raqFMdsIFiIHT9VR4pukyq/rJIhmmpyWnq2efV3NTDHdxIdDXhQ59+nlQ
         1dGZse55tbDrlUlqAoNQliQ0K+EJZJNo6Del/H4p1+ehOVI1lephIU9tpgL36CLeSF9/
         ro7c6LsVj6utmkg7rNWjFeRwa8ihYCTzAztRmsxkJ+qb4QB/izUPemoq9gFVpmHWO7Gx
         57W5frqIh801aO5lfGAP8fUPx/bGUgglC4JylJfPsMPsSlsSEmo5CK5gth4tudtbSE8J
         /BR+nFKpzWvCY37cdVMr5jUKZVzvAcS09EVjC6p2pMWHXvgWZH3YRdCvNSsJT5ttptyY
         8Lfw==
X-Forwarded-Encrypted: i=1; AJvYcCXgGPQ63DPa3BUVf01daqDlgnltVraHqaydrzZpRS7lWy+VYZYbdqgjaH9sSlX3xTwb1PkiZNyb2NEqHllxi4zH@lists.infradead.org
X-Gm-Message-State: AOJu0YxOlGUbHEDquQqJM6WlxshsJh3u+k6S1gyTO9eLanNln7KBBoEd
	UIxQmhx+9dAf5SXdpjF1ZewE6wYwjOoxwBnqApUv75VrCAKNS01FPTGo9QgFJDGHxdxqCIXHSCM
	Z
X-Gm-Gg: ASbGncukKgchn5QNAXwG40kMEywv+UpAbqg18pjJh5njbRv3KsOeTdjayBrHR2viZHz
	orPH8srQn96RX9gCbfJeD9/VD7Uvd/Mh6t4nz33TuhbFnYFqGmHdd2OzvcXcpl4NcpIcpK9Cfrn
	6hVQ85qm9ck99VaCmqU0UtTSb1x3A9p9HnxKBHpPYQY9JU9c5UDZ58PylTYcVglCgLf3MProKIw
	/4WiWhQZ2ch/WNR1vFDjBtIQZHYMdOJ4Rw0HCH5LhtFGLI3pF30xgufdNW5uK5C4WJowaaom0AG
	xyVf40M7qHsMtKsRvvL1V0vd2gox6uh9J2VYfw/lNOMqieZmhSrE
X-Google-Smtp-Source: AGHT+IFpljTvUVIl7JTZh4WjEvDEDgvw0oNPeyMebheR2S+x50AjXyNjLmVY1VFRW/5YAcqlN0ZQiw==
X-Received: by 2002:a05:6000:18af:b0:391:3b1b:f3b7 with SMTP id ffacd0b85a97d-3913b1bf54amr5474836f8f.28.1741621503683;
        Mon, 10 Mar 2025 08:45:03 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.65.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01cb82sm15767349f8f.51.2025.03.10.08.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 08:45:03 -0700 (PDT)
Message-ID: <aded13c4-a8cb-464a-b7c5-34cc7d88d918@linaro.org>
Date: Mon, 10 Mar 2025 15:45:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: hi3660: Add property for fixing CPUIdle
To: Leo Yan <leo.yan@arm.com>
References: <20250310093708.9332-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, coresight@lists.linaro.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250310093708.9332-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_084505_453701_B8F12638 
X-CRM114-Status: GOOD (  13.65  )
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



On 10/03/2025 9:37 am, Leo Yan wrote:
> During CPU low power modes, ETM components will lose their context.  Add
> the "arm,coresight-loses-context-with-cpu" property to ETM nodes to save
> and restore ETM context for CPU idle states.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
> index 79a55a0fa2f1..4c6a075908d1 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
> @@ -17,6 +17,7 @@ etm@ecc40000 {
>   			clocks = <&crg_ctrl HI3660_PCLK>;
>   			clock-names = "apb_pclk";
>   			cpu = <&cpu0>;
> +			arm,coresight-loses-context-with-cpu;
>   
>   			out-ports {
>   				port {
> @@ -34,6 +35,7 @@ etm@ecd40000 {
>   			clocks = <&crg_ctrl HI3660_PCLK>;
>   			clock-names = "apb_pclk";
>   			cpu = <&cpu1>;
> +			arm,coresight-loses-context-with-cpu;
>   
>   			out-ports {
>   				port {
> @@ -51,6 +53,7 @@ etm@ece40000 {
>   			clocks = <&crg_ctrl HI3660_PCLK>;
>   			clock-names = "apb_pclk";
>   			cpu = <&cpu2>;
> +			arm,coresight-loses-context-with-cpu;
>   
>   			out-ports {
>   				port {
> @@ -68,6 +71,7 @@ etm@ecf40000 {
>   			clocks = <&crg_ctrl HI3660_PCLK>;
>   			clock-names = "apb_pclk";
>   			cpu = <&cpu3>;
> +			arm,coresight-loses-context-with-cpu;
>   
>   			out-ports {
>   				port {
> @@ -160,6 +164,7 @@ etm@ed440000 {
>   			clocks = <&crg_ctrl HI3660_PCLK>;
>   			clock-names = "apb_pclk";
>   			cpu = <&cpu4>;
> +			arm,coresight-loses-context-with-cpu;
>   
>   			out-ports {
>   				port {
> @@ -177,6 +182,7 @@ etm@ed540000 {
>   			clocks = <&crg_ctrl HI3660_PCLK>;
>   			clock-names = "apb_pclk";
>   			cpu = <&cpu5>;
> +			arm,coresight-loses-context-with-cpu;
>   
>   			out-ports {
>   				port {
> @@ -194,6 +200,7 @@ etm@ed640000 {
>   			clocks = <&crg_ctrl HI3660_PCLK>;
>   			clock-names = "apb_pclk";
>   			cpu = <&cpu6>;
> +			arm,coresight-loses-context-with-cpu;
>   
>   			out-ports {
>   				port {
> @@ -211,6 +218,7 @@ etm@ed740000 {
>   			clocks = <&crg_ctrl HI3660_PCLK>;
>   			clock-names = "apb_pclk";
>   			cpu = <&cpu7>;
> +			arm,coresight-loses-context-with-cpu;
>   
>   			out-ports {
>   				port {

Reviewed-by: James Clark <james.clark@linaro.org>


