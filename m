Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B75DCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SFxB4b5152ACgHv5hL26zSRXW9kcmLQr3SA9+ZzOJSU=; b=xtPeYDDWrZa0Zm
	u4Ok3D3GA5oGWbUz2gSlLC+yGuEcudURPJkVodjFvSiS5KQ5t+SbJA0MyVbk4R95fxokkQ5c30S2v
	lKgU1srv2yGQKGCskhp6b/q3XvMUqIoA4s7CqDqY2cAUTlWuyeg94vOOaNirNaoxd6iHVUKA9BfsC
	AziFeORIYN98NcKBI3Xe6upHNL3+CbnYaxKfwYeGhtC+7fgogx5abplBY9oeQa+6JMaM9x7Uiv9n8
	K6cNg+W8GT9kAj/A4g90ZzC4MX/bpoC8nQmhIQEy68/mdmVdEAxkAG4keKJQ4DLacJekIPtbL5qC9
	z+6CUlU1Ab3PrX0bF+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usz6e-0000000BSY1-3qAo;
	Mon, 01 Sep 2025 07:37:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyUf-0000000BNoo-1rY6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 06:58:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VNTcg3004329
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Sep 2025 06:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SFxB4b5152ACgHv5hL26zS
	RXW9kcmLQr3SA9+ZzOJSU=; b=RnYaqLU9QZOLMDiXx25IYxD1RD7AFdIdoGz3oe
	ziKNbMudY/P/UPHIoEqXJ/eLZeUOLmn6OdsLFU3YzD4yDYsWT4K2Am2OKzIJwK5U
	1eNBIlcpaGsxDEIAfMxweIA/3X6+7hA1inRDqm2T78PbMpY2vhIOO4OWjWqtAmx2
	MIj9HqfP6Od3Y84g3YyvKJzfSHTviMNyvb/75H2O3MvxeSpdbwtKSWk++sgqROea
	cPgwkzTxN9BNscJXe14jYLlcYAE6D0wQPvWszeRZ/PUJHl0TyOZRSyBa7hut6Mlr
	HRGhNu97+Kn4ltjL+GiPrT55E16XtJb9sxaBXdLEvb3zAOWg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ruq14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 06:58:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-327642d9c82so4694415a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 23:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709899; x=1757314699;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFxB4b5152ACgHv5hL26zSRXW9kcmLQr3SA9+ZzOJSU=;
        b=UFtd2w+BTzdjaH1zV9b7V/gFul+Uu3MfuwI5gnP2qSmLDIX/uzBUqppTdim0+9TyTt
         xet0kcNnTsvQtJw7+3U3+rekxSpZHTl/+MebCTaENEfyX4H4GaIDTFOOglqeaVrAfsxy
         PLDY9e91YX1YCrdrpxUj2A+lQjlhHmWdtN8gXbhDailmZGR0NeWq4Q+bTX0BFcjlnKIv
         8q/JwUYbOChhBNdLiU+yi2nkmTULIc/Iyz0EGJDDvf/9hU1OoCGdsfr0piLT9ZXHIKfH
         GtnMvek2DFGvbUSA7lBT38zRYM0HPGo5Z0hPwICHnqB9CX9tapWQ9Q2cgMDiSE3S7A5v
         quYw==
X-Forwarded-Encrypted: i=1; AJvYcCVCk72iTRofyyeGXZmJ/Lt+Nge+vLRFDAay5DwqBWf1Z7pYlbTLOB0CyxWkObZgOsiIQ8gmXDs+mN3VVWWAbSPa@lists.infradead.org
X-Gm-Message-State: AOJu0YzXzmx62ktmoJol7EbiJNqq1xe62gU76T51CWJDgIsKeRtXRCeS
	UTLJ+rZuxuHRJDNykLkbTiCid2Be866fgi76yAQOWDzsx0Ufoeqdjf3u3ERebCckqwZ/ybtp/w9
	+SbLy5f+SYJfSNr19SQnQh5gw1mZknHH/eTTUGrrzHbPCVd5uzYqqF0TAJaXTwQFs08AOCGaEaK
	QDBQ==
X-Gm-Gg: ASbGncsctrX+Ar22fAExfeRvw+rs4vFAhNG0fiL/C/0OKT65YlMC4LBmO+cXntSStJd
	yLibbee4oy6WCjJZhmgqqT4Ub0EeZDiMd8pL9jNaC11LE3WnYzuz/1vVrFUjZyjoCxurnlMfmKx
	qU4VHgQpyQWh9Sg/mWwHNzDC6MEPggyBjwxXsHj1BkLlh8+xYQItuMHlMweI3pl7aYFQjCWbYEU
	JQEU2MpuTp94u0likLUoIEmuj8nEy0hb6ebh1xixJ2X519EYuuPnMZHl5OXn2AKGnNkVqVMp+sv
	laGASqIbc2b89fuMPUuYSHwsG1T4+yOuAEC3AdKgmlXaKD0P9ASekJOPSfQ4we7YaSLbhKx69vR
	+8qRHNygvUiWSL10KPGHamQ==
