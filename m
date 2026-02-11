Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6395EECD6E7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMI81tlEGd5ZFeGN2V0v4Psax4OyjBHj6wkzJgwxN1c=; b=Xgq6HxOyM7rIvFwy0qtwn+pCVO
	2/hXN5D/JMShWS66mEqMDd/iuUgP+eeYkq5wsB7TpcAaZjTBr6e9PzL/JsoJbD8zCjduC1+Vn2r+l
	nce5UkXLK/CXvvWzuzHZOanWU6H5XeA6kM1VW+/WpiIoTp/WJpM7hqbQFyxSltddXNG4mquFk7Brz
	jCM5CwkQCSoroyw7uUz1veZsh/P7LNc5mcAMX7Wfxplc7PRNyzrq+RHD8nnpRRrZuVTt7t4N+uirR
	991ltPPVugT4MAtzRayh7tSYJi+bRGGeV4ferGCTdjY+UJeOlm4oVx7CT8OFO/IrEBp7EpR2bSLx+
	CkqXtZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXs-00000000xcs-2gdB;
	Wed, 11 Feb 2026 19:06:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXl-00000000xVR-0uG3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:34 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-436309f1ad7so3920587f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 11:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836791; x=1771441591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMI81tlEGd5ZFeGN2V0v4Psax4OyjBHj6wkzJgwxN1c=;
        b=U5ceRZlYRmHSlNBt9mkGZYmoGlUXP+2AotK7N6hQvOMwBXHpsVtiemb2a1jttLIdpt
         zAqBKpz8HwqNdyvT1FZecTJ74LODwtoZzL/2Md+Thj0IxHJgtT574kqWJBQ//nckmKhJ
         4pLcH64+b61g4mcgSO7JCmEDgUxjXT8IIwQwA+OdtbJzLwrqk38e78f2hL2GJMRGNW+O
         H5BzkJjIBf4IkIjHRj4zIH9i90c1WdAbhCR5OpeqgOV7KkmoaKRFiwh7wU1leVhDtQ4/
         faj7JVzVvuoiUJ+R18/40HxECbLyRlahiHl/hRNZR4wbFVzjAv2bQqTaQUMGC7J3snnL
         0V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836791; x=1771441591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JMI81tlEGd5ZFeGN2V0v4Psax4OyjBHj6wkzJgwxN1c=;
        b=c/Cjao9gLJG7gfeXt5NcZ7nQ1O2R9N4rEq3GWZQbYM7FRr8ymbWgAldpwuyw62y5Jz
         b2/aG5qZxkAirq80npEHUrhL4JQRG64l4nVtwEdM0P6O3PJOEh6sapK0asr2cupNvQ99
         RuGzVuGrG0rhTchlKRpkzWKZK/XGC1UPjjV2OJMHkgNIyFrM0/DgxvMbSTKcCwm+I5mV
         4d8x1ZSIcb59d64gVZleIxzxP3qT6ir6AcGS04HN5hy3XzvpWqS46g0aZVSQsrUxHaeV
         OeURecsvI3/124KRrUBeYjjVPTLfyBNdXNO17b6w+zPFLxrNMjlyhul13evI8DOt2KxT
         xxXw==
X-Forwarded-Encrypted: i=1; AJvYcCWzKXLHoH0mJTzpyifEcmD0Y8FRZLgzR9r51TjOBmW4uOpsb+qkfZPGan53rHwuXQVlsANPJJRR+IfiL4zDvnIG@lists.infradead.org
X-Gm-Message-State: AOJu0YzfTh/uQLwphyLQdNvy619tzUTdxmoqbZ2Jr/6BbTU6xBCW4oqC
	x2jNni1EaKg90QJECRP4EePom3eY3YQYf48fqYmF/thIEA/Aefs1jtNX
X-Gm-Gg: AZuq6aK+kNQ0bP++RBhS637KNX8Dqy7ELZ0youb+aZt2ktTd+1hjYWu6jCwfvgHL+hA
	bqRDg5cfs2YXU4yHMrUxy/8fztDHc22uUZtmEXoEoGzM6eVNPN12PbwfdGGnb8r4+Ucb1/9VRZx
	EJdndKRbv+A0BaojodNbFNEjbvWfKBi/6yBfTDskvmPHeoU4J1Jac6Ut+x/iaUIBFB2nT6wxX0G
	LeUG/xk0A/J2+wsSQLwfMCQeHbTVj/lTohejr6pcBA88W2b+UlxISJAILfkmheHYRQ3T8PqUs9R
	OpBJazf6e8Nk4VpvBEstONS7NF2GXlFyPInxTFeTcyNVKr5Bimy9BvvkWKFUvcwbEDhx6gGv2XK
	/hsZQVpEADs9QDxlOt53aRZCYx5bgD6/Ud4D6KrxxO7Q84/fFCcZnwU7rm/wg4riq3jvcqHdmEI
	Z3DMCtBkfWNt/Wnmpm1IA=
X-Received: by 2002:a05:6000:2209:b0:436:3707:2be6 with SMTP id ffacd0b85a97d-4378ad60397mr789319f8f.53.1770836791489;
        Wed, 11 Feb 2026 11:06:31 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:31 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/7] arm64: dts: mt8167: Add a specific watchdog dts node
Date: Wed, 11 Feb 2026 19:03:26 +0000
Message-ID: <228e74cc870ac01b223875e2a0dd7effa4137213.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110633_258884_1C947CC6 
X-CRM114-Status: GOOD (  11.38  )
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

The watchdog driver for mt8167 relies on DT data, so the fallback
compatible mt8516 won't work, need to update watchdog device node
to sync with watchdog dt-binding document.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index fd17daa13dba..caf51f203dd3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -48,6 +48,13 @@ apmixedsys: apmixedsys@10018000 {
 			#clock-cells = <1>;
 		};
 
+		watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		scpsys: syscon@10006000 {
 			compatible = "mediatek,mt8167-scpsys", "syscon", "simple-mfd";
 			reg = <0 0x10006000 0 0x1000>;
-- 
2.43.0


