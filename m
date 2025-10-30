Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1837ACCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 03:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHSWFWmnOzX1VHAiA276NE1gVjUwB6rf3KGgQY67Spo=; b=SDTGVZrRSStVFJzZn59lMECe9j
	vV1yRbTobAfUJeCq4wIof0xC5DPTBjGyCCnPXfhv4z2L8Qw5KYLbII7LLvxeA/sym4d90h+YSv7Xm
	OnSd8xniBE4OzE70ACuWAXP1TaNx9Xg4ivzhkEJZ1CgD3e2Wn/YdM53KTC5hlbvdKhTbng0COelI1
	XV8/e79oBZaL2+scrZN3oSP18Fs7RG2wNu9QkA9B4v261wgxL9mf8WA5YkBiTIWbjwEmf3HihBwKT
	ZZdAeSxOFArcu0oU8GbwPTPucbAflpFx+j/lJwMMMExjxUtZ96W4xTnepckNpmiPNvsmvTdzaI5sx
	Duj/zFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJZg-00000003QZn-3N1b;
	Thu, 30 Oct 2025 03:43:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEJZe-00000003QZI-2lHW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 03:43:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U0iHkG1994438
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sHSWFWmnOzX1VHAiA276NE1gVjUwB6rf3KGgQY67Spo=; b=Ff7b/zPO8tvJceRY
	Cy74AMHIYHiNdUVuJcP4f/lSQDyMMcebAS0DE7AeVm+xAKnTzShtg34YkxNy/wdt
	0g/NgpqpoAnJcIwT+n9clchm94r9tbrElusIK7GlLiRc2pz1AFcKCCUJFZpQCbHb
	e2XH92o1WH8HIESZAW0yg4FczD58ri60/EcSr39tD7F2kPSrT5vBlNVHNi37cCeE
	s75H5V6v6imgELujCXf9R4NerDgKzEjBRpO/HBLA7QXsuw075f/x6sEFhGWdAZcV
	aTVcBDFbMl/YzO6id4gLeaZXeFKzfoEj8DDXlNudFrRmuwCUptl38Lt66V1h83z9
	QLLDUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr70ctc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:43:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290ab8f5af6so3836195ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 20:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761795820; x=1762400620; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHSWFWmnOzX1VHAiA276NE1gVjUwB6rf3KGgQY67Spo=;
        b=G7RnW7pcsCkMMYq2W3VH8quNemuEKqfTxc2SWqEivBOdPj0syLpsMBJasN3op2q0CR
         /2ahCF8Z80b0a3y6o94KnkzvK68+1IERPJF2bi0nneScCJCrQSRel3obhG9OWDoLgcXM
         c6j6QQTnHd/fvjnqGJPH8YRAWoX+1HMMU2WFVJR1Y5HpP4dAh/SL/zNW/RTja6O9iAXb
         MfiSfyrVsFa1gxlmS1dyTj5yG/+jEe5DkzmSyorpMP5JVNrDlk3wE4jhGYOY7Ldl1zCC
         92ZeyOG6rVSJ/aR5bf9lQ1/MLTCFdZOO4Mj+7LwA3tajzvaJ9C0+FAZBA5JWIPv3xHcB
         +5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761795820; x=1762400620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHSWFWmnOzX1VHAiA276NE1gVjUwB6rf3KGgQY67Spo=;
        b=FvkeghhuFTvmRdDyjRwCcXHgvEBRECrqLlu8g8hrDispGWNHYNQMGwHdXwcpPFA1w6
         vAqwFPTzhDyKh78TZdDvXoPsR4ZOhyQpICo8+nIlmr4hAApMkgcpojww15h8Pn/23rs6
         ws+Hq16TXqfosG87uOS51tYFrU+/5nsW+k1B5CBNqQOXZJDfakpgZtv03NdOdt/MSrS2
         ARGPrEvDbp8R/oD+puTwLdEd+gS0MmHZubCWOYC2iR8xDIqTWtvcFrpU/OnOssDYaJ/n
         2fGFNhG+iNkfLBuw3eG5l53EhAUkIU85tYOQ04kwwcUjBXavAkkPsuFxre0U0Tj+p/d/
         2ofQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3IuFuiXg4ebbtGWckjOvP7PHICiyzRgDfSufaDRtKoVMicMHZ8gg9LP09PBuqVDC1u4pTBwtWKUxU2P60CXW2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/n/jMduZyOoUaKA6wY+VgKLagWW8XUhMW45OjMLBSCxR1ePaD
	lr1WCFlqt8+YHI7j9x3FAPDXRFTLbQyKz/96eESb2SUZgJFkzFG7RnSL6TQDPbUexX+rFoHClNl
	JDQJBxzppvnuZXOfWA2fUk4im9A8bO2kppXrm/7ieMskuTdvhiCch3q70wS8/EjH2tlPKHAAXA2
	wLKg==
