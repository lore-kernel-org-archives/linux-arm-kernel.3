Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B628CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk66zAA8a3QudJhszauWsz7yQXjnbQNtZ8Tax/bPzfc=; b=F8ss19pjN2uyEQXjEnNWlrYgB2
	u7lPl3AXSazYP916JenuxpXKSoMFz5Br3hX4V3YIOQMeP4Z8GdBpNhT7eTj8l+SuLdZrkacPdwGT5
	zis4Oe6Cwr61GtyNPW368TpXch7irm7XTx0DYpeI/m9bT/LDAZEoOxRLq04pbCMCWoFd51qw0rtX/
	9Q9mUksA0dQ7OgKtRlmp9BD0KbV2hcoBGz78E4/eI3QEFx0+P3Ana8O5bWYPjs2F0/hEDhhY7B2v4
	DEGDuQ7Z1YdZGqZuRTrBp4RMWO0IyviztmGu29G3urAyNn94kXqlojuZKvCxsTYe/fYafjSHZMAVI
	vrKt/mHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuBU-0000000799N-3uh6;
	Fri, 29 May 2026 10:11:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuBP-00000007974-30zQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:11:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48fde648a71so91416405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049474; x=1780654274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk66zAA8a3QudJhszauWsz7yQXjnbQNtZ8Tax/bPzfc=;
        b=cID/QqCnusxfvpY29cxL6/klM2rNq165bVYXx6J2eoiqH7eTVMPuko5hwq30MPWOnM
         xJ/dTIeCEF50+CpBKD4GfIZwNyCvQLozgXuqx4OJB55qLYckvWoskaH0vaqmEDc4LMJK
         shmym+G7wOtQBsGPwXIS4F9ephngLZRkbltjPJTrtzBiEMpXCiRrlcBH4PwCKQ9GMFoe
         U70hoShJKL/1veuV/eB+zwNYA3FqBkhHOpKtUUuXZugvgBRN0++GkIBW3Lcw3z0955/j
         za4XOa5ZOQIylZb1qVInuhWXt2eXL3QdIKWbgC00uLjt8kRCbhzdM7+Us8ZlH00NKyt2
         hmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049474; x=1780654274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mk66zAA8a3QudJhszauWsz7yQXjnbQNtZ8Tax/bPzfc=;
        b=muPH8To+AIq38rEMEhkV/UTE1zU3QcpDezE7O2JTjLroObyVS6TPyfTno3GFkLZryP
         l+VFLGqo/YTtdGUP8odpcoz9trHUoH1zcOYfddMaZhBDtXawOt7hb+6ClTdaDq2AZJRo
         2k3Iz1xZGyAIjMnvBGwQKKMk3SlxmRw3+IpPaUxGw0A2XMYA7m4U88x/Fmegn8RuM9KQ
         7yPe0RBnhA2M6Mpb8JSgzJjRzFg/ZBcJrnPUeGQ4cZI1TGRmH+XgdOv/oirCrEch0CBI
         hWy+ADJzpHj6D1j85Ca2YImSsdAcln2BFa0Z8S+zggcuKnO2gxXa0Vpvk2jdIkIbhMyS
         hAww==
X-Forwarded-Encrypted: i=1; AFNElJ9Rz5gltSCooFJMMGE/43ObZVcwsPvEYExOjnop+S/SNiIuZe60hvrGh5tF6el+s53232JcKo+TsqV5pIsEFoNG@lists.infradead.org
X-Gm-Message-State: AOJu0YxWj0KutgRMyv2JKNeCdwIL7V4SBFuMNeSgUPIRhR3cqf+MsnyR
	JkIKIKKFofpg4yRLGvm9H4UYVk2wa0fJjoL8TI8sCB7eYhrsxRGjPID+
X-Gm-Gg: Acq92OG3oYHczi6+qsg2Z6XOAyvI1uvu9BqQ6cjGFzFm/EvuIIUfnJpg4+BOIr4231g
	pOa/giWdxJeItP2rUN4/4kTbkfldecUZ/BLO6SiSFwlzXueoF85ZvjSbYLALsLqqgZPwY8+r+9E
	lJ27KrztHKOQPg2uoEmNanIFdwgIzEREmrLjlET+Gli+USsQqq/aIcKhMRVWIUY48uV+QZerRwD
	AdEXnTExpAM0a3qLzXQTY6B9CtnANEd/eOl1XAVaxf1+/JzZ8ycOr3j43SORp6TkkgkmV6wiTZV
	DbrrT8JlnhhjUmxk9XizbvuptgD0MItK/7Rx6mMtN9NfV5vbfokbDy8xIz/TsuRY/MnAOoG6wfo
	tYoFCUxycMTVVbYjl1L7uVOs8CKKDQLkoqv6fvbmHjRoZT2H40yiRCBnChafmj//ZTNSdPniuyQ
	08ggIiya0KXVoPTmSeA3ICW2jUO99aNAR6PMu8fTv42qBTqxK50dEFxn6G9zbMqpkIS6M6TOz1C
	pLfS6N7iyWwaUZNbf0ZliBH8rW/48BLrZwSM0e9GzDP4DJw+dViRWzbMw==
X-Received: by 2002:a05:600c:8b84:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-4909c62a2a3mr32056745e9.13.1780049473591;
        Fri, 29 May 2026 03:11:13 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:13 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 3/4] arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
Date: Fri, 29 May 2026 12:10:50 +0200
Message-ID: <d95755fc33593f4ccec6e1392924258ccf144a81.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031115_773330_AC0C9EC2 
X-CRM114-Status: GOOD (  11.62  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index a5fe8432ae59..23b359e39094 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -222,6 +222,14 @@ tpm-enable-hog {
 			output-high;
 			line-name = "tpm_en";
 		};
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3


