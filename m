Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8262FC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3M3L8HiZ7559N6K6thnkBLv9YHllIdFzaUOaUD8drU=; b=jNM+ENVSzYe/yf3iIEvX9Nqf3L
	TqjSsfPBw01P5Cvv1xX7UplA6KkmFDU67UJIiywbtEqahQsiQtStBwfnSk1/lCi41qsmDExqFGmhk
	fVesUbedKhtm+K3RNCZkyHb1Ic714xxlih6iN3tVpuyafKU5t2b+zfIEqvyrSWKxbkVGVSwmVWpV+
	MYHCgJ3t7tY7f1GlZb7ZUFglPub3YiTmRVMYibqVo8rDspLcGPvzepzoMlht9li9yn7BIeUc2sJC7
	cw7/SG+e6jfXyUtLhUd2CUHuVuc84WLxIFgJWv3zLRTB2/NVj8gdIPxEETEl4cq8orLst1a12thxj
	Drs7gETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKp6-00000003XW5-1XQ3;
	Tue, 22 Jul 2025 21:46:56 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKXr-00000003VqE-3DXf;
	Tue, 22 Jul 2025 21:29:08 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-313154270bbso5907324a91.2;
        Tue, 22 Jul 2025 14:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753219747; x=1753824547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3M3L8HiZ7559N6K6thnkBLv9YHllIdFzaUOaUD8drU=;
        b=FDGxtC9RL60+jRO0Gma2TpUI2q2fJ06aXKmd7v1UUp7WNVGcAkz8u21VohNCeW96uC
         mhuOUOSoD+LcIzwFkS3cJ7SOnlFl2D5H/yi9pEXvMMCVU8xwGMVSzweXgu/ZrmaEit24
         4ShLYBB9B270SdEqSwY9xbMzc9/Zk8KUisDbKsFhiF9r7lDhI5iqcNO6L1I3bUVqbp9y
         ko8xAoDxcQlLmv2QClaLGKpPSpQA7qKP4UvlyIrblPTpQscp8yZy4CipFUxpaDmellqU
         pYX3YOeVLu/ASEgyXjD5a0ZB4r2J0eggLLr/7Ck6gOrCbXdnD9FOCsGCFA3iDotJWcVh
         58Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219747; x=1753824547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3M3L8HiZ7559N6K6thnkBLv9YHllIdFzaUOaUD8drU=;
        b=LZ+dTGBbvs8KBJslUY6+fbf3Ik+KR6vKWT8gUyo6DvkfFgMMxH2/8CFZrXBJRNwUBV
         mfaFGkEDN7TbJB8RZwEXljIxQpX5J3P1pkhRm5Hj88zErIyGGSipmsOXzOn/ykHbH/cb
         x5XcgmoZ9s89Ey9O7mYBVOU1DlElvH0PYmGa8gsvKM9GnkQs0jKGnk4Q7bp/VEf7Zjcn
         O+0oc3cYm6FsZmD7W1HVJW482zkQGMpEBidOq1zkefcYPlEzuQOO0MChZ0SwOWkoVV59
         YQ6gKIFxsLnzK0xhxJK4jilehssgcHBSSXSlSKAKTfGiVRtT7Wul7GLSUFdnvrlMS4LE
         ICCg==
X-Forwarded-Encrypted: i=1; AJvYcCXZlBvaTD6m8nrxwBFJQ5cTsIcGIhOZgYIhC0bUhOjHQfFrTnwhh4j2ZkE44tVhYsU3RIieZh8WKhlFfEbZ4N2o@lists.infradead.org, AJvYcCXbbFoSAPs4AMhp0TYaF76MgZHqQWcxTvZyhUMgR6zF4x74L48Pxfx5aY7iMKJh1xXdhNL5Xevl+5w9tGGgN/w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQMq5rR5JklNphz3TDLSAsF/ioB18s2gAmGvFyMDBPB/Zmj9yO
	RsbBUEbUidgYnPJwTZm8q3K+3sTrF9u5xcbI6Gu2fTDtx6cTyOl+YvHj
X-Gm-Gg: ASbGncvlwuHk9sZSsPdFMJ8nEsEJWFFSM41n1IaTLCeXDj/OgrfbqxRQHiCkRVGYFYg
	HQRhgwTP/AX0qvIj9w3q32rPKiucbipkQ4f1S5ryATmZr/cOh5F90jVWXSptGjALX8PUwdnRXZa
	N3u6p54wu1SiwiAmDX9+tLtE70jz7gJUoC0/miwetranhuxpXOdMWENulQjXp+A8SY5lYhhNWyh
	diYRQ1EnMVBo00HuTpT6xSzq+llGw1NtiH/xGsXL+0b3GoicV6v7mx/OGqGnoBtWT87oDTWmpUx
	34M/hvdre4w/heJJX1OT4sou5/wX6fR2XCsCw478FxyZx0mz2tDPVPypNLXmFDvk1jpgKqLp239
	+IHQ=
X-Google-Smtp-Source: AGHT+IGL5mabbxfP9KzqcErUAbDJ1RsEkxJMqcMu68mReCYzySiR8ftWeMGB8GD4+qYKxlQxQFBUfA==
X-Received: by 2002:a17:90b:3e89:b0:31c:c085:fde6 with SMTP id 98e67ed59e1d1-31e5060696bmr1332850a91.0.1753219747234;
        Tue, 22 Jul 2025 14:29:07 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519ce384sm94942a91.2.2025.07.22.14.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 14:29:06 -0700 (PDT)
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
Subject: [PATCHv5 wireless-next 6/7] MIPS: dts: ralink: mt7620a: add wifi
Date: Tue, 22 Jul 2025 14:28:55 -0700
Message-ID: <20250722212856.11343-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250722212856.11343-1-rosenp@gmail.com>
References: <20250722212856.11343-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_142907_803174_49CDC454 
X-CRM114-Status: UNSURE (   9.15  )
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
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
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


