Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A031D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 05:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMCgIJGsE4vObHn0eT5NJVOvY+iZ8qd9njYcH5Sk0q4=; b=eco9VkXc9v4QFnCUm6Zwjbj62Z
	OfVsibPu5eYIA8cBrduwnHs8e/Ek8QwBlYjU5yG1oV+pkH5XXpxO8vCujb15wwVyHvCg9WWLSBZ4B
	4NQFWKDrsxIh3kqLd97A6L2+04N+JifMmE/I18hj/cCAxOGmMVBVc13nyLT03eHVSoK7aqCVSqdBK
	QKWZ/ligqgMIyehvm+N59sl7q2TmKdhFAF+xkW21WCThwPdj1sOBKddB7moWaM0+WrQu5xfH2B1jW
	Cw5aOJW0RQnTD4iK3AobLVU/Fgu+pBcSxYrE79BTNgVCShRqAffL8nipjMCy1nAmzgJmcT7MF6H6Q
	Sh9DKRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqG4-0000000DqOa-0n8T;
	Tue, 09 Dec 2025 05:27:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqFy-0000000DqN8-2eyJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 05:27:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NX1kJ1737107
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Dec 2025 05:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IMCgIJGsE4vObHn0eT5NJVOvY+iZ8qd9njYcH5Sk0q4=; b=hiWMEyZamUrermsn
	ZkvUFMtcYyIz1JiDFfThKTyfU2Zv4qkKfnDLvxk8rS5dKDd7TzbWQ9wMGtTvx47u
	klblJA7Trk1xMirfXyJeIt+FlIrX6vDYDLQI2rUbppiNC7ey35PK6Az2h2/50k1x
	PTL9iAoW7raS/idnJm7x9qlQuDCvbM1/jPW8pgWoWOmMXJWo7SkLX88wM0WSqMkS
	l+zy6txIaxWV25r19n3Ryk7vLlF1Px/IKO4oM60XDLWLy5CYvFQ092K4jheSeT17
	UlYZmwfIyMl3OUkOTihpWK26akyJ30px2Rx/ZM4PBPlIyYGGT+NuIgnihaNJDWDA
	fH2WuA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awvke31ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 05:27:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c240728e2aso9677890b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 21:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765258044; x=1765862844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMCgIJGsE4vObHn0eT5NJVOvY+iZ8qd9njYcH5Sk0q4=;
        b=Bo1Bmmtr5xhi+EjOcK+/oC2P53WYurfL1a+n+MeIWAtIyhe/M6NiworWIOE1CNd+BF
         7ad8ZPWELsh0nSA6rFJMYEnBOplWqugzvD+XxOqADFwSCrbHfMPTbnuKwM98IizRPyAe
         ZBsjxka9Xf0V40eDlxoMtFdVOZo4hl35Zk/eTx425heC4a2w/GMBNeEywhAcFBCNd3UW
         2ZMXNLc24mbhp09zTr3XiVdoS0dhY5IlegRIZOLLXYfXjV/EoEHpa3zWHKAU8a4rP60R
         VFYUzB9ffKVvPpGVpPa00X405tZMuX/ZJ9jaADco+8X2UFmD3Fwm9OXzLFVK9hAEf1CQ
         wh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765258044; x=1765862844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMCgIJGsE4vObHn0eT5NJVOvY+iZ8qd9njYcH5Sk0q4=;
        b=K6GpmDhXnNhk53sNiWj0/dstJFaPmK+kTuMXc6yC3W6VoosEvkwxW+3OqV1MD1Lqyh
         NbutA+iCKH5exjb9pFnKyPl8h/UktwQeg7+KvN7dpHDj9K4aOTPbnvUnlXrdYDiY+F0j
         pyTOjd44uO/bl4HjfmfklBRleA4P2V22DPmaLC+p2fC8E1NdmAca8t9h2qWKoyJiHxhf
         0qvsM/1V0Uuch9RvSHou2Hh/qn1Qot/C2ssF2F/vxHgEY4xNBAevgOPSKUMcm1CsUpRk
         5Rj1tPpixZ04/7rfQVKAAI3XjfCrCZ3t7Zi3IFqzo1qRwDck1o/LlR2ZO9+EJVU1n2Fe
         h8zA==
