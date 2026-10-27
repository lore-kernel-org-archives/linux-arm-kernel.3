Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F492606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 17:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wWVJbKUA;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E9dR/mjN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=; b=wWVJbKUA2jEIRO
	PBsvY3rwONEFDQFyoVkP5CdNIJFc883pVA4gr3D+fpj7/gxDGdMn3acQfT4HspHv1So9DMsbmBlll
	HluhjuTmEUE8SgmK6A6L2yhkrzDd39UXe06HdMZ+EhiuMU0/CaY6dGEFZabVgIskq0f/7gMBBWT8F
	+wJs8t8Wad8dOxyC/ktpIxPE98tvertgbddbes4sj89W+ZsqhpUOUFA1AUfI7NSIFZwnpIt1zzgnP
	Eu+r0UtTKQ/o9kX2S/OXLkPWiUSKGwS479NUHKIlnfSYXPS1lS5ME0IMAAatScrdreyp4+Ep3bNwQ
	jzm+FdkhE3sWEq9ffiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlKs-00000005VD8-3s4G;
	Tue, 27 Oct 2026 17:51:46 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlKo-00000005VAa-0Wkw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 17:51:43 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so139356a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123501; x=1793728301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=cxhHVJlZGLy8o+QxH6C9+mbw9s5p1NsPwBunl6mGCtX/Tv2i4nS+ra6a0XFlU8Mdp7
         CRYnvBQjdCKoTxq1YMvdQBghwOfvrjqWSh7fHXl5KOviY72gltlfEFhRif0PjwiTUA8N
         p93U6dJEBx7C+8i7DU7UBQ+z9lTn2l29Vtt1QoCAtcPa28zWYsHXUP6HVG3OfrqVxhmM
         fOaX9wBezJHwXiTc7Okyk0Rtunb1V3ZtjxMSkXKvJ6xm6Ikftx0/YSkhuw/MraQLRyXV
         DCaYhM/acIOKi7jUhNM0FEIi8VoXmz6wBF84yRb5Z3HIBm99jG051boGQybWoNly5Fb0
         o07g==
X-Forwarded-Encrypted: i=1; AKwUvBzIPmobSmrG5GnUx+0dkxtvbk28a9usrR98JmWk7h+ZI4rTxXH8DoOwUg+avyXbFUni8T/WXFkiCljlStLsZeK8@lists.infradead.org
X-Gm-Message-State: AFq9FYJOFhnpcf7PKiH5iEueDAlBLeCL8hWCfGDQkdMMow534z0jWdQw
	MEwtbJUQ59h76NQV/YZWpLnp4A9OGxbTchmaSW4E3SL2+pC4haPep5Mqduq2ai1GmTYh5q/w/Nx
	kqb1upcj9X966x2DTuwL58OKmRiCHJy+nZvOb/bdW0OrR+R7ph2uZ0TRom7b+DTefODpMOm58Up
	DpUo135Qfw8FFt3iBzv78RpzKjHjmjPOHPbhEiNXVyYPcOzprWQAlScyvKVAWHVKCQ0Jf3rJeX9
	UDw1JOt9TBbQGy3DfFOowc53Kp/GzSSuc0=
X-Gm-Gg: AYBFou0FzOJhYp/jNjyTqFh/LxcH84nSqx8MicmVkE9lnPMPSlMYudAbW1Ly2Eyd/vV
	73gePzmAJLz/NfZzte7bRqPOZmEsr81+nlcK3cY9yW1H4zOZEzb2g+ekWEzHewaNwKZTqiDctlG
	SfzsdbTfIB/iZX7ZscGHxZtIj4JRN0UL9mDDxG+hnmibsno3xeuXH9O9FsTRuibjUwCcXg2UvHp
	DgBMtpg/Adzcy/mmOAAsbdlPcAknQfW6TFcMwZvO6FG4EzfLgLKK4HOnf8TuA2dVtJxYXx7uVvA
	Pqg1v4NegGyC1zMfOiWhEG3nVeyJ0WKa5++HDHm1hlZK2iqkunl1WJEQZT9Z/eL29kqBwO+I4ht
	JP0xOVSKopHf6hJyMJeNW4XwcLpYmksuvwCH1loGsoA/C++3CV6wDhUYkSd65csI2v07lpjBQNP
	ImubDdObtWtSSJqrdE03yqRe21Fp2XMDEgPrQFfmsz
X-Received: by 2002:a17:90b:3d8a:b0:3ab:9c73:12a with SMTP id 98e67ed59e1d1-3ade9b2f678mr8620747a91.2.1793123501171;
        Tue, 27 Oct 2026 10:51:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae405f198bsm2729080a91.3.2026.10.27.10.51.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5352436cd78so2560241cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123500; x=1793728300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=E9dR/mjNqy9GJMZ/X8l+BLFyTde8cG2IJd+gKVAnXyn79d0ypZmuo0Y66jaxGU5kc/
         /Y7skKJ1KOusAtHzKim5JhP9DPSbaCmEcsng9ezkD2yd5oxtXemzFdrmwS2tcmmJoee7
         bynu+LDGy8XAbQ4IO8rtPTWFIEm9kb3sAVrPw=
X-Forwarded-Encrypted: i=1; AKwUvBz5vkTGJYz8J4S8evwu/Zeju3BA9TxlFqy3NebBK+jhWvi7tBWxNWEjIhyR/UGlPKOorzHo/TO5U+eud+f+FU67@lists.infradead.org
X-Received: by 2002:a05:622a:54c:b0:536:3eef:56f3 with SMTP id d75a77b69052e-53fcc6c1af8mr63511cf.58.1793123499693;
        Tue, 27 Oct 2026 10:51:39 -0700 (PDT)
X-Received: by 2002:a05:622a:54c:b0:536:3eef:56f3 with SMTP id d75a77b69052e-53fcc6c1af8mr62871cf.58.1793123498959;
        Tue, 27 Oct 2026 10:51:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:37 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v2 3/3] ARM: dts: BCM5301X: Enable AXI PMUs
Date: Tue, 27 Oct 2026 10:51:24 -0700
Message-ID: <20261027175124.3518239-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_105142_168223_84956A2F 
X-CRM114-Status: GOOD (  12.10  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the three BCM5301X AXI Trace Modules and enable them on the
BCM5301X base DTS file.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
index f06a178a9240..dcae7cba37c4 100644
--- a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
@@ -10,6 +10,21 @@
 
 / {
 	mpcore-bus@19000000 {
+		axi_pmu_m0: pmu@3000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x3000 0x1000>;
+		};
+
+		axi_pmu_m1: pmu@4000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x4000 0x1000>;
+		};
+
+		axi_pmu_acp: pmu@7000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x7000 0x1000>;
+		};
+
 		a9pll: arm_clk@0 {
 			#clock-cells = <0>;
 			compatible = "brcm,nsp-armpll";
-- 
2.53.0


