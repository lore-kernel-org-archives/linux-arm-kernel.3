Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787DFEA8541
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 19:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DNMdCDB4m/JS2Eqb4Zd/0G6oEd9rQSbuN+RA5pJMqjw=; b=Df1DPweE8zfmzd
	uLY7TdpEp43BXUGP5AwiF1pYNo/804NZQhz5Oo5augofia/v7sefEwrbgWH68/c0v+V/hCpFtcYyb
	lg79vlzE7ohY/5RwLgJk0e7tsM4y6sJC2m7WRYygUBhGlP13fzgrLL+fbeztD9baMw8t+5M9ntEZr
	hrbkKO9b5RcFiENvy4WTynGv85vsZTjMZwnJlBwwbytfOkxYh3ClJmt/vEIj3jZekc/wGXsfgDJZW
	kucqvVXfGiZLSPjzig7pS3VuvXh4WoysC4HMk+w4oaCoj8NvLsIaUX+KsCuP2jhLGcWZ3X0WwQeCs
	MGUxInNpJdGi0V3Q8aOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzJtG-00000006Ihd-2QmU;
	Sun, 08 Mar 2026 19:34:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzJtD-00000006IhE-2A1d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 19:34:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628JMQU12233391
	for <linux-arm-kernel@lists.infradead.org>; Sun, 8 Mar 2026 19:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DNMdCDB4m/JS2Eqb4Zd/0G
	6oEd9rQSbuN+RA5pJMqjw=; b=Iz5I4QQh+5X+EdI7ZbWYkCwMd0XsXKEgZSSk7u
	fZ9Y3l6+S7LKgAOi7D3AfsdoMASdDUtGTK7RZzHvs5t01JfUzEaojPuJ6bMc9ofc
	2/bd2VGoUOQMpwJRFzwOorskgCxsdkMtTQplIHuOzWjx8AvvZ9lxxJMGtGLNxgSn
	anN7DXhtVfkGW27Ex2TmfG1rL90bMyaGXdzyW12WT3YHHeNaHtVQP07xfglcjK+U
	3Hq+dgArnD8ScoB11PW9t66PZ9SMoa2utjEkZ1vtKayFBjoNbGSTSExpPj7knnQH
	KyxIdiH5oJAi7giVdLeW41AZ3NV+Hguvx/+DxBT7wj64Xk/A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpkb5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 19:34:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c73a4983fc0so800346a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 12:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772998448; x=1773603248; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNMdCDB4m/JS2Eqb4Zd/0G6oEd9rQSbuN+RA5pJMqjw=;
        b=CjD+wnB+YpYgzINK4EvJvjZV7J6L6tLLPo241wxbUlkGHINEWlg5RFyQeZLtXTJBhj
         a87/qgNWQuI9GM4rCe4KXxfr7Kwwqm7rzXGYq+qx5kizYp1EObr2wA4Zsih2RbLCQOOL
         n0PP42hmfmkeQbcAaH/z9Aq1eID1/NTHxLhlaDl8DV4FjSwXbcq06LDs4FIIpOjJtmsK
         kM+peorytspHtB0rMtQo0coGuMUloZAk5JEVLJWRtpPoJimNjUesdYuuNmqxpvgzLwiU
         M5HGkiEKQIHX7l18kJkA8SDwHOarr+vPT5a2uOfFbWK2PUzCtAYT7FkgIrv6ry7ukQC4
         LteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998448; x=1773603248;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNMdCDB4m/JS2Eqb4Zd/0G6oEd9rQSbuN+RA5pJMqjw=;
        b=UslGND/xGWpTibTCU9OY2fWrPTPx3rZNGiAfiR74h/oMgLqFjKRsavsvBHRmRZaphO
         2WUnbiSZ24p2q9cuymZpkSpcalg39s6Gu//EFQN1Z4AGJwdELacynBIcy/d19ZIlB4Od
         RG88cBcM2yR+g7VVGzfaMUMSnHr/2dbu7lFzaJENpzT9lILc+o98+yTnCBXn24PDh/Qk
         EXVYgC05wJ1WZ/7VizL52Xq/S65+EWCc27/j1DsJ+0SJ4scQwzX8h5sOBF4FaDbKSRxY
         UXJWH0EHEhSyBp+0ZzpqlAxexVQiQBXHBloWe9toHqxkYz084dnmG2e1DalSCa5+M4B2
         maTg==
X-Forwarded-Encrypted: i=1; AJvYcCUS82G8ZMIjaC1WyyM9bmHUS8d5m7wTd3yh8VViJvaQPYH5PfMDq/pEd1us8GPY4A8GbHgm+dsrnQ7FVMvvERxX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa6PC4AdVfz4kl6DHUqDHEwxKaW+kPH8u9MKng2YHBWwdYRAmN
	FLJ53pqAGRHad17AwvPKym5F3mbKIHd/LSOki/wcJOMDKKs33CceM2STiHYdOSvRQ5nvVAKV7U2
	paJEspR8qf5O8J2A0TdcP6I33y7yHjVGcSMQsZtMlBz8u8HzhwWEu0g3qgn/PnMddf+cF0kVzt/
	7XtA==
