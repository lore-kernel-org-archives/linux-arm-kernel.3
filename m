Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FAACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=; b=nPrsSIUGZrV3FBdK0rdm+2mMh0
	YBUb1yyGm9jGIlQgX4SKw/l7W0csmwKwou0EUdq3ZLd86FR3DgVGbaI8kfqEzcvbw1tF15mI0Q84R
	Dmm62C9N8UcA42YwiUOxNTUB85t8Ddub3iVWjsWIe5tv/GaiFNlvkDPYJhZvBkXxq7fOMCyqrY91s
	o+RsAZqjh1AzoZxaBdEHCmlPlpjWMkwxvn+xjSGCTTEOYg9A6T1WRHxz9mFSMTSlvj2t3JI/XXnFQ
	cnBWxcgsxGMuEIQAFrSMkIhqdpTBBzAQ994z/IDMcjQnW6HV2txAg+TYMT3QZ5EQSovca7pcyNgZ1
	0RZcHrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxHC-00000002yHK-3Xas;
	Fri, 15 Aug 2025 16:27:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvYV-00000002jme-2Ksj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:37:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJ1Q3022085
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=; b=TqQDhu5NO39E3C9c
	DlAWrzjgii60srxIcxtdQyWR3wXwcyKy9JAwK0Wkm68iH40LRlh4KF0IrrRmhpXr
	6qFAGIJlaLFBGp7JjQUdRqZLfsXN7WRXhs7Xlm2ZTFtbq5352fFbqIiMDh26xN13
	ThczYxNAiAWCrLaa7K8ni610KyzVaIo6QiIvBA33rjsw/1A3TntedMJwrz/fTFYK
	/rruBS/CdTEwRshhZTH7JB5THD4K/PYqwPIT6cSJ2v2WA5NDCBSTXCDOtSS0+1Cg
	DZGcn8ZPjpYxUoLBpIetD3zs3PVyvbG9Kwo0SwF2Px2+vy9drgX/osuS7JZ8kfxv
	mf+r1w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmk7rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eb2b837so1567866b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 07:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268637; x=1755873437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=;
        b=u8qjPG9Y1ZdOSshY844ILdjcJkkiloaBQ/MB0m16nENqSHGHkKl3vCHBtdVh4s7C3E
         UBO53MtwrTwnQ8TE+D8hSk2/8z0cqhiHgAbwwc6n7T6zNdhl8spotP7Dtw3SHLq3FW5U
         h/MEZCF0dd4HX7I0ai6FlXHMh3uJq3kXTBS7mhvPr5XyUM4elIPF9qKhopjVN+chVBs/
         B9h+lI1xfFp9Zir6USqhTpD8PTTFlZl9qkxNHrJjNP1jA6BgjDdJ/ZIDfMxAvRLnmh0u
         knbGJTbfQP78NsG9quqhwoqEjU+WJwErzQ/5bODwWlIU+tN53eAUiPCqc3SfP0i9x4oo
         m+tA==
X-Forwarded-Encrypted: i=1; AJvYcCUuQm/OqQH8S3M7lcpT3g3cZ3GI2dE1T7aPQ5c4hdFj36RgN0XrgUwY5qhSg1zP9APZm6KtUzzUqxPRY0/+0zjJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4XPdKJtQzPy5fs77Rk0Wj2bpc8aPH/F3YKTMX8jaJgtVSno4u
	3UdOCXHyPQR7+7gKi+WegvO0nzg8h4AWUwDwD23+5fHJiixqWnxAYlwP2Qe/5k2YLUEXoZdOY9w
	waEpI7TsmdPtjQvXuaJtBfAfwMhEawEKOQdS9ToCGxXyiGPeVyshqQ1A75lIHnZ6yfzK8j01G8h
	/tWg==
