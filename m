Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736C6CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZKA77jm9kbpECwes2HBBFKfBcH0wMfdUgHPGsHOLoE=; b=gJWJOSnrh0c9LWONpiysj+/Tus
	nm0CBZgYhvAAnCfRVmUrasbWFvwopCayd7jGaOY6xNqERVwIk0u+NrTj9s/xR6Sv0XVMS4fhdVVLR
	TXCk7efOxywZyAVIAc2rs3A2EhxSO6L1qRviGK8QTaxPPC+YFA+Mi4ury7LtPgw7ungrsihj70AbX
	gCCzG5LXoMu2Okzprf+OFZ190EihZ6xjWQ/gI52iGpYcr7elqut1VRXmsfSl3CvNXGPHsPIvmnxUW
	gIpPQ+r0LDscla0R6D6Pe+3ATzYUapqB78Ub6aFJHGVB8lwr9JtacUwKYAHr8Is8iDHYJ8rbd5bZY
	Hz1sNBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtdT-00000004upx-0pwX;
	Thu, 08 Oct 2026 19:18:35 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtdQ-00000004unm-1k9I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:18:33 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3153529eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791487112; x=1792091912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZKA77jm9kbpECwes2HBBFKfBcH0wMfdUgHPGsHOLoE=;
        b=DN4n5XGCgLSLNRKlwiFFKhUpPy/239aYTWvZGSEtIuudOdcGUgoA/kIBrNIMPhuJL9
         27iq1gND5ql0FtLdZx1LQ9Valo0qP21J75fCobS/CgNPvU4RTI5mUXIkQVDXziy7rNYB
         Kotzi06WGtqEiJQBHxrp3Smg1caUW8Uuu6IpLXTuRbDa99tsUjEwkDuTSfd6DSdNOjGT
         PY37hfK34i3zQnChD42JApcmv2JgMzTpQ4gn2pezNvCc5CQF64giUcEzkGff4lghqqkh
         mTluLfl8srvXQ4rHN/J3IGcgGdtsTSvpMOFFLQ9FWEJqz2LfXfN5Un2AArU4CzlITovm
         AaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487112; x=1792091912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RZKA77jm9kbpECwes2HBBFKfBcH0wMfdUgHPGsHOLoE=;
        b=wwdqMOcDBTD3DQEOWcF8UF4s7F1eYrGIvsD0lw22iTHFpTiPW3SuSvMt7UnbfIX+Xd
         ZpLgM1TNNDCJ3wAV4hnQr07QFgyz1h92FIbB3ZGRjUNt0iCQxHjku58hUD7S2T6SpbUe
         1NCFCcggCyvQ2hhCI1Z9COZbvFpykq+mnwBNziG5mLUWdRZldY6gSaR25BbbvIRm3ZQL
         HcmEO+QPJVRFmEL/YWtdFMN2EjuPdqJ7vyg9/H7jpWptpcrvWIXNayMvmju0oKO1hl+W
         triZtWguwDuV+tBa6IH6szwPkhU9FHu8MPokmzo0JtspRRErEIHww2RUlbJjJYCbws52
         ma0w==
X-Forwarded-Encrypted: i=1; AKwUvBz/dYcbPG7R9WF6zDhY5DTZlYxvtn0dqkVHhHlGQ5hdPrVR/XWVAshN71mJQGGbSU23wZ9P+uZ1UvZCAK88UizV@lists.infradead.org
X-Gm-Message-State: AFq9FYLgah7kq0/thnQfoxdBRlktH7alnyp71jmkVJU5n3x16kpyUWVG
	vrqSRgeO+agnfT8Rux7hPp8LmN5hFCwa9iWG+PZjfd0b6V+QdvWxNJdRsDystTjfbDk=
