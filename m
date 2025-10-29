Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABF1CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y2jm9dDHlt5T0Ww3rdQuy+Lar+Wls5nknPdT9+n/cKI=; b=sVZcp4rhvjqM72
	3okQ20li6k00HrFpkCz3kf8h0RVw1PSQdYwX0ujx4FDlwfQtWmiB0M3VtWEATfnNONxCIVBkLyQ3v
	H1iIdgfrj2OrM3DX5JCP32oLmNH+FrsXmjRolQrdp26MTFnLpER8eF2ELYFeNF/eF3rkRlEzIlm/A
	YOWt2ESH6ZWYLf4gXNbGg95JLiWlkNkXPyPhoQPeo3bxAiUH7eOBz6jeJiYWNieKnBW7Y6uubP2gi
	kuEKICT4CVCZN2pgpYnn6DX987vTRr0ElLHH4A3DiXSyUNNj8pgd4YO+yuaH/oqwWT28Uuk6zpq5e
	SuQAm75sxZNBGUcgqWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Ns-00000000zQU-2g6C;
	Wed, 29 Oct 2025 11:30:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4No-00000000zPF-1zTE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 11:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=y2jm9dDHlt5T0Ww3rdQuy+Lar+Wls5nknPdT9+n/cKI=; b=e2lor10k55RXYkGUfejCjgtJ8J
	sZ03BZwWIs+aKVV7mGIyAwuc0DAKX2yA02efOThAwNaLOlpQFPfjqii6gQB8bXdtwmkQ6kBo8uzQ1
	EAbdxkleRqZWPKOSfJryskPfR0cElpg53JyTF2RHSvQrzXgUeRb+x/aFKMuTRX4EA2qo5iOqJOUjC
	MKDjut63lnJtgsxCPoI1HFPEvQBYMbP3JtjfmbdpIR78vQaSZ52D05F2jbBg8eIgRt/xvWFdQOtHz
	pCgCdh1mHtYGyizcKZCcCYqO6D5L4Un7+Wz6RwMitEx44W/cu0r5btKeZyELj5JQIsHOo6fIu+r4h
	3HJURx5Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Vu-00000006Ztb-3NaL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:34:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v27i3757829
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y2jm9dDHlt5T0Ww3rdQuy+
	Lar+Wls5nknPdT9+n/cKI=; b=h/ZmG+RGoH9pG0BiiGDv4tYKhgoaATxZgX8AAR
	MaxDEkM5y3lkB7H9czQQCS2rDx2tAJ3q8Yr1vA9EnxuiOIQTsbDUc17abckMYNbM
	k7v42vZ397tHxg889o4zpcovxeyxfDFZCr9XW2i/Fi8rcgwvNfSqLSxStL9WX7ee
	a9x5bvRgKiJjWq1vya5XVL3vYawvGV0Km7OVbdnH0IoPnioxOJ3Ykhbhx9Z9hviE
	KZZtOopzIGeffTzgEeGIzfplv7c+Qa74FqCIC3yO8flXZ4eU+bcFZpG+cZI7krqG
	7m8NW+fnS7KCvJlVobEeuE6NrczUkUBMMTWeKmA22deRXSVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y2bhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2930e2e8e7fso57418445ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737406; x=1762342206; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2jm9dDHlt5T0Ww3rdQuy+Lar+Wls5nknPdT9+n/cKI=;
        b=kQtM1AVr7lnvEeFio/YQfnKT2WR1nLsY+Xx61ZeZNT6YOEBIrMrmi/OH30I9XvHIDp
         aCEkYAmMFGrMSHqqECOFdZmINKgWtlEMf/eNYyS1N+1PHD6uC8TDPoQD0qXth8TtLmUD
         QgbJDasGIZPEeldiulBzemKEsqg3MmnFL8H/3xmXmzbSrRRYBEPXdYPvotjC2Si76SuH
         7FuDuMZ+cX5N7AiK250V5YNQcdBkfb7FRyp4aAfTM8PgOdz+b3kMC6NuPhTQcJ5v0Yke
         HPmu72kAl29jtUYH+Sf+JCvRSlfRpPX+OebNr4QymRuvAgRzVGAj5SnqsDAo56jQSwiz
         LHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737406; x=1762342206;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2jm9dDHlt5T0Ww3rdQuy+Lar+Wls5nknPdT9+n/cKI=;
        b=a8Cdeeg0HTOwHn2yRY39KTPFxi1gNQL3x/hb6o0ADD2jW9DfmNLTjA8SMZsF5GlHAc
         58OZCojshnm6RHTxs1nQ3oxKhfwe9w9FK+5uQrBDEajREnDBiDe4Ihg8mg/OeClywR/v
         MgTRMYTAaDujxA8KeN4rRO9U7Zbn7XtaW5Y0U3KxwmL/F23ZOL16IsuIWZSqlQKR4K5h
         a3L+ZobVHelmfd5ITTzbdgxDkeR3lLcHA2qWAu2G2wWMnYXDFJnuyEEhb0nVGYLGTi0S
         4dfv7yfBJSI51iRDMAf3had6AqQ+SK7W9BCIRQ8SobRas9t9rOAmmxVHgH1PnyefIEMl
         cXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW8nG81N6a2cE8nrVgrS+nDrxJ3pEHVRQPvu2EJe4ZbX7wi7oir7Fe+ovOstLP4STrVZjrn3VDoaf4X/izK1t0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm6cjCXX3hB5Y5M9HhgJ9dch+79Pqyj9DYfNXFunfbmsuiEwMO
	r6B+BKsCElYRCsaXq+4aTUGuNATE7foYh3IE/68H06ErTVIuCekAHjoG6PE1gLQq5LqjbWUc0FW
	RoIEQKg6IVkZVyOBkaowWUDrbSlP4r/+36oUUGjL2DW3GJqRnWyT817ZqKRGbrKa3bXaMJR1tQF
	AQug==
