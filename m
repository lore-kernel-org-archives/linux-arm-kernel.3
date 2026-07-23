Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03525C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PAtArUaUjCVwjhnUvEpSOREWwbFp3QpDYdJcjV8SPts=; b=mH5KaRtm5/jiW8
	nDPG5OgA/t/ndy+hClHW3OqGjhc+B3VUgCepLVGYuld9wTx5TUnrsIkEtqw29phmBZh+vsKQ3cuSf
	tD6+z15iJM2x9aMYa61/T5n1d4zECwUxmAPTTAH+K+Foq+HTFM/JarZXaDF/xoMHaZBg2tAKaHepr
	dY00hRGjWT4QBHhcWRV49ywLZP0KFNaubEq0ygvSYPX18iFdSTdWQ9KBeGnMz5fVpGse2vSXArRjD
	dwXAfCLgdyPt52Gm7ZhH1T36EaMc0MONsJ6rx0E1kEy4DLqthdHE43seDH++VJQybiuTFRmidTNe2
	cMCkB3aS4AdYwePUjT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiWY-0000000DA63-3gDQ;
	Thu, 23 Jul 2026 01:46:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiWW-0000000DA5D-2rrl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 01:46:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0Wmla2519484
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 01:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PAtArUaUjCVwjhnUvEpSOR
	EWwbFp3QpDYdJcjV8SPts=; b=hsHj/hdNFqoliwwuKr2uE7YRIWsym5fb8HDzHt
	PgJ5BT6E7ecdfBn5CwDE0BulSxwB5OFqztmKzT9wnzRsej1kn2NLRnOox8rw+X8g
	tglTR2Y9PdiCzW+XGa9oMpJOQHk1WedpslDwrIoa001bPZAu3ew/1WEcbQiDZ7Dz
	xS0wznE5TWRgQi2D1TmeEbO2S+AG2PCQcAbynF+MyxWfWij4/drEyHU2vo4o0Sy5
	F6DuqmjuzUKZUlFCCWoBGtqkA8YE0VCV/77Zgo709GSCxum48Yk6borHLM2s0OD1
	DdFVmcoXsP2AtqFCjzEu8eZbKWgO2um6PikLN9bkQElKchyw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7gj9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 01:46:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc8bde6318so2615025ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 18:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784771215; x=1785376015; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PAtArUaUjCVwjhnUvEpSOREWwbFp3QpDYdJcjV8SPts=;
        b=FYb1QYtnwhhiNM8t2McJmRdiFvnz7nDlhHSuNpQd8ixmIUe4O+14w9HxzRfd6w0+vX
         5BHxJiJllleqKzy+XxdhLHpHxZS5bJWC7EN45WMw1Fdy0m8ws+ZT7pfBBK1PhVX0/1am
         cQccjHG8+zH27ruWOQ86LV5pn5Kl+/TrBJv31TLf/jo0madziv/XSXa48MkY2uRTNH/Z
         J+1jI6x4znLeFOCIR+qJnpEZMewbBclal76/jJ2VKATpxR8GCHLKrrDwka0uY7acDSyl
         g78RXcFVM7Oe1iOhX5oq8ZxjRRucnSjGjrshJ2xIP9wGSAyMcZIgKuiA3mYRGaPLyGqf
         slWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771215; x=1785376015;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PAtArUaUjCVwjhnUvEpSOREWwbFp3QpDYdJcjV8SPts=;
        b=c6dWvV6kmX5jLK79cgL+Rel9zamqrDhE5BTHSDDDjGtxwireA0nVJPdjjp6fTNdW4W
         JiJRirI+bOOftsp63p017tTxgZMJc52X66NuioPkjhZfoSm0t5BT2K8OlMleZvWEj0L2
         7F1i5xBftLrXE1W6dfqMdLkpXAgmyB18YunCnxWbgJNT4/Vuqj14nOjYeCZUP3s8wNCC
         bqTLbE4WHSNUMFxAxNJMHXV/vKBfMUW+6sJVdEXGaVZOQARh4wB6wsnK9y1S0nK2RaYU
         nLkwP3FYvaBnSPIyv3if0s+fLB0jqWQ2LdC4XHVjIGnKIiWh6fhIfNBHF6q1xW9k7wG1
         r6xA==
X-Forwarded-Encrypted: i=1; AHgh+Rpuw+S/il8ebsYHxiuTNh+LCEITQG0W9siBieY6IkZJephtrZgY1c7onh7qDxUh/aU1mmDQPJX/dHVb2j6Pwvmv@lists.infradead.org
X-Gm-Message-State: AOJu0YzNTnQAaR8vz/rQYMvswpR4Dq1Nh862OKoNzH4SR826nolH2kK1
	h/5nH0Yd2TsXSdcoU5E+1mJAchd0lw0rl/kq9ZWsP07MKr++7iU3dWHKXl7wAU0X1qhfLGfMmsE
	H5An79RRBadlp3AsUm7QEEXi6EY/8Y8nqOFQt43KHDGH0TuSgzzQYsZR6EzNWegtkp7NeCs/XDs
	jQVg==
