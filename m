Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57DACCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9iELXAHflmw8+ZgJ3dYI+WWKiAnqwwPtj78oi+ZNss=; b=WRNxYg3uL8Q19zCQHF8D1X/Rk1
	hQA3K6Vd9PpDxfWxLYHoc6YmUdQAgLzSgqeM8DeC3bjQ02muGU0NGK7Tdoppk4dBjRYKgPaiUlnYr
	stM54Rd46HK+43DMiuOIN5k0RAg1UIQ7Q3I025bKGDKG//XdkLEaGIKiQCh1Tzm+G23tymg8qM1fH
	GMapiSUMzxIsFVmNlseQc/IjVCOgSa/UhMK20iulEXKTftyJqM+2o/BkTfQHJZyv60bDbI6lmK0pq
	DFNSM7sS6yeSm5jxMqewKxO5SqfeM9LqM1UG5T3M/IsAfO7fdrrm/B8cePUA+HzDMF0pxwNGzAJOJ
	40bIjoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4O3-00000000zW9-3D8g;
	Wed, 29 Oct 2025 11:30:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Nx-00000000zSp-3UJq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 11:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=O9iELXAHflmw8+ZgJ3dYI+WWKiAnqwwPtj78oi+ZNss=; b=CYk6PJ/Bn5abmBmC9dGtuKz2FT
	BhOFIFRGQ3X/5bBKCas9FqN9ImlUncxF5CPfrT7/XXuf0r8xa6SzZeZNgv/qcADX96FqncDx1B1LN
	vOZwJxUmKxjq/umJaxlpv5dS3Kdh7lhnT0Wjz75g9yYagYISZXPayRQsxnhYU5zw4VF3kKphjCmYU
	bnYbUyNKdIC48JT++wy2xChQLmIoSczPZueNKVEHpnaLHN5nbmKLjp0VvNVb2hjcSco/uRj6/G7Tq
	yUwQslEut/QzNMtpdezEr7n0vsfOy+VJJw+BpkKEU8PMcQT8KrX1Y46ZTNIA7AjJ3mEu6RSfB9QOH
	cB0sh0UA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3WA-00000006ZzP-248a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:35:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v1QW3665457
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9iELXAHflmw8+ZgJ3dYI+WWKiAnqwwPtj78oi+ZNss=; b=Fc70GeIBGwxokD80
	gTwd2frpgXYsUgFR9D+UQYKXzs64EokyWRZq+SB4BEwJubyeto6Y6PkIX5vO1rCn
	IgLA+UTVKypmQTtWxmD4OTLZIolhf/WV8m380wBk5VNl/Q+UvIepon/z2CFq4efl
	VhIGwp7TbW5xiekkftvfRqGEtumtugjrhyV3sSKs9b4PwDmMeoy7ooF6imYNKVHg
	x2ER9A0YYhT1ooPD1tPu/P8QDN7z/Nya819lZ46SPxRMBmqGSU6flUcIuhQ6HoPi
	La18/FE97HY/Pbp67ept8J7xFwDYJTDFO8qLq7rtS+aV6GBXr23dw1Dd7w91upoy
	l84cCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3tbg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290cd61855eso61841465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737431; x=1762342231; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9iELXAHflmw8+ZgJ3dYI+WWKiAnqwwPtj78oi+ZNss=;
        b=R2E99rDUWkgn0Vu9yrQQshLWSKEIyvL/sp/Y8t5GMuBaczw9gWgU2CenOY9/tzClPD
         dvBZEZQLpE7vpuJkK8i50X/ZL/hGo7XI/mz/uqoiWUxeEghXph/L0jQvfZHbFk9nCGPh
         udU1XCdhvdwYrLj5b9/NF6VRDYAK+immq8bNLkI9+w5cng96j5YQh/0qPA6mRmp5ERvS
         RwRk0wmCN89HK38sW7KCZ5acKHAOhKj+SiAme70PBJ3Nfch9AUmBpgZk+IEKgUrmczmo
         6WxdOPOsFRHwHlhUqnK6poQrd0xVgAmY3a962ab1E8w/9QJaXf9aFg1XN/trzWBfezJd
         drgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737431; x=1762342231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9iELXAHflmw8+ZgJ3dYI+WWKiAnqwwPtj78oi+ZNss=;
        b=uZMqIgkpuYN+40T0nxg9HpWQbtbBbES8Psh9ZERG2DwlJ8qEypH7V5qZuxTXnKYPN8
         gMgTwEgxFYSvVi4B4rr3jOUMpXCjVffhVZBGyc4nH92PeJ1MbxQcoxD6E6uN77fRjAJi
         4dEOMqPk83+NTy1nj8VLSqqDZJTBZBaamaasS7phsDczJBcN20yOfJpCMVnyK9rztI5c
         fFgB/rfDeW13sqNbIcpnwAd6Qu7gKAvGbi/jMa3ubE/Geipilex5LHuVSvidu3MI+KTW
         G4eU9NLB50M0Ff5y8nlsyBBHDPer5/O5Zy8cvoDpFcGn23aT2aP5evLMst+o9BuszVpG
         z9QA==
