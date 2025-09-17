Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8F2CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0s17kkTaZCcWVE6nRJp54qyDKjcfVsqKmHrTUTerXVQ=; b=C4FIU34e2fouAmPnCGBnC72lt1
	wZ/KiCS6G3aXx8iRt3tpnFLIXz15jC6uQyoQ4sliZhgScM+9QE9/KGqVcAC+rUjCPMthijQ7U2zaM
	hT1+7GemPulu6OpJkSIKc4gSY7rt3UoKJ/V4yQ9hR2HQPNBrjVgYgmg5TSQ1XnJgrpP8ccwzXnwwz
	6dPL7rcOjLlxNf8aInqsJaybexyTehB7+NZzk4MHewD09jSmoAiSK59A+1bclzkN29yB27MLImmk+
	EpKSrlsfmhu+4l8qatBnPb5lJTxT6tM8fR6IlRo2QNW+Vlivl/kAnMZapKLCCz/UADlVqVzWzlM8E
	05E2Jzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytJx-0000000CJIR-1NNV;
	Wed, 17 Sep 2025 14:39:45 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytJu-0000000CJGg-2svV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:39:43 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso11417105a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119981; x=1758724781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0s17kkTaZCcWVE6nRJp54qyDKjcfVsqKmHrTUTerXVQ=;
        b=SgWdERw+XR5c6gH3briMxNNoB/5uPPv71GlTBND9uZjsWUehK6/8wSD+KaauWlzw4P
         J/O0lns61B5ue2/LmdkLNRoiMAgWMfjKSAMoDpEPAqWgkbai5DBqOZ9xWG/T+0pzgPP+
         4ge8JL00a2L01Us66MyvQ4/cnr7EDgh4UbGQ0KHeSDj9OK5rOSYfHYDCnj3YS/nrrbSR
         Gm03BSwEQeNOTHPiAEXdLx1as60HAh1TBpS3O4lwM5MGJpjLjnsEkhnhcfmmL6QcALtb
         5Wqa8rdTW+4k/UXzxLqk/Ynfh63zYyKuSGgs9DoHnr5IaPfjh8rXGeMbt2nabbvln62l
         NZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119981; x=1758724781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0s17kkTaZCcWVE6nRJp54qyDKjcfVsqKmHrTUTerXVQ=;
        b=SIfsDd3a0XNYbg5vsGMFYUnOo34MiFOcYsdkrMia0dgbiO8SFTFl5VwB/qzuvDnBlq
         aJ8ccdW1WeM8FcaeiHkWPAeHCJgyFN4sPOBQGoInZAIaA1WOqMGGTSsI/b33JcO0Mmy8
         FAo8L/SfTHxgeyU7tWdd8vqKxAoV68gKAIUcuxNQI27+8gZ4pPsfzl3H58ziOsbuwexe
         KkmsEe+qT+lKpMhsSpKO3zTj1en/BCvw0ol6gO5e8ryLzMHjzoLCHwnSPKigyIR/aJi+
         Hpip+MkLvRrtcECm+4dYQjqsx48KgRodqOM//SVtCvAO9jO7TDOV+w2qU339D58nLszT
         D6xA==
X-Forwarded-Encrypted: i=1; AJvYcCUDS9Cx9Mw/bfZonzTxMkCb7SSom6pTBWi8xWqEXrFhyfCQ2YlimEOQJVcKQ5Yk7b2H/J3hx6GQTXqesobQOwuY@lists.infradead.org
X-Gm-Message-State: AOJu0YzkMF13XuDKWXQWiYQ2uS96XlAITyZMtvWy7lRoBr/fxOtfHN4w
	2DpTeez0tRYD/JjpK9Vr/8NEUhdhwTucPc/2iaVBYSR5j0XZhoBEz+VsL81CbzGPg2g=
X-Gm-Gg: ASbGnct3bF9Ov/0KT5YU199PQC+SfBvg/1xOo5qIcFN4KC/6ppcmyUAjDpqmTWzXB3q
	DfgGYz1u7Y1oon81cxgV9rVFEb+KYGXt4CfgRee7X+zAvSt8KGyIoZ4i+KmmzEa/9tRgPDyf9lo
	U8gH0NqrUMY3xSrHsSi3gfXFJOVYG1SC06yIQmZw8caexJqhkyOR+0oWCKIYqCTCEky+HtSkRka
	om1PFN9Tq4vYtwuLSyzAFca2DdLe618Juqa0bKFZKn2ikGWN0GSgH4w1K49o7kz/b9u/cvDPCqA
	fYoJwiEAUDzdpQSH7z4ctg7Pehqe8mabStEbNQhTjROK7wJftQFh5rln4Htd21mJ6QJAnozo1QY
	+cYB6tIixxVvDIv2t2CSLL9KJLAJGdN1hWBERf+2Ufd7oV6M68P72oSPM2BExRuWmWJax9fB5mG
	J9iPoErLJVUTrC
X-Google-Smtp-Source: AGHT+IFXXbiZNTejLfG2Ic/gjctCmfZhP6Kg2iU0trw8lOnTpDVinvHQd4P0uv0W+EXh929oDvH+pQ==
X-Received: by 2002:a05:6402:42ca:b0:62f:4dbd:9b6 with SMTP id 4fb4d7f45d1cf-62f83a3c5e6mr2581137a12.14.1758119980663;
        Wed, 17 Sep 2025 07:39:40 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f317bf9f0sm7112464a12.49.2025.09.17.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:39:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Sep 2025 15:39:32 +0100
Subject: [PATCH RESEND v5 1/2] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-s2mpg10-v5-1-9f9c9c4a44d9@linaro.org>
References: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
In-Reply-To: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_073942_740550_064AE9A0 
X-CRM114-Status: UNSURE (   9.45  )
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.51.0.384.g4c02a37b29-goog