X-Forwarded-Encrypted: i=1; AJvYcCWPpDMjWr2iE9MTRPkhJZWYEDAWy/jVhUE8XYv/f95sVhNZvL4hfH3q6i30i+ruWHA5gyf1tZMnhXLCf8KfaYVe@lists.infradead.org
X-Gm-Message-State: AOJu0YzxBj0+/JZyR4i1sb2TQ//1Eh4feOfVgFqyht5MPotlI6a3c+Pc
	av4wVZleX+CV3gKrroe55OVTSiKwGGEbMtyeTF6YYUry1nM3WFMv2F5FBfJlTEsmNv+2OSXMvLk
	6N8EQZaIkH8ykgp274ruO2awiZXHZ6NCkv1E8AQvv4ZkNyQ7yFBi4kijivR+M650s38rhN9rZnU
	KkWA==
X-Gm-Gg: ASbGncuAL8AQEHROwEM5o8+2eRGs2FybMr3HH+6t+lOExhFnqyKgUGYC2BgV9HzPu/T
	5KQI2afAv/jHLDkscV1Z9+5+N5QieIkc7DJyTc0gKI5d9NiTILwN3c3B9jdfDMq/9g51KWo0Uqi
	GCqBwZIPHSdPHwx5GWvy6oBV1/xyZEFugqZIWqQAt6Q5eKWsu3p06I6q/vxk/DJWCBurb39/aVK
	HS989cIxMBIdsifbJ4MAHqzhRm2Dkuzso79WBhmbBMOIAVPi+XmGDIpYUece4RKw5nkhXXmnR/p
	zXQAVn6HuAuUgLrrhG+lp2+WEqbzzFRR54nyArJYqnu4QJKDkOUdkGRT32zR/Yu5nddcGXRf3HA
	4cRb33p5mEfg3DW0NHdCCslBT7okM5QQsBRazTHHswQ==
X-Received: by 2002:a05:6a00:2e14:b0:7e8:4398:b35c with SMTP id d2e1a72fcca58-7e8c54372eamr8721696b3a.47.1765258044189;
        Mon, 08 Dec 2025 21:27:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmSLsEWNV4wfPoZd1g+hDEGVfykeAdoNKus/hSUixAEIUH767tMdjHwQvMb9nzDHCd6MS5mg==
X-Received: by 2002:a05:6a00:2e14:b0:7e8:4398:b35c with SMTP id d2e1a72fcca58-7e8c54372eamr8721679b3a.47.1765258043686;
        Mon, 08 Dec 2025 21:27:23 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a081587esm14616953b3a.27.2025.12.08.21.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 21:27:23 -0800 (PST)
Message-ID: <dad4957c-ca13-4742-b46d-03f0478911d5@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 10:57:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI: dwc: Make Link Up IRQ logic handle already
 powered on PCIe switches
To: Niklas Cassel <cassel@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251201063634.4115762-2-cassel@kernel.org>
 <f1059d5d-3fa5-423a-8093-0e99b65d5f4c@oss.qualcomm.com>
 <aTev28wihes6iJqs@dhcp-10-89-81-223>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <aTev28wihes6iJqs@dhcp-10-89-81-223>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xJbrmdXfp2XD5izrLfbHOTrYwqhEfmjf
