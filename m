Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1767EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=; b=EnJ5ciDQtQCYug3UYRGWSDT8m5
	FqM98+egBKvAeAcrPuCbgQWHgvwH4g0oGggrPhEBTsHa8+XCmddXFoLund/X4iPQCBIl5bBgS2QN/
	0uTlhZM04PH+3wfhNMRRYCwTgxyEeH3R1UP7TCnwqFUrKDhWcUZ5TZBPIrDlKlqC7XwoqcWWo2MFJ
	fxptqHraYXgwrZIN3k4PG7uBfp6oyNBp2y5wARRwUwqm+wJgSoFYnYAhahXSYs7WvnGs55W3aLHJ2
	Am/ancP98ppCUelRBMAUE+U7W4TRFaTW35yOjfaHNenIimjgPL01IKyGWLYnGSkhHZuwRB9/mmswW
	lfS7Qjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0Cc-0000000DDMq-2ttl;
	Thu, 10 Jul 2025 22:57:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZK-0000000CtBD-1bl5;
	Thu, 10 Jul 2025 20:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=; b=QDC9NCIBkIc31h07B/rf3CmiKa
	s0l5iJquv8fZmjNkOzVgtzsu4mMMJJcSJ+I3WHcZqi2Mn0znID8j9lIcESdBy6q8R573wWAAxkOFV
	/17S64/2XLAVFmQ0pTliLDyi65rANCg+q0Jwajdry9bgLkZKL0YsqR6t8N5ABClOJ+sNQ8XvXqBbF
	NOTssB9dsUHkJMvjPxcbU8EYBLo8ZV20ikhcGJlEEfRGBmfwbnLPtT0PQD8Umu1R83ob+34+PZ72Q
	VtnmVR+ulcwGGq5F1/+BsWud1SaXy0wI8Uuf7CsFQSR7eh9rR8wEi8Mb/rrfaX9QrASyd3sERkmDf
	1iMEHcTg==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZH-000000098zU-10z7;
	Thu, 10 Jul 2025 20:08:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-73972a54919so1264953b3a.3;
        Thu, 10 Jul 2025 13:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752178109; x=1752782909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=;
        b=E80FT+uOLmvFPO83p3XfWmMhl+tBU4afpeVMpvXKq+AB1xgclQjjDwOCQbXCBKFMl/
         Ykx2ONiT9qQGLerQze10czFMhHtAGAEezmY1xxfju25BZfxMDoJ7EWZvD+qBpCn9Vlx0
         RJhcxzLJRDReZWcAOp+XgHZFfDYX6MNIUjbfKzA394VWRgUdv9ys2x7EOU2U+uyiqAgY
         tNleoJs7VpvqlhDwFk9Aq3YZH7/sBL1lBkYGnEYTD7yj8Q9NeTujPc5i7Mw4KRxMss9/
         T9JpIjWUXzMpvbEYjrVHNDavlYLthMsRlJmhfpeWPw8mn126EiUCvYs+3DULQQCzLj13
         B0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752178109; x=1752782909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=;
        b=MrzDFD77srXPWSW7dh9E+U7zfXE6NOCiPHmCwQd3YlnUzqOsOpPt2keTOfDpd/0R+J
         xf3MQZTYe31TvTg0BGglhIih5GLKA1YiXXJIaqFyYG+cIuTAJKRKafBuOoPRZjNTw1qe
         loHb4Gd2T6kC27NBr9dbjKAAO3yjzuULsJBWoyqebvIAxLuQPH4FdumxiiZb1gWDAs5k
         ilieLCb4CwKWHhoylmbUNKrcevs0+EymKOiMNyUC7hrJq6Qg7426+w2cT39jqiiBUTHM
         QLve+Lig+KQcwbwGTvAbp34YgyQaHAWLjZtUvH1/80ZxM0wBQpDE21d3WM7Wa1knyuRv
         9bbw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9sGdLWl8w5GHBvcp8nwlFfyWvhnM0QDIHOVrLGkz+w/8ofjIntTle3iLkxLnxsL/PA2O6DGlWPFmef5GRz3a@lists.infradead.org, AJvYcCX3pLKonIqCcze1vF0Hnjm5LGMQgDrXg1HEprkMr0VTpbtju187sJuajYe04a7PoEhH6wYsZVQ/RyLVyNRjTB8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLo7AsLF2dmoE0mR4cVyGWBDwCY4+k4yTDg//T10haoYjToIgE
	l2h/mlu5gAQXQXBVdztSo0nMvQIHK1usRA/gU81oz+UTCS9THRsd7Geg
X-Gm-Gg: ASbGncvSZQUnNNzAEzicVNi3VWJS9FhRtNwoaQ1MF/SXGrJXbpgd6eoSUYx5xdOfJKN
	M81jPwwHrKXnMr4eNsbQr+Gf6cbcnZCXOrZCE2TxVK9DWWvNcXoAaejyN7h1tXniVGVGGLIQiNj
	e2T3ujRdPwL9AlAFn7MIAVONsOYzjv3icl7am3my8xGUmxPwGCg35aFG5bdfLcUUAKED3vMPvUI
	ztmXenFwfIRHbOjvkP/7FllzL9yfzlEonkZWc/ZRe9Ht6znVWU3LlX+rrmQk9Lh9+FSE3FVo3we
	gL6pX+6FKfoY9HO79gX0W6qLe761GZuLe8nXto+8vxE=
X-Google-Smtp-Source: AGHT+IHm7ifEhU9jh5kLvbxHJG79Iz/C3ci6HP/z09XwjnL/tPrUzMSYxMVlZlntdqoEtQlW6+B3PQ==
X-Received: by 2002:a05:6a00:a0c:b0:732:2923:b70f with SMTP id d2e1a72fcca58-74ee2557a68mr410283b3a.11.1752178109421;
        Thu, 10 Jul 2025 13:08:29 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b29asm2729453b3a.87.2025.07.10.13.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:08:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 wireless-next 6/7] MIPS: dts: ralink: mt7620a: add wifi
Date: Thu, 10 Jul 2025 13:08:19 -0700
Message-ID: <20250710200820.262295-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710200820.262295-1-rosenp@gmail.com>
References: <20250710200820.262295-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210831_458563_E4AE7948 
X-CRM114-Status: UNSURE (   9.18  )
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

MT7620A devices all contain a wifi device as part of the SOC. Add it
here to get it working.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7620a.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7620a.dtsi b/arch/mips/boot/dts/ralink/mt7620a.dtsi
index d66045948a83..460164bdd430 100644
--- a/arch/mips/boot/dts/ralink/mt7620a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7620a.dtsi
@@ -62,4 +62,14 @@ uartlite@c00 {
 			reg-shift = <2>;
 		};
 	};
+
+	wmac: wifi@10180000 {
+		compatible = "ralink,rt2880-wifi";
+		reg = <0x10180000 0x40000>;
+
+		clocks = <&sysc 16>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <6>;
+	};
 };
-- 
2.50.0


