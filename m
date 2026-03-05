Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8C7EEF33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=; b=L2g/1Tzm/qsBqSNnrUMOqkqslx
	OWXqoqDtZvZE7yX9miN+DrWvBeUMIAz8Vh5TkZIodjZVjotVxMi+IJFmb203R1pa2wBx4RYaASbdA
	zVwaqZXO9YECh6BAh2zobKyrJbNNuBFwSSVgILkjqHM+SB4eHZ9UpinTpC7JzqGtneD7LfJz234nv
	4TFs70I9SGOOheXaBgmZsSH0KR4fDiptpIE1Bf7C/A7zN3UAmYn+Nn8nIEsJ3bawpobllKIOTQbSw
	zbO13np9RaOk7ligFpDiwYY3ZVWkbVnp7JRShglWBogIq+ps78LnQG/EXUAPKiXQ3hTuwfJ78f6WW
	qb0ZbETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4k8-00000001KNS-2Guz;
	Thu, 05 Mar 2026 09:11:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4k6-00000001KMU-2ehG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:11:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254KLvj1853136
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=; b=W0Hi5Pu+/Kx9rub3
	1LuwoztTEiyin65jy0AFa9w9CeQosyQeKJh8uCqng/kW+AvyBzw620uEIw8ElxxS
	p7DgJXpyHxlQCgU7ZnXWh1fDC2kEZgsF+bNRtHfjWvvQQP20fzVlblnrbJN5YtJj
	cuXRnfwIw9A1WDVd75f5iR90V/hmIMXMAApDkJvz92wPoO8C6Cah4UDdFm28qxbm
	JkVKYxCSPSIeuDpcvHiSq5co1WnUKQ63+OjUFG3+cpPsRMO9kCFdRbA5AXYlIq+/
	D3NF4cr175vifDznzJXmfwFBgZlGYxgAmz/Vae9OYLQmqMJp28j53fTOD1MekVJb
	WfF0KQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q80wgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:11:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so613004185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701897; x=1773306697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=;
        b=FS0L6vTWVK3Ioka6gEGdZ/arYLbPOBxUv8+iKhznduPRuPq9O/QeJXMipB2KrvgwG6
         7pmCrWKVOVXgI40+VKZnWJozkdBNh8FLt6SlZB7DhbAJkadTdpNc/9OT9ZZzMHKpd1l/
         VYxng6JGsnPC2bd/CBLnYJTkieGo+T2emg4wW9GX0MOVxoxU8soI2BKn8VwvIb6bkysz
         A4ize1disV2bIV94Ajn2/xck3uB2BemIGotCym4KVOFRZJyzlgrAtIr8EoYQeJMydkmj
         l3GXOEYTKArS9xexhrlkhXd/nRk+it0/416Rc4tlmv/ZlzuLheEgv3sZs0syQ/VJ03JJ
         nqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701897; x=1773306697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=;
        b=G0mXmb9KO7AMiFjFFpAutGYEr7ZeelAN0NuxVRXqtYFiUaLkyMnspI0x6SxUEdIUdj
         tV7D6IuMjZ8FNJ2cBm8oAtx8FibWF65tLMHyFWcTdKOJ2XR+9SUoLEjOHtoccgkBftna
         2bnz3p8NHjEkYAdFMujqGNEV68VXXZa740U8svk1mbu/tutjGKDXmCASvhC5KAjDwf8p
         dNN4gWYps5m2IqKZEK0wszUPKf+iHcFhq3anQlwlyNQEFY7+J0Z96Gt5+ibpuKhuVPAc
         Ufnpy6KfW1IIoH9A4Ns45x3jGsqHIqoFy4zPvCPVZPkfszmLR3LWzWFHc7KR3GVYLbm4
         DK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYGmFAkxhKaMxJVrn5xKK6r9Kd45WBAZcH7Td46Ob9Mz++7y0OPxtuGPVnl8tEdzyfFCLpdpI2x2Ptj1vF79q8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5cHn/nTmBcnO8/2qEHuQBpiwrmrs+9VMFRXZK7ikjopIGq7xQ
	03M3Px5O2I3QoKon314g5J3Hbkor+Onp6K+qiY3cFnMTnpOTxiGl3U+pMigB4dTe4C+Zq/NT28q
	vMF0/jWDdkpY6iBIyC7E8w4ijumdtPZoe4Ra+RYwKZdnenIUMWOciTSZI1DQV9gs/7A6NqeBfbQ
	6eCA==