X-Gm-Gg: ASbGnctWFnBfmNhaEeKaa1KGYBtsbVpusexf5UGRLJbRPCTh8+QxeahaqYzsDbt9OL9
	EmqCCLK0xyUCoDi+E/4HEyoHlbGpfhZDi/YGBuonK2RX+jfNtQX5yv/JYdJQ2+AECQzOqZDMGLx
	tpKh9ZNDk6y9mZxqq647yWyUFl2RXAsdJaEMX1FzNGxdPKBFesUq5XvWGnhtwmNqa5sq7VeBBck
	xl5N/PulwkZPMTkEFSgfT2NfmoUXMAS4IjCUryOmXnlI+trhVYk5uGCw9oHpFWFkov8p9EEhN3M
	rFPR7GpyEhXhtfFLn/aB47f46nDE6ZsEnNHX9Z7NOQAOhSCwbFB+djvZlBfnvdz6qveN+cjsSHW
	1
X-Received: by 2002:a05:6a20:a11e:b0:21a:d1fe:9e82 with SMTP id adf61e73a8af0-240d2f2190dmr4142986637.30.1755268637304;
        Fri, 15 Aug 2025 07:37:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgsIwndiwgMO/4XCfpnGqesl5qjzt37SrqS5fvAaqtJVwQCB8jw+J4FEIU2+q5voDUoc+zew==
X-Received: by 2002:a05:6a20:a11e:b0:21a:d1fe:9e82 with SMTP id adf61e73a8af0-240d2f2190dmr4142925637.30.1755268636830;
        Fri, 15 Aug 2025 07:37:16 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73619fsm1437576a12.39.2025.08.15.07.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:37:16 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 20:05:11 +0530
Subject: [PATCH v14 06/10] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-arm-psci-system_reset2-vendor-reboots-v14-6-37d29f59ac9a@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755268580; l=2577;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=SmkKRQQh3S8Gtdgd1oOIc80Ljvpw2jelYZ428aYXpJY=;
 b=L8V9bS20yn3EMfaNLrrEhrT1+PY4b++HwWpE+s1j0w7TmzQIDivAmjeMLzPy07SYrEuOq9kBl
 YPAwB3Zz27LC1Og4aQqxUCjphfUPn6ESHta7Z0UgqDXniNuFgLUnQoZ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfXzlRbs+MRqm4x
 V8d/MwxhjYQNxSM98Gp/NYlYnZOXPcaR8eWg5nLgXWumbe8iJII8LLwEEI60Q8fapmI5+CiSjc1
 p3REdg9g6kwDZJ7/sqSW+wNHlUfviLPdCuqGR69Fk/WKYT2+CcKL5cGbh0geMWxOeac3tg300iC
 NA3Io+TlR1sUJYUK70+NGZKxv/mOVVbvHkX/Phbm4qq0C2OyMwePmS8KFTo4vVH5DlNegVgNZdS
 P23pZn3wQptKbj7Lcq+qxl+hjRc+8EuIEYLIduHC9X2voIFZ/8q9jtI7a6ORKZlLEKTJfwumWxY
 +v8NYwzHeAYYMILrCEk3/qWvJtOWAehSZ5sP2A+tNbkija3SYNYOfSzqrEo/X8HjHZiAVcA2VU3
 yZSXC0fQ
X-Proofpoint-GUID: mcBtkEFfl8qYy6qAI4AAqSypw497sFqf
X-Proofpoint-ORIG-GUID: mcBtkEFfl8qYy6qAI4AAqSypw497sFqf
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689f461e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_073719_717045_D86C54EE 
X-CRM114-Status: GOOD (  16.22  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 43 +++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 7360a2849b5bd1e4cbadac533c1a7228573288d4..eca38f8747d320e8371c1dc37cee2287d71821c4 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,27 @@ properties:
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
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx
+          is the name of the magic reboot mode, type is the lower 31 bits
+          of the reset_type, and, optionally, the cookie value. If the cookie
+          is not provided, it is defaulted to zero.
+          The 31st bit (vendor-resets) will be implicitly set by the driver.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +158,15 @@ allOf:
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
 
@@ -261,4 +291,17 @@ examples:
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
+        mode-edl = <0>;
+        mode-bootloader = <1 2>;
+      };
+    };
 ...

-- 
2.34.1


