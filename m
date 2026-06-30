Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ED2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CD+wYim3g5KeRGOfpKB9YrJnjeM2lOg0wutreaHc8xg=; b=sRsKS36Mj3bS1p
	HWht3Pe/3O183MaDEbfptY0uqdJOedbIaTjvJUwikjKN3lTZxjwbPPYG7hn9DWEkAM6ems0qTHBfp
	GA44ZOUuHtECzONdMbY8ljb+YszMuxHtYR1ad0JjVsxdN4wDKsmAxXJ2pyo9hiczrki/nRcFms0K6
	OExAzh20jRmKnCh4AeW0+eWBYltjAftrhhtNIzKZhdm5f83zwJv/KtX5sRMODn7pcz5WYveqii+/Z
	5AaQbVHadPjY4JAttB/hruwUgFw4V17VoqCev3zzgsBfl63SLnWHlTvIeY574MIgSPLJRJv9Mty+L
	DqoFSd2O18XJMLGNcG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVpo-0000000Gg4q-2rdn;
	Tue, 30 Jun 2026 10:36:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVpm-0000000Gg3q-03jq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:36:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxsP1613371
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CD+wYim3g5KeRGOfpKB9Yr
	JnjeM2lOg0wutreaHc8xg=; b=GMVYcIWLCR3rdirlMcgJrMG6ou2pg/CyIzMmeo
	/lxhkYXZYl+IFYRvw3Mq6Efj36evd296lUtkB7QrfUC+oOLFJXRg1beXlFYCw2wV
	tRXPadzziJLltEuUjY4AP+cpnVW+N24xXpcmqdbd48mxsklaaqpSbBTvmX3gwDHl
	ED/BSqkpkyrgUgAcTqtOMYYFv59pvxg7zIV1fVqj2uiGxoXqoE6ZhURvmaUIrDoT
	9aSsL+qlhrzN4ysqouNW7xCf7TndNMZKIKLcsyI6Dszvf7U57oeyZTjXOI//8IBu
	1nUDVNmRBV7/pDj26IgWt4Dn1JcP5aH+Tefp9eFscYGKF1DA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cubs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:36:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a90cc5e2so294934b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815812; x=1783420612; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CD+wYim3g5KeRGOfpKB9YrJnjeM2lOg0wutreaHc8xg=;
        b=jRXeVgpe3+Pf+qdb2t/6MAcKz11wx3fze4iNCJ1x73PZbX2zGnJkvNdURzuGNm+va/
         +FfBhA/WAphfhiGsfEcQH/8Du7B3IhLmkKc9/C6lNZOA+tHf+Y1tTDLArrpxVy/Lxytl
         QJETJUH6dOYGQQIy1qDvTrJEZ7Id+i/Bd5dOWi2qUjOrhZTQ2unwkOSLcC50rBZJ6kYT
         4fmcKaS2b+nnoAf/OGzc4Na8EpUT6/Yx/AhfB+Sni9LgjQZJSj8S09f+NzAsQ6IAcP5t
         KRhGL45BCurQTv+50rdFD0ug3IhTkfEAEvel6GNSGoJs6763SvhQvkiKLjXVTTQod0LS
         LE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815812; x=1783420612;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CD+wYim3g5KeRGOfpKB9YrJnjeM2lOg0wutreaHc8xg=;
        b=saYwc+suSaoFsudeIS3fMwZvWcTiP5TFz/u3SVZ2HyNTEBbM0viyxsAzjKCLEli2sm
         20hnY3fNcH0gYksPBundmoMeeNVuJfmq0OQcWOBuwSDUjuwQ+Ufm6sjWIpehthKqvcNV
         Pp+g13X5fbgj0KuoD5ClKiNGjRi6sbJQfR/vnJ29ewHqZMfVRnakJUxha/NCwnS6T+Rn
         ZL8YGKICrxgZgVtSBxTsZSL8cn3zOeRWFOKkdcG4Dw2uYrKtT6M02PRZNEmzSrTXAKrh
         hB2Wxx3xtWIenaORcg6zHDKmZxOvHeKMa3FwDlDC/o7yWqZ43ucRUf54ZJoxEde94Rcq
         ySAg==
X-Forwarded-Encrypted: i=1; AHgh+RqpqI5pdBkMQJHmujYByvMXAbA2cHv7ZrjZbcEhXycdTz/Hm3vdwoRsGfdgRfCLXU6y0f9lspEafg7xO/loy2YB@lists.infradead.org
X-Gm-Message-State: AOJu0YwepQ8S9vaI6QS7XL60bWKxUOS1+Jkbl0dThLTtyO1l2IUsOP/l
	weWgSI5hwa+F8Qj/zZ6S9s28uBAJAgT0OsnKFbZwYiVZ0hWIdJsx0cjJnNSC4bGxusP/2eHVNTW
	KXJPVu9jMZ2F1FtxN7HNTzTQ9MfcgD+JQjCw/jQ0VeKlqw40MEsZ80LMBFVkOK6p0XKdRmNX4QW
	MuhA==
X-Gm-Gg: AfdE7ck/irUVQLYcmggoiFaQ8/Mw7/IUxxHRx0+nFa2md4FjOx2YBnUWZtnivBSP7fu
	hIQjIH+i1xN8YYYtSNKqT3d2FsusNIuWzpO29UUvMrrX63p/y1WRD4bAO3Sa4HDk3r1o2NEKoO2
	hvm8phOxujx3+zXqzspANcOx7ShMkB8pUpGshIzywd5cG35J7fDvPqkSZdcagC5acZgK12U/d0t
	GHu/ypiTYEAB1j3hR9/bQo3WtHHDYT5MZJO3og65Is9IBr7euRQe59gCo2CEZJ1b52FyQ25+7m7
	uC9XDzIGfAvGtdZneZczuQqHsPV6Pql+JfnwWq39FRbdXqD9HvkktVKE69k1m0exiQhkOERh+Vi
	1Re7MMhkVmkrcMCwVAQ8K1WQiE7dyPnXHOoeHfZbfsEkf/SNZ2MreOerCEjaQcWLOhnPvJ6Jk7w
	==