X-Gm-Gg: AR+sD13+1Qa/DWhAs/X+XJlxb1KyDF+CVF94fZtz1pqkAqgPWOqL12NlsIMS9H+luHs
	k7is21YXcNvQ22YjcB0MiqpLgLvJs4oXmhG1Ad5TUFnpwb4jbNs8i6Vmje+8IPk3x9r6K4gZc2e
	CyI5+FjQ6VhHfZ23LWa5KPk11SFaPChbvknrg+widM5tQ+hTu+JpQH2LKsgZbSu6EbReXnkfbS7
	e7Sp8isRZPcrLgboEXqd1AHJZ19kggOfHevViKl+4dywNTivu+EIs6XgsF30RFw+vuggw/Z4vfN
	1Gohbxn90wwXakeere6CU1LJ6yvoaLEyl1MUwDPyUK+upMfP9Z/ABzJ6wEebLtjHnO04vIJPjCj
	RpzARYqN779+yzRrklXTkikkr55QorJAXXp8Tkb5GCZ2fQXhy2mspVGfNHrvIPtw=
X-Received: by 2002:a17:903:384f:b0:2cf:9c35:82d9 with SMTP id d9443c01a7336-2cfa6b7cf03mr13371335ad.10.1784771215015;
        Wed, 22 Jul 2026 18:46:55 -0700 (PDT)
X-Received: by 2002:a17:903:384f:b0:2cf:9c35:82d9 with SMTP id d9443c01a7336-2cfa6b7cf03mr13371095ad.10.1784771214591;
        Wed, 22 Jul 2026 18:46:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm23389995ad.10.2026.07.22.18.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:54 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Thu, 23 Jul 2026 09:46:29 +0800
Message-Id: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZyYWoC/x3NwQqDMAyA4VeRnA3UqpvsVWSHalIbhHYkYwzEd
 7d4/C7/f4CxChu8mgOUf2JSckXXNrCmkDdGoWrwzj/c03sMRLgWZZMtfTEXYsNYFC3JrgHHuEx
 hWEbXUwc18lGO8r8H8/s8L/4DGhhwAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784771207; l=2649;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=bGlwfuxl7Ko0KTHUMFRKzd7hgfPMUkhhLFboxtPnpwY=;
 b=lNXsfr6unas8t0WGnGVH6FFRT2E2JrcFsxQ1zu/r4zI8lMZL1jtYqEJZtZ8Cic8zE9L822GMR
 thmFZsMNnodDNh2eN+6j1gPSQbHLC79KlUPQuzhK3MHc9uXMXVY2pvc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 1XkzC5aZbq-AZ51zz91vvfIyxiN2176Y
X-Proofpoint-ORIG-GUID: 1XkzC5aZbq-AZ51zz91vvfIyxiN2176Y
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61728f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=gXtLJ4WPg2CJrXxS_-4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX7cenKk8Ydh4e
 Ox6cCq4rVirxff4c9vy6mhFAHhO1UXeoVER7r0yWLU2wVqlgEuDiIDPshXdUPsgW2VupNGcgFcb
 u7nmzWmAZNCVYyuOh02qeyteEkBvoFg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX6JbIxiM9pUbd
 hEFF6Z643YUDbfJulmAFD1hpFddNGLm3PWj0BX2qS1lzYrw+caEGlc5j7GMNwau7/T0bjcd7mIb
 9zuloxAdmlYtt+XY/f2EG5cTDlBulAdmHhvKnVDt7W/tnB8oGjY2VK9HiEMaYHUTYK9XRyYaiGx
 bvq4PROXdE+A1ChZinLJleXRj8sUokccJO6eXGgvc/mGLLKjFLtFdZMXcI3tIk4zGMBJjPV+B5e
 uYybC3TP906f/XAxjSx2cFL9O9+cl8fBsHBoCDmwUv4JOu6qc80QPhGHxCylUNtJi/Een702DK1
 Huh+ddzRPoWIN+kIRpKZV5cj0Jbu/3TZsW/lBmqCn+zBUUIEP6B39okBBAcmYeeginUFH6qmxhP
 2bJ4kfKIk2bgnKzmL73lkBVsQyeY7cM1f/BcUekmzJ6K5anl4gOfUP+ImwS3hCUFbRTvxGbYJ2n
 grdiCFEBKyJ2jXh2MqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_184656_736938_0C41B6DA 
X-CRM114-Status: GOOD (  17.05  )
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

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

---
Changes in V4:
- fix the wrong subject for the dt-binding patch
- Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/

Changes in v3:
- add correct subsystem prefix in dt-binding subject.
- Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com

Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


