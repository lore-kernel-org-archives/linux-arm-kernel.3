Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32FCCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uo/dTPnL3NKP/2wFJT7E7eWnhiOWnpWY1KrKMQaPEls=; b=o/THdr5cUfeYGH4sYzAjRFJo9K
	5uitF7HNwQeg6pIJU/ISZOhGqjTJkGAor/eaL6AROYez1MADQMXmvXJSyApGuwCbPbsLYjs2V73Al
	uxTKpPNTG+qUZHxb6GMpA/K/Ac9znEWhbmMcRGICo36IR0n+DOgv/9Xx4Hh2qgD2DmZSMATwqvOpi
	iR8IDnEi8dbPD4PwvlQYiwi7hKse212ubegfVZhPLmXWAiSBfvrMJsfFNtBckPc96dIOq1N492sLD
	88vHLHl8zb4yU8wrqFR9T52Pwz/4SRDtyfK0WkMBG4Osidwck5UMMbB6XLI5+oC0t3qW1pYUhYBsk
	6+sArUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgM3-00000002QXQ-1PmV;
	Thu, 28 Aug 2025 17:24:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbST-00000001SzP-0T3N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:10:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SBLU6m029879
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uo/dTPnL3NKP/2wFJT7E7eWnhiOWnpWY1KrKMQaPEls=; b=g7dE6MV3ggoTZjY4
	MsDh3VF0FWkOIk41LyGUXRSu48mwdp4XieP/6Siw/kdIratYOLs4EP56Pd9QjriY
	hNqGG6zsVmk49YVNe8S8Gyyk/DPKik3mLqCilEldvQzX4ZFDmvKPmFGS+7Jut0es
	QghJoUyG2G0zg8tI+plC0TeclshKizbqWeAcWFYEGgWm9pTSgStX4JMw638zAJeW
	fAsPMqwbc+sge+QG61sSjxTUvS3MKikqepI0qf0cUNF6ipIaH4HmJmPNk5+ZEKfp
	u3+0hr2aWANn1ibgo6b46diy7uKtYQ8ojEtMlvkITiid/lSDaN/pStlC3U1hQo1+
	vk4YcQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tp5k03sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-327706e0642so1596863a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383024; x=1756987824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uo/dTPnL3NKP/2wFJT7E7eWnhiOWnpWY1KrKMQaPEls=;
        b=OslWCfwDE8CDVfSmBloUz95HAxzgaEUTJ/5c6c+BmK6cjvd+eyM4ZAZ3rcXWC8qM6t
         VvWEhaJ/aCkg0+WmuwS4YHhDjdfuo5ffckNqmk9ZwkYcgcXQ5pWUF4PH1vNXcMicd81w
         t5LLiRyLQBuP066mF5RfysNT9rsed2Ae9zDNLj4uH2oyTYJJfCP26xTQ257eIT96AyP4
         Utv3AlLJnrczXXnzP0yrsGRJAXMjFLqwKou3ESZ+Nn/TcLM4YbdCCW5QKtYflhfcP6i4
         KDaDgOXak9jLJxp+YsgerIVfwNT4U9U3WnpT4fsgfsAGgM0K1ZyQRnASrp8TvSTQGZa5
         TlAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGWEK03Y1ydmIHqE1J7sTP6rU2cd1wx5fYkCmkAPste/93wsPzMNASjxpRjR/auLH4evODT1ZYqKP3DeQbUTOu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2x3cdALOdSaZNsE8UxX/TyeEu+VmqBIL5tKgQW4iJYvuTlhKP
	z60eSu9h6VsJ1rz6qgk341m8hWT/jF/umFt7h6kEccdTY5kHHlgwaHmBOL3c1VgHJ07jjKJ7U/7
	U8rNMqGwGqEP4BTQZmXxnWxiv+XXv81KKEMyiIXl/hAoT8iwz9q0MP+QxVzoMSA6dYoZxN+E08o
	CPOw==
