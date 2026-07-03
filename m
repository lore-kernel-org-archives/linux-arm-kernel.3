Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E288C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqnVxuePfzGralo5ejKJTMgkZosmeyctDuCT0QENgCw=; b=GIGgu0NAX92HY2o5pxHMD2MFk6
	K69eRMaVhRvI15pLZEApIXli4HA2fpmq4n1r84HZljc7iRRt6yxKpvFv5kJczpEluXnUiui956MDp
	voMiL90xrCAuUFfm6Ie6CBXUC2A2smLlzlmVf6pw/7piVe9TwA2UvEvd31sAcxXtB4wxFSzYcKysN
	Ce5xa8hCL4TGvDeQCpCu9uKevgZkrILfskIquZhnKM2gLrbEyI7ZFC3+FOyr1isUeQG+D02sg3Ej2
	oGwqUvojAwsHpJQBPBRfV2VIdUypeALN0WrH6ggtvWmI9lgAsR8aW7XZpPtV0k9ncRVnZ0TTDDwdU
	/Lta+2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkDb-00000007pab-2W2T;
	Fri, 03 Jul 2026 20:10:35 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkDY-00000007pZv-2jGP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:10:34 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51c29b46382so4930461cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783109431; x=1783714231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqnVxuePfzGralo5ejKJTMgkZosmeyctDuCT0QENgCw=;
        b=Eos0Z6AXv75qU7RwQucXQIYVoG534w+nc49oV0r4ZcAJFEpFm1cCdCWhf89N5wxQZe
         yPW1DDeMSSxv2O+VGA4RsJhMyiffL+8t8PZ7JVnCwl+Bb8hQ6gz486qRhNN18knWjbH+
         yTm0dTAYiByNOhJLd9gnjCvoz3Czk6OUyn5eRwJm0VD9gulJJOgvOB2n8kb4ijZhx9hm
         lRfvd9RyC7EKJOkSHbvSTx7vRYFevafwWiAeryv67kGeiqVqkwjggkCpfAbg9XJvVpAz
         kmBnxo6Er4rkQTvYPONAMmCBweAoly7KxYLcvtd4+IY6VfQpcTe8b7IwHNpcCwjPUHJv
         OqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783109431; x=1783714231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VqnVxuePfzGralo5ejKJTMgkZosmeyctDuCT0QENgCw=;
        b=BkB+ZZRHNYAUeHKojSHyRD18GyCRUR0Ogf0rliEyNJIBDkwzc7ohMgndN3Bekx79ff
         6Ibbp+j2k9jF2zLahRnd+dTpBjPxQBEEyHiZ9XlYkCihy2yncSB3FrsPSr8rpcM9h1SU
         4Ma+0OHTIbLHWLNpfSusE9Kjj/Z2qV+DYpoM8oFtl5fn2xQMieplU0dRdXHBLA2RTGfk
         06wDvNxNPW+yjWOD8sEFNWqDtEyXlRP1W9LyzUihWx94CgAw0gk7USPIPbJjyln+0OSF
         kPLHI80kbpcHFhprGdt2trIFirIvfuQGWgGjE5LIjUwiSwcw4g9qs2UGU28PMMBieGkk
         BwnQ==
X-Gm-Message-State: AOJu0YzZRoZXMJorI5fhw1e6qeDlIt1HjqM66yBYDP0VOCoIfzuA3iR4
	BQ7+K7qqSvy8iFzWRaV9ByQXB2PtDXiV2WwrZn59O07QgcWmWQ8ZZa0K
X-Gm-Gg: AfdE7clu1lBzmbZ36XUvppW7QFtoGa8DouXTHVtsq/icWr81Mh1fDuoRO66GgYphupP
	aLGkX6Og/vCNZk9YBhvtXuO8nmyXIQqzWIi3mjq1/6TVJEIr9oM64N40BxoO8v0HIxZeW1rBOzl
	O2TScDRk6B7ZqVWwQHelUiU17EK5yClsJufDALSS/QhLiKjYwsCjHCBNZk2EtiXPyPBRHkwca8r
	0TSzjheZ7aq0H7xtJZtzMPpDGjcfafseZjANNRdm/3CQ3UDU65aite8A4a8DCVcG4UQWlRQe+1o
	9cx7Ya6Uv+SwillvlnWJwxgIOzMozCGb4xacCxhazWpLBptYReG2xPUDXd7sMrkn/Mk88lR3Yfd
	QzJzU6Q59Ss8v+CfZ3mWyZWW5u7/LYsxgJHvZKWI0GIr/9L/8qe3Ik/Ik01ItGNn5oGusFQwq+/
	J+NqYq+6O2IvOsIIctpswXtdnp59NdLV9DICTfuNsp6+LTdTCB+NNwNMlTyjTzrdMkkaGREkqv4
	g==
X-Received: by 2002:a05:622a:85:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-51c4c1e6500mr15034181cf.5.1783109430605;
        Fri, 03 Jul 2026 13:10:30 -0700 (PDT)
Received: from oklopfer.hsd1.ma.comcast.net (c-73-167-46-184.hsd1.ma.comcast.net. [73.167.46.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41df52a6sm22259141cf.27.2026.07.03.13.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:10:29 -0700 (PDT)
From: Oren Klopfer <oklopfer37@gmail.com>
To: oklopfer37@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	stable@vger.kernel.org
Subject: [PATCH v2] Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinephone Pro"
Date: Fri,  3 Jul 2026 16:10:10 -0400
Message-ID: <20260703201010.67311-1-oklopfer37@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615225014.219115-1-oklopfer37@gmail.com>
References: <20260615225014.219115-1-oklopfer37@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_131032_689815_AEA0B729 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

This reverts commit 096bd8c679185f898cae9933c6a68650fa26ea4f.

Just as with the Pinebook Pro, there are multiple chipset variants for
the Pinephone Pro, and multiple firmware binaries for different
distributions. The change causes issues with some of these combinations,
and reverting it resolves the issues. See the Closes below for the full
report.

Similarly with the Pinebook Pro adjustment, the original commit only
indicates "further description" and not indicative of fixing any
existing issues, so reverting should not kick any back up.

Fixes: 096bd8c67918 ("arm64: dts: rockchip: Further describe the WiFi for the Pinephone Pro")
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Peter Robinson <pbrobinson@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/20260607225901.64019-1-oklopfer37@gmail.com/
Signed-off-by: Oren Klopfer <oklopfer37@gmail.com>
---

v2:
- Repair malformed whitespace

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 8d26bd9b7500..d46cdfe3f784 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -734,12 +734,6 @@ light_int_l: light-int-l {
 		};
 	};
 
-	wifi {
-		wifi_host_wake_l: wifi-host-wake-l {
-			rockchip,pins = <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	wireless-bluetooth {
 		bt_wake_pin: bt-wake-pin {
 			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -766,19 +760,7 @@ &sdio0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
 	sd-uhs-sdr104;
-	#address-cells = <1>;
-	#size-cells = <0>;
 	status = "okay";
-
-	brcmf: wifi@1 {
-		compatible = "brcm,bcm4329-fmac";
-		reg = <1>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <RK_PD0 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "host-wake";
-		pinctrl-names = "default";
-		pinctrl-0 = <&wifi_host_wake_l>;
-	};
 };
 
 &pwm0 {
-- 
2.53.0

