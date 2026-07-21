Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C09C44533
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U33s9q0SrsoXg6oom9RrhMBLEezVP00e66OiL4kp8fE=; b=CDbjm6LJ3h1wBV23SNwFilQVJp
	9NRxd9Zj/spqyvonRNjs+kp+vh4JU/RPlA0Et9ITlfB56Z5fjX+c6rNFBk9bEkHLZGrAvV4JNNHlt
	kXilAjZxHl85FmqYqili0Dm17lEPLQ6x+DInINp4dShz8w6cMPgtSLoZLepONC0kfOf1HVcx8Bf81
	k+l/F4PfL0NrtyWP/SXqt+0wAxsUAvz6zGSS0KjxNg1tOtalTub1R5++yYKqTp1E2bC9aeMIE+WE3
	+Up1W1Rc/0NbuipjwICFQkRMnKEIZx/4Rvhy0KncrP0fFBkDfvmAZLanBnb8eh2DlWq01tkQKAhSb
	gJreK4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAcm-00000009YKn-0eIy;
	Tue, 21 Jul 2026 13:35:08 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAcH-00000009XkQ-1hEW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:34:39 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-969524c1a63so3676911241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784640876; x=1785245676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U33s9q0SrsoXg6oom9RrhMBLEezVP00e66OiL4kp8fE=;
        b=SbvXGlegjkSB/peXI4WQPZ3HF8TCDsdmgd4Xi6uMIUbxR5e2AYJ5ssaC2glr1m9ix1
         rN5MTxh7oK3i3/LmDy5VGpajiCvqbPu/06dnJgG3JSdDA4A5iopf6/Gf220yWm4L81Yj
         rZHMthXmr81irBufCYHqPPdrtReaIewXEc47FiRVLJNehgRec7zyA1mGAfKkzZxEl3Om
         shMqF8DgWd13C7wM0c6G7dVVuKR9JVgPczMvr2F4kpZdtM8FIjqxrjh99OaKSvji8Jgt
         qk/Mt2oO+45boNLY4XJsGCM6zZZPqnFn7yNOeKMInERjUR2MEFCD4Hm7UgafmqQkgwHE
         mJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640876; x=1785245676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U33s9q0SrsoXg6oom9RrhMBLEezVP00e66OiL4kp8fE=;
        b=du+FAqC2Vgh5tC9O5KjtJtmbYEGmApsCL5jpeo0o96FmSPRuyJPQLZgtRgQ71Zinux
         2bFhIw+A2mnwb2pnon6io50cyQDBxeDMVIIo2HVi4fyi6ufX5rTJTVjvdEQaLGHwqGVo
         KCz3JenihkK9h9McAzMEYmPRXXMdoIg7FeWYbr9ZNz2u/O+IW9gX6+GpF6r4gZ6a83vn
         /1RQ9AgmrxVLDkgeTJtyjaJKrnJ/KhnHq8rxSMjLXjuiVMBo1JniTkmg3uz3RJZXdXQq
         a0i1P55m1CgmDm4doVed9tEjZuqSFl/ZPoY2Y0nSQ/tVAxZ7SvXWM9BrurusOOdVJPU0
         5j6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrsi1lsV1rJ1V+J5QeIECG8cwJgyxfEf0ZNGJFj95tJ7cSK49yzjXQD6opJ+kig7qGDrS6HBgyCL4wQrTPOdMYd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8kthj3gEAVcAdGRXhDFrjrBzTOukV4fSK22fUp8gwsCcTAenM
	Wsi6lSWSjD6ja1sYrtcqVew+R2Fm3v/Vg0AoYyVRYt5EkHh4g0ciHRA+
X-Gm-Gg: AR+sD13lPcqX1E+RxRZj8pHkmH2lt/DLLuvcC8xSCrh0PXYiTXAEnsvqnw9Q7I5aJtG
	duB9QURzgdPugjw/pmvTHiY8tKqoW6XydJHkij5/0UZiCOv3dyysIKKrpddCTjoXlBxAXtcFqnA
	NFa1dqBU+6JCBSeHU4qKUD2YFa+Zwh6ZFyG21RWJ+J+knMTzUkWIdRlJziKx8NcPnqqm6MNjxUn
	5gk8Pn4AN4FoGa8lIek25uLT58ZK4tbzEd9hYWKOFT4TxsAdzZXAtEYHMIk/LNRae+cE0ZiJTh9
	5UmOvUmhH/P66dZtU5K1S2kNAWdwMiTtmXJi9WDDdweFtD8dDAiVelZIS/XD9eZzyZmi3zhpDPj
	5IV7ImuP1qN6w64Yky5AAmOOaK9TfFRUTiUxuck/j/NbAcNCYG/3ZSwzRVEo82ZDpkyFzjTGXhe
	4grGzZHIFGeGln00J3wYeUzPBmaM70Sdg6tdJx7HpW6ndGeHkI8w==
X-Received: by 2002:a05:6102:5e83:b0:722:826e:1423 with SMTP id ada2fe7eead31-747536fa410mr5980734137.20.1784640876163;
        Tue, 21 Jul 2026 06:34:36 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:fdfe:648c:2808:d17c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74757fad06csm11850066137.4.2026.07.21.06.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Fix the rk3566-radxa-cm3 Wifi compatible
Date: Tue, 21 Jul 2026 10:34:21 -0300
Message-ID: <20260721133421.44258-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063437_457652_00852439 
X-CRM114-Status: GOOD (  11.57  )
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

According to brcm,bcm4329-fmac.yaml, "brcm,bcm43455-fmac" needs the
"brcm,bcm4329-fmac" fallback.

Change it accordingly to fix the following dt-schema warning:

['brcm,bcm43455-fmac'] is too short

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi
index 8453f06c261c..73c72eba72e4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi
@@ -369,7 +369,7 @@ &sdmmc1 {
 	status = "okay";
 
 	wifi@1 {
-		compatible = "brcm,bcm43455-fmac";
+		compatible = "brcm,bcm43455-fmac", "brcm,bcm4329-fmac";
 		reg = <1>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <RK_PC1 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0


