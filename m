Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BCBC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/XC3AWRQ/CjLCQYpJHT31hZz4Xd0vJM30eKPvD0LiMw=; b=XAoFipQI26w4T7
	vNwlGK8o8X0kI/BfG7PDBtHMBwEfy301Ib8I9sqAb9ZbapwVf3JR5bgr3fCLUtLFUThFcuswHyeXj
	MckRnBTazFhlr1L1D4K1L2NwDKmfCQLFLPhJNScnuNNUT30MvLW/+mAx/C8UaymMTC2BcqwbW7L/w
	h7330vz/AYBHjXypaE94+vjgqoNiFyPknv8aqd49hPUVNdnP/jQMa6bPVOjhr3gTd6to1S/0BI5AN
	o7PkLgYs4Cymj7k5srWBAlo+LdNF5jvLy6yO7Ln4v8T52WuCrT/WLUrcsDD1FlufmvlbHQca0E3B7
	12Ds9yAChwzMgHvrmMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltHB-00000007iBO-3lUL;
	Mon, 20 Jul 2026 19:03:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltH8-00000007iAN-40U0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:03:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KH6XKe2962547
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 19:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/XC3AWRQ/CjLCQYpJHT31h
	Zz4Xd0vJM30eKPvD0LiMw=; b=kDFTjjt6k3/GLepGJVfLM4Ru++p/vQb+xfkuHl
	r5bv7yC4iwT5ts2NVc7E5VfHikpZ+mWFs0eshYozgpzTIdsgjefcXcbWq1y8rUCM
	BAT1kzZzfZ331ARuAI5n4seQYdFeaePrMfHn52vqZ4aWjPaZKAThMjvzF1naBdkC
	9gDJ7YUeDLlcq3n463naxmAburNldi8kp+ZfTDE6QWewIheXqrNDZ9gY5WFw0FQw
	BNiO5xZAbO6os+VEQ/56cGBCGv5Vw1MrJGfsr+3kyDn5CwM0dpLBlSrVZAhh80qq
	HFMwDwKX86B/Idjwd4vLTaHBQ9JQ3q5RoK/nhnVcTVx6KeZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y2jf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 19:03:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so194003451cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784574217; x=1785179017; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/XC3AWRQ/CjLCQYpJHT31hZz4Xd0vJM30eKPvD0LiMw=;
        b=TD68OWqNJy56RvR+iPOuhCxmU/USHYJHipBN1JEO0zUWUK73DAEnozEXH+4SpHSDK7
         fLAE/gEn5WnZZbVDZVUHGwJj9CgB/9Nz8fHFQpIbdyIEpEatx6Qlp15ATSyyPafIJ6GU
         YFgGBUbMgGunn6Y3+rgcg7hSCwRM+h9GDGf/qYAVd5I5g4mpSRJEk4oqjgtFNup0OpCe
         9+P6iMeU/4NS9clpHwtRqDbbC/dg/uCLaouQMC4Gs+iai8P8aD/wgWypuA5ZW3IptwUJ
         p/kp2Fjvliwkf4j3wAfMMzWWStlwX24G0XbYO2hZpv/khUwPxcJ0gLhjYN6TCJrBd55I
         hkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784574217; x=1785179017;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/XC3AWRQ/CjLCQYpJHT31hZz4Xd0vJM30eKPvD0LiMw=;
        b=Nb0x1OC+vGr+joz0FUlNi5OoYNKU54YwXWAk6Qao1KhKXQ5+SsqVdtwCi5G4bUi6wk
         wp5dtAN2UD7s2XJlArN9Nd6+cXHOpc//ASeBLW9dMG/orZYGupDuI20cYwcfFGGVTR9z
         cPu+oKBHkiYNsrjJ+5Ajtzj/4WSORPcUrfMvHo0aW05FitEwPIlHqa+lF+O/RZhS4+oP
         74tU//EqG9KM+IXcgwvicTZb/z4uSWKFEq5gQ/T2O2X7jCWPV75KlA/pOnJWaQdtrwXZ
         bbCAGuQyUae8q/24jRNJphM9ni0flxel3S9DOg0fo0WkJGbOXFs8m18jpigimSM5LeDv
         LPyw==
