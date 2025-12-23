Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74652E6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=EZBlK/95N0dQQf3DHi5nqJlMgD
	D3Q8tzD4hobhr/xCFurzFEhQLrE6dfdhGlWILkoFCz57ZKgHfHIe8E+kqkqZ5xGywyD6pBxWlwqKD
	Yq8VgR1qH+xAQXPXXV4+fVteyx5v2jtfR58rCquQOq/FgWIMSBw4rmEbDGs2fqSepVePOAiFvRzJC
	HZQmmwdIERH15ZJJmu25yOz1PaDDvHPAyfOh2wPy8Fkn7gkR6MHEuq+nPzgsa3X9wFgTi8M7TpErk
	MxziQ285u/iCa67EDFy8L4cn0Kk4cHsqrYlGYJmYDlzc/q7fQTSy/t86KLXbOURG8KKZUPp6bELVn
	V99esfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5s6-0000000FnRf-1Xv6;
	Tue, 23 Dec 2025 17:08:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5s4-0000000FnQE-0SVp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFHcaH4045106
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=IFTHkIP4gCO+iCZQ
	esD2VfxvcdCzb0Qo5iM8UyRDdyoZs5+2GRuA21JG5HRUvPRNFUCI7J2bWmmteioc
	5CcLxPYMbE8vra3Mb7UQehJGpwqOMto2u8YdVEzlle0KubBRzhaxnBSYrcZgcDc7
	qJCniMtQBqM10SdehfWMGBSdRlOLfzMn9sZzJeBfJi1f7Uv1YlLKFL5lMNmq6XuU
	GlY3Mg5F7/PaWcQLntvnuOSms+13/j+K5s2yEBqzW9GJMW55t5IkHx5yQsMVGkpo
	4FsMqd4Z1uIeJ2byNmX3ghxw/a6M5F+I9A6Bb5S1hpUlx3mZKHsbwVUJzrMHrFGr
	OFtroQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhbeaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f177f4d02so115501175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509707; x=1767114507; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=QaCPycr/Sp6fBh3/fd1GlKsz48ou8Nv0GrT9wOh4qSnH7G2Zqe/MBOjU3fkexnrwYN
         XXRW/4XgkhLVQpY9TBW8Lf9jMTNh/77H1ATwn1Lsz74bV1B0VivzymIBKxosUXhHwI77
         O1/ja4m6xBVQtoPUWcS8lg7h5k38wa7GIoiSgEC4szDl7dwOfLPbe7h8ncqBZLshtV9n
         7Fhk6Nrlp0GtIoDRoZyOfHwGxnuFbKJtUnmTr8X0K4hU23PwsqdKLP8TabacjJTibMBy
         IWWvaeGfWJKnGv9qS35QbeYjLaNlGCX9DgtwCG3yE6N47kvWawwFfSpuHn3zQdUd1JFh
         jukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509707; x=1767114507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=vULWkgJQ/JU60V4etAr65C74Q6Z2/CVHv65xL0HDFIRxTB4ifwND6JxPo5G3G2cGwR
         y0y8zaYaDN8HLImQg0mhDWiEsPfYRgrREZ/qYuDZZv8jLjM6AdJlSe4OY9CA+2reACNX
         tMjXIH1DuvTobo6cabsflK+40N+GU/b6Qq3Fepqpn2qkzY/9SH18TNqRNcdLo1tXcgHR
         FTHYcF/KObxLbTr0IgAMeYbetepPe1i1RluGZuV8hnYwsO6FjjMAbjWtzmKnMUyyI7GC
         f4btbqxGCZYRjgCPGv/IswzSzLs7KVHpCdCOJaj8oOwVgFlV7Lsnhms+Gv8RGy83Vj25
         f4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8AzPQFssZp+b8YHOKKX7gjW1XTIvSh9vj5dV1kac7eLTQK3nc/QFJM0KN1k9TfayPXqbQQEAm0ALCHqAF1o4l@lists.infradead.org
