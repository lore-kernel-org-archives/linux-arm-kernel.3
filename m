Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699D9F36BA4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 03:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=; b=rNZWHZOhsbOMtfaNlEgSPw6pfo
	egHHOKImVMkGb+m0WVAtZ+E4Y/RtPzdO4Ge+SjEA0Supx0cAefvRm3719dBHY4e6M3DevX0PusItj
	ljoYVcAAkvROBDfq2k5Td1HwTI2/glCf6y7LfdD2+Cl0GFZPyqhadmcUJfLUEhQk7WnUD/EaKKOeb
	Uhi570hdCAmPqr2wkys48K+0op7IKDBD+ppoB1H4WnggCJ41T4ECQlkiPOQRrV9Fc17ceks2L1y+A
	O6xi6jjNIk4s0JjyGF7Bw4yHgpIZrDQQIJck5Z5mzP7KQuhcReaodp0Lvadh/BvsnqOuqL7A3AaSX
	u/6EMBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB2ya-0000000BZ1g-0kQ2;
	Fri, 10 Apr 2026 03:56:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB2yW-0000000BZ1F-49Nj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 03:56:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KhZmh2624709
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=; b=jcFlbh20MjLbhYiw
	dQqOf+oykWWbOk+ogXpUm+mMLyHslRkqQt0ncnh2rsVw/VOv+WToYoGnRnnPOUFd
	ChbM8I0FKStJHrScjXaDwFkpEMMw6uyEDY5aZ4eJyD0kq/y2rHSPbvKJi0cw6CzW
	JSEDj0VT5whWfeB1fOb/g39OHEMmGEHyitpoBY8wXHZIwSp1/zgfwDU1iSvgOJ86
	mqfbcP0CagLV5Z23YgXqP5gonhUz0JumWdSCEbkmZuFwCDanQIz3YTg2JBH6R/Nq
	rMAS1AHowtzVibo2dPbWkYXa7SwPBCvYvVhvd0ewSjz0xjFLwV9E2VWWwI/z49Em
	cIw/5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu2kag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:56:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2497cc190so8151005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 20:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775793367; x=1776398167; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=;
        b=XU/Lv8pMnjrjCuYrxyGmbtsCQv5sIKZvZaSjke9rgrY8q5p97SPupZqz9HiUYBbhIT
         qC700WMwPGx/LnK31F2wle4TIB31HPpMivUthobXDUwjvqU67MZBK+A7vo0X/dK+ndG0
         /Kn4NLOA5C5j2/9yQOMcRU0TQBF545/EcLu/ko0ZYSaBjCCyqA+g1Lsg3F4yVwL+FeIS
         tLmxz7Lp7dnfIhFNtQcj7s8thHIbue9L1/sXCn5WSSMo/sywDi65iBOSRDEFzoU+dBK8
         7SokF8y9cl95hKKyBAPWo5aSbEKni4f9Efa3gn+YWSDOurBfwduxiPiObDKBDiNUCzjA
         x5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775793367; x=1776398167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSmDNiR28E4SwJ73KBK5+DwZ2w5bYXZkE8dplVf/2Qk=;
        b=OQ6HQ1ce84K1dOsS4c4+pseMkO2/WoMDLILsyhVLhoC5YHKjR8MG7N0sejhkf76Iup
         1C2vs37dgTO++Z8X/iM8ZZTha89hSu5ULEZhhz/HsE0L0pJoci1O2qhmVWufSf7Y6plO
         o1SjTSb6Q5ihMI+S6SOyID97Z8weHtXAJmO63x6L9iw6npYoIxatinIvX9JDTOcvB3Jc
         t2mLgj5PZ2Y7D2sU1b+pAjC2OfWSJi8+/tnCAT+Q2kGYPryjRG3K2QeG1BYszP87PI5J
         X0SWUodBaR/nle7WIzIDzzP1q2Xpp9rGfocVykmAJHDdV5C5dYxcqx5Axw7hbWzjFvXn
         KkWg==
X-Forwarded-Encrypted: i=1; AJvYcCXmH/ESwJpkeyoBijSRSqzKj5FYEnNiSLqc/Ju6vVVXDdp3AP+xD63TBeOr1NxyCfP1cI4QJZ3MUOFqEXvtORnQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwZn8eEYnCbC1z92gomD2onfbMhuYrklSCARGcp9dH0S9NhGYA1
	DwAO025CbG05Vb5W1/2kuD+yKCSFXf0jiB7gQxkbyPAQVJu4lssrqDHyvTKaYLGIKoOyv8ss5No
	tbtsJxw1Ic/rvVrm1rZlHaLilAsXYgGtYLsWGaEwFTCIVbPc+ZnlU+xLoo52IiP1dnhBe6UOY9t
	+17A==
