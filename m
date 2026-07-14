Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D98C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PGsQdjfpqkGRVClnA4+TCms2gSn0k/rM0l7GkssEAo=; b=tR3lTRHSvKvqoAv1xQ9Aygg9pc
	oSUL4OP4YsfbEUcIaScE2ZgGc31CRq7sSpTY/Xmsz4vPNr9btKkzkPThnsKab8VJ7/QItaYUPAuey
	nIVP2Jlq+9NLH9+nf0yCILuIQvWIMSdCIWq2UYRncW5PP8976srEfz5a+PITqJvdf85Dd74W2BWZ7
	3t9PXLQfZvf16YE3sTl7D0cKVft7oyh/glheo28B6sZMx5hPVIdILavQ6oBovNP25vrVBbyTx+LcS
	g2NcW0uiE3EKp2Jgos62T3l52pSX6e38u1Ngn4J0cafRnaczPaiDKbl6qybYLtbiydjn/cUqj+K4B
	/LUZwCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjglT-0000000Cjt2-2StH;
	Tue, 14 Jul 2026 17:17:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjglP-0000000CjrE-3Xbx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:17:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EHAaTh1206199
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PGsQdjfpqkGRVClnA4+TCms2gSn0k/rM0l7GkssEAo=; b=ef0V5nvdxoQ9Uunt
	UqGTUhKqlW3C9z290Yj54z+LupZDTZ1sjEjCalHA6STcYmlrE3Db27rSKHVQbHGg
	E3r0Sm1EaLG2Ag+UqnBfvoC+ocFB0xpqU/2ac8mqdwyG74/EyykQXlUJZqbGsMbc
	8tQUU0/Mr15luVNcXZAe6ha3PP0zib5JdQL+S1U5N3coaYk3peXoHaeHEYqtB+CW
	Zgj3PKsbduMuasDMRAvPF0pwxXM1VabLZ4S1dXpT5jZL+iofIoL4PdXNeLr1Iied
	RaCpNWPJGNcs3XgZJdiwzYvzNfAMMcTaupug8k4qOYsGCmgHefWX5raSoxa/DaiJ
	RrENpw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9hr0t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:17:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240683a82so1259631b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049467; x=1784654267; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PGsQdjfpqkGRVClnA4+TCms2gSn0k/rM0l7GkssEAo=;
        b=VHzrbtBbotJtEvJLvRX60x9jnNtRmt4u/YzZey8Kz1zsfUgCHlEY6j4zCzw6CR+41R
         I+7eqF6mFLm98p7cJ4ap31cNX0Wu/8adDCqknAfdtqj0mw3NqEmQFv2Yn21cv6ZwfP1Q
         NE1NLwbTw9+SSHDt+BwBp3cU7gS5RNLaJo4aYW4YN28O6GCJUyO8BlKL2qvb5n34LcJl
         bA3XPOWydF9of3lc0o92GUmJ4NKKF5oQEuo7NE7CktnbnMd2gucnUh1qTnBV1dsHrEt3
         MGNZpJiA0SAXB1/h45ZjwgZ2potU2BP5BjhS/cqkn0zo/ZB4Rq+jFp+VgsJOhqJB7C1Z
         evgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049467; x=1784654267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PGsQdjfpqkGRVClnA4+TCms2gSn0k/rM0l7GkssEAo=;
        b=miQyFDKv3ZQW7xnSHUo+NTILWd5X4qcnwqXdJbcbd4xilm8geDNXP4jeQ8E3C0Fl1V
         SSdC5emz1jMfKFCGVt3ju2fPmaw3CswlaEOuPjTEtCFVUXiCnsioujlydgCdadvaOdOW
         w2Ezs5Z9otJVcCYcxpT/Qv435rRAlBxr9KbYxtSWBVmusOx8flfRUQohnGqwH4lnt+PW
         bBHoE3bLvINgf3WC/QyDjlgZx0dyPd98NWktUVqw7iYcpY+3xpHjA9/4ELagzrULVTwi
         0T1t9GjSIQYXotsQV1Y9IM2bQFk8GQFH8MowaHHpLstKYnaeuMW/9ohH7pm/6eaLSB6D
         0zKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYOiqpG9EFk6dVlfS5n4I4fnCXTIdL4nCgKpO9iyE3HFdbnR7hb9/vIsuhtpIxWgGFoEYwA12mdFFoylWMkxD7@lists.infradead.org
