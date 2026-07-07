Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970EAC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P/NAFwP16MMpi8dk+6Qh9QW68OCZTPeTA8N4GMACQKQ=; b=t7lzonYPpwD+X9
	xEemtoh10UHpW/AhGOoAkNIjggpa6DyjRh6Jnxh5FDZ/5qlX04TLhv/oNfxCw6647Qd7gIc7dH3q0
	5k2wYkhlrPi9sKCC9KnFBIf1pZDUdmxD0+5CONMBLTbB0uQk2LdYgYOt0eKeMxqV8FIh7GDx0KR+/
	gwHQxdb0w81WcGEnDGGdW9/elrtTjrAVk787Qzl29O2P3+sXNhOdOFrimRSs9S0XnQXa7aKzc7rcR
	RPOQP/YorWC3lEa+hkdHv1FCpupWMYiX3/cLQwm9hVtBwmv93f1EVdN0bvraYC/8+LOysxnn/G8uQ
	vPMjqQTX+QopCKv/U/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1oA-0000000Ea45-25Vc;
	Tue, 07 Jul 2026 09:09:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1o8-0000000Ea3T-1Wr2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:09:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DZlP3219256
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 09:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P/NAFwP16MMpi8dk+6Qh9Q
	W68OCZTPeTA8N4GMACQKQ=; b=H3CNG3FUlwlw1pexLbmP5mnOkaUzBe0dyAv0HX
	HH7RXIVZ1nlR07U6ihuMRTkTVvg7okIWWOB0N7RM30Q3tf6Ir0DAgRjeB+tvwGN3
	l0abiI5Xj0ITSzze5lKL7NTf7Pp300oFO4vnOJmTZPwMMvkXT+XkGeoZLKNOYzk1
	n2c5nhluBBcUhT5NkuRd2U3jRnnJ2MgSZQ0zPPs8u/rk0JLN7ZYsI1cqJxTLYMgi
	pZb3md61Vycbco4rAG3kVByCSImiWXqsZ1uwb1+zVZnzn/2hnbCsR/j/S4Pe9mGX
	Fpv14qosps356Zw3VtOq6UhPyrW8Y/ylpg7svUBa7ODH3mQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep0ams-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:09:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso8044592b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 02:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415375; x=1784020175; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P/NAFwP16MMpi8dk+6Qh9QW68OCZTPeTA8N4GMACQKQ=;
        b=TdujgCQN1ZJxq5+PK6Nh0H+t+kKLTpzQxuBzurzE7jjA+ocuQtNPTdLnfaZcP7Ykk5
         69yBDKCyBBd/tzI4hHjFw2G/sRJ1p64mRnH8vpJxTxKpbQdBXAe35Pd0whX7/m6DZOcx
         YnzNkEKwZPd1YcFOf7V7o+RxkvzlKVGIpT/PDYj+LNGxRH722ykluLPeAdcAARXs5mBO
         8uwNadJTBuK6CM5NiO7X8nVnp4TbufEyNjb9iD2ttETwfsIC152y7TtFTh21cH+hkp9C
         1qk04RdH/Z9idy+1ilwZEOgZI6B7GtKqH7PVFDLrWkganLi6gcVcEqGyKRanWgnR8SlN
         YTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415375; x=1784020175;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P/NAFwP16MMpi8dk+6Qh9QW68OCZTPeTA8N4GMACQKQ=;
        b=cif+BdmXNAK02vd4wDIzPO2WuXjh21crNrSGFO5RdGedVI+f9gDdGVvc3S4v1JINr6
         5oKBHfqhou+iPYUX0bAMBBgz+itMrCGGIUaENEVxbC2tlW7vBhvWZiacjRcDgparbsKf
         taa22qJfb2U8qTjxGAtNgLouC6FlLyiOwMXiO6pFgFfRMCXI7If021cwnvgL9wAL4JMR
         ED3amM1D4RBTEg7uw1nNJ3siNe1hO6PFfw0/6YZ0vvtIxjnF0ZcLuUZilqi9hVtZDsAC
         FWAvJkowqx3nhv9aQ4rG/D/vlhxqsSrijBJ9FMQy66hv4wH6PtJVNCwIQV0ohWLo0zX0
         Hvbg==
X-Forwarded-Encrypted: i=1; AHgh+RoJlzmBPfHOr6EhakskeAFGyU1ShtY7hkj3AROFn0SF+ooAzmgpTu1lfmPnfgLays3owt3OVav+a5miaeLqnJTp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+eQmyZbiYFR8er7wr8KpOS5sEDWvdNgq1iDqb+Kh3Xx6SknP+
	5u12dwfaJ0vYzNGJnq9JTj5Rcao+983IwtLV1K+2qaM+YoGH6CTZQmHi8xyQgOXz7qutDr5bvRX
	lJ/fTYkZ9gD7t9oKqcqR21aRNikHBM9BVktSk8e3lV/zpAGSH/WuA8cMr3/+hZR8i9tB/gZm7dr
	rHew==
