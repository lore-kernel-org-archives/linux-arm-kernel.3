Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1A8CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgDEHTIbutVCIfjWEkDZtgrQs+c3+lk079qYfyA3JzY=; b=j3Q2H5FG9czXu+jHw6WLK/VbWR
	oLh+fWtExI/autO77q/JqTgqAoii+rSR4tJuuzZWyeOGD2IiZpzNmlAqRGPqaYDQMPp9cRRCSa38F
	Q7otuZ59jyDuSdtdo2wxpu9iKkIcumNpZOT2Qf8m0C61pVn6y64rCbZl05DbNfXli4fn3DfI4Xso0
	VhHXuObPL6HYr60yvnr9vgCpUg0WsMy3iiT6m7uVZkwNp2tyeoMlbPNOyBqoCW62fb02Esduoula5
	ylQAiSN5I+msQhpLfFYRfN04zoXsOVaXQQgscvIYxyoij79Mi6+EJypSOpLvjrjcb7a7z/T6FuneF
	Ynt0pgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4OC-00000000zcg-3svb;
	Wed, 29 Oct 2025 11:30:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4OB-00000000zbe-2Mmo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:30:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T8Tinr4135571
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgDEHTIbutVCIfjWEkDZtgrQs+c3+lk079qYfyA3JzY=; b=QZljZNyUqyObmm+B
	Qo6Fma1Hu1xbCpKQZ0eVPDgipFqom3gbmpHTpBw/zPpkmQoH301GgSlA8tnNmDM6
	/JQmMCAaHkfr/Kgwh15zqzPrj7a8R8hTU9J+xzjH4oOV0wr8/1MFntHOd+wBayjI
	j0Z5kTgnIQR8qeJMsM3n6UvfBL+Pq4RmWDUuheuKU9W4hSL4+HeLNSf2ivvTTm0M
	O8Lnqkyaxf3MhH6KIyQ6+JgeFkKmEGho2hEr536ttLUQSrskLUhfU2/+PRS4XTnk
	GykaEKE+qfuA54bvidcRYIDsK6bul8bCyXQbSroANjKefF7Dfk1z+hcV70eoJhlI
	bV4pPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9rh99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290b13e3ac0so64368085ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737450; x=1762342250; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgDEHTIbutVCIfjWEkDZtgrQs+c3+lk079qYfyA3JzY=;
        b=j3NOI7OhkMC0bR4616ePXnHGlbNg9PcvcBF5A/aNBj/ZaXqp2v6sTK1XJ1kGBpzyXu
         lU9Sj1lKvKLG3P+CsZEpi+fDlKnO4W6RMsbeFiG2w/h+KdDfw6Qwh5TA97Z1aEJsY85S
         f6oBcbO5pjUCPzr/yI0v2O4oFkiTN2xeQkVoBPzok3olStnr2P8pc9dQUrgKjAZKBHAK
         MOEnDL3OWvGSk+/ZHE08/rhuKvvWpq1OtSkwuRk3KWBuUKErFPle4FwVcOTaExUbxdrb
         J2YeN17ST1vIYUvHmOkFzW8NWuh5OFIEvCh3GmHRwyHptcSHq8jFihPmPtQYeTm4sCHb
         dnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737450; x=1762342250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgDEHTIbutVCIfjWEkDZtgrQs+c3+lk079qYfyA3JzY=;
        b=i5xtzwQLyPAKc//Z37j2WJnNQCSXY5fAzqdENRNvH6C7lY9r4dASVJWyLbf+Kwct52
         v+XPpnAnqcaP3gEejdtaZrmH5/U7TV2GsArOKFOm6tIXb3RMhNmPyrIGst035hYMWkcO
         R5q4AJ/Xd9KVvrtiXw/+WHVI1jnRbUkomtEiMQly5jZqsQ7iahcSvMoonHgHUgUJw1PK
         7xWphqPCSSfs6+m63RUS6x88b2bY8LQYg0crmBLYynHNwUxIHzPT2mKgVajF7/cmywRa
         sOWtQEQJoA6E0HjJpVDFG6adeLA6BeurgE48btVLaM2/MDA3hMrF6jesG2zRssKdXfdQ
         oE/A==
