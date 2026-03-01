Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DCFFD0056
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 08:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h/J87S3x56AlWUvhsWA468cx/T1N6JOg3YVREGRvJqA=; b=dJ2AfLdb3J3zeD
	+CJazcXnPv6DIrNglePEo+VdYZHwqa4faKvI97ADtngrDH3AX1GzJ392SSgT52lpgi0wKVDCODN5i
	ArMyMQSBAzuwes/gMrMXBfWHnzWeusTfhB7+LTfs4+Io9nSQebAULtyqJ8R+luwr3HED2n7HeBIC+
	UI7irt8HKxKkTYuOyofDS/k3EVOVuacwFl64EFiEw1wlq1ZAEx3+h7IrZXK0PT97315EYsMWG4LCe
	37Z7ksaMV+Q4gGWrD4CZGzJ+I8ZkYpPVYQMIiiLhSl4qmHrgVPXA/1hWO6r9xQxCbcaFN5yK7P/bc
	UlnFDAO+M1ng/HsfgkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwcHd-0000000Axw5-0tT9;
	Sun, 01 Mar 2026 08:36:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwcHZ-0000000Axrn-0J5K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 08:36:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SJNM843251330
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 08:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h/J87S3x56AlWUvhsWA468
	cx/T1N6JOg3YVREGRvJqA=; b=Soibzn4N/ZkM5J3qoqIornB47kjVSoW4OSYFdA
	JxHI+jCEFG5AvcKA6uqJnh2JesMWopy+nx3HDqBpTUvNGDuFejcPfcLe9Wzv31dL
	lZmPlWfTua+C1ln4pDhPH3wO0uF/KAKlbaurOU0Lyvb/HT3LlRYDU5RicRjeIINR
	QpXTC9yyk0HMnRkljCIyNpxDx3575VsDL+yiy4jgj2xHmPPD5HbYk9UXvz0mnraL
	sorBjyjDTyJXLHZLUZX9b2mC5nbJ0Wy1mT6ghkzAsD2FR+BQU64qTD44WcqMK0f9
	o5vQEB9V06sSulMdm2F48Z6RTI7ze1Qmdf4VUiOntKatRtgg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg72btr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 08:36:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70b6a624bfso2033667a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 00:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772354166; x=1772958966; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/J87S3x56AlWUvhsWA468cx/T1N6JOg3YVREGRvJqA=;
        b=MCh3V0rn+o/w7ruL2U5qqFvny/SVdYXKnXrpdJ1dx3/IeDRPbkFcAf02AI/3eHAjc7
         auiRRtyZ9aINlqp5fkm7Ajuy2VShMClEJpuIIAUYjgjkwnz/ltfRpKSFVRwEoRHTpE/6
         e/xWUtPYqllt4TOop/4JrPHCeMM0t5ybtuqhgAleg4+Z/XO6A7HlnPWu2NhmhROKkmV1
         4u3tVnsFicUarU+QE8xqdpkkC2iHns6398PaSttcmnJ4UpQXDHxFN75zTbM347kAlOPu
         hRgqsLlMnI5QpTcIT4dtqCuYeUet25ziN8kriEI+BQ9eR2IzB6RuIWiabcaswKgIAvPp
         QOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772354166; x=1772958966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/J87S3x56AlWUvhsWA468cx/T1N6JOg3YVREGRvJqA=;
        b=smAgRYCtySvLXHzOX+mwFOqBcFDTpXF34eMaPaJSlNEC+s/TqEqZziFS3WnSJlQLX2
         FAOYGA//5agKhmqiSF49L9dPi5Grr1UXMZNMDH7RV5Bt22BmPFMIdP/TXM19xZL2jgES
         D3YMuw9818gZH11mxFsa/nG43LzOlXKj5U4dn6G/M1glmTMADvcdfswZ2WSGrEyhSTrD
         /TZo+VbTOgV6rELMVLA/HSRoSWF7PkC804gLzxg0LQd31ap2pIeI+pVsvezmqFPJjDs0
         TlgZTXbcDAuW6E17MNQy6+fD3r7F6choLl0i/kMEKu9s7+MMAwR5xkudyOZD1ZF0AywL
         DQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCUF6fpAcD4hScVQ5Ep9Cf8hWd6DfWi53URG8dVHw+U0KPZYwb6rFTMpDkvx+qEy/s27ZHtN4tQweJ9OXSyUvVvi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx01XZrubn57/Gp7k8IVNDiFEFGm+b5QSflzCNa5ZhTZUofugW8
	nimQcw0vSQYYXvmgfj4tVvZm9SqkK8XCUVJ11zzO5q2O3L1aCZJ0cv7ydT2TbffaZSfI3U15N4Z
	j0gLXg6764AqetZgf+9qQ4DvoddwYHmLRvUdfdF7nei7/BtSQLiAhcQuMdHzGyYMfJEDRlB8r2h
	HlYg==
X-Gm-Gg: ATEYQzyvrPv8AaFVbClgaN7fViOZmA/5vdxb94nLpIJ40PdVK5emlxIt17QH3kAItdX
	bLuX5OPRDlQm9hEn1GH3YQGrrdLsxnW2PnT9V65gBhv2zZGHYMNPXnhdLNRc25Sm4i88wMftG3f
	CEvvuJKEOMLulbxC4L48vaU3WJ3o8rfTnyq/wK6dJN+GNzrXqlnNiG83D4040y5cQIucyidDvPm
	0t2GC+mqfl5VyukJ+p3wOVSt+Rghs4C8GFCf4ipzJZb03GIme4s/UURW0/o1SqIQhwBRBL/075/
	+gTlVHWbBIbwGFuWR+A5FFY1fKD04SV9fxd7eMd1MvXHsaGvzbOY61Q42Y5Zr3ZiS/CvXuFORCW
	X0DwD9iJ26qN487iVeT49/nUJygvrs3yc4096enXUTkeiBM15aq1Vgh4s
