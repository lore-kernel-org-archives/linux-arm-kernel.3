Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA89C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 15:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBkqA6O8XFb9jrDXTfu9y4HzkdrpUu5EZ1VopDxCMsw=; b=AjreGxXGCuGoVmWO5CK5jkbznT
	4uNP5ykpo9IUttMGwYyNJmu6b25yNzfDgxVs4qbLPUyS3nPKBtdHzvtwSoiFkFjFWz9/iMtafkfpb
	xnaaYaTXHFblPXR6SVjLcS2ZQE6hREMYeu0XOJBwz5Gp/RmHfgQQyiFw60UKCHJnRSeFl6fgdUaK/
	WTtNBKBHjky6E1+B48iphSmW+yJbPeHetrnUM94NzKIPykD3y3j3qyfet0kaQhOdRPchl/zMK9m4T
	LTsTySkiToMyQ69NVgxAgcdQJ0dlJbFT3dFDoRFmqgLui1891pG5piXTiIFRGf7+Sx6IPxBkwi6tf
	pRUfbwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrJl-00000006IwV-0urT;
	Fri, 01 Aug 2025 15:05:09 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrDr-00000006I9L-3QgO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 14:59:04 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Epg9s022019;
	Fri, 1 Aug 2025 14:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fBkqA6
	O8XFb9jrDXTfu9y4HzkdrpUu5EZ1VopDxCMsw=; b=FnxKGBCcAW/fxk6YZmeFEe
	0oJ3+dLdR1XnQZV3z6kNDqpdrClyEjKqfnMo8dGNbG/qTfc9UcH3nDrf6hBasqe8
	Tk0kHqmaw4zxL56eNHbQIs5TgFn3SDgXDnE7nPAprdSaYqBMbDIKEer42Vn2eo+L
	8EAu0m4XxBPSz8uI/3kyRajVtLDRCvThMfwpfQRl7vioLAG7j+N84rKe8WGyPO5I
	xy6iMi0ipeUceJipHJQ+A8LKrGBEIBEWGCshhXaCGIwfGNMebrirtbe02iSwMebN
	7D1nuSEaQJ/fAZoVyD9a/QVBwIv+R71MVcPSaaXH+/9OZTvEjm7LUIjYiacKrFug
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qen9d8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 14:58:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 571EfU7s018665;
	Fri, 1 Aug 2025 14:58:44 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 485abphupe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 14:58:44 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 571Ewh1R5768312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Aug 2025 14:58:43 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 608615805A;
	Fri,  1 Aug 2025 14:58:43 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 160B758051;
	Fri,  1 Aug 2025 14:58:43 +0000 (GMT)
Received: from [9.61.163.64] (unknown [9.61.163.64])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Aug 2025 14:58:43 +0000 (GMT)
Message-ID: <5e0f216b-377c-4a1d-82a8-ead89ce8f574@linux.ibm.com>
Date: Fri, 1 Aug 2025 09:58:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ARM: dts: aspeed: Add missing "ibm,spi-fsi"
 compatibles
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org
References: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
 <20250731-dt-fsi-cleanups-v1-3-e7b695a29fc3@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20250731-dt-fsi-cleanups-v1-3-e7b695a29fc3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QeL4sFszgK3OLRjN63owadCyrhutvObI
X-Proofpoint-GUID: QeL4sFszgK3OLRjN63owadCyrhutvObI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDExMyBTYWx0ZWRfX3U+KVHfRp5r0
 WIME/XvpXG9le6ptKO5m25qZHDqlH5V+JgbdftMa7pLdlIHBbhhce3So4h9qIYhUgLPW8tugv+Y
 nj3nH7XrGkAPMoQrlD7BcnDpHyr3307zuIe70SMIchnmzy4Nh3cPS0ScchE25TAMT0KUUS7lL+s
 954CwjRYDmsT2cT2KN01UsFArYwtCMKQKnxa2zTh8sLWvPDEoTLwj/lUIPAukiB/GVNbUolQ/2/
 MuUKYsNdVGyplJmRObDOZiyKAjUB6XFu959zZJ15FpouB5tQ9jMI7A+x8cEjZT4Uk270bY4vIXA
 QiM7k1HF/Stg9ZapvQqDXihn41cEYS6S/xp6hSESBOf0HTKjsspVhpC9ATC0CajqV6fHFVpy5vU
 s4VSQ/ComJ5XLc3KMrGFk8t6TxsemE4M8HLwSWuD6EJLvScFzLVv60DQwz48jZ2O87T2aNcH
X-Authority-Analysis: v=2.4 cv=BJOzrEQG c=1 sm=1 tr=0 ts=688cd625 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=ydy9chFN_R5lqbIoMqEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_075903_870744_66ABC543 
X-CRM114-Status: GOOD (  17.16  )
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


On 7/31/25 17:12, Rob Herring (Arm) wrote:
> The "ibm,spi-fsi" compatible is missing or incorrect in various nodes.
> The incorrect cases used the "ibm,fsi2spi" compatible by mistake which
> is the parent node of the actual SPI controller nodes.