X-Forwarded-Encrypted: i=1; AJvYcCX34f44O3rmuWpCjTqMnkNrPekFtJuWx2n/yLTX04yp6Ip58WrRBL0W+Uynd3P/1cl7bKd0p64/v1RDiXcUTi1P@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4tPyu4VxZ0QEhnoQFOFz7o0n/kNcFaKSrCdcYOGDhnPMUNgp9
	P/E8tkrFK4yvHnG5SLcxcKdKNj1blCIZZV0OuQjLWxCFBSDvucOXKxqMH6b4PIhraj63GpopWA1
	Hd+MP879CY2izKiuXmbKN/AS4dZt3j5VG6XGUvOHE8CLBowBNLIJ4twPkTXsTwOt3WkI4R7rNBh
	Jnrw==
X-Gm-Gg: ASbGnct+rufPdEflenMpkk6CgHbSHu90YlgfJC1gUcAjEGqY8DV5P9dPJl4Xnyqpwfl
	04PfGdjjrnX30Wc15/GGh41pcU4iCtpnIzd/4uOb3+zI9TFNLGy15pUk5O3E33zv7oVy1tumbTl
	cuegWLduAzxbUVYepj3Ym9jSKrhFt2Qa19XmMon6ZqeR7r8QQi1QTAhu7vrQ/5iJeBmT6Nb4Lxi
	haQZJDv4FaWi293ivok+9hLZ4uK9Uf2wlf1aZ4aV/1OzogG8sttOyfNGF8uL4FxQ/f7Iplc8nPT
	eDk9P7V91ZKiVumnStx+M1LioAxY2GdAiYDgC9TNY7sLL+vcS6uzP5IbnirhKDM1T5ayhYqG9Br
	aYT9zTvTtICYfT1kHiuiwn13RaYIj6Z1yeA==
X-Received: by 2002:a17:903:1209:b0:28e:681c:a7ed with SMTP id d9443c01a7336-294deec8d5emr30915605ad.36.1761737450397;
        Wed, 29 Oct 2025 04:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyBGfitnJb5d72matMvOP9OSygmcBCg8ayvZYCaCiH/ZIAXmdr6Ioo8zux7z78Nl4JrVJz4g==
X-Received: by 2002:a17:903:1209:b0:28e:681c:a7ed with SMTP id d9443c01a7336-294deec8d5emr30915215ad.36.1761737449747;
        Wed, 29 Oct 2025 04:30:49 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:49 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 17:00:00 +0530
Subject: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=898;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Qp8Mmp7bx4J2E1JhmAOqVGzqZtEIMBaTUoGYrEMgWiU=;
 b=oS/tFzkDw9Orhio33EJ56o8TloT8Jc3fUOBu1nVbqbG1oVR33d72oI95HFn7cfImCLcd3tDqi
 X/CyxlbjwjxAYLVNF55aHWSDFgcqTQF0hz6Ru3wb+KN2ZiETXSXA/II
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: s6ofGvBStVaPnkGFmTeJkOosQ1A_8QDP
X-Proofpoint-GUID: s6ofGvBStVaPnkGFmTeJkOosQ1A_8QDP
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=6901faeb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5PcvmwL3LSb495PBagkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfXyFumki/Zu1W8
 N9I663ETr9TmYB7dt1CvNlYrkPh52UryKGuEPDcrIzPXuYC6nUHpullQMxAgBFikVKJfsDNPtFE
 qKA7dR/egNkNgZRVZv704412glNNFhbaJu6p+2RhawYawUucdw4vRk7f4vJeIDJfhHCNgt3O3bh
 R7LdDsrV0XotTrNxGzFuAvlkZ6Xq0m5PR2gTWmoFVNKhMTQER/XOt60L9YvQtqJ5aW0hqQZf2/9
 xTPAQyUm6jtnSJKRqFNcfbxbCBvYOfhpLW33r4GEJFnt3ZsD17JY6wpthF9x6pzs8+tEUb5Z9NO
 K+quupRjeqA82/i+RT6LI6eNZC0c6xFRqSkjI8CNOKdgwZnG55I6YOO1vc2DzJFdjxzf/4ruKWU
 W2xC0ObPouLiqZ8lGDtXny/MKILd+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_043051_621781_00352F0B 
X-CRM114-Status: GOOD (  12.18  )
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

Enable TC9563 PCIe switch pwrctl driver by default. This is needed
to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
Without this the switch will not powered up and we can't use the
endpoints connected to the switch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..fe5c9951c437a67ac76bf939a9e436eafa3820bf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -249,6 +249,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_TC9563=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


