Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D8DC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyCNQ3TRjAn753UkRsRqUtDMNS9fnsDSx3XVAmAgxtU=; b=hx3upgjRkT3XqXFWCMHFRbpbXx
	SW2WjrrFLl4Z4e+2Va7t+o4hCdVE0aCiCjk572VpaHid7SXn7FTS6RcN4AUXZqae69olI+CsSJzkf
	RnOjYzYw8OFX8Vx5yE2ykSMZ3h/5Hk0/uUrmfIhZUTSGmMR+NdTDdPnQqc5T21tBS2VJEZcd4a9lc
	XV9AZOkULxnrVv92jvBCQJAh3700oYOa3UUgQpIjPrnJ7vGwa8Fs3sU25jcGQGYJA45pdI/t7oy4d
	IIjl9C/3h+lKViLfYyNu71IVLH/r3DVF32OMqBqMzYOBHZffjkvxbrdrUkx/vkTiZqziDXe5UQfJu
	b0Ld5lww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPqc-0000000APYF-3rRz;
	Thu, 17 Jul 2025 14:44:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO1P-0000000A9oP-0tBJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:47:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4mYZf016003
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QyCNQ3TRjAn753UkRsRqUtDMNS9fnsDSx3XVAmAgxtU=; b=kUPfhJ7eQ02lEORM
	CETlO9BpKe4lrxCXg/rMGb5p/a5aca/d6bXEUGksvCRPqiekKfPr21yhWzc+1emc
	eoM2/zNUeqy/8sYpO0haaWTZODyX6evXpMUSwgiDMKPDSpasjbOCeoJ3eEjTWf8i
	DBtRrZIKPMVc4Cps0lo3yaGPfEVbmCwVjcv+9ce5fMhi/ZV6BAxJ7mawqp7iWwwF
	b/7E9JRATGWBwfJIOfHoDqWmpA+wIGZNreQ/jd9DSdvAJNRUOHuWnHm/AFotvCeN
	VGZWIXF4oD6fWfwtqLsPNinezqS+xT3GIPU74l2Hm8/Huozjmlj7ShehheMqFIPM
	Cicz7Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dytmfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:47:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b38d8ee46a5so940225a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756453; x=1753361253;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyCNQ3TRjAn753UkRsRqUtDMNS9fnsDSx3XVAmAgxtU=;
        b=DajygA0d5dE05HUVYFPUxCEsxuCyT/gZa+Tb7fIXB0elCfKoYutmtR3BRuYIXIUm9L
         6Xn7sxpi8aeA1toM/LE27qfZSeKrCoW8GASYYQqVaV9hy+A7nQFkeIAvULO9olkBnqme
         DlAbE8geOQgQ1XefsOpxdmemAGYZzsqAQjlaoHABp8hGYos2uI+KcDtpJQPWFPM/O/Jb
         yIfcWnC0WILFe24jq2pAYlXsD7uCC0Og6kVVowMU5yFrwHXP8R/5GoVOu9dLRrjOtmAk
         hguNP6LXyU66um7RwOchq/gzw5WzIgVUDrR0JC+9bluiHkkl82OsFVZRWECEzg4O1qjb
         uuNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK6tI3Moq+T/sLFNrP0MrFy95zxG+oOxVL7w+pRC78xfxInWEkGmVWbkMVZ7zePQa4+98LbfGI+xB1rjAOpGqj@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu2DUTTYCdILTRBvjLrTaa8CiziL9rxjh3fMJdT+utItZKb+au
	aj2td3uod39HiT6rEkn7ydGxJOx45kx+YRWNbSAf6qIJlG+tgtaUEZ5baxMVqsNprxSPLTuSaTS
	FIezKlTKAHsa/Op86ZFMMWZEPIWMf4X2uDpc4REsqQawlaTwFE47wY8RYF/f99RJB1/1prOTnvE
	zG9Q==
