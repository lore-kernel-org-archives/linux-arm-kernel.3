Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73598C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySp//vO7Qj51BE+0nF9GXADTwGXQzUmc966X1/StNgo=; b=mOqKCU19MUnF5a7YNREhC2BE1s
	G8ZLTSRYkp8Oy+/tgplYiFAHsi9MDS4Amiy4pBbf3GRlAXGPAIqJ2TUjH69pniIEAm5ZcH8CdMB7o
	duzpR/l54So6oW1vZ1cgTgkmq0cjvPvMfvSB9yVyFCNbdAxK5J1XrBn0YgUoH5mVqNiDFbM58R9Fa
	HqnLG5HVU/8Z1wtww37YR3Q3Cp7T79Ul91cH2l0+MdkWbhk89Mg57R/bnWXfZPCvXJ78pJetMKMBE
	5SEHxt7O11xSIKllKbLl5FSu/GK3IF+kODrMk1DJ50mDeoOwhl5tykvwLJ+E5cogDCdrVliBuJCuT
	L0qqTYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVqO-0000000GgOO-0jAJ;
	Tue, 30 Jun 2026 10:37:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVqG-0000000GgJf-2eyh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:37:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxIM1605154
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySp//vO7Qj51BE+0nF9GXADTwGXQzUmc966X1/StNgo=; b=gx/Ky3C+59pYv6vd
	KlvmxRGsBHGReYGSnPrO3NgKcag5IN/KSSyuNPvqO8VEcj/dx0DCDX0MwlLk2JUp
	LTj5mPRKuqm0cFrHM0+EcmM7gJ2SzipiNc+nsEqONq1clDa9BSbLg6fD3dqbOdKB
	VStcNcKSfjJlECppiIixEfoM3T8awrHkfBqMDsLsikHtOTntBSLBme2ynMRA0JPB
	W86tcxWXlVBuiIJ9B1Vz1ERho36PVyJ6klxQ/PTNZWym1l+YG8qB5CFAABA5cij7
	jrrVua9AX4TFJOaf+a7w9YFt1+kyOd71DnG2JwqaJlTyRovDAKxvHMnFiYizUHSK
	7pprYA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfj5f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:37:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845a29d8c1eso3373128b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815843; x=1783420643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySp//vO7Qj51BE+0nF9GXADTwGXQzUmc966X1/StNgo=;
        b=ET+t2oVq2Hkg60GoJt71SJ4QYngq8IkOWPhDz+9t+aYYWrRxC4U1JrPQmNXF+oe/nf
         JLkrqiNS8h2/tksVrq2nIl12IoQpJE5C9bXGJNi2Q6nL9ZGcS3it2s1njEaadSH3FpFQ
         F+D200BeldVdUGWno85APB/5kP5FIRZCfWI0lEVk/nwR5n5cdEN+g7Sa+1y9qqqC9gT0
         0Oyj53Ii42iSW+ExAoebu+hHxXQ7kVyFCKmhPSPOeT71j4FqNiKAlb4xeDpHvbscrD0g
         LxMaIlFfCQSrfdTYeuEhb3uDk8djXbXQbqE7bp8+Wd2yu/MD2WjQnagYhSadMwoVJyW1
         5rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815843; x=1783420643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ySp//vO7Qj51BE+0nF9GXADTwGXQzUmc966X1/StNgo=;
        b=QjH0SfDGTS56wbVr4SEZ/fihAweDrPDW9icBcxVLeZXuPsgWRgmluETrCKY91Su9vh
         cT5Bagz2LVA144VvA1QhFr/96dGZ+WNr8M01vSlGG7HRIakKYG9bm4an5zO1v5+eK67m
         YuGOTe3bxUvmWzkSmyB1CMiSE4XYrnIBrQR50eB5QHpMi2HfuXKVrYNNmnbaertWHseJ
         vzM+gwsUeWt3KC822Q/2DGUsRlaWK7EzmvU0FdZQ4CR1c+9tU13iMX8ZtNUub1lx/vr/
         gArmKaTuEP0923gXeZIcTXz/jPFMTVnQB+U1TP1c7QrbpRW2Bhu+aWyZHuWXQ93oJWFG
         XEqw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Mj5OrWySCyRaNjO9NvJOhclX9E46P2gaL19Lth6zAbfZixLdmyiGM+XDzQ0e+oyqB0z5Vx+Ah8GOoYEYPCve@lists.infradead.org
