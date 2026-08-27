Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8865BC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=wcY+XFJd92simUlinsAY+vYtsJ
	dOuV2N3tv4wfTuh6H6pE/IQkFqqSprKIe5gx+mAfApQqgb9T/r7NvVdkdi/ARSATbt6hDTfcgQB12
	BhY/ti67EnkF0ORtJetaTl0h9a6Z9Gq6zrjOsMOuktLZQQmSbCd10dkng/9gA7anRluwoVIDhED6p
	kiqSvoNzLtXxGS6WwJPTr+VkE121eXvo4JqmR88fEVjWLaVwKrbbANEGxvPexNsQ8S0IQA7BUbEt7
	g7av+n/4nylvvdPbWJCGH+1XMtdif0QxfzVx5EwUT7xz1cQgJIaPzZFdkl3NOA/L+KAi3VaKdxEKS
	GORy8Gzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeID-00000004WPL-2pIE;
	Thu, 27 Aug 2026 17:53:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeHk-00000004W7j-361x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:53:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXeix1568365
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=mgiw19cLbzJcHRK7
	VwPAevQ/8uyHAndrw/snc2A7t2KInmw2k7/t1GZQLI5Uu0SxFiXzsU1Z8HGkH0ub
	cycv9V5eCxMoxfC5Cf0jpCUXs8i1uThgt+SCm1U6a3UMKWlnZKGlcgpVoqAfQHW6
	li/clZWX+3ik3xxqlm9zJh83itxcg683aGzkaaJ6AlNvlF0x35hQnaDWyd17XwOr
	GEIkEPvuUUHoq+XhI0nv+XRTtFTHfuk3csTxwuecRqaN9ap+R1tqQ64vMukLNr+l
	tU36z+SwvLHXS7vW0n7oWXZVS+xh0uggurYrejOaFxgyHdbN5xFCWKiV3sermd9e
	hirGEg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5ma4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:53:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso1427727a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853188; x=1788457988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=OR7XXeKJv0JUpixDl1M0y82AqwZBFFBAbnz7T31buPaQsdLA4wUuXpwcovNySK7t36
         efZKhWdx9ZTD8V+xHHEIF89RgjqZfYiljUHt2CyZ4M7W/g3vjCkkVn6Wcz+MlPUAf//m
         hSJj3fKY7wkf8Tj4Qz4PbRZT5Fce6eD3GiE0IkNdw5BaJF2J+24UhmiMa722s7k3DpOJ
         MXvXxnQTIKDYRr1TAyH7jXbbkI6i2QFigD93alKcE7wtC70R0msXDcOiK6uKHv/nefsv
         Dd81N/RD/fSw4fv6hMbEF4mUAPBMPn4WSP7YsmVaI6+pUZEIiZvTPM2iIu88gM0mlWBe
         WTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853188; x=1788457988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=ZhoUDqEGyTgmcG0t/TTZmcAjVxfAjdY5R11WUP88eMNznATVq4BRUbKIuYkZs4nFoU
         SptcOp8ZHMDAwyE2YwphWwcStCF7QgcR3nEdfm2l4t+LnqSiLJ7d3R0Jyvk4jBukJvEx
         sxGBjKxhhcNJWoYFB0jdB+qQQ7u2K6pV6EnbvtwWFTZMmnJ8iMFPk3PrZ071oREzXfkr
         KRjDgwirojbuZ9tfYX4KpniUb9cpKY98iyp+VRDnhxuBEQIMhtotWQzgqKuJOtZmcAqz
         dwSub8RpjYYIkdie6IrfQgpWzQ6b9SwpLz1lg0sENGuUGdqp47gIOYDbUOQ5sIw6nKAA
         LMuw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6ftrw7JDmD2fn6+ki7lcNUCVBjDXw4UBxGMXHLkpT2H3jSlKh/i+hByIhpJs83Rhxy4+aToJ9LKN6UOlunKD3@lists.infradead.org
