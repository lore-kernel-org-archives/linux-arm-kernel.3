Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11043F532E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQM7eHnVoeAhrAn7FxIm1PZgvchjSYSQc/shb75BI+E=; b=bDzHT5BWIL43sF+bNWw6kND3Sf
	xLPA9fRzzsbB2/mkJ3autDtri7/aCvR7aPn5TybL48wTgXIaXh2ZHE1y+nep3yPM7TZmlhhP4vpR5
	b0I1bHTgNjUqpwVLGbSVyQBmfV5TihMAPFePNIVNA6++J487U3d4cREEHT0Izc1aDv3Lm2k/byr/G
	xYiMAzxU2F6OmnJYeRQUCMs8iQE/sebx6kKd/KT+l2Z8KzzcrHLpLLeHq+fRot5yAVOBSjioSYlFZ
	aMN4OBD5KITgtvG+LKg7DMn0uqFhLOOShelKxeREb8jJO81eV8/ohQObCV+TkKD6AJr19hMBhxRsr
	5f2XV7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4w1M-00000000sOk-2RV3;
	Tue, 24 Mar 2026 07:17:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4w1K-00000000sON-1xXZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:17:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3wuku3170733
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 07:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQM7eHnVoeAhrAn7FxIm1PZgvchjSYSQc/shb75BI+E=; b=k/TLGKZa2XF0AXaU
	NXP2vVc6qfoyi+dwPVjMyYhtVH4X4uX8L2v7EW79vb8PBZE/QN+VQJGjwTIY5Qsp
	V8LoPPvnQEoSa33Z/5PJdYCeKBWlwg/wwc9t9myLn+EUElvd8O0/KWjydVzvvApO
	sNCPP0KW7nnmsMpOamTdJQMHCTx01dUlbwe4Q2HFRvT/uPSNciQ49GSX+1Sqgd7A
	+qR7yZOj6CpgCQ4P1ryXP+gxEm1R07BRbDFOVoTs3WZFs+h0bKaA6BlsBpXY/XD3
	BVgwPJZ9TdRE/GIxSUB0qWF8VBXkWSsQHkRUD4pMYDF8OJWMVMA3YwE10Yr+k8tT
	OSMJeA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r23hxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 07:17:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b056b2f0cfso13221325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 00:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774336664; x=1774941464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQM7eHnVoeAhrAn7FxIm1PZgvchjSYSQc/shb75BI+E=;
        b=f9XcR/evCmTuhv0Q6j7YOYaaMGCofFPv6oOp+tF7RyzAR71ez3hDR6v5hIKdvWvLqk
         3FPxOxscpiwCufMnkjUDORLdBqzuU8Pqw95xXIZdhlCcEe++/S7NYLYnCbTVz6b/1csX
         SJoVUZcnW1bDd/PYqej8DEVA4/CjYgjM3HDDqCLodJWxHwekHJT5vlDKfz82hwLo9WsA
         sORhzA5c/MvwmZqTY8CrUMWx+9rvPodHfuiJwXgu9MiD+mgV4aRdVDZmejuK/CBGKTAc
         NBvsiinmo8XCdLQT87Us3A1po7NW3bj6CjAADMhx8hlujT5Wl7jMovJYNJgkVmpZ1wlb
         1RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774336664; x=1774941464;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQM7eHnVoeAhrAn7FxIm1PZgvchjSYSQc/shb75BI+E=;
        b=NrWtdqvlQW2CetFOZdBIzOWlC7gQBactSgv8JjsDueNcno9C2wbULPgGoUrF3qK8ad
         4FcnEBTcOlLUk/dAkJNnm+SAeDtTv4UzOfac3I7ncmty3LQNwiGyusWnS6fBCjTcpbOr
         X1qCntG5oK5n2H/mzgrE4UXaeINMYquwRjxzvxEW4rEw5Xyc7pVjSjwU0BZgSq8gE/dV
         ZT6yuR+YebIeB3BMheY+++gU7ZMLXBuvP9V4KNaxMk5QZnuhJc0ll/A+wkOmFeHKx3Qq
         oVH2dbN0/5TNYDbaUqL7cT45/60fd4tclJj4s7sJVEWKWtQBbVJUCl8p/KAwAjed+QHK
         50Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVd+5IAZ6tqt3bIZEr0PaSCB5Addqh8SsLuWSmobw2JbQ6hd/AjRDaiU5T0HNYEt/sRCVfpSOInhJ/3N1oYbsUE@lists.infradead.org