X-Proofpoint-ORIG-GUID: xJbrmdXfp2XD5izrLfbHOTrYwqhEfmjf
X-Authority-Analysis: v=2.4 cv=UvBu9uwB c=1 sm=1 tr=0 ts=6937b33d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Vr8HXvedtgjsJtqvvw0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAzOSBTYWx0ZWRfX7FpPfRI2p0H3
 8qq5sKSLQ/UwYIPE1qEz7o6E9mGUrfo2X+Lr10jxPsspleYryDWyGFUwfA35YVbCG0Z2mx1PLsV
 qZ8ZRwO5Ix8VZaQWNWF8L/e4PnFqih6rsx/3bp7Dr5+gc9nj1J3W61PdVm0moQZ9NbOTkfBlKDG
 PbxldB8OqaVKCjihDIbEiE8w/pF8qOlWXJYwGYuQgAal6HQcAHRQoQ4fd250NPKzANjd69ljfyz
 yLaDbpDPLQvsVynarTagUI0JVMAPB4UIRLvBUDDyQVCZGSoG0jj+1LIrQrWg7aUzRx0I++APFfp
 H9nIpeeA24hjr4EJMyxoJFRD0xOHvwXC7sgZy3gQUKXFvOwoDGYAScsVw3tfGRr0e3rKtz9V6e+
 SmjsePtZZiYwX3iweZvW5oiRlYsrHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_212726_786099_44A78F52 
X-CRM114-Status: GOOD (  27.02  )
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



On 12/9/2025 10:42 AM, Niklas Cassel wrote:
> Hello Krishna,
>
> Currently:
> For controllers with Link Up IRQ support, the pci_host_probe() call (which
> will perform PCI Configuration Space reads) is done without any of the
> delays mandated by the PCIe specification.
>
> This seems quite bad.
>
> A device might not be fully initialized during during the time of these
> PCI Configuration Space reads, but might still return some bogus values
> that are actually different from the Configuration Space reads if done
> after respecting the delays mandated by the PCIe specification.
>
> I think the options are:
> 1) Keep the pci_host_probe() call in dw_pcie_host_init() for controllers
>     with Link Up IRQ support, but make sure that we respect the delays also
>     in this case.
> or
> 2) Remove the pci_host_probe() call from dw_pcie_host_init(), and make sure
>     that pci_host_probe() is done by the first Link Up IRQ
>     (i.e. what this patch does).
>
>
> One big thing with using the Link Up IRQ is to not do any delay during PCIe
> controller driver's probe(), which reduces startup time, exactly as your
> commit message in commit 36971d6c5a9a ("PCI: qcom: Don't wait for link if
> we can detect Link Up") explains.
> Therefore, I don't think that 1) is a good solution, so that leaves us with
> 2).
>
>
> If pwrctrl drivers are created as part of the pci_host_probe() call,
> I think that perhaps an alternative would be to create an explict
> pwrctrl_init() function, and let the PCI controller drivers that actually
> use pwrctrl call that from their probe().
> (And just remove the same from pci_host_probe() ?)
>
> In fact, looking at your suggested patches (that hasn't landed yet):
> [PATCH 3/5] PCI/pwrctrl: Add APIs for explicitly creating and destroying pwrctrl devices
> [PATCH 5/5] PCI/pwrctrl: Switch to the new pwrctrl APIs
>
> https://lore.kernel.org/linux-pci/20251124-pci-pwrctrl-rework-v1-5-78a72627683d@oss.qualcomm.com/
> https://lore.kernel.org/linux-pci/20251124-pci-pwrctrl-rework-v1-3-78a72627683d@oss.qualcomm.com/
>
> Seem to do exactly that:
> Call pci_pwrctrl_create_devices() explicitly from the PCIe controller drivers
> directly, and removes the pci_pwrctrl_create_device() call from pci_host_probe().
>
> So I don't really understand your concern with this series, at least not if
> it goes on top of your series:
> https://lore.kernel.org/linux-pci/20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com/
Hi Niklas,

If this series goes on top of the our series i.e pwrctrl rework series, 
I don't have any concerns.
My only concern is link up IRQ never fires if this patch goes before series.

- Krishna Chaitanya.
>
>
> Kind regards,
> Niklas


