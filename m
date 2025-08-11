Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABE1C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8htCJxgK9LamUpOqKUewYZZ+4H90QWTRJft0U76ZI4=; b=vZtClIlpUxT3zKBOhyXm96bTez
	k0U9idmcbXJAJ+MyqmlFuFQYX1PLuWu6OQ5gtNyFa+/2Cezw9ssMJoDvbQyETqOOX7YhDWUJ6Dv00
	J+QwALYMgEayfQQbT7DqHtyLveRtwfZef6M4h8tK0o2gyiIpKSZPIy7rK3hBnzWOvxbXdgDgBnQMI
	b9Z+fgwIzc73i7QnXjEBHPiJeaE40H2+R7Efrn06UMVO9mC+qY7wLXBgs2JpxuVcQudOthvPzChju
	tMZKZot5nW4tV1msFiyTFtYBHrfjspUtBb2yx0SQjGvbpAVcKg9TXKBb+iEhGeZTTSR5Y8OstblYk
	dm7YNFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQ8X-00000007PR6-2IAL;
	Mon, 11 Aug 2025 10:52:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQ2p-00000007Nvp-2LvP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:46:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dBim025530
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 10:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8htCJxgK9LamUpOqKUewYZZ+4H90QWTRJft0U76ZI4=; b=UCTMxnrd6/16AUhy
	XLcrUIybjNmdTrEQtLxEjTdW4kVnAemCiLZq1Mb4vvfvnAmsCNlcAJQG3gQSUDMs
	IOSmdOxRgDiuVv7zveTixoNo/0Qaz5OKOCf5D6/jESnWnMLkbMBJP/eupYp7dpzJ
	/TtzQn2IELXKMB3PbjaKubG6Ii02IgISs8x/crwXGbZ87WBvK9EUkMlqMBFV1o4L
	zV05exbfyrflL0Cs9+jwTuCnT4czWbvzB40Kvu/l/EWqR1yw6kV5pSSUu2bDq0Uh
	8aSFkWOFNUA+63BXErWgWMMawYjQ9uVeN7u1LlZwIcx+TDfyQkNSF8TzMvTeut4j
	fdpHfg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwb743hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 10:46:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76bfc40bdceso2833301b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909181; x=1755513981;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8htCJxgK9LamUpOqKUewYZZ+4H90QWTRJft0U76ZI4=;
        b=vHnI3zGfBQ5CkfBGHRC4Zqu4RT/8beyP7/wlxjL6zfUaJgEHICfLgFoC7ZM9oM/cLC
         P9UeCuiahosyTpYrTB0AIhBI6tmve2ugMnvI2BKxTRW86nCbt+AHQIMKUmsYapFKGBAa
         SnABMW3qY5EV+fPFDMqVF51f2704/DYdblOOa/BUjuq7m5wlzflh81ry5rA6K7mSG7ZG
         gJnMNTAye9xKu2MSbAwc4uHxf0wBEJygrbVQM+Ms2hkfB3hkZgxqjEJnMhSAN0LwEEVA
         mLFjvkHjtRRmjH1UXX+9/hP8vdKmEDKo2wYNyqXtOSAGPlOCDwgVa4UQiG5keLuFYO8h
         6T6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxi5BAZBsJzznslPVz83+alMjW4HYOtlrQVTAqbCG646Q1BUMA29tDT0BZP10sRp8KkoNiYXkkOeJgLmF7tEnD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo2J33zgEuLOvIQY/FRNO0MbwA3qjw9BAw5Zbe9Qnjh0qfSMv0
	cKdKFuxFdD1dddXTQu7dzL0UMHjq5i8Y37tFU/6b8kEhDHQ/If7O/JJtTQQygUAGKOQROhxzj60
	7BD5CpFNTeFf9W63FVfMkwGKK5e/fot2Ivm6hhvKQbLMx5I05/9bCGTe9jtyljFhwVcxl5LmNaf
	x1GA==
