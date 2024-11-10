Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CEED12D4B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7VSA4VpES10XaA8gB1WdvZsXgmDNfsDCe5+S5WIIkA=; b=U3xig51hCz0S60hITyBMJvXjDp
	9kQ44oxE1UrBntKI8cUoCLQL19rQohyG67XDb+ElhGdVEBt10zWbV7PwQWxBjqt3bI99PpR6PHgcV
	FEme9dsj9JDZ2AQ8Uxj6dh+LeuPBepdx9D5e2ixY5J1hBoGJXMMFWth0xqH7bRp1vAnuheoy4tCUB
	HYj404x5gNz6RgMMA5I1Y37zHDJscT0H5d88op28eV97Z6faY2VvO7uPnMEfkAHDuF28wbPsdqywj
	T7UYPwi85YO3upVgLl4n+HJASoG+TNf9fLNN8hAwXCtdBlbLWjMefasLR9UuDi0EbeoM64DjSy76A
	QKJqxc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tADbQ-0000000FSSR-2AsT;
	Sun, 10 Nov 2024 19:28:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tADXy-0000000FS2Z-0PDD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 19:24:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so48676815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 11:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731266668; x=1731871468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7VSA4VpES10XaA8gB1WdvZsXgmDNfsDCe5+S5WIIkA=;
        b=lVrq/MbhSDuqQPtxiZl4C2azwGj0VlCiEtdie470B7QJbqG7f3KCZp9xW4kTvypvyS
         8StF2RlMLjo9V9qAPqNurqd/9yGwXPNpr+lnsBHJBdx2Fzyh8mpku5r9Vqm6rTLEYW6x
         Cla/EKfjb8Td78jsI5JCl9GbCp0DMEGO42bJrf8ffsALpq7qa3IoiSANvwiRY0n2SZNL
         IIlVakAO/xFJbao2aOg7kaL6Aholp4J7t30lfqrWx/cMhxTjrS1VgCQenL7BIygYJzvs
         AGprbKi3BJU9eHr7EtuLOuBYvUgLZoLhB7F0aj1m1XM6Z0phzCc8PQjGksEYkD5sR0uH
         0FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731266668; x=1731871468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7VSA4VpES10XaA8gB1WdvZsXgmDNfsDCe5+S5WIIkA=;
        b=tjiwNQdRRk4iV1a/32pHotBNu7n+MWLbfEQHbEeqaVC3a2M/HFwCYJMEAdMZOzksxP
         lf+xHe/xjJUR3Vmm+zaEUx35fVeZKgMmiDaDRoBPRqS67NLQxvfsS9FWo4QttwaXBoH/
         HjI+iWM7qW+Fy9g6JXcLq/oir8lJ0H0na5G4U0ZbtkiOdakCvO3vCR2WekBe0+u5dDk4
         6poCeeELa0NpoEeNBWMhB4c5xQAQ6Yc0vyKY5BumHCZcuhK744JtDC75GPJ8CiAZl15T
         AVfsggy5z/546FIhOMMtT8md/ZLZMhpcVvdiLYezYgkJLP1TZ9gd+MCHfSqNFkblbo5q
         z5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1FtDl8CQiVIHrU5bRMWrio7j6caSS/u5H3YGb2RVwItBtXPpROdePu8I2MKvU3zsmQGXJS7hZEwPwGonauFPU@lists.infradead.org
X-Gm-Message-State: AOJu0YxK0y5NJOscyZgmhSLqvKL3xy0wefOIrsSyTjgVvURmwVORtYBq
	yxAKEFVDtZRAfO+jXmSWCqpdEAoBM7bZKoYnX1K06EOtRiAQLcv1
X-Google-Smtp-Source: AGHT+IGgpSw3jllLpv9qQZg4A+baIMwrCRGNX/rDvc376OiGzFy2u/Lnf48/wvV7+Plv5EMw7gqc9g==
X-Received: by 2002:a5d:6c66:0:b0:37d:47e0:45fb with SMTP id ffacd0b85a97d-381f186c5f2mr11167988f8f.21.1731266668020;
        Sun, 10 Nov 2024 11:24:28 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9ee0e0fabesm502497666b.174.2024.11.10.11.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 11:24:27 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sun, 10 Nov 2024 22:24:15 +0300
Subject: [PATCH v2 1/2] power: supply: max17042: make interrupt shared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-b4-max17042-v2-1-f058f7a16bab@gmail.com>
References: <20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com>
In-Reply-To: <20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731266662; l=1055;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=gES/YI8J+uY43qFcYFJFQDdZCjIIvFKdVHt8Cx7j4Ks=;
 b=hkNy7+sERWKdTJVRRUXl6kSD0hutXgVSx9H34Jeil05Y2fuKUhG/CScfxoHg1ESGkG6jYCRBA
 rN9iIrmtHkCCHftg66YAeKHeBlQNA7x7LKlJkd0nxvrukflRvAwcT+L
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_112430_172459_0FBDFA69 
X-CRM114-Status: GOOD (  13.05  )
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

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Make interrupt
shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/power/supply/max17042_battery.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 496c3e1f2ee6..99bf6915aa23 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -1103,14 +1103,7 @@ static int max17042_probe(struct i2c_client *client)
 	}
 
 	if (client->irq) {
-		unsigned int flags = IRQF_ONESHOT;
-
-		/*
-		 * On ACPI systems the IRQ may be handled by ACPI-event code,
-		 * so we need to share (if the ACPI code is willing to share).
-		 */
-		if (acpi_id)
-			flags |= IRQF_SHARED | IRQF_PROBE_SHARED;
+		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
 
 		ret = devm_request_threaded_irq(&client->dev, client->irq,
 						NULL,

-- 
2.39.2


