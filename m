Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B15CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxawcVMUmbUvqqPxaNpdk+0HJuQP6lj53yk/T+9Nz1g=; b=ApGd5n2mLdHdLgDH7GsqBmBgyh
	vWFr8IAZr5QiLUmaceE/klLO8Cf6jYvQz+wIrdHayiBSnvd/X2bwDS+YA6sun9Z/ZmYxzPLdoP7Fp
	9blOoqQIIrvYJG2LBSEnho/ScTH7F8ATR9g5fP69UyoUhdWWiA71zKlQOK2w/CnhJXuC54CeHjDcT
	MTlrcgp/rv5vJ6wA4vdRtXYGiuiqtXwcj7UfDOMGVeLl4byscsP9nQOl8jVvyiRNHW235poZ6gFpz
	KulHs76XYyLtSW66EvN/PbSNcFL/T1N050CMaHXMV2ftUiWBqh/q/rXHd7QN5LgDBM1umuSM6QiyU
	JfdNa3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2lN-00000009Jn5-1pxr;
	Tue, 09 Sep 2025 18:08:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2lM-00000009JlO-0raZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:08:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso52292925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441294; x=1758046094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxawcVMUmbUvqqPxaNpdk+0HJuQP6lj53yk/T+9Nz1g=;
        b=I9L1MchhkGTuQfiqde+2TAyNU/OeryI8wKS6h4W2FGGKiSn4QpwizVd04VH9oS7E2p
         Hi1CHqa89s3YG0rE3/ZyAknkSmFTItLf/inBW8Jad1sQQ2lwrspVvnlMStohzPTA6SPK
         DeRpaunBQnvh6wSg3EyS4rqdyu26bzVU/UY8KrilKaz8BpTwpPyVBRIDFFmvXnqUL++Q
         wsv5UqPakpQFloP84k504j7Seqr1aAAt6GV5BiGTp4/CRFIP6dQFRMWg2gAR7T7+dL/i
         yIyWL67J8dT4PxLVFxcZDdnoE8XFzdJvPCHfW3VmSfmmwUesl0BoMmJvkgxDK1RbJlYc
         57IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441294; x=1758046094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxawcVMUmbUvqqPxaNpdk+0HJuQP6lj53yk/T+9Nz1g=;
        b=ngj6b4SbTJrz2zNF/xL5U4w58NXtfxOnUIa2NHCzRZPmzLi9727UTZACTx8NtBfWMy
         qZHq4KYjGAGV7KsD3ZWe98gF6D0lG90rI/eMHglw4DWfO52UxAWbTec82Rzc9D2IGUWq
         MTeNCoVn3m27AVU0T2NO+zNoGvMW2mVIwn2EFN1ti4d9xKHCZoad3p/YKMw8rWvyuYBB
         hozGjlNxYDwNGGwzFcU9CnAahxiCiZzZKcAlCyXtXrMNyRHuzlXAKkQjZce88Lbox30A
         y4+sleCT2oAJ16OjoEBZ6Y8eBtN5X33NycKIAJPFl7ZHhclud7Td81GtOYPPSJhBcIGn
         cw0Q==
X-Forwarded-Encrypted: i=1; AJvYcCURa2bndvA4Ss6is271MtGq1re3qR7+SxvmrzbzaMc0WO9wGHCPh1Yxde0l/xVai2727MpYq4uHsp62fLXa2GEX@lists.infradead.org
X-Gm-Message-State: AOJu0YykT7d3WcutemTW7fRDIR8JPs7tBIKk+mv3bAcQg+9mKSBTra8w
	YF70QD7uscvKK2cClNZFOIHP34KJ8SE8FiuoSCr6gCjoR7+pxpV/VdYW
X-Gm-Gg: ASbGncsNicb5opHM34pZYt4Np9Elba3gdCmf2J5+LAV+XBeMTRHsXIhOeGL3yYG9ndr
	86W4wnoMJ+/xqVW9INrGwq6XOx3ELP/jwXGuwx26tnv2mkP6nA6TFMKW6fcjH1YTPEbGPd6HOho
	+glkXpxLlNvD+3cP4ULT7uKa+B9+DQDTiwW8aQtZTohkiEEukLc1Z6a3EVyH0hE6fKXD2LaqmIF
	LVB1GtZ+Lk3Mbgwue2v/gKjJQvVm2ruALhZWsqs43qI8Isu4IuHpkrxqvh0P4HOWo+lX+EFD9HN
	V5B8oy0T/tr2NplTLrQNbHpCnP8hmE45LzfHokybn2U6AiGHdrwextwq7NIDfA1sN0boquK7s6y
	fmC2dC6qJ3bpTIJrOIdajFUpfuTxzdG+ERcvV7nKo7nAyVVr5gmtOJwBHfh7q8qpaAVSa6eGUva
	DlTg==
X-Google-Smtp-Source: AGHT+IFnbYT8GYyc5eCt+OlLn6Os29oq3eYhN9HwkDz5ihtSMZY4WJbNOfW/8SAxRHklUlK0Uch4SQ==
X-Received: by 2002:a05:600c:3b1a:b0:45b:627a:60cf with SMTP id 5b1f17b1804b1-45dddecf404mr128077615e9.24.1757441294286;
        Tue, 09 Sep 2025 11:08:14 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:13 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nishanth Menon <nm@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 11/11] arm64: defconfig: Enable RZ/G3E USB3 PHY driver
Date: Tue,  9 Sep 2025 19:07:56 +0100
Message-ID: <20250909180803.140939-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_110816_255199_54B87E25 
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

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the RZ/G3E USB3 PHY driver on the Renesas RZ/G3E SMARC EVK board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6d9a330e3287..a93dc6202d92 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1649,6 +1649,7 @@ CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
+CONFIG_PHY_RZ_G3E_USB3=m
 CONFIG_PHY_ROCKCHIP_EMMC=y
 CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
-- 
2.43.0


