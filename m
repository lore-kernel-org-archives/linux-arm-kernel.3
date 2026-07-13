Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50969C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=; b=MlK2y1YH0eFuUfgcyxf8P38007
	rYUUri+FqI48+XtipLPDQ3P040heeYrPUqDPwCfxb1ekI4MjkU7xn4Af9uq+4wIRaovmPrPV4A7t0
	R7lCtJb7o1lhYpjbhL+LZ2MJXkHX8DF1hPG32DbRhVfyfMTMGcZb6WCrhBnza9aM2q3l4XVl4fARM
	sf3NyM3zQ7R0mZkaGgRbE499HD+GfSGImArmHFnZzi/GpZZbOF6ZgM+Vu1dbP8ah4Cv0Z7w/I4qD8
	8G52hJrl8Soza43wpvfSQNTM6YiZ4iADTWPxpU6Qp55nGkA2Hp2s8iAKFmsjdW657xYw/0hulRARj
	pOLw3cdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI1z-00000009eTx-43ej;
	Mon, 13 Jul 2026 14:53:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI1x-00000009eSr-32WZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:53:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvHc1494363
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=; b=e7z7dP4P6kZ+hpy8
	zncf2bbzSinENaM22HojqRVcfDEa6yLFu4UbvOg9zW13JZQeBQcOWTG5mF4mDHwB
	/C0uCB8Glz6oE7/1rq8TeNEoaeua2CIno/sMsSZkUOOGyM1F45lVBmbEkk3Ps7uc
	vWwG1x/0IDHznPKkBH/lqD47NIogvsQALrI8Sjmew4xV0Ld+isbk1VTowEilEN34
	j1GmRQeZ/y+f8IaBu1qxaZ5Hs7+flE3kPl/9E0Td58cKL2kY9Hop5XWkuNZzvGwk
	W3+w8jsS2TEW3baDkBsNROHTs6p6yfNVXQAGDdNM86Ds3UyB+/vkdhZoN34USvMj
	x3TKFg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm34vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:53:12 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48576b535b6so1985778b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954391; x=1784559191; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=;
        b=KJa55gTYEMMogXer464/jBhsCRdxeR/9JTfBHEEPCf1MTe/VgGwFVdtUgC90kmDEoH
         k9vM7s3W4/heA8d2cFkNyJzAXdhOepdX5QyXj1tgtcpBReEqNC0jnRAEhClPGgXKIADB
         zuSIXJEFGrIXjlub1MqfVfG69iWf1UGDkKYH4KwVJlm2uoX+voTN7KuZ2XhJN25531P0
         PoOEf2EPs8wIxUn26pQsdLlbAThx5Jvhy/Ci+9nQ94uNLQFuxMuRn6HzW0T6JPZjwA0M
         hcPHRvjEqbzk6fQnIDDfWe3rTHY4IOMG+LcHG4OwrcshTr9qEYC+TxKs6RD45v9m83Lb
         pCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954391; x=1784559191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24AKlyd0WswfdVUKa25oUcJgqox99A5ZDz9N7zJ3oHk=;
        b=VbVK5RfiKqH8SqJ1h4cl7qcZpgbuZO+KjLkIBT+afAghu6qg8OceM/lqv6LCaGO8P2
         feApfCzRJJw/9z/NYaegBtfLwTkdNhDeBdMHVI90z0Le51rqd0lHz7LYeJBr25YqSiFh
         k2Rq0O8YkqNb9VCpsDhWtxg0BFEGYo6Eq2/gm6+b4gZoFB/XCtudI0EGHS495eEmeGy5
         ghJpyHmzo9yWYkk9KWxXPs+9Wh2wcFUuNspl9GrgYOHwZq4bTRVm/+ONihoJYZ2yU4qO
         PVjE6LR3kuDEJJs6H8Ry/NxTwNwz+DLc+vyxKrmY87r10hyWEGk6hID/TCGqfnIfvmXX
         QAog==
X-Forwarded-Encrypted: i=1; AFNElJ+UkJ2n6vn8U3xGufT9mCbkfXVNs1QmzYOrXe+Fhu5IHjNNFARAb0wRffZBrs6P0Hko8Vqzzo2sDuXgbnbUX/wy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0pIzdrpbFrIpdYQfEcnpK2h+zrM1JENsziv1jLXCkmCTP6Tz7
	En3Vy8MSCdmlTxGohM+/5UN4K0AA4zEj/Ym5ahAof08V7uU8xNbvo37AdHBF1Tk20jAV/72GiY0
	OVGkuECiS13W96xG4auk3Xy1KfIs/+Y8o/kto9E+X8mXjwdtJ9c2e53HtvcVY8QPDFXJNj5wdjo
	lydIJjTpI/0w==
