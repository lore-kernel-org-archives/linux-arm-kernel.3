Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47005D65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJ2g7x+wr2VIeqIG6aJACDKejjD/eomNYXl10MONUeA=; b=TDD4z/K6JlMBp0NFDZU8jzDNGP
	yTyMxpX5CFJRglpk+yynKKmOadlbTr9dU74XwAzK01pvRInn/s/Yn7MEM5ATQuGEwzDfTpaZEODLN
	WUDtcPi6uwgPheEzDlbvY+S0OplHuQIO3B50FZl+3frcwnHJ8iFRcGEHOwPRuIRBvt/TpFFm5NDwW
	UxdJINB/tzGzMkhboE1ro1x1zEVo1g4wJyA6nP0DGGymO8wHRJ2Qg8aRoCwr24zaCsBfVpeYSd/Gl
	GWOyI5cmnomAo3saAxY2Mhaxy1JzoE4dODmU73GrJgnAtzJqjO/p1Fn9c4wvfQ0LfgVFajNmzSmqC
	bgsUKIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLT-000000075hF-1Yl5;
	Wed, 17 Dec 2025 16:25:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLJ-000000075We-1UhF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:25:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-29f0f875bc5so78959445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988737; x=1766593537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJ2g7x+wr2VIeqIG6aJACDKejjD/eomNYXl10MONUeA=;
        b=buxKF5AWDY3/r3wVBvVsfcWe1rw6Jv4W0o0K/ksbF1zEKxpa8fjvb4GQRcF28H4QFj
         vpNda0UV6braeqk5cqN14C1uuhKS3ocjq3/23kQnuz6Szer71o/RYglHKDSTkpdQMo2X
         5GbLcK4cx+Ucz00m61gSrlbiGn8NlOe/oh+GilDEYyTSzkRZrnR8Lde/rDX2EN3icOnS
         N4XTwIKu+4RVbL4ChzniBc9/8e3a8eJsHpBAV6EMk94lciVt+9ts87cTbR+LHR2Mc374
         aq/5MgJsA2V2zqtrFyFo8yjoHtERELpLYYEta7A9Or2mBcdSnsV2+PB1WWiLELxW+BpK
         agVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988737; x=1766593537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JJ2g7x+wr2VIeqIG6aJACDKejjD/eomNYXl10MONUeA=;
        b=ueDfZ8OjE9Dq8Tbwai5aGMQvIVG1UVpZZm6sHFFvLVaUYMZoKLdXSPzNWjys7pl/3K
         lhcqwTTiwG4+0DNQANIOC2dr812ABKT9A2li54iwYKo29Xc+JSC0Er3vl1EzHyEKRfgy
         tqFBJFrFTMwWOCHNtYcwVyyx8T698z5f0IWTB4mpz0rzE6JKy/R+3SOgzH174FaXNi5D
         RF3rPB8sU+qMXZQwZERexyEhJHhCJj80eOcFtUApNAPz74PVg3sJNd8/0CbVAAbSEuJh
         i+FLn5184l/T2BPDZpbRt9X6uDmcDfu8hgeiET7P73V71yaFmbizR7gP9NDQIvwGg5ZM
         2ruQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMBE9KecTbbYfrvlym2hox9J8tR/U0bTTxe2KSqPdhvkVisnSGBNOfsu4P302A0B9Xsm3N9CCarU5TixJleLr5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgsi46r8tUOX2RuchbvhLgS3glWJ4css87EoaEBwaGDd7SULjX
	JwIBkS0ayerL8CGyfawDTyxKjaPk8pTQVBgZwGjUoVccPTDrjCtCEn7v449h9Srr
X-Gm-Gg: AY/fxX5IGjGYgwXKqXA9CZOqDLWZek5a0zR+imbvrA10qJ6tOBzjRQeVHYUipNOHeZr
	lni+h//iJTVX6YUh2MQ62h/MeMsO5j232HuBeDXz6x8ufEudGruorWFaaxr5s7NS32pv5s4O6YO
	SjT0vik+yCLwiAIewI9+rvYI4yNs7oZOpAQeIT4gf9d9CjyuEbtzP7Lbjr1Idxti2HeTv9ZQsqp
	wuUP6JnB6E+eAiWTmcLqOQ/aTRN8BBsc+GJgtsLSC9hM2HyxxvJMuEQvgFdFESqoaY0BCGm31Ed
	JEiqB/ykRzGiv7BpfafmZOqvWqHIlo5frUqZqc0juWfGzWNarYB2SHCutjTYAhsZ8RZsee25KGh
	ySWVFkpfPrJ0OocHM+AZn1Hkjp5aP3xzEfvUFjGaycaBZ4HPUJtPH0b7ftnwuyzDHylFBl8wWiV
	qvZwGJlIm9Fd0GXq6FMz8rG5o=
X-Google-Smtp-Source: AGHT+IFkx8/ULLaclRWeXQnp3FknE4nFeL1wYOatsRa4nxVopZsYO4Ep0g1d9Nf6orRKrMY5yv7hDA==
X-Received: by 2002:a17:902:ef44:b0:2a0:a9f8:48f7 with SMTP id d9443c01a7336-2a0a9f849f9mr145464645ad.55.1765988736603;
        Wed, 17 Dec 2025 08:25:36 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:36 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:31 +0800
Subject: [PATCH v9 18/21] arm64: dts: apple: t8010: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-18-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=+Y0a0WIcF+OvRh+wENdR2K0SnXmQmB8D5lWAyKi2wlE=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlC/iLREqKTBWyiQSUcAXdch2o0njKG9Al08
 TcC+2X5MZWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JD0eD/4pVaQ23XX6B+Fz65fzVa5a1N7gDangt8BRGmtK4RbXJQcwK12ed/KSO6i6t7r6RkeZH5G
 b3V3+h15nme7HrfFyIbxJ+TklHl4e2rZA28BBmLoVn6dOFV/x3ZtPYuwHVdWNSp2/7DhZzH1Q37
 6BTuOSseNtCcLPe8n/KEvx5CFEr5gREp+EQY4NUDqtceqA/zFJg/jHS4jNQBfu0se39Pn4Jxcx/
 QzXxUucO0/dVcYGKQ79a6BpnThLu6Fy4hwh1wfT8y0N1XgV1bSw6QeFDkvYuXmWGbwOutGhAm/X
 /Wb765ZpIaT/vgi69kbmCXgqur0RsDyAR7uy5L6+4knysMmxnosG8ZuXpCwzdESChCoXncYfGxD
 p1cyWUPC20AQftH6PJwuWyS8ph1DIs91Q4pvllAVhpmYq8NPMUxJy62vOy6GTRHb4yxAfHvGLoe
 4SWngvxXBl70SPMghL99HRz6vDi7jXn6SY4e31zSKlV2sHEk1tUzXO4LjzyLuhj+3Jc74qx5Sik
 e7791dK35Hiz/iCy2gD/eMqNwUUIioKkZQe02O4n4ccQNxK74tRwvxuUdf5b3Mz0sI4hSuusTXu
 +VvyfdhXT3MVurzPfyigziyJNrpjAK+nMzdaNMgdJwGrekEMjGwD7J6cGpf3UCYzwX4MxKkv95z
 ahy8p7F0lBtPoGA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082537_441894_73950297 
X-CRM114-Status: UNSURE (   9.16  )
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

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 522b3896aa87eb290dc831cbbf2cc8e593844097..3cf1eef5cc261fa1dc699e8b5c9991e2215a6010 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -332,6 +332,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.52.0


