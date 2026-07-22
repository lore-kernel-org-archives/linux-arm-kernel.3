Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A9DC4453D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9smGZPIePSsY0cU9QHa9y4DXLJagF50l0voTZ623s+g=; b=aS3D0qui4oZ9wxCVW43EljjGyH
	POmfsNtHBiXBX/rQXPnaByM3pRU9dA+CX6kCzk50v74icq8qtIn0uTJzlZTlZRV8EeoPnDW3toYIh
	pEm7RHRealhxE9l0O80ChMxRj5PwHY6mVlzmjiGezDQ/cqzAq57apNXtHDoM8QL7vsGkvJlSnlTCc
	dtpcwYOUOCSZT7DdB3GgiktF22k17Xd57R9WfxY5MVVTXt8P1CCAsXrtjWyJZ3YzS6bVAeCQ0cCe5
	Qef2tNURPVj+nSW2gc3pwfH6Fp3J3SQl20DeTe2N4MqkNKiaEKEkFpi6ZA/nHa9ZcSE9QnXg/6y4N
	u/vwlXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgUE-0000000CxUY-17NT;
	Wed, 22 Jul 2026 23:36:26 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgU8-0000000CxSU-35Ww
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 23:36:22 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-81e6f2ee60bso27337b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763379; x=1785368179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9smGZPIePSsY0cU9QHa9y4DXLJagF50l0voTZ623s+g=;
        b=dAoCzHWV98mmOLa57U2BXpjM8tJZ7ro9MwGQVJmoTFrdq1K1EPa23i6yqttNViKhmk
         fDMk5JqAe/jmqj2e+sAUoS32sxlrLmREIMZSSG+zUSIxEDZMuMVlN/v0qE2YAgB9T/lF
         q5IUugoKICi+G6lvQb2lsQB7q1bENszVI+c/ZxZvQfKDBosPeGwnnQk8Lx162HlLu9bf
         f3zi0886rhgjknz81cm1LupJzRHkFWmpKLBvpgDs3sf6xp5scoVewKdUj9G7K3HHVR9W
         ES0CsWZDBYucquo3taLrIZ0O3Jv+iouM7gyh+j/W4bcT9+zTPlm/JPNGYrv6gUaptGgM
         ClLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763379; x=1785368179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9smGZPIePSsY0cU9QHa9y4DXLJagF50l0voTZ623s+g=;
        b=sei5sUKbiimshw9GsOtcDSYrhYuNNQ5Orde4OD5VvXOjQBJ1qygcCF9gR6oq+UdjbS
         Z1RchSy/IJoJgR7/KCOCK8pO4NT6vX6i9oht8ewb9NlO2spXGKZYcsWNGYFbuD23gx9U
         NVDNdLQAsNe3tmKgjVrqJw447k6X6iJucNKVGuPdPIK5Bd1uknxQ+quAO1QOIWneEjVp
         3aXI2sK2DmORPiHnSs3oHZwEG91Ucl7NoKeZ9EpYsTY/e0SUEQLIAojZx3tSuHww84xG
         q8OgwNCh/miDx4LLzaChGnGnm2/phLdIIrLg9nqF7YpADhdMUDQ21sL+bpXLoOuk8f8X
         qLYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0PflYH3Ne/rQE0D/OiF43BfZXubhvYWNZX0Q/kgoXVj8LRUILxhJaNgXhAgLU5yBC99erU06o8SxwbhSd5cTd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8kTKFzo3s1ZLNssq96OR1M/sR0B5d1rxBovgve2ikrOw//z2I
	1GajpA2TuzWTlTaQFBo68fsSMzBjRjBjmnjtwEUTqkFBQZf766HfMB6h
X-Gm-Gg: AR+sD10j9469VFwbAI+ho+PfCyBHgepR5xffrE+t2JW9XUoujhKsLwBeCdnjjZXdmgZ
	+5PCiElyP91rnaNTe9vsSdArbzkQVZ6cDdMLmtbCVFr4Gtq0T+fsV/glo5gfqfF9D9ey9c1KVJb
	wKtpulhJBjVtjDOGI1SfJAW9mJhrJfXcG3u1UWKPyEovrZtxEa7gDFH02KNk+dwsIa9R+88EBLa
	IVC9YMDl9bbICaw6D2i5WmEzgdVu62HeXC7wkUtDYeZNccnieidQymB9hfej4nMjow9V32rdoe0
	89Ybj6+VfhyNv6imNyVZZW5AGdbLRPxsugBGo+oAp8xrSVpWr8GilwzrvaykZSzEjgzk2Cc0zgi
	l5ZihYY/gmL4hsI5fqCmij0GhLSJ4u4KiLN4NV+5vu0lA0Z+PI/ck+A+s5hvyJrUzfyUTLw684P
	XY6Xly7lV2d+UDjTA5ZxYVumMlXMmvkYirieuN2oKByhQ29Bc=
X-Received: by 2002:a05:690c:6e89:b0:812:9e6d:d47c with SMTP id 00721157ae682-81f4d3b498emr1003157b3.10.1784763379557;
        Wed, 22 Jul 2026 16:36:19 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:19 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 3/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Wed, 22 Jul 2026 19:36:03 -0400
Message-ID: <20260722233604.3001063-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_163621_033126_F1EF1163 
X-CRM114-Status: GOOD (  11.67  )
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

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver in the RTC power domain and mux its RX
signal to PL11.

Tested on an X96 Pro+ with ir-keytable and nec keybindings with
the remote that it came with in the box.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..1eaee20acaab 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_ir_rx_pin>;
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0


