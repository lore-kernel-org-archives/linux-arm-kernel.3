Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 01:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUQmXiEeanjlZBxkUO7Cw4KiaDiV4AtcD6I1eZtiG8w=; b=HhxLkDuYeIn5xOLpcIUeY1VhWm
	zLeNSWagtogHeW42+bxaHZNQWl1zuhNJpGnjRQl8xjgER02fPTk2kpHjPVQ11odwa6qFVX3C6uF50
	12LohG6ZVSNNhdMQJ696ZSzrT6AxeEnxNO0aWnWSUtqAu7XPom+78Ek2AqY+Suu2P0mmff8UIqe1N
	J7vBNMxr0Zwxbl/CS8+3+Jdgq4+DX+6u0wMYTDPuHoNxzbTqVZ7EaCRk9K9VygSmSAWJyonio3HB9
	2k90K44jrVO3HadgErRtTBvi+7SfpmG/BjLbi4wRm/SqzbDhQGwa5lsB0MCkRwplq0VyTpoig5iMd
	qC+/UF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekA4-00000000TjW-0gpH;
	Wed, 01 Jul 2026 01:54:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek9y-00000000TfC-1Jzy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 01:54:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNMNqd3485241
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 01:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUQmXiEeanjlZBxkUO7Cw4KiaDiV4AtcD6I1eZtiG8w=; b=SQ5qtVv3XpW/SIch
	pQeu5JdIX1tXVwF48G4I8+Mx7/OLY+HFraq6gOfd6YqBlgrsfAUwDe6UdlEE7HoY
	mifnKO/nuvYh25lrycu0bh2RGqxRBVJjmGQkgv4r8S45dSfHgYK4tc4BHo1y3W4c
	qsGSG9dJU808Tn28BkZ3oIUxVSlOVzToQmB9OB4ZxYgbhsNqlNhxnCLoFKxb3gOb
	UQpe/UKyQapTQrJ+57UTRZZrY+LkmDco18MIJoTt7J6GnHR1trRvMlEbgJjzdj5/
	vF1K3AVQ9EX5kZE5KxgRUxgVqP9KnrSRLE39gDOX7G/SElpX9Fb9ukf2a84wE/zr
	XDUUNw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0at75r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 01:54:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6bbd0afffso3739635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870880; x=1783475680; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUQmXiEeanjlZBxkUO7Cw4KiaDiV4AtcD6I1eZtiG8w=;
        b=j1Yq8wGRugP0YaStg0Xxk1skEY1i031mMhzZYxTaFtNTldG08WRPTUqmpAdiswsoS8
         MoUPkBAK2d4DsBAQPYA9AP1E7AwZlVoJgCvSU2iwAHG3PQy1hNyWIf3Re8PsD5L/4ed+
         /IHAehzYT7wDuEGWLjc3LS4BNS00xkRUZx7JWmIArBsBISSNFTGGKUoz9joCcVYR09+8
         Y5Ua+uxZpHu0eWSaM5fRrTdaJCVTgx+YoIexSXnbDotPXJ3qexm8qDmHFZwc0rVKptww
         jZ8q6utR5iSgXYzKJWDZfeSmtXgogH3e5XqWqQ+dT5fSVg3y5RMLbPLiZYH0FAwy72a0
         wWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870880; x=1783475680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YUQmXiEeanjlZBxkUO7Cw4KiaDiV4AtcD6I1eZtiG8w=;
        b=ShHmExsX8k4Cmq3usO0FR2Vt97FQ0fZ3QAtqUCcB8qxHtn654NzPqstRUs0YeU5Ew6
         PCk7wrhjC4Hx/nRLRvjBILUy/+kdfYECjILdqI63MJ+IhZAXvKY+p3CZWvamvhlJBH+H
         NGMjHSeBRhHf0s0HiQrXcKhY+ajc2Hl3SyA3kfIpbnXB9UMDFFn2BjAmYU+B2eaK7EgV
         MoSqA6ZMIX7bnXNdoRRG7EgDo5E3li4VjfVHxtGuYqmAxuQ4MjGi537QYVPf2OTdQU/T
         44Bh8H+IpdUDBKyNYb6JuFg9ceGBzs8aHGJwB5/CKO6XDXIhrSf1BUi7ng7k8dwiPlZP
         KAag==
