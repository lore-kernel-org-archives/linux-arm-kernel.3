Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F67E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWZ6vfFZXZOnn8Rj5pWSW2pSt+O0bU6UJnoyNmvkHEI=; b=kG0zMT/V3UZIBCnqdPIS/f/cMI
	JuVV4zRUBHThxS/l8I6t5Qs2VWeW3MOzj8OiPsdvNWseCs/6BNPXkzTtMHOgXXoBq+0hCMlrpzSUy
	WPG9o2RKQQ4va5kMsKRhgcWOaMqDHSMm10pfBSuAyHSlCC+28Z6JPNhNF5y6vSuAf9bQN1Nrv0xh6
	PH802vhjm35YOpDKIYxce+xI/flwRvpvTOjY4gy4bfMZyBKYYzgzNtpNfr9mxu7sh9EleY4ird59M
	wUSkwGF6XH8D/0VWf8IlQmQUZp9SCp49FcHGikNmj9VW3rYKSz6o89eqhYgkAYoyKXp+AGHk+XqhZ
	b7B9Rqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLsF-00000002nhq-0EdS;
	Thu, 19 Dec 2024 19:07:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLr7-00000002nZe-2bBu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:06:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJIuTEE020684
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWZ6vfFZXZOnn8Rj5pWSW2pSt+O0bU6UJnoyNmvkHEI=; b=TyfdPLYK7xrCUmiv
	YL0g9YeZeo92wDd7G3lM5IZPWHtdXeLQuPiVzQLsPNV+JXNSmlOp2HfvThIaiFpn
	oCK7sqvjM/oPWbdXoKdjiGSvSXoDQJ/7H3ejcHnRFpQlCeNf9ljdOZ78912H44lm
	Ae35tIaZCRwv+7ZgcDAA/uy6pUcuO5CrU7mlPFASmcoADbEyGeYD7/utC9oW6V2v
	7HoK4GVCYjzgfrnLaROih1wxEAQuSuKJTQIdv8PkWIPi1e4B0k7U0unTHzNCCCo2
	pRez/pTyxoakCtMVb0/oLAHLEcG4/HZUqRMY1SUXuHGgA9nLBJ8GyHQynIB6XFdL
	2J0Q6Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mfup9nh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:06:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467a97dec51so295781cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:06:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734635198; x=1735239998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWZ6vfFZXZOnn8Rj5pWSW2pSt+O0bU6UJnoyNmvkHEI=;
        b=oSNkozVp7bbPNqFCM2I37pvVJpWBnllDQ2Mplz5uGVaO0AvQ6A1eKQFPzWmk+teq5y
         tqXqlxcaIlTmk/TwHDmd8WoQQcxO2HYJXS3H8ArUq+6XWZahi1DNrnhkjRFP1mq/fPdW
         5iJ9lEktJ4QkxLS18+kjaqOVjMNkvj6egZkUSOh2jANf8lP84CfOWoXVF38leEIU+LAy
         SoiVw/mJVu0Z/6Qdw+AqUXcqUGxGI8N2Ccy7Ne7Cqcth/yCZOkqptTFC74DoMsON3pXu
         km9+w7VXtucp6Av/4YAieh+CJA5kMUcXDpp2u7L63l5JTtb0luKXikTM6Zs7va+JYuyK
         Ykmg==
X-Gm-Message-State: AOJu0YyDAI6psn+i+fmerVMc+DP2DcRzOEcsIovRwIB7Gy8xjvrxpn1R
	jAlLDCLr2yH/BIPWt42E0LlVw3tGfTNawG0v8Mtxuxpc6g8W7JWnpORvKlGUcBlyZua58A64cxr
	JyY9kL1s7WdoGVtEoJf1qOIJMYdbDtkNzmtKMeyeeWQNui2uQof7OwAN3y0Di7IoJ8TcvhDoeoQ
	==
X-Gm-Gg: ASbGncswC4HN/7NgjBKSNgxRshxq+eh17aco66jFC4czqgb/61yU0PWCunRcC89j8kg
	t487fAgdUYIl2kkueLIIrzH5xmRj7pw6btNjF6ojYqFHtBIFqxt1BTxzkGo9LUKJkogoOBLzcsh
	zbG/PcLkR6KGGyI3zYD9RdFWbIfbN1FQy2zuqOgI/Pzh8Rkj+L/XdzFtGdYeFgQyj/erizBQslK
	Sq4skp3pJ8IzHkj99CjJsETzEmKM1pmmmbUnExAOi5nDcOG3kKyG6MbDC50pCKpQxMuhQKHfzwv
	XgwcpfWgkMmdJ/wOuBd8g4KUjHr5y8mpYtg=
X-Received: by 2002:a05:622a:586:b0:461:4467:14bb with SMTP id d75a77b69052e-46a4a8b7e47mr855081cf.2.1734635198180;
        Thu, 19 Dec 2024 11:06:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7a+DlVQKkqn/PJw0dZDP1rNN4h3Og1DclMhN5A+YbI0DOWhNTu1aJqt/TQmvgKz06Gf28kg==
X-Received: by 2002:a05:622a:586:b0:461:4467:14bb with SMTP id d75a77b69052e-46a4a8b7e47mr854701cf.2.1734635197741;
        Thu, 19 Dec 2024 11:06:37 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8954bfsm96578066b.60.2024.12.19.11.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:06:37 -0800 (PST)
Message-ID: <99cf5f7e-43f6-4ac4-a4a2-dc731b695572@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 20:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-5-quic_vikramsa@quicinc.com>
 <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MSk1Uj0L3XWnLY4VikU2T9YbwevyArOf
X-Proofpoint-ORIG-GUID: MSk1Uj0L3XWnLY4VikU2T9YbwevyArOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=974 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_110641_670150_581259F3 
X-CRM114-Status: GOOD (  19.31  )
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

On 17.12.2024 3:40 PM, Vladimir Zapolskiy wrote:
> On 12/17/24 16:06, Vikram Sharma wrote:
>> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
>> Enable the IMX577 on the vision mezzanine.
>>
>> An example media-ctl pipeline for the imx577 is:
>>
>> media-ctl --reset
>> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>
>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
>>
>> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +        rst-pins {
>> +            pins = "gpio78";
>> +            function = "gpio";
>> +            drive-strength = <2>;
>> +            bias-pull-down;
>> +            output-low;
>> +        };
> 
> I have doubts that it's proper to embed a reset gpio into driver's
> pinctrl suspend/resume power management.
> 
> Konrad, can you please confirm that it's really accepted?
> 
> I'd rather ask to remove this reset pin control.

There's certainly some appearances of this in the tree.

You could make the argument that it makes sense to prevent misconfiguration
(i.e. the bootloader may set the pin in input mode), but then the counter
argument is that the (Linux) gpiod APIs request OUT_LOW/HIGH, and we would
expect that the driver uses that if the GPIO is requested through
e.g. reset-gpios.

I'm not particularly sure what to recommend here. Krzysztof?

Konrad

