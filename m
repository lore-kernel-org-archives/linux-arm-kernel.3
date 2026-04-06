Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB097EF4EC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 09:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LM+Y0miUnUzTeudMD3Tda8M4xxPiG7m13ymCNOxTEDE=; b=QrbCRs3kBkwh/jppV1nLyNGPBJ
	TIsarthc2n0VV77eqQtO8V//SXgZst5b62rT+8zvod98cVtAWeAurlX4aWDxmL+2JnYJZxsz187Pw
	iHO/mIwrkTaMlxv4hGvYiXrZ6FkEQKc51ZUqbDHKjh80vZ3WctfqEdG7tlRgaxRS2gjf8UDqsr8vj
	SWCIF7KI2IQ12ajyqvXphxZi7TUdV/E7TvV/XmzYC5xeWBqCvqnVq1T2uyHYcIMoI0fOYeca6WODq
	lSVveGtsBM4JVN6nzxpQSbKWYNagsiGHg+X5S6EOIjQwup1B5FJoxqPYfy8koOROzYxAPl2bRTNKO
	pbLKxUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9fwR-00000004wQR-3Eza;
	Mon, 06 Apr 2026 09:08:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9fwP-00000004wQ5-0kEm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 09:08:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6368KqCS3114168
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Apr 2026 09:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LM+Y0miUnUzTeudMD3Tda8M4xxPiG7m13ymCNOxTEDE=; b=RslgA9wtaqqpgfBD
	SWVyAGQKq//A+uk52OWqGRpVV2pSemhkJuNEBXY27f0GoW9MqxRqytr+iQEPm6RT
	6kdlb52mcK1fMsT1Skma6YCAQ6ecUaz8kbW3W4cA8qb3lGiJcloGuDmPFc6Smsbi
	2xOJ5dwkzR8EvBeyDyVmP7EEWpTmarFOd2CYjzi9+dwAXv7Bx94aVxnGfvCJLzLA
	CUelAqpk2+j4Kv+7WQ8jBEPW3FESPyBuqyADu6KkZnN7zDLW97WpUCasnKqz7jc0
	6tUuoDyOJwsYJbRUrH1xtLC7Wj2LVdrN3mgtZ2w84ZwiHyID0yVLmgP/JE8S6n6G
	1GEfTA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrmreh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 09:08:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b249541063so35668755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 02:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775466496; x=1776071296; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LM+Y0miUnUzTeudMD3Tda8M4xxPiG7m13ymCNOxTEDE=;
        b=Zgy6GCgIg4HP/XLQBwR7zrAQW+abKyp1weC+SprVKv/fAWnAE5uiLlw7kCC/OkJH+E
         WzEnXl7P4bbDO0BHxf5XJI87zTlz/HsGT6kIFlr8gvHc7BbMvsEApeHK8sTHeTTQfZO5
         JtfJBeTBJJ/nypCDtFFFqxt9I3V0uMe+Nz5yMHLqtS9H+2SfJquvgpqRsqxO97hoMQ7b
         ilIjkoAE9f0ocwDd+PJKyMzSc1+eMd6znooCjaY9GhdotcQkP5J2yzHhkQlIHRRvUtl7
         OxSqB2TEnailxF5LMh9x+uOfqLhzNQt9r6JqZwobitSBfj5KhETnEjmIsR1pV8XnsG8g
         xesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466496; x=1776071296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LM+Y0miUnUzTeudMD3Tda8M4xxPiG7m13ymCNOxTEDE=;
        b=RkTYMcgwAMW6PYPcC3iLVJj2DhFUvAxjGblRQVMCvMLQxQPTQtCNo3w8I3dge9Xtxs
         0BNJqgdPbUw0gUaXQZi2ecMwrFJG/dmkHmbdChOAPUC0sMK/YlYDqg7nOMJudptvvnko
         wkuYAaVc532dYrWGLtNpnaThPxBjxq4/EnnAt/biIFZf0dn8cbR7lRwPnmWwcHV7KoPZ
         Z7AfauchbNwi+jKm91DKzFh5P5wN/uvf7KPM6cvpwNzvXCpIkbCFqNqoOm6im9E4rqw9
         FzxvZsgzl7wzD5nINL9Vc1QxyWB92/mD/fHij7fTaGYJ5t3b3WwTYmf8+jWA6mQAHa7j
         6yFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd3vp379icWKyjKg8JKUn4lTdFZb7XG0ZurnrbrCRSM3jL40TGco2YmLCpqng1N4Eh2egr1cSwxcmFr7YMzeto@lists.infradead.org
X-Gm-Message-State: AOJu0YzWkiXSO9lIENJPokXjUPXuYbFSXy6Ved5DIO7Y3f2sWrmlQalr
	okjnVHROYVBOQ9eiJpt4+/oG6chi21K9Chlv0ZOw2SkVn0aRzTncKx6JwZich8VYE7QyyhVfP5a
	cNltXCdpy/y3JX7ZhfCVqPpEfZa5ivdO9FDo4ZxPH6R5xDe7MaM0sHP/X/48WbPDBOSLoZqmJg3
	/ygw==