X-Received: by 2002:a05:6a20:244c:b0:243:c23c:85cc with SMTP id adf61e73a8af0-243d6ddb139mr9824698637.7.1756709898885;
        Sun, 31 Aug 2025 23:58:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/MJTK2LkXJkAjtOOHujdhhNAOwInpfVcCHf55Vp9xMFEF/nOrcg5TLoWZNE8rzo27oCxGzg==
X-Received: by 2002:a05:6a20:244c:b0:243:c23c:85cc with SMTP id adf61e73a8af0-243d6ddb139mr9824668637.7.1756709898378;
        Sun, 31 Aug 2025 23:58:18 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366f95asm8559358a12.51.2025.08.31.23.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:58:18 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH v4 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Sun, 31 Aug 2025 23:58:12 -0700
Message-Id: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAREtWgC/3XM0QrCIBTG8VcZXufQM52rq94junB61oSapWsUY
 ++eGwxG1I3wyfn9RxIxOIzkkI0k4OCi810aYpcR0+rugtTZtAkwkKzikrq+84aKkoEqLK8rZki
 6vQds3GvpnM5pty72PryX7MDn3+/CwCmjJZgKRaO0LeDoY8wfT301/nbL00Pm0ABbvF8xJAyWY
 VmjEAjNH1xsMFQrLhJueC2lRa00qB94mqYPNWPh9BsBAAA=
X-Change-ID: 20250815-itnoc-460273d1b80c
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756709897; l=2054;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Bohuu2nXAiF4O2/AKaeromzfaJnb02aZ3+OBrSc4vGY=;
 b=ET8jnq7cEfnTAI4blvxKkZzx0y6DFwRxd0mxO2N8ainzsfhuOU2lmKrzM8nqL0Fn00ZjlSEsG
 fJFPEVbeEInDZaAU6ivgNEnSv4eMiGVXzWaZcXvRkS1FXVTv8VXkW7c
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX2ICHl0EI07WZ
 tBYrzuTOCs1GDJMkqnNbhsuzsyxf69IcLMVRfCDqmcJjkv04gnt9b5T+ADVKWh5D4qprGVtq8OB
 Sasc0oOFheXgI4X9D52RAbRmEz3ancrQNtpw2D0wbeS18oeyfZdK0i/cGCtna5S5u/p6a2xiLMa
 1C5ZYa+H4NqZQ7JB3vtrSucFZ/GvKUEcfu4q43nGZdzcsVuxzfBW1qrj7xugR4b40W4vAKNpk8P
 CynK/7oRPBnIc3Pa1V8SA4Qwx/lC+RlyP9l5+VfPdX7jcumIG9GMfcmlN+sLfAzGA1Ax1x0kUsT
 B4gFcsGzmnxW/HOwbtT+9QPkaOwfzm+lQIRpZy/po2ifV06sRFc1G5TY9Ls4nLoXg8Q4TOiJ+wP
 rLmoxnmu
X-Proofpoint-GUID: DOBP7gv2ZpvYAN4C93OPn05wdmibaG4n
X-Proofpoint-ORIG-GUID: DOBP7gv2ZpvYAN4C93OPn05wdmibaG4n
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b5440b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=G-CQVniXWX8y_UMPSkYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_235821_493870_77BDA7F9 
X-CRM114-Status: GOOD (  18.17  )
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

This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
(Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
this block does not support aggregation or ATID assignment.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Changes in v4:
- Fix unintended blank line removals in trace_noc_enable_hw.
- Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com

Changes in v3:
- Add detail for changes in V2.
- Remove '#address-cells' and '#size-cells' properties from in-ports field.
- Fix comment indentation for packet description.
- Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com

Changes in v2:
- Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
- Dropped the 'select' section from the YAML file.
- Updated node name to use a more generic naming convention.
- Removed the 'items' property from the compatible field.
- Deleted the description for the reg property.
- Dropped clock-names and adjusted the order of clock-names and clocks.
- Moved additionalProperties to follow the $ref of out-ports.
- Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
- Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com

---
Yuanfang Zhang (3):
      dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      coresight-tnoc: add platform driver to support Interconnect TNOC
      coresight-tnoc: Add runtime PM support for Interconnect TNOC

 .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
 2 files changed, 215 insertions(+), 11 deletions(-)
---
base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
change-id: 20250815-itnoc-460273d1b80c

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