X-Gm-Gg: ATEYQzwZA9KUV74C6dPpWKLhc6se+VwPdpRXRzbyYRx8hi5qCJYffVu0JYv1FZqIWap
	kHvs+cKHF4etN8ceXxJp5MlxSi139z0Gv1kKEGhDh+C1Xz52Jowf/uBB5zYBV6YlaloDOcbUkDI
	Dp7AyTA4Z25CWIVDHmx24shnLDnkY1uaa+/f/hPlJUGUACrYeE6/EQuR7fjclAlTqUSdeJQNI8V
	lyKNE2uN7jhwl//WLVx1xPotKtTXOmk7iTPZLmjQFBrQHt5zHKK+Rouk0E3qply9yTLoH5vf/CE
	NWGKkUHRD+DuedFw7hKbLmXZN6ckmOhkkjJUS0zHxyd1n/VC6uvpWGhsUFqbV2KEtpWQFT6WHb0
	k5ePeWjYvCMfADMo9mW6t3Juh+oFYrGeR4mV/F42SzmkbafisdR3OrI3I
X-Received: by 2002:a05:6a00:4b53:b0:829:6f9f:ea3b with SMTP id d2e1a72fcca58-829a2e3d086mr8046026b3a.20.1772998447781;
        Sun, 08 Mar 2026 12:34:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b53:b0:829:6f9f:ea3b with SMTP id d2e1a72fcca58-829a2e3d086mr8045981b3a.20.1772998447234;
        Sun, 08 Mar 2026 12:34:07 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4676593sm7818909b3a.28.2026.03.08.12.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:34:06 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v10 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Mon, 09 Mar 2026 01:03:36 +0530
Message-Id: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDPrWkC/32NUQ6CMBBEr0L225KWKgpf3sMQUpZVNgGKXSEaw
 t2tHMCfSWYy82YFocAkUCYrBFpY2I/RGH1IADs3PkhxGwPIdJZrq42aXBCq2Q/DXCP1vSiD1p7
 zi6OmcRB3U6A7v3forYq+Y3n58Nk/luKX/qMthdLq2JoGiRBPZK5eJH3OrsfYSqNAtW3bF4mVr
 Ue6AAAA
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
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
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772998436; l=4795;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=PtTdudtjBZ/xPMrnHDRK1H9Z6n/XjfTDJSglqtupcDI=;
 b=EBb8Dk6BIlgjCH0Fqcmr+R/Zem16FjzSLlrw2KGhDvNxeYgPJwLHInLgJNWKtbmBgHLkCc5NK
 xDxh7Np2VUaB9ZsluGW3jBruuRfE5BZGHAei8UQe3BXzG9rX5bRMd84
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MSBTYWx0ZWRfXy8eQbJx8QujT
 yY0Zzyw28GL/RhwgsXenF+Xnlzh9Py5vPLmso+2IWWuThWVQcztIZlfV6O6OmMsrOmPjq/+XtZu
 VN+PXU+Jk2Pg1DEoid7xABPVZWFAaM8QzYoaBGo2SHSzPX/bOqaguSQzHZwzDSXV6Palp9UH1Il
 c8IUxzd6snV7BbZPfjLgl51svnkdYwXz+sBNTaqt94YByKYZJz6N8YhME5jBKz5VjWudP3D2NYb
 57NyXKARCVnqlyaJBD153JoYf13GAbpx/N4K25/bgidgxw3X9X7waYZYHbWDRfFYN+lsp22u3Z9
 FWYyZsWtkjXPXIIh+Es73WK1TE1cKMKirkHZ48kZGnt7A15haISf6l2nGgCLDKyzYlSb1Z3jya2
 jIjqfOJL+rnVbKmBT6cf/EGNiGUeiEEcu1hiY3ORjUzZYXJhsIB3Q7SDLV2EAgn/ybHnyaNPYwE
 SnoBzngUrt+ahexhWkg==
X-Proofpoint-ORIG-GUID: hVm7WI4qzQEV-OBs4pMAFnedk-UP0dUv
X-Proofpoint-GUID: hVm7WI4qzQEV-OBs4pMAFnedk-UP0dUv
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69adcf30 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=hUMMoPFcHhpVZiwYRzIA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603080181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_123411_701657_0FD35D45 
X-CRM114-Status: GOOD (  20.01  )
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

V10:
  - Move of_map_iommu_id()/of_map_msi_id() from include/linux/of.h to
    drivers/of/base.c as out-of-line helpers per feedback from Marc Zyngier
    and Rob Herring.
  - Add kernel-doc to document both helpers for discoverability and
    usage clarity.
  - Fix of_map_msi_id() wrapper and all its callers (cdx_msi.c,
    irq-gic-its-msi-parent.c, drivers/of/irq.c) to correctly use the new
    struct of_phandle_args-based API with proper of_node_put() handling
    as per feeback from Dmitry.
  Link to v9:
  https://lore.kernel.org/r/20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com

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

---
Charan Teja Kalla (1):
      of: factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   6 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
 drivers/of/base.c                        | 202 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |   9 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  18 ++-
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  28 ++++-
 9 files changed, 222 insertions(+), 69 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
-- 
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