X-Gm-Message-State: AOJu0YzwEvLmVDbuTDrqaNWhFscA0F8SxVOG87rARdGgSllfKG8u76Jm
	qdo0fi9Arx7DvD7vtSU2jI67HJREXghwI5E36TFML7XnukeCsO93ZJefa7yrbH3sJHOZlIoI0ro
	eDK0Th5JmZrkNuU+evfJicPnkPqoiCXi6fZpWXEYmbvoHjrIr8DxquTKEmpAgFDY8Qh1BTey1KF
	7lvQ==
X-Gm-Gg: AfdE7cmOCitnzsIb+CD6S2O7NffpTlkrQDpoWOD+TjCRdKDGIsRHcrIjJiO8AfaT+rW
	WgWrKILk6OWyM+H90n04q13GH3NpHUzkULbCOSM5HxUpXaeXhxu81ERgILKNVcESixzA0YDzW87
	Sz6B5XgWid1lxOoBbf5jQU4wYQ4kIUUefCbME4mL0flZMhGWUmebI8CyeO7gVgpUsN0r0dQGuLI
	XvmJcwpQtqSecsPMt8Z1rBYkjdX3QSIAaIhenDyArvMGmqKSOuSOB1EQmG4L37JOPeM89/Elt0P
	A7qZBOgipQyCvKkAO1lOgyIz4eOICYnzj6H+S21HuIo7izO4PeDNSpudRpQF90+keOwoG9cxf84
	5N9N9i4C68Brx+brWjQSz/Wz+qmfqeB970WrFksIhMAeF+UIoOcYe6NB5n4TOltNxDtzggpijbQ
	==
X-Received: by 2002:a05:6a00:b704:b0:847:8250:2b31 with SMTP id d2e1a72fcca58-847ade9a863mr115692b3a.38.1782815843424;
        Tue, 30 Jun 2026 03:37:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:b704:b0:847:8250:2b31 with SMTP id d2e1a72fcca58-847ade9a863mr115678b3a.38.1782815842978;
        Tue, 30 Jun 2026 03:37:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:22 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:07 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-5-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815805; l=1402;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Gj+QP/Y+EYnERLfloVRJXFv0oSQBA7CdNBDXvdCgv68=;
 b=DIbkhStmFLQL7Dx0uh3VirHk2i+SsbjV8u/lv+oehetGMD3x8pVTZJS6gL49TUp6JC8BRiqf0
 i0ud/ic1AdNAvchGmJpp/v7Q0iZOrobGpQLhjHG+XcYb405dYuaFMXZ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: EC0B5Swr9Zx02gbLmRuvPpSwDT7TsRov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX/Nhvk0UMhiby
 JWFb7/47I5zVGHYwYD1lnMqO+CMynE+ldyfYVPA0ocFf0nQK/mG2LvnWck16oVeAKKL+B16lxv6
 C62N9RQPwh+/sAXHJNC6nJeksQsUxthbMIXYjae4nOOKSVvMvpTyQz6XtmarQNNau4V3BARLsck
 GZG2mhXcvjOir4UDV0RwQM5JcZuVz/35iHshQ33aZly4oXSTqwzkF1T+ykR8YQknyF8fpAO/Qz6
 BhjVqKlJvOUIEFWs5iA9m5tHBZXUGojFDyHP1YiF9SzdHPPEgDdJNhIF9BPX6GCQOWBCDu/Em/r
 aa4a+zCthNq57duWGmLwerUdLrndblEQNm0wBepyHPfzSFI/wHE8/4pSOQWfOX330BtViXEySPx
 lXxnog6P/3PTiaGcy9GN9GunIE2XFQHHYuvkon2U/+3PLEtCPAlw8fEJ2OzwC1zcPE4sK9v9pkJ
 pZw1xMrNDPTvamErjdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX105PWaCI+jR6
 kpsi4sUd05xUFZmOCFJKgsM8z/2ot0POj/w4XZU+QlLCaD40V/1MacJkIOcthkxsrrj/q4ZHeFh
 38UMenqHnGm7tLuiNfAaQs2Mntsu6UY=
X-Proofpoint-GUID: EC0B5Swr9Zx02gbLmRuvPpSwDT7TsRov
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a439c64 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aFoPaBnoHS3gmuyVzGwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_033724_696311_E6182FF0 
X-CRM114-Status: GOOD (  14.43  )
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

The traceNoC node used the "qcom,coresight-itnoc" compatible, which
describes an Interconnect TNOC. That device has no aggregation and no
ATID functionality, so the driver marks its trace ID as unsupported.
This node is actually an Aggregator TNOC, as shown by its tn_ag_*
endpoints, and should expose a system trace ID.

Switch the node to the standalone "qcom,coresight-agtnoc" compatible so
it probes as an Aggregator TNOC and allocates a system trace ID. Rename
the node to "tn" and use the "apb_pclk" clock name as required by the
Aggregator TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..d612e8ed54c8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


