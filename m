Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81510C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUm770nsjTk7RKaqGJXS/UXMbcC3CLIfXaIBHht8qoo=; b=lNE6atfPYSTisLl/r04dUbt4nV
	50RgNqcf3KNBFzf5ajpceSeb8M3F8RbG9ELeKG2skVvhXH/b+g1ilVfwZAuDvYB1IwYK5duHx0Nhb
	6MCaEadjaYnD+4bMMeFpJKyYR9lQSYJGnGs8fVPDsnPWlYRdiFhUpbLGmtVrMZ73rbOhrLbdxcqhm
	kVliGJS51gq2aqj+fg42SGUAhYwtLwCvD0z9EBq7BfA8f89pkYh+a0VsOl7Kgi5iZFKLh+F88PF3V
	4Z4Fy09/EVVpjfLtiY6BT3vu/uQq8d/s3jD0VQxjNcuYmbj2Q0jMB+kLu6MFhPQrU+W1MnRRSZDkR
	56zHDm4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUBD-00000000246-3kEA;
	Fri, 06 Jun 2025 10:20:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNU96-000000001s0-0kiP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 10:17:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5569HTgF012952
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Jun 2025 10:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MUm770nsjTk7RKaqGJXS/UXM
	bcC3CLIfXaIBHht8qoo=; b=W/8NzpW0F9AfIenOSQKcaHAtJd6pwGHnLQ78YdyZ
	VRa0/MQkCsHkOd05mCswdst64V2qpJjZbOf0Hqh3w1gjcq4siRG8fCEIn3blroMS
	AkU6oTlRt+c8EZI67XOllofobWQ7GAizeV2l0rhhTYLVFLBgoR9AeS+wYaGtjIZs
	GKv7HFBC3/J0UBIqyRIUkIwcTf9VnkN80hEc31kIUThXYYeJaXqWN7oUSgKMSGQG
	V0VvQfcTJUMkssvLnMV5MO337dGkbpNd8wFQom6S+aZeqHf/JYdAaNeTDY8zq3mM
	rofkJBm+IznBjcgn34id9RcF4n79GuZ8Thl6QmmicpyZaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202whvt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 10:17:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234fedd3e51so19064405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 03:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205073; x=1749809873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUm770nsjTk7RKaqGJXS/UXMbcC3CLIfXaIBHht8qoo=;
        b=e5ipRYHapGmp0kB+QpPKLoO2yWWAmhvZ24AFs042/Iqs4VMcWNQdfRvlGii6menmzX
         k0GuCGPOlv2dKMHQdazBQc30PzZWJ9IyXcepEbUljlCqEtYodBAPJSJLhDOBubz0qmJ7
         s9UqMOlUM1hHyk79SZl36Gy+qLNbVBbm8mvpyQhbeo5WHLvT1UJPpaZtfaY12XBrh8lA
         Lqbin8hJxVS7zL+afpy210/aoxVp5/QR2zJfdiZZ41c4X/uM534fe2pims3pcVQgh+JS
         kZKM/oMA08OH8bZre3mAhsgtdVgdxe+9iYISs6MsD3OZuidX+bpmZRewnkAZyH/LqkrX
         VC3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjeYUADeEe2YQ2PaYqfeIiOMf4PRiAGXRxaUnY+71rzYr4kXW8w7RmOQYqXF+mtEqaFqHTI10KL3hpbyIK2Scd@lists.infradead.org
X-Gm-Message-State: AOJu0YyLZeCMGNwr4uaZXPK7uId7b2O2PNBBocikmpWCzjfdoG2+q5uT
	SN5jQk5NqzLXgpdAb6TiZL83YLKP2Ydby6NMUtY/ckqODgYCVrVeypf2UtGjqR0c+h8z1Lu/XRy
	9N3A0JtnxXcJ84SM627mxNdyvpOFkTKMEJLIXQ+xwPv4dx0pSfcGkMlBikrrjveGpItCet5Q3kW
	HmQe3WleVycAcCy/A=
X-Gm-Gg: ASbGncvIJYl+9gHdVpL/uIF9/W9unuQ1FYuhTZ2LZBuMZugpNomvb8QJc+tTJ4YOxsi
	AoeIwFY+6eAtQbVZhYcfqXIC6BQJQxseuxPFbiptxqvxkxibx6KD6ZDN/kcvG97f8RU78f1RQHF
	TUdxuowc/Bgf/cLUca0IONrkJRWqNyWt66LuoOqSbQWDvtW9ZciEy9QX+x6ktXlJh5ibggopP4W
	m1VVX3V5MsexTdZ4cQgYqj15J8Dq17vlqpMblume0YgWO2RRfLadQbnIQ9VBj5UaYEU4l9rPZAN
	JWrBmaEg3k6xmMe/5Etj7WelxHnwyqrkGFtM/vftL0pDFg8Omdg+fEAtvr4=
X-Received: by 2002:a17:902:e5cf:b0:234:d7b2:2ab4 with SMTP id d9443c01a7336-23601d038c2mr38586475ad.17.1749205073609;
        Fri, 06 Jun 2025 03:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWEq5utuN+xciTxdEM9oY6Q/JAcry9JQaMjmy2DyusLiUkQ5pFcrFEA1HGQcbYN9+4KF154A==
