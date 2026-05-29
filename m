Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB54CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXtmoRa4P06Ph2LHtyp4xqyCcrT4FMd0i5231H6kh7A=; b=sqE6tJjA9ejoJD/Tf3YkysPBrE
	CfLgCRcdhd9FzHCpd/YEbqo1W9i3S/2727r1scYsu0+HtfNj8N4rLNDINjNU+ylWEAgEcFxs9CT0h
	clSTUdPNUd1WQcP0RKo7F0aitr/8y4BakxrmWj9rH3zcP0oCOOQM4cY6ZuMvs0u9ZN+zRbHSD6u50
	El6E7+AnY4dyz7kc0VGqRK9exMDYOOr15X3CLUgnM9c9tqe1glD/MBde0VfdX6bYm6o9LTWp5gx0N
	WmgWI/YUgRAjOu+uGrWXLUMXoJbqIlvLGzHcxE5nh7OMZs704jGCQ2IHdyPpmWyDJl+ddT8GhpjRv
	WQtDhjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZp-00000007mbV-1IJ0;
	Fri, 29 May 2026 15:56:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZL-00000007m3d-2d2W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:56:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso122174915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780070178; x=1780674978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXtmoRa4P06Ph2LHtyp4xqyCcrT4FMd0i5231H6kh7A=;
        b=TrAzcnusLAclwGxgo7DNMaSEXozYX8u4aQNToRONT+1QXckDhABzvMf152PPb+xUss
         QQrcDjpHNQ4GBtQCu22j1ZK2mOxeKnGlmMBoiPi4VwG/Gno9ar63dOgARy37SpRJR7IJ
         B4ZjQA40U4lLurIV4kYzOTfFWg43Skw/RwE2WhY3eW9KHpHjw6XjsijMlSLg7N/Xmtxk
         /TnB74g4On/UVPIs7bng48WHM8233j2LEwugrDOAv4VDIx1bsIGl08a/bCKKLypa4iJt
         N0eGUHxmmn603wYb0Lhs2cAXNXgcx7LShQivAjltBKOG3spDDQgYsF5nDbKWXBSC0Fou
         jVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070178; x=1780674978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DXtmoRa4P06Ph2LHtyp4xqyCcrT4FMd0i5231H6kh7A=;
        b=dNk5P54kOV2GRvKEsjU4NokXtlZeCKV4Bxjz9NXdKF50eBn9Tdb+8cSTpgnzctCL/Y
         KUnys797xKXqPcdeazxLwB453oaaVhZ1ARfD9VeEsXwXbiOp+hHIeFKudtuEiT0YLvbc
         jaEbIBUIk4xsoazWtUhCJjo4/mFW95M3yTiZPKh8iHwF/ZKbdY+tvXpFBjPzjlSm5+yt
         rB6zE3vV7m6LbnRAbbB67ajIQVczobFVfCZDBaL/z+2iSUdBCrILCenuY9uIHNCjhyv4
         OZGeG1dyRdymyRUNZKi9rpqa5iE3ITaaGtUltPoDFII8OUg86KAJAEIeiDk1zgtgGAOw
         /BIw==
X-Forwarded-Encrypted: i=1; AFNElJ+CXBmCydntJNYhx0ULP2NF89L4Ic9b2Rf32uyXaTJE3ALbrUj7WGL63dNfQHhl86apJ2lhnfT41EGAxXiyeAzk@lists.infradead.org
X-Gm-Message-State: AOJu0YwxvV9cobIT4zBK4O3gadgczofmT5bfxkY21cGpfq60S29esKDJ
	rHYhw88Cekpc/48NKCYl162zKPb89KLyZiO3w4N6671D1Gtrqv8IemF8
X-Gm-Gg: Acq92OFe2FlLz+dT9O+UVfEmu+bLEXp/GaKXBUT2bts9I0xCOSZi9Jmm9s7tqxt9azr
	feikWgB4IcLJFbWHz/hJnTTwCNtMnqkgCfa70CIL8pz3Zu46erIYIhbx6AM/ts7JtkHax8Dnkbe
	wVF5JkQ6+jSTPC1KKKQ3Jbf9LtR6fBkZDhUBNqAOL2aJCKZZ7I8O2tU1dyKCQzAwBf56XB18wu5
	zyi3b6RC4SWprtl5Q6HqvNhWY91hEykak8AFlk8cMqhAs3jpBwQWvznZMDWtXQBB2BB2aZ/SfX2
	a2S7eZKC/n4Pj6T9fkEwegtsecAepz50F5AS7nF1riPLeDezoBbf+GRyhTP1fSxXXS/CiYn3dBq
	ODdlzANP1bR+S/yJ3KkobbGQHINbOf+uZxcQJ/TByab+PvTpreDGsEEZ1ikC5DRe0NjwfnSIkSL
	cCDVcgVPQfz3OGueUT5R2MPVttoeNqfzT8xSl/YB3oaMm7vS5HFqjrKbIVy85PyNII/yyktM1sG
	CQQT2ZPlwoEHK69z8tgr2p+uy0MQ6UmBaM3iVET
X-Received: by 2002:a05:600c:1382:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-490a29e4449mr1171935e9.11.1780070177866;
        Fri, 29 May 2026 08:56:17 -0700 (PDT)
Received: from debian.tailb81abf.ts.net (2a01cb09e0354cc878d00097536575e1.ipv6.abo.wanadoo.fr. [2a01:cb09:e035:4cc8:78d0:97:5365:75e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm55150315e9.15.2026.05.29.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:56:17 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: rk3568-rock-3b: Enable NPU
Date: Fri, 29 May 2026 17:58:24 +0200
Message-Id: <20260529155824.3099831-5-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260529155824.3099831-1-midgy971@gmail.com>
References: <20260529155824.3099831-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085619_674836_4D2F763F 
X-CRM114-Status: GOOD (  11.08  )
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

From: Midgy BALON <midgy971@gmail.com>

Enable the RKNN core 0 and its IOMMU on the Radxa ROCK 3B by
overriding their status. The Rocket accel driver binds via the
rockchip,rk3568-rknn-core compatible.

The NPU is powered from vdd_npu (regulator already defined for OPP
table). The IOMMU node is also enabled so the rocket driver can manage
its own paging domain for user-mode submissions.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 3d0c1ccfa..d54229123 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -779,3 +779,12 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&rknn_core_0 {
+	npu-supply = <&vdd_npu>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
-- 
2.39.5


