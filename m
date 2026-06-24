Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AD9CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7bOFXZVwlQEkn2VS3KF1SyH0v0aXor2LlSePWOjJIE=; b=d1Ym3hjDgsZb1YIP9kxsfpQOSn
	nkdRmIMWTkr4f8q03YD3a+qXQFsZAvG/kB32cWftAVom24/uF91EZVpiD+9qp6D18lcDQ5IkoKWoU
	d030bMGKuT+BJBoYkEEx1Dggm0UOSbZxbHkFFDWKwat7pmjmtt8RlHbHxnZync6BgsF5BiHc4172v
	yOPyTW4kHeR26X6tz3lifmgJJVBX9mXOSWgIRAMVvl7guXW58Tf/S+1ZInQNsJaLlCRLH2IfRxuwk
	D0iTzmgVAA0sY6Ha6rcxoZFlZ0zJYfEDiVCxFZOUbPU3FMZPG5uvTuMO2gvSR/3pU/+LCnrCLIB4b
	N6KlXVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKF2-00000007XVp-0yX4;
	Wed, 24 Jun 2026 09:49:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKEy-00000007XUT-1cJ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:49:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5trdn1892199
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 09:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7bOFXZVwlQEkn2VS3KF1SyH0v0aXor2LlSePWOjJIE=; b=kaFnbRwM6fH4hEQJ
	vBqRqFDk302eKJJhBka2JLv35VeCMjvGgx95OmerNEqfTxW++1Oxliuo/kt+BS4G
	mj0eyxPwKC/2Ehqn0OuGQj8r0Op7VYuU9w3apWUOfkqlP4TXLfmkdhCo/CRETvCF
	ROdhO7gGFM1QHuIGCsbUgZN5yNyC4tUM1JoPXqto4kDERQX1MHwRxlIch1mrK+QO
	+9i75Pq48ZF6xLXzp5mpFvT6eXJA6wTfarTdQby6y4dUSlxvJVNyJaGELOPDhCZg
	frEaljHHvnT66BL4gz/eKU6QLZ/LD2Ipd78oBb00QxtnqLWtKb2kqaBt6MWCsMaU
	1xJATQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bf9k3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 09:49:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423efbfb61so715011b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782294591; x=1782899391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7bOFXZVwlQEkn2VS3KF1SyH0v0aXor2LlSePWOjJIE=;
        b=hmqUwxWK82eFqCAilZzi0HPWVWl6yKvFg9itxqb7vLRfpMtQOr71jHbmFYmPHWBbEg
         rlDRBi7+US12HRqk2iaEnd3D3qAPOUMmqPXSqZCRxeLNIN6HIC2LVDS6brYBkbpXv5ZE
         VCgarC4eT6JdpRCEKmBqnRHFvWOI144H3p/vRl3xf9K7uJPJCriZktm7Hoa37oaSWflL
         DhggEtwx7A9ERF9pnk0RI/R5JFrgyYfQcqXO3lD879u4dfBiBup3Z89+iItCcCUkEB4h
         Jj5jDy4fOcHt1svnBzr2NVvM/TF0FjR8C2VDY7dKxSAc9quKz2MDB4PWEmBZKXqM4R26
         FuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294591; x=1782899391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7bOFXZVwlQEkn2VS3KF1SyH0v0aXor2LlSePWOjJIE=;
        b=kgZhF6CWCEm/vcbx4z4FDBxr51/0PGI2/JYN81V7am1UIBK75R7MJSfJ9pNzAll4uC
         oS3/D8q/zYwy1loJ1A1H8FHqol/HoL9Lag1pI4VvRNJhvDfmP/ErXCMUNvN/HY0yiW85
         boye8Ul+BfCYR0X9csL11BTqVU39RUcERAMBw4UPJa5h1hdnwHDJOqcZCEyot38uG/Dn
         RTlSQWHr3rtYbNzQ6q03TVNEpuC5NuCtBI5UdC5fDkAxXM0t31gJGQ4C+4yIBXbubyA+
         z5+wbfbWe2WQ1/tKzaKQ2BiomnsdxmsS0yvLy98/q7BPduzAKkrnNNgLZCGhgR9e6AxH
         oRag==
X-Forwarded-Encrypted: i=1; AFNElJ8nAq9WxkqYPRLw55124v8rk9P1AmLef1Wr9Ai58RuF4llpZwc+vdkD3+quU6Cu0RGZQ41hlXmoPDdg/bJNM4W8@lists.infradead.org
X-Gm-Message-State: AOJu0YxHs4T3uEY/ekitJd8E2J9NZ4DdAaQZlVaF3yaJ1p4u3b6AFShG
	YoPwkfftzsG2oN6GlWjOGJF9e7xEHdAozL2Sr3j+GUVBL9Jewm9782B5+CWukPgcvkB0QGB30d9
	6lSzRn8pX/xJYaDKTs3hNR+6M1C+MICGP6R+GvTkvnBN7h03noqR7dy+HA60pPaMOKPyM33+oCb
	2TQg==