X-Gm-Gg: ASbGncuXyp0uO27LrTxYQ2HoHXQ9eKdosR54t/2s3mIc6zbpHbyLIzIuWEcdLAlIGed
	9xvaLuFUIz5uqjRqY13rNEjje7ecVZh+mxF2yL6CkUxFtmeouqxtrcZE9wtChoOAHDrrm7AIYFm
	MthegGB6s+fwTaJ+5tKF1cTO5pf+dhS6chSRG/bTGqPkK9q8Dp9pd52ICCXWsm1o3cKSVzIRAqE
	f2gEotrvtoAaD5HHfaGqwelOsNOIluuz+RXBlaC4KEvkZxQwWUUATx+uBpbfmzf68xe3JMuUdAm
	r3lz2IQpMfZasY0Y6EQ4J24Z4niRNoPBcOrPdvvk7fZeMrinffLKmArBJB2lhX7ykEI=
X-Received: by 2002:a05:6a20:394a:b0:215:e02f:1eb8 with SMTP id adf61e73a8af0-2390c7db653mr5445652637.14.1752756452624;
        Thu, 17 Jul 2025 05:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUK5pLXOx8e0IV+sa+E0Kwv1NKC6QjmytUiIFxW4avHeLfR8OSrOUNYppe6+YPfhe+N/XZgg==
X-Received: by 2002:a05:6a20:394a:b0:215:e02f:1eb8 with SMTP id adf61e73a8af0-2390c7db653mr5445603637.14.1752756452177;
        Thu, 17 Jul 2025 05:47:32 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e07facsm16466393b3a.68.2025.07.17.05.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:47:31 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Jim Quinlan <jim2101024@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <20250624231923.990361-1-florian.fainelli@broadcom.com>
References: <20250624231923.990361-1-florian.fainelli@broadcom.com>
Subject: Re: [PATCH 0/2] PCI: brcmstb: Trivial changes
Message-Id: <175275644815.7439.10347177721311626088.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:17:28 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Np0d0o8tJ79X4SlkGf9b7eST-LLPS70V
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6878f0e5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=A4mJK6/VAfRUM2WLv3bxlg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kdDjAxzh71lflxr6eakA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfXzwMX/g7BwGDs
 vG+GxgBjlFMz8wLVaTvNb+OM6lekcfJTv1lBKeA9oYuyEVLGk8kasyQtDbilOWGTrkHtlIgSA+j
 3hRFM34B2ypIDfTD+iY77LS+bp5XZ8IfQqPm/f02kvlooFf2L7FVuMgWD1PBYWxlITR/pxiepOW
 72iIPwccqX+4Dn5MsxZflRb0jg05xKZl+vHiTyJnD00tfQDO8Gn9rhkllVKFHszon6YkRPzwPUB
 kdqxIkkxXK46arWjRS1O8M5r3iAW/VWLlM0YKHpzYOJ97sLbA/bj6vBpk6WHfm/syC1jfrFfcZF
 vDDi6sYmrFIXM5J+ocmcyKgV/o3fx1196KEPj4QEGrRsPwuTDP+YgnL6TKOKoNaIFuyUc+BL1r9
 P0xogweo91+nF5oTlSDO/WfrAftnK03/n6SNHpiO5XA99HYxHyUb2OUvrSARYvT7qW7gSxy5
X-Proofpoint-GUID: Np0d0o8tJ79X4SlkGf9b7eST-LLPS70V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=578
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_054735_259555_5B8F6051 
X-CRM114-Status: GOOD (  12.19  )
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


On Tue, 24 Jun 2025 16:19:21 -0700, Florian Fainelli wrote:
> The first patch removes Nicolas from the maintainers list since he has
> not been active and the second patch uses an existing constant rather
> than open code the value.
> 
> Florian Fainelli (2):
>   MAINTAINERS: Drop Nicolas from maintaining pcie-brcmstb
>   PCI: brcmstb: Replace open coded value with PCIE_T_RRS_READY_MS
> 
> [...]

Applied, thanks!

[1/2] MAINTAINERS: Drop Nicolas from maintaining pcie-brcmstb
      commit: fde41f282590b46e96864ae88da2e2c20a967b3a
[2/2] PCI: brcmstb: Replace open coded value with PCIE_T_RRS_READY_MS
      commit: e8e7c1e95d6d4ccdc53654a5966d2183532ab115

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


