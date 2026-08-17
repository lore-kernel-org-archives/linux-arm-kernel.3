Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E527C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bG3zYz5+dH9i4xXj1CEgnMl3U1jjEKTAX5dq5SzZcvE=; b=uJThM0hWQ9Qlmya1P2cbGODKO4
	oRtk6963MDa70ANdZcVnh8siKEzv8dhsgaUSxZLdfC1YsFOgCjr/hOn3jhf7EfDRWwQzifohwhIxO
	Dxwypc7DXbrzHiyKOsrhSLi3bQ9npLNTRzodyHiJUbUsEO7rPTncDb01ipd4fiDVqxXOeYe5e8c8I
	8hoCDMDTLH4x2+Ag/Y8BQ80TsmHn3Ex8KELlN55kiCIjEJcipXUMi0H9SuWPGLMEPG3Id5iJA0R/M
	/V/aqMV5bJezDff2NgBYuSsdmur52RTCRCM62v7P+22WL069BokqzcZS0QQkpIEi535mNHuM55EA5
	4wVAwfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuV0-00000005udF-0YP2;
	Mon, 17 Aug 2026 10:23:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuUz-00000005ucs-1Pic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:23:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BA1A600AE;
	Mon, 17 Aug 2026 10:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CD5CC2BCF4;
	Mon, 17 Aug 2026 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786962200;
	bh=0VUxeKXCA+Jwc4fUkZKqZlpIjFFuiY5z4ib6VJ1O9P0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=skCD0DsvX01VjikpbGJXpwxNGm2Uw24ThsPuwNrY2VcUO+mt2rpG7KgzniZCwOg1P
	 EPGKIfppZHQ7PTsftRwT7CgB41rUwV0fqZ32qsrbU37ldisASOMUD2blWgTlJNwxB/
	 1vCyZgXR9riXRRqu6IEncZUspKxvkiy3HfTJeKh+OdnzUvno+i6xN4s9tVHyIGhtiw
	 IOhi7x9ciyM8x+1X+J0xL6UPmR+ksaoisZI652PhDDNr8oOV0OYIVd7sHww81a3QcA
	 wVHmUj8xu7mBHGZbhESk2yCo8ji5OmsxkHZ/gSgiJbpIJFvPykpAyLY7ZnGIohlaIa
	 XDYf6yDax24ng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03B6C5DF70;
	Mon, 17 Aug 2026 10:23:19 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH 0/2] watchdog: Add Exynos5515 watchdog timer support
Date: Mon, 17 Aug 2026 11:22:51 +0100
Message-Id: <20260817-for-next-lucky7-watchdog-v1-0-a14370e20b92@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvggmoC/yXMQQ6CMBBA0auQWTsJU4OgVzEuaJnCqGlNWxRCu
 DsVlm/x/wKRg3CEW7FA4K9E8S6DTgWYoXU9o3TZoEp1KRuq0PqAjqeE79G85hp/bTJD53s8K21
 1RXQlS5DzT2Ar076+Pw7HUT/ZpP8P1nUDRgYGxHwAAAA=
X-Change-ID: 20260815-for-next-lucky7-watchdog-32bfb51191f1
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Aiden Isik <aidenisik+git@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=0VUxeKXCA+Jwc4fUkZKqZlpIjFFuiY5z4ib6VJ1O9P0=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqguEVSBtciqsRvU0ly2IDdyKzgPzAKZC0FqZcW
 N/b0U0n7hWJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoLhFQAKCRBJJwGyxHrX
 62aQD/90D+3JrG0uou0nGOngl9mATJAgpQMpDYCke6u9agd8cy2w3Cd1UA1J22TVpe5yBIzVWNX
 PM3vPDtbkzmY3hIJOCaRYK0Sm3305YuILFeeBtcWOWQyv3TwoOdp7MEgR5uO6HOC8qAbdm8L0ZT
 FbcgNSlWN6IDfeWY23l+O1YrYpFJOhpZmwdCZWP6nVKveg+v1v9H1AmSQhk2L91HAc54/eR6TGZ
 sczDF3Z5iNeLfYfY1wtdi9DScfb7/iUFIPrljwcKyYHkbDd3+tXSoKhov1F8V9vEmMSxk2RUlFX
 +zl/LWp8xgueCqUbLpDYVWOjnayBbnxHEBshZO8qMqSFLsAGLivnSm/Aoxz/noyimv6u8GMa7XX
 va2XWZqWISkPunb42+rW73NjTZFCqKS7pNDCahkQjiywEjGyXQJKn07e+5prosNrqfVOf3fDXfX
 YZGHV1P7vvJvvZkeGb24AQ/qrQD+Cbfa1HDUMmMV8u2uX3qofwgnfarjN/cML/qNJM3eHn9SKd6
 AI5JnJnRVkrSG/i5Q4/Xq3QYqlsMpzyVqiqDqUgfvk6itQNzPXaTeZwo5G3fvDp9mKkAcJVD/oE
 yrtQAYI/KJ/+8u2PkBOOH+UGB7YSKAtpHmyk1Wfto7NXW5HXGiHcMKcwC0iASUW4ZpkxkzjXOCk
 4U9gLqwQNE1sV9g==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi there,

This patchset adds support for the Exynos5515 SoC's watchdog timer
to the S3C2410 watchdog timer driver.

There is one checkpatch warning for this patchset:

> -------------------------------------------------------------------------
> Commit 8f4ec3a9b89b ("watchdog: s3c2410_wdt: Add exynos5515-wdt compatibl
> -------------------------------------------------------------------------
> WARNING: Avoid unnecessary line continuations
> #26: FILE: drivers/watchdog/s3c2410_wdt.c:240:
> +       .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \

Which seems to be erroneous: this line continuation is necessary
(and is done by every other existing entry).

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
---
Aiden Isik (2):
      dt-bindings: watchdog: samsung-wdt: Add exynos5515-wdt compatible
      watchdog: s3c2410_wdt: Add exynos5515-wdt compatible data

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 22 +++++++++++++++++++++-
 drivers/watchdog/s3c2410_wdt.c                     | 12 ++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
---
base-commit: acde40ba506aae78633e080b5704d33cf4bc13c6
change-id: 20260815-for-next-lucky7-watchdog-32bfb51191f1

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>



