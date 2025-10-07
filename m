Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766BDCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J75ZyhzShJWXkd4whYVjIvNIWKQpo0mAoFePUHF5M0M=; b=G4kyZNlxVdZvaYq8QYT9SBK7XA
	cNy5O8OXxaabvSqFkFSnvOLF/PC4Hy3NAozP3KMZOXjnxPpMEDrbJNwx775poBEtFZvZ2kmf1cVXR
	+o7Qb9l62eaEme4jT+QEeOg4Hw/U2fkpthIB7HeVM1gxfCUxMBOmnBgnrZMQ00lodItSptqbn7f8w
	3t2e/wdX3pxsyux1KMd7AhxGD/pKvN3bttcslA6xxi51MovncWHqEYFkAEfEym0j+pwWByC9iOPmU
	5lGT+xQvCBUovo9An1AZtAN3O5GFSLAbpnbDQXxqq6iNikeZp70t5LfRLcO7R+2LT9FVLiPefFBvP
	/3Tgou6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64ZM-00000001lq2-1UyC;
	Tue, 07 Oct 2025 10:05:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64ZK-00000001loY-1NLf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:05:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973Tfxk009872
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Oct 2025 10:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J75ZyhzShJWXkd4whYVjIvNIWKQpo0mAoFePUHF5M0M=; b=fcoTYRP1OK9YZevg
	l1/7RmWvGeVOvMXsSXlPsp/VCJ/JzaYX2irH9DJFfbYJW6gPX9VqiP/3VoTSN9+P
	+f0dO5lkrt+05bGOdOuGCKJ/NCCekI4cnO7zKJkbaXQ8fxwoFSriXhqHaoPkNg+3
	hjwhzHhHgtZwfiadxt8c6Sdu4k9imTBXnLSA0I90IPAj0vAWNCsSamoLJOKuhwK/
	gh5/lfV/3ydQWiDXcjKJnj50ciIL+xVfpC42XHuPaC+EiX0IeMKq1kUF2+u97lp3
	7R+ox+24EUvHwVEqL8C3h7ttiyALkVFVLwQJ/8IoRS9z4Qs7mtwMOKB016tKjAHx
	DxLz4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu6v3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 10:05:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ded29823ebso10446861cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 03:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831508; x=1760436308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J75ZyhzShJWXkd4whYVjIvNIWKQpo0mAoFePUHF5M0M=;
        b=lVNuzvUd6XiZklQPEPYEhPFK0Mg64VmYIbj19B+HUYokZf0+QJhLC5AHoz6hbxAP/E
         jg2BjNG3Y6exGsfh9fzxnNHxm0kEVKnvX4IQ3CPkI01yDxcrLqYbDFSoh/FRdh0zu9wT
         v950EX4cy1EgUzMY+k4YN8ZVJRNwIM6JD6hM4lyVeo1EZ8U2IxpGr6IKNfsMfjynlTQO
         prQ6adS3wTtOWbZwPnSbAY+c7L5wt925jNZ2cR9Sv65wOxY4yNi6PNr7Q2VUZqO5NLRq
         UlyJ8ibwXCFCIyVwV2p+ss6eQ/YueBYqBh2zXx9VBDraUyYSP1erEAWXrtwn2NeyxCqN
         LpHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB+L9uJilI1gzjPgONBzeMCBbnWiabMNv2AAuChHl32Qdwv/3aInc8BZ3RB6dDWV4N7EMakkIF2ZYrM1ZIF/Mu@lists.infradead.org
X-Gm-Message-State: AOJu0YxcPOXHWPTaZqio3AJBRrsuTEjMDJrOa/kMBl4MtxFBmhb0cdj2
	tYbuhWulXyYIdXDvm80MG5XR+RgQ41xR3Y0eDA+j8L9aWPJq5Lsd1AVZFCJitI35dTRfpq+p/xX
	LWrVMoRmDh6bmE8Wznm9Ik5dVbvLuGGtWyXDEiOYL+FpibLvtR3RNVu39TcE54dzwi8gSahGPnV
	93mA==
X-Gm-Gg: ASbGncsiaX6LhHVPxYJGoy2GF0sLMEBThsxWi/FBnS3VyMX4Yq2VNkuJKVgE0I0TyWP
	ESFJCSZAG1pg77+hSfEeCrDGqRCSfo4EY+GAW59/MDlSvKNDVp8f9XCtTEuWLxLaDxaTiPvq343
	RmEXyLFzlFWHYCKOqBYynPsxHbUsZ52yx746MGbJby6CrGnn5nB3/RpEOWgw0vicjGR2GqkhRCB
	Ag6ScDsb8eS6aCtJZ8rO4UL2mmC4y0s56xY1QoZaLLaLjEQv34+LlW4Fia7f2sutZYc7Yg7MXjW
	zhEbJbmbD8BPYFAn0raLOOT+TJSSJU90drBToH43XxL3lZ3kHT4yB+axnQu7NadoNt/JuWr//83
	FAfFV53aL0AcghMEp0okXcGQltlE=
X-Received: by 2002:a05:622a:2cf:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4e576a6337fmr135726381cf.7.1759831507907;
        Tue, 07 Oct 2025 03:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt4FfkRc47pl/KPYAeRhUqt4T2owkGAF15yiRG2vKpb73fM3SZHRYcq5Zqrgq4lOY0C0bgxQ==
X-Received: by 2002:a05:622a:2cf:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4e576a6337fmr135725961cf.7.1759831507370;
        Tue, 07 Oct 2025 03:05:07 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a4bdsm1357227866b.49.2025.10.07.03.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:05:06 -0700 (PDT)
Message-ID: <f915951e-1604-4043-8ac6-49f9b123f478@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-3-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-3-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mO6IOBwW_o-OJz1WuMrYe28xRla0rIb8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfXy+rNuJHYJBV7
 LURhTj1w1lgGiHk3qI2YRTl67EapNdju9GyMkAbM/Ls62hNZY+OdleoBIGjy7vjZnA2a6Dr3ycu
 fRp24ymD9xC3hCR2wv5545EKBcrZqkAbu1c8GqelIdhl2gY6GHNMbIBxBq7tL2MJwOTfym2JXHY
 KGtetLKPw7Ox3lAKnlPYRMch4xB006vnSL/UxsCTgDVUnDOZL/MqK7A2m+GPJthdRCQFmGtHqtn
 ILYuZU8u+uiOsqkuv1l5ibxgyprSVqzz2B/DizZOAfOWm1Xmj4pIgRcoXUmHUreos7KBl6NPyIx
 VgIwbOX4HgMm1Tf2ZQm19MjZxdSco4bVKXaj/veyOA0sAfaI/uNzpSeMDYdwRLv9YxPnu2emZFk
 ntqFsbVJazcEo97MmGCXd3GE2UpqsQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e4e5dd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=EUspDBNiAAAA:8
 a=0uX5jv6YKbm2qIkYBgAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-GUID: mO6IOBwW_o-OJz1WuMrYe28xRla0rIb8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_030518_491573_07DD6326 
X-CRM114-Status: GOOD (  10.75  )
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

On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the required pin configuration to enable Bluetooth.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

