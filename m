Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A105DE6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 09:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t05rWGTb+LRgM4XPtrIbHRF5TcNKlqjO7KIC787c9uk=; b=LsEdZ8YsNgSsupmHUF32oOnZ8C
	eJYGDazyH84CD3IWS/nZpaV5CJP1c36Yp9thFgvMnI21Zk6ZekG3Qm2AfLiZh3MgH1QoZKxbY0Cf9
	1VT+7WIXiEcR9MDy73RKsE0KgJA+GLD4ryWapdnKbDr1C5R/zgZtaupn5/aloUlnC+F3wioFuJY24
	Egg8HgKA3G3LifgjhP1jsZWBL3fxU0zUq/flflKh6DaV09nzzifZgj8THEfxkM77qwWIxJlY9156i
	bpwAkxg2c3/mb9qOUxou8i7m0O2CSl6E7+EGpQ5Gj/xYv45jjYiIHLMfFciS5eBS4wE/n2an7LOfu
	quvJVzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyTJ-0000000EjQv-1AxN;
	Tue, 23 Dec 2025 09:14:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyTG-0000000EjQ7-21wy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 09:14:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2aS4D1895207
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t05rWGTb+LRgM4XPtrIbHRF5TcNKlqjO7KIC787c9uk=; b=NXfjS6e0PuzgMR+8
	rIVKgZOL8ux2lMmNxFcmM3gBE5vy1uKSHs7W/o0hqiqVMATXE1L/+k5q5yYLqMKq
	lFacsHlA5ckx1Nbn8t7I4zDqFC5pyKSUaSu6i2CnPkCUuy8vdrpj99Ojf3+Qxg1Y
	5lDIXLfHeOBiF6ZviPrOZDZ6iQNFsoBLJZ75yof59BcQbsjMNytIKhEcDnd9wpN5
	Rzd6jv+5gNCFvbpvwz8AtLZvIJ5l24X1ZfwaftVhPC1h0+lTy+FJvONlK5fBLtBV
	GEYny+PcbaRp/HDzZaFTdk06DS56yjLIbdanIrAf9NLNueFLCbwjHxF8FAyejykF
	PvomlA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74tak91t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:14:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b952a966d7so10031962b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 01:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481260; x=1767086060; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t05rWGTb+LRgM4XPtrIbHRF5TcNKlqjO7KIC787c9uk=;
        b=fftmRfEFHHS11rkrfWF82KecZRCfnJprWtx30NtuI+HKedvOSKk2KSDkt4M3g1IURx
         dBwRSPWHryoQuo/15kf8ym0+2tH7my51xw+HANQABOSRZiAPk56AsqnEnGzkVSwiAN6k
         U7IEpNkomTQ1uNoMeo4eEe3jNPkN3wHgE5PGZNbKi/GhRJV/DNZfw3v5lqEDlXwv1bqF
         jlvpeyEK9b10ftbWr6Vupgwb5ZUG9Cyxa+ElIy+TipllAcEKaF0ks1QPaxsPSH0K3j+a
         GYP8P1siJ2h7UpzYcS510xbT2aqNi3dqT8DrnIfQoGaD7pm669LbjPKj8gpnoi+d2V+T
         XXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481260; x=1767086060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t05rWGTb+LRgM4XPtrIbHRF5TcNKlqjO7KIC787c9uk=;
        b=XTJzqWfYMogKgv6w85wsLkZSdA6Xqyv0QEQO926/Yu1Lf7UtQ9d+uGHcfAH3Tfgs2R
         e3Lo/KpUvVfmKVhkrsTf+crisW0SKYpeK89Oy+X/FzFLpTyxlaIbzHiea0OIvG4ddVmc
         2ICnrzeTKo+eoWlN68XOLGPrpS5Sse+LR/LE6iio0xR00YeDYnoaVhaUq+srEjuxn2+g
         lL6mBX4tN7zyj8mXbSOA5zHUKg9Rq8kTvcIYiqjgclkZgkSKsYE2WzFJGWA7lZ3WisFp
         FlDnldyxQYLtEzbNgxiAyoPO9EefEsafiS/l6ecjnFG/QHTxDsPpt1utkkzwAtpU1a2u
         NFpw==
X-Forwarded-Encrypted: i=1; AJvYcCW0Svk4zSIYR3Eof/3I0dGNBhtGbVPVHBIFWN7XxJbVrR5NMi1SQLojRuYmD54veh9hROrPvdrgI3Ku+0cbL/2v@lists.infradead.org
X-Gm-Message-State: AOJu0YxS42Z/OLWuX0TGZ7PnN9vPoLmmfhKamsf9qcd8IPtcB80X4EZi
	RXCMoG2XaHH/ARovTcW1uDdeo3BGZEELujEmm/IyDg9t9TbmB6zKH5JtJmsp7hvsQ1CkSLS92MM
	zSnuv+PlzMJ8tRQznuBOpIU0xEN72CzujhoULzztxFUD91PiIJcD1y+GKzSZeuhFmSq23zye7Yv
	T0ug==
