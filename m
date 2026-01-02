Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C44FA3753
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoXLG+S3woHWMACty+9soasUgUY3k6eBEUtX3MmJTN8=; b=3Zulq3uCnKo93H1I/1qCTcBFMV
	3sSVE+nL9pV0dF4V2r/pPFb4Ai56bIy1/3Q+xJueI+n8YZNZeKL0qnuYKaWMA2o/l5nYXAV9l+EF2
	YlUrHnIXOY5jW0162fHeEcu8rhVUzfVjTuRFiPokYUSLsh0lNlokEIEsdxbJ942SueYEI3X9ktr7v
	43OpujEcgYgkfi3A7QMBF0NYd93zAR8kHUKPaoxh1KzGvlkDytF9y54JgR9NEOjgaU1MYWLfMaWR2
	W5T+RKqEmupN3nO658cmq77oP7o2L9L6nGngcsb6UxFXgGqiQxiD5HMGOkLozkvyj9zz/GYqllA4o
	UV4SAClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjSZ-00000008b2E-2h6z;
	Fri, 02 Jan 2026 18:01:11 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjSX-00000008b06-0JOC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:01:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767376841; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=G/bZ9LgolNZ6iD9eYftg1cYifZztSuTGzlbQYf/gRzPPTEB4K0dji0NC4OufhSS/RI
    Rgdd834RwmFrhwWgoc2SFpvE2U+2CXXgAi8OJjssMNTNH1LqJWd5eQTrYNxtIxLMtSl5
    A0ml7CjL65rqshSxQk4fxzjDxfkqDYQB6qvUrVeujWqJAXquKBzMwmJinD2fELOmapX9
    cnBLAz6S/TNPrD0O2Ybwj+ML5d9IIBvTwWw/kacAt5fVnuGY/y50l/+hks3bzWXH31lg
    kAeiRKjnQWW5hRO643YSYUhoot0cTofRMYhvWmV1eAEHgwRBs0UvZNa06VbW/cFq7RD9
    VzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376841;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=HoXLG+S3woHWMACty+9soasUgUY3k6eBEUtX3MmJTN8=;
    b=hqVIinZ+kmvcFbOOpxShkYvyoYsptEQ6xgGt8d9JSWjukYBiNCTyQmJAYI9Tb4mLiM
    Vwm/tVX+Pih9png+/GN57NuwCjDcNh185z9nwNq24T7c8dxaRe24NmY5IBTy0YLVyX+7
    RHrl29oladySufWeuSzqSxCeVZ4L/3QWpaNm8g5NeNQ4aUGPqURQucQTTvGkMnFFXnJp
    eBfZn7vPEY4MFNWKIgEIIvWthlKZs2TivrADfpxJq3IcTCwr16cW7v60xfqsbbPlQYcO
    aRwduI8VL0/7J1V+FZjs7H/g/NUT9QNPz02yxuhAYfq0Ct8ayuy1syjUnyV8xfvyMawp
    7gSQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376841;
    s=strato-dkim-0002; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=HoXLG+S3woHWMACty+9soasUgUY3k6eBEUtX3MmJTN8=;
    b=nNsRIOVhoebVVnt3q5Hk3iU5STmfqXogSAkXAaqMFfPq9Ex1YdigqJLBgLlGzaO0Ns
    8TYKSMX8yJienT/+dWb2MzVvDw4l0R4HqPWpnYmCwMC4J59/ziLXj7WVoh5u1cG78EOI
    5d58i0DL5BeSzYFkJmAI3pG5cLo5D/QhZD9RpVmC9E+CZfEBEfRZdxNpmdfRA5zYe+Ct
    eHhDe4D8MaV03vmd9W2YowPSq/9XG9BGWlqy2MNCwGGbB2uUXrylsf9FZqrKdxy1fGVH
    4RWy7d87BBtLWIX5QorBxbzMjL5ms13LxeHvMdWEmX/3AyR4Y4MN2clh+r66MuiaLThJ
    Qcuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1767376841;
    s=strato-dkim-0003; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=HoXLG+S3woHWMACty+9soasUgUY3k6eBEUtX3MmJTN8=;
    b=vWa9Yt1z41VxjDSoK9P9DpC3PJD2XSKKomvF3F7ei6cqFD3i7GBxtngFqoeuTiNciC
    x2xrjtAs3gUnrSEKgEAA==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQivJ4sfKeu9QyRDNI="
Received: from Wablet.localdomain
    by smtp.strato.de (RZmta 54.1.0 DYNA|AUTH)
    with ESMTPSA id z0d4ec202I0eEUC
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 2 Jan 2026 19:00:40 +0100 (CET)
From: Josua Mayer <josua.mayer@jm0.eu>
Date: Fri, 02 Jan 2026 19:00:33 +0100
Subject: [PATCH 4/4] mfd: ntxec: register battery subdevice.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-kobo-aura-battery-v1-4-501f2a8fa575@jm0.eu>
References: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
In-Reply-To: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_100109_261593_5C7904DC 
X-CRM114-Status: GOOD (  10.03  )
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

Add Netronix EC battery driver as subdevice.

Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
---
 drivers/mfd/ntxec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/ntxec.c b/drivers/mfd/ntxec.c
index 08c68de0f01b..d5059b8862aa 100644
--- a/drivers/mfd/ntxec.c
+++ b/drivers/mfd/ntxec.c
@@ -139,6 +139,7 @@ static const struct regmap_config regmap_config = {
 static const struct mfd_cell ntxec_subdev[] = {
 	{ .name = "ntxec-rtc" },
 	{ .name = "ntxec-pwm" },
+	{ .name = "ntxec-battery" },
 };
 
 static const struct mfd_cell ntxec_subdev_pwm[] = {

-- 
2.43.0


