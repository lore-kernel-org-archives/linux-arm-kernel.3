Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE6FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 01:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YC26FmdTmn0Uux8AKzau08ESZRvbLNzgi/lvhbTZq30=; b=CbtYIf+IXubeyMdxEPtwtQD2KM
	/XB7CrLFyQQPwR068uvh9dHC1BvjHFkglbsqCh573/GjTSqUMIG9+SiW2O/yGnx6ASeDyHBtAC262
	XIixudjEt0n+owS1tbcm8FJDctdukDM8k/+u+QlKG7b1fTKtRIo4AN6y7zfabu+9iF+5NjYELIaYY
	OW5NHqL8dCM+a3qvNjHZ1+tYMSVkZ3Wqhx2UscXRK+orzYXiCSe0dKOhXxMFlcob9P7x3fF/8nGks
	P3UKf0xqwHsCZXpJHKKKYkUktreTIlPDfejie3Oq7YJtm41HZpfks+xaMn6GJzgzfIbuzpZNns2/y
	ElOcx+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekAK-00000000TuR-0xuv;
	Wed, 01 Jul 2026 01:55:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekA4-00000000TjJ-37xt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 01:54:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNM0cs3471869
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 01:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YC26FmdTmn0Uux8AKzau08ESZRvbLNzgi/lvhbTZq30=; b=NOl5BNY2eMXlZxTz
	KmSPPi/syXcZzrooD+OjW4tOGXhJ8jAFFExHKGmd5CY1SveoQ91VlbCeJvd+FT1K
	pGXY0yMg/64K9o7u9WqBaddb9GvM2iFpeCGxhaZKWjywaRJSuTjeI5i8wC0QKNc0
	WP20RJc3bmqe14dfMy37L6W7sxhKu2knKGasyo1QPH7Dy7sP6+3tLAASYmcjhaDV
	P5uvF8OdCDxnru2MzFc/dML7/NUtZvNInWvSOMdKL2H6CdKwmvPVsiRqv396AM2a
	ph3l+qWOQItwpQ2vZTUqjYbiWldQk3zHZlIA+Iu0UUWIddiaTRW5fmkRo2bjoVz6
	ALpb/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc0arw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 01:54:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so920304a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 18:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870887; x=1783475687; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YC26FmdTmn0Uux8AKzau08ESZRvbLNzgi/lvhbTZq30=;
        b=Tu7+USX5HJqyWDUENzzsscb7eNj5n3avDUrOHee139eoDnhmKoN2/bh+RfPOSyfqnh
         JU1GH+T3+RoidOXg9dDd9Ce8stZ6eWbFaJBmGLHBgvspExRN9dIwFZ1wZyIkE2TwjN1i
         AvjpSICudEnDC6lZq4cVVwaFJDv+XmA1exHeY2ZEzyWPuyLrqvXOSo2SJWGW5SaXFvn1
         /0+I6E4f8z2qNNpKHP0odUb6OL0Ze2c7/O3wEo0i5gkI9SUGaCu9CjEgiSGhS91eOGUx
         0RGrqbbewydq7FPcobhf2Fb2nmLDdaAaMbKikAP3WSoRWKSKcq6Gq3Sq1SxSsKos7+30
         AXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870887; x=1783475687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YC26FmdTmn0Uux8AKzau08ESZRvbLNzgi/lvhbTZq30=;
        b=NyhVD9pPBydBqFy9oD+XlnzZ4b07XJz1C6PYgKevOFMPC5RSX7OaE0VP9lI8NQE6Bl
         j0m12IM85Oz8ox9IWXiJm5C/6r3YlevYmizS6/JVhFeh41yn5Hra0xBc49uwVugQCpaq
         1L3tuYVv4Y5k/SNhHZdl/ZZYmQnqn50eijJS4VxiZ9p91gaCxbuhl3gqWjp8otS4J6LM
         eyVa3q42ILhqTzSjCLTrX2FYerbhNNXE9yn+VWcULQHju64SE7vgN7asgHN2SbHWP01c
         4TyBTNF6JM+tPRQEGetIXAvjhYrU+Y3tPIqZZnfSdNtSumwJgqTkDEsGWpFFLNaNOS9h
         Dvbg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/CH1QPfolcyb2wypQz1GCRq2xUTrQ0ZHgsszotDNGdSNVn4KppDpMy+L6gJBCQ9mfT2BN4Bip1/OkQVBbJ4kX@lists.infradead.org
