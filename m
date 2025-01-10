Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22127E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 00:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmF+DuU3JzVjgbd8y0t7kRkzSWdwvKPVstxc9QQq5H8=; b=dsO4EOFqimQUFuAtkGbPQSPtG8
	TDZP5R5qcM6R8CksdGVmPamVTS+TYuIxvCXHZBdhx6rfNnwxj/ZLHGQZOrpYQSNhE5f17yDG3t+w1
	qXlQlzmqabXhzk00ew4rway3H+YsYEFDo7LaIvYyOu8cd+Kk8Y4+QQs9GDZSyBBvJmkHlT1QSHn7h
	18n5B6IMdJjF682WyfVuVMW5yiatJ9vWRD5bryp8USc004rKFt4vpxkG5/ga5yLhT9VrOWHPptwW8
	s36oLA8c+Hej2TIAa8+7TgFhecnzf05mBgtOPQ3RTX9PLGx2ayPWxeRecIoJ/c7YF7AyK5Qh/Zb7h
	4olaXtAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW33y-0000000DfN3-04ok;
	Fri, 10 Jan 2025 00:39:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW32i-0000000Df9Q-2OPs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 00:38:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509K1cjD030423
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 00:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kmF+DuU3JzVjgbd8y0t7kRkzSWdwvKPVstxc9QQq5H8=; b=CjZB72gNpfcFbn1B
	NMtx1dBmxieUB+UHEUnzOXGirMST0xzBwKWxxgG3xBILREr+mc1RPNM8glJs6TJ4
	7UrMfj3kRL1NjeeBg6JBBFhTKN6ZlVkHpqPEKrTOvI9HWGCprJ4n5iE189MEVeZ5
	QjCH0O/4ewSbG46ZR6neWfAZrsDoNwUUvOoYSZjatdD27+qMX4RthaCpPCgBovNd
	idsp2wD9VM3gLx5UMwrCbqXtGRW2q64UDUixwM4lASCDJKznwMB2P14Wyzb2qicy
	o7XXauBGAL8H49QJxBM93wClU5tc75LHT1br0BAoO2Dzw53TcYynueU7whoyHWDg
	JzaN6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442n4r0fyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 00:38:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6e5c3a933so12553485a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 16:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736469506; x=1737074306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kmF+DuU3JzVjgbd8y0t7kRkzSWdwvKPVstxc9QQq5H8=;
        b=lnXbSWru8gwO/CQ+qx5T82VxDQpGCAPTgnF52l2neGvw5qSJHVIU0BtQXEQiGuYILl
         v6mcDp38eQcfBmPqFuI9UAxpbb+G4L4yQdOykotvpjosrRKuO5efBKeEDrbyn0Kg0tFF
         raTrZZeiqo5D0knA2c/ncZbwaCyp8leaqSeJ6m+/Pmzzkzr8rtYcolzaPVACjooy4dae
         iJMiQZwKtzWAngXT8Oz3xhcnpCbgiSp2uvSMv4XkIRsEcfUeYEeNCScfJojJCv4WrYEE
         W6OehWbBWSUVbvELQ+RAgtwUlybqNUycMOftZ/u+q4wfNkVKoL+XEFledpoVvGMtIjVR
         XZWA==
X-Forwarded-Encrypted: i=1; AJvYcCVLnDfOKpw5LZyGnUcN6IemK6AMbkOfVPKMOJew3iyojXnQYD4DQCVTST+xxjEkqKVHDbtUr1YGCEOGJwldgVZo@lists.infradead.org
X-Gm-Message-State: AOJu0YyB+Iunz64BWneO6ENlJoE9GZtaz65+/ovdKCXaXirRmsbEyJOV
	aVUGsQLue7WcL8vv6CrkWdB/TF4EB8jRaYIERYM1RHsxVnYtNrd9K989RLpXMVQi0VsktHI2xWg
	gCVJkYGEt1/XB2ER5oyKMHQHBHvVS1F2iz3MfGy9/SWd2vwyNEiwpOURTuut5F7H4hJH/Qg5opg
	B++kIIhw==
