Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51692E88D66
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bO120ElN5GMnWdl/iLo9s25UFJEb0/bZvzF/MWV+gs=; b=O+4ohfX7J8lbXPz1mm6DG9Tol9
	mEa14p3qAulU4G4kp13WPnA0V5BbxxGWQlSmzA6sFzmEnyzQKtToXThQbJShvc1ns2MhLnEilpMxK
	lbj1sDmc89tL3tUHxRV2qiHD4w/1obK5koFZDCV186EUP1+bY5y+sCp7UukR6HCUxw4xZorMqwUoq
	i1469JaOwVVJQYJJvzuGF4Wkd364GewDrxugteQynCdD686KAXAQ7Aaqmp/kwJTBnhQqWD/AepPzc
	dEW0eDeA+bB7Xo+4uTDLJ9Ep4vFv53lqnrssDpExkYCAEKChjEg+htYYRwVOxO3C2YWQF+diUV7DY
	JvVTZcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yM3-00000003O19-17yM;
	Sat, 04 Apr 2026 10:35:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yM0-00000003O0o-19a3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 10:35:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343Yfm81871013
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Apr 2026 10:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1bO120ElN5GMnWdl/iLo9s25UFJEb0/bZvzF/MWV+gs=; b=Zwtf+2JIvBHyCEHt
	TOCl2X0UthuJLuf6IMMf3PRzMt4tFGc5sxt2xDq0clX9P0WkI89LsO4cSpawImjJ
	DtH0x/i3SR7npq8BOynIfD9dae6rHb31NrfmAIDoKrxdePIc/FlEDK5XWclpLiy8
	MzFamo6PfeaoM3DQH9Kkn8K4SEdf/E3WYRqnZVsDdd9yus0hB37s2i6i9hcoS/Fv
	MWZRyh0JYTrgmoyH/5H+z9d6jhwCPjWs/DgoNqxm+Ev9HR3NuDpm5J/oNYQ79U88
	xpRGQOx7ZCSbVQxhLm+MvZtHrmbHARVaQ3Gg0jJZAK8DAON99V3YROyQlz4ubtF3
	8pHOSg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv18mxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 10:35:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d92f8408cso2832543a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775298946; x=1775903746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bO120ElN5GMnWdl/iLo9s25UFJEb0/bZvzF/MWV+gs=;
        b=Ibh+eIShxa1NqcT+I6IsuGamJjYonby/GQZwAC/tBGHYDJ7fgI9lcYS9T437pCvswA
         mzyDpwyfbgxWyPsDr4UqIScDpEFETfI7Hk3F2UrzBLTI0Ukz7eAVAUkcXjp99dMYYTsB
         WM+iXCvqMUWRwTV8TsnSHK4jBlnJYcAhUd7C2gzpJqWpxl5/ZMYIsa3ztZKF/Kf+jsTZ
         1Wa56b/xBIdgi7yIxK2OrVYO5Qb19H+hlioIlm2JDuP+S9/jOzAuoLprx9obHm5vGn5E
         ZzAu8xUtGgVkLKFiwmQIOanTPGrQnAGFiWnbxD4PjCFE/Xoj/3F/7C08pZuKe0QZ+ucv
         3Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775298946; x=1775903746;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1bO120ElN5GMnWdl/iLo9s25UFJEb0/bZvzF/MWV+gs=;
        b=AnmQ0YaxvCMylVq48Dbe6wRsux90M2qAwl9i79Ep79qf9IFMi2fv4oez4/FHluENTz
         HQa4hGks1ni0D7uWMYxd/YM70Jbo8lYqgsa5b2Nyc+/0xu5lbqsVJG77zLp4NzVlCgnz
         2wRjzyrhc3xuPsGrMTRsczBr0Zc3s9ymaaq3OTforB9+ZcxAtc0mxbmxp56HOsM/1jBo
         kkMldEtwF2LXb2ra/KpBzm6dY3M1OaqM+szgmK/7/aO/yUetgXiPZpDJokb/hiQnVL8h
         4HvZjU4LK4TWranlQAvLCK8x/70qGwJjdk7u59n/IiKO1X7qMAdAL+8PqnKaPGAawPKR
         OM3g==
X-Forwarded-Encrypted: i=1; AJvYcCXnowaN8awqQToucADr9qGq+STILahsZxKQ2AdSn1fLgd4qjXp8XbJubsPT6UyoTzRXDMytq0heMWUFL3BaDR38@lists.infradead.org
X-Gm-Message-State: AOJu0YwUwZZlLJWPXvhql+1EP/AbeLRiqJ7DqUcTnFQof+hGf2/3765x
	+k2VkMh6Dcz4KZsBkjvUVF1X20E5SqO6kUgRBpyN7WrnjwZerNOlWfNu+CUL9sX9eAECcEAqCZ0
	2poB6ON0SdtpSoMY4doFWBD3GePX8p4nMPizb8fAJgK8cAJR+xFKdY3gIFv6VAnjS/Z1dvI3lAt
	zQsA==
