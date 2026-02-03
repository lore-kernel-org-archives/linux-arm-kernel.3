Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9F3E83072
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDpwGXgpKN7H7soFlm5TbR7WhswDKwPckmbYGm3s39o=; b=fp82W/vTMtqhJkB/MdOQXdN3SA
	iH+sc544/L5u9e+bmli8MZ4QKAWw1iofM8jCqh0YpOdg0ceWGYIQW6dijhp7FlxcBtJT0s4pNjUcX
	JMkru26S356q2Xmahv/V2teVk6lnL7WCqlG22sS9WUWRqNpjFfOhzs84yzh+fFF6Hj+1v+VFcyA35
	kg2zPwj0aox4ulZWn9NvCq5xGrAkIk8ebuXv/+9m9+yes3Zq72HTW12TxnL+Pcrdy/a3eeIuvTb1+
	OhgipavpfY6JZwyrhc7cq0jnWpotQamLjYOZm7PKT3gKqBjz/+eQn7jsQkiiVmSUWeCEdF7/Oejag
	telQqFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD7I-00000006QIT-2mlt;
	Tue, 03 Feb 2026 09:54:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD7C-00000006QFE-43Dr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:54:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6138o7K6849172
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QDpwGXgpKN7H7soFlm5TbR7WhswDKwPckmbYGm3s39o=; b=g4r37RkWWiBZHXqa
	jtqOVFY4ZkpccAZi5NDvXtKF7rvAz474aybRy76srEHChmZDD+fcgrrm7BxjsEeY
	ZK9+jAwJxXzQYSFq7N3ujtCEkNopgG5bblrCvguQTYti1LI9+2x4P43p8d2Bpzl5
	bjzb8/ez8+ztSAFOcNxz/cmSxmCJDkp4wqN/XKY+MLiEdgx1xDdDKr17kQvL/rF2
	KzZANABQ22IQtgLl2jkMu/4XtUCDT0OsfWognrE7LoaU1Kv2TIpLMUn67bWmx+m1
	RcSkZEVXY8pyNX/kP1KmKNbynv13XVDa7h0+ItyNnfrZ6z36QRsPZVNyD71LjSR3
	SUm5tw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutg7jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:54:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c5539b9adbcso11182926a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770112473; x=1770717273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QDpwGXgpKN7H7soFlm5TbR7WhswDKwPckmbYGm3s39o=;
        b=HvGU72if/m0l8IaD9UEuNnIxKuKhWuJ4CV4BtujIwYJ1iwQn83cYaA5MPwH1UYmq7T
         GVYLAegC16wPtIb0C2fVaul9gI7ip/S0SGpwFPcB1k3dWH4hMHf5tzL/xowFZ9T3Na6P
         tf81MfAegx5GN187rH8JxoTG4Xo5B/DxFbQ1DIpWoaoQBqJFLMUiPseeQ+Zu81CkWocJ
         heRqhIfvUYhyyfKdmxftvMh/vhEC64NTyu2ASoqgtD2EkDRvW4OODks2Vd4T8PV/Hdmd
         u01vRTLrvSCxrWLPwTsZGJnqCceR3hrb7XAX5OKvUbVHfW7ehEUlLhg5YoC9nNCX3hDp
         ZWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112473; x=1770717273;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDpwGXgpKN7H7soFlm5TbR7WhswDKwPckmbYGm3s39o=;
        b=rbwGHCjlkfZKG18crdvCnW6Vw515nm45uuvgNBbk3LZIy7fW7L7lUDvGcqXmzBg11h
         qBuhuA2rNQ5gPo5P9atLn8byq5OnyBoYggyeKMe4Q9nN0XhFXnR89HFmwBHsri2BB1dp
         hXXi60lul2G9mHx78PN591+dBDMVqz5hwAuWCEysUkGMcYU2+q98PSzSqi8Xrnu58DNz
         HlYwavpYRBniYgzqtaaINGbTErdZb+avDOtHSJTKaZLfrR6RRmD74jkpgxwu1KgyEM3w
         4g08IgXis+BeKNFoGYecGv8QV5SocWRunHv90DF86W9qywwlyuRN+i+V7aI/VCnY7fQz
         1QOA==
X-Forwarded-Encrypted: i=1; AJvYcCXoroUl+XPJ/tAGr0sHVqeAJLHG50PweKiEjxDk8y7vIefDKTE1H22mQenLQN5L6FI3DjRSbNzmGCT7DeSCaoUB@lists.infradead.org
X-Gm-Message-State: AOJu0YyxfN3KOjlkebks6VwOPz+ifesx4gajK3mIqOQ8hfz3O55dAa50
	E/P6KD7Umvlpmeefscq/IqETp3yJ5h0YNb5iU+LLa+MYd7G9TQyfDL7mXSjaCATAlJAsVsteCo3
	atB6KFXikP8MR8+5VaQK93GpaLA5OWT9RHJZzYbOZ8USQXiG/zYWgMkK5L7j1iYCrWwODfuQT2E
	pyzQ==
