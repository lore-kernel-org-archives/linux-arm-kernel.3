Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7055C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRBqOzOrv28UUdHO/wXjqy1ptt8k/i+66lCaL24WiV4=; b=ONuBmNYNBRb+gl3H3P8B3IC/PK
	1fy4rDGgf7edVPNH2V12WYKROcfyKRQ74VAE8qwQFsfsH+GqGfnPDeL7jri3Ud7gt9tcWVIVqzs++
	Y0Bhyw6iR9vv4VJJFACOTKUz1EY+IOrg59ZeAy6b9TQiJKpJUJfjSSEtfuH0/mk7DCglOQKSeTZYB
	LKyoMGwp8HXPp1Cd7pWXo+6lFHTIAe+7Dfsrf1Gdp3wIiwUEURrA5n9tc1koK4BCZ976tGGyDP5D/
	tDZtqC/0mv1RO0Xifbdh/KYvJgCCtHlbz6u3BACd6k5wpXDKh8YF3OGCCNG7FvF5Z80mKSj5b2Yfy
	/WriKWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrwS-0000000AVUU-3K0j;
	Tue, 27 May 2025 10:53:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrt6-0000000AV09-1OXN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 10:50:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4Jdpt012233
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 10:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRBqOzOrv28UUdHO/wXjqy1ptt8k/i+66lCaL24WiV4=; b=LLwVmvylktZaxbAL
	uY5c3TpJQTil6NocAMmhUskKEkl6TdqPZ1GuvtZROG9KAY4fnA3oT1B7zn8BdJAY
	Xvgh638EFk3D5WX100J0Jb6c1+OYXdPIPFD6Pc7tzQLaGATmjblCKtudbWy2aPHp
	nYHNrHfmha5+qjXdHREnXQ6qqMuYJKNIfXkUK+hW3+524wPzYf0zu3qSmQbf0JGB
	JkpmzYm6ErmZZpMw+eXjrlrYmgP1VUTmzhbmKmGpMfUodVtf44dHYofQSt9r+/zv
	NyhLY+4TGJQzZyjjKig1i60m4fyzfE0JmBGfg3wVKnAzvHCNRY8W1n7VFtQTYplK
	t8rHSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w6918ymn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 10:50:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47983a580dbso7888711cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 03:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343026; x=1748947826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRBqOzOrv28UUdHO/wXjqy1ptt8k/i+66lCaL24WiV4=;
        b=b3m/7E8Ci66cZBmpVEhbbamMJFqihjYbCw9UOsFSP0eHm4tRZcjzTfyljIT4xPDnB8
         sI/+wdMZlHa5IKThaaLEgaX8qsdnAVPSEJzqd/bnHN44kpvFcXOkPn+EPxcEcB3Uf/nX
         kc6Z+OHW4IZBjnGkcRwgZpg0hP6ru2chb0ijxB0DBmtvMzKQ51HBNFO+DRRiPZZakOXO
         5l/C+eug+c6Cp+qQ05SvHvL/MQ53qHLGzH7TXO0dIA9JXhJmXaf9rXiE8FiPxwFohR21
         AWhGzb63SbVqq3bEef7K0ULR+fo1GMEZOiAVAtQhtf15kznMRSD69XV2iqfx3/+/EHNe
         TBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGQhV2WZvohfFeoqf0HtsOkuNVrWkjWPnNGALSRkTUOJ56hDXMuaxtATD8H/UNxd9pEWGAjlBjaMjgagYlcLwX@lists.infradead.org
X-Gm-Message-State: AOJu0YwSU48VOyn9W1JBbTLk8GLE9uloM7AcK81jfPdTfScbXCmOvjSl
	SsXrNxC0As6A3PldSW0E5YcicdBSjVvHUEQZf0IVa9Zq+4HMrwZMek39dYXDv+G73yBk1vdgCSf
	r8oZT0pNz83a0qfcMr0xOalAS2hcZOYkza71maaM1KmhuONgZNWDBfWMjIkMB64PLXOeM7I4y/Z
	LRGg==
X-Gm-Gg: ASbGncuG9RE3YwYUiv/occy6UhcX/4SkAHNlSkWUcmCS24oYDU3wTk2tL3INigSUPkC
	jLvKSTqKXAsoqCqvi6TtS48dzjlLhVcGJqdnfR9a/fEcA5cVB8oMfeO2Z1d+aH1ojI+OpahZyqB
	1j71oBncRD/MyXzh0Zz3omCQfPyuU7qqXCm4eXeSslV3Y2myU14ZnMJjlKYcZm+XUPtrDSqGWQC
	E8MVSSm+Rk2QSjJnASKHU5mgvUR2pFaacCOoizkcEptGF9+OJDx1Xted+X+YusNBz1f7woM0fon
	cDjUoi1s7shnyIuRkwSa6UukebATikuqCxJN2zsopUcFEZdEHGXeysBZN2zAlKH4OQ==
X-Received: by 2002:a05:622a:204:b0:47a:ecc3:296c with SMTP id d75a77b69052e-49f437e5af0mr68352951cf.0.1748343025899;
        Tue, 27 May 2025 03:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6WSrw2nabesb+cdYzp0oNZGTkIWjS90wW23jZaW3xkQFZgwFkrJkpnTlVmdSvDu2G4AMqLw==