X-Received: by 2002:a05:6a00:22d6:b0:846:7fb0:4ca2 with SMTP id d2e1a72fcca58-847adf3995cmr102335b3a.61.1782815811715;
        Tue, 30 Jun 2026 03:36:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d6:b0:846:7fb0:4ca2 with SMTP id d2e1a72fcca58-847adf3995cmr102297b3a.61.1782815811149;
        Tue, 30 Jun 2026 03:36:51 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:36:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Tue, 30 Jun 2026 18:36:02 +0800
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOcQ2oC/42NQQ6CMBBFr2K6dkg7QgFX3sO4KKWVJkKxA42Gc
 HcLaxdsJnk//79ZGJngDLHraWHBREfODwku5xPTnRqeBlybmCFHySXmYN0HpqC0GbyGMfgmNYh
 mA1rmWLcKq9bmLM3HYFJ3V98fiTtHkw/f/VMUW3pAGgUIaLQuq0LUldXFzRNl71m9tO/7LB22u
 SMe9SFwKCtZILcSLYo/vnVdf9y9rGsXAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=3537;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=eA7ljmvwdyz4++w7TMf5zNrwXiZ0ZeNDR79ORRuve74=;
 b=us708JDKd989MRvdEFhDMwSypM9Smnu4pAnvSPNooABmIn3xgUDdkDPtxaAm2FeORLtRDlx8T
 iypniJuVSYsB7VsZl8fxdqq3dU5I8DFI5B+GrlgljCg6mcVRzxUygUP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX92inDsW436wv
 Bn3wz1o8o5/9Pz2xSzO03fg7R7et8Z/sqCEN/LRlRdV3dxOMTzf6yKsloixhFuTrN9hioCEtBcW
 JnK6Ywpw7Hft7hnX1FS4Zrr3CtrTmPKcb1uLAf2B5nhAou1JHteezg/F0ZOX8Rk9UExEsMljlgp
 ULrwueBZtYV1CleliQTJSAYFXL8+i1T/szAS5CNoT/AkKAXcMlU5rwpN9v7bSsuH03IEPnq7TaR
 9thREx9BHBxUT7DFNx9vpbRh4vVXKSXBMaTwibdafcwpXUJIyOrUJot7epIziZsmD6xgCn1V8QO
 /TzWgt/+I4J49hfeNt8d5sqK1RNLs4XWCwW/qQRodUq9oBnmSuJc+ylxhXLZAMUyvwXn9hjckcY
 HDBdohj9be8dS/n9i4Kj78Kz+qqmwH+i455dWShkkQdpuF5j7rY6sH2ai7s4utL2eC/xI3Vw7Sf
 LfLtnzH6GT3xVmoF8kw==
X-Proofpoint-ORIG-GUID: -IXNw1QM1ZZWzInaV6qBpa_l83UiM4TM
X-Proofpoint-GUID: -IXNw1QM1ZZWzInaV6qBpa_l83UiM4TM
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a439c44 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CPxOtKTflHPnepyb4PMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX+rV38WMFHSwT
 cZcjzPncraVo/BMoGjXkm4ivPE4L3uvYpU5nkxT+1KXPHEI7cnzGHXtjyny7zFf6TYfyL9/6Qen
 HMMQfzuHxwFgqYULHV/gXVYAruas/3w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_033654_181020_56909C91 
X-CRM114-Status: GOOD (  20.57  )
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

This series introduces a standalone "qcom,coresight-agtnoc" compatible
that describes the Aggregator TNOC as a plain platform device. Without
"arm,primecell" the device is created on the platform bus and probes
through the platform driver, bypassing the AMBA peripheral-ID read while
remaining a fully functional Aggregator TNOC that allocates a system
trace ID (ATID).

The series is organized as: binding first, then the driver support for the
new compatible, followed by the per-platform DT fixes that switch the
affected nodes over to it.

- Patch 1 (dt-bindings) converts the compatible to a oneOf and adds the
standalone qcom,coresight-agtnoc form alongside the existing AMBA form,
updates the select block, and adds an example node.
- Patch 2 (driver) adds qcom,coresight-agtnoc to the platform driver's
match table and renames the itnoc-specific names to generic tnoc names,
since the platform driver now serves both the Interconnect and Aggregator
TNOC. It also restricts the ATID-unsupported handling to
qcom,coresight-itnoc only, so the standalone Aggregator TNOC is no longer
wrongly covered and correctly allocates a trace ID.
- Patches 3-4 (kaanapali, sm8750) switch the traceNoC nodes from the AMBA
form to the standalone qcom,coresight-agtnoc compatible, fixing the probe
failure on those platforms.
- Patch 5 (glymur) switches the node from qcom,coresight-itnoc to
qcom,coresight-agtnoc. This node is actually an Aggregator TNOC (its
tn_ag_* endpoints show aggregation), so it should expose a system trace
ID rather than being treated as an Interconnect TNOC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
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
      dt-bindings: arm: coresight-tnoc: Add standalone qcom,coresight-agtnoc compatible
      coresight: tnoc: Add AG tnoc standalone compatible to the platform driver
      arm64: dts: qcom: kaanapali: fix traceNoC probe issue
      arm64: dts: qcom: sm8750: fix traceNoC probe issue
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 39 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 35 +++++++++----------
 5 files changed, 59 insertions(+), 25 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