X-Gm-Gg: ASbGncv/It6rdH6OdnYdIC/cuRAi3C1tXgn3nICQ+gu+sHi1o/p+reOI04g0zHV9b7Y
	dfSFg4kDo6hEOTLZrw2sBAi/PyaTioSlSss/0/TcKNd/9EMMw79ZyYbgWwbKjOo/PktHDSAywGk
	ZYqlcEK+edh8DU2qCkySBj/0ApBWG0ep8t9OUY3XaQPEu8D8GNt//3/Jf2SEueRUbCegcd/nQTE
	8yc9qljJLogaD7jisnsOAul80BB4P2NeSegiDuxRfgEJUqf5nxYqsB92+Z2hgWHgBMQe1YponXs
	UtrO1Y66XYsbcEyKshszS3gC58m7/XPlWg3Kes6xqHvtVM/CMpWRLYBa+ucFvmWwe00oUuwy50u
	PxX4vY9U042fWZnVb7mLXSAr6jOg3BAN8GQ==
X-Received: by 2002:a17:902:cec1:b0:275:2328:5d3e with SMTP id d9443c01a7336-294dedf4a48mr38764485ad.18.1761737406140;
        Wed, 29 Oct 2025 04:30:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4QuNCki4+zixZpMZK9vnl/SsRQHgfutzx405yAsnm6xucYwg8APiRkZJ1SC61gScEpYJOwg==
X-Received: by 2002:a17:902:cec1:b0:275:2328:5d3e with SMTP id d9443c01a7336-294dedf4a48mr38763585ad.18.1761737405134;
        Wed, 29 Oct 2025 04:30:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:04 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v7 0/8] PCI: Enable Power and configure the TC9563 PCIe
 switch
Date: Wed, 29 Oct 2025 16:59:53 +0530
Message-Id: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALH6AWkC/3XP3QoCIRAF4FcJrzN0dh3drnqPiHDXsYRqay0pY
 t89t4jo70Y4wvlm5soidYEim46urKMUYmh3OejxiDVru1sRDy5nBgKUAAn8sI8o1TKVS8m9IQR
 vpdQGWW7sO/LhfNfmi5zXIR7b7nLHUzn8Ph18c1LJBZeawDlVQQ121sY4OZzspmm320l+Bv1RB
 fVdJWGwKKyunTff1WGTpF7Ty48rksqEqtEKlAV4av4Q+CIMmHcCM1EZ5SthtXOi+EH0fX8DH7u
 eKW4BAAA=
X-Change-ID: 20250212-qps615_v4_1-f8e62fa11786
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
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=8142;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=R1ym5za/YxWveqf8yqW0XLv+wHPbUS9FbYThihnVuwo=;
 b=bjXMRd2WO29QEf6QHKNYgV7NOKh0WLgIi02TP4pxrqdsKJFGFfIjo3fQCVGJcZiYaQi2nf1Vp
 UHhcG2ULBeiDfn0h7soAhL7KTlWxDbcQF7DkKtL5xH0YpkfQ+mKoojl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=6901fabf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yKAn6K1XAAAA:8
 a=COk6AnOGAAAA:8 a=jdgvuftHn8Q9ZZcfGlkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=6M1ixcW_PCWoKiWyFx5v:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WIH-t4WxepF0IO4vc00wwuxweubi-MI-
