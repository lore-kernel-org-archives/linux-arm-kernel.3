Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078C7D3F083
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dOMexyvUvVvoxQvFfJbShrI1jevTIncrOL5kLI2uHo=; b=LEPMWNLb4jAekP/6Y+xQq7b1/G
	zk9foxhmJo99nhlfullc9rVx1mhOFa26mwuqti/NASkxC/iZiDm4Z0Uofr8MqFo+2fEp3tF70/ioS
	vJdcdQmWWLxPihfV2waGBlxDWCYweJ29Zsji1MhaBrcBMgSTuRP6C6g3+8jj4cn1f4mXyaU1Nphp0
	GaAvIv3drKy6GmWJFTPwvJ0n/ncOIEn58QC8vmJShV5605lHU9XQmQNz6LdHDnfPyUwgJtkAO0wuG
	JXT1Ez+G7cLnaK/oikVpXiigShE1zRz+EaZHGdinJS0Ei2cJ97Te9yjbCge0VZiwzxQqnuHhNB1H9
	mXkJbOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKbC-0000000HH9T-3ibq;
	Thu, 29 Jan 2026 05:29:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKbA-0000000HH98-1GfP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:29:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2pcWW2151974
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dOMexyvUvVvoxQvFfJbShrI1jevTIncrOL5kLI2uHo=; b=X4LLkTRhvyvC/Ay4
	+L7h7c2zvETYGRKjT5wvCjXE+iiRiP4y+7KXorKN80CTAMqs7JSt1wP3QBDG3zep
	ew5XD0sm/9udNmCysACUPyHjI10QnOj1g9kCTLAJox//jr6cCPeIK6HM6R+qnu8k
	iAPxP8pjdY0fIZ1zakderGaAtGSgSHs3xJ7hQk1f35cxlYGlxA24P4nb7jrQm3t8
	YbLy006GESYl46GENLLXvoVqxhMw1x3GwRT4nxR5LgHtVrx5qC7yYRqk8srnfRMA
	1H5WKUMgbeBntU1AJ9CXO8XlCVVvjs8v3PJ9EqjBm1a9NExjWPiE7oip+e19GB+k
	uZciqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3a35y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:29:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e952f153so14243855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 21:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769664583; x=1770269383; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dOMexyvUvVvoxQvFfJbShrI1jevTIncrOL5kLI2uHo=;
        b=cWdVssH8/ihVqZ9SnaksTWeuZfev/SAYrKDNvJcGwyw+beFKvfVyUIl0zOx90CVMJ/
         9QvUoxrVPOcUAu+lhrYHur5A3h5+BKpH5FHoIAJL+glJyETIHewCGDfGVnoYrqejk9vB
         lfFhdkK4lXv1Fl7m5IbVm81OhdH5fDO8zPTMossMnUSYjdE+NwYUWFboGsSUmrlXWc1w
         gDzfZg3wUD93PJNdFj37xmp6pIXvHz65c4Xe+aEh+nQpTCfMAh85T/DXfs/ArZXk7hDB
         lLCmVPA9s0qYYHNvbuSevyHkK+/GYC1/8bMhTMfLFFqLDivxG2SLTq/jwOnskrKY8ObR
         my3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769664583; x=1770269383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dOMexyvUvVvoxQvFfJbShrI1jevTIncrOL5kLI2uHo=;
        b=X6NcQStAWUJZH1pe4J24P7uy2hZ/5BYFNVT8yLef52mq7H00DTIcVvzGW/YIhSxq1S
         LAFiTf5K6h4wWb7nAR1jEWsDeCNT2/im9kH9xuteh+nWNheKTqxc7KEAF5xdU5je8x4N
         p4hFp+tqj5wIFSkRMjaBpxk33bk6a/DtLNvc6ijtmkO+WIbuOLsDlyGB8QxEHOVJ73bf
         cnXa9crmSlndAeK0gxSZ9UrmDxsYqveJOeZbEfMB/7ZbCny+bMjmCGq5lfktVPNr7bfT
         nnsqxT/Kvkd12ydIAOsT/kbF6kvP92JKr/7zhrUNhjFmshMNhQgbq4nyrTKuw7fJZmD8
         qddQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0QmXGDtqjndStXZiouyvwN4puTJW+zJwE2uqwy/yHTk7gd7Ay2YA2xYk+rxarnCxaETyNR5BlXnvp5ZWwfrt/@lists.infradead.org
