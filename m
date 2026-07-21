Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC625C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fc5hVouaXSdYpjHELQxCbl6GfmZ4wxwxC4HC57BPPkk=; b=aOvg2sd/D5E7tP0I1XbgHXCZ53
	jk+DYNzp60yUc7JelhsoScG+C8C29F+BWb1vvZyDRufc4QMyrzh9MscZ2CNCWt3B2gMb8S97PeAyU
	Igs1LjWQ28tVZk119chC9831BzoiMRCPLOxfonDlyvWg7ZHSkDjZEASGbMVDKeQvCeYfFnmfOr+Ve
	I6erfl/gvCVU1vBmE0IoSfcvgjUMC6p7o9pXmkLfy7xYDip0YLjP61MvI7NrQAOZ5cl+QLgWJ5ZZP
	Ng5aQa+aK4OqbrkHo6kdy8vT3qtCiTBB65v3X5PZxppxEPi15w28qH+psuKEh9vZvGW1FaJvfBbgP
	sxvzqhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmF4x-0000000ABNo-10ce;
	Tue, 21 Jul 2026 18:20:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmF4u-0000000ABNE-41gY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 18:20:30 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2grn2418315
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 18:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fc5hVouaXSdYpjHELQxCbl6GfmZ4wxwxC4HC57BPPkk=; b=FJj05R2svGpfrQnX
	c4tc7mBvFM9B4aQNDUteAR7It2s6TbFcwp6eeV+GQ+dxnRwu7id/oQFmugx1iFfs
	M96r+iZL1B8zDG38y5RvigS6wes1uF5nrMDq9xvpt9tClke6yOW2xFyw2WQEGowt
	2VBHXx74dRPKyUeIHBYPKWuhnxXVmob39F36XTu+qx8nS925V1A97i0O2jkILy9u
	Gikiv0FdE4LRx3Oj/+qL3AdcN4Zz+q7VdyxB+vXn/A0auBxFvkqYS3CIg15tk47q
	z4c23L3sCtCMvuDTX/KJOah7FDg4OHwR7jPQDJbTdhxPtoNYVPJYr0SgYzF5UXqQ
	OExG+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs9jay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 18:20:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cceabd70f5so226000685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658028; x=1785262828; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fc5hVouaXSdYpjHELQxCbl6GfmZ4wxwxC4HC57BPPkk=;
        b=dtLV+IKHNG14/NEM1A2sce5WWlpmIjEa6VckUwSCAY7PqeW2/aa34wy3wLD52Eh9gr
         BPMTcl1dXhF1ck+Hncl2quftrkUuhR6kQLrg7i5wQwLE2RagfY7siYwsM0S1GDXsZ4n4
         ugug1I10fZmfJwBkh3EXRKraRoZiweWPgQG8qQXv9KDV9BkTbqignab88FWUxKb827XL
         0qDRUFpjjAiylIx5JNBkHgtojyGcpZu3FiNr4hYuHbs0MMaCrcDmXh8IzbcdZPGs3WBS
         Y37EZ7vRGwpGNHaNjAbGqSAt2b8sVPDFSgrbwttTsiBoA49CuhO1zCOPDPJrI0FHYqi4
         Lr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658028; x=1785262828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fc5hVouaXSdYpjHELQxCbl6GfmZ4wxwxC4HC57BPPkk=;
        b=PtoGGlxAc7MB0r2CaH8PPW1tmptwx0ndZsMKvkTQ443XwVIvIZ5HXNFmGZ+4f132qA
         g6Je34mezRuhqE7dNnMvk5dKZzgzB/inFG1p1cvN5XKeupnnX7IttHLXzD+ajNcwlXsg
         0QbqSvOKcjpah3oCaN5Hlgm44GRomNhLLUOeH/v7z1CRa3zcVVJJaVy7pPKF2WnrEhRQ
         uS27j5c6fZHvn2Up9KkP068KvMF5A9E1FoFOWAJFe3GkwDuLz1PTI/RIS3rKtKDqhDj+
         vuaFFyC05s25dW1vvrgescKE9sufk8UcUovZZiZDzLcmDIN8I4sd+D7Vs1jCmO0wWn+U
         IH2g==
X-Forwarded-Encrypted: i=1; AHgh+RqOOob4SvTw7J0yy5A3vZCjiTX7r0eLski9OAOA2Wql+4P+hJkIzvXHX/LZkRRHi0cwBVYR7Q5f+xs4oG8xP3pI@lists.infradead.org
X-Gm-Message-State: AOJu0YwRLzxzW1+/ig1TUvX6OyWgcfX/rMynHq7Oup3uLW5SfgYR55om
	k8mdd/ZDGOlNFln6HV3C6Is2rRg2bnB4KbcJhVTzZt+yHzrdLnd4qtHRb5B+zaNyVTWH0rxk1No
	bndq1FyL/Xf5HFA4oedFD8Pq/v+1oXi14e4tG1c7vLluSASrnkXup4lIzHO0KYUKBWqi/uTDwne
	sQBA==
