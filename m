Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17BECCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16lNfyPp2lVpupbRAD1MY+eMmDibLLbMsLULc43CNdM=; b=zZ4JFBBP9HNT/l/wm4CNy0G4v0
	l2Ynzf3swUY2fBT73rHyxFkV09Pa3RSwZj1x3ykUD1JTIlMFSMuSxJZHcqhvLN6wtySPcZP7TJ3NK
	HpkGOpwF9lPHaQw75E5cyxruCTU5JZeZvtdS/USeR7AatBa7DHYvUP9YxD4N9tV+CCddN0fFsmGL+
	IL8sh77z1h9hz/Z9XW3XUZji13eFjwdNVaylY6Gk0dkVJXznIe3aQV/aepkPgjUF9RYTgXF38TBVF
	xobkwvPQ8znZ3TIuiKZCFSRvK2xYIMo306ZzDNjh8Ch6AcredM/qsb74tF0h1NmQgKpufbjAM1hQn
	hKwyyF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ga0-0000000Gipe-0a6g;
	Tue, 14 Oct 2025 15:04:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZv-0000000Gilq-0N4K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:04:45 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3306d3ab2e4so5516365a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454282; x=1761059082; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16lNfyPp2lVpupbRAD1MY+eMmDibLLbMsLULc43CNdM=;
        b=Fk1OgsR5KjuyBm8GutG3Cf4x+EZjc6r9TBJ+c7gqnREjEkb6IeQ1IHJykfpGPZFl3n
         q4cOOUzMfCtde+arA4/KgwtiE054CTsYBRuCIM0mhbemdit1uKuH2RucbvKbwZwP5myq
         j7qgmhOCwAHTtiIVjNiiFkp1OQyknlqv/hN+juGmITGKkndlGJJjOluEw8RLzMbHFX4y
         wixec85bVNWN+oYBT8KHcObwgoQ4voVopxEYy//yLpFr2MDlkfaSjVePQx86WgOUwY0O
         unFo8LlDCrk0UcaM/jyyiUZABW4ZOt61c3FE5zboAtozQDdOOj2GL2RuXV2Aeaybc1px
         cD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454282; x=1761059082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16lNfyPp2lVpupbRAD1MY+eMmDibLLbMsLULc43CNdM=;
        b=W4XThiznhLXJShUzpLQiRUvGQ+NQLH0X7FLyOeE60OIlJaXjXWBAb2iD9DecrVqi9X
         a0fHkyjQ2Gdtlo8+B1hyMEgTtxc32WqP2hANBNyaX3zOkLxCX9Cc3AfRhsOTekVZPTSr
         LrVqxPOxsaP7P8pYsWQjp7+7x4M3qjR9RDm/GQHDmE9mG7JwFiPep58gySgUyOKR8Pzt
         /Y5VQupYaqRBzGIILcBWHT4DLLBdKj3PDP5KbBvLm77YJ3v1b985GrtnlA1vTc+HZCbg
         r0oQfo6/bKWRz0DuEfoIgXvheTLbvqGA3QspZzSfgNX5bUGAgfTHBoHBY3wuY+ga9ZYb
         3yRw==
X-Forwarded-Encrypted: i=1; AJvYcCX6C6RF1eAb1LqMxGvv/Wp9J5OQj8VGvVvlwl20c74zyISi/JBf4tCMloWm0vNBxIoDVTicMM6robglnK++SYXL@lists.infradead.org
X-Gm-Message-State: AOJu0YyW0Zo48Sy9t486HOui4I4JUiQMvz/MURz35iwSg7sKx6PAj0Wq
	kD7oRuXyskeDdmVm1pRNEJDEIJJqhQg5jfRl0xpdFRZzUX4zaaVN/NZY
X-Gm-Gg: ASbGncvmls4aiehixPtZfHVTLgjnnJ39UzVssKQJ9kLjJWwD/w3IK8EiTonllCKWgwf
	TdDOPRjD5x4YiAlFUbXWWvX0EAuGateB75Gt0/caZBHirrFTdkcVianbzITjIIdsKmU8vtcMN0B
	61L3gbWbAYiI4sX9OQb3S7yuejg9cSbbDg7R2OoTQhfoOpGeH5aVGSM/VxiS6koJqMjEraazeHT
	9F6T+Fu/Xx2aQfghP6jNCxppPWn86oJoqrjF6i9TMWyQP7doKgeFM8LW9N/JBFqhThakDq6RNma
	eKL6xsdqtfA5McPc+biBP6nKpzTdbJ1oZi9SD4X+sU2o9BdpI77bvi/W4r6UgF+spYmCWh7m+OJ
	DFRUl1uuxnVRDucPZKfICcvBth86OkMvG2YzpDgKg/BU=
X-Google-Smtp-Source: AGHT+IGwEs3rrCDqpl5/3jdMLYGXd/fP1d+HAulIjOxhPLB7QlezpM98CM9KNKeg0TI59ggKTThDpg==
X-Received: by 2002:a17:90b:4d10:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-33b5138db1emr36578879a91.23.1760454280681;
        Tue, 14 Oct 2025 08:04:40 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:40 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:39 +0800
Subject: [PATCH RESEND v8 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-6-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=HTqUsRXqv0uayXlXxBww3HqeknMt/byBk1GhhunGYGY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZtIExs41YFPpj0vJDkH9AmK9OwhzMSoCLKK
 Lq4Oy96LeiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbQAKCRABygi3psUI
 JLLiEACERRbpPD9nPrsGGfapV4gEvqaAHnouFfwKWinXgfj0dP6MuIaz/G7+GbUDhhfC3u4bQpK
 91p4sbNGynjY0RJbgtoIYi1nxnbKb8sHwm5cksvQgTFvc6ijEWbZKovDPej3lGT8J/OT2bHHwTC
 Y02PtU4yzhNj38o2Y6mfR6h0hjejGvSgia5ieLHGZcDkP94gt6BPu4lsh3mfrgErNh31mX8a/RH
 REWOQTV9V6YbUmP1QZ5HQm4NVBZ7h4P+fWOGR3qHIjivQlp6kwrNVPlkxL3pT6rShe2i2LgyFa5
 AJ3o6ufsmOv7CQlUx+HZmhajqZWk51M/hc+0VPQJXTXngABulTD6jeHlxXUolJdB80z0N8Pis9T
 6yzLzN0RhQ2XeN/hTIQtnbzl658ub279hmAV50nk1pBkG+LT83/gjAlcTE/EiQSRfnA2h6AtttF
 Nb+40XxkDfuPnLKwA6Mc+veJdwakQxzkIVV8LzUJQE6O37qj+Ld2fCpfSu8/jWxiG8Kwk2SCZ4c
 OngOeu9D1OsDVjtUYceGVr5fu7x1ILXh6XVC8FXC6hCu5mnife1EtD/fShLv3jDvwO1y4cTQBGe
 QFp+BOd9rOLZsefaDh8l5DSFzsss3w7PF0O85pLHjP+SlQDc0iOIFIPFemoS3FYFKUjfcgmaEkW
 vsWljmeHn0rrd+Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080444_226504_89753F68 
X-CRM114-Status: GOOD (  11.66  )
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

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation startup function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index fb2759069fe9e47146f0342fa46e40f3ab836926..303c0e62432281e899a33fc197365c70078d6ac1 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -659,7 +659,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -681,6 +680,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -690,6 +690,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -699,6 +700,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -708,6 +710,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.51.0


