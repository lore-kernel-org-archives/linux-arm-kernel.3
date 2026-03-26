Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75A310A88E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g84aE0YMGYbvHRps1aTbmfM8XvrjQiSe0TEOY9hRXHs=; b=1phlbl7333ulCiCbwoKoDBjktA
	qRDKUCQy3By18Okgy+K3L9Gf0IWXUP6P5roaw8hNN+TRttMXUK/i/jJ0nF+paq1hLNSqcVF5xmT7k
	0/sYr9rB9NjoaKoobx2OZpaVxxgOVbt1LsfR3+DOE4vChNEm1VHmRB+JlYWpvx8nKLaaiHUwMfFMR
	4RGPuEV5MNR63uMElYu7utQSEirJWtMGpbwxmdIzt+YD1610C1sUC/pwKQwy2h+vfHVjeQ40W3c40
	kx9GA8NBEnsM1AD434NGNn6J4v0fPI2JSP/H7X5VTFI3cmGLU9T8AXfBdVysZDvtCyFR3jdMFK4hF
	iNt1+rcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oHD-00000005vFT-1Jx7;
	Thu, 26 Mar 2026 17:13:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oHB-00000005vF8-07E7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 17:13:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9xs4790669
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 17:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g84aE0YMGYbvHRps1aTbmfM8XvrjQiSe0TEOY9hRXHs=; b=io7EaE35XqZcbdqP
	PotM+4RUaphRC50ljzIhBMMybKI6p1y82Jh2f0hHFrN1yOLB1VDg9zn0rCdMbFEm
	pFVf50bBCrwMPTqWFrIU1nfR9RVc6YZSwLPpScPxsLoz1ZonypEoIxgIzFRvDT7X
	3MyR19X6nNt6MnzzwmeQRsJYV0FTTjkq2qNe7fFsu7Ype/hOrK08A+0C0OaGaU1S
	gEijcyh+qRbUZq7GtAKYexY7QMMx9h4bG/TGPnwnw53aACA+4/FgthOYPxLGCE0H
	froEfd6C5zyDOPiNHz3tgpK1o7h+ENGn5aJG7pjbQApKvg5o2L69DyltE3D9vqR3
	ziDCsQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqha6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 17:13:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0c96f5d9aso3157835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 10:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774545223; x=1775150023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g84aE0YMGYbvHRps1aTbmfM8XvrjQiSe0TEOY9hRXHs=;
        b=HXGelyMm0SKOdj9RA7wZvX6Key9NBrR+kzoasMinizYXeUXyWkryY7p/ViHAU6OKZL
         K2Cd/gUScHegm4qjt/rWmaGIB5gd6IGu57esfCwP+FOUMwsuMk/465Wc6RrzadJSH6Kv
         w4KDUuNGij9vRnpF46p8voOjZbOf9lx23TBg25FA46KQ+ziQKWeMUjaJ6NGNhBVRJGyD
         Zursefc1HCzhWr3EYMI1EQjCOUcv/bGYTe2AEXVwLL3O5fkgefwFPewfIPS/Grjnqflv
         hAc6TiCGIS+t7LOQAfHNtHk/217s8e2IOKrBClcq8U/92K2r8yU/F6Lyj+peMgIBB53j
         Cpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545223; x=1775150023;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g84aE0YMGYbvHRps1aTbmfM8XvrjQiSe0TEOY9hRXHs=;
        b=BMBTYF4+3c1ujX/dKjZT6bLnnI2pJVkL/9LFBCte0vvmw2Jhttx8Sw72Th88W/aLUv
         ZHZf0JFHgsMpY6wodIFhwuNYvtTt+esjkUKydiVnsUiO3k3ohOxbCla9s3WwhzgYNnU9
         e0mm8x9L5sxuXaHM09nE5l8nzdzscVjT+4ol1leyqT2JnXf6e1Q3l0se4VZZdNu3mA5d
         mTPkzJ1SV9TzB54qCIzhzVAHtbHcL4T/lOcNescJR4r4jeqFA1JG5A8FjG7DLwC8/y0v
         ws2QqFEeOToV5PAywrmtIF9SvTiH/ZqFOyISdGMHiUX8VL4vi3NuAZio1YyrcLuvXYzb
         kquQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT2nZaj9ApWoL3F11e5cyRLyDciSrmzWG6mDyLMUbb3alR7suD3brbB+ysyM1HlEco+75IQHYSKwmlnaNM9lAJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl81zoC08y7yFaot5HBIjwZqXebkq/tsvx7GhUsqAKf5FWOfp2
	ZyxtBicQEwOFOX87Qz2w/5I7HcQ9uYg+hi+J615YLWlFDTuS+QyLSlgQUmBOfOoCOizMMnz6ISx
	ECY8iD7UpkNVn0YaT9BOUk4dmCTTEE7GiLRdTe3DldJg416SUKRigYlfYXgMdY4Aq0qIBnLDA/8
	7ttJqlfVvF1Q==
