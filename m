Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1F1CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFr33fa9IIxS8M76ReU+A/YWrKsr2vhDOnZ4Db/Fk5U=; b=hQYngTs3snZ68tgHmPAk0aXKuf
	WVb7Tp97naJs+KcBc0w+QS+G6/tSk8brhwvX2A059rvKjWHX8mFH/+9+SQ+uemmhEmza5tAnFuoch
	3FTpvBWRElpZQ6Jsijmwbww4LSQx9KHzN/pQWUFrBDYHDQYWxLYChttGtj6pfC8WFL8Nr84+4bU1A
	z4uMjPP/QnhH0deBurOl/OAX0jruKK4o/iyKG/3HP70EtRND/KGv34dIBGA8ENsU+uGgp41UHXTla
	AMFS7HV1zdXBDJLcfrsbZHqqu/PCBX5041MyU/P64meq9ZgA6fuYDu/STVategmtjXDQGUO7/4tsy
	TqIh505g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIXP-00000005WPb-1Jyb;
	Sun, 18 Oct 2026 04:30:23 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIXN-00000005WP1-2b6Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 04:30:22 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3a706146559so893254a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 21:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297821; x=1792902621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFr33fa9IIxS8M76ReU+A/YWrKsr2vhDOnZ4Db/Fk5U=;
        b=Kvp9FAcuowjc3/qUpWmheNRxptdY2K0eHy/sZFgcGXeR/Fghj9Yu1bEh/3z6ULL9ks
         NUpuGR91E/8W8NEAF9DEUbbHEmHafbVa1GNWHA6tTt1WlFDaOPZ3bnujaEeqbRI9Ij8V
         Kqe5YRIg0MVp3399KAFMdlPlpPFk5WuJOUAq5zD3DK2R2CtTBG+/44162F2RxdQHMEYq
         ZHyYRvwVZ7Egx2es/iO+mX0VMXAitYUqfVhf7702O/foeHj0Pe9gmnndsBPhivFAf4Qn
         v6e1S8pTgnGfaeiLxZHxzBH8sbAdhAk3ewW1qBpXv9Ttatvdf9H+WGzZ/iZHwcMe8pVZ
         8M8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297821; x=1792902621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFr33fa9IIxS8M76ReU+A/YWrKsr2vhDOnZ4Db/Fk5U=;
        b=fCmCdRHFhI1neyqOMzwFhmzL98mPonrvSlzlLQPs3J+BwhtS3yTL4vmnAfwv0uQNWV
         SMJam99shPe99bUOTEasOnp3YQ9i3Y1ZLr+tVOGv431NOA+4XdlhebBE5ugJjl5Tm/AC
         u512s2kONWrNMA032hQI44gfJ3GtHfngouUNqSmC/0G5yZfxhopg4ZApM83VyUY+50KA
         9tfWm5p45Jo9BQDKoFE1BIXacwsdz5+RgaTPc8LQoVlT/9bxriH1a+p6fAmhza0W2XGA
         mpL/jgnspF2Nvz5nk5/sCZnw6UTN2d9DbFs2h6GLkRc9y2v3lw9wAhbN9moE8Dq43W/4
         4W/A==
X-Gm-Message-State: AFq9FYLLQTrJRoDPH56Z9kgWFolEoYQaLdpugM67sgVEvONqLUfeBSSt
	7tFO8btpRce1dxLtn1E87xY6vzAM+L/E6P5snTnj8c68iFJyhj3XMtpY
X-Gm-Gg: AYBFou2M22EHvj4pho45Vhw1Nl0lCh72NwbD9NZ0I8VIFrDYFY5nSNXsd37Pzc0Alz2
	80qUOmOgtL+hl7nGzV2q3RWOAsOMvvw4cTZN7cF8J/4qzdIjmq7FVQTCewpG5q4kcVAfUpoEsyb
	GOiysMGYOUu4YKU/B10jpmS5DQoNXJoWrRcDKXeiXicOC46pR/d74delgHCaGGKTaTHHXtxb8HU
	hepYBcrUAYY+1mmdQrhFZVvl6YPIz63qQonHx4KAOoPPuSZDfxmRS23p90VnrI2Xp3Fia+mY7Lm
	DmyAxR5IpfybUXULMSXILWf+Zj24yhQ1nmyaDPXi6svhK/iyKdQSM5axu1MXmSrRLNSD7njk1i1
	T1kyIdN86foAvJ/PqS4iaw6xFxpQNx2beufvvKMmzcTv9qg+4H+fJeC5SSxy3F3hOj5782iYJmy
	Nqz6zMLv7uNre+L9ZX7W915ZVapLdjXjT6TrBlJevr1X/zsv1Rs0ahwc8c9lVZbKQ=
X-Received: by 2002:a17:90b:2646:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3acef29e804mr3158765a91.31.1792297820655;
        Sat, 17 Oct 2026 21:30:20 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:18 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:22 +0000
Subject: [PATCH v2 2/4] cpuidle: psci: Allow skipping the suspend mode
 switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-2-35f65b59eb9a@gmail.com>
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
In-Reply-To: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_213021_681928_29D8DAC9 
X-CRM114-Status: GOOD (  15.67  )
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
 the property, added property check at PSCI initialization]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
 drivers/firmware/psci/psci.c          |  6 ++++--
 2 files changed, 14 insertions(+), 8 deletions(-)

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
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb2..3226af6d89 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -791,8 +791,10 @@ static int __init psci_1_0_init(const struct device_node *np)
 	if (psci_has_osi_support()) {
 		pr_info("OSI mode supported.\n");
 
-		/* Default to PC mode. */
-		psci_set_osi_mode(false);
+		if (!of_property_read_bool(np, "skip-suspend-mode-switch")) {
+			/* Default to PC mode. */
+			psci_set_osi_mode(false);
+		}
 	}
 
 	return 0;

-- 
2.55.0


