Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B165CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbAfMirCzUKHKrH2TtQXopkikcdlOcqjFyzU/qMzrOU=; b=JJ1JjyKgzEFAYIAktfetG0BjC3
	KwcJyFSEEJYF7A/SjLnQyhtPqfyMAp5jKfjgFmxA/SqItsoiSNgZkj9ra0OAqzjuo0gN6sCLVsfXc
	MoGW445/YtxqR7E+IrRVqZ/WuijLxnRr/SmKjylzZGXLTrlvopCWuTOJpQ8qrMxaSOTs4XCMWHGvn
	Mrtc5wOZIK/bHlD9vxBbfZVdgauAD1G+ph0EcJ72Mc4H/wMHtE2DOf86VRmX7tfMidZd2C0wgxVag
	srkDf9/439WmKTV7eMCur8cgUIaAcD7OoGfeAy36eQkTKXTZ7fBALUfLIUui4ERsDxyjpDBvpzvqv
	HhFawNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHsj-0000000HHl9-3Hfi;
	Thu, 15 Oct 2026 09:36:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHsi-0000000HHkn-2FWT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 09:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=LbAfMirCzUKHKrH2TtQXopkikcdlOcqjFyzU/qMzrOU=; b=Jhv0y8cITN0burlH5ALr8g5ihY
	0WpClwJ/3a8m5Fu4RVi3OqKPzwprFKb5noyC+TjZfg1wRvJ7idrXtWnzPyCoZNwv1Ijte+cpmslQI
	ZSmVGv8oo7H+1wVrdpeUcGd2vto+OBCFBNh44u4p2ZeYJ5wfBr1GONj9bsYA65TLBKdVSlRnNCDhi
	CjNFFF8SXaQx4YY6SXPJf+kFjla0OWyIR1SXn8QJ0F0QNFbg1G2q8/LOqHbiKJ8sGtXg+cs+vC6Dn
	AgWmTzfoINftCc4xi32GX7TuoBSDn4M1+zQfzvjD3qFXyGthZtyrQNV7msC3w1yh5yo0ZzaH200eM
	EkakEqsg==;
Received: from cp2.siel.si ([46.19.12.180])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHsf-0000000CV9m-0J9y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc
	:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LbAfMirCzUKHKrH2TtQXopkikcdlOcqjFyzU/qMzrOU=; b=GSR3PJutykAc6yW3SjzxCY9G6C
	zh6votkzgnpbHj6UHP+0+TNf19NXZIOZE+cKqFdhWdP4cNptjwPm/Q0KaewBGsVMAnA0LZHDWuJiI
	OwQkGUPJzpeoC+RU+YQRVJGtX/n9tA+VnoQ2hItR1mzDtGUVbUb4izDUj7RUQNPTHjDBbr13JRwLt
	UANwA88lBGTbtl2/+SYANKvIiKL6vZCxgpT3wBbAfrkwFaIn/BZtTKHak9pfwfuzalntiZdMxrGtB
	AnxldgwamoSo7TQtWm/ukxiGorxjIBv2jFryPXagJ7dtFU8MyTJuq7lXbQ6zycCC80Np1jYTskicI
	h+8ixo5Q==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46922 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xHH7B-00000002OC9-3Ybv;
	Thu, 15 Oct 2026 10:47:05 +0200
Message-ID: <ad97376a-8464-434c-b8c3-dffe395eef64@norik.com>
Date: Thu, 15 Oct 2026 10:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] da9062/da9061 watchdog timeout mode
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
 upstream@lists.phytec.de, andrej.picej@norik.com
References: <20260924065044.368341-1-primoz.fiser@norik.com>
Content-Language: en-US
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20260924065044.368341-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_103609_282181_03DF48F5 
X-CRM114-Status: GOOD (  14.38  )
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

Hi,

gentle ping, can we get this applied soon?

Or is there still something to fix?

BR,
Primoz


On 9/24/26 08:50, Primoz Fiser wrote:
> This is a revival of a series originally posted by Andrej Picej in              
> December 2021 [1]. It lets the DA9061/2 PMIC watchdog be configured via         
> the "dlg,wdt-sd" DT property, to trigger a full SHUTDOWN instead of the         
> default POWERDOWN on watchdog timeout, and enables that on the PHYTEC           
> phyCORE-i.MX6 SOM.                                                              
>                                                                                 
> From v5 of original series this resend drops patch 4/5 ("dt-bindings:           
> watchdog: da9062: add watchdog timeout mode") because it already landed         
> upstream as commit 382256b219fb, later converted from .txt to YAML by           
> bd888a4377ae. Thus dlg,da9062-watchdog.yaml already documents dlg,wdt-sd        
> property.                                                                       
>                                                                                 
> Patches 1 and 2 (the mfd prerequisites making register CONFIG_I                 
> writable) needed a rebase: an unrelated commit has since added                  
> CONFIG_J, the register immediately adjacent to CONFIG_I, to the same            
> writeable-range tables. Rather than reapplying the original single-             
> register insert next to it, these merge CONFIG_I and CONFIG_J into one          
> range, matching the existing CONFIG_G-CONFIG_K style already used in            
> this file.                                                                      
>                                                                                 
> Patch 3 (the watchdog driver support) still applies unmodified.                 
>                                                                                 
> Patch 4 only needed its target path updated for the arch/arm/boot/dts           
> vendor sub-directory move (imx6qdl-phytec-phycore-som.dtsi is now under         
> nxp/imx/); its content is unchanged.
> 
> Changes in v2:
> 
> Patch 1 and 2: 
> - capitalize subject description
>  
> Patch 3:
> - implement Guenter's remarks (code refactor and update commit message)
> 
> Patch 4:
> - capitalize subject description
> 
> Link to v1: https://lore.kernel.org/all/20260923111719.2032012-1-primoz.fiser@norik.com/                                         
>                                                                                 
> [1] https://lore.kernel.org/all/20211206064732.280375-1-andrej.picej@norik.com/
> 
> Andrej Picej (3):
>   mfd: da9061: Make register CONFIG_I writable
>   watchdog: da9062: Add support for dlg,wdt-sd property
>   ARM: dts: imx6: phycore-som: Set watchdog timeout mode to shutdown
> 
> Stefan Christ (1):
>   mfd: da9062: Make register CONFIG_I writable
> 
>  .../nxp/imx/imx6qdl-phytec-phycore-som.dtsi    |  1 +
>  drivers/mfd/da9062-core.c                      |  4 ++--
>  drivers/watchdog/da9062_wdt.c                  | 18 ++++++++++++++++++
>  3 files changed, 21 insertions(+), 2 deletions(-)
> 

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com


