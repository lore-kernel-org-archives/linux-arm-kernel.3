Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAC3D68BE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmr9S6sDpiWNapvnEXdAgWurpJJXjWMVM9sn6AYEorA=; b=1GgLSxPjkUypy90yv9NXr/lc90
	xYYYpbq+jNak9GB6HrgnwNFQOS7LpReNqah3Ui2E8uXmu2VYTXfRiTZIQShpAzjNBDdhPJ91SWEDd
	260Iy0cjL0d3X/V5dW5sKQy8u7Hv30nXyIACmhdjBbQ0RewHjZ6098YRJHurWaV2XT320cNFrqyBU
	kg3bjZUzxiRVtFN8Ho32m7KErejUARAMURk4V1HmTrkUt4aL573Gwkn52SQB3j766NQPP49hjmNcB
	tJnQ81is/V0cYqN2TcZmj6nfxeWL+sSO0q/Ui6fZ6h+GiaaYBmyEoX2Xozhkhk1CswxzLbAS1HQj6
	qJD45EyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8st-00000007zex-18iL;
	Thu, 18 Dec 2025 07:57:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8sq-00000007zeE-2jrv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 07:57:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Z8Dk168160
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 07:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tmr9S6sDpiWNapvnEXdAgWurpJJXjWMVM9sn6AYEorA=; b=Pk4hcSOoAk99j/Sj
	sNaMeI/wKAqHnfCZBwAjsb5L1HiBX8rfrOh0w3N2bs+NYuxgZ1Ro8oqekKhnGsRo
	l5ylrB3YzB7tDFeTB2N12+txfdtsyzu36k1w9mEOdy7wGF+dB5ELEzFiH1l2Ptwm
	J0QFnXtK4xCZ33D9rCWA8UBmhL4Ua2Y8a1UlvMUObZ6+2H52zCPX+inO3aWiaCZ4
	On4d0M+HXOkeKOhelj8jtF10YS4z8XBnweqjpOZgH0SwCtxqmoo/Y6VnR0XdBY5c
	dojGWB3xTUiNmg2OcyHPH89E4UDArlDZXTNt26R5QIDFBh1CCs6sB9snPpqYwABe
	e/7NiQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45w51a30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 07:57:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f27176aa7so7012465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 23:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766044631; x=1766649431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmr9S6sDpiWNapvnEXdAgWurpJJXjWMVM9sn6AYEorA=;
        b=VrX51EqcqcOl86GDoJ+855KNYCqeTejXZ+pzMcyw7daMUJRBLgRdrlPA3qcRMmYKF5
         5TMTU1xIxwXK+lvakpd0tLuZsJvNEVb9ioWWmuziefCIR0aM9pDiKHi4XBLNVLWCNu6k
         jucf005OXusxOcOJpyiDcbiIj5I61gw2GRvvp0bXAY12NAW5Jwp8oF3b33wTgxpVmH3d
         l1xD4Ueq9gw5Iot5GPj3nTTnpMu7HreMo2yK4AJEabi7njQUpnQrETq1BwIahKoQNF2G
         aMwDoYV4j2vac02D7JkgWGkWnzvpAV/V8ub7XPwoEWFOB3h0R19B7+hbIOB4XczynoxH
         W51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766044631; x=1766649431;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tmr9S6sDpiWNapvnEXdAgWurpJJXjWMVM9sn6AYEorA=;
        b=jae2d9jMSfBvwSypONbr4+8A6BYNbC+Ws6U9yd7Ll5scDvqqxmG4D/b36SMxDQAGbu
         zAcc7Uz+AvRiggT84OCApOuKkHoVa8Nb0+TIm1vawAB+Q1N+wobj/PODIL2xJp++Lt2m
         Fz9T0bkObGtl5V8UjaYTT8ssRAj1/Pp9e8rCcHJlmpdk64aAZkpSnmAQ5r10Vk25/rBj
         q7o41L+ALXfbs000gmFMYeW/wqLSrHoMpgDvvgZmNaEkVCzngn30XFvblNYR35phn/oH
         61QgS+mN9chAZOrzyySF9BU/j1ipHhs3Hd8YFEHQZhO9ExUnCdj29aUjMLVMEvnORdEp
         vpnA==
X-Forwarded-Encrypted: i=1; AJvYcCUB7IjPi0RtVFrkHxAke2Nq9lIoysmCVu7TQ+xCpFT0ZO0ZkymbvDv+X+NQN4M30WT7h0rHri7Q3XTktuSxlqdD@lists.infradead.org
X-Gm-Message-State: AOJu0YzyrlJRzgTDnoSX5NvjfiSyD0AHz2rrYiTHiUKLLxXO2RHWJsSM
	TFbTcPg+LpZTb+n3ik9IK+o9A0FtwZtnT7U7lfaGyFJL2wGpP48+JAhYuzWElrloBZiCaXMu5eO
	UWdbVzw7eCmaIfoDQFMdj/5CLAv7GQRyn39pAG8quAvehrG2h8MPlY+PQN4qbFRqTU0Oaw20+zD
	7eEg==