Acked-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts | 24 ++++++++++++++--------
>   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi     | 12 +++++++----
>   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi     | 12 +++++++----
>   3 files changed, 32 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
> index 9961508ee872..52a044b1e454 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
> @@ -2808,6 +2808,7 @@ fsi2spi@1c00 {
>   			#size-cells = <0>;
>   
>   			cfam4_spi0: spi@0 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x0>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -2824,6 +2825,7 @@ eeprom@0 {
>   			};
>   
>   			cfam4_spi1: spi@20 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x20>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -2840,8 +2842,8 @@ eeprom@0 {
>   			};
>   
>   			cfam4_spi2: spi@40 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x40>;
> -				compatible = "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -2857,8 +2859,8 @@ eeprom@0 {
>   			};
>   
>   			cfam4_spi3: spi@60 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x60>;
> -				compatible = "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -3181,6 +3183,7 @@ fsi2spi@1c00 {
>   			#size-cells = <0>;
>   
>   			cfam5_spi0: spi@0 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x0>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -3197,6 +3200,7 @@ eeprom@0 {
>   			};
>   
>   			cfam5_spi1: spi@20 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x20>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -3213,8 +3217,8 @@ eeprom@0 {
>   			};
>   
>   			cfam5_spi2: spi@40 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x40>;
> -				compatible = "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -3230,8 +3234,8 @@ eeprom@0 {
>   			};
>   
>   			cfam5_spi3: spi@60 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x60>;
> -				compatible = "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -3554,6 +3558,7 @@ fsi2spi@1c00 {
>   			#size-cells = <0>;
>   
>   			cfam6_spi0: spi@0 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x0>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -3570,6 +3575,7 @@ eeprom@0 {
>   			};
>   
>   			cfam6_spi1: spi@20 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x20>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -3586,8 +3592,8 @@ eeprom@0 {
>   			};
>   
>   			cfam6_spi2: spi@40 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x40>;
> -				compatible = "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -3603,8 +3609,8 @@ eeprom@0 {
>   			};
>   
>   			cfam6_spi3: spi@60 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x60>;
> -				compatible = "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -3927,6 +3933,7 @@ fsi2spi@1c00 {
>   			#size-cells = <0>;
>   
>   			cfam7_spi0: spi@0 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x0>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -3943,6 +3950,7 @@ eeprom@0 {
>   			};
>   
>   			cfam7_spi1: spi@20 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x20>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -3959,8 +3967,8 @@ eeprom@0 {
>   			};
>   
>   			cfam7_spi2: spi@40 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x40>;
> -				compatible = "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -3976,8 +3984,8 @@ eeprom@0 {
>   			};
>   
>   			cfam7_spi3: spi@60 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x60>;
> -				compatible = "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
> index 07ce3b2bc62a..06fac236773f 100644
> --- a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
> +++ b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
> @@ -82,6 +82,7 @@ fsi2spi@1c00 {
>   			#size-cells = <0>;
>   
>   			cfam0_spi0: spi@0 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x0>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -98,6 +99,7 @@ eeprom@0 {
>   			};
>   
>   			cfam0_spi1: spi@20 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x20>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -114,8 +116,8 @@ eeprom@0 {
>   			};
>   
>   			cfam0_spi2: spi@40 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x40>;
> -				compatible =  "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -131,8 +133,8 @@ eeprom@0 {
>   			};
>   
>   			cfam0_spi3: spi@60 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x60>;
> -				compatible =  "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -249,6 +251,7 @@ fsi2spi@1c00 {
>   			#size-cells = <0>;
>   
>   			cfam1_spi0: spi@0 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x0>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -265,6 +268,7 @@ eeprom@0 {
>   			};
>   
>   			cfam1_spi1: spi@20 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x20>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -281,8 +285,8 @@ eeprom@0 {
>   			};
>   
>   			cfam1_spi2: spi@40 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x40>;
> -				compatible =  "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -298,8 +302,8 @@ eeprom@0 {
>   			};
>   
>   			cfam1_spi3: spi@60 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x60>;
> -				compatible =  "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
> index 57494c744b5d..9501f66d0030 100644
> --- a/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
> +++ b/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
> @@ -733,6 +733,7 @@ fsi2spi@1c00 {
>   			#size-cells = <0>;
>   
>   			cfam2_spi0: spi@0 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x0>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -749,6 +750,7 @@ eeprom@0 {
>   			};
>   
>   			cfam2_spi1: spi@20 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x20>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -765,8 +767,8 @@ eeprom@0 {
>   			};
>   
>   			cfam2_spi2: spi@40 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x40>;
> -				compatible =  "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -782,8 +784,8 @@ eeprom@0 {
>   			};
>   
>   			cfam2_spi3: spi@60 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x60>;
> -				compatible =  "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -1106,6 +1108,7 @@ fsi2spi@1c00 {
>   			#size-cells = <0>;
>   
>   			cfam3_spi0: spi@0 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x0>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -1122,6 +1125,7 @@ eeprom@0 {
>   			};
>   
>   			cfam3_spi1: spi@20 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x20>;
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -1138,8 +1142,8 @@ eeprom@0 {
>   			};
>   
>   			cfam3_spi2: spi@40 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x40>;
> -				compatible =  "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> @@ -1155,8 +1159,8 @@ eeprom@0 {
>   			};
>   
>   			cfam3_spi3: spi@60 {
> +				compatible = "ibm,spi-fsi";
>   				reg = <0x60>;
> -				compatible =  "ibm,fsi2spi";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
>