X-Gm-Message-State: AOJu0YwzlIC727QAgKsGwR4cgp6BT3/6Pp7UmA3xNYMd1NuRPjevUtWY
	UflQUR21Chig5C1wSf7TLmEH8Je6bFJCQw0oixxwK31IJ1kSgh2NL4KQygvWKz2GvbrSaSZZx9O
	XbsXfjBFAJ5Buj8Y19UwhMnezF0pOCj+eSsvEhY3bB7FZMjkDxVOPrtKxxHTIpGZfGLBPa/J3RD
	jAmA==
X-Gm-Gg: AfdE7clK95xZIV7066oZ/Jcocx87zfbgkPapiFnCcOuAFDYbMkDpRjHUu416Setgjfx
	mFfYoSuZVLIcoPA9BHFBZRdFqih6586M/RNVJCEHTB29uq+Rcs7PXirOiQFuB6EUzOs8fq4IgQd
	+q2eO0BJS7sktzckMlPFPgtF4CijB2/Vw3Yx6bIR2wEK0XlduG31Dm5iY6dwYg2g4aFOI1BdQmy
	w9QurDjx0ByM7Vk/3Oc4hFcqPwn6RfWn7aGp+25ri05CuHzA0iq4naq5scNEtB5NITzew4w0eYM
	ZQE2rlzYLQaRzDSouiR3yd+uAnmUJ2rIJRn0GdXXoyd2My3GB77you2eA3Q2LNoH/P0sS23P30R
	+dtcMUS92i3cHrv1VfQjRyPgJcbWa+cR+s422WOZaA5b+gT/9vdqXiFzc/khuro0QXIrWDZTcSQ
	==
X-Received: by 2002:a17:902:ec8f:b0:2c9:ece2:822b with SMTP id d9443c01a7336-2ca44889405mr30905095ad.3.1782870886730;
        Tue, 30 Jun 2026 18:54:46 -0700 (PDT)
X-Received: by 2002:a17:902:ec8f:b0:2c9:ece2:822b with SMTP id d9443c01a7336-2ca44889405mr30904765ad.3.1782870886152;
        Tue, 30 Jun 2026 18:54:46 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:45 +0800
Subject: [PATCH v4 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-5-aefab449a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870848; l=1699;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=OBSctkNoPUXkv4iIPY07zyqOMNxZfKUYjyMh/aKW2us=;
 b=DA3VNt61VJoRRUhPlCsksJ/tb1/he7RYq8J1STLfm51nmK39SVAnVB6X00n0cewpsdBoqJdpB
 JT1nt83u2tRC+Yf5yy+NIYonPjpxkwoJLPlmL7bGr+jjXvozH14h0gx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX8CCkJm6Dn66C
 Gd7h0LMIs5nLBSdk+HX1WoXKTJySYlyGIQ+OCa4ALwdok+LnMJT1ZV/MRlGDiiSSLEm2G55XBnW
 VI33TPp379x9C4a5KN3GkW7tPlcMHQEJTFAgBhh6mqAZD1VBub34sN50m5vO4DyIUv/bOihfB00
 na5z0qM5uCwb4RDN/XoDiAP6kL+z/0FjlZe/T5klLRI5wXOgWXcFKWKFZmNHVTuiWAETZ9p5pem
 xAMinXaOX6lFIw1kS6Ujrc8RybYkBOFnJnsHzWPOTJCLfwKGsQyQYDKnaMIIkYW07IQHUHs7i3r
 OYO8ChzSQ/G+JI5q25co6k+KYeuwDfZ5aLCIqUMq47rXtYtRuWlqL5DgmOZbfmKiJJ9CGSbxp0I
 WfCsFgCplmELJstCowR+nQxEbvXERnjrY0+BLCqAtnT96m5UjC7WpV5wpwBEqXTf+75A6Uqasjn
 vASattlTtQkYr8zE9Cg==
X-Proofpoint-GUID: sUAuJAKMPwsUb9IQhpex7QI1bXsZAEBV
X-Proofpoint-ORIG-GUID: sUAuJAKMPwsUb9IQhpex7QI1bXsZAEBV
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a447367 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zFLblpEf9OP3IKm3h4oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXxEXiU1x2h281
 WA349OOlefBshsTRDO6j8j20hCAYB4n4KDucEzNs9tdC1lwqvqPpz45fAeoTD5Tnmu5Xknq5Y/r
 ErhIZDOSilaFcsssdESo5h2bYKl8T/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_185448_976128_35785A87 
X-CRM114-Status: GOOD (  15.75  )
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

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It is marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never
assigned an ATID. As a result the aggregator has no trace ID and cannot
tag the merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace
from the ATB sources within its subsystem (TPDMs and other ATB masters)
and forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-agtnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

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