X-Received: by 2002:a05:6a00:1d14:b0:823:1444:7873 with SMTP id d2e1a72fcca58-827398630afmr9488131b3a.32.1772354164634;
        Sun, 01 Mar 2026 00:36:04 -0800 (PST)
X-Received: by 2002:a05:6a00:1d14:b0:823:1444:7873 with SMTP id d2e1a72fcca58-827398630afmr9488110b3a.32.1772354164035;
        Sun, 01 Mar 2026 00:36:04 -0800 (PST)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa82dd09sm9177300a12.28.2026.03.01.00.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:36:03 -0800 (PST)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v9 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Sun, 01 Mar 2026 14:04:18 +0530
Message-Id: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAr6o2kC/x3MTQqAIBBA4avErBM0ob+rRIjZVANq4VAE0d2Tl
 t/ivQcYEyFDXzyQ8CKmPWZ0ZQFus3FFQXM2VLKqpZZKHDYxGtpDOI1D71kop3VTtxanyULujoQ
 L3f9zGN/3A61zjrxjAAAA
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772354153; l=4172;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=H6nPK0TK5n+SrUMyTi0tJArgcayT5+iAOxNLWT6jD+I=;
 b=0138PH3DyBpH6CTf5Gshrd2F5CdUzVc0F0MxX4wX0mhvTjGvGhC4k9OE5ekOV5Mibl6bnxqrt
 Gf0jdcWnaG7Anf+I2c3nVSolMIhssmbuOeaTts0urN2JZSagf5VqNQT
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: bknuq-uJkSG1s491BPNvr76k-rasbeRY
X-Proofpoint-GUID: bknuq-uJkSG1s491BPNvr76k-rasbeRY
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a3fa76 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=hUMMoPFcHhpVZiwYRzIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA3NiBTYWx0ZWRfXwVDnoaZyJ/7F
 VKEC4gZmsdRQz5V0ehDWSCuZf6Ojkkmk+sVWF2DS4t21ZU7dOymDwN6GTdNCu0gvI2zr24E5Cf3
 GZFe9Xh/xQHNpjM8vk732X/hBQy92cHuDKP8mFXQ2z8TsUQRVg//IcphlZtbATwK1lCYJCY8mQB
 WVBrrVB3sLw21WV/3XUfCfKY5wdGi3LDgmnLTYcOsQguZ3CMyWVvdZmDER5gZpHLx9ntVFxKmto
 da/ZQSsrErfe1bMYjfYypb4Gz9w0Z3I4TzHwURaeLSCscZWts1oJVTn4fGP8Zk8trX1k8UQvTC7
 0MTG4dHVUJFNBNXR3mDrru8wOvycXdjsQqpKwM4ykSbWfrng5OWetAL1hOMEXh0n1TPZqL21uuA
 Jk9hhMxPNvLFpgSAZDhZeC5ovvCXHZP7/Q+Q30Wk2q37w1V5zIXHWY6QLmneD8/3wk5VFGSbvZ/
 lHsByw+vBr4lAy1QWSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_003609_724419_76C0CA6D 
X-CRM114-Status: GOOD (  19.81  )
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

So far our parsing of {iommu,msi}-map properites has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use[1] in being able to map at least
single input IDs to multi-cell output specifiers (and properly support
0-cell outputs as well), add support for properly parsing and using the
target nodes' #cells values, albeit with the unfortunate complication of
still having to work around expectations of the old behaviour too.
							-- Robin.

Unlike single #{}-cell, it is complex to establish a linear relation
between input 'id' and output specifier for multi-cell properties, thus
it is always expected that len never going to be > 1. 

These changes have been tested on QEMU for the arm64 architecture.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/

V9:
  - Updated TO/CC list based on feedback to include all relevant
    maintainers.
  - No functional changes to the patches themselves.

  Link to V8:
  https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/

V8:
  - Removed mentions of of_map_args from commit message to match code.

  Link to V7:
  https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/

V7:
  - Removed of_map_id_args structure and replaced it with
    of_phandle_args as suggested by Dmitry.

  Link to V6:
  https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/

V6:
  - Fixed build error reported by kernel test bot.

  Link to V5:
  https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/

V5:
  - Fixed Build Warnings.
  - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

  Link to V4:
  https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/

V4:
  - Added Reviewed-by tag.
  - Resolved warnings reported by kernel test bot, minor code
    reorganization.

  Link to V3:
  https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/

V3:
  - Added Reviewed-by tag.
  - Updated of_map_id_args struct as a wrapper to of_phandle_args and
    added comment description as suggested by Rob Herring.

  Link to V2:
  https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/

V2:
  - Incorporated the patches from Robin that does the clean implementation.
  - Dropped the patches the were adding multi-map support from this series
    as suggested.

V1:
 https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

RFC:
 https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r

Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
Charan Teja Kalla (1):
      of: factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   3 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |   2 +-
 drivers/of/base.c                        | 148 ++++++++++++++++++++++---------
 drivers/of/irq.c                         |   3 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  12 ++-
 drivers/pci/controller/pcie-apple.c      |   5 +-
 drivers/xen/grant-dma-ops.c              |   3 +-
 include/linux/of.h                       |  33 +++++--
 9 files changed, 152 insertions(+), 63 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
-- 
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


