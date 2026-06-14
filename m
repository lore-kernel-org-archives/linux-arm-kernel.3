Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFEFCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 21:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bur06zKcsSYkJsUBV4uhT7g5E5SB6XYFrjgclNHkfuY=; b=w9SoCgEXeR2c4f
	y8rChlnSc6w9ggrpzbp78i6Z1zvBUk5bHNzOAAR/xS4QD/K1jNCOWUZfAnKyTcwhow+m/lmPW9tPj
	XT3bYfDvt5anKlZzyJLtDmVWu+iQkEbM9IPGVZG4mxRsGlMXSjC6LjVSxHYxP+yFqc8GrNP9gAOpo
	O0c2l8DTM8VOlNQiAEKlh0o2fNw5IqYMDkt79l1pJVNwdkNzM2ic2zKJzmCD0RGQ1YzyjHf63Ey/L
	FyLrWnzDA42SmkAhzvy3dp21wsyyfgLqsnInzJ2RkaTQOxUB8LQx+81U/AOgdkU2nROSJ8HK2SWgf
	4YQN/9KYgTYgjiMONZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsSC-0000000DIlS-3WTE;
	Sun, 14 Jun 2026 21:33:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsS9-0000000DIl6-1Nx9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 21:33:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELEKBA2544343
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 21:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bur06zKcsSYkJsUBV4uhT7
	g5E5SB6XYFrjgclNHkfuY=; b=Z+RhBxCFxckpOJbV1njc6mIp0E4/+fGHcovYc+
	K3FPG6MVBZxPsFHAwB8EJ/NY/Ky1PbWuQPNQXJiqU/+DOZZnV/knvzJrJdiECK2s
	OUg4rE3GQEtwVizx9/w7UrQo7TzfY2R6atbIbTwrnsarPn7Pa5Ovi04FM76NhdIF
	6PbAkPSYB/xYJZXVfCgoyWiEpyzVmn6tYzgjXZPdZlOH0jhFr6q1xdxDMe43hNet
	dUZyflkZ7YjuvkPU4rK5dsqRb18g3RvSo2FRvV7UdMubLiX465/Dn4Eu1WyW8Rmq
	XEMnGonf1qNYv2kkBLgiHhhp737uIvntI/Ipqy6R/UHrobZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6chhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 21:33:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c10cd7df22so42241725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 14:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472790; x=1782077590; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bur06zKcsSYkJsUBV4uhT7g5E5SB6XYFrjgclNHkfuY=;
        b=i9dJDygi5h9dK0dwsojkjnjkSxJ9qBCzv/zCGGW7PDmeEhVACIsteUrYPkzJ8130+Y
         JEO+SSsT+3NkUSi0I2kqRng/hGQ1ueLdfnGwrKwM4MR1YqcDDRn/F+Vz4B5V2CBT/D3P
         PR5cvHteI+xiH4XuzsWPMSENU+WGrh6OEIBDUG4n6CF6hF9zyMiL+uH3Y3P0J9O104v7
         h6XlQcui2ymR9uIqdOxA1wTXHCy860nHMmbBlztgJ06Y0Y6yBtZRgU5banQbqt0KjMve
         FEyISUJYLUD8XPkQRU5Bi5Hcug0jql5h9pUnUd/JXiDfZwGycHPHDt1xADnF5qrkfDYM
         SZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472790; x=1782077590;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bur06zKcsSYkJsUBV4uhT7g5E5SB6XYFrjgclNHkfuY=;
        b=dl+yBZixKl1DXXBQXRre2wH4XIwZEdBVl0kiLAgPFAEhW1q+0Tvip6qQio+djTZ66d
         9HUEMWshKv4uL5YPvxcIk9JnxqAfZUbCWT5V2dLN5XCdpNkFXuE9j/9fI2Sc6PUf3UPC
         a3Egx27VIxTCIxqMzWYMJzi1i2AQLTe2X9t7k4Gg7J2BiPdherH6kbJsdR7xP0e7J8RD
         JIokvcRsMb1Hv+fZbvjnKx3iWdYQUH50ITpHTczrk/A3HUBz5l2Kavvl5EywaCasA+6R
         XcMD3LcrFlOUEJbZlyRxjAJxdXS2ZnPv2e3XH5Bq1W1dfifb/adkzD8mjWAiEvTXGNrE
         463A==
X-Forwarded-Encrypted: i=1; AFNElJ+eKSSmKKr8Lj6RwGfe7OfzriAZO/PvTGGm4yiSRY6veoYFsLKvx6AvQHvGFdOfMZ34WQdla/7eIQTNchsmGL9T@lists.infradead.org
X-Gm-Message-State: AOJu0YxsxosPJoCf3XMXbfayBXrKLttrouoblEHXJGmEGODKAg8Djldc
	F9ToZRc8wRW33WDFI5ot3XPAP357uFxdW2FF1Ti5tevjI7KV80kRTwNaJfK4oOj+u9FfNOkUf91
	mKRMgiy1MKZG/yXos3mEa2ZIY3SG/Xt/rSX03s9fu6KMnXZHptF4FnPtchILH5FE/h6+PSlMCEx
	+JMg==
