Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D69C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ehsC4fkcGYgZxU5YfTTtJEKH9Dtw/4IjhfNmBesfrM=; b=nuCmchWv7GvR2DEg4eGLJgbIQy
	gNluFxbZBL9i3A0GF3INbRqu7ZNpQICz0xH+tKB5E5I7ccyYS/cQb2EJaEoHGgW4D4+voiw6gPM7K
	0m0qWIYvXvA8AoQlVH/YnwpBs9BmNMXoStFCtLbOyfPIa2z6Bc7NsvQt5OfJQrAHaxBiWRH0+EKdn
	xx7kyu2lWFXyimhjLhCYCpeZjCQsxhwnw7RGo4uZRfIMrYULhFERlOxU4ugu+sMASYssjNQMEX1uo
	eisYQRgZWOphfIveAiE7s/D5CcUjlBnoON5Yf7izrJ+OCteQ+Gx2aAhCyV7Hsxtmu9AYH9NBHOh/T
	rWVdJFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JGA-0000000BAY4-41fN;
	Tue, 01 Sep 2026 07:50:22 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JG8-0000000BAUS-0Ecg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:21 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d71ae3455aso8934805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249019; x=1788853819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ehsC4fkcGYgZxU5YfTTtJEKH9Dtw/4IjhfNmBesfrM=;
        b=mW5KMc++gmbOUjzso8RDr+rOwo8X5s4Av+Dn4sHOYz/UfsDuNnLB/2qGvKRrYTSX7I
         GNmLq9r6c2WTICf7ECqXFa26oRABEVLFiETWQC79mycKos1w75r+pgKkGE+zt2y3E0/B
         fIR8Vk3NAVhIxUMy9zrsJSDwFm0uJ2+UGcpms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249019; x=1788853819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ehsC4fkcGYgZxU5YfTTtJEKH9Dtw/4IjhfNmBesfrM=;
        b=oK4gh1gmZP/IiQBKleHfq78G7VC/8GeqTzwNP3eMU2xGse5nPYcx1Fy90+2qal0sEW
         9hyc3JjXHmzHhD4zGWAXAbSEZpm/I1AaYFbsZFeCp1ENyD5PV37zaKp4HJ/HtX7IPkQm
         Kv5cEG3Ywu1t2BZJmv+m0LTTqsgXOdZ42Avq7aewa1H9Di3b3yc25ZUNsZBwWIBps7LU
         IArdMDfqac7SEVrgMyv+K5J5jaHTUroA8RLzzyCMNGaEVzVE9VEIVGHW4ziTDBobuIJX
         iH1KnbDn6eo55JTsboiWnq5s/W5dDf6jQCEirHMg5DgSYJCDkFFvz9rRXn9E0dbYAf+c
         yt4g==
X-Forwarded-Encrypted: i=1; AHgh+RpBhYzcPi5jtBQ/uTCrKr9ZRx51tYJleZjOMAjrsY4UfYto1nP5zjpYNEpmAQViJFhqWvIF9XzXAWB9cDQAnunv@lists.infradead.org
X-Gm-Message-State: AFuF++n4S3S6J/W5JK3fWKpD2yEdsth1UB+C3m4bh0DuJMtHvNwYn2av
	6gC6OTSSrT0+mYCDQPwxCcRBNqC3VPOOGj5dVTS/+U3nMw3nAXBjPfYl1B65ZTnjDgu96sLAmXa
	Yn7o=
X-Gm-Gg: AYBFou0S4u4VEqFcevITY1mTZtu3qefcflvDz9OKjeRJ2tMFDrkxRm3BRTx8oharlgO
	LVL0DVAyejEnzsqs7CcwStJpEVfdZaVWbhlEcZqyFMcXNbQCwDV2x6guzfnisVuB6KblgoJUjHh
	il7TqftRiZbK+sCExGHKUWemxFpuod27x9bgByDXz3T6/H4dYhzqCdBJuVF+NW7dgMRi6637sHQ
	Nc2K6w/Pxe/P6P9l8yBl2gvetBrp3K9A1wf69X+fVlTdNPwuJ9w3FX7joQ6WYzSXTfxqD+CaYId
	mchHJ80XrEn2wWBesjsA1jjb33fiOugVF1ACM4lhRQkAk0EuKseaLEhaxNgbRwhz7UnjKz9KMhM
	AqZ0JVxtTCCQIVQCBIiXz2htJJGL4AQxmv9X4k+o5847ux/g4Pvizj8skFDldw42sMApMGrMI+m
	5ZKEfZFVbjX4LH5FFwSfLnoPbv5Am4g11X8MuVemfIB5dcX7bWrWlIsaCWrn6M5q6v30IozJS0x
	X7HivyKSd6tDZWX2jcVsiTyU2ajpjKBdlb36Qbv2R1TvLE=
X-Received: by 2002:a17:902:f791:b0:2d9:1dee:43db with SMTP id d9443c01a7336-2d91dee456dmr196089085ad.15.1788249019467;
        Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v6 8/8] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue,  1 Sep 2026 15:49:26 +0800
Message-ID: <20260901074930.764550-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005020_105459_D966D797 
X-CRM114-Status: GOOD (  15.63  )
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

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.897.gb25b4bd76c-goog


