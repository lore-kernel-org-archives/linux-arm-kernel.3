Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CECC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lz7QXf+iBwT8QlIH9Oun8AGxaHA1wq8IUAehzHZTWo0=; b=re5kyZ6SwxmsuFZlirLM/4x47F
	l84QTbe/bAEZzABaNGbw3NlhYZPdwgQh6n44AtnjpUj10THZd0IBunDmQ3MMEU8+DhSPSGL+vxLGE
	qxe5PH62AS5xHa+UkA4PzeckKj7A49D0CmzOs+a9FsR58UP9KQ7oHiFlwzpkFPQJT2AENBWMJzrfl
	aGKv7mL5FvYG4h+onTwhwJMvEc0Glrf+Slq3QqAJ/XBwx4ypaV+N1YkYXUvw3jr1apy/iE+WxktkK
	Vp0GGPNs7Gw3D4lCXleyXuI38yRriQnUO84iIEEClvCSPWrrK0J7fGApLMchmbVtnTyA+eC/1bdtX
	dn26nMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpbt-0000000Dprf-2iYZ;
	Thu, 23 Jul 2026 09:20:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpbr-0000000DprI-1IXb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:20:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qiBr3387988
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 09:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lz7QXf+iBwT8QlIH9Oun8AGxaHA1wq8IUAehzHZTWo0=; b=RDocfRy2yCHEjccW
	RZsU+gVIqtmV1JA9knlL2qUoDyjx1MFmf4ZpdDgtcCPjCkD41+MaINpGGNqlssH2
	+RmCqQkCtNsfKC32m93P87q3wDV+LDgGF+Z0o4QaWHMltGFdL21fLRpZDlzauFXC
	ITws8oIBPGRDOjpHlJXTDMGYhCkRRLnR7REkcGMvmQ5r3mayMxGo9gP2+fL8cgmV
	Z1dSeukTeYYt02iGWv623uus3oOA3IZwhBqSbmORWl0Fu2ucPZ/owlrRo6jRBkjz
	Kv/Qggw2S/sze037UCDDCVLHPys0Bk3UshoaJP5hWMv2/77YZzunLT9ZY95mpTCD
	vFMC6g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275kby5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 09:20:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so2907795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784798453; x=1785403253; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lz7QXf+iBwT8QlIH9Oun8AGxaHA1wq8IUAehzHZTWo0=;
        b=df5zD3RjU8Y57DP3YRXKmYupF08ieNyImPlxLFZeBjVE6TKuzQEdK/286jUYtXD4mc
         PNMLAMLiA81Lw+3ruJPFSmxZxOa6bJdX0U1TfLZ/Y8HXP0M3PlaKbTVstVMmn2riDNG2
         caIs0ynIVhQAeF9SUL2RWAfsMmb0fudpG+f80Ni+akOd3PKWYYOZmpUfeZIT+OqNQchz
         cf4TAhkd095+t8kPOEvmwPeyKvDwTbTfl9w96xWU4JRRxUPbJgbODAGmRvOTg0EtcoJJ
         XK8ujMgMegDrYnDASOZcQTh0KOkpDI4WSChiE5+2gs8W51Kswu4Od76VVs2pVunNhZNP
         IXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798453; x=1785403253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lz7QXf+iBwT8QlIH9Oun8AGxaHA1wq8IUAehzHZTWo0=;
        b=UXEi2htFkuB1DJq2LR9qOhi+v9VvawmpSHQCe1VRgp/uBpUSYYiDcV5EZHPggBxAIx
         WH6zpHpiSLEfWxIaSG6TlnbBwM8/iuvQUvTsMbUnNMwFnoeVzZ9P+ursqm6ISykEoEdU
         nUuIM5ceEW9oeDesOdmb/N9BMXzaelEuoNPuq0+CzyTm1ML1g8wX8A2jl1zIMGXwHeKg
         ys8e5k8uTxTMr1CtlXbrdg24kMtYxkln7nVhBtMHSKsOEHChozElccURSAP5oRT4Gl3d
         RzpKQ4ACPILSIwGJv9tJqoy9PeiuzBOhRV1JugNVWDuWM7JvTgQ2aoyCDZfsJRvHONio
         NZ/A==
X-Forwarded-Encrypted: i=1; AHgh+RrAfhtIYUVJ24+MwitTNDCCl6m4ZL0uGvYwBIYnrUajl3FV+4aDw+uz3l8n7Tab5vbAlq79jWdKmQH2dAheq41I@lists.infradead.org
X-Gm-Message-State: AOJu0YwrQbkLMnAbClEvmfzh2B+QQpE+Cu8u1CjUWtkc9lSB5vtfeWp6
	xTwjJLxwDq7cilP5IG/tashmpg9SKuZVH2APoFwI6Kt9qdChKF+j5hX4FTVle8w3pfeTl1b7VBJ
	XbdMX5wt+4gOkIUonAvvGhsqx2OMdscC7h36PLqv3k3iUOMPj5HTERibCDUybJIXNbL+4aDxPpR
	MylQ==