X-Proofpoint-ORIG-GUID: WIH-t4WxepF0IO4vc00wwuxweubi-MI-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfXyRr4hq+TcQrK
 78CaUViU4blT+O/hTaUAb8BaN67pVFAlwOICL2avGUUXoBJLQ7ZZEcxDxw16lXKh9IwKKm1/v+J
 XciwR0ilYrne/4EJlHARVZXDz8YiuSlOIRqbrk5EAjNP5xhH7Su3IoOa8B9tuGcWrzvTxvMgNHG
 1f8ayC7zNEss/l8i4aiyPfg6qFVFT8PlEUrosxJooRwqaPTQM/xAwgb2SaF+o5wj+OF+XzgPkyW
 aZnG+Py3nytvqV6rmX468GyGifMI4BoTwmAb+4dKDePSQK0gvIZONNvUlpJHj7AKGXWzkGOpJMm
 F+LwJlpVxm7ZUVnX2h5lK2zr1Zdw7NKE+/F3xnIzjVkS3pYRPEEI+oysCaK76dh+0w3KgcLRxL7
 ZAN84WVme6FLc5bppoawO0RsMpJz6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_04,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_103448_844728_A8E66E86 
X-CRM114-Status: GOOD (  25.20  )
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

TC9563 is the PCIe switch which has one upstream and three downstream
ports. To one of the downstream ports ethernet MAC is connected as endpoint
device. Other two downstream ports are supposed to connect to external
device. One Host can connect to TC956x by upstream port.

TC9563 switch power is controlled by the GPIO's. After powering on
the switch will immediately participate in the link training. if the
host is also ready by that time PCIe link will established. 

The TC9563 needs to configured certain parameters like de-emphasis,
disable unused port etc before link is established.

As the controller starts link training before the probe of pwrctl driver,
the PCIe link may come up as soon as we power on the switch. Due to this
configuring the switch itself through i2c will not have any effect as
this configuration needs to done before link training. To avoid this
introduce two functions in pci_ops to start_link() & stop_link() which
will disable the link training if the PCIe link is not up yet.

This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/

Note: The QPS615 PCIe switch is rebranded version of Toshiba switch TC9563 series.
There is no difference between both the switches, both has two open downstream ports
and one embedded downstream port to which Ethernet MAC is connected. As QPS615 is the
rebranded version of Toshiba switch rename qps615 with tc956x so that this driver
can be leveraged by all who are using Toshiba switch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v7:
- Rename stop_link() & start_link() to asser_perst() and change all
  occurances  (Bjorn).
- Remove PCIe link is active check & relevent patch,  assume this driver will
  be for the swicth connected directly to the root port, if it is
  connected in the DSP of another switch we can't control the link so driver will not have any impact
  we need make them as fixed regulators for now.
- Link to v6: https://lore.kernel.org/r/20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com

Changes in v6:
- Took v10 patch  https://lore.kernel.org/all/1822371399.1670864.1756212520886.JavaMail.zimbra@raptorengineeringinc.com/
  to my series as my change is dependent on it.
- Add Reviewed-by tag by Rob on dt-binding patch.
- Add Reviewed-by tag by Dmitry on devicetree.
- Fixed compilation errors.
- Fixed n-fts issue point by (Bjorn Helgaas).
- Fixed couple of nits by (Bjorn Helgas).
- Link to v5: https://lore.kernel.org/r/20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com
Changes from v4:
- Rename tc956x to tc9563, instead of using x which represents overlay board one
  use actual name (Konrad & Krzysztof).
- Remove the patches 9 & 10 from the series and this will be added by mani
- Couple of nits by Konrad
- Have defconfig change for TC956X by Dmitry
- Change the function name pcie_is_link_active to pcie_link_is_active
  replace all call sites of pciehp_check_link_active() with a call
  to the new function. return bool instead of int (Lukas)
- Add pincntrl property for reset gpio (Dmitry)
- Follow the example-schema order, remove ref for the
  tx-amplitude-microvolt, change the vendor prefix (Krzysztof)
- for USP node refer pci-bus-common.yaml and for remaining refer
  pci-pci-bridge.yaml(Mani)