X-Received: by 2002:a05:622a:204:b0:47a:ecc3:296c with SMTP id d75a77b69052e-49f437e5af0mr68352701cf.0.1748343025468;
        Tue, 27 May 2025 03:50:25 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af2asm1832533966b.4.2025.05.27.03.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:50:24 -0700 (PDT)
Message-ID: <7f525932-570e-4c81-a3f2-6d2e26b02233@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
To: Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, Wenbin Yao
 <quic_wenbyao@quicinc.com>,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
 <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
 <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>
 <aDRw2rJ39t9W10YG@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aDRw2rJ39t9W10YG@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=683598f3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=4PHQb4W1jccdVsicM3wA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: 55YuIn7wib0wsmJhr5hXWdiwPgPYmlzY
X-Proofpoint-ORIG-GUID: 55YuIn7wib0wsmJhr5hXWdiwPgPYmlzY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4OSBTYWx0ZWRfX83zxYXENSxRC
 yQKlRFVFl3VXVkl1uKGKaaz6lmYgDAY7NJu2w2yKUJgJUMdSscm+6jsx+yvrAu2/bDom1wvEzwI
 YcluLq86dcJsBZ74UnpGYwH/ZRtX5W608VQ6Py1ZhHFk6uAfjKA3HbXqOQAZffJGlZyevcvOhZ9
 sCq2WHTygfvKFXYx+y1UQRxYnfvFiJtKNUSRCXCp3mCIY7HjgnGysCzvYpnRSHVB0FWW0T/FfjN
 j78eFO2RRadjeHSrydvJTXwKLa1OhkhhYI3ozQoTmM5rQiCOC8ma+9jvfikXExtBRjLSgI4h6G0
 yY990TYTQTXayAy/tZgC1fXw2mXhrWVkjrixI99oN3Bbf91cAE3uFJd7ZIPLxMBZVCGeCvrrdu6
 RwvQzqsu6Ae8oHJql+zBR4e3bAaW4Z2SY90cUs30cGG8m5SehyU3Wrcz1GkTQRpAc6PG0W6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_035028_376358_956F1F7A 
X-CRM114-Status: GOOD (  25.16  )
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

On 5/26/25 3:47 PM, Johan Hovold wrote:
> On Thu, May 22, 2025 at 10:03:18PM +0200, Konrad Dybcio wrote:
>> On 5/8/25 11:45 AM, Johan Hovold wrote:
>>> On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
>>>> On 5/8/2025 4:20 PM, Johan Hovold wrote:
> 
>>>>> This still looks wrong and you never replied to why these supplies
>>>>> shouldn't be handled by the tcsr clock driver that supplies these
>>>>> clocks:
>>>>>
>>>>> 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/
>>>
>>>> Sorry, I thought Konrad had convinced you.
>>>
>>> IIRC, he just said you guys were told to add the QREF supply to the PHY.
>>> That's not an argument.
>>>
>>>> If the TCSR driver manages these supplies, would it be possible for tscr
>>>> driver to recognize when it needs to turn vdda-qref on or off for a
>>>> specific PCIe port?
>>>
>>> Sure, just add a lookup table to the driver and enable the required
>>> supplies when a ref clock is enabled.
>>>
>>> As I mentioned in the other thread, the T14s has the following QREF
>>> supplies:
>>>
>>> 	
>>> 	VDD_A_QREFS_1P2_A
>>> 	VDD_A_QREFS_1P2_B
>>>
>>> 	VDD_A_QREFS_0P875_A
>>> 	VDD_A_QREFS_0P875_B
>>> 	VDD_A_QREFS_0P875_0
>>> 	VDD_A_QREFS_0P875_2
>>> 	VDD_A_QREFS_0P875_3
>>>
>>> and it's not clear how these maps to the various consumer ref clocks,
>>> including the PCIe ones:
>>>
>>> 	#define TCSR_PCIE_2L_4_CLKREF_EN
>>> 	#define TCSR_PCIE_2L_5_CLKREF_EN
>>> 	#define TCSR_PCIE_8L_CLKREF_EN
>>> 	#define TCSR_PCIE_4L_CLKREF_EN
>>>
>>> That mapping can be done by the TCSR clock driver (which would also take
>>> care of the 1.2 V supplies).
>>
>> So we had an internal discussion about this and while it may work, it
>> would only do so for some SoCs, and maybe only on the surface, as the
>> wiring behind it is rather peculiar..
> 
> Care to expand on why it cannot be made to work generally?

"-ENODATA".. many connections are difficult to unambiguously decipher

> 
> Also, what would the mapping of the above QREF supplies to PCIe PHYs
> even look like?

I'm not sure I have a clear answer..

> 
>> Plus, not all QREF consumers have a clock expressed in TCSR as of
>> right now.
> 
> Is that because there is no corresponding bit in the TCSR or simply
> because it has not been described yet?

Unfortunately, the former.. Some IPs have a non-TCSR ref clock and
some are presumably implicitly fed by BI_TCXO

Konrad

