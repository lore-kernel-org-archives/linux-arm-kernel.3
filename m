Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F3CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSLeprPe5FTHWRveLENPgw9n1qZNAvdFfzbO7p/6mz8=; b=gItp7Oa5f2LwfnFWnL+8WP9Ae8
	BEwIv2H9KPOGyKCjOSwIexHUDCwP+k9vh+MQ61u3XTFtKcxqhuZdY6NyGx/jSk1K4ogPLY2xZwbJe
	N8nklsJHuqB+hoVE/RW7t7iC6qFmYBm6j4L2Ne4gWpsR4wH2Hgk/zW3jkoVED7KdEYmXNu4Oy4y3A
	4xVsqed2TPAVENnevTVFMdL2iQ98VTlgra/elAFUO03+WDOSF4TwF8PG2z7Z0JCMyjELvZBgBrIC7
	qEPh8WoTYVjDSHejrw1NSZT1BN8ll1wPTkqM4BZl9AF0ImXaFMQsxCDVBUMInMLACyfYMInJS2JeL
	3wW6tQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdn9-00000007LxB-0qzS;
	Tue, 31 Dec 2024 15:04:19 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdkl-00000007Lgy-42PH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 15:01:53 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso2078914566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735657311; x=1736262111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSLeprPe5FTHWRveLENPgw9n1qZNAvdFfzbO7p/6mz8=;
        b=Gcd/kViX1qYntsGvpOIk9WgyrSzDUQd7+La/ia/k5ApKB2EvaUK5Kfq2Iz+fXsHBzV
         NBc629BPNPwyifKL0ZQE9bdGBZjkMQtB4Lxggski5I2ZR0smSq5e3BPDhoNs2QoyPpCR
         Luy6kdGKpXXqdmV7y8SRa1CkwCpXAAKW2fy1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735657311; x=1736262111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSLeprPe5FTHWRveLENPgw9n1qZNAvdFfzbO7p/6mz8=;
        b=TrMs/ymQH9cf7Ut2bWUXxsUlvkmw3n6OXdYtBA8lIBw97aSoOwDOQapmqBBYQB0R3R
         5VZftmwWJiRcGhSS1ectko5zcdoYHAxkf4FyIbZ0TkPAf5OKLTG63plTDeUCP0pN0s/y
         JMFoa77W6NrPCTXz7TJqA+rrvQJwfgxL2BKDxMYJjUfKMT7UzNoQNAg6LK56t+yJkYGi
         vuIb5RTVKaw2LnAN26rZDE0NZ7LhlkBAHuSL2RQj0QmI21DI6iRr3yysQ1JP+ca1dAzs
         bGFFL9dz8/IOirm2tAWa8Q8XzynXo0Z1ki1priMWrYSIpG3eotPhvks1CL3LyukVWUMa
         7CBg==
X-Forwarded-Encrypted: i=1; AJvYcCU2Se1CRwU2HM1nJMvzYR/ghrBBHaYHiq7doypB1DRpstSG8Ij2QKTOm3oDJorpS0oe08SNtud7GnQtKUI6sbk5@lists.infradead.org
X-Gm-Message-State: AOJu0YzcSimparmcOd1B1thEpLLi+Rf1s3p7sb7WMqx3gNf548GHBBbg
	9DCBUR3DlyMpy9QWqa55Mk2eFQSczj4gQe8Dc/G9s8woNHQwW0BZTOLgRNc8myE=
X-Gm-Gg: ASbGncuQwWGZEfYW+pAx8xmp4WE0YfdvRSAncD1ss1R795DVgbkCdcKUK3LmaPT4Oe0
	g+8RSu9TGl/JTgTj1h/x6oR8boI0VI+X68H3Vc8+XPt4S1p4TEB50odxA2CUlcBwTFTWEOBA52s
	9Prr/RyHjPqYhP9y5ryrgH7ASZ9sMrolhhmU6LYGOmrFAHRMUhKN14A6zowyTImT2wsHJRAmWm2
	+OJCYln7wXLoim+W6YOCs35GnWvlmaiL/D7jesiJ90joymc0IorBfy5nc09AFsxuUBUN+aepdh3
	nzasf4v2TfNsXykjoomQAA==
X-Google-Smtp-Source: AGHT+IGfEOn6eiAOcKUt+G4AdS/vhANNPsxMNquB07uGQCrXQb511fcC05DereMIXHKoyNQ8gZOavg==
X-Received: by 2002:a17:907:3f0a:b0:aa6:96c4:ad62 with SMTP id a640c23a62f3a-aac34217fddmr2955209066b.58.1735657310070;
        Tue, 31 Dec 2024 07:01:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89598csm1575905766b.56.2024.12.31.07.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:01:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/2] dt-bindings: clock: st,stm32mp1-rcc: complete the reference path
Date: Tue, 31 Dec 2024 16:01:41 +0100
Message-ID: <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_070152_000490_72F5D337 
X-CRM114-Status: GOOD (  12.53  )
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

All other paths referenced in the file follow a scheme starting from the
Linux root. The patch adjusts the single file that deviated from this
scheme, making it consistent with the others.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index ca75b1972470..e72f46e79b90 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -21,7 +21,7 @@ description: |
   =================
 
   All available clocks are defined as preprocessor macros in
-  dt-bindings/clock/stm32mp1-clks.h header and can be used in device
+  include/dt-bindings/clock/stm32mp1-clks.h header and can be used in device
   tree sources.
 
   Specifying softreset control of devices
-- 
2.43.0


