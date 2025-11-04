Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD994CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=; b=EeuGJhw0Iv2iTT
	f7po1AqKAeu8RkfTGePnlEdTPSnUMdFmQiSEuq4yYTUeldpOCUHqIRK8+UqqBJJQC6aSdyldBnQB7
	8e9n1KmvGxg8y2u0ol4hEnoAThGre2/75ru6guXUCGvJF1iCeaGgoJjDFyOd7AHJUxjfKckwBSznR
	uSs8RQw5a2w5fMQkVuKOl9Yd709xIxdIUzQdxtIDAYYuP6Hzhefm6n4mDAEeyH91DvKFXdChg4MQV
	Oz4DuVgKkGQdxsvEY4rbN1yvB2UIYvuEnrBtQCDG5ibG9tXOR/EF8DFvVGttQUz91Emsi/AzLkBK6
	JNzzvJfIZVptvtwQslNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUP-0000000C10M-0ryE;
	Tue, 04 Nov 2025 14:58:29 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUN-0000000C0yl-17H7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:58:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso3871514a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268305; x=1762873105; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=;
        b=iycYAA25Z7QAsgprdAuIF9GO1H7lfpU6X4QgKQ75xKo3L07Y+t1Rq7+w5nJjOcVuhn
         acmqaGV5cSVVIfd1TTzfeCgCWL5UI/6ee5HLMVp2JsgWD9KLzhuRQf69+eRwrClsVWKX
         8kr0VzJ+fqhSrHOqZMN13RKrmOjENWjSFfHigUmMEk+KYmh4CtCfMxizr+FR2Vt92usz
         WukkjowRcqpqJ56iPHNMOSX0tpHzAthF1Yu9hbzOx/9WoPAmoqqQBHxtGiczpXVaNfUH
         /At+OJcfcq6beT+Ulw5MtzJ37S8fQBE3msvkP1/qTVogsT9XAGjeMm0DjiQKsK6nBJ4u
         Q9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268305; x=1762873105;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=;
        b=wTVXoZO18vqNrDNAl9uLYgpULUsXeQM4cs3Jvnv9DBJDEue2dvZG8HVFSjdPcsEs4M
         Dli8DGNwlxlA/yjAViCLyBcOxj6hjYZ5U6J6V0ynr+8ycDHWZIKEhh6V6Sxk4hHmuPjC
         1ILoRcdPnGW6qxBEzmzs6/MJYXCp6+DAg57PBQDc240I2yWwK2sTzB3DouR9tyAOn+cS
         IAqKPwkbSwYFRSDT/uM6cpkUio5SD8QrcHagNZQ8kInUjmoGLDH8TvSvaQWIyJsi9Eik
         i0exzXL0YmkM/HtLuIrxnhobLd3Uyq7eeYIMUC3DhuTDdYzEwiFhXsGs1oQwmeQ9j7Uv
         dAEg==
X-Forwarded-Encrypted: i=1; AJvYcCVblvgQ00QXla/0gFFT2z+8XdsLm/raMDNVyQ7mzlXDIA7BNq2gx61mLM8QkWfjzn4XrewThpRg/QTM27JDb1xq@lists.infradead.org
X-Gm-Message-State: AOJu0YyFfdtpk5kNds3Srsd+65YEqTWkgLQOzAoUSmuQZAooMdv19guO
	8kSJUpqXMsEsvmf/MOsttZ21OPBMrE/xWBCPULjjfoHXh3i4Ae4NIh4g
X-Gm-Gg: ASbGncsKVbKsFaYhPb8hJ+Jz1gvRDYzYkVBGjhDqhgPWh6qMhE3QWWCQabq8TyBpZJx
	szKuSfp9fef3P7dSVeq3QSHb2pSgtqqAPMmJGUxEVjwkl5NUbieE//lv5rS6qZX1pU602v7SM2w
	YKQjNxh+wEmFFlmzXsfhyiAE/KgWn5bSb9F7EryuPzcnoS1KS48FnjXxamTadihj5m9gMND6fym
	l64qUDTkIZn5WkHnMBVap24QAaucAAdBKJG4xYfUHWKKBU9G7PmeuyKJ9hNNNhAoCLvvtdm1R/f
	bEXhx6PgYjjQMQYdM5qWSat9W/1zEtSeNuuPAz/0tQzS1M0dxcu/nHTC6ONObIWjQFOio633/Q5
	UNlgGhN12CBC0Iy+i+bGGOZj35eMmF8VClIF+hhohyMB32ZsixNIr8NjU6Z3s3NZIeUQ8nnkkz6
	YX/0acZV1o2aKSOLHkZzutPmgNt1k2RfK0SEtHBKbGqQj9m3M=
X-Google-Smtp-Source: AGHT+IFCrq3nCnD3LeMjo88kUj+iYOsaxz83hK9DRyJQvnnXwEepxp0u4Czy8i8uiy1jj1mUE1acXQ==
X-Received: by 2002:a05:6402:5114:b0:640:f041:c7c6 with SMTP id 4fb4d7f45d1cf-640f041ca48mr1477907a12.21.1762268304776;
        Tue, 04 Nov 2025 06:58:24 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:24 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH RESEND v7 0/7] clk: bcm: kona: Add bus clock support, bus
 clocks for BCM21664/BCM281xx