X-Gm-Gg: AR+sD11kaW84nwNytwUr5+hTXtytGXjBxnLvDEKDA741IXEQZcPK74+6w3xV79aUjhP
	KWS6WN6rQPjbCXCRMBChjlaA1rk1QJ073IKGYGqKoV0Y8RfpPSJ61m64L8GF5OI6jhAnBl6R+JV
	gW7C8iTW52PlrLY+PkqrRKeKDAElQI+7OuJLdf2rgkKt9MCWVpfaVOK9f/HTMKu+hZKLZ88Tv7w
	9VaZsIt8fVaC0fP/0TDD4+EBpQABp23ArW8yRYsEof9WfDP9jD99PfpFTjDLN3wurq9/iWGiX2O
	+8hgYDaKtI7QjM8CN+LNtb6lih38FQrPZXdm8R13A8Po845QTZlGKKTf2/6vFRbwLuqkzg40NAx
	Q6BqC1+i7xWc1S1RqWesPCLiZnCHFhHAfdZw=
X-Received: by 2002:a05:6a21:7008:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c3ad9a4de9mr22508050637.64.1784658027483;
        Tue, 21 Jul 2026 11:20:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:7008:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c3ad9a4de9mr22508005637.64.1784658026958;
        Tue, 21 Jul 2026 11:20:26 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm2341770eec.21.2026.07.21.11.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 11:20:26 -0700 (PDT)
Message-ID: <773715fd-823f-4564-ba42-c60bc8284b45@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:50:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vZAdLzEeLxNIOp06invob9xZOPYvtLp0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfX1MnYVPhYZ+K/
 GRmlUty2CvhWLOkiLnOK7J0dkD0sCI+xnjh0qXk25exWQ1ssKTWYkemJ21OYCWCdrIAumsFFcob
 oWzp/wwGTKBggGZW01zDypBBZgdIQtWy8Z/PQHnzD0Dn422kdBkkDxE1IvREG8bs1hDu/Wpn8nf
 T5/w8/HMiqf5AeU1Oxbur8KcSCM1A8WZmm9jpkjUMYNplo6Ut8z7O+iV5vulxsPspL/ook6tX9J
 mQbhGNjG38+gYO8vw91vgGQryPWjmdD+FuFp0zJHKvobdBNVgXosFDSIOWVTJEDFo4O0Yx6nADj
 3UibeKewNkxZS+rwxFWnbjms4OTt9kr+C3xLec7ipqUPlXbKaQDgE4EVMyN7LZRuSIit7kzBWOE
 kHnmg7oDoGHk1AtZ5Bd2zxjKT2iInY2G7LLmO4OSec8fcV2pvImkX6sSRr7LpMP4S9kHYE17aPN
 j3ACQJX2v2wjA46YgIg==
X-Proofpoint-GUID: vZAdLzEeLxNIOp06invob9xZOPYvtLp0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfXzOiD16Jy6RSH
 KaBf4Z2hdgI5nZK4rIB1ZgTGR0VgRQgeljivh7TfdEKp3TlosViqpQbqonDLgIGrNT5RBPOp9K4
 aCclPHCymeTkVsFGukBXZs7rqWJKqBo=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5fb86c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nYgDJefOb7ZtON2RxEtQrg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=DV7x2YVLp9Y0dp68W6cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112029_016241_E1C0BC98 
X-CRM114-Status: GOOD (  15.60  )
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



On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[...]

>   static int qce_crypto_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct qce_device *qce;
> +	struct resource *res;
>   	int ret;
>   
>   	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
> @@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	qce->dev = dev;
>   	platform_set_drvdata(pdev, qce);
>   
> -	qce->base = devm_platform_ioremap_resource(pdev, 0);
> +	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(qce->base))
Would you like to add any debug/error log ?
>   		return PTR_ERR(qce->base);
>   
> @@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	qce->async_req_enqueue = qce_async_request_enqueue;
>   	qce->async_req_done = qce_async_request_done;
>   
> +	qce->dma_size = resource_size(res);
> +	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
> +					 DMA_BIDIRECTIONAL, 0);
> +	qce->base_phys = res->start;
> +	ret = dma_mapping_error(dev, qce->base_dma);
> +	if (ret)
Would you like to add any debug/error log ?
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
> +	if (ret)
same here
> +		return ret;
> +
>   	return devm_qce_register_algs(qce);
>   }
>   

[...]