X-Gm-Gg: AZuq6aLSf+YuVwuVYwyCYAKPNczRQXkj2ckVshVNTOtr0AGYMhFqB8lL4W5HiqR9Hdr
	d1lQ+lKHg6qyL9kHPlot5eoptWl5WdN2ceSrltJdR7z1eZ8qyte2ZjsMuZSAmh3QYMd6UvCelpD
	OJaxb5sgtxKtTH43/UznJuvUuRVz4wU4deZNNk2so+5+Sq9Vr087Ylh3pvoW2ZUOD+9YgXJ0vKr
	2VAlqE6QV8lluQ5ONHabHdamxvn01oNtu48f4oCnOhOHyS+EeGjwUJQZWYP2smBQ0GwDogKFKFB
	rlq7mW16DyWbEPMou40GkVXD82SSl4rGkby5wMftp9lBcruTKsfoeQZiF3ErESNb+QxpNdPKj7i
	gkZ6Mdwa8jr04ApJTTYHNFjGIuRAsZCF/8t15tIts+GLe3x5ugj74QtLgFjLvnG9lVClwCm470Q
	==
X-Received: by 2002:a05:6a21:e8a:b0:38d:edd4:2fc6 with SMTP id adf61e73a8af0-392e018fd07mr13913224637.70.1770112472966;
        Tue, 03 Feb 2026 01:54:32 -0800 (PST)
X-Received: by 2002:a05:6a21:e8a:b0:38d:edd4:2fc6 with SMTP id adf61e73a8af0-392e018fd07mr13913197637.70.1770112472533;
        Tue, 03 Feb 2026 01:54:32 -0800 (PST)
Received: from [10.133.33.97] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b415b01sm168462075ad.40.2026.02.03.01.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:54:32 -0800 (PST)
Message-ID: <178f868a-a152-4f2e-87a1-b83b7870777a@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:54:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
 <c739da90-de92-4d84-bb5a-e653a9fbdcef@oss.qualcomm.com>
 <c14ba722-5195-472b-a4d6-3b8f6421df7b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c14ba722-5195-472b-a4d6-3b8f6421df7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3OCBTYWx0ZWRfX3FzZvntjmaCj
 drqF3+fE2USuF9vqLEHdlzY52+pyDl9Df3uNGvfOhl28JBqliL4NiGirhI12nCx/ySpkLlOSo2K
 PreBAjyj0i1mEwNlRWWcfvfMxMtStc8Mp9b3lERh11ycLJxbNYXPYyoHPjilqUXH0DsAcB7bMIv
 dW1fKB3vwGivzRTByvzIiTAY5wle+Sqg4ib7B2TUnQWefL2n4c6fw0uR2XltSO7PdYHMmWPaDz6
 1L/8gVjkNO8ahWr+bVp8oSghcRiI4M9Eso41m4peJ4Ixp748uOGuYDYdWH22V5SQbRJ5odznIZM
 +PXghpUnpTXchG17bLOJz6zACQB2VKmEgFLAqu14m9biJB2oPjGQcRFua/mz916WFFz2tM6WtQH
 Fq+LglqElIniwyRBTPge9pqgqoFJTAQvOlq18ZqDcrA3d4uDHD1RNFlHzhlRc6Xz9NCfBURSa2x
 q58gm31vaRMxH1FwBnw==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=6981c5d9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WGD1OUi62yeOWj14Vj4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: m1zU4MMPgKhkoUKcPuZVC3duP_Fq2JVG
X-Proofpoint-GUID: m1zU4MMPgKhkoUKcPuZVC3duP_Fq2JVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_015435_117040_871933BF 
X-CRM114-Status: GOOD (  19.92  )
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



On 2/3/2026 5:50 PM, Jie Gan wrote:
> 
> 
> On 2/3/2026 5:44 PM, Konrad Dybcio wrote:
>> On 2/3/26 10:32 AM, Jie Gan wrote:
>>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>>> tracing data from source device.
>>>
>>> The CTCU serves as the control unit for the ETR device, managing its
>>> behavior to determine how trace data is collected.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++ 
>>> ++++++++++-
>>>   1 file changed, 159 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/ 
>>> dts/qcom/hamoa.dtsi
>>> index db65c392e618..88ec29446ba1 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -6771,6 +6771,35 @@ data-pins {
>>>               };
>>>           };
>>> +        ctcu@10001000 {
>>> +            compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";
>>
>> Sorry for not pointing that out explicitly the previous time around,
>> but 'hamoa' also falls under the "had numerical compatibles" category
> 
> I saw the dtsi is renamed to hamoa.dtsi but we still need to use 
> qcom,x1e80100 for hamoa?
> 

I think I was misunderstanding here.

Just checked the compatible for hamoa:
compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";

I will change it to qcom,x1e80100-ctcu.

Thanks,
Jie

> Thanks,
> Jie
> 
>> (you'll see the only hits for "qcom,hamoa" are "qcom,hamoa-iot-evk"
>> which is a board name)
>>
>> Glymur and Kaanapali are, understandably, Glymur and Kaanapali
>> respectively
>>
>> Konrad
> 