X-Gm-Message-State: AOJu0YzLBKkZzeWBffseLpxIp06MqZzXzcLQc2/DqkpltueK5uCc2qsq
	N7bSIMFzvrt5hLsaBuz7m3/vs70OMAKSIlrl9pCj4lasFDE/eIdqx3GwmWtKEtwRMO7X/BJNpzo
	2dS7o/9bHQ/08Rk42ynKsclcRiQDEMJNRN4KReGKjMkR3v8lrL4XSDYd+/96GDahyEsecjShGTO
	Q4OA==
X-Gm-Gg: AZuq6aKMezGB6jUCJlkl873NUSJeP5DNn7XQlMRC0b4JwILkyZ5RoIVHjqzioxwIGc+
	udeV4t+w4Rc8IPRJooN+UfUYlCoiOs2Pd+0d6dsFj0zD0GDaZ3aocQxKHRaKWAb3TVO8dJHaW/L
	gpBnRIgOtDF4trx1djEZf0Otcc4hclLrHfiXiCbsBmOO+4nM4/njpXckk6nU8e3x11FxFtjgRXU
	SJa6nKCNfLacwu4bDW4p21tge0NjJ+LZI+1NsVN4NzgWs8uWfMVSwRQjAzrzNqRLew0cLjBNPY/
	8rMnSVuUAM4lBZGWDOVr8+4IbC/LhYVnF1xfL8tLbBKLY3faTPElN3H+zFEB9oj0HtyN3267vJL
	oSCM2m+zHAeHKq+UpPH6shvfno+Rshshfdsg2QugnmA==
X-Received: by 2002:a17:903:22d2:b0:2a7:5751:5b27 with SMTP id d9443c01a7336-2a870e192ecmr74202785ad.39.1769664582730;
        Wed, 28 Jan 2026 21:29:42 -0800 (PST)
X-Received: by 2002:a17:903:22d2:b0:2a7:5751:5b27 with SMTP id d9443c01a7336-2a870e192ecmr74202455ad.39.1769664582284;
        Wed, 28 Jan 2026 21:29:42 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3faff5sm37408765ad.4.2026.01.28.21.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:29:41 -0800 (PST)
Message-ID: <f9c95baf-f2a9-4057-aeca-2c35dcd943fb@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 10:59:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] PCI: qcom: Add D3cold support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
 <qg7hyicnyqcoi7jktalyfecfgxnv4elilmmmfkzvb2jbzrhisd@bq3pngh5n2a7>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <qg7hyicnyqcoi7jktalyfecfgxnv4elilmmmfkzvb2jbzrhisd@bq3pngh5n2a7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697af047 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=24nHYv6InDTK1t9ftLgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: YXQzH5--9cDEANVImxGkEPmvAMHVoJ4d
X-Proofpoint-GUID: YXQzH5--9cDEANVImxGkEPmvAMHVoJ4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzMyBTYWx0ZWRfX0xGvjrKE4Hri
 HwSe71+TE9C45eKMLVOaDhFiLrqS/UGgsko3UQ01/k8r/ZibZ+p3v0RzzYto6YWz8Znt6uBs9Sz
 nrFAy03E6kWVri1tzOMM+JUmyajMxRe29TLN1pW8IF270sGGUME0mdAz9KYvROvxjKdUko92NKu
 r/BUVdtuElTQMYNmdWTpGQ+nVjfZ+drqXslAO6tQpcRXRa78m1o0GCLQb81GHtwzhF0DI6mW2Qu
 PyvUO2Gq6sFREQRsoNTJhA4WzqSp0/pzAZJiH2cisLkcrlfF76BuHGmOOvEVYWAvnsPmOa+SoLc
 DTlCXy4YALQh4lHfEiCEGZN+d9LjLcxSzdQYgkbTOVCKC0qtTzibVbkfWhFCVA2e4eZLenneTO7
 vqrlGYmxIbNAXWGLQNAaUpAyx7Ge8NY/XwijkxGbDRnxE1GSRKz6dgm6X2oDyCk3dZf9/mM2Nn/
 md7USMtEmrzndRMWh1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_212944_374786_EBCFF5AD 
X-CRM114-Status: GOOD (  31.32  )
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



