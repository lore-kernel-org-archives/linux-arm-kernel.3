Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267A6CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jej3aJ8IFvIF8AyttCo/qPRnqjbgdGwXRZCRrkjvQAU=; b=AnWOinIu1edIOy0eoEK+WQDLG0
	eDsO98a/MXsBjtAK6A7YZkvcVJlCM/o7QTyH8F1mxRdVxpcOikw3jqI+yvH0HF1qqE6t9qrpeYyvj
	kDLvH3pQT2UAGtPjX67qiFC02OwXF0SNtSP8H2o1jkggEepOOSZC7yEDJT+RZEWP9dIpU1NJ2T9Jh
	w9BWWngenRms6RweIlQksS9QZ08UbzLgxdN0NmspYglkBm6iDioUDyDLQfajvuu9uU4nnOIfyZb7o
	N5juwLwbtQNqtCsBuGULYNVbWNQgYe8PU0meRy+pzTrv1Guoh5JS7XwHzWkIDfWyNYA89+LnvA/62
	mrpI6KEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphkJ-00000003wga-26rM;
	Sat, 23 Aug 2025 06:28:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQgr-00000002S9T-2dut;
	Fri, 22 Aug 2025 12:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755864978; x=1787400978;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3Ea7W0dwKnTlVfxRkgXHCe2WVUuOP11xif5wEmfOclM=;
  b=vK5SYRbKb8No+twO1Sq/8UVyGGoMYlqLdRLXXXu9ztsq6jncKmbOo6+1
   shICueE5ZQ4WPleKmL/zDvaZghDlWQaE+u9ieMCIsnjUwRoNB5xSsFAML
   13tsQRaR8XKfOhdjh1jl1S8g3/fiqGnUhenhPxrauL5K01M5yW2mZPavj
   lCkvcCYxzC0deYNxd9Z7//5REpw3fq1Qvs5xMI3OM5y/p0f/CcAtMZJLs
   V46810FIpF5xktsoxzvJlpvRyJvTGG8Ag5PxjKcJuU8CqUVHg8g11yZKD
   UMs6z8VDWk+nnVcFfK3JLbqdLTYlUOSMzcOe/LUnGDlTEudkfjk/8ZcOg
   A==;
X-CSE-ConnectionGUID: jcwXdTWwTtyRRk6+L1Fb/g==
X-CSE-MsgGUID: /sDrhHoERLykyKvbaKhrcg==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="276922450"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 05:16:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 05:15:51 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 05:15:47 -0700
Message-ID: <bc7b0167-7514-4aad-a4dd-bd1d9929e99b@microchip.com>
Date: Fri, 22 Aug 2025 14:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: net: cdns,macb: Add compatible for
 Raspberry Pi RP1
To: Stanimir Varbanov <svarbanov@suse.de>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
	<jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor.dooley@microchip.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-3-svarbanov@suse.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250822093440.53941-3-svarbanov@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_051617_723353_428396DF 
X-CRM114-Status: GOOD (  12.01  )
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

On 22/08/2025 at 11:34, Stanimir Varbanov wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The Raspberry Pi RP1 chip has the Cadence GEM ethernet
> controller, so add a compatible string for it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   Documentation/devicetree/bindings/net/cdns,macb.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> index 559d0f733e7e..0591da97d434 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -54,6 +54,7 @@ properties:
>             - cdns,np4-macb             # NP4 SoC devices
>             - microchip,sama7g5-emac    # Microchip SAMA7G5 ethernet interface
>             - microchip,sama7g5-gem     # Microchip SAMA7G5 gigabit ethernet interface
> +          - raspberrypi,rp1-gem       # Raspberry Pi RP1 gigabit ethernet interface
>             - sifive,fu540-c000-gem     # SiFive FU540-C000 SoC
>             - cdns,emac                 # Generic
>             - cdns,gem                  # Generic
> --
> 2.47.0
> 