X-Gm-Gg: AeBDieukFqMpyUYHoC1Ns/Uw60GJD67L9MW9jrn+cig5bA0ESBCmiVDspbupiHkbVN0
	BEEt0/5SkAf6vzPFtD7JST1eD0u0fRMm19nRZ3ZzEAOFqcN72LxnQZNYEtA2OyrMD6cM/wbcBCJ
	8LzDiuq9Ny+tQlpcxPUKrcwoXDYHmwNHEN+EOmpu7TtLza1XaGhlhGLoeBxhB76m0ZzF6NmWmOg
	HW/Es6LFzHKldjbs/4uAioqgbKu060o5GKkrIY0+0mL0VWQppgeIb6XYAl0B/QfGMGbavf+Vi+R
	n7TR6QwWv5tKJrN2GqMV5IPcnxRKIuR4eUKccy3eqQIbgsXE4in8sqOob/tgI9Gz2NljgTHxokJ
	25eA+Tt5+jRWcACGG7I2lpkhRUPt9OPCjFtsg/l5y4DAw9e3rYGA8Yw==
X-Received: by 2002:a17:903:3b8f:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2b28164cfebmr127253795ad.8.1775466495648;
        Mon, 06 Apr 2026 02:08:15 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2b28164cfebmr127253395ad.8.1775466495178;
        Mon, 06 Apr 2026 02:08:15 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm140897505ad.53.2026.04.06.02.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:08:14 -0700 (PDT)
Message-ID: <4a18abf4-32b0-40c0-bdd1-81ea819c4089@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 14:38:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add D3cold support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
 <20260311-d3cold-v3-5-4d85dc7c2695@oss.qualcomm.com>
 <f3344006-5511-4f1b-aea3-7dc81a091cd8@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <f3344006-5511-4f1b-aea3-7dc81a091cd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d37800 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TnsRN4puekgCtVQ3KW0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: PMFkgMBLDML_i1OoTBbQetEl2vnHcRzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA4OCBTYWx0ZWRfX/gcVglLZit8O
 PIVnV7dI5WQLZLvNOOpKK+HaQxYjfU6LtW4tZQZezwNfW9Q6vJ3+FEymtxfGC5P2ztu34dWpMGz
 gNJkxHxFnzsli4RMbElFkyNYWYOxT/tUAYtQdoKKRMUluGhbV3+ABr31phct49WjPdmZwc7tumW
 1x7pEEJhCAg3xIdjkzdGRpY1hVoRm6T9l3a30Jmwalb2Zd6ZRjBXmQjCO5EGW/2rqLV/M1UXHrv
 lDVw/rmcVDKEIJCrq/tQ0+uSH9ftIQwaI4aGGFj3EoU0QQTkZVL+tRH6dLDKFrumwkQKpguYkY+
 K2YLhw5gMBJKw95JO/UVYnzC8MNNc5veAYQfXhptuJSYgCedLiHhcRxRDdEdDjtwA+uaSpumEBM
 YI/M3DHsSRX3do+/hM+m2u2G2mY8J4qeilJhnIzY6G8Wg2NUzFkRLFwpyIURbTStlciGGjlItCH
 2swCWhybi1fjnhEVUWA==
X-Proofpoint-GUID: PMFkgMBLDML_i1OoTBbQetEl2vnHcRzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_020817_302935_C4405627 
X-CRM114-Status: GOOD (  15.95  )
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



On 3/17/2026 2:45 PM, Konrad Dybcio wrote:
> On 3/11/26 11:26 AM, Krishna Chaitanya Chundru wrote:
>> Add support for transitioning PCIe endpoints & bridges into D3cold by
>> integrating with the DWC core suspend/resume helpers.
>>
>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>> into the DWC host operations so the controller follows the standard
>> PME_TurnOff-based power-down sequence before entering D3cold.
>>
>> When the device is suspended into D3cold, fully tear down interconnect
>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>> by keeping the required interconnect and OPP votes.
>>
>> Drop the qcom_pcie::suspended flag and rely on the existing
>> dw_pcie::suspended state, which now drives both the power-management
>> flow and the interconnect/OPP handling.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> [...]
>
>>   		ret = icc_disable(pcie->icc_cpu);
>>   		if (ret)
>>   			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>>   
>>   		if (pcie->use_pm_opp)
>>   			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
> Does calling .suspend not drop the vote by itself?
No, unlike genpd framework for power domains, opp votes will not removed 
as part of suspend.

- Krishna Chaitanya.
> [...]
>
>> @@ -2132,25 +2138,46 @@ static int qcom_pcie_resume_noirq(struct device *dev)
> Similarly, I'd expect that .resume restores it (and you didn't do it manually)
>
> Konrad


