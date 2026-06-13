Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1655ECD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 04:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=; b=PrerKoX4Dc6q+1303F6LgH41mN
	5y0s/1XvLeN82iZGkgWU2KXusXHc+ZTFa5s+rNw5WfqClcwu33uLWGLf+d8C03LDyv+6qH8Eb0yzb
	8p3DZtH7PDzLA/wDHeWsuTeXHRVTrJ/rBD3qSpl9qLmEDrwBC+ILNH7rajHXqQsLVGQvoYW6NGzbn
	KERdB5YtgNCZvaTngqlvygFIo1CoIiYWxtym2g+X6xr2Mjt5+TV8MSZjYiPH/9Rqt2y4KYfRfHHOj
	4MqkqKjSAraaqEfoFySBCRsypOPfQD8kbFH7c2++QtH9YjgcFxDKopX0zQT3WA/iFSPaFMBZxnqBH
	zyXWBajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGGt-0000000Bwqi-2GZg;
	Sat, 13 Jun 2026 04:47:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGGq-0000000BwqE-39qj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 04:47:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3bfoP4028649
	for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 04:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=; b=FbdGHNk0J3dmTF7E
	VbQOfepA/30dcFFN0K2Pz+a7TZTVL22LrVnCHKwb5WTNq6hXW+woyk+osv4XI4+i
	nf/o2NnppS+JkMLl1xOrxMjvVHirBcdYkmMu9YI7Len5y2pRp2v19aHRZlR6Ph5f
	gkyfvYO7LzTNC23um3t0QNvDuDuJIr3qYRSP7HgkkjlMmt+628mNI71JcF3HEpye
	dUEu5ltfJnQVrSU4oC3RAgda7qx20KjVjQ0J6zKbZ2k8puErNnYYn9n3fA+SuHNj
	YT7FLed7i+PdajDeJ4/Q+9lp+rb/mzEqwWx1RxjgG9p5/X9mDhwYgDxt0lL+Ddce
	5mjpRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffg46q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 04:46:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2da7fa311so15700725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 21:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781326019; x=1781930819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=;
        b=Ny41CVdM+JUeX/YY7BYh3Yvvk9mfTTiXIU3dXLUILcRTtwm45BtwJxW+p7sHIzdY70
         XfObEiNVef33mwOuw8zYdrw/5AagYbslWn8jIYJQHgrMVpUlDWH3o8sazZO96CpWpsmh
         aeDXQKOu3HWwdL8uscFf7T2Mylc+2XHJ0FXTGtoHT1H/ktlb3l4AWiPuv7L1sFUnueHl
         ceNZKfripvzQr53iY+tSFXEjLp7JDgKypO/U0oHF1fuvRYGSUEFDKqoBVoXrquxbBgkD
         EkwZbFTV6Guzz77eVQ/lvUVih/FOYytHjZiGu2/pJZ0kodIdVAoyQIxrHGUTHBwuSXpb
         bq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781326019; x=1781930819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=;
        b=aVjQOtnKpgavv7MdBe/rErflTvPOtHdQ8AcIgmVVe4qHzUdClpAOhq8598lpYgK98w
         KZBCahqiyHTs4Oz6NkVnuRlIRsIvzm7fo9EAQKdIKnLbKAjyCfROrwmgOF5Svv7aEjg4
         GoLYxs1eARnv/188+1s6BhCo0LHcHEja2KwcOIZgS98Db4UrJQKT2gW6yPV7XvrusZav
         bl+0eDs6RCUKGBbUwc6fe8VKWkfsmcpz4QPrflRjPC/3RWZrgh1945zYSG5CK4koCDyy
         L5zYYFhzeonv8kvPFgrd0nGmXr8Zy3oIAjDAQ/kj3uUa5ALM93W++EI31768U7YVB3hK
         sJVw==
X-Forwarded-Encrypted: i=1; AFNElJ830CIr4FZvNfoHmPt88Kgn8Ipy6Go1CqL6KSsgy/bfICpTY2u5zXtaoK4A8JOnSW5ovzQB5WXR7c8FkCEjAYQO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1leSlvWeq9lPTRaAhqsbRbx90+7TlNIqj3WrmkPJayQs5X1qw
	WgFD7CMNY89Pwt1+pvG8X39Sf1toRvdoJGyyFEQ92MxKVJFLaQOBuxAc4LfT2ritWgWo72VJN8/
	aNEeC+pM7FwnMBm0ZTYCMBuG6GU4upoDWvE0nhUlcvJj9Y5PMSX1WRsOfMAUHzlsea5VHne7Vgh
	HMjw==
