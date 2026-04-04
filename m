Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03112E63FE0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 17:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHYoMiuT+hFy3l8CYUd8tWmBQMWoLPghXx653KocS/A=; b=v9qclMRqBi6X8Ua4HYWI+fQG8Z
	PYHjfIOqRaIsYoO+MOSEr2cl12UL2TEdoX1KtfPSB50TlTRi0g5fZFnlSJpvQ/DH1oeQnGj+WS66h
	yhUPC+APNhvW000sYqhceb+/GVv6T2p5oYAI8ihdR+Bdmxf4ryiLQFES53SlcsMYE+IB/3O2CUYvV
	o1iM+JayC+phcIOzoDIbIPmx7UY+rZjCD/MHWtsUDCPa9UJyz+aVH+6DQiToP1HbntG1Ji37chpry
	bdJcyoiX0ziMoBa+3vkRaas/PmB9RjhnHggthLKKXxWhLCpKPXrgvx1boTGKXOgFeJCwAhKOX870H
	UDy98uoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w94MD-00000003cIZ-3ztc;
	Sat, 04 Apr 2026 17:00:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w94MB-00000003cIB-2HEd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 17:00:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343ZGvr1872234
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Apr 2026 17:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHYoMiuT+hFy3l8CYUd8tWmBQMWoLPghXx653KocS/A=; b=pH6exHM40Mb/jWHv
	EoF7X2tC/uk6AA9v7E9Q/VuVuKiLEkYBvoRmtkc1E+RiedArGBAhQ9IbgkB5fT1N
	rOnUeRcbJSgBNTRFneYmWNKzG0iykmLfa1NqQxZcC19ab+1ZzhkX8kTpOu2Vbbc+
	zf0FSZ+UOlAbmmEI4KtUQ4ZHbIaWMn8rl9EDflmN1FQV77v0iJCkokF2KcPO3UCe
	HM/JmqM4gEMyWre32+vTQVWNA82Dkjngur1J+STLBCllNnPIpXOBDFvNwOOwfxJp
	Y5IXnWteBbyUqmwvuFWeOo0epAbyzj5unJqzRoNWxYgKY52trakJgqP3bTDjSdUc
	vOVEEA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv195t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 17:00:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c649dc145so1611537b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775322022; x=1775926822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHYoMiuT+hFy3l8CYUd8tWmBQMWoLPghXx653KocS/A=;
        b=b7cuIbJ+JCPZ+dAWHZdKbpr4+nko6r3VbWhgBIlMvBAMP1H5jKJQJ3b9d/EgCKNfS7
         zD5bG2rW4fcnIYzQ1xvDcMt3zI9ms33TnFZ57zM/3KH+P4iefQSbbiDjq+u/KSOHCvU7
         a05igQUwf7gusWRf/avmfa2neHAdq7hWNI1QmvLCYRbUdNSEXRI/62aWRG8HgoX5f1yP
         cSmuCPjV1Y7tgqRIBOdg1MUKrqAyRhPVl0S/GV0ho7z0APxFOArtMwz/pZaYZYphrQIV
         iqUPz3uccwnNZm+KN2ciSIALzF9PQT0YX6cX8/+dg/ao0eD6XkWGaTUnXGilGvdJRZZk
         aJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775322022; x=1775926822;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BHYoMiuT+hFy3l8CYUd8tWmBQMWoLPghXx653KocS/A=;
        b=ks9MTAQ4IqT1NXWWG3eqfGpZo296NkGwQa8VeP+e3SrBJdRwjVBElcaj8I49bJHSXd
         i7SdbJwiIP1tNbdSpYGXeJplht6u64Z51HlviStTi2PZu8uZn2w/ClGsTdkiHAuqYWuA
         PMae849+C4pin06ummRQnblnrgpr7Kx0DfH7tdDOQ9jTvmz/y+iT/G6kUWzk4lXS4on0
         TJCFeKJbTFCFCsoLLMgm9bc10zL5iurLfovjJ4xbGBoJlq8wc+oeGzx4GwHDmx9rODnb
         ji4lJxWy4sFUlaUw3SEq0ghVA1BXtjBRtq+/o1vRpDnD47BVepnHYnSUQMnm3dYvwu6V
         yJhA==
