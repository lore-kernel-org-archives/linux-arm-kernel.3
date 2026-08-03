Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC1DC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=; b=v+ug5hpZLfvVIhhsxaOJsIIsqf
	7EmUncIOmmmEkK479monHPCHuj5l46FJQzp+o0iBwcXODOJAppZQRHrV8JViMCxoueb5MAyN1N4r1
	butkCN4IOUUnIOpWF0/CQ9DshxRK9ooHaUHQ7JkW9yMDW5wJ2X10aC3yer936csQaFySNh1BUL4ao
	3oNweT8MztwdSMDABDPZshiTnv+0CRTmgUfgYIBR5rQ3hNCyIh3CDInuGWtUFYtGvdSir/hrtRXWZ
	IuLOYvscbgTnpTYm1ezeCdbJuHnJueyvZUa5APK0v736oz9fRZVBEswvr63BGo6W4RPXQfppyYfFZ
	+BYmEqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJn-0000000GXEs-1uH6;
	Mon, 03 Aug 2026 07:42:39 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJk-0000000GXDY-1pP8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:42:37 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso2118301f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742954; x=1786347754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=pRmqlK1cZ4gTeinDQNcFZleHibT8svwb2X5AYKgWIpNVIEpeweiW2BWk8/UQ9v0KrZ
         DA3U9UiULACJOWOk0kgnT6Juajeuz+Ts0AAgjUNo9IrVBeKcJT4hHghZlKiZ83t8lhIy
         fZkjpBQNQEKJioRSYBBirqUY6iWT8zr24TYow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742954; x=1786347754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=Jqc94QXlojspbkPxQSptqKgiOyPmFWkCmgw07TK0MaIBAEVNtp0dQjZfZCGXNjrFnD
         OttVkZchb/ry8chcMVGeuGtW20zXoNR/EBiTrX+235gsege1m4ou/P5FIHpQNvwseDnh
         CZEf/ItsNnFFU9wdg7NO0GJ4YPDmewbc1d8kYMQKShsY1uVRC4V2kRuST9jz2uNWKHyu
         2vZOBZiKkcnUCvK0G1PDJ6+AjIyjxoP26dPhMlwni6ZZWpVMD+9ERzaS/85H6yjQOjfd
         zce9inR2FIQ6LWurZ7TkWacYOh6W65Z4Anep4lG09cIJcPYu6iPrmMOhjO5fzAOTvPft
         0wbA==
X-Forwarded-Encrypted: i=1; AHgh+RqalrYcWn2Nd7q8XORkNC/nm3gkGZBFMR8WD9fH2GzC6vTCG5ix9hu9I1wdKeptrDHzSn5WgIDiculK/Q7ZLODV@lists.infradead.org
X-Gm-Message-State: AOJu0YwDq/U31/AZEJjvzYnyEZRJKLSiLHuobnvK5ffUOmP6J1Xxr4z1
	NltIdNd+y1n9t2CTpd6aObAheRgseDiuZ6gDDxhz/LVZ+/VZVq6M2asY0VzO6FaoVmI=
X-Gm-Gg: AR+sD12YEtfCzpmPUExE44jafzFCxysAIbCygGw2iUS89xSv32OcjCTDcpLZ+To8Px2
	dv1ntgh1Gwhv22s7wefTsSl7MfQLNvJvQ1YOS2B7uFu6nyjcqVRs5fwzLMxAwzqddChjRthhp5s
	F06wN/4f+yEihCrH3JCXVyv+5YtXfrkKYTJbYwjIaCNcJsiLlZLTZVuv7feGvyaXJxs6XPmsSnf
	YHdLi7Sv0dIPuGmpw601SsA4WuF6G7dcHkw56aR7OD7usEm0fdMyBjvkArm0fyiem2qzkOiWHVB
	3TxR0KVTUWhMYquNwyxsKkOZFTo4rwlh3guCgu0IXjU9SsSMpwaHctPUXmO/8IigBYu2ppTSykF
	iCV3bvj17dNrbuuNcrccQAwDLEFOvWSoraJDoD+vNu2p9uzEWALC2kir7Pel6hX4lWIXG280g2V
	WiZvcD+bFwJ2vmO1ZZiOEZZLmDnkwGc/qGWlNuIdA89ignq/1bRqrV56TNLVE2lbVy9eA2ilGRI
	v+MqyFFO8jyGTn4OOb6+te98q4nZjIlBG5K9PtcEk8QKSG34eQg+kuC6cusOLdUtogUrOdgXX9v
	Lu9UhD9/WXTN67VkJjgbfoLnHoetjViLQE6KHEmnyUSz6Ho+n4q3wIEumChd1zTRlc6n9CWMou2
	J
X-Received: by 2002:a05:6000:41c4:b0:47f:838c:4256 with SMTP id ffacd0b85a97d-47fda48c067mr21058883f8f.16.1785742954329;
        Mon, 03 Aug 2026 00:42:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [RESEND PATCH v7 02/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Mon,  3 Aug 2026 09:25:57 +0200
Message-ID: <20260803074224.3821911-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004236_501757_546780C9 
X-CRM114-Status: GOOD (  10.32  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
-- 
2.43.0


