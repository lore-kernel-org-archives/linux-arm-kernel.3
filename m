Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D93FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=qGK3mOSYF9duHB8i5pyQ/owcnQ
	4azCn3YZvWn7psxn64z8rGfzZ3FJhFzrPk0nZFIiOMab+CRqJ1WHu1TsLI0xl+hsmzDdCAFGWqit1
	KVN7UUL+unHDrh7agh/I5Liz7So9Pbzs8tPxeRRIB0OKRJSWidMRLAWRqqRQVKGOLdQS3Lmi/TtXZ
	k9k9upjwBOHV3BYLaRi2wclZ91xm6HWX40+UT3JJa9ITFfZs46DVW4Fa7CBO5+ryDrMDG84w63w+Z
	qLMXj0f7m4QgX7bxRTKeBYlaZEVoCMSLdIeCv8mxEwH5eX9Psf7omo6GqZnkNFiRx6WDfF6xoOFR1
	tEPtgeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPsb-0000000HTyn-03mi;
	Mon, 27 Apr 2026 17:36:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPsV-0000000HTvn-2Ats
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:36:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RD517E3961988
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=gIabg0FwLPE9SRzD
	3tRU9MsWqNjMpmEiRRi/3sk83rdVBYVO5cpgUkPZDn87Yr9f4IT3fEMVshLO5U56
	9BKM+gB23Fi4JYl+Z5msoS45PR1WyxNarhcke91MbRu0tRY1IZ0Jq9QJRRX1JZMQ
	G+1MxNiV9OX9MjVo/KLF1wncTKJP2y7ZaqRAWIRhMNvBzpVqgfWWxEKpNmLGX9wg
	slxAeFSw+5trK6XrLkcoDOVLdQSlGy8j41NlGT9NZcT5l21dS9jm3S6DSTSmTO3f
	X5jyMGYUFeFz10iuXd5WdNrzhuXJUKz3Q7OK4V5l4rcluTtswwGen0Z9I49CNEyc
	+IUupQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k3281j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:36:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24a00d12cso106647125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311374; x=1777916174; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=b/c97zjZ3Qa5eJBaS2OTPhuq23sNnyG7DRIN+LeLyAiRaxDRZs9Ekbd1ElXf4j78ln
         eCytCjkhS5895SYv4nEdjHKPumr82q5mI9K5PqjYTlmeGX6flPDJWmDzcf1yvThtaZGt
         3cw8eSwPwD1nfpdZi7bZIRO792mYqquipaNji/1dXrJ40kENUIIPhain2vTbf7JUPYTF
         /wRmU5b8wUp28jP3+Me3I+eTDQbwZSX/flW6KEHwGB+gNQqNfQ/Xv1vzDSSUiKBRBVCR
         hOsi2w+MRc0RVEmLN+TnYTviqyngBUIUDUlH87Ew9imuwSD9TvV1eNN4mKW0KSG949hc
         pucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311374; x=1777916174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=luH5fREap2S+nBMB2ibzRWpiNY4wf7MOy6wkppmexBuvlLd6hTO2bQ5ohZ3jt1ip5E
         cC6jUkYZcUrkwwnJIVcNswJvlFjkPSypVdPBl3CFtyLLGtTDdeOnHV/ow8QmzsNqETqU
         ZF8IsY4DLgVvF6KXZf6IynnrppsyZqtzOdxjnjw8dALVZQFnM58W5iUIZSUoPXjy0g9B
         uY51+bLM1dRb4MUO9KuD8XQJDsdQbKfDAMxhHPd7j2GuSrlpV6HExGKFxjz9NmPx+Cfk
         ec8CxxtiWd/geRK5hqx8TvmFQprg46Cogvlmi+lQwOqsCZrWNAMhkSabhVN6TE7SEJAl
         HkzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oqR/8MWCTJDaLdJ84sJhUPM5xMw/ZqebuXJ7ZxzomWEKh4CESVMyLmgYBsOeVycXAm+SOFJQAyL8FwRXYBJmn@lists.infradead.org
