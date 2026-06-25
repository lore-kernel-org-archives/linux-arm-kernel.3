Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB0CCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/g2z6S4UyNyvA2VwtSLOaDO3I/HgkYGv9hdKRgZsBA=; b=0E+OEn65UceFoL2ojJx9+NJUtH
	drq0VwMA8MUdrHaAsW2bMth5j2b5/KVEaLEWOQEzi9Gkuw1ckZ6cOGItyCpEvc6oh7bE/KUwWvPvl
	4HsumzUvDknVXPE0o4omXKXR0UbBMI9IuqGu38xOz6aCuNMay8KZs8GynaZZl0Kxcjr7JlJ9Sl5z6
	cWfM5zaOZsIDRTwAaoFQAa5iBvB4fKj2qHXOLifix6M9KbRjXwc5FItRugT0ErI78jtJ/d2dj4Vkc
	qBzBpCSVS4MzeJAEFEFpHP/whNuolZe3ULj96jlNBuCjp+i03QlPNVDY+zmvrotrp8WKndBiRPzO7
	YWs2WvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcedr-00000008m3o-3Fna;
	Thu, 25 Jun 2026 07:36:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcedp-00000008m3H-17Va
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 07:36:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eFlX1192139
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 07:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/g2z6S4UyNyvA2VwtSLOaDO3I/HgkYGv9hdKRgZsBA=; b=GSUGFZuS6UZ4eWQ/
	WknD/a8T+dctpKkPDKJTOJTMNWn0T6gAlaSzlsl5MvIyb7S4y3TcFlOt8W/8tlQS
	i/eKln6AlUmI+eq4miihoRslJATBy0CCnofdcrs43u9UJezXkTzHHWRAR4sgec3D
	JyaXkeAr/XEYWKHt7DtBkGuFMDmlXtXxxXz+bA29P5AIZIcatR0Khyj3mcgrRwdp
	GziDPEUWRf7A8XdA5abU2j9jyROynrjtMuArClxnXRcTobWV9d25pZqPA+uVoD0G
	NQ7Y4Raso+zGblqO5z+ADBSHY/ZTz1YNqysAdGjCUIrjC7MMxl8+bbc5VtkcOYS3
	P16Zxg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmh35p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 07:36:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88da04b71dso1227656a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 00:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373011; x=1782977811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/g2z6S4UyNyvA2VwtSLOaDO3I/HgkYGv9hdKRgZsBA=;
        b=L40yZ3Lv94KQM1LILXkidWir3cSLknlHiMBs7GW85S9mknRQTTgKl5glgT+E+ChAFl
         5EAjMIDV6/iZJGxjTYJsSq7gRwDgQOozYyfgRkB/3dnHKysbQe0xdrc/MSRteZkDYxjy
         yB4ijgFQi8JLT6D2fpKuDGLxkgIM9AGZB2cFBQ3KVqNBM/1scxHNlbod2slrZF7XPTIO
         7orib2gbwRCK815MVSFbOLk+YzFyNb4MOM7SJOqAfCaIq8Wg9B4KDkhfKYb0+zku44Dv
         +FbBB/jmyp0oK2MWVC6QG4iGfOGEoZwx1RjPQasUKULHahig7dTvuO+lbfXJOZFOTYQj
         pmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373011; x=1782977811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/g2z6S4UyNyvA2VwtSLOaDO3I/HgkYGv9hdKRgZsBA=;
        b=Z3yG+9mPOciXnRc+SZdA5GJbjDI4YE4Ar0l0f6d3McYYjhiud9oaMC1M88eZDQSNIq
         xSvt7CMziTJJHDedhFx+87FCXhyNOuF7hGL9LXlIVj8G2GEJHgG4//aTB7SRQZ2Ax5Nr
         S22lLYG3CtmBxYqGlPTrjXSaelCD7DYe3vi+S27HIL/NE2J1YhtFQHjcYcYNsXbH+K0D
         FXSEF2evJwqpKwoQ0LV609iZcbFA0MtX0YqS4nzYMmPQHhBGw/677Z1riOD5l/d2JTdf
         A7z9wogJYw8TLggOdtSNJxp0P+ndPg0iFXIfKUGNUV7EkX/TJR6RjY+AfGgs7yfKlPQu
         aCIA==
X-Forwarded-Encrypted: i=1; AFNElJ/96h8r9D2VKhAS2cvrH534JE7WcjGK80L+UrKtu+kmvFfxZBrqg/kpl0WKLzcvZWUKiGK7UDXACCAIr5JbX0hm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9RMibKYQ8yZQIUxGZJHSRxvJvN7cANWwswncl7KiFAxLD6ESn
	Pw3v8MB7AkCs2/MB5iliZNPPyLfG/oAGKlS6EP6lRkM30q6hiUbZFfYTob6BuTfJYR5001qMIne
	Lh5QcjmT+fl0vjsiuAvtjKPWkod5N8a2MN84QRiUQ+3v4/6y+VDf0Yoly1C+2seLMhcjOusP2s/
	r/tQ==
