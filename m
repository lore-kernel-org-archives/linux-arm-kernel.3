Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E01C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ogfiyANGIl+cZdRVADkVZgm+LDhUR6VYbG3snsLbxtY=; b=KuYAG4OQfJuag8
	aBp0NPUKbD7tLJwRwjH8D4alkK1xv5jbWM0zhVjTNz4lMRHBfqTbAszbd/9dy+A1OUhzBkknSjbcl
	gnEhqHom5/WBgSVlgCQHX3pS2uCFgw3yexh3+eCSoIjP1H4gPaBF28psvyNK309GNzuYcgkIRVHKx
	2aKDz1yph21CH1zS+HNjtxuhSmKRQq8mBfHshTrWM539yHc3lRtJFA71tWCPeOfe5j2CreKROERqw
	WExYGz+yvJOLpL+AItozDC1XiwcZZekuCw/WE8LBNjsBw3ug1kPPCtPWBpYSXh9XoAPlHdbTEdG7E
	i43F5FLcmS39vWyjzCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi19h-00000003yXI-2KwF;
	Fri, 10 Jul 2026 02:39:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi19f-00000003yWl-0cua
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:39:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669JUtbo2557209
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ogfiyANGIl+cZdRVADkVZg
	m+LDhUR6VYbG3snsLbxtY=; b=m/Jq9D2HjYUNwkTHpnxE0nhPb5Nf6kSiAv+dum
	834OR7J9tZ7z7eODykntCWZsUfokm6PG6VCAG7IawYTfV7sDkAxtWG9ia+rqHauD
	hp4dxxUICfyzAVieqNt8pb4yA3BlmmcnfOHuIgzWcsdt17WR0fM9VAQ0bIEsn9IM
	AcIKG13s3ll229RQrDGavco6SD3NbWZ5uQPnoquhOWQSgX3hRPEb2c+WiaLU1wmu
	x+GxBkLRzwHuLm4iulC1nyjCvBnCZf9QgJuLVq+jb6dQfx9+ofGdUOZh+QOa7edp
	srmGkzGNwXyeiwMGKxrv/X9EOC6LDEuhLdGSIeGy6/vFsZqw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8h78a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:39:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso707726a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 19:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651194; x=1784255994; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ogfiyANGIl+cZdRVADkVZgm+LDhUR6VYbG3snsLbxtY=;
        b=dtENfm+Ao2n1itsl0hOIFd2LG2aYDJuQVN02641GUnbgl9LBy0PJGbh3z2r3IR3i9i
         vQmo77jsZqRngCGGTtTug3xuCZ7rTop0mHleoN34UZZyAMp/e6ktrvIZDDQ0PEXBFBXN
         ESeZnPP+0poB/6RlbQKlvUeN/cO3zMb5xqCJ9LuygC4tmzgLgxALQlIzlmOudE/qZqaA
         xzHmuWXEuFOq/L/NgnVs8V0wmPEfI1SlB0hs7QhbtDX/egVeXhHwFpbPXWcHn7qSSXSK
         IWrJjuYnOdbv/mrWfZwbv8sUEkbZAx3YJE+O7lCvFlbUWW2IQHuQozya8MimpzP/NpL/
         pG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651194; x=1784255994;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ogfiyANGIl+cZdRVADkVZgm+LDhUR6VYbG3snsLbxtY=;
        b=rnm0vzrftLipzqoAmrakGTnTknUoNwYXidxf8g/3QwqgbcKX6BAtgx1tNlkG12APgA
         O3LBlKN23Hl2AUyGvTNhN5m0DvJ6Y9+qDS1kmSNlmmfMgEE9J/eKiW1WBZLLJ5BqqWfl
         MlwnJX/N5fyQt1TN4lE8Gh4DdDUfSIlrvVgHlcg2gMtxmnca2Yxct0elziuNQEz7sDQ7
         mkFoPGY0UovbwooaXzofEGvF9fu6MWZ87/GJU57QyChP5JgwEoNRR5xoBVWp7lZEKUWW
         tKQCAdLAfKx+vAb9nNgMdpaFDd7zDSR6Or7vbnqlLn97zPhhyUF7rGMDUcCMBNmaKO+E
         FMSA==