On 1/28/2026 8:17 PM, Bjorn Andersson wrote:
> On Wed, Jan 28, 2026 at 05:10:43PM +0530, Krishna Chaitanya Chundru wrote:
>> Add pme_turn_off() support and use DWC common suspend resume methods
>> for device D3cold entry & exit. If the device is not kept in D3cold
>> use existing methods like keeping icc votes, opp votes etc.. intact.
>>
>> In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
>> in the controller.
>>
>> Remove suspended flag from qcom_pcie structure as it is no longer needed.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 114 ++++++++++++++++++++-------------
>>   1 file changed, 68 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> [..]
>> @@ -2016,53 +2030,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
>>   	if (!pcie)
>>   		return 0;
>>   
>> -	/*
>> -	 * Set minimum bandwidth required to keep data path functional during
>> -	 * suspend.
>> -	 */
>> -	if (pcie->icc_mem) {
>> -		ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
>> -		if (ret) {
>> -			dev_err(dev,
>> -				"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
>> -				ret);
>> -			return ret;
>> -		}
>> -	}
>> +	ret = dw_pcie_suspend_noirq(pcie->pci);
>> +	if (ret)
>> +		return ret;
>>   
>> -	/*
>> -	 * Turn OFF the resources only for controllers without active PCIe
>> -	 * devices. For controllers with active devices, the resources are kept
>> -	 * ON and the link is expected to be in L0/L1 (sub)states.
>> -	 *
>> -	 * Turning OFF the resources for controllers with active PCIe devices
>> -	 * will trigger access violation during the end of the suspend cycle,
>> -	 * as kernel tries to access the PCIe devices config space for masking
>> -	 * MSIs.
>> -	 *
>> -	 * Also, it is not desirable to put the link into L2/L3 state as that
>> -	 * implies VDD supply will be removed and the devices may go into
>> -	 * powerdown state. This will affect the lifetime of the storage devices
>> -	 * like NVMe.
>> -	 */
>> -	if (!dw_pcie_link_up(pcie->pci)) {
>> -		qcom_pcie_host_deinit(&pcie->pci->pp);
>> -		pcie->suspended = true;
>> -	}
>> +	if (pcie->pci->suspended) {
> I think this is okay for now, but I'd prefer changing the return value
> of dw_pcie_suspend_noirq() to indicate if it did stop the link or not
> (two different success values) - rather than deriving that information
> by peeking into the dw_pcie struct and conclude that
> dw_pcie_suspend_noirq() did reach the end.
>
>> +		ret = icc_disable(pcie->icc_mem);
>> +		if (ret)
>> +			dev_err(dev, "Failed to disable PCIe-MEM interconnect path: %d\n", ret);
>>   
>> -	/*
>> -	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
>> -	 * Because on some platforms, DBI access can happen very late during the
>> -	 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
>> -	 * error.
>> -	 */
>> -	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
>>   		ret = icc_disable(pcie->icc_cpu);
>>   		if (ret)
>>   			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>>   
>>   		if (pcie->use_pm_opp)
>>   			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
>> +	} else {
>> +		/*
>> +		 * Set minimum bandwidth required to keep data path functional during
>> +		 * suspend.
>> +		 */
>> +		if (pcie->icc_mem) {
>> +			ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
>> +			if (ret) {
>> +				dev_err(dev,
>> +					"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
>> +					ret);
>> +				return ret;
>> +			}
>> +		}
>> +
>> +		/*
>> +		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
>> +		 * Because on some platforms, DBI access can happen very late during the
>> +		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
>> +		 * error.
>> +		 */
>> +		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
>> +			ret = icc_disable(pcie->icc_cpu);
>> +			if (ret)
>> +				dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n",
>> +					ret);
>> +
>> +			if (pcie->use_pm_opp)
>> +				dev_pm_opp_set_opp(pcie->pci->dev, NULL);
>> +		}
>>   	}
>>   	return ret;
>>   }
>> @@ -2076,20 +2088,30 @@ static int qcom_pcie_resume_noirq(struct device *dev)
>>   	if (!pcie)
>>   		return 0;
>>   
>> -	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
>> +	if (pcie->pci->suspended) {
>>   		ret = icc_enable(pcie->icc_cpu);
>>   		if (ret) {
>>   			dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n", ret);
>>   			return ret;
>>   		}
>> -	}
>>   
>> -	if (pcie->suspended) {
>> -		ret = qcom_pcie_host_init(&pcie->pci->pp);
>> +		ret = icc_enable(pcie->icc_mem);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
> I think you should revert icc_enable(pcie->icc_cpu) here, to avoid
> leaving the bus voted for with the PCIe controller resume aborted.
>
>> +			return ret;
>> +		}
>> +		ret = dw_pcie_resume_noirq(pcie->pci);
>>   		if (ret)
> And Both icc_cpu and icc_mem here.
Ack, I will do this in V2.

- Krishna Chaitanya.
> Regards,
> Bjorn
>
>>   			return ret;
>> -
>> -		pcie->suspended = false;
>> +	} else {
>> +		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
>> +			ret = icc_enable(pcie->icc_cpu);
>> +			if (ret) {
>> +				dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n",
>> +					ret);
>> +				return ret;
>> +			}
>> +		}
>>   	}
>>   
>>   	qcom_pcie_icc_opp_update(pcie);
>>
>> -- 
>> 2.34.1
>>
>>


