Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 01:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjH1jV1M9hoGtGfFOL3DiSQcmeoiGuojoUXT0ExAk58=; b=ZpmviSFOUiudxdfccNYDk73Ov9
	yDc462Udaqm7PdXxoGEtZAwz3xEKKUcpC+Zh1By21ESzoHGdbhzKRJRyublr2zmiWE3tzWzKzGvi5
	HmxN66zMsKroJKrUWpd20CZRR+Eiitwtps+M+NUbVhLQAGyuO3vE56leuTa4gi4SwMrmF4VHzhLUi
	D/Yh2BGiUWXDg7cFqTZxSvuD9hJzE6MDJ9zYHBEh4XujASP5FQialslflb4b3nIXYvirNNL78NssG
	zEsoeqIhFzAeCx+P1rSey7Ni/WagJL2Mgb7AChoBZWrwedXXk+6gy0AXsoQiGhImQiaqpCp0kqLAQ
	hS+p0QVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek9y-00000000TfX-2B1Y;
	Wed, 01 Jul 2026 01:54:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek9s-00000000Tbj-0xV4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 01:54:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNMMTP3485225
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 01:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjH1jV1M9hoGtGfFOL3DiSQcmeoiGuojoUXT0ExAk58=; b=d1HOLFYHKrEZJw+P
	E5L3IQNBM27NpRQ0fmE7yrUopMV5tYTqgjimzeQE0vcBnbkv/iOy6x5wo3YkaMAz
	ewawqP441vut3ziMLmndYzPXC8A9g3oFTpu94kxjCjQ2nz0oFqXgBmt8Pb/4E4eH
	mOQk2m2cRJYrLNOLx9DfOBirQzemO5hVMESNAPJLiH+oKKUuD9Nrjdo5tcyLxrsb
	n18eg7KIFtTuL+e0QzFZxETJkb5DwjSKKSy2KIAFgu/w0IydJMlAiNwfoNbA/ol8
	LLnB1z2etT397kZDxv4ISmNzPdq58x05gg3CLKyOUNlHOARHn8KZlIBVL6zbw6SK
	g8DNxw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0at756-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 01:54:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9f452d260so2449275ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 18:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870874; x=1783475674; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjH1jV1M9hoGtGfFOL3DiSQcmeoiGuojoUXT0ExAk58=;
        b=dPijp49jJR2bXRb9QjkGP54NcjxomJpR+7pO/QDznx/mEZAsrIfoz2d9fTTSoij0pE
         xoHBp8t0zeGx5iLrmo0Sbp+xOGZ/CrE0xd8r4oaEcC1ncynrNsr1KXqbsGRDcyf50pQo
         PHpzi0hLY3I0zhCoE4wW63BJSJdDFtEvcNOrrchiDOyHCkaOeQNkRvPSuF7fJ+NI459N
         7aGozl7AHqxPq9+X+oeAUfSrXgNgk6UqzXM1tuIy2HtXS62gGUEnWQFuCo71DEVW8mHI
         NY8ESV4zOLNMdkkLqOfcldETV029b47sULNX8o3YUOMWnwXhO5daoPMBzi48wk0/07Yj
         Rfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870874; x=1783475674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjH1jV1M9hoGtGfFOL3DiSQcmeoiGuojoUXT0ExAk58=;
        b=GzIiyI/TMBtPZ0tcfHR6gTOPfJkE6Gfx6H30OPB5bqHj7FIiurb1wvzFEful98FhXY
         xMRxxlgYueLyCgqp6tUvYj+0ndVIFzImMfauPiuToudvB1BX5W3fJe5MGEuC7G+qzLUP
         Il2LjwZSb1h0vLy0ANhVEZeV2HTBp5mHXJA9F+mqHNEGzmVnkuj+nVUvwkKlbeqVQ3TY
         VF4CTQm4PLli+75+OdlRwi3KEx78ztRELjmDiDkzatmh4Z3dx6oBXduaHpgYNj6TnNL4
         7aDxAGvyNvhCQ04disGBd49fFQU7MuhvqjLeNLJsDLR/4o5pCBMeeKBv9uDkfSey7BUE
         KfsA==
X-Forwarded-Encrypted: i=1; AHgh+Roirteu/ijzpJ0NgyDahgh+Bjywl3RV331AHMVjvk1bqXsp+aru/t2pzYmWV8hJWXg8O99M3RafTxqptXdD6h9T@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2jfY4N1Z5vb6sENNjrfnfYSGquVp3Cmp+IdEgiImHqOmH4bAo
	d8Gk75PqtueFFEHw1mUw2L/92F5f9Iu8rUGvaa0ZvrLtwuYUbst0qA7VAhTXfnkDZHD0rI5U7zz
	cZ3Nw1UjB8/RA85yNMyayMFXPZuJ9MChKEru+6xVSru6OfkRbzLyxzGevtuz0wzsW9biml8shFi
	ycVA==