X-Gm-Message-State: AOJu0YzqFSQFhdqGcBS+QHPNGk4g9vJIQfrl7PxjDBQ/m1RqUGzQ4R00
	MKfoe/Gdo35mioCN6QifNdpLkw7lQRbjV38uDEA0du+7xLY9ASXDxbpnoDXdAT1CobAr6A0AGBq
	KlxC+Is7lA1PxJveENtvaw4JR348XWW/oey9aOmtSn8uoMGuL8qeANvclzEWLUF9ASKMMmsHJi2
	F//Q==
X-Gm-Gg: AfdE7ckgQPZt2LDs90+mbo/OECYCpjOLWBD0FGU/rsxazXHwIX0zzVdlfZaPtM9cEYc
	hHSJPKDlLPK4mFGLNxL5ZD/jrbF+HKMnKlaAgbjzT3V2yqkPT9shygykAs4QytfTb5DIf5tUP5W
	nEhkMC3ontlSV9t18syzoQNs5rV57PFIt8CeRHP/qjcZVI3lggbscebmL01NCjj5M+mNpcAleOV
	HJ+rgVpu1jAcW96A06F2qVoGuanES4ROZc14DQ6GoygUziwIhyQYXC7DgmezcrqtBGtHJ21m8Gs
	iQF6YupIeAQ5iuK4j865x2E6BUyU4Ru8AmHCN85UMhYH0PShxDZm1BzQ+4pMgCgtMBik7A2AMHF
	paAwrPP5L0O39fTFrm8+Wr2wOJ3SatCW7qIVvxNRhw2YyuBM=
X-Received: by 2002:a05:6a00:6c9e:b0:842:4982:82f with SMTP id d2e1a72fcca58-8488ab52c4emr12500730b3a.2.1784049466584;
        Tue, 14 Jul 2026 10:17:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c9e:b0:842:4982:82f with SMTP id d2e1a72fcca58-8488ab52c4emr12500713b3a.2.1784049466153;
        Tue, 14 Jul 2026 10:17:46 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:17:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:34 +0530
Subject: [PATCH v23 06/13] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=3015;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IeB5JGZlGnhunhqpImylStG7bJZPq9+76gfyd+j+btE=;
 b=Rqul/vs6hKIoNIq8CYBVBXktxm+9XrK1d2fQHxlRs0lwZTte0K2Wy0m++KG3ub+9uPYRfMpW0
 cWLGWZTns3eAts3X64dU254nt7q30B6sK3/wB+hz3gjRYl0RgDJsSwU
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Ib+3n2qa c=1 sm=1 tr=0 ts=6a566f3b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QueE7lSFyTnArNAPXxMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: orZJV1zjRwHwbJ8BeAho6DHbsekZeJ9p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OSBTYWx0ZWRfX6Dzui/34ndMi
 Key6/+RhLgbqVuqN9qR6BGBfXgJ6w1hCW8V8smFfcsom60Y8QEHLe41Kf5amlkyG/vtvREuNTWN
 twenLyzyye1nSIA0lsFVJcgTmfkAkAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OSBTYWx0ZWRfX0Z8mu9tZHJd0
 zH9L3dRdX/5HJmyHcsUVnSCYI87+jIqKlrjHHgOyARDrsRXBESMFu8r0JdXPMjRitW6l6ytTcr+
 Fxy+tbtMSrtfoGW54z7doZpMqajx9f2vHSJrP6uehVG6FOdJfFn57iJNwJAvWXveme1GOLGEEgV
 rsyYpd4CbeTItUc4zkUdQszntLYQYzrYRDn+RmUGJYedi/2hjhJ+ZFiAQAKC60AXX1H/iwTTCL+
 nJ0lDO7qrzsafiJYpWCbQnoGobClYSlgo74Tujhzuy6Vwx/S/tCaII28FAobcp9fQNaOce23Df5
 qYBwiIwTJoinJ/qidjGeUDSHML36SDCX0abTDi0ps94V2/NVrMjQ2fyhWM2L2QcYfj9dYN1PFs8
 Px7smF89XRVzxdgzQttVamj8XuotFa5mBjj1UJIROCAOH87yjOU1jjxOmRJuAGar5z5aWPDtpfp
 El/8PJsyQrZ6qxOX1xw==
X-Proofpoint-GUID: orZJV1zjRwHwbJ8BeAho6DHbsekZeJ9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_101747_913757_2F65D33A 
X-CRM114-Status: GOOD (  16.64  )
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

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841..11b90e8affb3 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,37 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    additionalProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 1
+        maxItems: 3
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
+          where:
+          - arg1 is reset_type and must be >= 0x80000000.
+          - In 2-cell form, arg2 is lower 32 bits of cookie.
+          - In 3-cell form, arg2 is high 32 bits of cookie
+            and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +168,15 @@ allOf:
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
 
@@ -260,4 +300,18 @@ examples:
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
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-needscookie_64 = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1


