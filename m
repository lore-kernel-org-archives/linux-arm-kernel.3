Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E8FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pt/ApixqlclrG51koS1xQvuTNFgR3QVJPDXsgl/ix5M=; b=GUPF7/C/k/592hXOFeA32oF4LV
	onj/RDXjU11oQarJyAIHaIFdnORy7sJ63jjJVWlqPY5JuT1syafOKro9eMS0Wh1C9Xt5h/znQd4ZU
	AkOV4rUsYlzxC0u6TBXB6aX/OeZTBvgT0FsP5B9nG0xlTHpLGp5Gp/ttwiA0dM98KFu3WaIFnwqKp
	WiOQvk8Gf+fMbfUrFB8duhod17KaoB1h5hnGDpo45mo0Fia/sl21coyJzr+a6SEGYRS3hsx1NgZ5q
	pJ2BQb7gUHFMU3ljQAGh+1x0urBR7TiYWO+6oPoF6rNBkbuydyRe0Hn0XTq/4154dsFZM/lZrqfgT
	kdqrZx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAzI-00000002za7-1l53;
	Wed, 13 May 2026 14:55:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAzC-00000002zYJ-3RHZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:55:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wooL4159611
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pt/ApixqlclrG51koS1xQvuTNFgR3QVJPDXsgl/ix5M=; b=XTlxDDphz9dNihO2
	/kDmXCMp1Vw92z7+otxHLWBzNfyuKRiw4zFiwt7aF1/5CWrNOOhcAO+xWwAWJ8gR
	CtILnL1U1JRVfP+Vn8ZiHzwQKMxLs6uMl1r1/rlErLa11zORtyodAPGdxapluCqE
	ec7hTSv7GYeGtgVIA8Lsfzruz1jAVFnWhX8dl3ZsgglJqODTuq3EF+3pUIrOrJ/2
	A39MxBDxMCQQScSmfiP2ztc1r7ytkhMZoD5nVYRQUrS4GF6B2G4gy+itf1ALpnhn
	0o6pCHyVDmRChCMaDiZcfvV0AzMtosdOYFU9ylVzTfJeFZkG8whEP9X19ZrLoikE
	kSky6w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91scvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:54:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso3533642b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684097; x=1779288897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt/ApixqlclrG51koS1xQvuTNFgR3QVJPDXsgl/ix5M=;
        b=VPu7LG+we33EZkbEQalMNFSnhGwl7GR2pXdGv4LsGZQbkH46i50gLmvRN1Qnsp7WZx
         PArWqsvxunXe1gSVhS7iYG6rcwUERhsM8oCNuUAmGs8kh2jqxg/h0c83K+AHZVOWJUII
         feXkK+Hac9bMZGTCHj/MGlutOvlhdLLXYX4gy8+MhqsiYKSxqTiUtk/KVd/5yvB5Ofjt
         fgpVHpEIs3aOCBS64j6M0OeefuEG3bAr7F9TGCJbhEvvQ12qg0Kxia6FNMciawLc1dde
         0lF+Ep/hSGERl2acwIAyBwjdtvhM2tqiuZkjrhds5Nh9SnS3MPt6WhSalxDAkkpNBur0
         tiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684097; x=1779288897;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pt/ApixqlclrG51koS1xQvuTNFgR3QVJPDXsgl/ix5M=;
        b=fjptkQc8RT46L8bicmxo7Az2Pls0wFp1X+RRMZsLrxo/Vbkm14aTWI3kjKCqzkgSUg
         z+Y6Nv8Y9xfPM8+jTW2rLdc/oT29uSQpUn0/PqvXs7KLvvvtshuosg2c2UQxlxrUzy2P
         A3MvWkrWHQ94FuUUynn7wLWedOOwI4hXFllc4gLLuq6OPeZ4jMzYy0OPuTSfxswRDjWr
         b2LBvYgF4S1n9reU16lUYs9ePOA8LixL6x9wnUiUuQfkoFCEFVUj6x52JCNadmwBUP72
         hKPiJQM1M1a5TuZJLbYyVequSCrR+Loa8/MVPfj04aV4M9F0+Qsbf8F278KKaHIdvvOI
         LBHg==
X-Forwarded-Encrypted: i=1; AFNElJ+8QP3FJfa95zBlVHVq22DLrnRIyec75gvrJhexj0qZXuqmu2OY/U7R5m3uDxzD1j5CbcH2DFoNiySHli/itiBz@lists.infradead.org
X-Gm-Message-State: AOJu0YzhKFimthsNtvjnCXm5mCM6sNq7tMFXaMN7f2nyXRVm+YWzmM6j
	qWD0OC2cw+oXs5wuU9eVMyj4DRp1ehy8lLGb+J7Bm7F2TJaiUonoVTqpmfDzvJI4iQnXQhw8JAn
	InL2nLKM9YcyRtRamLglC8M32/ZDSnLmw6zUAe+1uK9iDeruDvC9W8J/hewITGS8PajmZVH1oT4
	uFlA==
