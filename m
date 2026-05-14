Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59914CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTI9rMPHkHzypbPrqZDsxdlgYSjaGzo8RGPBYAYLgmI=; b=Hx1sYq8UsQdSNchw0iaIECaCXO
	6KkzffEzitMHwi+mlLdberJuGXFCyhn0/WVSK8oKepjyLKQbBWftcI1N0nZlYfX28z5Js1E13uyHZ
	3f0N3vW64RtvnhejjJqUG4T5qtkUxEW6qCeKZY8qI2/AYQwnBn0gHq5gBI3Ic6tc25pwijcmNmoXd
	eFQUyUs3c4RGPwrAjGAnLV8aRnzHiHECIzSKTkNSfTr4fthx81QaPRrwrVS3zOWCgIOR2t+5Fktcm
	Pi5AySqRbOCfaDXTEVMcLgiWoTo8pk4C/W08Dybm2daAmjhjZSIOmXfk9jyQgN5FrTLLy83wfNMfF
	v4l7hN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX2i-00000005j38-1sLM;
	Thu, 14 May 2026 14:28:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX2f-00000005j14-3YjL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:28:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeQPd2841043
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTI9rMPHkHzypbPrqZDsxdlgYSjaGzo8RGPBYAYLgmI=; b=PPeFw+1iqoK7i4yD
	fpYlsdG3ljxy+3sh4dPRJHCnF1kZZGq0pbTpOg6NpRdQnSQnalBmZl2m4VZwwo1W
	MfzxtHAegc/+9SunKU+Yza9G09LpF1+4WTvkFp276pddt5T/Ffest7Agvw+WrGVK
	Qz/pH7Opwlpwx6PHf7TVBEmoBJiyXGRD+YRmn0crjUbP+XnTIxB3lpheVxqZM7oE
	eBntI/3hF1xM5qoKqAznBEJJKBoHgbh1TQNYfKaO/a9SXzL86zUNhyALPAU6FvYI
	P0CUSed9YbKmaj4JA5KN/+HqBZgNFHcZlK6KOCQg0nu3UFAGQ5BmyxunGVcpTB7T
	9JV9Sg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899st0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4654f9bb6so83928835ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768880; x=1779373680; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTI9rMPHkHzypbPrqZDsxdlgYSjaGzo8RGPBYAYLgmI=;
        b=Auh+pX2YHnjAI6Rs2ReiSmhSDjwkEAbt1wTkaL9IBchrDVQoj6bKti2ERKreKzsVLa
         5PlUsRBx257WKdMxlbNbZHKozjtRl7noq/jj1/H+RvU0qNbFBmdbwXZ140Zuc7diVHpI
         4hmuH6HMnvT5kT0taBKlrCZ0rvRY/WeE0XYMfobQVVGy8DFhsuGaFfvxcidt7Unp146y
         ngri+YJFzl9Sjt4drfezOEZqCkYAXz7gbTm6hxb0VUS233vCvRKZbyb0qq9PkyN3OgKx
         BxgNKoiI/UINxKIZlpekCc2U4cgrkrDQHDCbCAMcQ6ubD2+BiDjUK+OfkmGFu+oVB7ch
         TLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768880; x=1779373680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZTI9rMPHkHzypbPrqZDsxdlgYSjaGzo8RGPBYAYLgmI=;
        b=ZgDclyeTC04LXmCTgmnpHgBOm2LKAjndgOUrg38O3aNHwsPemIxzeSADHRxnEwZOzG
         /XRmwO5LKHMdmn+TPMha/YX9TslQ7SmL4ivJ/NXU+9feHIDXrE9rS+UWW0CyoGfZc8nn
         esbX/5HoRKsK5Utjek5m7s1yBuLYzPtPaLy3gV5acRxVtUFy+YurrCJds+4oFHcrwJlK
         DjTCXouMXhifF6ZJZH6pY91i5LnWcS+HPfkS1P5VoPZjzaFW8/80KwAqy9fshHoAC+D2
         z6WXVV0cVThTz0zt0BBvYuW51p4a6iVooqY+V7MRWVmaW0x+jeYkd7qujudD1VMZdqTG
         s9JA==
X-Forwarded-Encrypted: i=1; AFNElJ8Ad5KUi+fjkxSq8N7veaJoAHAdGh5UbuIq8DBU2RYHpUvHOgsP9pf5OXrYGUV0jhD3HeWo9+alc5KlozycbQKD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+HzQ1A7cBszkTViwBXyNY/rfAYC6Yf8v9FInVWFCT1Dk6Jz5j
	YJhv42H0S+6wnTJ5ZzLUs+x43YAv96IKhGIvHSO427jGhLolgJyhxpRj/yeTBz54AEq5u58H0uB
	IwCfDibTJSG1ZBurPEqS4XaAn3nOuPMKG3LRhXtauzTOa7sl+c/Xn+YnzhJmGi2fo8dhHDVwOHC
	jjHw==