X-Forwarded-Encrypted: i=1; AJvYcCWxCuazteFelVJDaAZfSrF1j2G2Ix7kvzvFPi7H63Cpe7GZmJakB/kB6GLJ9a1ZXxLO/MMsFtB1098XqZaT3sL2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/+DjrEDSB6JgAYpX09//up3HM8CnBxj1wLJC84hG4pwtC5Flr
	vigYeHnZjrnT1dTe1rVrSM6sD+9enT8/GhjEixYspVQI3yxom0C90JNcgEhyxcE/lcB4SVEPMOM
	5r/gghFyeS8LIO/t5z12am5LfZMoZgMq9V4kf84TVQ4X9Cywk3bzkyXU2KxKwiusyUIQzsgtjJT
	R2NQ==
X-Gm-Gg: ASbGncsNpquVWRHhD8TVivQOBiR0P5wNbfMWtT1BP7+E5BT5T3jD9PyqfMemYNKEGB+
	OD3S8KdhDconTLu84HbCWvqfjlgJxItsT0pSh9uDrGAtQD3oe3ljP0u90A4iigXr+OztDdp8Ciy
	DGo/6LqK61+VHueigayy5ml5pa24yXhxL4TBZ00Hr8eWnIeFuZcrKY+YZxBbt1Ty0wr+yEVqdU7
	xVYwsYlZ64FwJAB+v3+Kk3zGCkt4D345ALGRy2ZyMJhEK4urninEC7xxTlD9wPki2I0ql5W/Kjh
	Tx/WdrOkbVDwVqoOk2IYtpHe21h8ktki88HmMPg2VetpD74zi91IDVQTsOfvudvSr7HLdmZoaJi
	7C70OlIlj/2nKD268ROC8ptX6QcvFMl1jlg==
X-Received: by 2002:a17:902:d2ce:b0:269:a4ed:13c3 with SMTP id d9443c01a7336-294dedf443fmr33996915ad.5.1761737431322;
        Wed, 29 Oct 2025 04:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzD3E0IZm0JLmQ6eTP7Lq7ar8FKXrfNnuIQJfcHUciek8CdlXU+uEBlYoC0IXK5Nyb/Xjdwg==
X-Received: by 2002:a17:902:d2ce:b0:269:a4ed:13c3 with SMTP id d9443c01a7336-294dedf443fmr33996485ad.5.1761737430778;
        Wed, 29 Oct 2025 04:30:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:59:57 +0530
Subject: [PATCH v7 4/8] PCI: dwc: Add assert_perst() hook for dwc glue
 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qps615_v4_1-v7-4-68426de5844a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=1362;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0ISk1zo5mbRe9LxvVD2vadNQhbkjLDQVBj/SNxnxtpA=;
 b=kOSo+nmmPNadAjOdB06SfSAKWKG/olLMaKQnaw1Yrr90I/zKaUVLNSJ2NCiJnpG3h7DLefx82
 JJ7r2dS3VeABWmKmDzJ4i+yI+7xbpWJl/11xp4sC19PcUt3eyhvpgJE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: qMQEcZJ-dWwjxAIFuhDRRxQB_T9KzyWP
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=6901fad8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfX0J/YVc0osFor
 B2VEyjLQORzl3E1/Nh9g9kjvEwsRpso/hDaBhS18Od/BEvR8/1uIB6Kwmg8VfUjWORm6z7HAMW3
 0w1t5R7Dow9rq/IXId0DK6yGNxpvYLQmnAmpcDH/3HXErF8/RdPOIKyqh5yEQZ/0uqcUVxvGHcM
 jWVXT0OnWLTOGgjrSJbIxIZPTWGVeAhGKq8kGog8LPuw8fx7baFJmdS1FQ62ayaWGnu13iyr7Si
 b7ZKgVIIuS3AU1pXsjNflBH0AuQjWsQdh0kiq0lq+W9tnXhPdG5LCPI/5UdtP/Uny2/16+4d/VL
 SewNiuwehkg9GbjYDcE2eDSt5KAs5xAAQq+HsZljN257+WR9146yXYk6ZLpcC67/BAxr312ditx
 h0Az58FdoU2839pnolKUvaq+ePqHUg==
X-Proofpoint-GUID: qMQEcZJ-dWwjxAIFuhDRRxQB_T9KzyWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_103502_944317_1A6F3FCE 
X-CRM114-Status: GOOD (  12.53  )
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

Add assert_perst() function hook for dwc glue drivers to register with
assert_perst() of pci ops, allowing for better control over the
link initialization and shutdown process.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index e995f692a1ecd10130d3be3358827f801811387f..99a02f052e1c8410573ecd44340a9ba4f822e979 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -485,6 +485,7 @@ struct dw_pcie_ops {
 	enum dw_pcie_ltssm (*get_ltssm)(struct dw_pcie *pcie);
 	int	(*start_link)(struct dw_pcie *pcie);
 	void	(*stop_link)(struct dw_pcie *pcie);
+	int	(*assert_perst)(struct dw_pcie *pcie, bool assert);
 };
 
 struct debugfs_info {
@@ -787,6 +788,14 @@ static inline void dw_pcie_stop_link(struct dw_pcie *pci)
 		pci->ops->stop_link(pci);
 }
 
+static inline int dw_pcie_assert_perst(struct dw_pcie *pci, bool assert)
+{
+	if (pci->ops && pci->ops->assert_perst)
+		return pci->ops->assert_perst(pci, assert);
+
+	return 0;
+}
+
 static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 {
 	u32 val;

-- 
2.34.1