X-Forwarded-Encrypted: i=1; AHgh+Roa0GgmYlMpxLNEQolCWRNvT9DZRgzB8AAjhmfzvrc/p/5uJlCpw5EnBIsBVEK+twBKtyJ/OULjndJ2TcoxE7xy@lists.infradead.org
X-Gm-Message-State: AOJu0YxzneWc0giOzyDNQequ5W8lNjqtL4v9qjf6boiwXCHF1Tj8LXGp
	HVG7XiDdD00aDPzD0hmuGokkuVvgF3Om8+v3VTCfeMqLfTzOBxnsDJHMSPa+PXB5UKpe3z7JGWo
	iM7dEG1P5xQVgWDK6PdEuNFPoWPRJVqO7YJpejE0x0DyaGwXqWrYcNY47QRagy0bFRakj3XbObH
	ZtrBiIEAMJvQ==
X-Gm-Gg: AfdE7cnyooDU1UasDaDdSGWJkSQPhL3RW5eiAJD69eNOL5XxorRyFBf8HKloJig1JnY
	/g88ayx0nz0XPgMJ5Cylz8bI+piI6vPYsKU8gYzxqRgynzXDvh23N+u0qSzfM1B2teV1eFb5aOz
	U10nqacPqEIhYleEAViEdoJg5obK2E7oGjtjVrCjnUhPhINljqY3Ke5CU8ze7pCD4lBaH0K5vqN
	4AiU07QUekdXOfnDaU3zxGoFPiIAEosKFTscs0foXIlJRrkxpjuTJNuBJS5IXCBY8SBtE4p+aVY
	f1Q0zPX6AgAHC2ChAGwvOFcXSsfinbVip1LxeMxCIuefFDdlnKSV4G61A8/Co9J61WcwxDegO1B
	XCvbSAJPWtNohQF1ocS85Y0cJ
X-Received: by 2002:a05:622a:588b:b0:51c:e14:87ae with SMTP id d75a77b69052e-5213c7e69e7mr135591521cf.34.1784574216757;
        Mon, 20 Jul 2026 12:03:36 -0700 (PDT)
X-Received: by 2002:a05:622a:588b:b0:51c:e14:87ae with SMTP id d75a77b69052e-5213c7e69e7mr135591011cf.34.1784574216289;
        Mon, 20 Jul 2026 12:03:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954aa1a231sm181509845e9.1.2026.07.20.12.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:03:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Date: Mon, 20 Jul 2026 21:03:26 +0200
Message-Id: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTQ6CMBAF4KuQri2hLa3oynsYF/0ZpAZaaYFoC
 He34MKNiW4mecmbb2ZGEYKFiI7ZjAJMNlrvUmC7DOlGuitga1JGtKCiKGmFrRsgaO8c6AH32nd
 YtyAdlqETJZagjZQEOCMKJeMeoLaPzT9f3jmO6pZ2V3RtNDYOPjy3Byay9v69NRFcYBBKs3pfM
 WrUyceY96NsU7PL00DryYl+UE74L5QmVBoApfeMH4T5gi7L8gIwQ8cmOAEAAA==