X-Forwarded-Encrypted: i=1; AHgh+RpggIUSeiVxYD8qA6Gzz8ZzIgHMXkpRf6oJLP6Jsh6tn9E39qRg8kobI6mskpx1VkFl73gBRptjpAm2sC4FdY7E@lists.infradead.org
X-Gm-Message-State: AOJu0YwZMRoGTL0jAXT4rll34XPtoPxmNKeWkOZofwAIOyPJhiaUfG/m
	f6CBVDCauuagBkmhyOqsZfdTU97s1dFMmDMMgn250vX2BSXiJcNut737/Ik0/oocnOQhfHsmn9f
	o/Ht3HUkmJCbzYVFKpWjmieQ6ZLMBCwm5eP/PcPqNS44tjhkWrXp6DC3nvoFWeOdxYzLt1RAP4y
	Be6Q==
X-Gm-Gg: AfdE7cng2jLicDfHBoBckP5eIvETE5uY5/A3+gtX48kob/RZzJcA5xasOHwzGE9ZJtX
	D653YCeDP/NEQeI7EXwtRmuWsLwca6juwc7CZ+U9LcciddIhmISPFCpXL6CAkVox1l5R/fz0O8W
	GR0Q4xY0ydxTDWy/EGUUxgGZLR5RGIP+FFme/tU3EgVlGNODXokVFRO5svn0VjIEas3ZOBYqpBq
	XbDKDOs+F2E886u4H/tihuACazpKxq9jKLKPWWHN/PvPfQDfwfexeixeEnjeAZYio7TYbYj3EUu
	hlAKwSeYYJ0MeY3D3X5QSpKa23LNkJ71VQGi1oewyusLLWmeTL43+hcXHzZxPkOPUtNTzOJ5Pnt
	bRqTZ69a1ZJ8MOh6jGwuFfC1dFVvRlRzLxWVt5SnexQAgHHJ+jJ4lLyptGM/XhlZrZz0YGfnCcQ
	==
X-Received: by 2002:a05:6a20:43a7:b0:3c0:9c18:d5a9 with SMTP id adf61e73a8af0-3c0bd1cbb17mr12737957637.70.1783651193821;
        Thu, 09 Jul 2026 19:39:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a7:b0:3c0:9c18:d5a9 with SMTP id adf61e73a8af0-3c0bd1cbb17mr12737914637.70.1783651193328;
        Thu, 09 Jul 2026 19:39:53 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:39:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Fri, 10 Jul 2026 10:38:59 +0800
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVbUGoC/43NTW7DIBAF4KtErEsEw39WvUfVBeChQWpMConVK
 vLdi7NpFrWVzUhv9OabG2lYMzZy2N1IxSm3XMYe9MuOxKMfP5DmoWcCDDTTIGnK3/RSfcSxRHq
 uJfRGa1ekUUtwgwc7JEn6+bli797pt/eej7ldSv25f5r4sn0CnTjlNMRorOLOpqheS2v7r6v/j
 OV02vdBFnuCZz2gjBqrFbCkIQFf8cSDJ9iGJxYPGEduJUcnVzz55xnGNzzZPY/JBymdl4ateOr
 RMxue6l5IRggcHIbhP2+e519yVrroBwIAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651185; l=4545;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xvKnn8xG6ZPfwD57jd8SONQvv7hlfRpKuIOQb0FuU0w=;
 b=0z5kUo8p3xEnhRrNursWnU9U4wwJwwg8oa11GCuH2tzEXwMqm1AzrKUKv5EkbA/XO6EcA6Y00
 204f2jXiTrBC03u6tpMQHI+a8N+/1qGiO3hEQU5DPNyYIJesO6Y4161
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: lXmYeRFjNIwh3ALbMjLdx_bj86pqCerc
X-Proofpoint-ORIG-GUID: lXmYeRFjNIwh3ALbMjLdx_bj86pqCerc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX/OEmWokkIiEo
 zrPMxJOS7iuPHtKZ/ucsg5bmiRjLfjjHaQBXo7RuUu7RVBczjNBSKS5QuwtRsiPL4xKbmNykDA/
 nmrLTwKerO/cR3fatVGVHug8iozqk5Y=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a505b7a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eJfGDJWfQcjy8rMVS6kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX/DvwiJBzlUeh
 U4EauG+kSxytFTJY90Yj/yLJgYXadRckRlWp5hjYUAUGWOVKcSByL5bnAFoiEUc5iD81RaLjAAH
 BgZHRzC6N1Ja7F24XF1OoA9BEKlTwuzwX82LYsi6U5NPjh0b+J3dCPCPmyxvCY6szxClwunzXo7
 MTACs8QOXzSM6vqQ0wx84+deWNOX0/z15iqr+PLcC5WGTiOwo6WyzyWiDCXP34ZwHX1YUks+CvK
 tohqXAksly8vbOsU7d/Mqlini4TQkqYNVtpPCTnRR1Hq9OE6JGINL6lGE3uFf3BPgGVBs/RkNjR
 yAP0p3WReh/H8a3R4WMaYjY0UE53Vaossl9PY2oOXiTsAB8PPbpPBupreJ5CboLDdo0lk2kde2x
 wbRZQmWQxfLsJ1ZfA/4C2XI9Lh4dL28x4AeGpp9USPWqBcnUV5SG54vVBCMoCO6WASymibNS0bf
 lwyNMusPS5JR64j6tAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_193955_199761_DDDEA470 