X-Gm-Gg: Acq92OFgTJdcsWA3OQqVWmlURQsErgnfwYaWaZ/JUoJzELw6MGVY+5Ij09U/BiXWsy6
	QVUqeiiKa5ShoeettB9lw47M56fFFEaP0fvT1c7hn953EI4XapeV8XI+5ypACCw8NyovUqdu6MQ
	0eZdD31P3mRjoOvcFelndI4paUymNzWrJjJuOvD7ccmxgedLrKxEwBK3/qrqr29UvZp+pyC1avh
	qqpKoo3y+VTiFw3hhVby/pKaisTmokoqJ6ahKACnzw4uM0wph5UEZM2qZBFEAx9CghIZd9xGi7W
	Eow4nv0KV0T8natdjDVuJPBlLG2WmYec8Bp6IeEqelYzgo+57oaQYKfBBy6SLuWbETCClhBbmsw
	LEWw87RjLgkSxSC47TLF89t1JxZcdjySkoy+TI6KdFx3UGuniLF0=
X-Received: by 2002:a17:903:3d0e:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c4110b38d6mr61050765ad.11.1781326018944;
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
X-Received: by 2002:a17:903:3d0e:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c4110b38d6mr61050515ad.11.1781326018461;
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8becesm37162965ad.56.2026.06.12.21.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
Message-ID: <83594a83-64ea-4c52-b0b7-fd0070f03f04@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 10:16:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
 <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2ce0c3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iljdq1zszXl5pgKHGr8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: KmvQ6FPxjMYVN3fIiGk_a7oNzIXjHrSv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA0MyBTYWx0ZWRfX4fjJ0mamxKZL
 wJ+W0R/tGuSLPFEd9TfMmGyCCmf3j3bfK1I9K5xFw3Gs0BsmIxDRmosjjbS8lvurQIWmYJPxrFx
 s6nCCOy40MgvOjo0lNShkblBvbuS5LU=
X-Proofpoint-GUID: KmvQ6FPxjMYVN3fIiGk_a7oNzIXjHrSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA0MyBTYWx0ZWRfX9DVapKEauJUY
 eFG5hvhj3AYE0ATSEmQxjwH+j1Wk7IKj+V29ncCeeRL5EyofK37ZpnywUytjiqxVP/79BPcbESq
 UkzEacXGn6UdAyYq+bN3mA7PJ8aLJ/ymjS6n5Xxk+KVYOlobI/q0Y5Dh77LX+KOAbfX6K0Nu3o2
 MzTos6nAFkt2hrB+6GLY1td0hewllMmtS3srk8d1V/Y23HaHic5l9CzplDw2Z4BJ5qv1Yk6EWCT
 gaaSUkl/VBbY2rEJPSYWKpyuyl/VEn2vByvwv5Tc226e+ghD2GRwPi7S7WGkipITqtp8vEvH8ak
 rMYyZ839NrQB4rmy34kEg977OXIUWiHF4HVs9GrFxHEK5YpsuMLvm5afDoxCT1BHbLL2E+jt2lJ
 AoBwLNV5E0F7YPPomXeGx0KZAe9cbsZATV48h0Z5inlRCfWF1aU3h5UNNXeiwFR2DAiQbp24Y/4
 RiSOlND+SZuSq2Pb2Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_214700_799450_E35A95B7 
X-CRM114-Status: GOOD (  15.42  )
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



On 12-06-2026 13:40, Vladimir Zapolskiy wrote:
>> +            imx577_ep1: endpoint {
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <0 1 2 3>;
> 
> The numeration of data-lanes shall be started from 1, this has to be fixed.
> 
Thanks for pointing it.

Will fix in v3. On MIPI D-PHY, lane 0 is the clock lane, so data lanes
must start from 1 as per video-interfaces.yaml binding spec.
>> +                remote-endpoint = <&csiphy1_ep>;
>> +            };
>> +        };
>> +    }; 
>> +&tlmm {
>> +    cam1_reset_default: cam1-reset-default-state {
>> +        pins = "gpio33";
>> +        function = "gpio";
>> +        drive-strength = <2>;
>> +        bias-disable;
>> +    };
>> +};
> 
> Since it's a mezzanine specific pinctl assignment, it shall go to the
> correspondent .dtso file.
> 
> It's a concidence that one .dtso file is good enough for describing the
> mezzanine for two diffferent boards, but let's exploit it by keeping one
> dt overlay file as it is now.

Agreed, will move it to the .dtso in v3.

This also eliminates the identical cam1_reset_default block duplicated across 
CQM and CQS board files.

Will incorporate this for the IQS dtso file.
--
Regards,
Nihal Kumar Gupta