X-Gm-Gg: AeBDieuqpRaBcLyJ9wQ8x9NA8/61+z026o2TJmOS56JOxny0uB8b4U3ORmjUfO7gVRh
	BJ1GbBOz7BemWe1sdo4jStVBmUF1t2Pa2DmyccnE5+E14FhUCKGfpH/gFTfR2N2GrJnlgWTAJuD
	aHXmd/6TSCFpwBzxJq3O9jjrPmu5IPFnjN64agUeVrMgWy+28s1wKjD3K+C6km915J9YCOr7tnP
	xvUKY+f1S58GpS/B/Izea79Clsvlr0lKZMYtsfqsP4HwISGsq73ENGnS17AhSwYhN3OUVNgQXwR
	GGU24uA+8rODTd1rsvPLt0em2z8xMBNIYGASVWZWKYYMLxXzB0FJBz4QhRKK1RPjOBNoAmUH1AB
	ccc8F9zS2LRHC2LR2RSHJgvWWByRti+GkG81YQOXMIkP7DTRRpw==
X-Received: by 2002:a05:6a20:94c9:b0:39c:41b2:5d4b with SMTP id adf61e73a8af0-39fc928c9damr5656590637.2.1775793366753;
        Thu, 09 Apr 2026 20:56:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c9:b0:39c:41b2:5d4b with SMTP id adf61e73a8af0-39fc928c9damr5656555637.2.1775793366257;
        Thu, 09 Apr 2026 20:56:06 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a1d0d2sm802544a12.27.2026.04.09.20.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 20:56:05 -0700 (PDT)
Message-ID: <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 09:25:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g98uV73JQbNr1xNmkGWZM8aPB3XB-pkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzMyBTYWx0ZWRfX0JXhf7eae/Es
 GxARV33N1CiU9ISmb63N3jiNC+eUHw+urzIG8G/alpowo/NjtWVfPngtt7Yg6dafeDkHZtervYU
 QuBK+93J4yeVIvVNNWllidtce8rY2k3tVZC3WFyzKK5m0g0DE+qTkZtB02P01iiJGY6ETZZG1Ph
 pQSyHZXtNhqQTPJmSagOzDw18HwLIk4IQyjNG0b6SMz3K5+cecjPMXnuVT5KmISCJhYvg2nDP79
 HkktaqDhxEydpQAB1zv3vw0hA7fhoE2gHCNRzwaiyPEdIzoW09VTu8b/VErfub7zoNP8gFFQ/fm
 tsuR5ri7do7bQ365U03YJBBPwzODO/zpuDxttlyKNJK1aXuO0y/sX+kiZcQmRQQl42Xlt759Jy7
 WdVAHfw4nSAO6kuy4vKGZrOmXK+UCU4fiSei3ur32kEwigb9hzBE+yuE7RrEQRaKPeUbGOPXrmb
 8SakKs21Zg1TGtIdUgA==
X-Proofpoint-ORIG-GUID: g98uV73JQbNr1xNmkGWZM8aPB3XB-pkg
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d874d7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=km6amy0AK99uZQ67LAIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_205609_152402_F54C4962 
X-CRM114-Status: GOOD (  12.57  )
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



On 4/10/2026 12:10 AM, Bryan O'Donoghue wrote:
> On 09/04/2026 19:10, Taniya Das wrote:
>> +		videocc: clock-controller@aaf0000 {
>> +			compatible = "qcom,eliza-videocc";
>> +			reg = <0x0 0xaaf0000 0x0 0x10000>;
>> +
>> +			clocks = <&bi_tcxo_div2>,
>> +				 <&sleep_clk>,
>> +				 <&gcc GCC_VIDEO_AHB_CLK>;
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,eliza-camcc";
>> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
>> +
>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +				 <&bi_tcxo_div2>,
>> +				 <&sleep_clk>;
>> +
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
> 
> This looks odd.
> 
> Why do these two controllers have no power-domains ?

Bryan, on Eliza the videocc and camcc are connected on CX and MXA.

-- 
Thanks,
Taniya Das


