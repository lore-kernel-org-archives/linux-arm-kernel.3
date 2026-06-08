Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F346CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PatEQLdut9te2eHCPW8R4X5P453NImp5hCpKSvxqec=; b=IMs3d6Bj5Di0P0N+A5afdWw5kO
	GA7EQtgkZXZY2jP8K6r5zHb4BmUx9KzqSCr/0wP8l9LWR8CRo9QNs8TSGIqmISFj4RQx6XyRSORro
	FFLacEfEyrUilEyNwF2ZRf+a5GvSoYASNBdJhCKcDa2oLLkuWm794zsr3QElJLp3A7tJsAWm+VLa7
	tJnB00zMHh06V4HhHxnErgww2XPVFHadVH0gDKSVPTUlmuSJ70hrdcgy5cxDbXMz7b/lNvC4hKzSW
	wYJXhVh8ggs02UgWqK3Rh+ZOdnQ0g2y81iaFuKa0ghanad6GL8t68l6dab5sL5vMToYdj3qJH8ldw
	pZP6gtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasA-00000003jPU-0yIk;
	Mon, 08 Jun 2026 14:22:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas5-00000003jJc-2xWJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:34 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso883941866b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928552; x=1781533352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PatEQLdut9te2eHCPW8R4X5P453NImp5hCpKSvxqec=;
        b=f0qqzRF+F3+T+4c3tL9zD4ZKpCwGZYwM7sLa5Ie49QKYuuC+dqz8ZkBN/D+XCcUuBt
         BCY//mryKmrd+YZ9w3+qXRT0i5UnlOAiFCuRz5g2slcZhhuQqSOWqTCrbaL2WWj5hAau
         tIIUloj3oEQ+V0uHNEnz1wiVVm2OtdsdRuo4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928552; x=1781533352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8PatEQLdut9te2eHCPW8R4X5P453NImp5hCpKSvxqec=;
        b=BBk5GPHaCMnM9j/YqmJdxXoevDZ9zou8qcwUdkzWTFt7iotTBRAyOsxh/U4PUDBngI
         GPQZuJ4mYR6xcrL9mJYFLlKbwCCfaH3X/MSPms+8rUr3YLavPBxEXFmUibyqKex4h2kL
         sWsZeIE4MRSCfAencQRlOS6jCq3SuLt8F1Y+02xIJ1tkZlgFkHURBLzPDLSH/S3OIOWg
         /u+PCRJqMDF9kMBZThpldKQ5kl8qPSPCXAvuY1lmu7nhRkUMAsUhJymgV8yB9K1oWRCE
         wY9X7rl89d6qJnyJwfKG6KvePyprLdFk9YUpSLT+Gy0OZ2LBBXMXw3Ga4cCGhvDmPwE7
         ch6w==
X-Forwarded-Encrypted: i=1; AFNElJ8CPtiqwUtFOjEvvlOa4nBMU39WQ/i5Ls1X9kwDIbL6yVhhP+wOXcTyzx1LROIGYFXy2HTOv6w8zHjIbFdKB3JT@lists.infradead.org
X-Gm-Message-State: AOJu0YyyXs8VmLYKuL1hx3BjvL0UzZjtOY72C3u5UKE+t8bIMonLmNGr
	4xiMrwhDhDG7wXxyiojfd+N0AO40d3t2JTS78ordp7NmMng/9yAKeRNuZFq5iJVzAp0=
X-Gm-Gg: Acq92OHX7V+3Subh4oyIthnTf9zMg6/Fz02IvUz2X3HnjN0a+Nhp9omw7XbQJuIfeW0
	2sn+4ljYXq3akR4+Wx+1oAY5TCcLyE0k1St7glaQCPZnqhq6GkLq9s0hrm3fNjtFyxu01nH/W5B
	AT0J8hxJnPQAh9WEi/GrIy1327lcQosJKdklH8+LEw2PLHF+SpVDcpo/yFoScCVzD0FAy0ptGN0
	lgifw3AJrJrjhUGjhKFIB1/UFnjR9OPEVpLb7ftQA8ZdqYd72MjM7npzCdvqAcgQlY1OYzkqcfy
	/+uEYxupDXHoY4ueWaOi4L9YHG1YPP7AXIhUOiJgVgMs+/4mHyMInViy0jMFMa+a2SHHn3Ac1SX
	EdWnGyLhqAVxkTl2Y6eTIiufGQZPwtuka3ZVEsxWLfsi1n7yFOk0IjvsXRrrBzNw8lJPitYkn97
	0wkilSuQTAo7eIKpe/lxeCDK2ZGSw0FniVll3u0zcI+h6cGJFvk7SViLw5+gxzGoiLphn6nehMC
	ItehSOhrUhRPxiE+GLW506bGr687m/c2SRFIhRcRr0DgIzlzyq2lO6c1Ac=
X-Received: by 2002:a17:907:72d1:b0:bde:170:a0ef with SMTP id a640c23a62f3a-bf37234c5d9mr825860266b.27.1780928551592;
        Mon, 08 Jun 2026 07:22:31 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Mon,  8 Jun 2026 16:20:20 +0200
Message-ID: <20260608142221.952245-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072233_761265_BFED9B48 
X-CRM114-Status: UNSURE (   9.95  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..b3416c928c08 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0