X-Gm-Gg: ATEYQzwTphz86uWsoNnCNPM3mAwwf0Sarir1qLieng7tdRiqe1kBIRkRU/2vU3tDGqZ
	/z5/mBfMeRr4O25/KeWzSGf+6K9LjtPdY/4tTM3lyFxVwrfSf0sLB/7BZCncquG+W91epJSOwBu
	99Rg/2htOVHlW6csm5mKhXpwUqpHLflpcrugDdw1bd69Hb+4kPhjRxBoJofEN03m2zBrx7IfsRu
	YT4fmxDVHXEWaSrUBEyWJyC7JFu7TX8JIHrcMYAH2A3mS5ICgOakyZDuurKvq4QPz2Az2TgPbwn
	6AzyPidZtOaalbgHjWQEsYr0IQaOHdWFEIQ8HCzsT+rMsxX8imUxYhyxGHAoJA1BSVYl24xxqm7
	0Ao8ZmEJNLZEd330bP3p0BW8=
X-Received: by 2002:a17:902:d549:b0:2b0:c3c9:cf15 with SMTP id d9443c01a7336-2b0c3c9d4c2mr27646145ad.15.1774545223301;
        Thu, 26 Mar 2026 10:13:43 -0700 (PDT)
X-Received: by 2002:a17:902:d549:b0:2b0:c3c9:cf15 with SMTP id d9443c01a7336-2b0c3c9d4c2mr27645785ad.15.1774545222738;
        Thu, 26 Mar 2026 10:13:42 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc881e9csm38301735ad.42.2026.03.26.10.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:13:41 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com,
        bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        Sherry Sun <sherry.sun@nxp.com>
Cc: imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260306030456.1032815-1-sherry.sun@nxp.com>
References: <20260306030456.1032815-1-sherry.sun@nxp.com>
Subject: Re: [PATCH] PCI: imx6: Separate PERST# assertion from core reset
 functions
Message-Id: <177454521726.456360.10206150589096386820.b4-ty@b4>
Date: Thu, 26 Mar 2026 22:43:37 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyMiBTYWx0ZWRfX+cFey99csBxl
 mSWJJEPB8mljl/8K6XctXnBU8H3Pe84Z61L1gBzp9dK/lGJkw5v/jiVVWsaSwIBdRRiBp4BlI5o
 rOMG9TFwvaorWHVUjfXAJQIhYeUUuaGv43ugkA12jsgXKDeWgNUmHzqcdGEO3IuvCgYxBsjd2ky
 13jdpTihVIsRwqnOAndvGU7MeU0Vra1Sk2MTV12LmIQsifVMkdWcJeUAuJy/vbhKSH8nvMQXURi
 dkKnLWO5ezQ/9HCqsvEgE1l9vOntbISOprtQFJbujfEQHwMV3lhIH8BNIoluDzfhSObQLOWi9sE
 Cxw4yAdXhc06dOZnCUSl4wneUecFmYP5ua+TPGSqSH7J4Fg9QVk3k3xWCN0hwpnHQSFlSNLm+5d
 UTn/TBixaRi0I5sGGr9D7RpxcsKY2xd6Lz6owdmZuIiF68OFrmMrwNBHetBgOoHDbWcgtGFxp52
 SE/1ZUECK1ZjG4u+LSQ==
X-Proofpoint-GUID: hwrDQOSc3g5nOTGZhiFoZwU4iplGlF1K
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c56948 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=mEf8EMz-nW-Ju7kaI7MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hwrDQOSc3g5nOTGZhiFoZwU4iplGlF1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_101345_073372_6C34A7CD 
X-CRM114-Status: GOOD (  11.89  )
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


On Fri, 06 Mar 2026 11:04:56 +0800, Sherry Sun wrote:
> The imx_pcie_assert_core_reset() and imx_pcie_deassert_core_reset()
> functions are primarily intended to reset the RC controller itself, not
> the remote PCIe endpoint devices. However, the PERST# GPIO control was
> previously embedded within these functions, which conflates two distinct
> reset operations.
> 
> Move the PERST# GPIO handling into a dedicated function
> imx_pcie_assert_perst(). This makes the code more maintainable and
> prepares for parsing the reset-gpios property according to the new
> Root Port DT binding in subsequent patches.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Separate PERST# assertion from core reset functions
      commit: 180ea823bb45eb71dd5ed0dc0b78633accd21096

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