X-Forwarded-Encrypted: i=1; AJvYcCVqoUhDK+q5EL3GHPif4KT+j0uxtziTzrlbTfsAEkowUfZx3KxtvzMNw3b0G3KIodFRskWOB7Gv9A80LVQ3PPlY@lists.infradead.org
X-Gm-Message-State: AOJu0YxPBewu+6KP+vF9Vwth6wDtHz8VV7KNdF+k1jSt1nH9XcyUCP4b
	uU1rBnGmqCAiN8z+SS3zYhIxt2f6fB3uBRpm+/3d5lYh3VqTvgL01eI2R20+70FT+rL8hngpMAJ
	5PaIYNmppl6PP/SBL0i51LJYZHwlSgi+4JL25lTgKYaMJVMWfE+tfpdRSg5tJjoIWZO+jBfFuYe
	DO3A==
X-Gm-Gg: AeBDietNHEA9Fm0fTBL0s3XhJjXywjML/MgIvEZtUgpY1DztYeqIDIGnof1a/R/qZ6L
	Y5KD+m57jLwG2UzF03bhB+3472ZWSXXLljFJllh3aO24f5jjiKndPjEUMpIuEY0JzirDxywM/tV
	RiG5POoZ0iowIDAHrcfbuZW0Nt910ZWCTyMyFkXh2BUHYzkk0wPm1iJbpklw1yOrMPhFEtFiR3b
	Nrga3mseT3yFRWVcw0B5ikQB81PFHEk45GDibHu0Vthq/dLiFgSCfklveBUmtQwYLRxFmFEKqwL
	B8I4GkgXu4Gk6e4Eomk3p+yyRh5LjWa0CfpqX7CDoXdp7yNdyKsfIRPsBhkVn/B8zgcPaucvCPV
	Y5dD2/2t+wCzL9bSqAkdD/6j+
X-Received: by 2002:a05:6a00:a0b:b0:827:2c79:fa84 with SMTP id d2e1a72fcca58-82d0da45d27mr6277599b3a.12.1775322021791;
        Sat, 04 Apr 2026 10:00:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0b:b0:827:2c79:fa84 with SMTP id d2e1a72fcca58-82d0da45d27mr6277559b3a.12.1775322021206;
        Sat, 04 Apr 2026 10:00:21 -0700 (PDT)
Received: from [192.168.31.133] ([2409:4091:a0f4:6806:b530:cb:a537:434d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm9368133b3a.29.2026.04.04.10.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 10:00:20 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Franz Schnyder <fra.schnyder@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        stable@vger.kernel.org
In-Reply-To: <20260325093118.684142-1-fra.schnyder@gmail.com>
References: <20260325093118.684142-1-fra.schnyder@gmail.com>
Subject: Re: [PATCH v1] PCI: imx6: Fix reference clock source selection
Message-Id: <177532201484.28194.6879238704665681982.b4-ty@b4>
Date: Sat, 04 Apr 2026 22:30:14 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: v9cQGr_OB0hiJXnuymJxqLx4PTogda3K
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d143a7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=d2OGGJ5TCE6yqAnRVzwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: v9cQGr_OB0hiJXnuymJxqLx4PTogda3K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE2MSBTYWx0ZWRfX1fNVHpO8xS6p
 eAP8EUOph7bBUXpe24RVSdHz8/H6CSuWj0b9DXH+uKgSSXELI8QCOUF/DXA0U5wVolsXtmdtlfc
 7rdOHm2aoMtAWJMnw/u1Z7uj8zTN89ndbSsYd9H4DH61xCrS/pA12Mp+3ZZxpxlQ4DptWv6KtI8
 /H/TIo4O3yX4aOIa5OB7r/EHQqZdb981nyP+GRCjf57cDXioutQyDZx/bCmSfz/24hjXSrt4lOH
 6DiZDkwCA3dMKulYxgd2p9Bcmh4FxlpGyMVJjmEHBfuqke0mkf24iPgcDiZr22xSSCyyx1/iyRL
 Wc4ouE9ttyDxp+EO7/MYYb/DUAomcDxSTJvIktLq/5Kr1TZV10POD3BciMRBJDlyxWHuI/cT2zJ
 igj7QZBHW6sqRx5DJnJ0DKUPkyz1NHT4DSaouNcpWE3o/EW2G4QbQwXc9wGRacBwTghfE0VNpHQ
 RE5ZmJACmip3sy0qfkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_100023_587621_BFD83337 
X-CRM114-Status: GOOD (  10.11  )
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


On Wed, 25 Mar 2026 10:31:16 +0100, Franz Schnyder wrote:
> In the PCIe PHY init for the iMX95, the reference clock source selection
> uses a conditional instead of always passing the mask. This currently
> breaks functionality if the internal refclk is used.
> 
> Pass always IMX95_PCIE_REF_USE_PAD as the mask and clear the bit if
> external refclk is not used.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Fix reference clock source selection
      commit: 575d7268ca07fcb1d1a50399e1399ba60df3cb27

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