X-Gm-Gg: ATEYQzwdZbXDOUhopnm8Rjpbm69kXjFmx1ys6KBS//jw+Ogw6O5Prs4a5t6qtX63wWl
	a07f2GQSsLX+m7tOztoJ8At819G5njn7MAt2BuMp922aq0cdoNas1s0dWoZM4CAXLLldTeG14PO
	zzVgD9B9cU0PSkNj9xhlj9rNJY93oDhCRYoxeO8E+j2mc32gz9q912emzRmcCaHk04NZwJIaWtl
	brisfXPsbBxnwF495TyjLmKqS902tk2PER5+BbWDb18IdLcpQ/dHrhUeHnQi1KWObyvSKZmnkIB
	/k17gzSWSbuUDrMqihiM3dmYCjBOrqzSpyeZV0IM5q27R4WP+zZPNZl/dlKLkKYQBuYe0U6lcab
	d5ZWysshvxZGyU2isiJWiIEYh2Lg/vXd0RA1qFTQInhTUzEcoJNsSwr2QacPIpkDfzZxFCqZ9MF
	vcRSQ=
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cd5afb0224mr487943885a.7.1772701897053;
        Thu, 05 Mar 2026 01:11:37 -0800 (PST)
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cd5afb0224mr487942685a.7.1772701896576;
        Thu, 05 Mar 2026 01:11:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm2589351a12.17.2026.03.05.01.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:11:35 -0800 (PST)
Message-ID: <ebee2fcf-9069-4a9f-ae72-86f4471cd4f3@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EKjNbs_oYKgBZGNO8fjN6L0NLtjzMyTq
X-Proofpoint-ORIG-GUID: EKjNbs_oYKgBZGNO8fjN6L0NLtjzMyTq
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a948ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UIR2zDuwlqQ-mzEo0xkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfXzi59zruT95kv
 C1eMswAopvAVPneSeUc2GG0dnnOGYXxLos2FpcKkraf8vh2RdvqC/V05jrGglDcslrld7i/794w
 1ZDnUoIi19M2I+0XooBsrDpTHw7s0rZDOb5VwM0wNBAc7mKNh3ePAPUgCOOdZYDc2XcmzC1yQeB
 E/ndw+WGN/TP0jysnsXdSr/3XcR4Ra0TxTwSjCrTGotQcN+v5qiNbyPKah2rMFXjbM8iYotGk8A
 nbL0+N4ImqWiaMllazVRxlYt49Ghn1P4fOVmsdctveHmRjdAN2TE1EQZVs30rbk+OnLAoAsepmy
 3hZZacykIngzdyRj78wLOxrmtsUYoOhTUjonPJ4+vqLxD0/1SDqLF/djx3TdbwG3uHiOqun0NN1
 IkyKUYxBapOO2FPD+pRVMTNm0paLKBypP1xjOUDOPu6DqQI2ZZfTkRlKICw3X5cNCOlBO7yRGj9
 lvyiV8np3PgIOe5wPtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_011138_684695_2842B880 
X-CRM114-Status: GOOD (  15.14  )
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

On 3/5/26 9:51 AM, Vladimir Oltean wrote:
> Hello Konrad,
> 
> On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 55af015174a5..bdfa47d9c774 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
>>>  F:   drivers/phy/
>>>  F:   include/dt-bindings/phy/
>>>  F:   include/linux/phy/
>>> +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h
>>
>> Would looking for the devm/of_phy_ prefix followed by an open parentheses
>> not suffice for the 'has function call' case, instead of listing all
>> currently present exported functions?
> 
> This would maybe work when you run ./scripts/get_maintainer.pl on a file.
> But I would like it to have good coverage on individual patches too. And
> since the devm/of_phy prefix only matches when you "get" the PHY, not
> "use" it, my fear is we would still be missing out on the most important
> part of the patches.

But that's just '(devm_)?(of_)?phy_[a-z]+\(|includes.h'?

Konrad