X-Gm-Gg: ASbGnctMzjhcN6+eGllBaqbFyVjEtOc0UZBnXvw/Nx5N+i6XAyrAo2qbN4cm9QK2KyK
	u/UF5In8PMud/r6+83bUAFiaqbVmjcX2XyyHxOPsRCb0uIDQdoONQizZx56BLI0tS0xKPBuxwY1
	ErRt8ByT0I6KPHH3mCGL0iVnjlrgZtqXjly+hoSfRIdaxa/ZSsePeZ/8MuIujkKhz4dTO61P2kN
	ZrVOeasalIPRbkqTV+HvpR0WxAJWnGGwFhEL87o3569bHPyE9PWqgUbEm1twELwg45UB+hd/0WU
	AeCIJXE+pPAVd+bOkMWoO2R8oF7WF75cX41izn4DZCX+f3aI9zQF38w6EFPxT0ULuMlKNsIgDKw
	=
X-Received: by 2002:a17:90b:3901:b0:312:1d2d:18df with SMTP id 98e67ed59e1d1-32515ec131emr29194052a91.23.1756383023634;
        Thu, 28 Aug 2025 05:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNKDnXv3VfiyIL/dLNdbQShCWmdXMnoh1NjI//DlD9thMPONtr7h73EWWWnVXj35nDWc1eOQ==
X-Received: by 2002:a17:90b:3901:b0:312:1d2d:18df with SMTP id 98e67ed59e1d1-32515ec131emr29194004a91.23.1756383023137;
        Thu, 28 Aug 2025 05:10:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:22 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:39:00 +0530
Subject: [PATCH v6 3/9] PCI: Add new start_link() & stop_link function ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-3-985f90a7dd03@oss.qualcomm.com>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
In-Reply-To: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=1557;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ocglQCinQJSbwG+WjNdC7ufk+jP1Ksb5I3ifJFa2Wm0=;
 b=pxhYVvJXh/UXBUsVF5XTmsLGQfjmqo1e5DxSbdAs39s+USdn55QFDV0BESSrK0o6aVHORtqyK
 EE+SzMqwjJ0Dv2FXwVIXXRbESJ5BySph77mF+5fYo+BhF+I7pmcsk7Y
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=V9F90fni c=1 sm=1 tr=0 ts=68b04730 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA5NSBTYWx0ZWRfX6VlEZClvCjfr
 tzv+VsogE1YxXbuQAJr5msx5rU9akNstvkC5IZcKrMWa/uQoOrr4rWFG/EWg+FF/6tKGjLRs9Sr
 1TuqX+yZFKNEKejjCPXiN7bxf/l6KYRlCgz6/Vfw3tQIUGxKQxNci0EL89Az+wtpP5hUjKoBLDc
 C6TwNYF2Jh+guIsxH7tZYSxY/NX5e2WlIGrGe97bdiRzsqrXFhnJD0eGSpoDFqfITp5IxlkZ9wv
 rODZvkjPZTi2GX4oorwM2rZkbyCTiGvcE2DjEqKdpfjNXoKvHiNBtRYAS5ydeGR6MhAcyV+FzRk
 yhoqXSLFeTOhaKkpG6GcE+og1Z2D2Yf+QRPGU0yRlkBS9l2Aa9fq6ydDYoJaO3VA2DVBl77TKcj
 sY4qQcTn
X-Proofpoint-ORIG-GUID: l38BpSwZw_zwUAnxWTpwYxat1JDLZ_b4
X-Proofpoint-GUID: l38BpSwZw_zwUAnxWTpwYxat1JDLZ_b4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1011 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051025_158570_E3B38F85 
X-CRM114-Status: GOOD (  16.52  )
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

First controller driver probes, enables link training and scans the
bus. When the PCI bridge is found, its child DT nodes will be scanned
and pwrctrl devices will be created if needed. By the time pwrctrl
driver probe gets called link training is already enabled by controller
driver.

Certain devices like TC956x which uses PCI pwrctl framework needs to
configure the device before PCI link is up.

As the controller driver already enables link training as part of
its probe, the moment device is powered on, controller and device
participates in the link training and link can come up immediately
and may not have time to configure the device.

So we need to stop the link training by using stop_link() and enable
them back after device is configured by using start_link().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/linux/pci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 59876de13860dbe50ee6c207cd57e54f51a11079..848db224c49a630a33535d162b7049c37c50da5c 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -828,6 +828,8 @@ struct pci_ops {
 	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
 	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
 	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
+	int (*start_link)(struct pci_bus *bus);
+	void (*stop_link)(struct pci_bus *bus);
 };
 
 /*

-- 
2.34.1