X-Gm-Gg: AY/fxX6sXKdcaf0a5v0o9JbX/D9q2ZaDHD2JI/0hbB1QTg7WdMlE+xTIfsnyqCyEhjD
	GBKCROh8+/65oMXU+PBAHkV1DhT8+0BTG4i1xp/gyvN4BJUTJfgpnxLaRB4Te1pRdYD8ZpOLLV2
	Sv+1AUUwz8cJtna8iAIZK+HMsK5TY27zYmyFu+PvxUPyu4tOR5w3lesAJ3OF+802L16vMwfHBRc
	CQUoomO4rQPsrJmXSi5g92zNiS1Ti1lUGiNkGY/30YMStfJkFaLAueg6ErAnLanpiNXKU83Wmyg
	4dXFgQjOgcN4i7cFgyFuvhXlVmtgakfU7OtHZ8m6GWfdodQVA5EnZRbjE8+AnBnoi0XA13HQ0QK
	enzqrGe05CxzxVCb66Ym3+D5ZFcMLK3jIn4fVmIRbkfQDoS3z00PabFcMppCFULpGrSdtKsP4YY
	4=
X-Received: by 2002:a05:6a00:4298:b0:7a2:8529:259 with SMTP id d2e1a72fcca58-7ff650c7d8dmr11719160b3a.9.1766481260113;
        Tue, 23 Dec 2025 01:14:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe4HdZJVbYIWjRU11UlrdiBLG05fYEZaonvOroH3LucyJE760wFEvOG+/uKCU3r36+UDgyZg==
X-Received: by 2002:a05:6a00:4298:b0:7a2:8529:259 with SMTP id d2e1a72fcca58-7ff650c7d8dmr11719135b3a.9.1766481259647;
        Tue, 23 Dec 2025 01:14:19 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa328basm13090376b3a.11.2025.12.23.01.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 01:14:19 -0800 (PST)
Message-ID: <076f6aff-4f9a-4630-8e5d-c11f0272de70@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 17:14:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a5d6d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=RAHE_PFZX2t7DYYKEr4A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: S1eivTlMMX7vo34Ycg1MUq2cuOmv25Pj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX+5tpGGF7K2r3
 nGZ+LW6Iey8313LHxn3YqfDP8P1PKsbyW1vfgpDyYjGbmY7FkFAOqBHeKUZr5OrLndjPk7PjS3N
 yP1oXbfqc97NbXTVnMrtngK/mNAlBSH//es2IwVNuFlbZ9TpO+aLJOexBhWNe8+ubQWGw8zRUx5
 KDqHGiHGVvYjQzK0cThhDWspmRCH8bbBXlD2QQu07uzMToJmMcba4O2o6HXpvE+1FV2ufiA8qcX
 sloq34QcNxRu7xmM4f0ECz+s6JJmPMv/U+xyhjbrEpdm2+idevgjzKU+LfRuzc+XDDQlzY+Jdvn
 vSjzXz2si4q1Z03NSTR+kfS67iQSF6vtA5s3rr3Aw2kBP6ZpJbICTVHh+RHFpUDH/N0i8By/KTO
 ItUZNqoMXSIbcCh41XTN52tA3qiGSwt/mb+tZuL8f4e5P4xwyvJG6CyoEGT5zAf0mbyuMFBUuTZ
 fO+q3qjx3qaVCSkP75A==
X-Proofpoint-ORIG-GUID: S1eivTlMMX7vo34Ycg1MUq2cuOmv25Pj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_011422_653049_A9C2C5AB 
X-CRM114-Status: GOOD (  16.53  )
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



On 11/6/2025 9:57 AM, Jie Gan wrote:
> Document the CTCU compatible for Hamoa, enabling support for the
> CTCU device on the Hamoa platform.
> 

Gentle reminder.

The dependency[1] has applied and I have tested this series on 
next-20251219, no conflict and work well.

[1]https://lore.kernel.org/all/176615287813.688536.723538049922655005.b4-ty@arm.com/

Thanks,
Jie

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index 460f38ddbd73..57dede7a90e9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -29,6 +29,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - qcom,hamoa-ctcu
>                 - qcom,qcs8300-ctcu
>             - const: qcom,sa8775p-ctcu
>         - enum:
> 