X-CRM114-Status: GOOD (  23.37  )
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

The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
forces the device onto the AMBA bus, where the driver must read the
peripheral ID from the device registers during probe. On several QCOM
platforms this AMBA peripheral-ID probing fails, so the traceNoC device
never probes and its trace path is unavailable.

This series drops the "arm,primecell" entry and turns "qcom,coresight-tnoc"
into a standalone platform compatible. Without "arm,primecell" the device
is created on the platform bus and probes through the platform driver by
compatible string, bypassing the AMBA peripheral-ID read while remaining a
fully functional Aggregator TNOC that allocates a system trace ID (ATID).

The series is organized as: binding first, then the driver support for the
platform-bus compatible, followed by the per-platform DT fixes that switch
the affected nodes over to it.

- Patch 1 (dt-bindings) drops "arm,primecell" and makes
"qcom,coresight-tnoc" a single standalone compatible, and updates the
example node accordingly.
- Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
match table and renames the itnoc-specific names to generic tnoc names,
since the platform driver now serves both the Interconnect and Aggregator
TNOC. It also restricts the ATID-unsupported handling to
"qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform bus is
no longer wrongly covered and correctly allocates a trace ID.
- Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
fixing the probe failure on those platforms.
- Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
"qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
tn_ag_* endpoints show aggregation), so it should expose a system trace
ID rather than being treated as an Interconnect TNOC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v6:
- update commit message for all commits to focus on describe the
  hardware itself and the hardware issue we are facing on.
- Link to v5: https://lore.kernel.org/r/20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com

Changes in v5:
- Drop the separate "qcom,coresight-agtnoc" compatible. Instead drop the
  "arm,primecell" entry and reuse the existing "qcom,coresight-tnoc" as a
  standalone platform compatible.
- Update the binding, driver match table, and per-platform DT nodes to the
  standalone "qcom,coresight-tnoc" compatible accordingly.
- Rewrite the commit messages to describe dropping "arm,primecell" and
  binding on the platform bus.
- Link to v4: https://lore.kernel.org/r/20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com

Changes in v4:
- rewrite the commit message for the patch 3 - patch 5.
- free the allocated ATID in remove path.
- Link to v3: https://lore.kernel.org/r/20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com

Changes in v3:
- add standalone compatible for AG traceNoC device, allow it to be
  probed with platform driver.
- add fix patches for sm8750 and Glymur platforms
- Link to v2: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com

Changes in v2:
- address the ATID issue reported by Sashiko.
- update binding to accept arm,primecell-periphid property.
- Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com

---
Jie Gan (5):
      dt-bindings: arm: coresight-tnoc: Bind on platform bus instead of AMBA
      coresight: tnoc: Bind Aggregator TNOC on the platform bus
      arm64: dts: qcom: kaanapali: bind traceNoC on the platform bus
      arm64: dts: qcom: sm8750: bind traceNoC on the platform bus
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 16 ++--------
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 37 ++++++++++++----------
 5 files changed, 27 insertions(+), 36 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


