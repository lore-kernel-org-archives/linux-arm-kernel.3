Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F25C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=; b=uah1WGcSR9rKr3xKr3CX53etwn
	24fykaFwbf0yPuBq2r3Ty92nbyANZr44K8lDiwAtwyCJaJpI1Qx4N8IzTvvKIIfAxb1lm3XrOHe50
	5JXvkgMUe4/p+na1rUD8qQjYSzOdrJgE7kQ7HNKxxEt+1txMsWxPG7xbI8JzetN6AzXwfM6jaLTTO
	B/1EeSg5RkzLWwXjdOrbSi9jWeYhrYaO9hQD+M4XMua/r5It9wn6BPQtHGR9Iq+Z/m604C3kLPtKD
	ZSDTIkIlU8TgmQT07ruOCBIYKIOEVv4uQbPbyg9WE0Vxz8FaM1Zf2R8y+6NkQU2m69YtdcqeoOppa
	TF2gRqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGG-00000004VGU-2MSz;
	Thu, 27 Aug 2026 17:51:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeG9-00000004VEH-1OvA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:51:30 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXhHe541489
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=; b=Y3AgYA0R+YWLTJHV
	Bq/ckoqpNGdWK2Ttu8lSuK+D7x2nGLU8JKFm/5jeiUrV2rC+YfDU4uJxRmjKaNVJ
	MbszMVA4hRAaycunghcsMHaLCY4MR+h2p6cVlNGQ03+uqFufDXOQILmU+7IRDpWK
	khH+YytFiUZEwBZFpniNS3VvPBCGjDDzUkyCZYaXZpuaCUcdUpqHo9oeqMZKZ8ib
	Rgj9DCHJTe04xo6cwkNxddZgGigGHePjlh9ihRa8ByQJgpTVgM3evALju8FdKczk
	ONfnXDlbU9fvA+kL99Fbc3873D4cG9dNloO34anG4L1wl02axUFC6xegIX/Agi16
	uc9gzw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee0p0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:51:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc132709c76so259593a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853088; x=1788457888; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=;
        b=jkQi8I+I5gqOd2pz4YAC7MRTo1AaHfMCE/fApPPE3Mz85DL3HBBwSPOiaM/Z19w2J7
         YlQTigL/A0yPJUmKKLNLkeznhZLsFjFwUcO54lL1/HGsFJpVXEJX2giS0zFkToTdZiWm
         SVRP1jN/yevFNDHnQNOE62k0M5Y45M0H715Fe7WrykGCJbOZkw1yjOYxIbn/tL2G/tly
         iKg0vwer/HKU44LCePhlwM355DHl2p5rvEgQ+7keD+xKP3k3lCPuUXHDuhi540zCfgms
         C6X6FiuzUsfBrjnsbNk9zfI9AYuYzmtBjib+PpYagSjQeGgSkp2X9GYMAndfNvojRz+H
         eZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853088; x=1788457888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=;
        b=WZcPPLxakiJltOisD5yW7h9lRRa+Vtg+SmQW/t7Ql7081bccw3FWiLFU/kW1KXf3er
         2e6tWAy072VAggBvnFftUcSOcGEAyX/kM3SsnteD8XBxNC/EWuVPUhLbzfv9ZpFlqcSc
         hXL3X48T6hgDej20IsYWQ/H0ABuAPasqSNg1nI1exRgwBi2TOQPehuf4uvISSKUAhhPx
         wS0N0eH5oVsf9gG6e39hSQlfh79Lox8Dp4azRDXLons7B+w4lqoIORhS4sTUKOfGgPwQ
         q0qmHfrcHYs4Dl6kN7BqrPmpWVKTNLDjtLdzX20E5D0p4GyQGGDo6EezBVFRczJoVmVM
         d5Ug==
X-Forwarded-Encrypted: i=1; AHgh+RpAnHD0+JkPWFYi7ZX7nPQ6lh2JIpk3v8jsXguPhz8Eky+EGMzs8QUYIRYV+umW3Xxa7/pDMMM2MtOtw7J9yOxA@lists.infradead.org
X-Gm-Message-State: AFuF++kC/sn+n340MaTSG4FVaNpKLqe2usVgOuSqLIMmZoHrt4u5SGvc
	O/DkyHx9br7xmSDNRrB116A+xfXnUfJ06zmwQ1jQWvEI0tOnSRd3qhZLcqOcNYHeefO+6HNkFsa
	OyE13RZ3n06cKN7oMJEDyq8wJ6Edba6MG8JZnyX5gY/5gvNeQs5XvFAiHggnk3fJ1r+sDm/nIbP
	htJQ==