X-Gm-Gg: Acq92OE09NjdV2rHx7a98D2E3iZGhGJE3ANsIO3iwlSk8l922M2f9a7gu0sjpt9Pm9j
	iUkW6aCD9wGoK3cz5R+u44FCFLUH9Xo7A5XsxVmZUBd8G1yZ3mG6qxW4UQWO0vUABix6CbtWcZL
	xV87zmc6L5ZcrGOoytmeqjLGzJPJHa5ijhhXuI75CabtOc2n3qS7VRdsmFvUljhrhNGWlY5wMwR
	GoQW/DXcvq9eceaOxkAG8vo1HNdRtsjiiOrxDtRwa1hZvAUbvYOjjj/lIquSbDnPlLGj3e+PHx2
	K0lMbgCUisC6DJuUYUEUeK1xzbY2RZMs2VXP3hiG0vmiK1BlpDoydM7SVpAMdf83pks85IiHbgR
	2zr/vHFTGvhBK9Pch7381aQcxA56tMkhTHx9dGBfVTMB5uK7K5/KU36TBJw==
X-Received: by 2002:a17:903:2b0e:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2bd275c658bmr90014035ad.22.1778768879561;
        Thu, 14 May 2026 07:27:59 -0700 (PDT)
X-Received: by 2002:a17:903:2b0e:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2bd275c658bmr90013575ad.22.1778768878890;
        Thu, 14 May 2026 07:27:58 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:58 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:47 +0530
Subject: [PATCH v22 06/13] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-6-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2550;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jyTFGQNuJYDeqEOF9acNm3SghnFKZKEJruoHnHRlxUU=;
 b=nou4cMkQGTWvLWiMi0xLAiR5Ug05Cqvd2yNDa5Czcy0sg0oQS4mbWoXgsTyUQkZGu/yUH68ck
 NEZsvAztiXxCcsCVfzuUP+ujvrxuvi6T/yc1+H1QmvujhSyFKS83E8u
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX42WB7Ly8S0gI
 KlLPrBTzKP0aSgeSgGm7yipeFk3RLTMWZTjO5v+y1Eh7jI6zGeSqorWs1O/7we63LZ8V081cBYZ
 VaxhZkBiQ5Hje4ZjCkDk63rJDwa78B5wmeUDcWtPFeDYn7s9EFFwq8CzOFoIl6ibusSgdvVGTj4
 ex05WOk6F9L1DZVt/AdXlTES7VfzSFeuolyJQ6FMrMO4q3s4VnmAA7ZZBonVnaDsLv7NPUeUpXJ
 SEmqKjZq16vYvr+CjjboQJ74+0No3m+VtOrgCBOnqApZEO7HwDifjRs/tMczDgz1BdfQHssRfJ9
 qpZLZZ+mmsyY9tQtUuj72b066GhZ3GiYzKof7n7pcSvSZ/wBRcDcu6LozStXfCsCoOAsQj4Ffxz
 KWlojyKStHDusVrl3eJAMgXfXQCd4LKkBJQRYfungw/UqYZXjCQx1GJKOA9HYnREYATr2qjpb/r
 KG+CvcXvwe+jvKurT/w==
X-Proofpoint-ORIG-GUID: eqtzs_t_j2ogWc9opBLk1p5983_gMD_-
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05dbf0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Z1E3qa2j_4PWJv3PNLYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: eqtzs_t_j2ogWc9opBLk1p5983_gMD_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072802_017000_A30613EF 
X-CRM114-Status: GOOD (  16.39  )
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

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841111fbb0aa8c0951dca411b94035c..5fdcbf331ea5620363638feb6f8105427a87c00f 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,26 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 1
+        maxItems: 2
+        description: |
+          Describes a vendor-specific reset type. The string after "mode-"
+          maps a reboot mode to the parameters in the PSCI SYSTEM_RESET2 call.
+
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx is the
+          name of the magic reboot mode, type corresponds to the reset_type
+          and the values should be provided as per the PSCI SYSTEM_RESET2
+          specs. The cookie value is optional and defaulted to zero.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +157,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +289,17 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 1>;
+        mode-bootloader = <0x80010001 2>;
+      };
+    };
 ...

-- 
2.34.1