- rebase to latest code and change pci dev retrieval logic due code
  changes in the latest tip.
- Link to v4: https://lore.kernel.org/r/20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com
changes from v3:
- move common properties like l0s-delay, l1-delay and nfts to pci-host-common.yaml (bjorn H)
- remove axi-clk-frequency property (Krzysztof)
- Update the pattern properties (Rob)
- use pci-pci-bridge as the reference (Rob)
- change tx-amplitude-millivolt to tx-amplitude-microvolt  (Krzysztof)
- rename qps615_pwrctl_power_on to qps615_pwrctl_bring_up (Bart)
- move the checks for l0s_delay, l1_delay etc to helper functon to
  reduce a level of indentation (Bjorn H)
- move platform_set_drvdata to end after there is no error return (bjorn H)
- Replace GPIOD_ASIS to GPIOD_OUT_HIGH (Mani)
- Create a common api to check if link is up or not and use that to call
  stop_link() and start_link().
- couple of nits in comments, names etc from everyone
Link to v3: https://lore.kernel.org/all/20241112-qps615_pwr-v3-3-29a1e98aa2b0@quicinc.com/T/
Changes from v2:
- As per offline discussions with rob i2c-parent is best suitable to
  use i2c client device. So use i2c-parent as suggested and remove i2c
  client node reference from the dt-bindings & devicetree.
- Remove "PCI: Change the parent to correctly represent pcie hierarchy"
  as this requires seperate discussions.
- Remove bdf logic to identify the dsp's and usp's to make it generic
  by using the logic that downstream devices will always child of
  upstream node and dsp1, dsp2 will always in same order (Dmitry)
- Remove recursive function for parsing devicetree instead parse
  only for required devicetree nodes (Dmitry)
- Fix the issue in be & le conversion (Dmitry).
- Call put_device for i2c device once done with the usage (Dmitry)
- Use $defs to describe common properties between upstream port and
  downstream properties. and remove unneccessary if then. (Krzysztof)
- Place the qcom,qps615 compatibility in dt-binding document in alphabatic order (Krzysztof)
- Rename qcom,no-dfe to describe it as hardware capability and change
  qcom,nfts description to reflect hardware details (Krzysztof)
- Fix the indentation in the example in dt binding (Dmitry)
- Add more description to qcom,nfts (Dmitry)
- Remove nanosec from the property description (Dmitry)
- Link to v2: https://lore.kernel.org/r/linux-arm-msm/20240803-qps615-v2-0-9560b7c71369@quicinc.com/T/
Changes from v1:
- Instead of referencing whole i2c-bus add i2c-client node and reference it (Dmitry)
- Change the regulator's as per the schematics as per offline review
(Bjorn Andresson)
- Remove additional host check in bus.c (Bart)
- For stop_link op change return type from int to void (Bart)
- Remove firmware based approach for configuring sequence as suggested
by multiple reviewers.
- Introduce new dt-properties for the switch to configure the switch
as we are replacing the firmware based approach.
- The downstream ports add properties in the child nodes which will
represented in PCIe hierarchy format.
- Removed D3cold D0 sequence in suspend resume for now as it needs
separate discussion.
- Link to v1: https://lore.kernel.org/linux-pci/20240626-qps615-v1-4-2ade7bd91e02@quicinc.com/T/

---
Krishna Chaitanya Chundru (8):
      dt-bindings: PCI: Add binding for Toshiba TC9563 PCIe switch
      arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node
      PCI: Add assert_perst() operation to control PCIe PERST#
      PCI: dwc: Add assert_perst() hook for dwc glue drivers
      PCI: dwc: Implement .assert_perst() hook
      PCI: qcom: Add support for assert_perst()
      arm64: defconfig: Enable TC9563 PWRCTL driver
      PCI: pwrctrl: Add power control driver for tc9563

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 178 ++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       | 128 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/pci/controller/dwc/pcie-designware-host.c  |  19 +
 drivers/pci/controller/dwc/pcie-designware.h       |   9 +
 drivers/pci/controller/dwc/pcie-qcom.c             |  13 +
 drivers/pci/pwrctrl/Kconfig                        |  13 +
 drivers/pci/pwrctrl/Makefile                       |   2 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 639 +++++++++++++++++++++
 include/linux/pci.h                                |   1 +
 11 files changed, 1004 insertions(+), 1 deletion(-)
---
base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
change-id: 20250212-qps615_v4_1-f8e62fa11786

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