X-Gm-Message-State: AOJu0YxDK2BruwN1S2v3u7CUAKzksrIhbPLLBNE/ugBnQkFYqEcM60SU
	MZfqoa4u0bKbY5E2/6ms31+F3Ul1rE0Doa6qjFaouF7+OB0rQ85+iXEdvO4jTu8NtV2bmMsoCnq
	Ac/asOTkPE502Xjyo/KkfLmrMzKBSbBoSEab32newthBfl2TAzU0730b3lv4tOhV+MqTbo3wO0Z
	r78g==
X-Gm-Gg: AY/fxX6QDRPJE5C6GRAVLT2LAQBI0bKZP0AMLnBzp8XyelCmPnVZ3yP21apbcDZUBc1
	0//ESiKEFbSGjkft8x0K7EACidwGMDev1ohamMfHdgROKnm1vM+XW7a5wItzasUZc5ITZEQlPN8
	OxmQO2/ZFKP9hXa/JyGwiY2S/98cHtNWTDC+ThGLvfYKulm5uDppznRmZBbuDWO1kcC+t5BqugY
	7/Swww+8rjm1j4nQGT40ydCUZ00VylaRl7UeK3rpvzSvNZnY1S4KOelSQEXsnss5NckHV3+ujds
	GXL5z0sVDR1q7zPYcveAddlzHolHib5XAj+x7jxRhCSK5l1sBr29+9lDvFe2vKn6NVtq0qOgUUA
	tY0ksSQrY9qgP0iuUqLKe+tJq2xdyhkAQJHxLk0KB9fYuJg==
X-Received: by 2002:a17:902:d547:b0:2a2:acc5:7a42 with SMTP id d9443c01a7336-2a2f2833082mr153857705ad.48.1766509706770;
        Tue, 23 Dec 2025 09:08:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzbQHGQiGNm8TT1s7wytBJ19OTYg4PZTrG+p6fVpioUAHdizIi5FXebJN3u7utRL4JFRecTg==
X-Received: by 2002:a17:902:d547:b0:2a2:acc5:7a42 with SMTP id d9443c01a7336-2a2f2833082mr153857415ad.48.1766509706317;
        Tue, 23 Dec 2025 09:08:26 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:26 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:36 +0530
Subject: [PATCH v18 05/10] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-5-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=2477;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=yBVN4FEHADdTSQ++LEmhmTEyByZ3pz1DEJtf2+BqO1w=;
 b=q8FNumK28qbLcXa8ZM4rvWLCTPDJr/novRp+CoyeNvg8BIzOUYt8Xni8SOmjIpKt2fOpnc3Hp
 D1GAhEWVvrcBDsBp7kMNU46hERQA9K1RY55AeSGyg60UWowaC1sAFLB
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: mNSVGC89u_jynQZYD4kIbvHh2SJkdFv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX9Y1x9U+jwwgQ
 miuxFJI4fKAh8miVdCR2wYHhh0aZsEBD7MLWtWZBJxPiPXxRChP9WH4XIYkpX4QC78d8Dn5+tlz
 AerM1wDobPS5Kak3mcd9gTa3a8APjjjqED2K/erYMwMn6RTC/UddliAZsB2fds5BE1uVTO4OggR
 nLsp0iX2aeenAfQyYiiDq9jz8oerGv25t9abJR9p9wa0WxwbU0jA4WJZDAj4/Av0Iv2m/maC4JS
 f1aGT123mj4JQRYeVCpQOr4KmWpA9w8aQSmWlwpj/H6aUMpKH2tD8GRUABVfF+A6mbK+kkM+3VG
 G6DyY9raBA7yyk1fTYePU0AQ7t6lBZ+fVGU6HGRJiCymVtjKKgDGIIqW9ICA1BDXnpD6/Uu8Z4M
 8Yhta4ZnSB9xIlfecYdEf6Fu1qSztw4FivcnMTU/7f3+qZ9aYaiykLNTSb3L8wYBrWEfU8p8MZP
 h+4/kdDWQRHxm09T5zQ==
X-Proofpoint-GUID: mNSVGC89u_jynQZYD4kIbvHh2SJkdFv_
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694acc8b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Z1E3qa2j_4PWJv3PNLYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090828_179109_5611DBAA 
X-CRM114-Status: GOOD (  14.91  )
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


