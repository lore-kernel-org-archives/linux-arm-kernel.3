Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9914E69E86
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 19:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtthdvLNczidenLf1mjfjYZczot34nYiKDi3OMmwcXM=; b=xCqCRTX9a9R1QMAtjkbbVEk8kF
	BJtQkCSyJFEGnOcexnZoJhfsN2m8Z5qpPcaLg2h4onSSkJQrgn8kvOUovK1F8pVr2lunY0qa7V20Y
	WK4mbG0i4x9Vbg0EWLiyW6cve9JbpJng8luGcFnEoCpXI9xGEKHwCg+hRBSNEFp4K8S2mktAOiokX
	6Qz8GhkVW4fpOY+UMvTuud9qi6LSQ0iBksqZsKaOEegl/lZclrn0sRGtzJoajd2eUgqq8v3Y/KUz3
	54FywQoqnlTU/caMePIkA3grNahdWO2KiNt3uUnvZh0hJZBSzrldLcmUyXXaKQkYHxRt8pznFDbLj
	LwBIroIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tICPK-00000007L2I-49eX;
	Mon, 02 Dec 2024 19:48:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tICKh-00000007KMs-3gFG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 19:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PtthdvLNczidenLf1mjfjYZczot34nYiKDi3OMmwcXM=; b=k6Ri9+x4S9KDg5kSSTNRg1zwRa
	6WpvFfTsBX8djtZ7QhUWAAC5W5dHOZubr+s/ZNVr7IEuWufdicxWEKrNsXgui1+MYakMNd6nb34bW
	KJVnYz+auBgSQUg6V/03TLLGAFj7zmKEqL3CK9WaHwUlXynhmclLUtRB33ibjqdF1KLche6so5drb
	H6ce2QxjtEbwVnXY49Tt052X5P6yZNRk8G3aPfSVrjWlvz4ObxdzClBZLrb80J5Kj8BlaySIMKa/V
	oJcZvCCAC/cCe1qLcKr/7/jaY7oSjQFNm4g6zW8ZCdlYPmPbEj7ksvHPfuA/CbL7knvM8cXVAXNDS
	boazgtTA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tICKe-00000002FiQ-2osz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 19:43:46 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2BXqsn019335;
	Mon, 2 Dec 2024 19:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ptthdv
	LNczidenLf1mjfjYZczot34nYiKDi3OMmwcXM=; b=pgMNadtdExpMF8d/t7Sfdi
	xX/81avIMgLTC6n2dkeAoOKcfkXtOlMWY1wuyQif0bAeg1YK+kOy8nZhChDu64uT
	4AWOymZH7L75W3CdNvk9YLqGlbl+laA8U848mPrLXfLpPzRVqsjZ/53RWUBI7adz
	qnukNNDe+v2JrAZXb02OhjOiWWiyIlpXOfpEFTV03DeUYCC1m08pV6KTr8ng2cQ+
	MEsPP0FLYXPO/5KPLK1bascKH8ZLj4x6QMoLTy2O2arjFpvkrWXgGrV+usRNeTV0
	ODVWZ24kHIHTmfyqc1B7K2LkBiZLUqQSqt6oTjjzDoTCbnV49c68Y8cjarcyI8lg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437tcvb7ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 19:43:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2Hu9vW006840;
	Mon, 2 Dec 2024 19:43:28 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 438f8jatr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 19:43:28 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B2JhR1R31326480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 19:43:28 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1CFA58050;
	Mon,  2 Dec 2024 19:43:27 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4738958052;
	Mon,  2 Dec 2024 19:43:27 +0000 (GMT)
Received: from [9.61.149.118] (unknown [9.61.149.118])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Dec 2024 19:43:27 +0000 (GMT)
Message-ID: <8896a6db-6208-4095-bdf8-f5d21b519631@linux.ibm.com>
Date: Mon, 2 Dec 2024 13:43:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fsc: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>
Cc: Alistar Popple <alistair@popple.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-fsi@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
References: <20241130150530.901263-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20241130150530.901263-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rs94fHDTTEC7yHxUvjUCMxju6vUxsfNd
X-Proofpoint-GUID: rs94fHDTTEC7yHxUvjUCMxju6vUxsfNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412020165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_194345_152421_0D0FFD1F 
X-CRM114-Status: GOOD (  28.08  )
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