X-Gm-Gg: AeBDievCBvx+I7zaCXFZs1xINcJP6zPoxZ/favZL7Kve7XGZGjR/4Rw0oGfyuFXeTVQ
	kPgm2cfGk3I/pzcmBJeuu4k2JZuvHAly+SJgsNkdWmS5qv838crPDbxKxdS/7YTInluE28cSAfG
	wkAAPGFJm0mpr3U7VbGBEFw2NvbZlwoWZC8o4ldJeuknhgCOCLfMDT8St/FFyVVN59xI1dV531g
	JKHSwQm8rzNoAq1fldPQAy29V4zjL8tU+4WUEKdP4DP6QYzGdBR4fWxTXafO8e5HW6/LkLW5jB2
	Ij4hYXFSCjk6Uixb6UpJh7gsUQB+Jawumwb7IaBkLdz1rAHB83/BoJDusOmDrTtnfxuxF1QX9NT
	FuDqapcUyAGRDilA=
X-Received: by 2002:a17:90a:d2c7:b0:35c:cba:344f with SMTP id 98e67ed59e1d1-35de68414eemr5858990a91.13.1775298945794;
        Sat, 04 Apr 2026 03:35:45 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:35c:cba:344f with SMTP id 98e67ed59e1d1-35de68414eemr5858970a91.13.1775298945252;
        Sat, 04 Apr 2026 03:35:45 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:d6bf:182:1f3d:df20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de680b5c4sm2154469a91.5.2026.04.04.03.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 03:35:44 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Felix Gu <ustc.gu@gmail.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324-aspeed-v1-1-354181624c00@gmail.com>
References: <20260324-aspeed-v1-1-354181624c00@gmail.com>
Subject: Re: [PATCH] PCI: aspeed: Fix IRQ domain leak on platform_get_irq()
 failure
Message-Id: <177529894081.11406.7307362893690177391.b4-ty@b4>
Date: Sat, 04 Apr 2026 16:05:40 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: wRsVgB7hl0rpy_A_s0yhaZWw9sKPEdP5
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d0e982 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=xCZdhqmVAa86G4UcJK0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: wRsVgB7hl0rpy_A_s0yhaZWw9sKPEdP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA5NiBTYWx0ZWRfX2rObC3gfIIYe
 ALoZY68ua5Icsv4TbvEp/0dw1J3xxO2fB23A/aWEsprQAbS+uf9avf8S67Odjo0JES+Cop9wFVO
 ZI/3wqkxy+9fruGwISvbI4FqiUjmB8qR2ImKsC6bS1f7dkHXfMxZY7uf4UzOMNMGyYPBOaFCqZB
 7Q/dKjEI22S12nbhFiAZ8lpxx9rRtQpCeSVqkCJjjW2ObeevFzXb1o+OIqx8BZ7KyVChx9k4Vj4
 cgblKTSje+DHE5pcGyHkCrwRzjdckcMtTBT8UW93GanW+HdDOvOGlsvyghS0yJ/2SO4LOaXItaY
 CrIxmgHAjS7/BUkDPTGKQL6sQMjBoroSrXHqf2zGDnHASs5j5sreEMrxa+yxupDXQtDioO0KgoZ
 pn7vaQqh979+U9N9z27R3w0Hr/H6s7fp4dYMgLwKYKa++JOaZ+3L6g/kTP6cilk5Z6CM4XH8kcv
 Sy2INDkkH1IXK7g8ENA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_033548_346060_C101C8C2 
X-CRM114-Status: GOOD (  10.56  )
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


On Tue, 24 Mar 2026 01:57:59 +0800, Felix Gu wrote:
> The aspeed_pcie_probe() function calls aspeed_pcie_init_irq_domain()
> which allocates pcie->intx_domain and initializes MSI. However, if
> platform_get_irq() fails afterwards, the cleanup action was not yet
> registered via devm_add_action_or_reset(), causing the IRQ domain
> resources to leak.
> 
> Fix this by registering the devm cleanup action immediately after
> aspeed_pcie_init_irq_domain() succeeds, before calling
> platform_get_irq(). This ensures proper cleanup on any subsequent
> failure.
> 
> [...]

Applied, thanks!

[1/1] PCI: aspeed: Fix IRQ domain leak on platform_get_irq() failure
      commit: c54d5f5b33990f2649c20f35407f340bcadb8a53

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