X-Gm-Message-State: AFuF++mI3J4a6yQGvepYzbV4YDPNNrEWJ5X70iTt8X43J3Jh0MFjbQq0
	Kfv5ZwLdSQxJSarCLRpJlDidRvpHY9R5C1tC9XsuHdrOLLnaYOXusG1pMMu8KRMkvr4NdyWd6dg
	Z3hYK2YcPw3agy/lw9kM8G6yNDe6whoEAwyv3hKtkbOyqSakXsRVs+LiUTrbrce/U8A9/zlMwLb
	h8Ug==
X-Gm-Gg: AR+sD10GHP892NwbuYTKpX6B8uto8eTKb85KUEPzzp15cFi3bW0z1y/Myy1zepV1O0X
	Xnw4so5cabRD0km4qEglHMUEpahv9EDW4/1GbFNulH3oRlFXcxu+B+JzdOjsNcQjnxLOxx/kWeE
	mKWx9VY27KnafCb1lP4FomU/k4GcnAIUH9ALhBFGbYI1f5iFWQsjNWpjgeJ8UN03RD+Jj3aEzBP
	uQ2oeN8mqZH0RUVVux4vgpMT8HutxWpfP8LgHVbHTyuAzhmnTbt4RZ5PaRGDOuaDx8GN43Xo1yd
	AidRt/U/uxdeE0cqLpbfotDJwzthHw8x2BRah69TLqGj9tKMv4mwG/ddmiPELsIcoifkpP598sz
	5WPPK/roHQaeJ8iwJeH7Scg3wuD/ZTKBDjfdHh1aNh0yHxVp+VIi4YlHfuiBiDhpKuBs4c2JuQ7
	HK1FCnIK+BNMX0Sr0ltw1iQCI=
X-Received: by 2002:a17:903:22c5:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2d726b17867mr108846235ad.15.1787853187596;
        Thu, 27 Aug 2026 10:53:07 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2d726b17867mr108845825ad.15.1787853187160;
        Thu, 27 Aug 2026 10:53:07 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:53:06 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:16 +0530
Subject: [PATCH v5 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-13-6d47636a8f09@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=w78Pw/hDL8SLhPCEJMXKoxFhO6U0UOpZUF5rYcwLAwMKc44iN6Fghd4LGUQo47mNIYLcxJvJo
 zAPLDw5OR5UBab9ZlI6me33T5i3eV780/WGOyOnbwyhtJdakaPzl5cE
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: pECriDmFBpkxurLBWt9R63W0Xqhg1LMu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX2c0zqfMdhkjb
 3u3kYNNCVucdA5PhJnM6kcXn0SrpUcnjoHQ1LoTXe20cBAssTKwkcodAww1W7ASN7jlsCkCDizL
 m+Fd75tEQ3aUkNuFgd/tXr6vMkQinnE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX2GTrn9gblZA+
 DVYj1IMJitGXLO3DcvgtoI82/0Xw0f7D2F+ZoNnMpPZ0ZX6aZpypWimqqbxzkrZ0by4t47EB9ot
 ot/hxW/6X5hVvrSJnOHwvzNgRV98Mc/jDoJiRrf0ztix0xG1VUAc3D3bgzu8aqW9XedtUsZR5HG
 /2tb47nedHBgw7MHn8sfob04n470g3n8JACOg9+VvshXJ49DWX+rOrP6ebRev48M71QM3cWk8j9
 XCO7wjL3WalUwfhtCTj6h5tII/XdwMA7YzxGWqVXl0KcvIW1ncmiijmotxlnaiqnQnx5QXM6vIg
 Hl5a5HsGL4HLVaVmQ3H8wd1U+P4s5glsWYuTNa6jdXxCwpGvDMVTQZcr3Eji0V/xRyYbLokjj8w
 j+mqpgmwsDOygKv7BjJDPc+u7GXkQ9eZSVzHffg6kqwqNyLoEWUDwafeM7il6nBSB/MnNqxJ2Jg
 Z2JiyCd2mPHTzfJgSYg==
X-Proofpoint-GUID: pECriDmFBpkxurLBWt9R63W0Xqhg1LMu
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a907984 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105316_492035_A43E42D7 
X-CRM114-Status: GOOD (  12.15  )
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

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0


