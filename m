Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36F4CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 12:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjXA54200/MazhziXIpKEeI9K5n9Bf0pQfwu9EvIxC4=; b=ymX3A4yVaukNAby6kh49WNMWX9
	+JuagMPugNgmAGx3D2jca8EJ8dVX3SfV4Zs/qhYRm7S4Z0KI2V/o4NYli1cSG/ub1LouzmAw77gCX
	VCgX7Xumg0HdrJYGKBFQLMY2MRCtuwc1PbRpDelgXpcxY07vdP/r5/bVW4lWbpAWu/U9+gQalOIdq
	k4XXJ0dgYlF3fh2W6wgw3tRbEDW1vX+/V0T7XDIKwRLZfuvO0Lh9OFDhzXCmAgNDkt3jzDLSHYqN9
	zzg7i/AnRPg9O3xIdYm+dDypbhsenR31p4PtVCBADw3k5OWVgYhRMXssj2LOytfIGQvjftwOzWwMg
	UCfcKVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TdA-00000003rkE-2bHe;
	Wed, 08 Oct 2025 12:50:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Td8-00000003rjX-0Equ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 12:50:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Upp022784
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 12:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HjXA54200/MazhziXIpKEeI9K5n9Bf0pQfwu9EvIxC4=; b=FYpw7sr5rxcDfAem
	UzAZ/lwkxo2ODXO5AvoIyUUBbP5OAwJFOM1WVVHFO6hIXDd2cJaZp2Z7x+hbOXTF
	aBF+Cj6OWwrP+fC73ZljkOYMxTwmzXa1nxTonQK4N4nxl8IQ+U6kuJOISiPAAhCP
	sVYY2rheAg30xW39mxiHfR/b+SZBLU2pEX1Ji/pnVXKL8RpAbzFcQzb+De4U4AL7
	As3sKNXCezKByJ8MaovHjo8mRCRMqDK8aRnyI77oo9t85gwrJnjimzpanMf3K+wK
	NO+dPXdbUahdeXC4ngpTg5OUpWD+OuruBY5X/xSXSGcTx0587E0ioz0hUb7UEwCP
	gZ70kQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wku0em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 12:50:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e0f9bedf1aso22923091cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 05:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759927852; x=1760532652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXA54200/MazhziXIpKEeI9K5n9Bf0pQfwu9EvIxC4=;
        b=NJVxauGpU5nJHVpTH+BeqwgH2XtTpYzZxRP/7gdKdSmw2ZDs1qLFMhupEIskq/1lNa
         G716JTfzZVfh1Nhr+c1B+uA11mqAK6WJZ3nhCZXJTaGwLSpCj72TdJlegJzfc9i+oTHl
         ok+Tl62ImHe34EbSx3F1ECcvhswFJdTe9TZNANTea9tWmMUoPPegG5GNjV9oww6qWvi9
         ATXptd8avLDiJ42TYokeDj+rHjgi0+Avls/UNEP8qS6on0omCs8W972AuWu0Sc8e3uQx
         KVC9bj/oh4kqBBoxkW2y0k4/GcPFpWsmAduRrDO2zQ5igkAsVE4FcnmJFT5vnwgDCQfw
         +EdA==
X-Forwarded-Encrypted: i=1; AJvYcCUXO/WT5Tbb6jv9IJoiB56B92Xn7EcKy2z0/HiHSajEGLEMTgq0IlBohmN+OhaMp6ygDoHAI28RRjk/BzFzKFZh@lists.infradead.org
X-Gm-Message-State: AOJu0YxB4WjYQOlAZv0k5gNYxYZuaQsIWYb7ejeihCBjovTZ86PE6WJO
	bvNdLffVeWm5KikmzkkeEcm3X2RIN/c67EJjF8e3nO4hh+rYMd6Ap/0FXkEYZeOD6ZaN+kjVtUz
	p6rFOqWq/mVRHbdNx6RMja5HAdqcepvdmrBLcw+wROpUtTqEUxavklMWO7e3QkVPsRIgdXUSHW0
	iWMA==
