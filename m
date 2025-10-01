Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC739CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 09:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2j4IW5NnafXAEbG+pjQfoEONtDY8QkYi5eJLubVjC0=; b=yn65n37S2WxK+GjqvEH3LROjcN
	agJDRfTkANOhj0QbKevXNwBkzYln/afVmDj0j6WYiw3u1JE3sWAQW4p2p08iRPRSzAHwQ+v2xst8O
	lqpk0Ar3eqZGlZev6GBlvJ0RMrqmitNkfo7FCepsV17B4/qfJkFZbZvCcbIpAREk+Pi7TyOZv9NKY
	5Uu9ii7rqUkDiymNV0v0kH3FiTwSi8gnB7M3uJ0OYc+bCIBJIe4w/0ADbflXg9NmTOYuTJXIE6Jd+
	dAwGoS5Yif3AA8BhtM4YIvb4Huw+Y7L7Q4ZtT0uYljH4L1vIsYIj/CP0DmjDnYbouXoh04icDbsiV
	iI0B/d6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3tNI-00000007BIC-3KbB;
	Wed, 01 Oct 2025 09:43:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3tNG-00000007BHm-1Ds5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 09:43:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5918tk0t027554
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Oct 2025 09:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2j4IW5NnafXAEbG+pjQfoEONtDY8QkYi5eJLubVjC0=; b=cr1g3ir5UkiwEBvm
	MF19xEjjZNFLpWiia40lSVhQJTEc/LnUBzjVmNmES0Org2hH21Pcot5oQIn6Z9mQ
	RuNTu13ANd3FIpC2NErDG1DK+9d9ibnw7f0Bl8ZWKLUSk283Iz/GNwl29XmC/Xd3
	wPBG5gr7LbO9RTs/8SsFC2oDoH/nCu/Z6X2JgH3LVnAiHe195pbrv7VG34rC1Q3s
	iY53lsuoBS7eNdx8HgMUZOlAXd3NoIYOi1+vQSdAX0YORyd3RaluYOTBye6Z1hCh
	QDcFDYCttVQERidFCO/7vyP/rwp9yghkSyLmxDUs/mgBy0iWRsn46dwQYc8TxzZr
	xX+HPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851m1sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 09:43:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8572f379832so186582885a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 02:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759311828; x=1759916628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2j4IW5NnafXAEbG+pjQfoEONtDY8QkYi5eJLubVjC0=;
        b=c9k9lR8330472VdUDOqVgf/ee81yN6zSkMzT74FolA0OrAbWsVCXl3+XtflTMKb5x/
         6Tp/0hg/quwJZSaC+gsG6lByGP4874Tz2BeBuoprSt9tJ1crZwL9+R6tPuF/XGhGyqBt
         Ss8v8nrEXAtnY1uuT5Hii0o+6DK/B70hqAWLSU3578VfltHdAK80ruTQtRAjzgCFQK1G
         SFAqv2UvIyO3WhAokBYn0sjWkFt/vbLD9YTFVwyXiCOThQtDDHf+YwkHEb+id1IQXrbU
         LovXjOcfDehmGBtNHxLfw3WEVpuIIPxWfHKAuazTbXLmObzpzamUJ8BfbawnsdbORH3M
         yAtw==
X-Forwarded-Encrypted: i=1; AJvYcCUO1T2byhixxZbZRjCsx60mEdk9QREZMiK/p/GsFVKaSPzZ30PeAwBIwv92wq0B1wwiaBnhOFFoRmqBKEl9KQxG@lists.infradead.org
X-Gm-Message-State: AOJu0YzdHCeceIZv3beVl6QXxWWq7w2/YURPpz86CJgWruKGDoCf3X0S
	Lu3m9b4bDwyUDgJYB0CozeYDtbtKmCTIubCN5I1ZlAqzbzkcXyEisrUnqV6uE2rHM3UwlhwZqEq
	haf3jJtjhErEd2Qf2BpFsFz2Va7dp3wAJafkgMyGXwb+cL6ADm4wYrIy1ovSRZDylv2sMgql9Cx
	ou8w==
X-Gm-Gg: ASbGncu5f6w6PHN3SoQCm4nBznkJVsYIL8KagB1wnY+Bp6lAsfjTpKGJExobrI2NHoM
	jeHmTVos9WIo7IYgodgx9yhYmYqGR9Zy0ZR8m9E1Gy/ve4vAUFoL2Q+UvB92qx+hnMsPM+76mEl
	ifE/Qd3l8YbXZQhoc7D58j2US+dPWhemgM4hsWVUeRlJ/sjyG24aGOMWx6p8Epc6fpR+FqwwJfr
	JEv01iwtB470mwElvbqzA+loLx5R5ErCjnZC6ffcL1I1+iUz1d0gLDyn2TvQz016u6QP4U0x9TZ
	yAJS7OTwWuhl9+FAN23KmT5fEvV7IOYJ63edsC0CYLBOvLqQnmuHuw1RHaRCDoErlfW4mqmbEw0
	YjOsj6lH+Gbi1bU0EaKT1knlcx0A=
X-Received: by 2002:a05:620a:17aa:b0:856:40d2:b1a5 with SMTP id af79cd13be357-873765c02d2mr274220285a.13.1759311828453;
        Wed, 01 Oct 2025 02:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQhu+9IequlFgOauptmEqJZoeziWIrkfkjGafmFpxFA4oL+2QREZWtpjKdLAbnfpl7vBk6qQ==
X-Received: by 2002:a05:620a:17aa:b0:856:40d2:b1a5 with SMTP id af79cd13be357-873765c02d2mr274218385a.13.1759311827918;
        Wed, 01 Oct 2025 02:43:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3e60de51c5sm648473466b.15.2025.10.01.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:43:47 -0700 (PDT)
Message-ID: <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
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
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dcf7d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=ANimo7j06tBtS7Sznz4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX9sY1xH1cOO6y
 dS+13Zj8GL+9xsOEn3W7yktbkLNp3p/LNIhf3aNQfqKtE+6yFR8Ao6rrhcD1c13LjxgFZqWgCb7
 lyftshYVDY62ki0ut3lTjOzx3P0Eq9sELTfE15FlCAPYkZ5HMA+uZGatcAWFWsryfbyLE3yrh2E
 abLzokBiR2wJFtVDeBB+qL/OWC9EY9uQeIf3wdm2wYoL/I4WZXdfUxz5Sn7QgoJJ2aurCw3rnYj
 DyGq9CN/ur+l73Iaki6AgCUE5S0ikUeZYpm+680Oeqtqhgt/f60AT6kqRgIrHgsEwWHOdZ3yyqd
 AIFrbOXMTA2Kx5a2wXygL9XlbxsvR+/uN5EDmrGg5Bg+ngYZF8O4dXpeaEcg1xiZWQDXO2qFQUj
 3GxDG75BF6wnZpFuxwHPp4QMVgu/OA==
X-Proofpoint-ORIG-GUID: BcNsvUfD7jc6KtrcRApZLw8oLVfYCfPW
X-Proofpoint-GUID: BcNsvUfD7jc6KtrcRApZLw8oLVfYCfPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_024350_336272_83C859AA 
X-CRM114-Status: GOOD (  17.11  )
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

On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
>> This change enables display1 clock controller.
>>
>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> index c69aa2f41ce2..d4436bc473ba 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
>> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
>>  	};
>>  };
>>  
>> +&dispcc1 {
>> +	status = "okay";
> 
> I think this one should be enabled by default. Unless Konrad or Bjorn
> disagrees, please fix lemans.dtsi.

Of course there is no reason for clock controllers to be disabled

Konrad