X-Gm-Message-State: AOJu0YzrNWHd4b7vXw/4QSNtYnPXnMYXIEb6H1J8PE3Aq0NpxjeEO9MD
	3IGRFph5vrmLzxj0TOFdE3tkGhg4mWRL8fQkaiFcHIzDILYGyFW8Ava/cSMGFL5HH7HHbW/ll03
	F6tcJc4R9qU7s7SFkHaR+toNNOMNFgCC0nIEaipesiKHMYHYsdGwjZpbE5o1d55GUYlof9jubMp
	BTIQ==
X-Gm-Gg: AeBDieu8iT6bIruC7b6s7vVMTvFLZO8g69G05oRqz8+gYjJy4fglYDd3CzA3+woXDc+
	EvsPBuiSIgFbgoYZuQA7e5NcPbj70thiGjOYK9VJ5/PVa3RKO7u4cNNnlCSX7ob7qS8dcO/0KKu
	S3NUJr6LadtFCj3PIW3ZdZJ5YjDmzP2SZ1YzeVmGR9n15SUrlBUl2Zg2tMGNuVHPipYLLhACflz
	B3CF6Gz6ktk8ypbZQaC8dw1lnRwdyO7nshE4Fljk2UuC0L4Rp/N6joNSpCRNZpUAVO5oWDm2/z8
	MwQ5pE4OfpIhUOzS5LWFxfFDqXbdJymYF0VoQuwEYtna6PcmRFl+/F18pf96rQBIKKHVFkPcIFF
	AVJ2uPOKG2KklARoG3o7enmnZ+gllCvNJpyRMopmGA5rDToTAo5Eul/UFL0DocMVW47xF
X-Received: by 2002:a17:902:c40a:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2b97a951600mr1695575ad.35.1777311374233;
        Mon, 27 Apr 2026 10:36:14 -0700 (PDT)
X-Received: by 2002:a17:902:c40a:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2b97a951600mr1695025ad.35.1777311373686;
        Mon, 27 Apr 2026 10:36:13 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:46 +0530
Subject: [PATCH v21 06/13] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-6-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2477;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=yBVN4FEHADdTSQ++LEmhmTEyByZ3pz1DEJtf2+BqO1w=;
 b=lmkiWsLFoZiVy+q+yRqg9SpaKjLQxt8Mmp5CQJoF/Ii4uoBHHfeoTnxYq/6ce9i3yob3pcaPr
 anKDkGgjULpBrTuJ097A+tFD1/IfB8Cv6S2JKHq6y8M7Wxpx75aljAe
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX9pdLVdloxOw1
 4+D5O1/w+k94e0oaCASAwO+/Q9B4p/nUFu9Mu6+qaDNZoOTYMKd09utKdGqjij0jAhkSmDum3SI
 wXIYAf4RAIJ1cOGbTjMfhfXCLNXEz9CjJh+xscPSt4yzzA3rFBJmrygve8HU5ScZhCr3ajG8l9R
 0BnRVwksNddiQNOCnkTxOLJducKYS2baBxakGlvg2hgrf9QCaoNwr1TRDKAhWk7pgtv8QOsY1xz
 I3shDoUAd4XAHtEfrPW02gxmZBLD/F8yzVqHb0TmOj0aHEholO1RR0/8Z6Pi/u72z5L1uG5h/ca
 RNz8XiDho4AdMPhGDYGxmyPsOo8ksQOTVy9NTlGC0sw8htXQ0RZdsOQManFS70Ft1zvbMVUDlmH
 znd+KvcetQWEXSU0aIxYGLD5hgTMZdITOWK8SWSl+6otp+LOPiKR5wx4hZaV/mU0L6uYRBshk+Z
 ZN1m8DXFY7Xu6aKha5g==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef9e8e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z1E3qa2j_4PWJv3PNLYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qXP5MpYKN9ApvYUIZ-75vg0XpAoF1czL
X-Proofpoint-ORIG-GUID: qXP5MpYKN9ApvYUIZ-75vg0XpAoF1czL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_103615_570216_723DA151 
X-CRM114-Status: GOOD (  15.73  )
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