X-Gm-Gg: AY/fxX4LQ0mEyrdX+VNIzMIiRVOaoknN4V7h89yLgBc7/Bc69sNbGxn931aif3tADv+
	VH5+gNW7JkOVHvxyasQTC39uY2SmaYwyo/o7MTjVRwaL8Gm8J4uzOa3i+EiuBoy9W9LBTY5fjgO
	39aRjwV/TVhdSFoTSuJQB48iIHI5qPLdHMwGJazu4qTZc9t8ifGvoR/4lP54Jz57xmgd6eF+8XX
	C3p1/jJKatnr3OlFYMc7ysf8qXb0TrdLmMJthXEtosnGa3U8eG9n4zMA0qP5cE+fM0px6xaaExX
	KLMurSar/7lEjUvbErLtFqlWeNISIyWzhE8TGRdR3B7P/Fqb99bXRXadPWX3od4fiDr6f78bWr+
	VtdPfWtu6NdY=
X-Received: by 2002:a17:903:380f:b0:26d:d860:3dae with SMTP id d9443c01a7336-29f23ae4459mr204531255ad.3.1766044631272;
        Wed, 17 Dec 2025 23:57:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ4mc/QATeZuw9YBw4cP2ebniDT5Eu2c+gkPaPmLvI1fTyaBUfHNC4rjrrKOsKVUvRNrFoUA==
X-Received: by 2002:a17:903:380f:b0:26d:d860:3dae with SMTP id d9443c01a7336-29f23ae4459mr204530955ad.3.1766044630863;
        Wed, 17 Dec 2025 23:57:10 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d193ce63sm16086545ad.91.2025.12.17.23.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:57:10 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: vigneshr@ti.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, bhelgaas@google.com,
        Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: arnd@arndb.de, kishon@kernel.org, stable@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srk@ti.com
In-Reply-To: <20251117113246.1460644-1-s-vadapalli@ti.com>
References: <20251117113246.1460644-1-s-vadapalli@ti.com>
Subject: Re: [PATCH] PCI: j721e: Add config guards for Cadence Host and
 Endpoint library APIs
Message-Id: <176604462693.840440.17361297043510952220.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 13:27:06 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: M-s86lKJpjDc4C0FZPTBQmDkBGWCt_Ld
X-Authority-Analysis: v=2.4 cv=eKceTXp1 c=1 sm=1 tr=0 ts=6943b3d7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=PLOdWElDzbaVVj/XHNhp9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=XNqfoAmXSU-mxqL4qO4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: M-s86lKJpjDc4C0FZPTBQmDkBGWCt_Ld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NCBTYWx0ZWRfX3Np/XNM50fmh
 /SaGQOzHu7EOrtvrLrB+HpRa4OpGu23jPpLlSlfNvBmtr7He/xn17nBZTdONCC2/SxCJPcgJMfe
 e6i0ngCn20CvqQ1+aCCM3RfaMYTAOR+AiaMPHWVr4edRQbY5v1fn+DKxIYGlqKbt/88xJK0twTc
 FuCoaR7kd/5TGCFyGzXnxFvDVmoVLOEdghYZQRmZXBxiGsyaWZtDjhA005l7OjMwUkXI8ea1t9G
 uzay5wvzY2rPQT67f57fEPB/uC93ZdENMic7OEQkg4pivUVaHPZvCH9TQvxqc63JXQccIbxcO9s
 /HBuNfecQEVuygBV2iDgdZChkAamfcgPpxfUGfjt8M1d0s2K5ngnNbWHy2FBkulv4fZY822b6sC
 zTA/j2Etm6IUr4ojRO+5DMqMSO5Puw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_235712_709920_E85C12C8 
X-CRM114-Status: GOOD (  15.81  )
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


On Mon, 17 Nov 2025 17:02:06 +0530, Siddharth Vadapalli wrote:
> Commit under Fixes enabled loadable module support for the driver under
> the assumption that it shall be the sole user of the Cadence Host and
> Endpoint library APIs. This assumption guarantees that we won't end up
> in a case where the driver is built-in and the library support is built
> as a loadable module.
> 
> With the introduction of [1], this assumption is no longer valid. The
> SG2042 driver could be built as a loadable module, implying that the
> Cadence Host library is also selected as a loadable module. However, the
> pci-j721e.c driver could be built-in as indicated by CONFIG_PCI_J721E=y
> due to which the Cadence Endpoint library is built-in. Despite the
> library drivers being built as specified by their respective consumers,
> since the 'pci-j721e.c' driver has references to the Cadence Host
> library APIs as well, we run into a build error as reported at [0].
> 
> [...]

Applied, thanks!

[1/1] PCI: j721e: Add config guards for Cadence Host and Endpoint library APIs
      commit: 4b361b1e92be255ff923453fe8db74086cc7cf66

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