X-Gm-Gg: AYBFou3kAQVqG5cGsj70G3qqC2pFKRx6SA5Ofz00nSszR06f1b8otHTj1r/iifWsL9S
	FPF2qPFuN9M5lbQDQFy95Al+AeeMIu892gw3Grs3qYY0vpltW+J9kIqElTcFVDi51QsfUAtODyM
	j0N3YjNtTL+bZOGHCfcdIVeNRfCzVX9vU7dABjWd+6J30ekW9B/gVXxd6VBSJX2PO5do+2d5mfJ
	QTDKwB71rMBoTatgz8QVpt/c3mIAWXlGQzWJXSWyygXXY0REoWqBIL6z0DELKr21QtZlr/KmGtv
	qrH/v7CvjomdxBoPv7oauvkJeklK4T1NdqzoZsiSxWgCS4dQLvHTkjQ67GeGvcbuf8CKDtK814q
	myE/05XRC9L8bO/pVQnNwof0pwMBf4UA1WBWSpcGql/gD6lxxanQanwj6ULXAv4Ii5PzmA5FTE5
	XXcTQCEVth+bqF7iaser1BYHWS67NQjk+0jj1EH0bu7P+2FomnbubWTKiUjXOeaK3+tj9ITWJM2
	2yfjw1fOa/Y2tBZE9Zu+F4Diqs/lJluyjWVxnx6eLF1FYljM1Z4dN6ARC6tuszFsCZb4bo=
X-Received: by 2002:a05:7301:5416:b0:351:58d9:7d9a with SMTP id 5a478bee46e88-3515e0066fdmr8007040eec.38.1791487111442;
        Thu, 08 Oct 2026 12:18:31 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm117933eec.4.2026.10.08.12.18.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:18:30 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Marco Scardovi <scardracs@disroot.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	jay.xu@rock-chips.com
Subject: [PATCH 6.6.y 2/2] gpio: rockchip: fix generic IRQ chip leak on remove
Date: Thu,  8 Oct 2026 15:18:21 -0400
Message-ID: <20261008191824.98662-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008191824.98662-1-artem@trailofbits.com>
References: <20261008191824.98662-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_121832_457869_C213EA52 
X-CRM114-Status: GOOD (  17.11  )
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

From: Marco Scardovi <scardracs@disroot.org>

[ Upstream commit 1c1e0fc88d6ef65bf15d517853251f75ab9d18c3 ]

The driver allocates domain generic chips using
irq_alloc_domain_generic_chips() during probe. However, on driver
remove/teardown, the generic chips are not automatically freed when the
IRQ domain is removed because the domain flags do not include
IRQ_DOMAIN_FLAG_DESTROY_GC.

This causes both the domain generic chips structure and the associated
generic chips to be leaked. Additionally, the generic chips remain on
the global gc_list and may later be visited by generic IRQ chip suspend,
resume, or shutdown callbacks after the GPIO bank has been removed,
potentially resulting in a use-after-free and kernel crash.

Fix the resource leak by explicitly calling
irq_domain_remove_generic_chips() before removing the IRQ domain in
rockchip_gpio_remove().

[ Backport to 6.6.y: Use the upstream teardown helper on 6.6. Defer 6.1
  because irq_domain_remove_generic_chips() is absent and needs a
  prerequisite or reviewed target-native cleanup. ]

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
Link: https://patch.msgid.link/20260607230504.35392-2-scardracs@disroot.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 2 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-53226. The target creates generic IRQ chips
and omits their removal; the prerequisite supplies a complete teardown
helper and the CVE fix invokes it before removing the IRQ domain.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.

 drivers/gpio/gpio-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index e0e4f3ed5fdd..86cf3cbcdb40 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -786,8 +786,10 @@ static int rockchip_gpio_remove(struct platform_device *pdev)
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
 	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
-	if (bank->domain)
+	if (bank->domain) {
+		irq_domain_remove_generic_chips(bank->domain);
 		irq_domain_remove(bank->domain);
+	}
 	gpiochip_remove(&bank->gpio_chip);
 
 	return 0;
-- 
2.39.5