X-Gm-Gg: AfdE7cm/GRzwT6ElOBEyBzLZwO9uF3XKJLWMA2hxDKcuI+Oh0GGil9pICpJU0cnaVO9
	snYgqYko0V4AvwG+FFLG1jtzcumIY98UM3XJuK3joW5cuQriR1NEhF/ydxmt0qaieCFDt+8K+2b
	aJcun8ArZmr7YVbCOydjLrj+expj7PztKGh3Ji55cyZb9ApScdXufyJqF+ZqjKRjvkCc0ykNSXq
	KvCve8KV4RIMkkn3XaCxYDFmfW6dhasJXFe3e1cyE65giwETieygxIZv6CdKDb8vYKEjCTUGQ+5
	ZeyxBRqAaekQs4hSl0YWGLiefBlq0oD8SVi0o6/kTuNsI+oviv5OVB3jX8Tw21OTYXg5vwP3N5B
	PIBJSsJNdjWs6YcbQBH1WgJBQTmQosHEI8aQ/EMvz8uYaTxyfQcsmObEgDCjWsh8FYUnHdq+CHQ
	==
X-Received: by 2002:a17:903:2448:b0:2c9:feea:4e50 with SMTP id d9443c01a7336-2ca2d52e930mr52741075ad.10.1782870874043;
        Tue, 30 Jun 2026 18:54:34 -0700 (PDT)
X-Received: by 2002:a17:903:2448:b0:2c9:feea:4e50 with SMTP id d9443c01a7336-2ca2d52e930mr52740725ad.10.1782870873570;
        Tue, 30 Jun 2026 18:54:33 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:43 +0800
Subject: [PATCH v4 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-3-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=1646;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=UN1+XndgFoWu6KIBACkmLA4ik7BBH53rNgnE7Gg8Qy8=;
 b=sbrpn5D0WoIXPJr3xlIlgYYxZwy4hg09s34OElU6B/9iYKSPMpySzLDXd/hCsG1HtB0ZU+xsM
 Ni6Zc0tQ2r2AZ8fDB6S0i8TwGjUtr8JQhL/FuQGBVatYsLakUbb5bd/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44735b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5VkFZXXe0QlYWD9W4eUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: tXd6JLVYioev4h1JaV_ti3jyo0pLkqLq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX2lZ9CWY/Q4nB
 CFMpcuFLxGPRhHeRfJEzZMqZ6A7eLcUlaZFfvqEHh9cqpWBcqxGWI6L+COhq6GyMX1P13ye88wR
 vazI6f3UtpqzkUIRT3ggLeW62NgTJtI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX8nXgayokQzXv
 IESN9sFwvw5QVl8sNUL3mf1q7kcdENzRMP0RJ4nzLB2bxtMGvTQPXVJUAAnpKKIN8yOPG9XALxX
 rxHleHbcl9iNLeOwhiLZ0EW+zEpEVk5NOWUIYJUTEAEeN625o/stYZyQ4LvW/+vZtQlei61Q/Pb
 JGk1hQlXcO6hgxrcbI/RPLyieBm0sxHkfkvc3QzWjTzk7ocVTCzWwynX1omdDZg177Ja3SkSQhe
 m8I/Lz7BT7aAMLhRcsTTQLvTn5hd2ifTtk8a0E1LsHOWLS/FucPQkqYEmGOMxYXfGaMgE22T1Fi
 P1FmEtCbEtwoMbKzNp0aM4eh7r8oSo3hzwOrQWycTHylnWJDhNiPoQ3MJx84Kqk+/JXcsPWIviG
 NckNPtDKI3s47VeYqc6G7WnSJ2q/bRzH4MHwlR6AndiXeBEe72ka6KZDEkUhDqYKPFY1jiAA3IM
 MdoLpFB99iuw9MHCBuQ==
X-Proofpoint-GUID: tXd6JLVYioev4h1JaV_ti3jyo0pLkqLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_185436_443471_CD612F47 
X-CRM114-Status: GOOD (  17.92  )
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

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus first reads the peripheral and component ID registers
(PID/CID) at the top of the device's register block and matches them
against the primecell ID. On this platform the traceNoC does not expose
a valid CID in that register, so the read never yields the expected
primecell value, the AMBA match fails, and the device is left stuck in
deferred probe indefinitely.

The Aggregator TNOC is fully described by the "qcom,coresight-agtnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on reading the primecell ID register at all. Switch the
node to that standalone compatible so the device probes on hardware that
does not expose a readable CID, while remaining an Aggregator TNOC that
retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..e98f4aa4b141 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