X-Forwarded-Encrypted: i=1; AFNElJ/21idtGbsRmzjaadn/T5MWqPMmsyO3hMv/sTbicw0lmKyOEF1oTslG5KwCtuCBfTMQCHgc+3RzaMgoH+IL6GIs@lists.infradead.org
X-Gm-Message-State: AOJu0YwTyBFmSw0HFZAMGUc+7T2cu4V294vQU100aLGZmgWKM54TkPpE
	HACLlzePtH9IqIPDwneZQnKa5HShZPDUyS89l4/2TbuTnj/yvVX9mGpUP+os7zhWScK+RwWjV2I
	ZgL+iYxvgI13E6F70XEnzo9xvzy1PVjMl5U6veApi271E2Z/uET++z5iXXYFT4anjlvZaufjgXA
	b0SA==
X-Gm-Gg: AfdE7ckce0X9Wt+GD5MQPNrxYikYyqYhQUB1hEE/PtaWfOw6guYlwzmcp7XJk8Pg+tk
	4xv+thdxqEJfRg4Zg0/JipUHz1Vc1w8bATkrIFApISbmvX3fmbMCFdvbu03rdmVIvgJP0ZtoJzD
	AH8KRI6hn7XEeBLL3+yiL6CABC8xQ6+NDX/7tSgbnn5hJZ0z8O2wnlwJ8Tr48F/tQnZAFqhSp2L
	WqluvjVg7Gi/BwjPFnyrs3AhALfUjNklepy4CZnCOJHH+dUtHi8HgxFuPjIKibuq3Am2rxvpPOx
	2B8GgZIv9xLGpBdRDYiNzyV2v+rNWlF0O/OyOAwqUC4/0DbC3NY3MdOBIjUfJv6C6gvs2PHR9X+
	rN7y6+spOYJJ0uvnAfw9zg6f6oGP2gO+we939YMxu3HjONrpMhfy3up1fyq9wmjF4BDpgDCTmKA
	==
X-Received: by 2002:a17:902:f68e:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2ca2d56ab0fmr47446125ad.21.1782870880340;
        Tue, 30 Jun 2026 18:54:40 -0700 (PDT)
X-Received: by 2002:a17:902:f68e:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2ca2d56ab0fmr47445785ad.21.1782870879907;
        Tue, 30 Jun 2026 18:54:39 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:39 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:44 +0800
Subject: [PATCH v4 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-4-aefab449a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=1628;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=PCET8Oqhsj9WNLCZ/XUS+HHH9XBuN/KDsAhmhsc1HOE=;
 b=YKy+xllUw9RH0izO9EqIparMC755sqafsp0VAOQ5ekC4jfS4ZNDSjscTf+3kw/y231kgg3C8e
 3fhvMJA7yZMBjxXVyYEA7L6jBAJg644X6v/W9xfks3a/UgSflNtw0di
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a447361 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5VkFZXXe0QlYWD9W4eUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6CaPQ6AFFeNLblKreWaTNHGkMdZj9DqX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXyD9XWc8wAjjm
 gnCcsET3Lso4nmQuJ76mhMl4U+ReTdBRtYx63GrowiXx5kR8ddIv2rtgruAYhxTLBl+pREjnGB1
 zjbwGSm7Z3EIOOUBK/02oYi+aJGwR4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXzEAZIWwnR5IR
 AkLisVh+XPEcFeN7dn+ZxH1IdahZ/FhYe9WCLjI7+pr7axOSEH+JUUjWmdZLBGtVNxSfFbXc1dS
 2G5dkRy99uRYLXSHRtMGokw3Tn1oWhZd9LvHpvMFpuoTixebxm/N0M+DsPxum8maF6KFiugd2Z7
 791Kr9atY9KxLXJwHpjzdM+Sp0LBjiI2CMUUWW0I8LOK4srKO5OVihoCUNo3GKHgZ0r3sbwh8Or
 CAS4QE3Q3AiC/gUUCSTQiqVsY+FgEXfRi3VxjXax+DnT3w21TU/RiT9vFYSmQw3kc1eOn23JUGx
 ToXM5SPiFrx2hKLKB3S69eK7LsiKt+g2ihXADiquWnaNA9v3P4TZFcYi74ipareDMXeW/ioF4nD
 qspT2ezRHQq72rMRTbKQUu5nkDOnYsqJH/Q8WT42YNzizDrHmPS+LgOhkGrA5pjTwLGq+ODlESY
 bE1KQNzZ1zX9nhcn9qA==
X-Proofpoint-GUID: 6CaPQ6AFFeNLblKreWaTNHGkMdZj9DqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_185442_501535_09A84789 
X-CRM114-Status: GOOD (  18.04  )
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

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..d58483f9f93a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


