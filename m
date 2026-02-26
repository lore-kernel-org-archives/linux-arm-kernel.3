Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D626FD461F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtW2bFRzDCHNDseCd5JWULZWJjDZJJs0SedB2d4noy4=; b=ZpyFZvvMJppav/lr1B3BVN5ZeM
	m5vWMNPl4zYZnoxjSdi+2y0AhZhBRbEOMR/J68a6NZnUE+v2Mn/WBHhv+E0XlNF6ID54hr9RFTSw7
	PqLk6AgG+1yX1t94grdsGHL+PzoGrvNm4XT6tF4A8ulomlZPlXX0IYX89NvUIrmkJWiAT8/E8Suzu
	wdCErpXP0wukto01fm41KrWwRCLoB1aNDDI6NQZI/muNBZjt22ZDqZtXeqQ7fXPAFuO7i2j5/P/3L
	fOdI3GgqcnPJPzmfkwOx5eWwS2V+1A1CGzKb39AQoR+fhNgGBE3QxRDfTjoRNarxGn8Hv+sRHP9tQ
	KXm3G1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvV94-00000005Vhi-2zPB;
	Thu, 26 Feb 2026 06:46:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvV91-00000005VhH-1LAw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 06:46:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4UvCp3493279
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtW2bFRzDCHNDseCd5JWULZWJjDZJJs0SedB2d4noy4=; b=RzUw2lE6O0S/GDw6
	x1tDc46Jr/9kjuoNhiTy2WNhpfLHRrh2nGDD59kj/i52bvXE3U5JGEtY0uS5iJUX
	cp5bxZm88mj4YILnU9VZtmT82AI579sfS79xQQDkHY5++1oP1+mZ+PrDci76Povn
	s4Syvu87xc0cmdUwfzQsXbXvYv8FTmjQK1TncyhVjXS+DTl+RXJKM9pN+BPAWMmg
	AEb3j/6cOgnDm/c4nTfxHx5jInHsuZzDLnh4W8wghEX3zbldubqudhyr1QQQB2ti
	5DkXMD5oOLP5C0z/ytkq38k6/s0c+y78XuGRiaAokSxXgPK9nuAEXuF+YfOs4kXM
	M/QBGA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj8bd9cep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:46:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358f058973fso435940a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 22:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772088400; x=1772693200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtW2bFRzDCHNDseCd5JWULZWJjDZJJs0SedB2d4noy4=;
        b=arO1esWcg+OtZ40d1L0Sv510mz2oI8mjQSfep9/55o/eg3VCwgwTALklq2U9QRNDD1
         gz6MxhEee3qwBbQyrz0Y8amJ6QqGv+ftNRplya2D2nrq8tje4PFNXiwiJVgNFHoEL/cc
         RNJNHdRBWwa/bqQ3Sfsu5zw6W3BdXU1o9mP35LUYe1ApnFo40TDQ+vPfAqZK0mPSoyJK
         qBO8+rAVPqJYe5nlb1KyHKv2Ff14Er5oH6+qjDWLiAyk9OFYaR59gPRoqLa1KatybUgC
         Wlr8C+S5vObLGhJ68+74FbWcaqQAy5rSGSMcFC7TagjiE/ZV0XRrqKpBlc/B/81chnBA
         YwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772088400; x=1772693200;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HtW2bFRzDCHNDseCd5JWULZWJjDZJJs0SedB2d4noy4=;
        b=YNKu5rUq4N51bfS67C9yAO+COmaRIvWeMKTot4OQD0q6O2+jFHQEwVpB2SRqgNFtd8
         IA1I5HDj2IhsuZQg7cg2w9U+Xy9ER/rR07ghiRCypxpCBm0gHciAM/O/3Q1WbjBzt+do
         Ej2NbuSzfFV/qLvE4SnzkWYEw0T2qSHOj2tjFnLftB7URNrAhGHuYh1pA+Al0EsdXpKb
         BPkyFpaMZ0JzKz9I/GUofJ+zZ6PEjalB6QI6huaccCYeBuz9+iQz15SlkrRxuWAJihfd
         lMayI1BeAdfJR8MFKfhxw9qhX5pIAkQ40E4P0DjbR0SJrMcprckZtWxlJNSpfo21BEN7
         D4gw==