X-Gm-Message-State: AOJu0YxZkVzSuL6iTqliNegdtCIdAJ4ndHpxPuujnGbYX6KQNoEQhyfy
	FVSLK/JdGJqdAqaCk34zKHnim8XQII2g5NbYYZeUPc9Yqf4JYjJhfHuqqFiw4p3Ai+x5q+e8Pyx
	SLcvZPuH5DqE4agDuf4xgpN95M22HHW1pgpqDLy5iVsDCD8yvT6rK4Fd9Ia60ML++5POAcus1Y8
	gUTw==
X-Gm-Gg: ATEYQzxTtbmuobpl/+fWAT4rCEU2rPbpB5pdP7luZfMysmNWoBNqpPURNbbLWeOZgzQ
	7ELk2Zvhq7mRvLMLkPqkdU2L7nJDiFyw3VTeXwHcGgr7TEeGkuH7aZ4XJDndsnHh22/FrfI2RCr
	b3Bwt3cv+1CPYwKpZvRlR15xeap7bA6wuo1pHukwCAFy2tojNz1wHZwpho0BufH9YFCfYqphx0q
	jkQ8dvEsjQx843V0cnnNn9iqAmoBQthxvVKZfCuIVFcfcMfELHImkVXx4I7shLrvNVy+tFD1HfH
	GGJmb8KlbV6qCfVR/haAy/UZOknFKes6YtFugABZVTMXdDTu/wDjCkpbes+pITuvy9xDLM2Uy19
	lamqrU/VZGapYx8I9KAIQHfU=
X-Received: by 2002:a17:903:946:b0:2b0:531b:b3e6 with SMTP id d9443c01a7336-2b0826c382bmr151661865ad.10.1774336663911;
        Tue, 24 Mar 2026 00:17:43 -0700 (PDT)
X-Received: by 2002:a17:903:946:b0:2b0:531b:b3e6 with SMTP id d9443c01a7336-2b0826c382bmr151661745ad.10.1774336663426;
        Tue, 24 Mar 2026 00:17:43 -0700 (PDT)
Received: from [192.168.1.102] ([117.193.214.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0aa622677sm6868975ad.74.2026.03.24.00.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:17:43 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        peter.chen@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        cix-kernel-upstream@cixtech.com
In-Reply-To: <20260313114914.1564115-1-gary.yang@cixtech.com>
References: <20260313114914.1564115-1-gary.yang@cixtech.com>
Subject: Re: (subset) [PATCH v4 0/2] Add scmi powerdomain for sky1
Message-Id: <177433665904.17735.11886295556987492843.b4-ty@b4>
Date: Tue, 24 Mar 2026 12:47:39 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c23a99 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=13ILl30Z8QjaXWZz8Pan+w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=jNwzyYJvxPVIlz3NwY0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Opvi5DqLY1_9h4AQ2hdOameWdUl-FYDv
X-Proofpoint-ORIG-GUID: Opvi5DqLY1_9h4AQ2hdOameWdUl-FYDv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA1OCBTYWx0ZWRfX0ayuK3cyoTI5
 lSm7WonMBRepio1jpIW4rJI4QmRFNtC2o0CyD8eE/aQLDje7+Pda159A3/lVFO1CvOkq+llXZA1
 aqEIOQpDW8DaayQRVgDatydlzwiewM63qM7S86eGG/IqmSJ3PjD7xinHcHdQRBIWljvSnjS9J8a
 OR1HkVbFbffQQi+HGbYeTiTU87TFGGTHF9DsZpPHCQ8f43PDOMwoJOkdb3hlJgWRaiedxbmSa4W
 6EfCc1UKDLDAw5aacQWD1hd8663EbhhCysSJsWYfSVr29ObyWeB8fYI963X6qEb1RNpIC/04F7l
 ybe6t+pEN1F/V+NooeYRS9fK4mih+7+xTs+k+1/6meP/NmTKwQRWrXlTEIKZkA7LmfXB+k7EyNa
 InYulYDxP5X/bdIzcxux7bPvyXTHOg1dnRs5expWtCtBSQsPUUzB30TYZX6T2HQ5rGjfGXUtktp
 29jNECHMqrGSSgwSDQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_001746_643788_E0276305 
X-CRM114-Status: GOOD (  10.59  )
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


On Fri, 13 Mar 2026 19:49:12 +0800, Gary Yang wrote:
> v4 changes:
> - Pass dts build check with below commands:
> make O=$OUTKNL dt_binding_check
> make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pcie-host.yaml
> make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
> scripts/checkpatch.pl 000*.patch
> - delete power-domain-names property
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: PCI: cix,sky1-pcie-host: Add power-domains
      commit: 94c62cf0698c0edbf1f118dd80ea19d0ff5d834e

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


