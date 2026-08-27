Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF762C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=; b=Z6H8I5mC/JoRp7Wcp2zVl54b+Y
	HBPxG9xavE16j4hKr3twu0rPZ3iEciN/9kvR3rXavIov+dg3zhyc0W2ziG6lZHiWwwaN0Ari669MJ
	u95x2QJ0BUyddpY2ttTXppS75avzyM50Fe8ceYt9F2zB3F9lxypxibr4qstYE7nuyKUJUz/VDOg2a
	NlPzZsX201O42nVEBjDvIv5bY2Q8D8SwhoyPFTgwgcYEmSuNkif0hIVSvJqupcNC1L6fjxNhTsc1h
	h8vSEPw4TOFkmI33sM0nVEi2tjNOSpseCoMJfiPg63tNjkOs+QpPbxOoSDDz5/aHlQYOB4KgsSrUY
	S7R8ZBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd9Z-00000004Ndb-0usY;
	Thu, 27 Aug 2026 16:40:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd9Q-00000004NWK-1SQr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:40:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RGIRq3708013
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=; b=UqZLxvK2vO91YEUi
	pJZnqFrtif/Sbdlr6t6TuICOpwkSgbdXgQ+/OLP7JsZwqsX3aL5SzqHIEeALUdlJ
	AG5hY8cl7fg2lpLy373f2qCApuqXqgTSLOYAnszoNadgMgKliyrvkUaQzKui+NVQ
	iw3cgKnn5is+D70fa1MM5InWm9/Yh8ZmqJMhXRF7dCwNeMrcKS4RpzdxIN5JNoO+
	/iQodhKyFHYTul/D5tehAjUKxrDsHDzuTo4d+YiPVvq/MTvMQJI2flei/dQS0R0B
	xOC3cIuB7K/9wJ79jwwQNPmywFSK33dgwGltmE6WT1a0NNL1RMsPTldsIxoXMBXE
	sIbhbA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0g2sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:40:27 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45e6091d8a1so144129fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848826; x=1788453626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=;
        b=CObBFTFcOsKGWCvUazO4IrVW9KWP4aZtkyO6EPK4iIvxh2bK0+45Al46SApL5PTZaC
         8BofGAM57W4ASlrxQSeCvB4/QZsdWcT3AaFmNJYrRl4h1insGt2fZpGYeacZ3QLIU70l
         grDDnuttFpcypBWBsANX3wI8VVHNGGgr9hncp0LCISSOKzOD+43IMSsazvLeFiTnX9ql
         gbkTHfGd5nZACFpHwEdTbhlwmjAlQpWt6SfXZXI7PUE2duM4Q1BVhFrFO6yuvFK4FO5B
         /SfoW78lUWmlycxbZaRqb+Eg+7wrmNS1TmZJAI7hsNfDBhn4LZsrMACJDu5YRCAtKGlx
         va6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848826; x=1788453626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=;
        b=Y9HlraZs/Qog0HbWrjqfG+AuW7QerfVSInAyO3eZMuaKmPeosbu44jy0qI+4siM22u
         9YLZ7CPNsPMefFo1Ik81wdkQzlViD0pgFk+Cze/O7upuUKe7IwQn/pnwpbdGTLEsdVs8
         ERBmTGYfUmsl75S3kaWxgZFKo/aXv+bgrdtbLFyZc6q+vKQPIKwU/oSLMkLfcPQE4YLZ
         0ulaSG/1jsyjkVfN9L6MxRk0HYSW6HhUUIxdILLBS31zfR8MAvMCDlKxE9uXGYLfDii4
         wIEogzkLwl19PQhTiH5ac9w1JnXTDIQwuXwWW/EyWtdNwpUOVbC0AbbTHIJTHDXakkyB
         rDAw==
X-Forwarded-Encrypted: i=1; AHgh+RoprAwTd2xdQtvzuBFg23oeZuP2DjssokU9H0ynAtE3k7V+XsGG8M2XouhurGhf1F/WCZPSOad3ZmDNAh3532wf@lists.infradead.org
X-Gm-Message-State: AFuF++mWQ765Q4kCcXzSBaiQhnFZbSJzFydlPvWUurSayAi/waA7HRt8
	ylLm7v4XoFt3evrufM1yhydTe++FZrX6Uat24LZp7+CYDlFekG8CDAx3BBei0RarIfA+dbcuLZr
	AQR8b9VNBHfF588jeCgtiOCFJA9809QPqWtWUJ2EgYHEPGT3ihTbBD9MGXt/lQHG6/ef0WSEqFi
	IKpQ==
