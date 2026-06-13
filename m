Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55225CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 05:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U/CLZ+5qQK6nv7unT8PtYK68qrCmHhJFocTHGDo1YqU=; b=hlTxAWh2ztk2qu
	/ZcdabRJsMLzwLpiQwYpM0mDTKSmUnpCLN72WdTdSj7mp7fp7vUxMwpyMESLRn2gbdYjO7FiBtA4m
	LiU0akC/ALjW2kduxLIC/mXGO86U3FyTp0OynPrtGRJTrhyk1g+t/+FKPbgJoGuB+EY9KASLXsedt
	0hrmJBtEuC1G6IQDiBmNOlXwhthZoNg10ZrUROHKNPS3voDneM8HSRDYYi6HoJc7dacMB/q4pJR9G
	BBNBxub2GuYSpxzz83dsPu889OVmT/3jbZ2XoYI5kG0SkGBhJw2xPytLLPqZbhRRsLHQFOgwn2vcJ
	qOH6t3R3N1Ytr8tL4X5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGnI-0000000Bxn5-1jhn;
	Sat, 13 Jun 2026 05:20:32 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGnG-0000000Bxmj-0LxQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 05:20:31 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-59d6e44e5c8so1194429e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 22:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781328028; x=1781932828; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/CLZ+5qQK6nv7unT8PtYK68qrCmHhJFocTHGDo1YqU=;
        b=PLMlQ5TkZhejYTUUdxJ/KdQeJc7bv/XKXRZsVbFQA/e/i7l0EKEdqRKiRQdflnxPy6
         p+LoPN7NvAkSAlIY55N63Ft/te3wZ41LdurLo0wZOAQc56Abo6qXZ5tI3IVqyCO1GZA2
         WSrYWaFTCu9hxhI3PxHNQ1z9ZIq+4+gsWQJf7cB3A75h4YsPYKqTiA2PQvgPW2YNweiJ
         dGZeFyLddG/cA9khWEkZXVbHxCoVichI6IPKUZovfOXwF1C4pyG3oSAUEao+uMbCfzo/
         PlRRfHOWyJj+OSmWzHj341mF1MPwZ7+e8aSrgPJRezy5JXUL3oEdHUzO+wxuf9iqBP+N
         JIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781328028; x=1781932828;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/CLZ+5qQK6nv7unT8PtYK68qrCmHhJFocTHGDo1YqU=;
        b=YL7LldQUcon/+Lx8vp4sQ2uBwmh12XIePDl4AC22TfbdjkdNhswG71Ilthwzyxe4wV
         3vR7uBQw/MzfZgL3EZRzkaTviA47Md0LqvwN2rtPvbnJ6NPqQiWzN5zcj89Bwv3yvPvv
         g4vi1oRZ9ih5VEoiaFdAPlZwF/KYpjuN59IDCvWJN/rBlUHuRTC1YT7LV7zx+2g2tUDt
         XB6cUhEX9/e488VjXUm/pnhaEkF0OmrSDAC/NoLQlYZhEHcWSYISlbYONKKU88VSu6sq
         H/PtlnvYzqoe0GfKyC0IYMiOopRbTnYObK/bhSw5G1hN9DO9OixS0iJdAv2dZW//WcvJ
         2AAg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZUITYEbqXcR1b4milLs/0txZSddecDZ3nUQNI6oOQal6TzWvmbeHbSRfBvYjHhu/RFkJ/jAGzKnEYYXs3aa4U@lists.infradead.org
X-Gm-Message-State: AOJu0YxIxPXeRlMrhEDmSNSxrslZGVqqvPpTs6ogoB+rnbOczNu0ZQQP
	s1gmXV3FQKbYljeMCPCQGkEOk9LNOii35JUTxHqGdaeb8i8oJDe0MRhh
X-Gm-Gg: Acq92OG4RaNrRkmMM9i106p5QbyxzYtx1vY13j2K0O2ROnCycFMzl8vx2qCaQrcDPqq
	Jwf/64VGnrQp/g+6smPjHpQl9Jftu2NxipcxIag1aXjPkEn6ztRxbw9WIF94uf13MzJZdwRPYoI
	4N1ZQqKkpVoIhAqkisAthFcm/2Z8PHlF5fC2CYmTMbeBNjPwvEILd53fT/L2uGucMvZpZspThJE
	AP8orfKocS7OT0NEaeWlvMDYs0I+/S4ksIiOnkyHaHRI4KflwfiQMlemz6cFEYNLmw/Aq/rmM3p
	pCKzSB3yewT3dJB31jLqo4eH4YYEU40jOcnte6Yyb+8+ImSJpSJufj1liJ+BjfU3T8zDqlpe/19
	m6RQQ1JBAwxuVOOrJWfdsorSnboLoqO8IHZOgtjYSAfqUHkxJQ9y5vH7J5kE0wf1WDDwXX/JVEy
	/ln4YhHjF8iYReD+/Bm3RO5RbPEC3e
X-Received: by 2002:a05:6122:4204:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-5bb6c001fddmr3552398e0c.6.1781328027844;
        Fri, 12 Jun 2026 22:20:27 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.136])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69014308sm4848692e0c.7.2026.06.12.22.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 22:20:27 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/2] clk: samsung: exynos990: Fix PERIS gate clock
 parents and add TMU_SUB
Date: Sat, 13 Jun 2026 00:19:50 -0500
Message-Id: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHboLGoC/yWMywqDMBAAf0X23IU8IBB/pfSg6dquhxiyKhbx3
 13tcRhmdhCqTAJts0OllYWnrOAeDaRvlz+E/FYGZ1wwwXqk7ZcnidFg0VJw4A1Xh8HG5Dtveh8
 SaFwqqbnHz9efZelHSvN1g+M4AQ8UKgN6AAAA
X-Change-ID: 20260613-exynos990-peris-fix-v2-619c3a30b36c
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781328021; l=954;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=9C+9acoU6g7lVamTfAReYE056+Mo4L19daujFjjLyxE=;
 b=fqNIjsE723ylk8j0/JzkxKuIjpTKFRODde0FklYKkmT158zHx150PVaaryeNmpJCGmx+6lS99
 9PAJFBwCkZ4Bwe267t1dckNnAYv4pOVr4zr1DpoTDCKAEQiCY6X2cEC
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_222030_181021_2B41F815 
X-CRM114-Status: UNSURE (   8.80  )
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

Fix PERIS CMU gate clock parent mismatches and add the missing
TMU_SUB_PCLK clock.

Split into dt-bindings (clock ID) and driver (parent fixes) as
required by checkpatch.

Changes in v2:
  - Split dt-bindings header change into separate patch (1/2)
  - Driver fix now only touches clk-exynos990.c (2/2)
  - Add proper cover letter

v1: TODO-add-lore-link

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (2):
      dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      clk: samsung: exynos990: Fix PERIS gate clock parents

 drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 2 files changed, 15 insertions(+), 10 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260613-exynos990-peris-fix-v2-619c3a30b36c

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>