X-Received: by 2002:a17:902:e5cf:b0:234:d7b2:2ab4 with SMTP id d9443c01a7336-23601d038c2mr38586135ad.17.1749205073233;
        Fri, 06 Jun 2025 03:17:53 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077e9dsm9466565ad.1.2025.06.06.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:17:52 -0700 (PDT)
Date: Fri, 6 Jun 2025 03:17:50 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aELATuLue/Vs8lHz@hu-qianyu-lv.qualcomm.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-6-quic_wenbyao@quicinc.com>
 <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
X-Proofpoint-ORIG-GUID: pLJ5OfZBG1gMkH-k2PVDWTx1gf9rEWZl
X-Proofpoint-GUID: pLJ5OfZBG1gMkH-k2PVDWTx1gf9rEWZl
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=6842c053 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Kn45tV52aVggcf7Ks3EA:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=xwnAI6pc5liRhupp6brZ:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5MyBTYWx0ZWRfX8ThQ+c0qcmYg
 kPoxU4m7zrFbuWs3e2+USh8WW3Tr9Kvcv8URx401lH4b9nD1M14C4lwFIUR5o8bmV991eFPH95r
 nyJbVyxmfPjH4P8B7V/16Z5Mvt4uMGOFx0UvhZzko1b2WxwYCZhWEtSKr48qzfIy8g20TCepPf/
 PXHkRltLgYqmOSGKPw4TPCT9K4Q+mYGJA/TWJ6L55AKJ3h7eJRQYbZmvgrjyzDIcOPWhKBgdJFj
 f0OcEpjsOQ/CMSltBVhdt+GgoDswxmv1jyPLDRV7k1JfGooY5JAnSYEMLKFBknIH7F0K3th4XQo
 i4eO+09DolinNN5Dfo7Ps3NYfNe4FPTlci0GusrXjZTmk/ia2ajlS9W/VHo6nGtssJVlK2/WRMT
 pqmG7wvLModHrp4gXfLNbE8jtthDfoCgsGAk+F2V0rysExWCF490g8YZS33sH9B5xZ//ftc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_031756_330564_9DBA2447 
X-CRM114-Status: GOOD (  26.84  )
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

On Wed, Jun 04, 2025 at 05:10:19PM +0200, Johan Hovold wrote:
> On Wed, Jun 04, 2025 at 04:02:37PM +0800, Wenbin Yao wrote:
> > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> > clocks provided by the TCSR device.
> 
> As I just mentioned in the thread where this is still being discussed:
> 
> 	https://lore.kernel.org/all/aEBfV2M-ZqDF7aRz@hovoldconsulting.com
> 
> you need to provide a lot more detail on why you think modelling these
> supplies as PHY supplies (which they are not) is the right thing to do.
> 

TCSR_PCIE_xx_CLKREF_EN is not always in TCSR, they're custom
bits to enable pieces of the distribution network. We always classify them
as "TCSR" even though they're not always in that module.

So even if we put the QREF supplies in tscr device tree node, it still
doesn't describe the hardware correctly as the hardware itself does't have
a unified structure.

Since the TCSR_PCIE_xx_CLKREF_EN is only required by PCIe, why can't we
model these supplies consumed by TCSR_PCIE_xx_CLKREF_EN as PHY supplies,
treating PCIe PHY and TCSR_PCIE_xx_CLKREF_EN as a whole.

> Also please answer the question I've asked three times now on how the
> QREF supplies map to PHY supplies on X1E as no one will be able to use
> this binding unless this is documented somewhere (and similar for other
> SoCs).
>

PCIe3,
VDD_A_QREFS_0P875_0,
VDD_A_QREFS_0P875_B,
VDD_A_QREFS_1P2_B,

PCIe4,
VDD_A_QREFS_0P875_B,
VDD_A_QREFS_1P2_B

PCIe5,
VDD_A_QREFS_0P875_2,
VDD_A_QREFS_0P875_B,
VDD_A_QREFS_1P2_B,

PCIe6
VDD_A_QREFS_0P875_A,
VDD_A_QREFS_1P2_A

> The fact that you so far have not been able to provide an answer
> seems to suggest that these supplies need to be managed by the TCSR
> clock driver which can handle the mapping.
> 
> > Hence, restore the vdda-qref request for the 6th and the 3th PCIe instance
> > by reverting commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> > qref supplies") and commit eb7a22f830f6("phy: qcom: qmp-pcie: drop bogus
> > x1e80100 qref supply"). For the 4th PCIe instance (Gen3 x2), add a new
> > driver data entry, namely x1e80100_qmp_gen3x2_pciephy_cfg, which is a copy
> > of sm8550_qmp_gen3x2_pciephy_cfg but uses sm8550_qmp_phy_vreg_l instead.
> > 
> > Fixes: eb7a22f830f6 ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> > Fixes: 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> > Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
> > Cc: Johan Hovold <johan+linaro@kernel.org>
> > Cc: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> 
> NAK, for now, and please don't post any new revisions of this patch
> until this has been resolved.

OK, I will remove this patch from the series if other patches require
updates and submit it separately when it is required.

- Qiang Yu

> 
> Johan

