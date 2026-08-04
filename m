Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B534C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=; b=ulVggZk3FjG+2aryAdTHqBbdmO
	JWiytVxohsnpmEKlq5gQSvhVO/550UPdbRqVxAkQmEAoiEu2aoLGwkRniqJooCOTiRy5dYsH+HlpT
	O4bHkvp55sEDLjQtBQybXcu2155c7S663TrAzQLjbmn/ArffeaSQSCxgsEEL4y2C7UPC8ocIbKls5
	QBQgVk/mXsWqrUHE48IDEymlmMMPkgiuL+76BDqDY4YA3KUSa4Ibeyms9qs23VH0juxBW9qgemcsT
	zR9RDPueifC9KCOWXYSFWmZ3Ejae25+PtewfSduFOVSvb96/6021RFtLJvBU31VCUoFA5iPPJSyOJ
	gFg9dD+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJI3-00000002XER-2UJ5;
	Tue, 04 Aug 2026 17:50:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJI2-00000002XD0-0ice
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Aug 2026 17:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=; b=NWaMfR882F5cb2KCjLifgGs+Rv
	wwnthG8RXWDCGu6oG1L9uvc2GcRBH7stD8+gn0FUjET8+mpbniQp8/j61oRnYaokcADMqsK0lZjCM
	4i52rlSsE+orz6HBavO4WT97WD9jkXRCnsStNIKHsjoc0b3uhII+EeXKOggygU0R7myP0u4J/gUId
	Bvb70ww1PR3Bde+9iV1seBeZI0nfEC59wjBYUG7FIITGciCL+GBXTTUQTB09rbt4Ei0nH1ASW9rh2
	11JY7uHimOtUbTwUMWHlR52oHdKk9fjCE65hSMOfKPp/m9UYlqu86m5PRTWLhixK0QuhihJKfbjyC
	5fkVovxQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrJHy-0000000A8YN-3NeU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:50:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H09lC268774
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 17:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=; b=FnTfGHT3qahxkSb5
	/ijMOmXTgkzHc4IFg8IvtAG5p95ZuTyDoQoAS4J7wz2cH91C5Lg9kDcC7YzLpFY4
	Rn82kO7sHVRw8WSaMwAQH4FKJ2Q+P9+qQyWzT+Vp+Ff3wXJdXISNxJxhsLT+FPFU
	CoPFIaUlcb3P6DQZllZXZ0Eamhn3hwHT9lJPMdo3wli+vpmnotUE/NuEOGN6Zc7o
	/4TPTLM3uKqX2tapj5UiEZo34N1Z91jxxWC7SLod/aqPfDXfIa7J2qyxF0R+WpWW
	xSdB5T8rVfYHYqV7d15uHMFugVw20WLL9I0bgq6oGu4ISYYXJ0UHR2+WUgFIo8x2
	Jv7Q7Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3nr81u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 17:50:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so46051a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865838; x=1786470638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=CFEjH0b1U7mVMo4aLsqEN9rV7A1cRE27tmCpJy0Z8fSVpfp9BLg3RrWnq4ILq7SdIO
         A0hgTYHZF2N6e2lOaTgyg1hJ4XEbCV5WYm+qQzllVPbS0FCmvTkbOUAmGynX4LS/1nYd
         e/VVpk2sifbUFdzlGvA0htqrG5Qv+2TDho9ptIru2pLo5v+47KWCHI5F/x22vACRm9j1
         jif2YVHwuzkG43K+1BFkBap+io3YLQAQbPspZbx55Owy297KjMecuWeL012gz8k5Ka4Q
         faqJa+9CZi0ThQAJqxzDeJT8QpLYMCrZPK/QwCdD8y0qD35EqJJMhbr/lTMO7a3gkPAJ
         hkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865838; x=1786470638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=RQBNSbo2dmgFOT9VKfteygbUtpqz3GAlvCN7V5KuRT1lM8bWbRinoGADTfwo6teYZd
         g2Y+ofTA+D/wXxi4a9rWf7PpkAVAC6GX3t19dwK+5uEzehPLR4V6p0kqVBD5cWrNUEQ+
         +2hxBY7oShIxMt3xbjbIwcpLTmau9v1MQj2IzkDWrWAGZqJ22AKzFmr4p04ON8tmj683
         M/zK//BLjNOIkP/vOo6UT2TT8p5Uj/5YvDkDITTkzh35qLF2sAHSnOAVTm2n3k0xRGhk
         tiYl4Vt3k85m3UKPICEwhR70lJa9FuAts3kPDhc1FVSNFxWbqRZ5rP0+hjzkaslnrp31
         WvnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6tOkfrA0CAz5UeLG3a+AArdQU29IB5959FtukDTorv+Ee16ekQgq9Q359f4jzeip5l3wst3Tx2EBWnAiMm/SN@lists.infradead.org