X-Gm-Gg: Acq92OFBrpqZOFQ6B3PsG7U9YhBb9qSsQ9eEL9oR/rC6BSchewBbEmHAHCoeSb/7kML
	o80Hl5T6UvhjgXuTs4Vhrju+I7m+IVD0vbK/wMg/MlzqcTKAMPFTBMISTXbfJyKdTvtEf3sYqs3
	+IS91zrFHrCL0x9qm8sF46a8PV2vyLq7yuhp1NXranHYGQ6qeAppWVP/XW7KOL49AWi3uLnRZD/
	ymdaPQZhw/cdfdoPlarwaoK5Njc/gKsk5pYaXTjaobPfCORMy08bvOpaUMIOCdxe3wW0ggf5zlp
	79gUDOESKjdK7Zxh375rlRKM1XepVndK/T0hR625WQZmTYx+i2PP2Eurmpf5ltyIJGbc+zSnQJ+
	feRHzqTXkZO/ngWW3bo+4
X-Received: by 2002:a05:6a00:2c86:b0:82f:b0:28f0 with SMTP id d2e1a72fcca58-83f042b390amr4151478b3a.34.1778684097326;
        Wed, 13 May 2026 07:54:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2c86:b0:82f:b0:28f0 with SMTP id d2e1a72fcca58-83f042b390amr4151440b3a.34.1778684096733;
        Wed, 13 May 2026 07:54:56 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.195.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f38fsm26172053b3a.8.2026.05.13.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:54:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
In-Reply-To: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] PCI: qcom: Add D3cold support
Message-Id: <177868409227.23780.11104184283675036276.b4-ty@b4>
Date: Wed, 13 May 2026 20:24:52 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: 2npNHlavLJLdq52DcDwYjKCa8tM8vs58
X-Proofpoint-GUID: 2npNHlavLJLdq52DcDwYjKCa8tM8vs58
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a0490c2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=QkUiPtlOeBxfVnO1KVo74A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=0YlPbCStZsfHY8mGD2cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MiBTYWx0ZWRfX+lScuwCxDcOl
 KTAxIJUO8BqQtZWy3DFiLlnpE3TVrt2BkVd+Aot6XNBP+BDIEpqpXzEpIXtrim7trWELfc55s+g
 VAiZgM1Kl3NZsZZeWKSq6oHcp+HyfrdCAjxQI0MHnrxEJHNzotkvdEfBInS/W9D4VGawzT+Muwf
 XqqpR39Dd4Cpj6yO5XlB59kYoj2tOVmZf3L4MQ1J+fOCvFF3AgpsRWOKsHX01ZzoZdMcqBHf5Tl
 92CIbpn+pKQD3j0elqlXunvowckdb9u6XGwbuN9y/DT6zVI/d44WOoy/q9F5NPcjA5NR9WwenH1
 e+uICUp6kCokql3gLC0iU7hRHJmWl3n4IXQWRoJdLwz8oaxcQGbzgDmyJDyQojNnGm6St/yURd1
 n6QLzPrKG9H0xfjlQpl7rgm590W98Tg4AF56uKXOiFAadZXPZWgzS0ygdVUrdTg2cGjyDBZwxaM
 0KCsYqdkqqHX6xxkZXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_075458_860058_BB68671A 
X-CRM114-Status: GOOD (  12.70  )
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


On Wed, 29 Apr 2026 12:12:22 +0530, Krishna Chaitanya Chundru wrote:
> This series adds support for putting Qualcomm PCIe host bridges into D3cold
> when downstream conditions allow it, and introduces a small common helper
> to determine D3cold eligibility based on endpoint state.
> 
> On Qualcomm platforms, PCIe host controllers are currently kept powered
> even when there are no active endpoints (i.e. all endpoints are already in
> PCI_D3hot). This prevents the SoC from entering deeper low‑power states
> such as CXPC.
> 
> [...]

Applied, thanks!

[1/5] PCI: host-common: Add helper to determine host bridge D3cold eligibility
      commit: fdf2dc2b677c8a26573624ffcd8f4e2265a99b6f
[2/5] PCI: qcom: Add .get_ltssm() helper
      commit: 60aa688121667577f2f2e7d01c805277dbb75a89
[3/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before disabling rails/clocks
      commit: c3554c5ec37a490fc66480e10f00ac5bada8eb0e
[4/5] PCI: dwc: Use common D3cold eligibility helper in suspend path
      commit: f4f39b1fdb9445b1e4682fed6f86a2e327755acd
[5/5] PCI: qcom: Add D3cold support
      commit: 2ce984daf09332c09bdc26550d7b6cd4f12d3a6c

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


