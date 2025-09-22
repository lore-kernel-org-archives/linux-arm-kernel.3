Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EADCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=; b=jV7jEpnKFyZAW0MsK5ZGvN5Frc
	2v9RbhZpXqWK1ciOvmmI/qeRMtvY/ycRde4sPykUxcvjSLy4Y1vQdobOcQDg4z/vWwa0jF99tK/6J
	rVqu0WrYIurS4PfpXGxxWmbZyJ4aDlqM+/sMC7++QLvxZ6QnpUVoc9hR7ZahO8wB1UeaMeSnWZW2p
	RU8tDo2dkfHlJgN6GEYOyfVSp5OC4f1Po0f+rEwsgLgI54Zl+6ZH0CdJFpB8F1EW7e+khrrXYfdo4
	KllXROBmcuH0/Y1WtecR0+DgFGg+5qSAHif/kmBCRcxAYdrcn0Fn/lsLcY2tpsJ55uWwVH6J7VbGH
	wGQza+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRW-00000009z52-0HP8;
	Mon, 22 Sep 2025 10:06:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRF-00000009yr9-3h3a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:06:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so1492885f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535588; x=1759140388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
        b=fkpxyxQNjMcxqctoGVqq9uTqXhSNj17/FwgGWOOg57oAB+QsWtGTdn8yBhSkm6+fne
         ZsRqtrH0LRCLpTv9dNngjgsNxat+bIXHDLiz/YgjpWddsUqGG33mFVgqg1vSjcVaNnkp
         iFT0iWiJ4IQjjAaTPsxPcZ02TY3ha2OdXekNC2xQDApmFzPN3NCefZOK/Bn0sIM0c0O+
         q+FWKDpLTC3ILmq1DAWTVEpx4dv1qcwbo2+fN+x1yRSEdHjkFMm9Gmn0qUVZQZstMK+e
         RoXgSEmVvHPC3wHL4xPijqBKhAeY8H3gqfW+gcpAyzMF9dt2wJpHZb5xWDzNi8oBEiJi
         PKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535588; x=1759140388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
        b=q4DF7a/wORu+MJExw9lDd54Gazg0f0YkNR0nMOrQ0JoPlusKuoNGl93kRPYkM7SKJB
         dl30IaEsc/HZ9jgUpK7ANj74Aq1R300IFd10jIfPDu/RoMTECXNtQbb5EYYBkS768PIs
         77gkho38swG9uIjGWv40xSLgEwufPPBsj2dLjQhy4mrwewg7clYc2lDlWgdthxQs5qSV
         1xjNDmIMUxH6o3TPELiKocd/vGDUuparXfie2P4+hn6u9qaIK8k73JPDknWapUSW5cJK
         Tfn3KilgkWhBDyGqANkxV7r74s82d1hqxKWdRdO2GLlkyb2D4wZkYOTWxxVEkjNte8VG
         l0fg==
X-Forwarded-Encrypted: i=1; AJvYcCVIoJiNqt6QOVusTdv5yA039fZ/bbFDGqlbHBJzW4bltmqDQTkbra0zmH8W54tVshKxnhhZrEoZibQqludu5rSr@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnc6A2bR3c20BAitbQiRE337GNUcJNN2kRG3k17rDk2Uq8xpjF
	mq98Ln95HdJXuL5uL5AmS+R+xa1YUzKmN45Y5tY2q2NWf8nUvdn+p6kM
X-Gm-Gg: ASbGncv59K/pBgr5FEskfBqHBx7asXOFZG+RC5YS1msiiAwHlnQ0D4YrwehhnCjA/oF
	MGMmoF0eODSR2HzJvFGdtQpDyTK1nF2c08+cxkY1+zPHOHPqP96EfreJmRvoXxCcI/oEZFy/WfV
	efeu/VU8y3hYeFm36E7CLsPYgXNQq6iuOOf3yxPTyIJmhxPEWWsqSJgWgpgS54iBl8EyAwLpa0Q
	hvx5vfsSY6UDUT2X+l2deqwYv6ce7e6SDBywXnNlBV9fM/yP26G+Iqyg4+M+n+9o58I40urJw73
	XQcldJuWRXWBbTM0aZlkfglcemp4GcfoHJ7O05HKoSvgjzn+CvtifiWUONRO7MRIMR5nD7P++RH
	v3QKdAGzJpfr/wq8zxjqESVRBYqSIKrYMayndApbMEQum8hjzMbCKElEiMAB2GzENgCPsIYIEf/
	LwwF11kpftpOc2bWUN
X-Google-Smtp-Source: AGHT+IFsCK67zkg+eo0L7Dzd5uJH0Dlu0IC2iqPXJB3tB0I3Vgc0sQFVDvDEMKtjJDMRNUKipGcypw==
X-Received: by 2002:a05:6000:3113:b0:3f6:9c5a:e1ff with SMTP id ffacd0b85a97d-3f69c5ae5c9mr7470157f8f.39.1758535587944;
        Mon, 22 Sep 2025 03:06:27 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-401d7fa1729sm1345904f8f.5.2025.09.22.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:06:27 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:19 +0200
Subject: [PATCH v7 6/7] arm64: dts: st: add LPDDR channel to stm32mp257f-dk
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-ddr-bindings-v7-6-b3dd20e54db6@gmail.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030629_943518_6CD74244 
X-CRM114-Status: UNSURE (   9.92  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add 32bits LPDDR4 channel to the stm32mp257f-dk board.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index a278a1e3ce03..45ffa358c800 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -54,6 +54,13 @@ led-blue {
 		};
 	};
 
+	lpddr_channel: sdram-channel-0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "jedec,lpddr4-channel";
+		io-width = <32>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;

-- 
2.43.0