X-Gm-Message-State: AOJu0YyGJOTC2Nk+6ESH8gbFdP9tSZHrJSWjsFes5vt6P8X/AVkwwDKC
	tLjcLJSK+2m00uJolT9L9AElhnNJ1xS+7ZK0m/A1fZcKQMML1JPYSlf21zosDtMBIoPiRPUqqbG
	13mZgrjWzXZ/cs2aMTMHEeiCuztjRKyltYpSNAG+aT4b1Mgz51Yj+nqXGCWvxMn57yT1tn17ZV6
	vTmw==
X-Gm-Gg: AR+sD13/epnQ7GevUe3aBbTF0Kz5EzI+Mq9uD2cKV/zWgdqs1VPAUfn3cDVWCsPZl4y
	2Tkb4qnonx8LqSX//ngB5kxpx+aVsRcViqNIqovkiAq52bA/gbKt9kALBVYyvCzm6FQ3uTqvotG
	eQXU4cpLsMeaSs6sqS8xCpVUPAqULtNTJbMUvQl8nStU1lmAQR3ID/NZ1cYPsEfBRDsnr3kFQeA
	SMeDYSjolZF+EonSzVpKeZ5vUcmXNpb+6nqFLsZvC8TwnDGWsQHX+BVNF7+zQeM1bs8bPoXmIqU
	leOTqeCs5PoXmXq3Elr04/TApgczOhSZ4jSqCkHxyjVr4Tt/Z4FY0M5lU0RV9eyYp76o/I/ik8V
	4a1ay8tcnzWZS+LyhroUI3B/Z
X-Received: by 2002:a05:6a20:d48f:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cb86027257mr488670637.35.1785865837971;
        Tue, 04 Aug 2026 10:50:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:d48f:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cb86027257mr488615637.35.1785865837508;
        Tue, 04 Aug 2026 10:50:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:37 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:14 +0530
Subject: [PATCH v9 01/10] dt-bindings: clock: qcom,milos-camcc: Add missing
 power-domains support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-1-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX/Q1joDjFDijp
 0JN7+GDBTQ+10kBXyrhrB93utavLNWWWpstWDTbn6fb00hhZ5nXRamaJlzOzxLus7+Xe9iplAQN
 e0HvJINn2uHqWz1pfmOS7Why6f/+xoyqG8Gou51jm7Ah8y1wQwvu6dQdyNHntfvuymzCm3yhtkl
 fy/HWR3DbWy45lfnQXWxtbtBu/ow8MreYNdxSt4AMntqWQgTzOj3s3rbFlU0G2wvv9rV3vdXFE8
 DlZHuWXT4HzcQDDZk2SJ2kgNlN9dCrPjtTGGYMusaClxydbSJT997OWLuyl8OwT21pZR5L/vIdB
 l6mUJ70AwuwTp4HLIjHKxA1UlLHHCT02IKMW8U/HJc77E/bwYL7HWL8A5X0BeHnlARlAjpZqD6u
 oqWbdVPL9mopzxw8XHCKwy+c/f+wVJDBrWPHfVU2UY+/Kp5OQpwIl9w2PsrhHaTh4tgpC3105h6
 72lrNcNTGYdCFmsTAdg==
X-Authority-Analysis: v=2.4 cv=AZqB2XXG c=1 sm=1 tr=0 ts=6a722674 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: rWEgKZKfJvaOwqvXRjM8OKeg5xMlgiVn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX4eNrW5ocFEZY
 BXsNQvcXZ8QNt5rJnh9qXEDfkdxqQ5iJWaNG3+zByBilcKCxY0dy6PUKecOpzMQRP56E89WqnfF
 pfIZK/H8MrYhOl0QYwQWI+MLkWlP/5U=
X-Proofpoint-GUID: rWEgKZKfJvaOwqvXRjM8OKeg5xMlgiVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_185055_592561_C919546D 
X-CRM114-Status: GOOD (  14.07  )
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

The Milos camera clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented qcom,milos-camcc
compatible, this is an ABI break for any devicetree using this binding
without specifying them.

Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index 707b25d2c11e601384b9b21b7e73bebf72c674da..c4aba40e316ca746c7ecc6955823c7d1292d5547 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -29,9 +29,21 @@ properties:
     items:
       - description: Interconnect path to enable the MultiMedia NoC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -43,6 +55,7 @@ examples:
     #include <dt-bindings/clock/qcom,milos-gcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
@@ -51,6 +64,12 @@ examples:
                  <&gcc GCC_CAMERA_AHB_CLK>;
         interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
                          &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1


