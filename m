Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAE4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3guYso3Coq0RBvgr3ogOEivDxl1AcdY4CDUyBo/O3M=; b=Osj8lMay2dEJuDp8EZ5NqCZf9I
	cpUOF1RFwS2eoz9LgUEKrvD9HZ47LS6j2c2ieQpmWBRmxwqNY4SLQQ4WEk6la9dIHeR+iMpq6sz3Q
	KI5f03TGznw1r/+Sqip1giwIzgvVt7Z/TzXay4mSYeBUR94KhqczQ+VePZ5BKVHIBfDMgLg8yq3D8
	K9b2CQUZtncq4gIlkK3FibpL1YHrqMubWF7ZnDmebH3nKfM/+sc4p/n3suK1TXhDE/KWjldKkDdwz
	1F1aaRcF18tJwnUaS1MqeRhuSgpQQgc8FMt0CRcEjkd1YxI61gb8dpbTHFyx6Dhq3f5Cd8/YAfPc/
	tmeZwJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSH57-00000005O3M-1YCR;
	Mon, 30 Dec 2024 14:49:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSH3v-00000005Nvf-14OT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 14:48:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU9KvIc024520
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 14:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3guYso3Coq0RBvgr3ogOEivDxl1AcdY4CDUyBo/O3M=; b=VkpdyxL8OuULFCJ/
	W0WeSsPXDtCBW2IewX5kXkTjqN+d63vIb+QsUKsCo+QIbLuz2HnXb7n4H9O6WhuJ
	V20FEMIY569IyfhilwKFu4jDdQaHu387K8WExIgODNnH1D4KuChJa0qJsi9MLjHb
	cCycIjsLD3btxa/VysQT9nyd5DzZLEj2AyitLfYLwjlSeWJrSz+9ZCkkmH1odFXM
	bTsRbgRh5d8iKxcRm5bhrLh9PHtlvegacGmoix0TCFyg5Z+q8XJ/LRaHRIgUn565
	cCRHC7W7gI0DjI0CLRPYMoLCAk4dy04qFlp9jR5crdDyqfx3s2/zF0YgC1olq/EE
	MHI0jg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43urt88ntf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 14:48:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b70df784cdso45933085a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 06:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735570084; x=1736174884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3guYso3Coq0RBvgr3ogOEivDxl1AcdY4CDUyBo/O3M=;
        b=FeEHVR6LYaPYX9jqThiLOEqy/6yDFeQdcedLKDV7BwFe0STK2qIG2vnegO8w/R7ldW
         PlmwCug1HUUP06q0c2fQp2HUXu+1YvDjtDjDbkTedZk4HmTPf+w+qySx1O2H6T4TYFMB
         ZbbQO8ReoywxL/JLbWxGcpqHXVOMJGx8M6Ixn5TovYGooCwWaOazzcTfg9E0VPKajOhG
         92GSoGNY+MI9j7xQUJWoOwqsgMvjaOUW6+Z2AWFwovz1HX4SHMc0wlmIzJEn/tenDBpV
         hhEacQ6GiKMeOjEkbyBcy12kJgSCwf9WWSDNH/PmUWvSqiLxepJMq5bqV1hvMtCTXeWK
         oMPg==
X-Forwarded-Encrypted: i=1; AJvYcCUzDeXVkXpBiWOuiyBG/jJJpmikUrKS65doN6A/tas1JjWb4cEzqUPG6uOlPe7BcLeHImLuYmq8eSXg4auynj4c@lists.infradead.org
X-Gm-Message-State: AOJu0YxL/QGl7Emmkj9HsiUz1+rZ1pdqFpoW0Nj0dJkIbbpxdukVDN/e
	s1y+ak9GsCa9cBEjk8eEcKTo0P4EFkElZjMThfidhsdUtyBlDZpxBq9pWEtoFXeIIPcvXzlg06l
	Y7QGa4eEMWKiywQGYCIGnEz2M7vbB/0qyEV5XXyBX+fuOgyxZ9dkiyqKQ4/8rieSrxJKZdb4RVQ
	==
X-Gm-Gg: ASbGncvBqpgPWyJTA+sFD7KNiuDo85rPcs6TtD86SozAa5eVIXG2pYt+3WTtQJosZnI
	IVrwBDY2OChlagNNt1EZSiBzgPlhB2XpLxWq7MiZMHc/aoH65S5glWFmb31by33eSc2Ob9KEn/T
	HcjCmAdl8Gcjs8LwAPohNztbToTrGjzCAYMkypLrgieMFQ74YpFcndVRIDldKz67ijE2NQUSntB
	BZE2KFf4DY/0k56GOSHx8ZjukCPjXdZsRb3tfKHfRwhrmkF6dCIQ6IO0igrjSL+14sL4jbTtvjm
	X/+hTnOPUm5GaiSYJRHF7+MJRjp8iCnJjSM=
X-Received: by 2002:a05:620a:4053:b0:7b6:7031:e15e with SMTP id af79cd13be357-7b9ba7eab6cmr2092906085a.16.1735570083744;
        Mon, 30 Dec 2024 06:48:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDKqMftM4nCBgeB53pdAJZx4SAkQGmWBfeiR7UkWSQ67bAd/6KEwCNArMS45Msy6+U2XZnA==
X-Received: by 2002:a05:620a:4053:b0:7b6:7031:e15e with SMTP id af79cd13be357-7b9ba7eab6cmr2092903785a.16.1735570083354;
        Mon, 30 Dec 2024 06:48:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015b53sm1470383566b.163.2024.12.30.06.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:48:02 -0800 (PST)
Message-ID: <befd6574-b9f0-4483-a767-684a729cfde0@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 15:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, richardcochran@gmail.com,
        geert+renesas@glider.be, angelogioacchino.delregno@collabora.com,
        neil.armstrong@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
 <20241025035520.1841792-6-quic_mmanikan@quicinc.com>
 <jhykmuvgltvuqf74evvenbagmftam2gaeoknuq5msxop4mkh65@dya6vvqytfcx>
 <21365836-aa06-4269-885c-591f43e2e5fc@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <21365836-aa06-4269-885c-591f43e2e5fc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E-c7pGqDsq0LQ9IkYpoKb2_IY0EK_01K
X-Proofpoint-ORIG-GUID: E-c7pGqDsq0LQ9IkYpoKb2_IY0EK_01K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=746
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_064807_307488_79534AEA 
X-CRM114-Status: GOOD (  15.36  )
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

On 28.10.2024 7:25 AM, Manikanta Mylavarapu wrote:
> 
> 
> On 10/25/2024 11:21 AM, Dmitry Baryshkov wrote:
>> On Fri, Oct 25, 2024 at 09:25:18AM +0530, Manikanta Mylavarapu wrote:
>>> From: Devi Priya <quic_devipriy@quicinc.com>
>>>
>>> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
>>> devices.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202410101431.tjpSRNTY-lkp@intel.com/
>>
>> These tags are incorrect. Please read the text of the email that you've
>> got.
> 
> Added these tags since the dependent patch [1] was included in v8.
> Please let me know if this should be removed.

These tags are useful when you submit a faulty patch, it gets merged
quickly, and only then the robot reports it. In that situation, you
would be expected to send a fix, including these tags to credit the
robot for catching the issue.

Here, your patches haven't been merged yet, so it's not applicable.

Konrad