X-Gm-Gg: AfdE7cnfzkJwBXI3b+I7XhzGohkw+j2s52CWgtvRkSlR0/0Bjo9XAHOwN2vYtpbgjJW
	PdmAOQuCF14DfMoNhMTxsb0YHWQO/fxCZxKqA5MVceOTGolW3K3KumcmaAWxcf/kFnZhWUbeg0Q
	Mdv0HkvqH8cYAUYfRbHTadXd8xj8irIlo0A59quLqcrGASCvHS4Dkt6hUTOL+nA6Nkb/RaWKjxj
	2aAa4H2xsphmOXqHrFJFThVPbQoIn4OvaG+ZY4RMpxgKnmeSAPTrfeUUpHGe7FjyXab/JFF9ysZ
	MbQ+SmuzwdlQfncQGPqZGjtPlKFltUC3dCtWVpVZsU6PtOQEtEYWl3MfzMb6kl8M70wZISzMCIM
	qyJo3BjH5QD8VdqYAiVvRXNokoHcpd5ah7BsWwL7cp6uSR6Y2zRHjfjAZ1uddBEwK/vFXWHdRvw
	==
X-Received: by 2002:a05:6a00:3697:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-845a26dbe9cmr3498735b3a.4.1782294591264;
        Wed, 24 Jun 2026 02:49:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:3697:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-845a26dbe9cmr3498715b3a.4.1782294590828;
        Wed, 24 Jun 2026 02:49:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7b3sm2161302b3a.13.2026.06.24.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 02:49:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:49:25 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-tnoc: allow
 arm,primecell-periphid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782294579; l=1201;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=9fLJ6pohfE4ua8gQm+s3osBjzHmnBIXYoZ7LvHwHEU0=;
 b=mGk9CEe6vF0CIKtanKdcmqLnLG+miKmjeIkw7yFjpXCGIMYnRRRCb5BAo0RXtksf9cR5Ymdzi
 hCkh5FUOOSkAfhl4D2GLa+9m2EIf4Ba4AMjuPUAmLvpwKXDrJuMxMvi
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3ba83f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GsJ7H8QTZ5zs3khndVcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: nDerviIFXiZJvOz_fLyeJAaLi3yfSxsk
X-Proofpoint-ORIG-GUID: nDerviIFXiZJvOz_fLyeJAaLi3yfSxsk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfX6PCe6FNjVdGP
 4oi/IaZI1NAdq/H7fiRCNX/izbiI5AKz3ehmfhoHDcm02mEpwoAr4rvA9RcxdTglXFj3NnxjJ8L
 YY1nDmdPK7iuC1wEHhzWML8QoFdA2BA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfXyjU35rRJzlDT
 dkdiD3iL1AXERWc7qLf+1tKIME8gPqf6AHryY+CGIYUJtmxKBXuH529qBiui5vhNZrriSHGcE22
 je4fU0xtYpUOlGIIqvSEtEz6MNLg+K45oGb+GYUUZdnYur8OlzjTr832k23i+T+/9WuJW58RvUP
 YDC0ipkKN1wv36r+IW36AexmN9gRq6vWK8+6yO4vYXTUgsgryYKXX0Xfd8BG5am9TEqg+DK+POr
 HmRoKrulvzZ+7/yJfLvMzevkfwdCCf318DlU2en7u8frNShf8cVw6VIawg5RLBz5zLSbls1WttN
 8pQtWrCQV04yf4aJSqRuSsRK25LiXt2FyB2Y0MrBrPAHxisiL+0C4td+7oj8KlBQtkJpV8NNiYn
 JBTGGAj/hi6LMZar7zMD/jLSlfq2ceh/Ubp0KMZH4nKRoMMggVtCHKcYZyaWDZT6Iq0uYgHAFNv
 YSYOX4H/KDytIUiYHtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_024952_436882_7EDD4110 
X-CRM114-Status: GOOD (  14.58  )
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

The TNOC device is an AMBA primecell and may carry the standard
arm,primecell-periphid property, which is used to supply the
peripheral ID when it cannot be read from the device registers.

Reference primecell.yaml and set additionalProperties to true so the
binding accepts arm,primecell-periphid along with the other common
primecell properties.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..9624fc0adfdc 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -32,6 +32,9 @@ select:
   required:
     - compatible
 
+allOf:
+  - $ref: /schemas/arm/primecell.yaml#
+
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
@@ -78,7 +81,7 @@ required:
   - in-ports
   - out-ports
 
-additionalProperties: false
+additionalProperties: true
 
 examples:
   - |

-- 
2.34.1


