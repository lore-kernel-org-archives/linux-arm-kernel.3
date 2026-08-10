Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2581DC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9IWB+vcmjIl6Izb/aUu3HlRiPRfJwGm+QVMLMZIBpoE=; b=GLueBG0IijdBg5K3rKhQty5oPU
	P0MqemnC4fBY+lDkDeuv/WING7rqKUQ6l5bxAcM8J7oGhmFtDpo/jmJOlNOcHyf0GqoGolU3MYQ3K
	JKmarMfta3thjnoFJC1AvpY2V6buvYvzhV8UbCfrvaG86T1pSnOr7tinIl/l5PAe0J5MsqP0fmHgK
	tytcHtOD9whs0dUEsx7TgDoJO0VzN5nEE1dSwSAyaj7UQZBuRu46Zu+Eq2e2qvMKDuBhbCFj2Xdln
	qVN2PWjuJKK5iwKEs9IN1zvz9Pq4WTGUdusXVrfHv9h3JC/NOtMrYvCFL6uIp/PvJN80hqpVSKppg
	q29VTIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRxV-0000000CGre-0gcz;
	Mon, 10 Aug 2026 15:30:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRwy-0000000CGmk-3cWf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:30:36 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-495437bb891so39485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375803; x=1786980603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9IWB+vcmjIl6Izb/aUu3HlRiPRfJwGm+QVMLMZIBpoE=;
        b=NepQ4RDAhzdgEKRPRimVKOLuft92VtJN9bGYGSni1hwPDrENJ82zZZ5SrGZXhoiR8t
         +f1Fi2+3l5dXbVDOn+T+DOWe7DT0utns7KD9Iio/7ZEFiV3WnS+xb8bayXotnpU7kN5I
         MtqYNLAYwiRgyN2wl/Qb7vQtEQnMHx0kh279TMQ89sliAJQLD/Peu6XI6NGPlUhoYzk+
         bXPKoEPcmY++/cYDmUf7tNYWmWYe3PmMsdYXAC4lgh6XNo8D7364lDLMy8cU5vbwWRy+
         B6oRexiU6fax2vI8rCZPR5FvnNVDTzuYY5ODDh7yIy4IAfPk+Jzgqcb0yECq32PTXQIt
         kEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375803; x=1786980603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9IWB+vcmjIl6Izb/aUu3HlRiPRfJwGm+QVMLMZIBpoE=;
        b=afxBZS86D5z2vLvqhS9X94Ls+AcBO46JiX1vmtyJCLXuV1K2SlnuqDo79dzl4VpKa4
         lsALPV2rOlUkDEpg0CUU+J9rzpoxFzYixJ1gg0+cgvvZKIWHF4GUHC+UUMWDebZQLK7e
         QvMyZmgWvIxvbBoMC+dNRLefe4kdgmR1U7+lT35gADKN/ifq+fosVk6nf6MfxLm/lRnH
         1v5EBa1+5lTty3WWFch2Gos0a2ZX+StwFvho4WpynKVfBxscvWd02c0PbNkCKHrwi0ei
         5ezcvWJHebqEAxQ/nmpA5PBF9qXHfEcAmdaqgZ8KRkNsspB+CL2jxobTeaOfR0q4E69K
         0nFA==
X-Forwarded-Encrypted: i=1; AHgh+Rrk2uthTl1jWHIIqRPXM0BMJryT7u4kURCkUENn06JlQYuOM9f1zCYadoKQbVZk3ogDKc2ZzJzRaZVOwcd7FjhX@lists.infradead.org
X-Gm-Message-State: AOJu0YxiA+yrMbBHrF032uPesp4TR9HVO4q8MohcSTvTqqdoEp7YphIv
	orNjzeBb4c/7EKri5h6Vyhl3vs2J/pUMUyajKad2vhbgFZcxGJQ6lQwh
X-Gm-Gg: AR+sD13dK7bURX4Mhuz8zJkbCVA9e1UqWQG5s+A1Nx0/eqMhoH/3ENj5WDRXeRjjJrJ
	3NtIqLCw6SftGbVeoIM5OvoSLyLaf/1uq/PVjJYTaPlDSpS2aS/uODGFfa1Vrg8AEoDqxwEcboE
	o7jEuOxDTXPuOULP3dKMLnIORn0cMCclF5qBFSNMfvSK7boyj15H9tamEhC3I60mJdGRydnrGhd
	HrGXFOQM6JyeeENY5utxUa/jGHL5RNflNndRoxcY6gJywNpnPEhui5f6A/pogBCARYwgSlGjXBD
	zljSxuiosM6qdGKKfvOg2rIWWOpXm+95IExgkg4Yn9CJa9Q6uzX5eKuvp5aYZ5MD4KBu2IaNchH
	Kf8Opj2jsCtIG+GctqjZLVpSk4WAxcTPG3I95J8UERGdh3rCTmY8es+9NKjRzhFgcjil3SeAjsp
	XKfC26VDD75XIDwOrSXEYv8KbU+NVVh8WWMadKokmZvqIgDKFDky41KUTyeu1dfDyRV2Zh23HVZ
	NpwxQ==
X-Received: by 2002:a05:600c:8a6:b0:498:1577:e11a with SMTP id 5b1f17b1804b1-499624840d3mr182391815e9.5.1786375802737;
        Mon, 10 Aug 2026 08:30:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480020be8f3sm33917464f8f.0.2026.08.10.08.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:30:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: vf610: describe the L2 cache geometry
Date: Mon, 10 Aug 2026 17:30:01 +0200
Message-ID: <20260810153001.3236085-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_083004_915080_884BA507 
X-CRM114-Status: GOOD (  10.52  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The L2 node names the controller and its level, but not its size, line
size or set count, so cacheinfo cannot describe the last level of the
hierarchy even though the cpu node already points at it.

Fill them in from the Vybrid reference manual (NXP VFXXXRM), section
3.2.3: 8 way set associative, 512 KB, 32 byte line, so 2048 sets.

Not tested on VF610 silicon, the values come from the manual. The
matching change for the L1 caches was tested on a VF500.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf610.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf610.dtsi b/arch/arm/boot/dts/nxp/vf/vf610.dtsi
index 2fba923..ea59e3d 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf610.dtsi
@@ -14,6 +14,9 @@
 		reg = <0x40006000 0x1000>;
 		cache-unified;
 		cache-level = <2>;
+		cache-line-size = <32>;
+		cache-sets = <2048>;
+		cache-size = <0x80000>;
 		arm,data-latency = <3 3 3>;
 		arm,tag-latency = <2 2 2>;
 	};
-- 
2.54.0