X-Gm-Gg: ASbGncvkAZaGaPBHW9EmcrbMAFXvoKIDqWeMs7Q0oWaLAs/NBTc4YFKTDJu3nAk9zyS
	JXYtvAY+s1zDHTLQNZys1Flbfcg6F4rU6FvI4+8G1a4HLaS6kkcoiw9CE7nIp99LAMy3P7HgDcN
	I2rnNLV4rW5lOTQBfVTbrT5ik51Eyg0HXyzQzOKExt0AYDmUOk/f1F8huuZStVvM00v1e+y1wnC
	+xT9/dW8tdCb8uLK0cDkmNTeTWhL8d8xvMmnUyZWSJcKujrNCMLy4962Kx+zwHwkEeRP1jO/3AJ
	HXg2E5pBqcjS7BViOzVXGmRiwFxggsvRltXNu7Da6H9FY68p5gs7Z3oeY2aX2SczNAwF2nh1uqx
	fLj6KtKXftjo1FsBoRpxeqaAK5is=
X-Received: by 2002:a05:622a:60c:b0:4d9:ac87:1bdc with SMTP id d75a77b69052e-4e6ead0aba7mr29848781cf.6.1759927851721;
        Wed, 08 Oct 2025 05:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd3wvG1Ynm7djM218qT3jkj11ov7+KlyDnSw0DDL6cJyrMjJ5qDwiZKjNKdh5U87l7RnzuDg==
X-Received: by 2002:a05:622a:60c:b0:4d9:ac87:1bdc with SMTP id d75a77b69052e-4e6ead0aba7mr29848301cf.6.1759927851051;
        Wed, 08 Oct 2025 05:50:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4e49esm1648890166b.72.2025.10.08.05.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:50:50 -0700 (PDT)
Message-ID: <b14ca601-56d8-4ecc-8813-b9b642646a0c@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
 <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfX/d+8AA16TYaj
 cpe1G5XFwxcrECI7JlQBCOZqnb5pvFjUOHLYf1r6HCkccjgvodwDCowB2boVb34zK5HyBRhCmPw
 I3sod6LY8GpHcqtYp1Ec+A7Aqpvzed4+AtGZXn8zdTBsEmm6YvCFc/1xWc8MPmdyk+HKDEcw1On
 QcsJNcxg4/eXeL3bj8PCNpEbGUa73IWAyjmYRxqcIh3pyMA9zpUwZSzKMRS7n710H8c/4Fj6VmY
 jmp+gV53UCtmnZwXxIR8R3wWvaCZ5W+qZz95Yay7UMV8gtM8p1mLwtU9Uetn/LwJio0cifrzIhy
 KDAQNfRLoVEjfwEgqQRWX4ZAgXlQuzngQFU6rF60MGl7vxPyG6u5fPVJL0/1iOQaJmJ1ptGZLdk
 t0gL6znQuk7XBXM8u76QercuyUAung==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e65e2d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=Nc9AMxU9nlP_Mo_kQ7EA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: T3PJ3Cpy3rOYW7wSOWAlbQ5xtHWG3bCc
X-Proofpoint-ORIG-GUID: T3PJ3Cpy3rOYW7wSOWAlbQ5xtHWG3bCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_055054_104983_387F8A1F 
X-CRM114-Status: GOOD (  15.16  )
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

On 10/8/25 2:49 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 02:40:35PM +0200, Konrad Dybcio wrote:
>> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
>>> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
>>> with their corresponding PHYs.
>>>
>>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +			mdss1_dp0: displayport-controller@22154000 {
>>> +				compatible = "qcom,sa8775p-dp";
>>> +
>>> +				reg = <0x0 0x22154000 0x0 0x104>,
>>
>> sz = 0x200
> 
> Hmm, why? I think the memory map specifies these sizes.

Yeah and I went in line with the allocated region size (not last register)

[...]

>>>  		dispcc1: clock-controller@22100000 {
>>> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
>>>  				 <&rpmhcc RPMH_CXO_CLK>,
>>>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>>>  				 <&sleep_clk>,
>>> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
>>> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>>>  				 <0>, <0>, <0>, <0>,
>>
>> You need to remove the same amount of zeroes that you added
> 
> Nice catch. Which means that somebody was sending untested patches.

It would work.. until someone tried to add DSI to the second row of zeroes
instead of the first one

Konrad> Nice.
> 