X-Gm-Gg: ASbGnct5/d3fo7QyF+avPQk+w2/WYWbfLSNinaGpCPyc+XU/KzRnHrr2fQDN7wyqun1
	qin1um/KAIRIxqmcc2FLhUS+NrHnqsftqUmPN8SMIfEhZysyDe6X68BY+0gq+Ydfxo1A7t8EX+P
	SVEuNuG3MFFh05JCXXQs1BFkDisXxByTmolJ/fRyAFehcIIgWo8ABnEiDEd/9sNE8Sec9xtgVVq
	PbLFT+cUZ4Thvk0zTq1Om0jRrpBSZsWplbM32pk+c4qIducoHOSTWb75TRsAixjXXc+MbnRXL1D
	he0btzN43IEsw4kbU4pCJ9WtHQgrRUusmBhb0Cxp
X-Received: by 2002:a05:6a00:b54:b0:746:27fc:fea9 with SMTP id d2e1a72fcca58-76c46199f56mr16736312b3a.11.1754909180964;
        Mon, 11 Aug 2025 03:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpgDICoR0/7ZRQgRFsc5NvAq3BwKQx1UQi1crXpDDjlFgdgbPP/mebGYu7Qi81XEuYnSVitw==
X-Received: by 2002:a05:6a00:b54:b0:746:27fc:fea9 with SMTP id d2e1a72fcca58-76c46199f56mr16736282b3a.11.1754909180581;
        Mon, 11 Aug 2025 03:46:20 -0700 (PDT)
Received: from [192.168.68.106] ([36.255.17.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8960dsm26421523b3a.34.2025.08.11.03.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:46:20 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250801200728.3252036-2-robh@kernel.org>
References: <20250801200728.3252036-2-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: Add missing "#address-cells" to
 interrupt controllers
Message-Id: <175490917553.10504.5537940155167451079.b4-ty@kernel.org>
Date: Mon, 11 Aug 2025 16:16:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=K6oiHzWI c=1 sm=1 tr=0 ts=6899c9fe cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=tivzXH558BYE5qsfyb1zSA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=PmVlpWcjQJIy8_mLsCIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: cOdtq-sdENn4shylVOpfp1LTciOum4mM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxMyBTYWx0ZWRfX1B3UGgu6jpbl
 8nnOaee1DugnDiYp5X0lC9wvJEJRhQlM8B89UkAIFJVE5HUY2YQTAf6tMqcDEh3DFDNgS+E+b8b
 N5Qx6v8p7PVAoB8U0i4wjDveRAn9LAVzkwwMZlLMGW50rBDYK9b2LaKqhGe0DaID6p0pZIh8YHi
 YtDfITE8yXbnLH4FLhDZwkEU7d4hh/eIf4S65k169Mpc10cMBMpMW5G5f1rvR8IiwZUxa3jXga1
 hhDZQ3+ffGgBejmivdWGDJnKZGtR5/+rf4ih0y5e7jL92MgZ1+Dqwvx2psfm+wqzjeEUswMjTH1
 SFtmn0C1BcM+g8RD25qIX4KfTB2dBLZFTsbrvfHIpr1Rdk+34OrgDP3DLWvPsBLicgAXA0Hc5dM
 oY4a1SJ2
X-Proofpoint-ORIG-GUID: cOdtq-sdENn4shylVOpfp1LTciOum4mM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_034623_731860_FE92E204 
X-CRM114-Status: GOOD (  10.89  )
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


On Fri, 01 Aug 2025 15:07:27 -0500, Rob Herring (Arm) wrote:
> An interrupt-controller node which is the parent provider for
> "interrupt-map" needs an "#address-cells" property. This fixes
> "interrupt_map" warnings in new dtc.
> 
> 

Applied, thanks!

[1/1] dt-bindings: PCI: Add missing "#address-cells" to interrupt controllers
      commit: ddb81c5c911227f0c2ef4cc94a106ebfb3cb2d56

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


