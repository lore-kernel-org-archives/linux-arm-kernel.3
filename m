Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4591E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnce7T7XEQrPlvinYVL/n1yhtcPoTTfoFaF2vz6MOmA=; b=nKYwLkvdzE4yJ2L12fkN3sao20
	otx3hSF0GQaQvnOYVF9KdAuEpAdAvSmdS0ZomH4lP4My3LHF8lB/enzlNrRIL8/MnNckpBB03sQd+
	/CfrFN1nCzNi6DsYJMpjVS2dy+kBM6qnv8L3ixd53I6rhXzxnGBBHwmhOtzijFxDXChi8wsn8L0Ry
	RMQVBQi/WfCCSiwmOJX3BI842x4jOkmME2j416lEe87ffWDWpH0S/MP3KxlXu8hgrTn0zcV+KncmB
	9yqLCq5K9y6jmYGimAUZ25QiLqptjf7jUWKbaum95c/r9LaQ28iH38BZbJgPdrNRv0YN5iQBU14fY
	GrkEXV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKiKM-00000008rQ6-2oJU;
	Mon, 09 Dec 2024 18:17:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKiJK-00000008rJc-1YnB;
	Mon, 09 Dec 2024 18:16:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9ATf0g028879;
	Mon, 9 Dec 2024 18:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnce7T7XEQrPlvinYVL/n1yhtcPoTTfoFaF2vz6MOmA=; b=W8l6J/lnj/iOlWol
	s07T1SVbHXGzyHmG64Zd4inrJURiK72U72gYXc9e8fpEyVzeEhP4iplkYQOXL3sg
	8349nMkhNTii7K4sgQOcBAyR5707y91w3cYHgQgwDBtroCs+Z8wF5hcx9i/PPojn
	wyjuDDjlvD9L1pJhonMoiPXOXgTTJaACfkbOx7MPNSN8ugyZGkdWq0QcXy5VcJcc
	Utjss5AjiQ5Ke2LUxkwlT52AasRu4i4/uDnoK2b4Td9GgQl2U658wS6UDOgZu+HS
	6cal1upeuSIBekl9ZRczcJ7IQ64ZsWUwbx1mHfspTUM3R+vkpi6XZVxgE+k4nHIT
	t+2jbw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfhkdmt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 18:16:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9IGeCZ022605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 18:16:40 GMT
Received: from [10.50.34.16] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 10:16:35 -0800
Message-ID: <54ac6a4f-5ae0-409f-8401-d6e1326d4358@quicinc.com>
Date: Mon, 9 Dec 2024 23:46:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: Improve initialization of numbered I2C
 adapters
To: Defa Li <defa.li@mediatek.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
        <mingchang.jia@mediatek.com>, <yuhan.wei@mediatek.com>,
        <hao.lin@mediatek.com>
References: <20241205132934.12110-1-defa.li@mediatek.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20241205132934.12110-1-defa.li@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OSoeq6sK0chCG1sPbMn_4yX6vW5ijtBe
X-Proofpoint-GUID: OSoeq6sK0chCG1sPbMn_4yX6vW5ijtBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_101646_426959_1BF9F017 
X-CRM114-Status: GOOD (  17.95  )
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



On 12/5/2024 6:59 PM, Defa Li wrote:
> Add logic to initialize I2C adapters with a specific ID if available,
> improving device identification and configuration.
> 
Could you also provide how exactly to define this into DT to have 
numbering while registering the adapter ? Kind of sample to which can be 
defined in DTSI.
> Signed-off-by: Defa Li <defa.li@mediatek.com>
> ---
>   drivers/i3c/master.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 42310c9a00c2..a838cdbb897b 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2486,7 +2486,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>   	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
>   	struct i2c_dev_desc *i2cdev;
>   	struct i2c_dev_boardinfo *i2cboardinfo;
> -	int ret;
> +	int ret, id = -ENODEV;
>   
>   	adap->dev.parent = master->dev.parent;
>   	adap->owner = master->dev.parent->driver->owner;
> @@ -2497,7 +2497,14 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>   	adap->timeout = 1000;
>   	adap->retries = 3;
>   
> -	ret = i2c_add_adapter(adap);
> +	if (master->dev.of_node)
> +		id = of_alias_get_id(master->dev.of_node, "i2c");
> +
> +	if (id >= 0) {
> +		adap->nr = id;
> +		ret = i2c_add_numbered_adapter(adap);
> +	} else
> +		ret = i2c_add_adapter(adap);
Please provide braces for else too.
>   	if (ret)
>   		return ret;
>   


