Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FDEC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oPJPluA2yPOrdl3Xx9YilnLVqcTIWj8u7ZCyZ4fkpT8=; b=NlgZX1hsQ11XnrSTMq75dnYtmy
	GN7lpVr5ulm8ZQM86ToxV9aIzjZ1AbgeFvlBGMNxkB0De/APQDteoM3dnPUABbB4q0hr7kdihdtJ7
	JaDz4K8OskpFzelssmBxy1jUUKcsp0mtqx921AznzAEGuds4q4EybHNp/I9oFpxQaXngI0WR4D/wF
	1PB16WjIWyoo1A0k7ODzX37ICxXUApi9ipsXvbOoiUOFultX2q1dd5P4Q5SmVY60JfGudkMC3H9Q0
	ZS4BqhhN0crXO41LoMhshr5qFc1jxbjwXZSHbCfBB4c6Cl7xZDR8BTmrDaynCqEVOVlt3cDRoFWXd
	Ik9BxoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcYt-0000000FkZI-0Xb4;
	Thu, 29 May 2025 12:40:43 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbcA-0000000Ff0T-1zJJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:40:03 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-742b614581dso727587b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748518801; x=1749123601; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oPJPluA2yPOrdl3Xx9YilnLVqcTIWj8u7ZCyZ4fkpT8=;
        b=CcE6rftVnDvuYKnmauvdkH53Bakv6IOiu57Fvx7qTNQxZUsEFMi4c6rlf6M3YlNFEp
         psQZFq6BQB8EaIhuF0DRXF6l+K7KhAcPUfF6BMO6MNW3EKLAxE+IjcpJd9CEUPgRpDmO
         2w/3547DxSrbzbIJLerFg7Di4PrHruA6kB0B49pdwoL18nd7BKVLmZYQJHh9TIgCnceV
         uh5pXmRkiyDtNct6wDHlHJwxVVeuhfTjLXBrnOeA9gAG1abLtFOxqzejd4CEDYAGQEvF
         wAuvoYGOX4f1qtY/gYMGcU6xuv8GeTvbRvcJuSCM7UOUpc18xUtGdi5BzULvUtUUlKtO
         96Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518801; x=1749123601;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPJPluA2yPOrdl3Xx9YilnLVqcTIWj8u7ZCyZ4fkpT8=;
        b=Rmwtdwhw2AyCsEGE3VTw0XwwFy2ZwNb0YE8xdxF8LKCXs0O7SXyGB/GLw3bOI/coPW
         GCGir1kdbULTnNEKYewFHP4ufbTEZqOCVhhPhWVbdg0xoV+KkqfNvhVusae/x3bPlh40
         mz/uZekcE0pp1h+yBayAJ17nuynr5+Tc6A8Jmy28sUcxyvzol2+OfqbmBjYydispe5yB
         7CVT69yfG4eIGkXf6Co1IvSSffddClzwFSSoxzupN3E/SOY8i7rOxtciWLJyu10grE8o
         14nutLb9atmaRO/iejTo/FjLShZT6ECkmXAYMUJQvYOy/0kZEQncdm9ACtkpOCJWxRjd
         C6cA==
X-Forwarded-Encrypted: i=1; AJvYcCVHtbwghU0gMSAJJBizuEnR1nxvNplUAX/IPmXNYCGXb4nWWnVj2jyPcdSuZ2BOuoni1mHFHhblZDzw0h4R29za@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8VyCnPE7UOvFwfDs3u0jj593MbtUZpvd4sIZ7fucD354VrP+l
	3bNrJeZqFpX4H5/tzvoZm2TCmqMwzOrtlkn6Y6dR73hlvfKVifXvRjvB
X-Gm-Gg: ASbGncvTmP4dn8q1FRvflYtmR/+zHZ00nb2UFKnxFLi0epvy9AxOiRsiQT4/Qy4v9D3
	L2hePIaO4vF5AzRwUAC1j4sMRlEDemH6D0+LlmTh+xO7rj6lyJJ6JML8r2XR6Wjfg/NhYGcBYAV
	0EOGjIhDoEw6bP51SjuNy55wljZNC/UoeGakKsOgAIm0GUXae9vGCL1rUwKpJuTzGHnt1ZO1h/9
	XyjTJClrtD0bcYWHKAz2Yx4sZmy/aytCvwU8Lw/JJGGG2kA5oqZefXeh3th/Tg8rOw8N4/WJC6C
	4iuReMNgBDl8WWlwMbhzyAE5DfBCE8LruAtHo+k7edNxyFoyNf5vS02lEEizIA==
X-Google-Smtp-Source: AGHT+IHsY236gxnL8+RzCtR1lcYX0dN2OvDWa0uStfgSddoIhXY7ZKQytFP78FPhrjNUwn+k17a6Hg==
X-Received: by 2002:a05:6a00:3cc1:b0:73e:235a:1fca with SMTP id d2e1a72fcca58-745fe06fccdmr31439493b3a.20.1748518800934;
        Thu, 29 May 2025 04:40:00 -0700 (PDT)
Received: from [127.0.1.1] ([2405:201:4042:d128:985:242f:9e00:e9db])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-747affafad4sm1137055b3a.116.2025.05.29.04.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:40:00 -0700 (PDT)
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
Date: Thu, 29 May 2025 17:09:38 +0530
Subject: [PATCH] arm: lanyang: fix lable->label typo for lanyang dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-lanyang-lable-fix-v1-1-8a2dcb48bda4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHlHOGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNL3ZzEvEqgOJBOyknVTcus0DVINTZLSjNJNklLsVQC6isoSgUKg82
 Mjq2tBQCSvO3XYwAAAA==
X-Change-ID: 20250529-lanyang-lable-fix-0e36bf4c4fd9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ankit Chauhan <ankitchauhan2065@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748518785; l=1318;
 i=ankitchauhan2065@gmail.com; s=20250528; h=from:subject:message-id;
 bh=Pwx2fvfVuST5jQFNBNpRxios2r+c4w/jFunmwqAE8/8=;
 b=d2y3CSmsLFYARBUorhoa9UHNPHRgs1SOt+vaL0kiIzgUeRyL7d4SFTeJhA36lr0Dj7eCeapP7
 DhfUivnA5bwDarDO1DXOIoyLCyQs2t1CB4NaFSBRPc1KtiwWpufV1Od
X-Developer-Key: i=ankitchauhan2065@gmail.com; a=ed25519;
 pk=6qbMcLtF/2YGH1xAgdxEABYLcPtWnesHOBiHaoZEZrA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_044002_523738_EFAF8D11 
X-CRM114-Status: GOOD (  11.69  )
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

Fix an obvious spelling error in the dts file for Lanyang BMC.
This was reported by bugzilla a few years ago but never got fixed.

Reported by: Jens Schleusener <Jens.Schleusener@fossies.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=205891

Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
index 370738572a55b2498fff31a4aabf336cc41e1eac..8b9d382241ff11329fcbaca5a469aebb11fd3460 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts
@@ -52,12 +52,12 @@ hdd_fault {
 			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
 		};
 		bmc_err {
-			lable = "BMC_fault";
+			label = "BMC_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
 		};
 
 		sys_err {
-			lable = "Sys_fault";
+			label = "Sys_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
 		};
 	};

---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250529-lanyang-lable-fix-0e36bf4c4fd9

Best regards,
-- 
Ankit Chauhan <ankitchauhan2065@gmail.com>