X-Change-ID: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=M49zLdCDFwEnulcdNvR0e/0VDmNXymrGOAhAWO4iyOQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqXnECNLZ+We35hlF8SaiTYUDxDhm0u0BBatNRk
 W40K36eDu6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal5xAgAKCRDBN2bmhouD
 1/B4D/9RPovgqGXWaSu9V+Bebs0TiuffKmIzkiJtAPx4hSP4CkLwlfLMeqfFC8BhSTLoyRyS/vU
 uA437Krwo8leP4QeYndwigSrsouOli3k4c/ryg6NtoEJUvp+ZBqcMqeZkfqFlwBsra/sHq2GQCe
 nmhtXq/zYyjX4OLKirWsiodkbPkOaGRo4zYXMirzROD51tEFXcSl+sB1YACZmH+zk63jwAwAmUF
 o83DlHXg33UihM31/9kIJcm1+4+40AmIQn5/ssUel20WkOr/elI+z626ACBGahWvqw7PuXHQBHJ
 wUKjEEj6L/CLPcMW2lKZUjq3Kgp9FDFu60uidAawk3SRu1Edd5Y6aguC/obcLeoVtyvTcdbZDI3
 M7D+/Yocvx0SGsL7P1gVmzNc/MZbn3afA7GcdebR/z3kt5ixdrD0Ir1gWg/BLuqW5XnDHhUKX10
 Xhj/Fr4BwNssYEPycrdvj1Na/jxGl5Nz2qb7EaSC4uJwUubD3rdZbKLBzK9ObGPO2LkbteHIPjy
 dVdCwtReiuuqujVI43Km08cb+jAmFWL8usXzUnFCD63DriJGNS9Qy0fTD2uZdoACPG6Gb2oQkiM
 Av/9r3EyMfPS6woikp09wrOOdYahapuDnO8X2qjUtD/caRf2u3/i8n5xulXyIPg7794lYvzncEC
 3SH7AhA4RPmS8Ig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIwOCBTYWx0ZWRfX0ju+UKca0Kox
 qK2zaCO53/miu8WkkKnS1U1VhefsCToY7JTYn0ZD6KilfaOSe7Z5zF8/K5vkS271Nxs948swKa2
 P+rZHaQsUe5fCMYXAPL8mAD4WWkzHWc=
X-Proofpoint-GUID: LHMAY33WnM6F70kDNEJ4bFPcMDM-MiVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIwOCBTYWx0ZWRfX0dWXWfEEuN8N
 Q72wcn4RA7fIgRCoVY8HpPHHXX/AVQm66uJJJ0jqFpYvQKh2kbFtU6pBN0vf1aaBnGpu2cxO48S
 M3g1xmw9aa71+bEZOnitrUJZdpELAprUOqVPa1ueHJVe69kfxcclRHgR6Lhkx50IACj5Wl/vPAs
 qJgNIjf9o5iXxRohreIl0giANnAf1uEpf/Alh8pZfZ8p5LX+kOsUz3H1i+GTySHehRhchoz/wtC
 1p+6Z1k0r7VaeAzhtw7T7KVqTElRa+orKdKMADHEBdden+5SVwkVRao+aa+fLv9OKfkT/Irebbg
 oHLptORgk9FEZ/gJVyi2P7yMccHuy6SIFdP71dhL70n/eO5+Bi+KMgZnWVNe5EuNL9GxudrLpFo
 T0e+9AYIXp69CBsUCq06fs7bLwbbAGE1u8COzNJXFW76oG1c1TXu8n0yNVRGqb/igz6PuqjDD9v
 R3F5/TJeRD8CKs5MYEg==
X-Proofpoint-ORIG-GUID: LHMAY33WnM6F70kDNEJ4bFPcMDM-MiVq
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e7109 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=tjA5nVWDIhs3vSZUhDcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_04,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_120339_000368_E1DBD1B5 
X-CRM114-Status: GOOD (  11.20  )
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

Merging:
1. First two patches via interconnect tree.
2. Defconfig a release later via qcom soc tree (dependency to avoid
   surprises).

Changes in v3:
- Update also Nord and Hawi
- Split defconfig to separate patch #3.
- Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
- Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com

Changes in v2:
- Patch #3: Switch to built-in for everything, with explanation in
  commit msg.
- Tags
- Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com

Similarly to clocks and pinctrl, interconnects should not be a user
visible choice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      interconnect: qcom: Make important drivers default
      interconnect: qcom: Add missing depends to Hawi, Maili, Nord and Shikra
      ARM/arm64: defconfig: Drop redundant Qualcomm interconnect entries

 arch/arm/configs/qcom_defconfig   |  3 ---
 arch/arm64/configs/defconfig      | 31 ----------------------------
 drivers/interconnect/qcom/Kconfig | 43 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 34 deletions(-)
---
base-commit: 96ff9ad7f53e233e69f87f882b331bfddd903469
change-id: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


