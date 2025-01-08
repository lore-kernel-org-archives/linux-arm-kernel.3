Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0BAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jTD4xCu+4feI3XGCQAs3L1ZGc+rHp5IadbyQhEAC64Y=; b=YLzhcLhl+BZnrVnJpjFWXewMvw
	bX0iU7QLTQxKZIbsDZvNJbNjpN2CwBLfL8gg6CgN0NEoro3cW80D07XS2+IlHs5paOsUvpdXcat5P
	zxtgnW6TBc+H0MP/lxmeD7T/tF92Dt79GUkyzr7La9uGRDwqRDqiYP2DocQ2HMWZboR2+lhAMyao5
	hquTtJe/puiGxLdz2dttR+SpnO6rlX+diJJvdkpLB/tkWlv7sPuGhX+bm5rtGhTgs6W/hIPzNn2/y
	NZ+6l3KcaO+cmASmHppYXU6Z9j/O8rJEp0+ffwYvwydLGz9N26ZyVS9T1HGw0wx4s6pxODKQ6uxfB
	kW7f6QIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVW7r-00000008c9X-0YKF;
	Wed, 08 Jan 2025 13:29:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVpk-00000008Yhj-2B1r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:10:53 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso29288470a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 05:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1736341850; x=1736946650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTD4xCu+4feI3XGCQAs3L1ZGc+rHp5IadbyQhEAC64Y=;
        b=jZa1kOhYP2L7X5QW+8kWtT89ElRg58AOeiEZ4wdUW5MjbFI0GBewZGJXDZ29vyuLDp
         bvRTUa9VYZcH//4lvtbzyDMR8zTjE9YLM9QCwh3m4fGNOFrsIJBULf0CdSqtqMRnHfvL
         1lx5UJjKxQhYY1c6EDEC1HAR1NA6C3A3pRFOwidZ3qETN+d2YQYZySDzHM4t4POVe8m/
         To8hFHMI7cagdGaIZxHKPT2Hb82JndW4L0oNXlEgsPr+fr6IDWIOCCTd8dC0gNYik3mI
         vj7p6RNPsifvEW3OaD06AfFuN/jNFTcafxs6YMBaMaTQmX+arKqabXqcBUZt3E+0sz5m
         +DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341850; x=1736946650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTD4xCu+4feI3XGCQAs3L1ZGc+rHp5IadbyQhEAC64Y=;
        b=cP2LW222h40mAuSJBr8sfIqx3mKdst/XLk0P49P+W7PnK1sH3HLDgfaWkih5IB594r
         7p1jBwE9Fwk0tCQbYetHU8GnETlJAsL0/GMILd4ejgl+kEB+ckN/sEZypoR8tD26tUIN
         U0Wh4YRPmIp+LhR2QxGtk+WovrG2nyHGNVedb0pG1qTlT1nEvJ6XVpuGiLk/1Eit7gy7
         iYxXFAfFpsr4poYnfffzp4MTmSYwRpKjok2bcrxbJG9jjnZ96cfi4Zb6dn4iS5mKJVVp
         TaOXzjWn07RcNBWUKn1wSAYHWY8G8TeNY3VThQvuigbBUO+ojeL8S/VbX8r6cK8hq1jR
         026A==
X-Forwarded-Encrypted: i=1; AJvYcCX5gC9DzI1DYyVnkzGVv6yq8KPh0Zgyv9rAMAXMWHKysaAC1QgHzi11x1JTBbqyJI+if6SjnsJXgRC5/LatYhea@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9DkfhMoYqBIiCiIUq+vRCmYcTITBPakBswbtCRevvk1YTYPmo
	ZGLip3b4+lOe74N8SD0cJlHd61YVai1LSrL0//9RLfhy2+GAqfSoJllZ6rg79xk=
X-Gm-Gg: ASbGncs9nkD/UjlUuTv2jweTbIZBfuLwTg8OAjM+8MiJParpDAWrKASeTAc5/7/ELYB
	fpu9Zhhc5DlLWiIBFGeLCLif3caz5YY5zh6tgUXVVnBjq9RTBR73ptTqBLzbfgYlGWc+bm0mbRC
	5DK/XmYbEKGvwOKA2gXcquxtnyn5jEMSE2NHcUh+OJDrt4S1JeM1fvfskIa6QbfPuSGGKT3ehHq
	Kwk/BjKC3FQsn1cH8x2c/9jkpoYAnzFGw6TEKI+GIP5B/TiuhZwmWYZJhZOUd3tqMH5lySt0gIc
	4g==
X-Google-Smtp-Source: AGHT+IHLwNyy4A70HAWpzRTfVcvclZt7HwGR3P3PBQ5fNfIfanYr2FOL00ctrneNCFGNPtK8PpM4xA==
X-Received: by 2002:a05:6402:35d5:b0:5d1:2440:9ad3 with SMTP id 4fb4d7f45d1cf-5d972e703e5mr2225214a12.30.1736341850034;
        Wed, 08 Jan 2025 05:10:50 -0800 (PST)
Received: from fedora.. (d-zg2-023.globalnet.hr. [213.149.37.23])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedaebsm26159761a12.57.2025.01.08.05.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:10:49 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	lars.povlsen@microchip.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	daniel.machon@microchip.com,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 1/3] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Wed,  8 Jan 2025 14:09:26 +0100
Message-ID: <20250108131045.40642-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_051052_563009_B88AFF5A 
X-CRM114-Status: UNSURE (   8.09  )
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

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Rebase on top of next-20250107

Changes in v2:
* Add forgotten LAN969x architecture support itself

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index e2638e5118a7..cd29480be792 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,6 +133,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.47.1