X-Gm-Gg: AR+sD12IJpwDc298P48aCvzljBCgct8qBPd7zTlXzXJQG9hhgScllY8Mbzb5Zapzaqd
	XXP/d8f9L5RojIUXJOvUhTdTiVZOEqWruf77FUBvB813cpe8n7XIblAYjLfickLnNZrksJmfjIK
	rxp5Py0wTaYqVHp/gbaFN1BP4Anu2t1X6rJp+b5oXTJmt248deAt7IuqpgzcYzoFasd3CE+jAQs
	e6tYU8tk+FQlERSdaRFOtmvChwBeAQKKPEXx8bLhUi0G7HopKR0FnoJsjscZF7VTp7S/gDJTKUT
	neXgcfl5suoch8ZQGvD4qlDSl0jo6zNEPevESF9OiGpSjO6yjhXaWOPoL7AhkbhalvzazAfAbau
	q6ZDsuVlCikyoqCMaO32yvA8yffRPddgAPhlon27gXC4AL5xkHvj/E/Njr+9WqmSyE8Y26Cd7rl
	sOmuUQJQKVKGriDQ50OUzP+jA=
X-Received: by 2002:a05:6820:708d:10b0:6b1:56cd:3aba with SMTP id 006d021491bc7-6b1a049949amr12074807eaf.18.1787848826582;
        Thu, 27 Aug 2026 09:40:26 -0700 (PDT)
X-Received: by 2002:a05:6820:708d:10b0:6b1:56cd:3aba with SMTP id 006d021491bc7-6b1a049949amr12074748eaf.18.1787848826104;
        Thu, 27 Aug 2026 09:40:26 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:25 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:15 +0530
Subject: [PATCH v4 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-14-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=2321;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ItYoLNnh/itsBdfqIb42AjjkJMdlnXNAkIHidF5zyeE=;
 b=87A7RM1KwSY1nYcjjTADj26yrttlOs8VbML+sC4mpHS4sR2pDHR62sHHEgj/sbMN8OGieqOo4
 BGSVUijMSaLD/SZXRClKti/MQbD+R2FJWPXbUf62hOHrYAp4gB3IEMc
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX1ULtfJ7ql/7q
 GcRrOMqiyjund6ETIAZ6+AKDjMLfLW+V+OPOu5pml0sKkIccqIkuWUodW87a5e6rrFLty/vZvS0
 SKMlhdCNfaVnLgElpOir9cIHpznFvvCgGMZS3TDTKqANTS27Yu4oI7tVJR94BPKOshMVzQ8HmNP
 W4xjCJrOmaoQKWCNjIUvKOQKgPcgHd71b6eY3BfjifJbUBzUVJ/rVjoCiUQo09Dsrl+ErTAYwH6
 05tsOd78TpbF4n4EwdmQAFt11b2wuX50dWBVDtQjaHWOwpELoi6AQKsVuU+b9TQHj9NjHfKFVCN
 O0W6mCIltMAuvZWAg6KrX1W1qQZPvN3CLsFvF484Jn4iqATIXQ1d/HOHfVHid9iy9JomarzpDx1
 jmBH+JQ6Dho8q+9pYlicTLREjk/vbx1LXWG6rW7rFW8UamVKDk7BmL9zbwMmel22wocfXQ9lKDZ
 R0jObqVw4PXCN39jCuA==
X-Proofpoint-GUID: qqvHJEdpFItWkjIy98O1TSl6rqZzbdI9
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a90687b cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vXfy1ps2I0IJequeNBIA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: qqvHJEdpFItWkjIy98O1TSl6rqZzbdI9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXycIouh7NHpi5
 sncu53CIlEbNlK5qPQ9yCWJLYOSAFwqTGMIex1qtYJgMmuEV3Y/ke4UyCECdTzgo8sIFUZJqDdU
 8p5FR8FNOugFd8s6Kw47zX8y9zVFxz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094028_662950_99CC463B 
X-CRM114-Status: GOOD (  14.38  )
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

Document the Qualcomm Kuno IDP board and register the "kuno"
codename in the SoC naming convention schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index e7160b63d814..179aadc86a9f 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..ca02a2f0396f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -175,6 +175,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kuno-idp
+          - const: qcom,kuno
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.43.0