X-Gm-Gg: ASbGncs75m9OY29wBequAeaIzqEOKfnfnO8Aowb61onCgFxl9l3lsuvnBmOwVozJc/Y
	4FCDcM2gZhQcex3odwt1w2doWO/7SskEZEHGWbEWN1qOMY3UTGV+i/VpS3PbyST4gOwG1GsJgUz
	eMFIj8LGrlX7iXeAakbTCKUUPTKfASBGjbBwjWnwtm1/UczYFsj/y/Ee5w86z4XpOahGduFoJ+C
	nXTij/sFdp9qLqRpaP9h3GSxy8t8t5dh11jRgFCniffxYH6t/MaImaBdr2n/oN5YDM/9HXPmoF7
	OJy4xMQAWaQMb0vw+XS9SkQ9I5FFFLGVpb1MKDcusdmERUIC9+VAKXgrjmuEngotUSRV3unlqQR
	n5Ohjs+muaZQVVObBE7Uz+orKbLDWFq0=
X-Received: by 2002:a17:902:d487:b0:290:c07f:e8ee with SMTP id d9443c01a7336-294deee23a3mr66507325ad.43.1761795820114;
        Wed, 29 Oct 2025 20:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG8Tsm7zsMNvRb42NpHg0S5cqbhX8hvTZ+lzZFtUmt1DssbzW9YgQ30jiCbWgwAcLvsjL2Pw==
X-Received: by 2002:a17:902:d487:b0:290:c07f:e8ee with SMTP id d9443c01a7336-294deee23a3mr66506845ad.43.1761795819628;
        Wed, 29 Oct 2025 20:43:39 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2333fsm166960675ad.50.2025.10.29.20.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 20:43:39 -0700 (PDT)
Message-ID: <3dccca2d-272f-451a-9e38-901a6fa3a24c@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 09:13:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] PCI: Enable Power and configure the TC9563 PCIe
 switch
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, amitk@kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251029232323.GA1602660@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251029232323.GA1602660@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAyNyBTYWx0ZWRfXz8F3V9Ciatyh
 C+q2GehC3zdfSueYOqgUkP4IxeyT/zflgJyFx3KZ6K5y1RagXxinGEzEZlmFHbSD6n7l6Hhbcrx
 iRJNbVYquWB0Bm+u+7kznxGKCQ+eYHLSyTPfv9ebNlAmAobJ3OcXm2fF8jaAvk8miWRGa6hwFhq
 nx9pMQsAIogLQGwkuB65nws5sV77E62rShHyKUNNuuTiRbId9eQGCfQ9QKlzWDqJFtNq1WMrBwX
 QnzkPXxjlSFf6VYwd9psnP938NhM7GDCLaUFaVtfpDBGmAOGk4BzE5FmibSEHfRSUNR8ZwfjCmM
 l6Y/1JtlLeC3q5JdOrfzjfygPwtGBPMdV1B0tULj32at3fm7YYlr7AGZhZys0SgcjvnFJryHgja
 YapUozU6Rb+J0EENvqU+eU82crsUEg==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=6902deed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FxhApbZLZ_QfhaJha3gA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Mdxh2P9cS_HPacekNxwQTUYQagzRm96x
X-Proofpoint-GUID: Mdxh2P9cS_HPacekNxwQTUYQagzRm96x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_204342_823401_A0752597 
X-CRM114-Status: GOOD (  20.22  )
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


On 10/30/2025 4:53 AM, Bjorn Helgaas wrote:
> On Wed, Oct 29, 2025 at 04:59:53PM +0530, Krishna Chaitanya Chundru wrote:
>> TC9563 is the PCIe switch which has one upstream and three downstream
>> ports. To one of the downstream ports ethernet MAC is connected as endpoint
>> device. Other two downstream ports are supposed to connect to external
>> device. One Host can connect to TC956x by upstream port.
>>
>> TC9563 switch power is controlled by the GPIO's. After powering on
>> the switch will immediately participate in the link training. if the
>> host is also ready by that time PCIe link will established.
>>
>> The TC9563 needs to configured certain parameters like de-emphasis,
>> disable unused port etc before link is established.
>>
>> As the controller starts link training before the probe of pwrctl driver,
>> the PCIe link may come up as soon as we power on the switch. Due to this
>> configuring the switch itself through i2c will not have any effect as
>> this configuration needs to done before link training. To avoid this
>> introduce two functions in pci_ops to start_link() & stop_link() which
>> will disable the link training if the PCIe link is not up yet.
>>
>> This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/
> What does this series apply to?  It doesn't apply cleanly to v6.18-rc1
> (the normal base for topic branches) or v6.18-rc3 or pci/next.
I sent this on top of rc3 as we have some dependencies with latest 
changes i.e ecam changes in dwc driver.
> I tried first applying the patches from
> https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/,
> but those don't apply to -rc1 or -rc3 either.

This needs to be applied on the dts schema in github, it is already 
applied I will remove this reference in next
series.

- Krishna Chaitanya.

>
> Bjorn

