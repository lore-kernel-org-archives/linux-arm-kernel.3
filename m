Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BDDCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 20:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4T7EkkegVyODZ1yMUvqUb4I+TPr2uXbUfFIWfX/3x7g=; b=R5Y0ErYwvLlOgg9aDA5JIQvE0t
	iejCr4dPTEQqFSFyYfbdgfdpcJrCpMXv0yWL0cd7Vcgv7XzW3oy87mye6BEWCxLc+wx4T4hpYLYzC
	/XJS3KOzOzAvqDAWpmSNJMQ/0r/+v5Q+lPKwwt+gDD0hMrcn1sonLzFLwDk5OqZIazwXzdwMIvcMh
	TRdo4NBj18chtxOc/RY1rXQFegJEtGT5t++6B17piAPk2KN/wvNNeUTCJTIKQUN4Utcr7o1vrr/+g
	NooDevfPEZxPO2Q24gHy6bT6x64cfqAysccBjXc0b5egphFyhCDJtEnba8T+LtS+zEovxK3toQzjS
	d+5wF7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNu-0000000GIUH-3DQO;
	Tue, 16 Jun 2026 20:27:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaNp-0000000GINb-2x5E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 20:27:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490b64c8311so49050755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 13:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641660; x=1782246460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4T7EkkegVyODZ1yMUvqUb4I+TPr2uXbUfFIWfX/3x7g=;
        b=Bfg6ZQSKnmTn76r1bZLk5xueK2mQXlcfpa6Anls8M/3/X6VUlperJyxwbXi++MY/7q
         iRpLSfrrG5GAhti2lne7bqz6pYSanckhlDuny4fs9/UmYBwP9jiASGNckcHMt4hkJL3v
         CRcLaCddDTuLRStqkj3ywCZtUKW4keJ78cpp/1IWRZzmbAyjvln9nP5O3ucyXu4YUnml
         P9c64Osqr+g+yLbIg1acXnA4K9rUya04pBpib1p3+86dtSt3QsbX7H7IVAvhoaH0RlFK
         fE4d61AyE617WYuxeSDykSZMDsM5TXqlfKo9r498h1z4d9uCyVgx3uilxNpGEDZ+/ySx
         p0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641660; x=1782246460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4T7EkkegVyODZ1yMUvqUb4I+TPr2uXbUfFIWfX/3x7g=;
        b=oKi7ULanHACQ6ij1CxyeR7B83UaHKj9zjCJFaYIzHDcGrhiy2uj+ohfBOZ3NdfMSBL
         //1tKUnOXaOn1ms0Z5HjUf2ZPTVQU1p6ba3fPHBMmyRPWlim0w4cl+PnKNyff3Qwktyg
         FJ8zYF+nw7m7loH8QgEAUAgZzWRnU/5DYr3Cl7WjRTzRHtzeKMitnRwSF6Z64/k6RCzJ
         jBuKBwua2RvUkiVWJ4qjV1ihRRpIRAkO76ZIfcVgAhYMlF9uwHepVFUIsSAAulJ+WvFp
         Dg2y+ph+9NvvXQS8GUrSxkQD+fUh+44B4cewJLk3ZVA5z4HS/lDDQyI0tZlEqfmUnwGS
         r/0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8H8ok3vcq/5qqUYybw0HUWknrxIwPGs32VcdOVUuNNV2M40JiOjLsYDzXZcHwNnIEfppLdnVWcBAtWQwtz8Joz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8EOe5k+ccEk04Z1XaBxZnvnHt6slc7GtdgJMoJ3PDfvLc49TQ
	/MeLN7uxf7Z3J6dHuwXKWiEEir1bw4iMS4A+BhORYcOSchbzjvb4yve8
