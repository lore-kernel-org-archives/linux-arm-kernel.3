Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3F7CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=; b=V7W5n5bMJmEaoyAM8TnxxbXd0K
	kqG1itJUHY+op8SNUvdb80ICDe59UkCCn+SHCsFoodEpTYSNp5WJ22y06vpYklmdOOgFbopYrjWp6
	wVVmuewk1DTD6XGS7wqwfDtpFzTblcDTwIg4OM1zzRs6VfE6eaAq6HQpdjxV7WoC5GCoauHipCgQ2
	pOqmtPVCSJqIbQl2v8eD+YhuEY+9sRzpz8lgU10cvskzToNEiorG87zUN+v6aOqqDuk0zktQhl2bF
	9yy9SJr00LdIb9ye2ivsA65ZwkGjeKJn7TLEVLo6M0FZL9R4hrsRmxB55FBoJ2e3aQqy9cmcWtYDR
	+f9WSZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasQ-00000003jmd-32ck;
	Mon, 08 Jun 2026 14:22:54 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasO-00000003jgK-0lms
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bf0170c80f7so719748666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928570; x=1781533370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=C9VGjY521z+tV5sQTcaORCaNDcPtXLFz5QWOFuZOMpOOMMH7VOHj76PgTkWoMxQCaj
         KW51KeyOECEArCLPA9L99cW1wzjvMDW/cFslkjQJBY6Ifw1G7Cx/B06UQknqRVmnED0F
         MCQMlkvFKE21MMFRy7HuSi02uTCN3Agxe1SbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928570; x=1781533370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=o+j3ABSNNqJUrriNiFmFK2TsNS0nUT0T6dgqThlYVMMcRxgr5tuWpgEBq1x7k8NiOE
         2s4dxzQxrxwdxt+c62GfMVPkJvqQH+zcHwTnwOnYtnuyAxUAbotkZUaiqqP2bm2fdYOf
         MANdz1gw0lokwGKJrCfXo6obM/NuFF/hX6A7JBsu7S3fmyFyv40hufZWqztVmngHXxTr
         zis1JhG9jPTgPb/OUiQ5rcBp0QhNQZlrrGdv8j24jRtOmm0yvpxbjWaBkOArk9Nd6Wo2
         vL7PLBmEjfw7NAXAsbA0MZd6F1mAcrmY0Woq35XumX47RfujTs+TT8jErASyWMPW0YAg
         420w==
X-Forwarded-Encrypted: i=1; AFNElJ/k+O0N+5CbGLOTJZMwKZIzuJanJfyYqie9P8P1i0YIR0S7GJa9VR8aSH6Knfskqx97o+adhrjPNAlJjpcnxeRp@lists.infradead.org
X-Gm-Message-State: AOJu0YymbCtxoIXJQcVZzZfDWRh8KkFgxW9Xlfcar3f/+BkNX0LM47yz
	/yO/KGrCDmoRJiuL+CWPmj2AIum/1zv0A9pRkoM6u5qvT8aJVvFrESaAMaKbk1vv52w=
X-Gm-Gg: Acq92OFgiuJgrrMuekiHbJo1opNy+Nh/CemEje2fVbQLGakc83dl17S9uAQf3uJ0I69
	5dtt47w2UuOWXHlDo2vCa6exjbhPlgngd1KN2xx8Ma/fqQHbhkn0upqn56AbCGJ6n61KqbumFcu
	gZ5rvgdzfM+gaouEJvrSF+ClUh4YRBje7dRHXVC3xYrcyAJ/L7T1h25XSWTGrfRujrIoKL8lSZG
	sdDM3NwmnHeBgKkk/Aod7p8+Pd46Cv/9MosXq123XSrLllXfHgOry6/Ex1ZGCc1ta41FjJ9PbXn
	+eVjDpLxK5nmqCwcFq5olqZRlYe4i3u3Z9Cxsa3BD1QI/3wx4eVKj67VZHctCToHN7P4T9bmeKj
	orPOUa92bbM9jYRjImiW5x7cvmzSJ5cQ93UNZDJt9nEpKbbzrN9SBNy9x6X8RRufL1kuPmdLGfN
	DFKoiDTp9z2Lenb3/IBSBl7OiYSgDw0yNtptAFsNVCNHhDg3NsqBwpqm20JPICajiAt5OEt8whL
	46e082SE7mM7BWvVVTLxsE9UMkHTvMITPu2DFDfpWY8lX8LikzwIqjlK8/gxygk8if+Xw==
X-Received: by 2002:a17:906:6a01:b0:bdb:6077:a168 with SMTP id a640c23a62f3a-bf372151453mr726500766b.26.1780928570303;
        Mon, 08 Jun 2026 07:22:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:30 +0200
Message-ID: <20260608142221.952245-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072252_268517_6771D6D4 
X-CRM114-Status: GOOD (  10.26  )
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

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4e570e2e5157..d515e44832d7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -766,6 +766,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, AF6)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('B', 10, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
-- 
2.43.0


