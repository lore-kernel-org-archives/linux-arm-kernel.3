Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7F8CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4xibtJE0TG41iQco+r4uLl7fC1ynCkxCGcMxo66dpc=; b=RiLOHA2TgLCuVAWc3DnEOFFFJ9
	cj79A7mg/Yb4+ukBiM+Wu2SJufGDGzJjjmMAFKp+um7OSmynC7i4b2Hg8aezYYeG2ZDd1YKijS2Yl
	/448llYtg53vZcFO+X2wrHl8VabJ3dr0o5IjVG3JuMaJUp5FZ54pNuGeP7w01py5nKIT+D75znU9Q
	MXY9ewTt1aWmtkhysD3/eP/h24yJl94neI18ZeLmXCqvdSN7iKBSzinH60+YUCCDXw+l6xK0OW6zM
	AxnC/g0BmW/seDEvGEbB/Es/o9IPTbFarNqdJf+O2aV0WtPeuqUKXNV1LE14Qq97CERAkfBWUUX5O
	pcsBEhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Uk-00000004wmM-1Sa6;
	Sat, 17 Oct 2026 16:42:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Ug-00000004wji-3SQl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:42:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e95bd1c14cso6711795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255370; x=1792860170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4xibtJE0TG41iQco+r4uLl7fC1ynCkxCGcMxo66dpc=;
        b=WT8BdM8RVYDEP7BGj2HnzDRvE29M0KxP4jjpIOdDEgXzXrSsGY4/D3Xtc52k4Gzswi
         jnb9q7GA74MK0d1bp2+DD4+v82Qk9Dpz9BAIpT62UF1Xi9gl+VSFBhTqt/6IngT4NJx9
         b0dGatfHl3gNDMpS+IcLfSGgy15DBYZWAi72yAkNgbsBsG8EwA9LpcZIBkdscX+KXLHu
         6IYCS7E24OR/y6yzPW1wWZjR9N9y+wCC7HGkANWxkLy5aqyx6eC+CYZCx/Kpp4ns6UZt
         TOtyY+vSYMr2JjJNCq17CyDdQOecOrWcC8zS7AoVbp/GXqPWISE5r3rkPvBIfBEK3SWt
         iGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255370; x=1792860170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F4xibtJE0TG41iQco+r4uLl7fC1ynCkxCGcMxo66dpc=;
        b=xGxejUfExmRebTjFAygdCqFSTpMMoQkqc1WOPnZ+jYrKSMMvNYHeFyQJz5KVQoNU6f
         LBQraPcI7jviU0IIc1vEIi2egRM7tvHDAgBigx5QLz1nsM8YCjHlaigEka9zQ2M4OhJr
         csFebyytwujckeyYaAoQDcL3Eek9IBf0b5JfuWS4Y4hbQPSLQowbRcERUujRc2BHQxXU
         EWOvh/UKMnW+VjuhPYZhGTlrgT/KZKMIVFKKxNAMG987xnk+SGWIws7VEHDOI95xcFVP
         VDGUBIziHsm1Lh2n+iY4z/qHIbif6O6SWKPTRGRculvGsdh8z0t5IS2rEE2hxhrT8jHT
         cbTQ==
X-Gm-Message-State: AFq9FYKkk4SZXrTzLIVECecU4lKMxfy8mkhs2yMDfaWppkupW/YPjjjv
	ykC3HQOzmbnhqBw4+fEJguG/CGNNt7jCQExZoG4n8bGZfsweYk2RYUvH
X-Gm-Gg: AYBFou3tAb82eJbmnI5ETnC8BjHafuA1y04qB3uuprRJSQ3W5V5Qf/lglwI07FPq2rd
	74hvG+MN4CvGLyDJpmrFRgg49uGmTHkfINWOzq3Tp84tgStlJUn1w+Z4mp2ZYDr7b8ZR+vSkDe7
	s1oa76YCeU+1SCtXPxslWgYLUWd/Ce4lH4SASkWDHW9fi82tKu9h+L1/VXxOdOF3iHeTXPShOPt
	In2MgNp85pdi2x+J/WnxugVNh48ryFN8ncNEFE006T61JrD/TcTNkZoVsXEb4Egeh8iBoiCcV9e
	a99qf7dgqe/lL+vk76hnEMwepnb4bhm63TWopQu/C14glG6zIJrlXdOIC96XfvxTXUCiQYz6ULQ
	6rLlyMS6TvNq2U+QY9QTcH5pvniKHuA1L7udgaQmFBkcgHgsziVFcXehaNVHbssTS+EmbgXfFLn
	S8zai8oxHkbdHqvid9yYkY1JKNNhJCMHhsUXoNAZw33ERfli6NUxpSudxsc0+JnQ==
X-Received: by 2002:a17:90b:582d:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3acef14c8femr2733506a91.43.1792255369994;
        Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:24 +0700
Subject: [PATCH 2/4] cpuidle: psci: Allow skipping the suspend mode switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-2-dedae27e4a31@gmail.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
In-Reply-To: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_094250_892272_F1D0B8B8 
X-CRM114-Status: GOOD (  13.36  )
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

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
probe is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Add support for the "skip-suspend-mode-switch" property. When present,
do not call psci_set_osi_mode() and continue with the topology that was
already built.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, added log message for skip case, renamed
 the property]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 5722365b94..cc9f14769b 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_pd;
 
-	/* let's try to enable OSI. */
-	ret = psci_set_osi_mode(use_osi);
-	if (ret)
-		goto remove_pd;
+	if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
+		pr_info("Initialized CPU PM domain topology, keeping firmware-set mode\n");
+	} else {
+		ret = psci_set_osi_mode(use_osi);
+		if (ret)
+			goto remove_pd;
+
+		pr_info("Initialized CPU PM domain topology using %s mode\n",
+			use_osi ? "OSI" : "PC");
+	}
 
-	pr_info("Initialized CPU PM domain topology using %s mode\n",
-		use_osi ? "OSI" : "PC");
 	return 0;
 
 remove_pd:

-- 
2.55.0


