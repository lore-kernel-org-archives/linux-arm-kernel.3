Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1279EC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=; b=ksGo7dXIDr34ULi/VZG03nSb1T
	FIoCMuroKV4mD8/7O4+I7+aWnCEAb3Ppx3eGF9FvYIG5iBQEtim1y7McImDbII8PZBOm36TiKcVDB
	kLC4Xwx+SjzTRvH1bQii+vqqnN0H1xkf+oaLlGTYeVrnoUcDVgSaqeJyRPhszsKZdXHxK/o5vw/FF
	3ioe55ZdQFYQ+vu6iBvYAEWfD2aHpt0cKxbaP9ZPSIj/8ScQO1eF07kgC1a8iQrIvTLPveaz0g5/f
	VOwztk4e6fj9iMWPNiUrcsVcAG7LtndufYu/kP4mXoPGYlhQYsnCjhlZl4kpSoumYp3hLSAYKE3Q4
	GQs/WFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJx-0000000GXIX-2pKP;
	Mon, 03 Aug 2026 07:42:49 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJu-0000000GXGn-4BJh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:42:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2991945f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742965; x=1786347765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=m+DAHBTNB96XGriuId1cIc/GdUF3UOXE5i3ajvdacQ0leAc8diRH5Il+ICpyLBXgE6
         HmHti9i5IM1738C1U22QbnqxdvsmXz+7dZ8dAbphg1l+eD0WAjN1+1fkLEswkUUEKBch
         DPVPTxrjFY3NKUDERyU6ppNhMX/obK+FjmUIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742965; x=1786347765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=qN7IXyI1jJEkCg9PEdYw3KHlNLr9MO7iYZd3nkMr3XX4riIgK6GC41q6d4ieUn3Guk
         oaCLTd0mpvJVihDjxgEy8/Ek5pzxi3i4hEmNAya7uHH6s6kOfXMx+UxRtDLrcjKUjk8w
         dBPgyGb3Nov1JKeSO5UISfbw+bh59X0anbthML5NtGT33aB7r+KbLSs718pH8jbEhJD7
         TIiI7g3KgRyIulxxIXbsrPnXjJcwIiC5vHnt8j9zJSN1NxsaIw3jVvqii9sFd1SOuT/r
         Wum0JeGocvBlz9geiPTjl96nyPEnxF6atfB/lSGGvBwl4mt4ntsOYRTVdh+P11cGUkQY
         tiOg==
X-Forwarded-Encrypted: i=1; AHgh+RqkiFoD4tEswhlOSesXATfQgHeoFadXUua+BunwbDKB4RjYnOMQKeFxikBt1iJXe0HRUFM58u3/I0yIL22ucXZR@lists.infradead.org
X-Gm-Message-State: AOJu0YzH2F1CPVmtz1TTQ9l+ysRP0508EhRrDUq5qbKv8mbBgSD3szWU
	uWs/+EMv3taq/mk76Hw9F7pdHJfyrXQcKcryEhq2d70B+zq20FB4StwSld9UKyM9gDX/4siJ28h
	X1hfx
X-Gm-Gg: AR+sD10hjD2OUtGEzIOe94NrMHGf2lf7VzTWAN4CiQeepYsAtdr3ODP20Oxbv8eus7M
	/p1svRZACP/VKTme53yviO5A75VPnKbnMZROOJ1tqniNjy5d27oqtfkBkZsqPB4Hqp9SsR+ba64
	6+XacZCBAWUTbVDvYhRBSBmst9PY6Eu56Kzri+oSsgb90lRLHwqFDgpqDUeczLFpVv12h6rzW9z
	CbH4i3TPmaNK2hxGhzA7/+ySY4RjCRIur87LEzch5QJAdsoSjiyC8QrKdOxbsOTQg4dgpSax0Ta
	pcuMB+U5frzf6NO3UhRQPAy5dwnMuEOWLfYg15f4UxNNMgJ9Erl9SYrRf6nopcIDXPgjoFJ8EvI
	484aJ2+jROhNyq+XWZna+dYDnRnASc5BjOsUGdNw/ZH2A4UK5JpVHtXoMPY8edjkwm0YoJ/C77L
	dYqpNi5RV7HZuk7Xg5qpyxNNsLAmtSWcnbrjVA8zrJErpn71kbr5lpuniRD+3ryGn1iSQXpUuCq
	aJNA4kQ6sKqxFdPNECDE82pgHN4oABpdxCKnTRR7vklBsEMgtMA1K0w3cBM7kcxocq2NcUDtd5W
	STrmZx/BIZNaSYU+WkQbLTmRtTflVDDZyAMPICn41drmDgVDBlD2Noa6Edxckrg7
X-Received: by 2002:a05:6000:188f:b0:47f:c62e:9cca with SMTP id ffacd0b85a97d-47fd9cfd167mr21692191f8f.22.1785742965078;
        Mon, 03 Aug 2026 00:42:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:44 -0700 (PDT)
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
Subject: [RESEND PATCH v7 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Mon,  3 Aug 2026 09:25:58 +0200
Message-ID: <20260803074224.3821911-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004247_042015_B730C83A 
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

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..ae36d703532c 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0