X-Gm-Gg: Acq92OFkbsRK/PW/u5zUZI/7Vl8QBYOrCRWp4xsq3fnFRg68clYC/oxmR7A7xBH9K5S
	iynhQWCfC4tncVVH7CYBheqI/fUkWUUBLrHKdlGj89jevx7aSXz5MyjkqmW2Mko9CVclL2okq2J
	o/klmarotAE/ilE6V6/oBJqCONdudN/X2F/J5bYjCyiS9aZCqcwJ2iB26az+uzgIESqeYfLFdqh
	6mZwnqDCxurXQWgclPa3jxILEGgL2MfRvFBdP54cH6ZymDeTkoHyVxBXJIgFVeHbGCTxYPuPM05
	z04wDKvyk5TXbsIHQqZUdAn0tkUJDByvzTByCVyUDtyPC8rkdgPmL15byA001veB9DCfX+2Ss1n
	gjyIB442Wq9+GlTodT8aakHdJjxX0n3mQMfJgnOUoh9oipg==
X-Received: by 2002:a17:902:c941:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c4109ecfbamr130763595ad.7.1781472790203;
        Sun, 14 Jun 2026 14:33:10 -0700 (PDT)
X-Received: by 2002:a17:902:c941:b0:2bf:222e:455 with SMTP id d9443c01a7336-2c4109ecfbamr130763165ad.7.1781472789777;
        Sun, 14 Jun 2026 14:33:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm78385815ad.21.2026.06.14.14.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:33:08 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm: Add support for Shikra GPU (A704)
Date: Mon, 15 Jun 2026 03:02:56 +0530
Message-Id: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgeL2oC/22OMQ6DMAxFr4I81yhJCxWdeo+KIYCBqIVAHBAV4
 u4NsHax9Cz/578CkzPE8IhWcDQbNrYPoC4RlK3uG0JTBQYlVCpSkSG35u00NsOEye2qiop0Leo
 7hMDgqDbLIXvlgVvD3rrv4Z7lvv2rmSUKzCpBIit1IWXytMzxOOlPabsuDgPy7dQ7GqdQ0Z8/o
 NBMuB8Z/4h6WjyefqlCYvsBCVDfttwAAAA=
X-Change-ID: 20260609-shikra-gpu-5432bdeaf0f7
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781472781; l=1310;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XhaeUKD8ec4SllC82vt0xlcd0hBy+SDeLmBke9XzXRk=;
 b=ivyhD3XZRXduZdfDnTiKOjDQ59HNYEZ7GA0ltWYmT+EzWj6f47wF+hZ4wLfkRqiJC/Tx6fMpp
 zKINriZeE9UAw4pN32kSFUX/mmaWRexd0I7ddS8cJ00O4Hv2Zb9G2a6
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOCBTYWx0ZWRfX+BUzAFukQ/qi
 ZZ+GTv8+fJc1J8hWVrf8l+Q9gCGj/eFNLn7lLD7ogEP5up0TtPukDeHwdzrsj64qpgEbfQiciWL
 OYbxTh5UwpjdkfsHSsNuuc1T2+ElMgc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOCBTYWx0ZWRfX/wp5w7afT5VZ
 kPsZC8zlvwtQiW4VNDKmt6PfMIPerC63+cQ+V4uXWNUvdocAiRJClRtcXzgBNPnSNkbuQDtzRpF
 ELZ+8DNYaKjGgZY+ugVsEY/zRC5T/GXeu7OtjhwPDW4Kzktc3eJOOBviv58IPHOVBwGzn/3HeEy
 Kr/hb6E4ZRNfJnpWKoP4BtL+ZBwSHliC/p1VG2SEXHS1rZSrn5vwkDZQI2QYVfx7H/kUuMvI0nI
 f2uvT+mYQoum8mLBPHF5DIc2oL810DkOMHx8qwE8MSXzj12bVvoTfwvy322ZO606HAu9aWiUbBg
 vNGsg5jquPCn4XHie8zAy6rzH2CuFs0XF8ha9Y8ds5TIgun8UZDiyT+q8jwMV8T8nYujnsnjhD/
 CBD33HfS6DrzTZ68CPF53njx+RQvTJ6y2icMhBGkp+uAZL8S6yZJBBoQT3RC8uqGOsYkXxJmtkb
 qb1UMH7qAvGF0+1clbA==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2f1e17 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vtaXLjJ3spEbOLdMN1IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: QKtk1smilvxAlpscxRFXRcOMZIgccj1h
X-Proofpoint-ORIG-GUID: QKtk1smilvxAlpscxRFXRcOMZIgccj1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_143313_618260_FFF1D30B 
X-CRM114-Status: GOOD (  16.08  )
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

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very 
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Mesa side support is already merged:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41762

The dependencies for the devicetree patches are still on the mailing
lists. So I will send that separately.

-Akhil.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Add a new patch to document the GPU SMMU bindings
- Capture trailers
- Link to v1: https://lore.kernel.org/r/20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com

---
Aditya Sherawat (2):
      dt-bindings: display/msm/gpu: Add support for A704 GPU
      drm/msm/adreno: Add support for A704 GPU

Bibek Kumar Patro (1):
      dt-bindings: arm-smmu: Document GPU SMMU for Shikra SoC

 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml  | 2 ++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c              | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 61087e3a8490908a65da4e2d33fb5de6eb888982
change-id: 20260609-shikra-gpu-5432bdeaf0f7

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