X-Gm-Gg: AfdE7cm8wylOOeL0ba6b0uvs7ZyNmC7e3iwWjzKRGKZOgSKgVtQyM3TJnCJsh4DXe/Y
	JXjVj7jOGoq/FwW12KDyz6snDWlrJ6Y36+ho7XXjOVH9Yfwrzw53WBhE3ezEi5Rj/+eigo6UMmO
	KdbRiL4jlmHrv6ARQtqx8O91KknbWhA/ivhOEx2shRE6QoV53Fsc4oHF2TDAjxsqDV49g3YpZIM
	HP/FvJ5SqFm4oD4ta6cYWg6vwrkn/Qb4JpDrpGwhrV1VC/On2U2Tyk3OKv/Pn019bCExbfEaaG7
	8aF7qm5Cip/l7IRv/z7Tqhn1L81gYmvpDGncExZ36Apn3TihzGhsHEDBVYAlvLS4eVHrYjacQIx
	xeK7Bk1acUP3w/rYmUYNfOggSR8hCSXZbVp84VeMOd29utmUD1UQvgiBU3i+j0TAyun81a/eXah
	97
X-Received: by 2002:a05:6a21:3991:b0:3b3:1a00:1f4a with SMTP id adf61e73a8af0-3bd4b01fc54mr1907835637.43.1782373011208;
        Thu, 25 Jun 2026 00:36:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:3991:b0:3b3:1a00:1f4a with SMTP id adf61e73a8af0-3bd4b01fc54mr1907800637.43.1782373010634;
        Thu, 25 Jun 2026 00:36:50 -0700 (PDT)
Received: from [10.133.33.237] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b9dc216csm1180072a12.9.2026.06.25.00.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:36:50 -0700 (PDT)
Message-ID: <e7fa9d40-8efc-4b1f-97ed-cd1e98ffdd2c@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 15:36:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-tnoc: allow
 arm,primecell-periphid
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
 <20260625-strong-daft-pudu-21471f@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260625-strong-daft-pudu-21471f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3cda94 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6mFE72AEMYK6sz6dviEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NCBTYWx0ZWRfX+oyujyCwvKIZ
 1DZvOnOZism6+46XOHLIxXXlBnaom6urAlytP/cVmZD8mPutFtJrQoojTv6GQNPTCPhfoRVPBXT
 O4L7XTTtVmLFzV4pyKx4GjLkhfBwhG4MpDrGdxyE2ex3CM56QPIsDw2ia0I/fz1CeFEd6YROqUC
 91bPRLfjI+aRpuI6t8e47YhivC58Jk121pzx7TlC1B8t2wbOvBokB1RNFPA8UvH4kDTSRC7txV2
 1nWFacYxBOF+cgH4YAftBwJcbA/I4MWHPYQks5efoEFN6WtjT81PM6gJFzNcDxpELLICdBkZJaC
 FSPYXE9eMmxhKRNb3CREkJceD+ITulx9En6mR0z6VjdBYWeNhd7ewfBa54zfDc7bymB7CQWgnfO
 ysQfaZKSwg82giUZLYiLmt23djNoTBm4U1n115l4pxuNRx3WnJpZOFMKZDLxshoGuQ6BhHJ9+1P
 UtI5w9DxT4Me97Zx3zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NCBTYWx0ZWRfXwjwoH4DHdNPs
 OG/sGrIZfV4XcDx4CPKvMvXNGLcwE8R1qf3+5nlil/p6B9B+CX8zri0/GMsBmH70JVWIayRdrWD
 iYW7yo6cDjHN+BaRCwTyJq8MA1nK+G4=
X-Proofpoint-GUID: e6WoJU-spNvUUm5xNGvDKf_zZLTrT80E
X-Proofpoint-ORIG-GUID: e6WoJU-spNvUUm5xNGvDKf_zZLTrT80E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_003653_430208_D59E0E73 
X-CRM114-Status: GOOD (  20.30  )
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



On 6/25/2026 3:24 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 24, 2026 at 05:49:25PM +0800, Jie Gan wrote:
>> The TNOC device is an AMBA primecell and may carry the standard
>> arm,primecell-periphid property, which is used to supply the
>> peripheral ID when it cannot be read from the device registers.
>>
>> Reference primecell.yaml and set additionalProperties to true so the
>> binding accepts arm,primecell-periphid along with the other common
>> primecell properties.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> index ef648a15b806..9624fc0adfdc 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> @@ -32,6 +32,9 @@ select:
>>     required:
>>       - compatible
>>   
>> +allOf:
>> +  - $ref: /schemas/arm/primecell.yaml#
>> +
>>   properties:
>>     $nodename:
>>       pattern: "^tn(@[0-9a-f]+)$"
>> @@ -78,7 +81,7 @@ required:
>>     - in-ports
>>     - out-ports
>>   
>> -additionalProperties: false
>> +additionalProperties: true
> 
> Nope, it is not allowed. Explicitly mentioned in writing bindings and
> all DT introductory talks by me.

Yes, I am totally wrong with this and I should add:
unevaluatedProperties: false

and remove
additionalProperties: false

Thanks,
Jie

> 
> Best regards,
> Krzysztof
> 