On 11/30/24 09:05, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all platform drivers below drivers/fsi to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>
> While touching these drivers, make the alignment of the touched
> initializers consistent.


Thanks.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> this is based on Friday's next, feel free to drop changes that result in
> a conflict when you come around to apply this. I'll care for the fallout
> at a later time then. (Having said that, if you use b4 am -3 and git am
> -3, there should be hardly any conflict.)
>
> This is merge window material.
>
> Best regards
> Uwe
>
>   drivers/fsi/fsi-master-aspeed.c | 4 ++--
>   drivers/fsi/fsi-master-ast-cf.c | 4 ++--
>   drivers/fsi/fsi-master-gpio.c   | 4 ++--
>   drivers/fsi/fsi-occ.c           | 6 +++---
>   4 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 6f5e1bdf7e40..0f66bc8ac2de 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -661,12 +661,12 @@ static const struct of_device_id fsi_master_aspeed_match[] = {
>   MODULE_DEVICE_TABLE(of, fsi_master_aspeed_match);
>   
>   static struct platform_driver fsi_master_aspeed_driver = {
> -	.driver = {
> +	.driver	= {
>   		.name		= "fsi-master-aspeed",
>   		.of_match_table	= fsi_master_aspeed_match,
>   	},
>   	.probe	= fsi_master_aspeed_probe,
> -	.remove_new = fsi_master_aspeed_remove,
> +	.remove	= fsi_master_aspeed_remove,
>   };
>   
>   module_platform_driver(fsi_master_aspeed_driver);
> diff --git a/drivers/fsi/fsi-master-ast-cf.c b/drivers/fsi/fsi-master-ast-cf.c
> index a4c37ff8edd6..4ed2f33284cf 100644
> --- a/drivers/fsi/fsi-master-ast-cf.c
> +++ b/drivers/fsi/fsi-master-ast-cf.c
> @@ -1429,12 +1429,12 @@ static const struct of_device_id fsi_master_acf_match[] = {
>   MODULE_DEVICE_TABLE(of, fsi_master_acf_match);
>   
>   static struct platform_driver fsi_master_acf = {
> -	.driver = {
> +	.driver	= {
>   		.name		= "fsi-master-acf",
>   		.of_match_table	= fsi_master_acf_match,
>   	},
>   	.probe	= fsi_master_acf_probe,
> -	.remove_new = fsi_master_acf_remove,
> +	.remove	= fsi_master_acf_remove,
>   };
>   
>   module_platform_driver(fsi_master_acf);
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index f761344f4873..9f8bfc43ad93 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -883,12 +883,12 @@ static const struct of_device_id fsi_master_gpio_match[] = {
>   MODULE_DEVICE_TABLE(of, fsi_master_gpio_match);
>   
>   static struct platform_driver fsi_master_gpio_driver = {
> -	.driver = {
> +	.driver	= {
>   		.name		= "fsi-master-gpio",
>   		.of_match_table	= fsi_master_gpio_match,
>   	},
>   	.probe	= fsi_master_gpio_probe,
> -	.remove_new = fsi_master_gpio_remove,
> +	.remove	= fsi_master_gpio_remove,
>   };
>   
>   module_platform_driver(fsi_master_gpio_driver);
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index a6d4c8f123a5..b5a7372a680c 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -737,10 +737,10 @@ MODULE_DEVICE_TABLE(of, occ_match);
>   static struct platform_driver occ_driver = {
>   	.driver = {
>   		.name = "occ",
> -		.of_match_table	= occ_match,
> +		.of_match_table = occ_match,
>   	},
> -	.probe	= occ_probe,
> -	.remove_new = occ_remove,
> +	.probe = occ_probe,
> +	.remove = occ_remove,
>   };
>   
>   static int occ_init(void)
>
> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02

