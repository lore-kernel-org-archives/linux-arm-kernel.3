Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9456CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pkc6t1WnYS+t6lBmtnTcScgre/BqbdAm28uFQUA8mfE=; b=3Jmj9slAY4vl2zLZ/2qKR4CO7u
	9JMaM0SysUUEIsNdkXwgLZkmXC2QC+F6FF8NF41WxQmqC+lzLOlZcg5O9PfbgwgvmUmZ0OFEnTDTS
	qaw2STDau6Wu78DuEFa52hxgxGlp62eEjH6SoTT0RZKoSntlUuqmcSQGse2aiAR7OA2oavFFDxRFH
	p9CbJxUEczUe1dqnUtAyGqRJfyGzaClxRneWAxTPKow2y6FuNY7Krs7z4gWD87F/Y5FJJ2MjXmNFx
	aj1UBeh75cNWK9f2kJjd1pNOK28issmOBri4Ovf2oNxSuCHMpCbcAU6o9urcdY9ECpgQsBWQw3FlI
	cAaK1gPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezcN-0000000G2sq-3HNX;
	Mon, 03 Feb 2025 16:48:15 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tezb2-0000000G2lq-0SE1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 16:46:54 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso927347466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 08:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738601211; x=1739206011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkc6t1WnYS+t6lBmtnTcScgre/BqbdAm28uFQUA8mfE=;
        b=z8XUf3P4Y6+1PqTgGwYAq6lfHtwu2bii66uCdIjRMdPK+hT01PPYaUpUVpr+fi9BB2
         TBh2yE1EGZxtcgLGLtqoEtKQL+fQvr+UyEcMhV0tqL5LnSHDJDpLAUZ551NnllgyIPTF
         B/m+r6rGe+qlnV+uLxumzmkU039FZoMGXVsqriXNZLSWFhEDDpDGZlZRA+WSfmK3dPsg
         Lywcf8e7aOAJfgNjZmaSb5NCjaJ0ktoFLE1onCa1T3MRctywQUUJb4xCppijY3v7LIzr
         qzC7Xa68Nlt7C8DrfrrVfepKr31kmztMt1YIpvHb4QvuDk3F9vecyPoxNmYHyVPIRjBM
         J5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601211; x=1739206011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pkc6t1WnYS+t6lBmtnTcScgre/BqbdAm28uFQUA8mfE=;
        b=jSCI0CsJ/4GSkrw/jGGmhTZK0lW7LqEej5x2BzSMQB8fQLqF4OzUiOV7FLUkcy/JJ2
         LZKYR9oFJLZYaH3t8UxateKtxaBsGroYYRO8i4BHWug3x24pLjtCNULQwQN+zgntG+Pz
         jFj+dd508gMu3WieisjGw2g5mQa+BT6GrIHoKQIwWUUKnQDAGhVoJBIS7uZ66heT5EaW
         MIX7oB6IUILROnXPWzo39CYSoqGkwSQjtcRd2qGGl8c2+V1MBC8Nkus3GKeqhPxyQmFK
         sphKIqGPR9NyK7/NpnlKrqdT18TffZxzJbOyJdJS2d++pNLhk0DWlqLO5N2e5TWdYkI9
         gZdA==
X-Forwarded-Encrypted: i=1; AJvYcCVTHM+LoTQzEhjY6ljiM6pKqk1cbaJVBsrOXekKue0pzYMl2w4YvAXdqgpELJS0uFz+KwhfERb3IiakoYHhFwVw@lists.infradead.org
X-Gm-Message-State: AOJu0YxIeqYo5UA7M5c1nSDxp2+i7MZQhArPkav3UMLqeH1/XJNrY0WU
	+Evi8s2gJoHiCBhBmIo/6wHsaNDgnWtI7Zou227Wx/Jxyt1owpHZFTeZK9ca5Bw=
X-Gm-Gg: ASbGncsju8uL8SiOKvqXBlOIsEyOfV9ySPfRrlJzcxhuSWmLA7qvLlU47lo88v7//wH
	Em/Krd1MqxteJiaWmsDntZHvowFYD2RCqqid2M532myWfU/z/PBiK8MnH7lpJD8TMf5O7KNPGTG
	lUILKDRXbCOhMPGl4JUb3wzLp9rB9Y4kQk/L2TKaPMjvnxvgn2o6vCWK9Il+xk5ZB4ELapRumjW
	1Syf0Gsfr5warm4maDCWg9dN0Zrqn3L1ndSWr5YI7YUbXsUN0XMYUMcwJFw0klILr7n0OHbtU0W
	mZWRkemiUEarpJZ2cl28oWjvhTjfwB04NUfp74qqcxMBEpNzkqFzaPeXBw==
X-Google-Smtp-Source: AGHT+IHO770jfk92Mttnp7BBnckYBWePcZNUS/gRCytxdy10Cea5/p44mZtHqa1Ad7gj0COvv0kFkQ==
X-Received: by 2002:a17:907:7213:b0:ab2:d721:ed8e with SMTP id a640c23a62f3a-ab6cfda4266mr2160723566b.39.1738601210571;
        Mon, 03 Feb 2025 08:46:50 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab70e4e3b5esm444814766b.138.2025.02.03.08.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:46:50 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] ARM: dts: socfpga: Add basic support for Terrasic's de10-nano
Date: Mon,  3 Feb 2025 17:46:35 +0100
Message-ID: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=878; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=R7QAl/z0BDS+8/SB5d/6NZpgDzEVvDhMqImUpY+IXrQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnoPLsQ7RqMIdo3YVVpnHyfdmGb3rZZRdpHAGsW 5RO7a4/8HWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6Dy7AAKCRCPgPtYfRL+ TpMeCACt8WwSHNiT1pQV2y+yXXY3e7hgYdOKZkKL+JzgAgwGyWbsIva+C5nKdhqPlkHnfO0WHlM vaZ74HxbrBM98F3ygxFt0h0A/jJQa1og0kRXrGIYDqzpNIBE3Lbj72CSuCUKCuGyl3Ddy4iddfG nwa2K7526nktZjJ9u1HjEAiJMWl6DEJMiambnUuLCUxlc1W7QMyo//jzsN0uTmbjbUXzBiimHWi gSPt8T4oO/HbbvEH42/cyfIz7jLR03vr1K3ZSRj9JqTJF+KGRjAbbVa94VIZ1VbRQDo8H9QZyD7 DQiYJXdLcakuUv5/HCGGqSmS8+KgRN/mzC6AuRNi/Ahgaxho
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_084652_418500_BCDC7AA5 
X-CRM114-Status: GOOD (  13.17  )
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

Hello,

The only change since v2
(https://lore.kernel.org/linux-arm-kernel/20250130074553.92023-2-u.kleine-koenig@baylibre.com):
is that I added patch 1/2 that is supposed to fix the warning that I
failed to notice with the testing I did. Thanks to Krzysztof and Rob for
their patience with me. I hope I got it right now.

Best regards
Uwe

Uwe Kleine-König (2):
  dt-bindings: altera: Add compatible for Terasic's DE10-nano
  ARM: dts: socfpga: Add basic support for Terrasic's de10-nano

 .../devicetree/bindings/arm/altera.yaml       |  1 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
 .../socfpga/socfpga_cyclone5_de10nano.dts     | 95 +++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts

base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
-- 
2.47.1