X-Gm-Gg: AR+sD12hLqgO6MX30KWDDUC+sSHt92qGG3Abro1db72C2sp+um0QDpbayP9WFhDsZdH
	y1CT5ZL4LIYMuAFio09zTzj4ueiHUjRMvjEjIs3xmEuCLG+G7ECnWPy/YpKityBXlHImpvBNGyz
	V1t/VgzD2/tZQD/j+8utiH2jXCgr5tjEiy2HQdGDSPSRGJoxAkBuDJq9TADDjhmfDgpdCB2wyLZ
	k5s0jdRkW3r2LgYFxyYSCEjhwY5K1b5ntfy2VTx/MdPluPsKMvfaZkRhC53zxPk7yh3L/3HfeA5
	CVmUGy5H9LffP3JPDivL6t5sRAEZ5+6NTT8NzK0qwi2SlYDXiJeNeB5dzddL60xMAPFIaSbXWGI
	+Sj2TtKGV/7NRTQ6FAa72ULuZj/fTALpojghXRR+9v2CSLvG4SI/WXMYdp9X4Tc75DFsMQ+HJHA
	huCBe0J7/78YXV1K+akD+XeSc=
X-Received: by 2002:a05:6300:67c8:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3d269519f70mr1365607637.18.1787853087961;
        Thu, 27 Aug 2026 10:51:27 -0700 (PDT)
X-Received: by 2002:a05:6300:67c8:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3d269519f70mr1365493637.18.1787853087471;
        Thu, 27 Aug 2026 10:51:27 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:27 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:04 +0530
Subject: [PATCH v5 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-1-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=1026;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=iY6li1N8aOWymAjX+i7+r5/1IUwgJvmB/19fYvr8jWE=;
 b=aHAflXlP1yHXGFZJprnZ1WdCMs9h3s8lcsyK93pEvfx6jZpxExN02LtDY/m8J+rWWBNQyfJWV
 Z6kTXnWAb7XD0B7JqZJqGp21mffzM2wgOR4TI10aG/oBKL4c+4jXQ3D
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX78VIeDY4j3wy
 QFFzJzqEx+mD5L6nZbzfacvu7l5VADtjrPg7My91RFSVMArZx9V0r1Yf4CNX0z1pmfaCuKxWokP
 85ksZVrIWiFghLWFywcOnGrKDhaSSWLqesfaupFfT4Z33ToRPh01upHFvDT2xipx+nZAdPSRnJq
 EBBPJrvCS03GsioMNsXa5EvSIcUJiwaAFYq91WAQ1mb+idjnDplL5dQglFq4Mk6j1H7NNx1Y1t7
 lqD57sCTn/WTSN8jSKzfq58T3bXetUd/TVZvTq9XcAgOZsbqaA87hkUIvaZF7xWmP0DBikMj2UV
 4tP7HLJBFE1jJSYySzdg2UWnO3g/AGJWG9h1zl/7qNZFPg6ug6Lk/U0XzLUgU1Jb1gbVfZ/9ZM1
 TXOR+HOlQBgbobgqcxzfRHbFZaqJwDmwzozIw5zKeLz8+0c1wnaFLGFSUlhJlMCyXv/09mQrz1j
 GLh2/6HOuCYZ+K1kNog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXxVnBB3mM7QD0
 v+yG2VG8xN9rwM9xf2CqRphR9g10McqeDSavmTwuVH5Bq90SqgAn0abkZ7UvRzEu9gtmtPK6Ial
 qtAOnAQhWXFouhHNhOyMM4VhSU6lWjg=
X-Proofpoint-ORIG-GUID: -sU_GvYPlpU0wj0ozD66aIYc8Z2AJsXa
X-Proofpoint-GUID: -sU_GvYPlpU0wj0ozD66aIYc8Z2AJsXa
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a907920 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=I-wlBW6BsxmxmlAWD-0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105129_392732_BC790BA6 
X-CRM114-Status: GOOD (  13.85  )
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

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2b524154d9fb..9f703261d7ac 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0