X-Gm-Gg: AfdE7cmusmQpdC28Q35+aQm10/UqDcuU7HATaNxraQTq1Ztf0kM2PRXkfltl9WnityK
	kPjqw65f7FxNsMxbSwfDRjk9o5zeiq2hcC9WzX8E/4A+QK+ZWZKbknWl+8StMfsHP1YkjyVcdW2
	U9sjAefOITob2DMQRUCMxauZdDqoiWljT3Xtar5dv0h2GsNaZDZ5+QxVsoLSKZ5xNZ6M0TDT5+Z
	EhXdZ1teuLWtqCijmdVtaH2loJqKAhRam9VACYY15dkYg4I16MGSkpLI75NQUyukBpLLh76YGBi
	t3sfTyKYsPeKc9eoo9E2DPVAB/nUU7swOZIZkVOrqnxkZk+nDTbcR2gE6JbTNR+M2fv9c/ZeGxP
	/l7LR8UB0yOwl/b/4OPTeiM/QrfTjxQLnzcy4DKI=
X-Received: by 2002:a05:6808:190e:b0:495:db8f:ded8 with SMTP id 5614622812f47-4a42abc07e5mr7016401b6e.9.1783954391355;
        Mon, 13 Jul 2026 07:53:11 -0700 (PDT)
X-Received: by 2002:a05:6808:190e:b0:495:db8f:ded8 with SMTP id 5614622812f47-4a42abc07e5mr7016378b6e.9.1783954390885;
        Mon, 13 Jul 2026 07:53:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm11978085b6e.0.2026.07.13.07.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:53:10 -0700 (PDT)
Message-ID: <797cce6f-850a-45f1-81e8-a1cb97c6a9f3@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
 <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
 <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hqFQqAFcTvE6URDlBJVttkTh0d3h1kl3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX/m78Pvok2TId
 UEJIcibiKZyEg/BMCsDwSHHHc76MSeQ5N4RJ8nvo5mu9GmbsyvqP/5HVO7VUlnrd0QC73e+289H
 DsvypexUmYWtocmdnwENphDX7C0tJyPAVENkng5xCRmcosJr3ZjYlweSa9i6i8gz7HizciLPqug
 MjOcV/ib+319jMnhqGsTGxQbh6cDTTcO789uafBqO0ZZExDB169vzFMjmWsSr2ngURBmCud12SI
 363L0qVVx2cc83QSSiUGZ62/Z5a+f9vQSWN926YDM+BR4ja7SATgqMag7nsB1U1N/ilK2ysrCtO
 q6iqI38ZVuno3t8aSyVPUpz0cCmOFy/VhnnILhz8qcrU/wPg2R3yQ7uo4OMD1qdhDijWKsZSZ/F
 AXgKQMWnAZy1W0PZTEaVWITZ1JuACyfn0kyydLiXLlX/6SP3HDprH5m+RNl8zg979ceHvueARe9
 3rrg8/Bb/m8DxL9MI2Q==
X-Proofpoint-GUID: hqFQqAFcTvE6URDlBJVttkTh0d3h1kl3
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54fbd8 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=Xoi8Q9uR1wpgCRNIeB3xeA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Qo9p9QJxbvv4IUk4TH8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX6b5N+DvGbUcC
 QWS3fV1vp5cTmknAL4vvjbY5ihmXzG1YKvXJ5JNXKyt2HEgH9Mb4CGI07Qbp2+E+wPg8DoN9igz
 ArxhOboPQKB7EfcKWwQFi+KVmDEeMDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_075313_783402_D469DD4D 
X-CRM114-Status: GOOD (  19.69  )
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



On 7/6/2026 6:36 PM, Konrad Dybcio wrote:
> On 7/6/26 7:28 AM, Taniya Das wrote:
>>
>>
>> On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
>>> On 6/9/26 5:02 PM, Taniya Das wrote:
>>>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>>>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>
>>> Almost all of these nodes lack power-domains, meaning the
>>> aggregated performance state requests will not be translated
>>> into RPMH requests
>>>
>>
>> Konrad, all the clock controllers are on CX, similar to Milos and does
>> not have any special voltage requirement for the clock controller.
>> It is okay to not map the power domains here.
> 
> I don't like repeating this every two weeks, but each consumer core
> may need a specific corner for operating at a given frequency and 
> the way that is conveyed upstream is via a hierarchical structure of
> pmdomains, where the root of the tree is provided by the rpmhpd
> driver
> 
> If the connection here is lacking, every requirement specific in the
> OPP table or in the IP node via required-opps goes to /dev/null and
> RPMH may do something between aggregating to a lower state (because
> there's some other node voting on it by pure coincidence) or shutting
> the rail off (because there's no votes whatshoever)


Sure Konrad, will fix them for Milos and Eliza and will submit the next
patchset.

-- 
Thanks,
Taniya Das


