Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5DFC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 04:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tEwhTxKNyJs3pF0LaNEucWWGIQ4rU4SyQWya7wYtjg=; b=COIdO1Ww3jjRhd78sz9NrpR3rs
	yXsaLOziNshnhndkCQUZbWNmOOKweH4tP1inCb2OS2rkMS8QfxBdMcNiu8qxZ83aUDxLdrD+/WVTN
	ZfSUKWp/rt+IhmBWgZ6lq5ir1c39IK/p1r4zAyN0Id7sJOQDN2n9tanpbEZN+Sc9P/i2kSqqZci7m
	sSCkkMg4mWT0zm6+p2w6/nI7pLG8xI08b9pTNL9ZGEkK8SWiOy6BQLZhFrh9fkqwtJmq55I9i/GHv
	42Z3VY91r73G7MpukJHZn3N6tSjyEeSdnHFJkx0Ngbndmam4Un1ioQkZP7RjJJ90p5o6TGdRduZlq
	tpTSzNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirN-000000008V1-2SlJ;
	Tue, 25 Aug 2026 04:34:05 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirG-000000008QU-1jNS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:59 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso2646172a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 21:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632438; x=1788237238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tEwhTxKNyJs3pF0LaNEucWWGIQ4rU4SyQWya7wYtjg=;
        b=YQCy0vllvP4gRcfopejwzhySibOel1hryA9jGGFTI0bL48Jbx7cf0fGPfJaGCdr8kM
         WsX1YLzDJ0XytjWj+EyPJDKof68jTmtsD16Yv100TsVoBrQYsMvBrsDCEJjZcaWjQka7
         0qSNG2nYZu8w6Eu4asozfd63x6Ur3Hq0cFWUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632438; x=1788237238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tEwhTxKNyJs3pF0LaNEucWWGIQ4rU4SyQWya7wYtjg=;
        b=FiqAZc0Km91etBaL16HzvYcOlqlEizLgI9vByV5vVYnKihAZ1gxQrMLMODV7MCPvXV
         Q30kouC4V98OsnmuKBOsb7BrbxOBw37w14F7h1tkS7gctdHJWMgGEXGzVAOLHRon+m/a
         VWr6PCaoTtNoiAHbOZqmvfMCDqwylE1sz730wSEJoJRBKI8E/Iw2vQ7JuweztD257imB
         xABPVU1WVU/bf457iv3VYq2+W5Dh3sZmYmYZSu0502F4OWJyH5DyACmKSAzSKBABlh0Y
         ziMochzxlwa4gkVqf78xVhWDj8DrCAydH/AQqultqwfj8nTKJ3ez8PYsMlh5+HgCbbkI
         6H6A==
X-Forwarded-Encrypted: i=1; AHgh+Rq695mWh7VxY0kDD354gRC6BOPGruOHt7Hgsda4uDLQtPCESvI+5xt4n4Tbq6NU6oHlqWeoebD7/ghyNkBiKZAc@lists.infradead.org
X-Gm-Message-State: AFuF++mUqCUCIUbixLSiX+EQdFClyLMKJpSMLA/B5BAikOpWRhWzmWOY
	NBjX0ZwN2UFzUBGmxlrn7jDVsy8pULdUkiwRLE6Bub+8UgWHBSD2QZ0dQg/mUAQ5Og==
X-Gm-Gg: AR+sD11aEq77hLQQVhOX5rmTvv5h4EkBSZRM8/77/s8+1hXxsjJhXGclqnoPekmNo3K
	QqfDEFcVN8U9MBtxiBoKLC186DN2MEl47mamPbWdQGvO4Zz3k9DvxlQjw13qz+lPf3/kt8Guotw
	TMj3JC5Z78PXJsuqCBxKJfQRxjj1SQrsuy+arjUu4p7Zh26OPeiSVpk01JBseZonaFHtwdpZu9R
	nmaPsZ5cRHS99BjOo7FMs0nHXeuARz21ncPDu7bjRDsfaAHm8LWX9DcBjPQaY6n1/IijQ1Bv5P9
	lcFJeQNOJPqGHagBGhARcYPO1mvhiMVgzMazCRvthC1jQcnFDGR0dUKLrbNu99nZwu3qB8wfqcx
	vtJciYHkP4C0/6HudT8WNsQXf6Rn1ny49Kv6TY8L//pdbOjbmnp3l5aIWGFLIavdMMT4MtcdXxG
	C7obwmTjUEm/bOZcAH7VubE4FY5hmNDtHYdGFYb9I1Di3M4wp79Zzpp5s7ZUmguYpUal+M3L5fM
	J22ZsOut3rm5hmJHuQnTMqpynW5cnK29mJoW4yODXBWidg=
X-Received: by 2002:a17:90b:17c4:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39646519363mr6944892a91.13.1787632437771;
        Mon, 24 Aug 2026 21:33:57 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:57 -0700 (PDT)
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
Subject: [PATCH v5 7/7] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue, 25 Aug 2026 12:16:25 +0800
Message-ID: <20260825041628.988369-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213358_457286_42FA0DF2 
X-CRM114-Status: GOOD (  14.96  )
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
2.55.0.860.g4b6b3295ed-goog