X-Gm-Gg: AR+sD10yNIbcmHLzVpbP9P8dtr4ZkpREoeiZDFi+8yHH18VLmucg6dA7Wm7LbFuddJa
	xCPmhCiBJTDO+X5ioRo/NlXhL7lGT5dEY7J5o3WM4qJM76N8ygv2f9hdry+S8aPXHz9C69maoHW
	PbSNoV/UvjZfPifk+aP0hEq9r5JbDxn/1E5yeMoXwqCJds2rHII6bz/MwaueAnTQ456Aey8+Imf
	dlSgFf/AypDcRYDz6wh0aGbCrLSDTUo871ukKq7dHRW4e7qWFIM3Wf5+5JzqejYQzWs9llNxBY0
	p4tqL8do0uAW6CAK1IfXB+9FVgC9HjuDzDoQxTOpI0vP3iXXhVSATwwhWU3bEBJnsjsos0euKST
	eQdbF1mwfxwQL92iWeMT/WpokEP9Qsh9LJr4=
X-Received: by 2002:a17:903:1c1:b0:2cf:18e5:1d18 with SMTP id d9443c01a7336-2cfa958568amr21289805ad.29.1784798453095;
        Thu, 23 Jul 2026 02:20:53 -0700 (PDT)
X-Received: by 2002:a17:903:1c1:b0:2cf:18e5:1d18 with SMTP id d9443c01a7336-2cfa958568amr21289495ad.29.1784798452670;
        Thu, 23 Jul 2026 02:20:52 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f011570sm29930365ad.35.2026.07.23.02.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:20:52 -0700 (PDT)
Message-ID: <eb99f98a-db4b-40a6-9c5b-9f9eb6986d28@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:50:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
 <773715fd-823f-4564-ba42-c60bc8284b45@oss.qualcomm.com>
 <CAMRc=MdLMQgJsxAMXLBkZNWUiz9fYh0j=C5ErbFoDLV=VfPUzg@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdLMQgJsxAMXLBkZNWUiz9fYh0j=C5ErbFoDLV=VfPUzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61dcf5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JVr4EG2OP6aRYF85f9oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MiBTYWx0ZWRfX8mPFN9DK4jHO
 d9OWGC7csJUpPZciGQCfUGP+NIy03Azy/DN/pnGwYpDm2c+iQpWHQQj+IwOnHia5DKQmRNa9rqQ
 7RNA/ymkKsMeVkn7Inup+aP+aNZHJhQ=
X-Proofpoint-GUID: rGdYZ3O3tO95EvKSJtlhxTkR7SDu7seX
X-Proofpoint-ORIG-GUID: rGdYZ3O3tO95EvKSJtlhxTkR7SDu7seX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MiBTYWx0ZWRfX/BBMh4MPJ/JG
 JCJxjHPQCRbFc9Ew1LRlHymsOlE0IIkWyvVgg4bFAfmSVjBpULIkMDuTPtVG5x8CZFTyj63Td5P
 I/dL86dYGonMhLYww7O+nxoPPQatUoKMv8CKzfO3+kFWmr4YYaQK6uIhOOovMxonSfSeDvFUdJO
 GaOFfAfpsyRD/zHrsUL2AOo013wGup+4w5qEj4o5c4/ddTDMu3+eI0g4ILQwtGy0LYoCij3tQcy
 vIUA3WpRgJOIe1qIWnuMf/UfuuwgkUlL5RG8PUMeyeJSoVmzGJmpiuvGX5eOnYuF2BNh0nVY8a0
 BoTRqrk9KoPRYrnx4GD1Hjti3+NzbF+/Bleayy/MtoAb5X3eVFvHGoHlfAJNMa3yWS0tnvqEENB
 Q87ppu1qJDox//UZ+Uvnadqv2dOhyKgJ7koo4Q3eFyniRxutToOXd/jEK08oY8tcGUUSemt+spe
 DZUUyXNJ54CPKibB9Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_022055_365501_E6346EFB 
X-CRM114-Status: GOOD (  17.73  )
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



On 7/22/2026 2:47 PM, Bartosz Golaszewski wrote:
> On Tue, 21 Jul 2026 20:20:05 +0200, Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> said:
>>
>>
>> On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> [...]
>>
>>>    static int qce_crypto_probe(struct platform_device *pdev)
>>>    {
>>>    	struct device *dev = &pdev->dev;
>>>    	struct qce_device *qce;
>>> +	struct resource *res;
>>>    	int ret;
>>>
>>>    	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
>>> @@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>>>    	qce->dev = dev;
>>>    	platform_set_drvdata(pdev, qce);
>>>
>>> -	qce->base = devm_platform_ioremap_resource(pdev, 0);
>>> +	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>>    	if (IS_ERR(qce->base))
>> Would you like to add any debug/error log ?
>>>    		return PTR_ERR(qce->base);
>>>
>>> @@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
>>>    	qce->async_req_enqueue = qce_async_request_enqueue;
>>>    	qce->async_req_done = qce_async_request_done;
>>>
>>> +	qce->dma_size = resource_size(res);
>>> +	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
>>> +					 DMA_BIDIRECTIONAL, 0);
>>> +	qce->base_phys = res->start;
>>> +	ret = dma_mapping_error(dev, qce->base_dma);
>>> +	if (ret)
>> Would you like to add any debug/error log ?
> 
> No, I don't think this is needed and at v23 this really is useless bikeshedding
> and doesn't add anything to the discussion and only delays getting
> this upstream.
> 
Okay, got it. Thanks !

> Bartosz
> 
>>> +		return ret;
>>> +
>>> +	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
>>> +	if (ret)
>> same here
>>> +		return ret;
>>> +
>>>    	return devm_qce_register_algs(qce);
>>>    }
>>>
>>
>> [...]
>>
>>


