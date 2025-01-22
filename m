Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22DAC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYcu5q0LTw0tDsc/9X7nacRjTtioaM8Yp0plJ/Pa3nY=; b=YSZjWyPpYFXqN1KwhoIu7YMDQE
	i8Li0D7vVTRCpzWXJDoGgnoF3gtJFyHQe0IWljGS1N8fnr8rvklNdpTQ6N1zjpmTxEMFg/dT4OCFS
	ZMc0TmFSUqYu9ioUg/hlLqBWZuQaYdn14AVnCAA91LZLwII4yNylZhbVdzmUkW26IujcEGIoJ10C4
	VatZMZkWpVOlsY6gZ1hYErLgWXiRo4enelR9p97Q4M7gtN7aNAA6UoPGwUwVZ+eanNnWv62TKGjcW
	ORKH9ajmTYzHKp0CPjoDWfTWY2lRiVwRvIruysOjsgcx5pOjGB9oXkWlvc1n4x7J8dYpJvVSJFDmY
	qk6WaSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tadJU-0000000AfMP-0sqJ;
	Wed, 22 Jan 2025 16:10:44 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tadGN-0000000Aeo2-2lld
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 16:07:32 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MCPHgu013713;
	Wed, 22 Jan 2025 16:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WYcu5q
	0LTw0tDsc/9X7nacRjTtioaM8Yp0plJ/Pa3nY=; b=WwlWWVTRWi4jVsHTfxYmNK
	4xiknLBbykkGFRW/SxM1034WzILDc0VyYq2KXFjcssuhuG1ngL6QvT5oegqnzRIg
	O/YLCspgTcptX+E5w3NRgSyxNs1nL9OWC6X14MYxdgiNuRIeJUZTMOJZtqU0Io8/
	1CS321CTDIyNSTEFKZZmjcLObFZfxqsBiM0IGbZCLYLAeYDwBycVxEAidXzjN/X9
	Yx0oqPeINcvg6oJHX0qbpuJ7aiJoZwJTeE4XRiTOKALXgQRxI537hRWnYLsQLO8Y
	dvfU2s9yUI9VLk309ghOcyfR0NfGakMuD7ClD4cKB8aPhgJXsWBaESRgAtOSvWDQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44apr9bsx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 16:07:17 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50MG7GSl011167;
	Wed, 22 Jan 2025 16:07:16 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44apr9bswx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 16:07:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MDlJpP024231;
	Wed, 22 Jan 2025 16:07:15 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448q0y9ah7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 16:07:15 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50MG7F6J64815534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 16:07:15 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04BD158050;
	Wed, 22 Jan 2025 16:07:15 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57DF158045;
	Wed, 22 Jan 2025 16:07:12 +0000 (GMT)
Received: from [9.61.66.14] (unknown [9.61.66.14])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Jan 2025 16:07:12 +0000 (GMT)
Message-ID: <e8d21bad-1256-4164-8dca-58b0d46ab556@linux.ibm.com>
Date: Wed, 22 Jan 2025 10:07:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] ARM: dts: aspeed: system1: Update LED gpio name
To: Ninad Palsule <ninad@linux.ibm.com>, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, openipmi-developer@lists.sourceforge.net,
        netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250116203527.2102742-1-ninad@linux.ibm.com>
 <20250116203527.2102742-8-ninad@linux.ibm.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20250116203527.2102742-8-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kTanEyNASlBwnHSHa15M-KkxFGz2YbhF
X-Proofpoint-ORIG-GUID: NJGChWaJwrPnO9pTmeEmh6gtygeB9ReJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0
 mlxlogscore=898 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501220115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_080731_709042_7D2A0BD5 
X-CRM114-Status: GOOD (  13.62  )
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


On 1/16/25 14:35, Ninad Palsule wrote:
> Rename LEDs with meaningful names for easier identification.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 36 +++++++++----------
>   1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index ca55a4fb6dff..1e0b1111ea9a 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -116,63 +116,63 @@ vga_memory: region@bf000000 {
>   	leds {
>   		compatible = "gpio-leds";
>   
> -		led-0 {
> +		led-bmc-ready {
>   			gpios = <&gpio0 ASPEED_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
>   		};
>   
> -		led-1 {
> +		led-bmc-hb {
>   			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_HIGH>;
>   		};
>   
> -		led-2 {
> +		led-rear-enc-fault0 {
>   			gpios = <&gpio0 ASPEED_GPIO(S, 6) GPIO_ACTIVE_HIGH>;
>   		};
>   
> -		led-3 {
> +		led-rear-enc-id0 {
>   			gpios = <&gpio0 ASPEED_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
>   		};
>   
> -		led-4 {
> +		led-fan0-fault {
>   			gpios = <&pca3 5 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		led-5 {
> +		led-fan1-fault {
>   			gpios = <&pca3 6 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		led-6 {
> +		led-fan2-fault {
>   			gpios = <&pca3 7 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		led-7 {
> +		led-fan3-fault {
>   			gpios = <&pca3 8 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		led-8 {
> +		led-fan4-fault {
>   			gpios = <&pca3 9 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		led-9 {
> +		led-fan5-fault {
>   			gpios = <&pca3 10 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		led-a {
> +		led-fan6-fault {
>   			gpios = <&pca3 11 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		led-b {
> +		led-nvmed0-fault {
>   			gpios = <&pca4 4 GPIO_ACTIVE_HIGH>;
>   		};
>   
> -		led-c {
> +		led-nvmed1-fault {
>   			gpios = <&pca4 5 GPIO_ACTIVE_HIGH>;
>   		};
>   
> -		led-d {
> +		led-nvmed2-fault {
>   			gpios = <&pca4 6 GPIO_ACTIVE_HIGH>;
>   		};
>   
> -		led-e {
> +		led-nvmed3-fault {
>   			gpios = <&pca4 7 GPIO_ACTIVE_HIGH>;
>   		};
>   	};
> @@ -368,14 +368,14 @@ &gpio0 {
>   	/*I0-I7*/	"","","","","","","","",
>   	/*J0-J7*/	"","","","","","","","",
>   	/*K0-K7*/	"","","","","","","","",
> -	/*L0-L7*/	"","","","","","","","bmc-ready",
> +	/*L0-L7*/	"","","","","","","","led-bmc-ready",
>   	/*M0-M7*/	"","","","","","","","",
>   	/*N0-N7*/	"pch-reset","","","","","flash-write-override","","",
>   	/*O0-O7*/	"","","","","","","","",
> -	/*P0-P7*/	"","","","","","","","bmc-hb",
> +	/*P0-P7*/	"","","","","","","","led-bmc-hb",
>   	/*Q0-Q7*/	"","","","","","","pch-ready","",
>   	/*R0-R7*/	"","","","","","","","",
> -	/*S0-S7*/	"","","","","","","rear-enc-fault0","rear-enc-id0",
> +	/*S0-S7*/	"","","","","","","led-rear-enc-fault0","led-rear-enc-id0",
>   	/*T0-T7*/	"","","","","","","","",
>   	/*U0-U7*/	"","","","","","","","",
>   	/*V0-V7*/	"","rtc-battery-voltage-read-enable","","power-chassis-control","","","","",