X-Gm-Gg: Acq92OG9t94aaFz3Ez1ZN4fqVuLcmZWsn2aHYnf1IuFtHye1jqn8qMCedLm1CDA1aUM
	HE8adzwCLq/vxnb7tIf0iC6BpXQTrynyE4Mn8d5jwZG+MqeNRTyUGrB5SB7/kibpiuJywLP/PCD
	/5CoLi3vr2z4Wc+FF3Om1ShpRDnlinCD7h04yrM8icePbPo/cv3t8GT5qqoZm9oqLndSL08iSb4
	FzNQTycvMapX6h/4F6qoTEGKcrPqrN6rNylB+AYl/IOOaiJprTTOlKJVsIiDWU6aGVPgvuzpGvB
	TvCkyRK3ni+t3dBap9lVxpRh6tLLpjq7g9dPdz0mhU1Elm57l+mO+HMAiAYzka5nCUpHo5h1gT4
	l9DA5mJkkzD2MCdYJIZ37mye5SYdxjY/Jay0Kz00S/evHGjr+u3XVTu0Hams20UY79lo5Gy+7aA
	FaKFTw2GiJim9HUf0Ksvu9vzxaB+LMEDhdQg==
X-Received: by 2002:a7b:c3d1:0:b0:490:9df1:f0cf with SMTP id 5b1f17b1804b1-492333a1b10mr11488675e9.2.1781641659641;
        Tue, 16 Jun 2026 13:27:39 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:39 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:32 +0300
Subject: [PATCH RFC v4 12/12] ARM: dts: zte: Add a syscon-reboot for
 zx297520v3 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-12-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=817;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=dEe7AnhTFAr5p/XXrX/uCCb9oMxECR6QftpPnuBBlPY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGdznTfH74HtE8ynnSgt60AzmAGzDzYjSBF
 v5tV/6RRTmJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKHEw/9FhrXlF6q4Lzp5fUaLbRw/bc/1+9787X
 vYpRe2fXPGZx9mRtm/9BiFcwv84Yw1sVzTFxVOEfG69VjUX+Ku1D2Tk5Q8HT3O6fSn5I9lObMwt
 kboi/YHrRmec5FIxp8tVGKQSZ7IrtPMkJhQFDs/PzAq0ECfW1pgtVd/kw9s0WqVVliTP+Hu7io4
 zeW8EPpUz4HrN9dB8PdC7wo6nL2keck2pwuIqPfxNRRRxItmUbOwNxNTAaZopvL12WPT/tnD0Xm
 w7TvVmXK6e8iEdznzirlzYc8akeQe2NveWLTO7yNOybrt/UmoWR/NNlkXa6McyKkSGHDRuG1VWB
 7/UWwaQqyWW4CG96xs0PIV5zmFV1b4j6lLgnGoSV2YHR/RJ0DqAxBJ3vUhSouV+J7NNwkl4XUgr
 dYTiRMN4hzq/3imJh08ZRi7AzfZWU3pGob+CwmeCKzhrjYcDLpR8mFFRqGuaRkXpywo14b/jeK8
 yD6ZCDRvH8hT1HXv6dAYhIxBnorfg57VBPMWUOM4NEWCTvQaV9MXLTO7V6GmkZ+TIeysUXU/aVa
 qyb5CKCJptLSpp4D17PARQZ2Vzg2ov9eomoWzLNZ2Sll7WyGs8tdeSwzdix48gEWPfUS+OLWVWE
 3hfSH9JKGwoLDkvwwS9LQzW5/uwgcLIT3UeemWbz35claV7Zzc8k=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_132741_995946_8120603A 
X-CRM114-Status: GOOD (  10.45  )
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

This is fairly simple with the driver exposing a syscon regmap. Write a
one to the lowest bit of register 0 and the board resets.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a2b6909e7434..013ece51c2a0 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -33,6 +33,13 @@ osc32k: osc32k {
 		#clock-cells = <0>;
 	};
 
+	syscon-reboot {
+		compatible = "syscon-reboot";
+		regmap = <&topclk>;
+		offset = <0x0>;
+		mask = <0x1>;
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,

-- 
2.53.0