X-Forwarded-Encrypted: i=1; AJvYcCUP/bM901TXbs3kNeEw8PeLSQ10Vg55UOUwaMCWsFvPV8tKXltrtWS1JRQ1GJ4Sqvp0ytzIfDoEzIkoUHWQnJ9Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxdH0wr6Az570Se7SK0wrQYJlhoTxsWlVG6yFwonU3tJcxvqjHx
	RqtyfcMlNgPYYEF3VL4DTGEGBpw/gHElZsRwu2vWeExTKni9RuqLDwRUG5+PZGzkBQ5h/5AgnK5
	y80ywXHhLDc5UOPwHSYfmYgYYFyY+uKQrJqM0ZMh82YI9kJIWDu9orep618EaZ+C9JeJangSp99
	suZvM9oBB36g==
X-Gm-Gg: ATEYQzxVfCbXTBYWOudiISQ2P1/mNOBgls87lErbColwkTyj0+GvHcEYD5BvJtpchYp
	N0i2V1lydCTrCePYh/9PZywFiNnvdUTJQ7M25satpmnLrgVY54Hd6d1uBkz9ehX9XPVT95Aun7E
	tz5fxMd+yYuG/I3DB+fXkIhaeIRqUNhguBWBufW90nlblw6rsr7a92cKiidQV209RlT6dmkWqHy
	AoPoP9OmOjIPipJ7zAc5cu/r5BWjQJxq45P8zhjOpXR2t/4BJ8lWhEyfdw7Sasd5MT2pq5+w+kH
	SrLU726rnd5PXge6b8BM8kBtzIdy8jGfpy7tftS0wAmhNmN2pgA5R3lKm265u0VOqiib3yJl4fu
	hnc7mV/TusgXq/JhL1Lfd3Uc=
X-Received: by 2002:a17:903:1a28:b0:2a0:de4f:c99 with SMTP id d9443c01a7336-2ae0305eecamr13245655ad.9.1772088399986;
        Wed, 25 Feb 2026 22:46:39 -0800 (PST)
X-Received: by 2002:a17:903:1a28:b0:2a0:de4f:c99 with SMTP id d9443c01a7336-2ae0305eecamr13245475ad.9.1772088399484;
        Wed, 25 Feb 2026 22:46:39 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:8fe5:3076:521d:50c0:367d:1d7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5db596sm14382225ad.35.2026.02.25.22.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 22:46:39 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Trent Piepho <tpiepho@impinj.com>,
        Felix Gu <ustc.gu@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260124-pci_imx6-v2-1-acb8d5187683@gmail.com>
References: <20260124-pci_imx6-v2-1-acb8d5187683@gmail.com>
Subject: Re: [PATCH v2] PCI: imx6: Fix device node reference leak in
 imx_pcie_probe()
Message-Id: <177208839386.15535.2535030930377494480.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 12:16:33 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=FKQWBuos c=1 sm=1 tr=0 ts=699fec51 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=vwxMJ2_kboZHlRSlzigA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: cVqhSTnuswBp8jjVBEfmLP_5IEsuXVO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1OCBTYWx0ZWRfX1mGSZ0Vac2Tu
 8g7o6wzEqJxZcUjgggPtXjbyhOywCkHYD0qfXCp8yoq6dw87TEqZ0NBcpeNOuwZLRuiyOSglzrv
 NhffE/oXmYISy0uvqe7Ytqxg7iiuBZRXBnPUqZp/o9VZFQr4wyzmp2aS/8ttPkw4vFzJsj2USV7
 E6fCdkWlYbIZ8l74CGVAhhwGVPJSA1gkzBNmXS5wLiYWJGVpcRnBIWP+1454xWVD7PSBRF1U6sn
 0H2EJYZ956l05KFnlRf6wSCJWxG1AU+d5zCz+Vhr8M3LsX6RiGk2GR7+Fp42ZpBmSUqAO/HUfpo
 MznATxe0WwvbEyYuVvift03V8al1SlMoOjcGRs+XR/rAv3sXc9D803FenTLUUwoLjb1vUX20OXo
 UQ9oOhC70gqN6AflXl4jUJjH+lNWbCgRsgtFLKPEIq1nyNlWNNZ9cC3Bx6rOyUAkXJCuf6gd1qc
 m1W0AFm7qtSzMe4W3Yg==
X-Proofpoint-ORIG-GUID: cVqhSTnuswBp8jjVBEfmLP_5IEsuXVO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_224643_371251_DA0DD25B 
X-CRM114-Status: GOOD (  12.03  )
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


On Sat, 24 Jan 2026 23:42:45 +0800, Felix Gu wrote:
> In imx_pcie_probe, np is obtained by of_parse_phandle() and must be
> released when it's no longer needed. However, it doesn't release the
> reference, which cuases a reference leak.
> Fix this by using the __free(device_node) cleanup handler to release the
> reference when it goes out of scope.
> 
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Fix device node reference leak in imx_pcie_probe()
      commit: 4836ad727486563370b213ef594d644d1bf85b8d

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