X-Gm-Gg: AfdE7ckvLoTxp8yyck7JuENQgzt+sWoThNY3pwSPz8gYgtfoF2Cy2Noqqj2oIHRsHzQ
	vEI8a0wAllbQ4GRFlUqbvNqCwGSVmL5sNMdsxZefyniaHgBxS/VXUATMn1rWFk0a1a3AQtQw53l
	SreJYNfQD8pUaXyXKsnJ2gyv5pKWEDA3s53Bqk572STj3ogN72n8F2/Q8FqrjwtGPpAzwkh+plm
	r1rzclz8pIvYqWDjBufFW4upn11Aa1aebj8jxa+2+4jcUAWFsdSBznsaOGe9ypWmNdKoC25+d79
	fqVQdcmTLUybD1UYV7hRmHDANXqgiFRnnh3Cjp9cTU2BhOIajvtv+soCQ00lQwh2AtyRdJhrdA2
	2HsKIdK3N6YQyuJkT5/ly73x6nkS7mG0hTsVkOzovVDpDNt7vJ2WgOPZKgP0B5zWUnQSB0m1WfA
	==
X-Received: by 2002:a05:6a00:4b0b:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-84826c1e0bbmr4186008b3a.6.1783415374753;
        Tue, 07 Jul 2026 02:09:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0b:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-84826c1e0bbmr4185953b3a.6.1783415374126;
        Tue, 07 Jul 2026 02:09:34 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Tue, 07 Jul 2026 17:08:48 +0800
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLCTGoC/43NwW7CMAwG4FdBOc8odt003WnvMXFIU2dEGg1Lo
 GJCffelXLbDQFws/dbvz1dVJEcp6nVzVVnmWGKaamhfNsrv3fQhEMeaFWky2hBDiBc4ZedlSh6
 OOQ21UcpZwBumfnRkx8Cqnh+z1O6Nft/VvI/llPL37dOM6/YJdEZAGLzvbIu9Db59S6Vsv87u0
 6fDYVuHWu2ZnvUINHTWtKSDoUB4x2v+eI1+4DWrRxoFLaP0fMfjX6/T+MDj6jkJbmDuHXf6H29
 Zlh8cpymrtwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415365; l=4279;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Glg9tGvwRHTm4aaAWYZK2xSaJDmf9qc/Es2Fhj0kHBU=;
 b=KhMUCBqaORwT26jbahQIaOf9vDYgsqZarWJ/WMGkwL/eXAfvjxQjvnnMecG5zH/BPmcqy5Kh/
 Av1ph3z2bvVDiEYYNHBOByZVTCiUhj7PjZLJpCNZIsndyzj/evkv4yY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: E41Be_5JvVzhkg1VtATXaTwexrHH1jpi
X-Proofpoint-ORIG-GUID: E41Be_5JvVzhkg1VtATXaTwexrHH1jpi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX0f09NfI2KOCp
 Y+rcYFGAC2E6oRBjUqM3zUQ488lOvZhT0gukWqwsinmiezD3DOfxzz0A27J4FI/O5l/9/Fc+4R+
 QUQ+G0Y80et6Tv+Y7npBqo1lotTtxy4S6/E8nVDIAAy1VHqTTaj0bFekX3wUWEbjwmPwrMHflJn
 qvcG5zJAZ0JvqcijZlTw7e1izlURh/SwxrSwcOjOpa7BvwypSYg7tGOX3y1mrfGWDx92gu/pfT6
 4cJgVU1meLKxLXCRsXf8yc2+0DZwJiu4MeQLN4BZuAbbDgUl65WXIebOralolD58t3Kl7uwUlZz
 dTogRBY/CUSjOqTFvldTZrKWzx2SLZ8oBUWobuO1UgAR0mdMa0CWaAyMukldNStMICsA8O3Ggok
 +k5TowlosKcr8ocMB9Uf+M6x3WljtGoTu/AXkhUhj9obgAyY77OGy7wcpaWnA4SYmE1BGs/9BCE
 i7OUEngefnmG+zi7NBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX1/M3gYuLl/R4
 xn6ASqqPdpvC086KtXrsNaqRONcCru6zd57cpNUATgsAWRl9aoy4n5teuWeqpROnVVO46/qJWWS
 CxSvcHO4KOAKEVu46NIa4NTIuw1Y2Yk=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cc24f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eJfGDJWfQcjy8rMVS6kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_020936_418494_E1BB0EC9 
X-CRM114-Status: GOOD (  22.69  )
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
      dt-bindings: arm: coresight-tnoc: Drop arm,primecell to bind on platform bus
      coresight: tnoc: Bind Aggregator TNOC on the platform bus
      arm64: dts: qcom: kaanapali: fix traceNoC probe issue
      arm64: dts: qcom: sm8750: fix traceNoC probe issue
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


