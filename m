Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC561C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzVpkSNmjPwkm0JFluNOfNDp70jzD7FzLrawMbpg6d0=; b=njLqnXyjrWupoiLF94rBLdW14Z
	Ra5OWez82amymlKjmUeYtZ5uRshnfkDmd+R+EsAmT43rfX7/M/7YwQpbroq8o+VF/nIJmC3dzRcVq
	TeqheF+53KCNreXzED2e4o5FBnuu2g0ybRSR5mCO41jJOhgLBa37wVchHhSLc5Wwbn4Bmy9H0b1fZ
	r4CKHW8snyXG31GoCm22VIAIdFGpAJykzQ0mzEK+SM+bBu0jypUxMCgV95zWfwEFPRv1AEUOQ5E2v
	4x5gZ+Wg8kpKDXxj6WfqCZneymrdR7bf5M2/TmwFb/C1OL3vic+6pLub1wxC/UTUqNBmU9ei6w6Dq
	9CZW5QaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRW9e-00000007JKe-3InK;
	Tue, 17 Jun 2025 13:15:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVUE-00000007CPm-2McV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750163542; x=1781699542;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=O110FrdcInpzBMuMy6Lt2c3gYwH5SZpoT2eQ/FzXveQ=;
  b=xFqMpgWN+9M0vBTDGhcZGZBmlzSW/ojSX2ZI4ojWlHU9fLOBDVIvJ7L3
   DM/902xhAC4dcFsgRymqKFIt+8ITDAZqoeoUSl1UvtysCTWyuck2u30bn
   VBSKjoyCCHbM9p2p/sEtElviXcNxwkF1Rj9bA6XshEhFPkQN1iGWdl5Oa
   Zfg0nv+xu3Y6Qc5lV9tM+ac2nVrmYrDqfHBo5g3+0tk1MhUWLqxwuXyRP
   xlNwH2/gHKsiRJUB550QjFXILqqH7Ehw7mQPuU5gkh+A7z460e3B8rfk6
   i9bCti0mxbzxpXoYu7FI5gXGq2uDyaDrMZhOG/S5zscQAAv/GezCGaSEZ
   w==;
X-CSE-ConnectionGUID: ko567VBqSpWsKe4i2Dg+zQ==
X-CSE-MsgGUID: EObWo+FlRVO7IFxEzXwz2Q==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="210375829"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 05:32:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 05:31:40 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 17 Jun 2025 05:31:38 -0700
Message-ID: <cb110632-435f-4126-bd4b-5b914004fdc0@microchip.com>
Date: Tue, 17 Jun 2025 14:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: microchip: sama7d65: Add cache
 configuration for cpu node
To: Mihai Sain <mihai.sain@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250617104703.45395-1-mihai.sain@microchip.com>
 <20250617104703.45395-2-mihai.sain@microchip.com>
Content-Language: en-US, fr
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20250617104703.45395-2-mihai.sain@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_053222_797345_5E4C64FA 
X-CRM114-Status: GOOD (  13.42  )
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

Mihai,

On 17/06/2025 at 12:47, Mihai Sain wrote:
> Describe the cache memories according with datasheet chapter 15.2:
> - L1 cache configuration with 32KB for both data and instruction cache.
> - L2 cache configuration with 256KB unified cache.
> 
> Before this patch:
> [    0.161955] cacheinfo: Unable to detect cache hierarchy for CPU 0
> 
> After this patch:
> [root@sama7d65eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l1-cache
> -r--r--r-- 1 root root 4 Jun 17 11:39 cache-level
> -r--r--r-- 1 root root 0 Jun 17 11:39 cache-unified

Nope.

> -r--r--r-- 1 root root 6 Jun 17 11:39 compatible
> -r--r--r-- 1 root root 4 Jun 17 11:39 d-cache-size
> -r--r--r-- 1 root root 4 Jun 17 11:39 i-cache-size
> -r--r--r-- 1 root root 9 Jun 17 11:39 name
> -r--r--r-- 1 root root 4 Jun 17 11:39 next-level-cache
> -r--r--r-- 1 root root 4 Jun 17 11:39 phandle
> 
> [root@sama7d65eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l2-cache
> -r--r--r-- 1 root root 4 Jun 17 11:39 cache-level
> -r--r--r-- 1 root root 4 Jun 17 11:39 cache-size
> -r--r--r-- 1 root root 0 Jun 17 11:39 cache-unified
> -r--r--r-- 1 root root 6 Jun 17 11:39 compatible
> -r--r--r-- 1 root root 9 Jun 17 11:39 name
> -r--r--r-- 1 root root 4 Jun 17 11:39 phandle
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index d08d773b1cc5..951d7af3ad1c 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -32,6 +32,23 @@ cpu0: cpu@0 {
>   			device_type = "cpu";
>   			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
>   			clock-names = "cpu";
> +			next-level-cache = <&L1>;
> +
> +			L1: l1-cache {
> +				compatible = "cache";
> +				cache-level = <1>;
> +				d-cache-size = <32768>;
> +				i-cache-size = <32768>;
> +				cache-unified;

I don't think unified applied to L1 cache for C-A7.

Regards,
   Nicolas

> +				next-level-cache = <&L2>;
> +			};
> +
> +			L2: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-size = <262144>;
> +				cache-unified;
> +			};
>   		};
>   	};
>   