X-Gm-Gg: ASbGnct8RiiQIYW/wvrWlCwcOOlXsfJH+La6iVsNxA4B7uB9WeZmGInO7ijoeZTaLMf
	2mHq2TUNOEKhwrucKAgB+6Bijwr0C1D1lY23Z8HNoNUvte4Q5PcB4GXDCrk9udfrEQcBD2pRHcf
	Ka0J303JKuOd8u80LuMPMTfPSReSJIJWUo5zDBC9JS1UF+0HSUlJlHkIjgvsk8AkiASpzkBCE+r
	fvLsmwSYWV+lDjTVMb5lpFpO3EU7gwkZNy1vroPjeFxLDr+DqjT7Wn1Uma7qbp93CGlSQ6Pk9fh
	iquZSfNUh3FjSDDd136OFDT4hfp5jlaYwNc=
X-Received: by 2002:a05:622a:180c:b0:467:5d7f:c684 with SMTP id d75a77b69052e-46c710e105bmr55517941cf.12.1736469506238;
        Thu, 09 Jan 2025 16:38:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFozTpKFg1C/Y/ohAM2r+YfB4QhoW6K8Hsfv6wtkptViZjHIU9D6x8pLZdO9xilbQsJvyLgGg==
X-Received: by 2002:a05:622a:180c:b0:467:5d7f:c684 with SMTP id d75a77b69052e-46c710e105bmr55517771cf.12.1736469505858;
        Thu, 09 Jan 2025 16:38:25 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95648e7sm117905366b.95.2025.01.09.16.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 16:38:24 -0800 (PST)
Message-ID: <53657ae6-71a7-4800-8107-a08d47a17cb5@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 01:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] arm64: dts: qcom: sc7180: Add SoC specific
 compatible to soc node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-7-swboyd@chromium.org>
 <n3fn5mnrrinrgrvadqgymv3cx355qpx5kk27nlrz2emoxfmjyt@ymwpfxf7lv4r>
 <0ab00013-0265-4336-bc30-f49492e96424@oss.qualcomm.com>
 <x6smfgtq2ojzl774jd6d6fsilxj5dte4jbfypbvxvdmaqd7pem@nnpcnyzz4l4i>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <x6smfgtq2ojzl774jd6d6fsilxj5dte4jbfypbvxvdmaqd7pem@nnpcnyzz4l4i>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 90rvyw5ZozpYbYL25Y-YRJCVJO6NQY1O
X-Proofpoint-ORIG-GUID: 90rvyw5ZozpYbYL25Y-YRJCVJO6NQY1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_163828_736957_3A11A038 
X-CRM114-Status: GOOD (  27.61  )
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

On 10.01.2025 12:45 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 09, 2025 at 03:10:33PM +0100, Konrad Dybcio wrote:
>> On 8.01.2025 2:02 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 07, 2025 at 05:28:43PM -0800, Stephen Boyd wrote:
>>>> Allow an SoC driver to probe for these devices. Add the SoC specific
>>>> compatible to the soc node. Leave the original simple-bus compatible in
>>>> place so that everything keeps working.
>>>>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>>> Cc: <linux-arm-msm@vger.kernel.org>
>>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> index 76fe314d2ad5..257890a193e6 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> @@ -782,7 +782,7 @@ soc: soc@0 {
>>>>  		#size-cells = <2>;
>>>>  		ranges = <0 0 0 0 0x10 0>;
>>>>  		dma-ranges = <0 0 0 0 0x10 0>;
>>>> -		compatible = "simple-bus";
>>>> +		compatible = "qcom,soc-sc7180", "simple-bus";
>>>
>>> If the new driver requires this compatible, it will break compatibility
>>> with older DT files (and it should be avoided).
>>
>> IIUC the intent here is to provide backwards compatibility through checking
>> for sth like IS_SOCPM_MANAGED(), sorta like HAS_ACPI_COMPANION(). In that
>> case, power sequencing would be done by the socpm driver, whereas if it
>> doesn't hold, the resources would be toggled by the device driver
> 
> I think that this way we end up having PM code both in the device driver
> and in the socpm. Ideally in my opinion we should be able to migrate all
> pm code to socpm, keeping compat with old DT files. In the end, if this
> is the only change to the SoC.dtsi, then we should be able to live
> without this compat change.

We should be able to do that with a dynamic overlay, I suppose.. which we
could drop after some time (probably a rather large amount of time)

Konrad

