Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74943E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cCKDCdLduuxTbyXO+mGfzeUXEoPy32FEPamUcSu9flc=; b=kRc8RirYhnchm3
	sNXh4wmt3zNkd1GaLk3418m0iLhdaSRQ63gZIMySmolgWv9PaDuhYVIALYNttnOjypxMH4WIrfvr3
	WKiMADeNdx+uWWOCbTWtUVyY1XxVW8gsVPWEKe3dKppRqKA+mJeKoG2K2KXAiCKRcaDHwYS57IlPL
	yOWbq1HjdxhSglmeBCMTV1yrk1dZylERHU8T5ENMlgIQlE0FZh9PdRk1zFa9XdtkzsRHOe0hg/EJu
	7FJNl65UFy7HJRjZ1E3HSpwKHhCUXG5ulX+soH52pMiJH2w6GWj59weV+dRrKD4XzIcYBF61IXBY2
	NLXlsn3NirPNnLzEcMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQAkd-0000000CgL0-3NoT;
	Tue, 24 Dec 2024 19:39:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQAiH-0000000Cfuq-01zM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 19:37:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso39066175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 11:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735069023; x=1735673823; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cCKDCdLduuxTbyXO+mGfzeUXEoPy32FEPamUcSu9flc=;
        b=Cc1oB6kuBImODTrGz3jgrco1G19bTYP/Id4cPnowydZhmD03N36cO9NMjbU8QJnuTg
         qVoPGC0QOzk/vSgjkdTOUM03UqZprU3jDJ0yHpQ678lyJgAdjxtSv7tvEWhhxww/D4IA
         maATxWq4Bf23CTjXHMXazN6CqfZsi7Vc8BuP3X/YkjjJmKWv0hwolfMBYe6Qp+HsjYEG
         tbBAqcZx53ZvmjTyyWeTOSxnnXyBM568XG7eubidC9kw0VD/lht/j0X61TyDC7iITLNz
         F+slFuqu7uIzxM9zLsS/BzKUkQ6pgGfZaFQLIvbdeBgHPGWIsPcIJzuF6yims4rx8cTc
         mVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735069023; x=1735673823;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCKDCdLduuxTbyXO+mGfzeUXEoPy32FEPamUcSu9flc=;
        b=eGvRY/9fG5cyEtqLF1jdEY2uz07sQxbxEP9/KqAPL6YCYCRNtEEOqaTwhfksxlZsuf
         xKnzaXBjUsQf6X10X+eg+ZAJdnicfBxFPjWD1jXir84jAZYJkpRnFq7ktjn8L5zxFCLX
         2oZMBr7wswDMl7u9Z1n651fUUCz4inaBukFQrmgz/40oYsjwTn/HbEFCj+zwcmbcyaXj
         nmPqR7ivnWaRYMV5OM4F5iFxH4BEp9XE3aSdeehzh1f+spHy5gZis9fXGcFmZKQrIfke
         t+1D33oaDra5XL8Z37KTXflekkuXaICBxLw4fTNJKICutn9NIna4DAnqMK/QYWbi35C8
         r4ww==
X-Gm-Message-State: AOJu0YyIsWLYyL2OSrSZxnBfS4H/5GI9g4HZs+98YZyitqw6BR4/7e0o
	0xbMRFiF0R8TgzQIG4KTw4ZpoE/xd3HEcK5W3NwbMpCEp9CNGAThwBPw/DHUXVs=
X-Gm-Gg: ASbGncvqNoc1sEhXcZh56db3jHX3zte+Pmu7NzGKACpH7u20dNg6I/I4sf46Z4ZNUIR
	VsUk5nKc2F+ZUsrL+zPfNoSJHf3kMAlJ6aLjSUgeY7TZ1gL+XHbEYsg14UT8jriq1nst+L0ZYXT
	BcEdno5QBAx4+y5ERNqML+LSC0XDvrFveuiW/UqAzSGLCxTsH7sPEugFQ0rTZsm6QLibZ2kf3P0
	qOxYkOkxGpcdXClrdgWS/zvRXb+Qe8EwU7N1Y4meVa1Vrg3RtnPtreiVLB0
X-Google-Smtp-Source: AGHT+IHELzD0vVoIaJ7cbxYLo6d4zDZXt6SoDdWKZCxzY+wDjcRsiwyYRIjo+kBacgXTLHQgC2AO6w==
X-Received: by 2002:a05:600c:1d25:b0:434:fdf3:2c26 with SMTP id 5b1f17b1804b1-43668646362mr148614275e9.19.1735069022552;
        Tue, 24 Dec 2024 11:37:02 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:d40:ed60:c48a:f4b0:6773:1823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea4a7sm175691355e9.3.2024.12.24.11.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 11:37:02 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH v4 0/2] irqchip: Kconfig: Add module support for TI
 inta/intr
Date: Tue, 24 Dec 2024 20:36:41 +0100
Message-Id: <20241224-timodules-v4-0-c5e010f58e2c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkNa2cC/23MQQ6CMBCF4auQWVvTKdWCK+9hWBQ6yCRATYtEQ
 np3K2uX/8vLt0OkwBThVuwQaOXIfs6hTwV0g52fJNjlBiWVRolXsfDk3XukKNBoY6TCi3MV5P8
 rUM+fw3o0uQeOiw/bQa/lb/2nrKWQorcGZY3WUV3dW7uN3AY6d36CJqX0BTJ10hqlAAAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 vishalm@ti.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Nicolas Frayer <nfrayer@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_113705_222914_180ABBB8 
X-CRM114-Status: GOOD (  10.90  )
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

Added module support for TI interrupt aggregator and interrupt router
drivers. Default value for both drivers is ARCH_K3 and the interrupt
aggregator depends on ARCH_K3 as it contains 64 bit only ops.
Tested allmodconfig builds with ARCH=arm and ARCH=arm64.

Changes in v4:
- Rework commit message and title
- Add depends on in Kconfig frivers
- Link to v3: https://lore.kernel.org/r/20241016-timodules-v3-0-fa71091ade98@baylibre.com

Changes in v3:
- Add MODULE_LICENSE in drivers

Changes in v2:
- Added depends on ARCH_K3 for the interrupt aggregator driver as it
  uses
64 bit ops

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
Nicolas Frayer (2):
      irqchip/ti-sci-intr: add module build support
      irqchip/ti-sci-inta : Add module build support

 arch/arm64/Kconfig.platforms      | 2 --
 drivers/irqchip/Kconfig           | 6 ++++--
 drivers/irqchip/irq-ti-sci-inta.c | 1 +
 drivers/irqchip/irq-ti-sci-intr.c | 1 +
 4 files changed, 6 insertions(+), 4 deletions(-)
---
base-commit: 8faabc041a001140564f718dabe37753e88b37fa
change-id: 20241016-timodules-174770215dd8

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