Date: Tue, 04 Nov 2025 15:58:18 +0100
Message-Id: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=jofWWnwmoG4Nrm+u2R6rEX8xNv7yEnOjBBXdOGfBxTY=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSNG1jE7pGayE9k2YeIEYEceIZhdRQbjRVvf
 c+4M2DM7p2JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjQAKCRCzu/ihE6BR
 aDg2EACPQfLq3G9R87y8E6cISkzuRCn0I42CEz+TaLiFTXrXAIRNojHo/LdGDTz/kRnGRi0WpYn
 0cCm5clirUWqzMJ9c+ifTT6OOs6412rzwPIZfBrDikH/jQDNQml0N2BMkws4yT5Q0D7chgtzgzt
 jpDz6oIHJ6kIv50ZEewPZn+/ufxFnmIn6JCElW8WN6/NBT/01FTbafOUzNqikpZw82IvP3qH0HQ
 7sNz7f79BaBFE88LN03h0eze5i0AQ4FoYyQfLUs2zJtFWinTfzglhfRxgAWO34meuiSt5M0O/lQ
 h+xQhlR4mQ+5QiwOjikfQUuzhUlipswVgraOCfbgq4gchs8wTMr9leseDbZQPGL+pqEhjOtGKEQ
 sfbHEC34K7ycd3gUUm/H5rojBylUXJ9avCQWCDXaFDqqD0RAbxnsiWYoTbgjCNExH6WaLCDwyRb
 X5fkDnPxnWO9RGifbFG3kgCYqqZDQFEDMFxUbdlKAWTzgLAzaIQRH8PvbSf0u9cNw3I8gI+s9lT
 vHWI6tgOesxEfXfHSQrxTmV3QQyieWoCLfsB/B3a5+qxZF0or/1FVG31aJaubgFGTnJCSGCoz4M
 UPKMvKuyAg54i6hS4MK0LiCPzwI83mbS8RyIhBrSZTFSO7OpzVGORzx2zT7ceRHBvdpfrcXODts
 7i3OXHOAZld/E6Q==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_065827_350678_764C1A50 
X-CRM114-Status: GOOD (  13.16  )
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

This patchset does the following:

- Introduce support for bus clocks. These are fairly similar to
  peripheral clocks, but only implement policy, gate and hyst.

- Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
  and update device tree bindings to match.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v7:
- Drop DTS patches to make merging into the clock tree easier. They will be re-sent
  in a subsequent patchset.
- Link to v6: https://lore.kernel.org/r/20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com

Changes in v6:
- Rebase on v6.16
- Make kona_bus_clk_ops const, add a new commit to make kona_peri_clk_ops const as well
- Link to v5: https://lore.kernel.org/r/20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com/

Changes in v5:
- Pick up Reviewed-by trailer from Krzysztof on patch 3
- Rebase on v6.14
- No code changes since v4
- Link to v4: https://lore.kernel.org/r/20250318-kona-bus-clock-v4-0-f54416e8328f@gmail.com

Changes in v4:
- Rename moved CLOCK_COUNT defines to CLK_COUNT to avoid redefinition
- Squash BCM21664/BCM281xx bus clock DT bindings commits together
- Link to v3: https://lore.kernel.org/r/20250308-kona-bus-clock-v3-0-d6fb5bfc3b67@gmail.com

Changes in v3:
- Fix DT schema example in BCM281xx bus clock bindings
- Move CLOCK_COUNT defines from dt-bindings header to the driver
- Fix BCM21664 UARTBx_APB IDs being out of order compared to clock
  driver
- Link to v2: https://lore.kernel.org/r/20250303-kona-bus-clock-v2-0-a363c6a6b798@gmail.com

Changes in v2:
- Drop prerequisite clock patch
- Move clock/bcm21664.h dt-bindings header change to dt-bindings patch
- Add BCM281xx bus clocks
- Link to v1: https://lore.kernel.org/r/20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com

---
Artur Weber (7):
      clk: bcm: kona: Move CLOCK_COUNT defines into the driver
      dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT defines from DT headers
      dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and BCM281xx bus clocks
      clk: bcm: kona: Make kona_peri_clk_ops const
      clk: bcm: kona: Add support for bus clocks
      clk: bcm21664: Add corresponding bus clocks for peripheral clocks
      clk: bcm281xx: Add corresponding bus clocks for peripheral clocks

 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   |  49 ++++++-
 drivers/clk/bcm/clk-bcm21664.c                     |  99 ++++++++++++++-
 drivers/clk/bcm/clk-bcm281xx.c                     | 141 ++++++++++++++++++++-
 drivers/clk/bcm/clk-kona-setup.c                   | 116 +++++++++++++++++
 drivers/clk/bcm/clk-kona.c                         |  64 +++++++++-
 drivers/clk/bcm/clk-kona.h                         |  14 +-
 include/dt-bindings/clock/bcm21664.h               |  17 ++-
 include/dt-bindings/clock/bcm281xx.h               |  24 +++-
 8 files changed, 499 insertions(+), 25 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250212-kona-bus-clock-4297eefae940

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


