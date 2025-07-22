Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968F9C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPsJ4CMcMe9NfhSzbVCOjzfDWB1kVY5Qa247gGHQe3o=; b=ink1+MxxYFKjz2tP+qlt98akDR
	8w9Rq0E46e/wFLPSXyiKFOYSORtuICk1GL4dN4GigSplCWWXzD4tvSjL+SM1h1c5gFzk4LMHYJGNZ
	NRBrYRGpGl36bWkutc7UnDLcog5XD45Qxga6tRSrMVoAOJcuPgZxLVRVbWQ5GDKvYK0CTBTLnC7q/
	s28NE3LwrBog3HF4n4gcijQ/+dsCBtq/z8BK9ZQ1wp3bitBQ7TmKQ0J/LCg8V5w+xVrekzLuIl84O
	XPtS/KI2B2jYv0iwkUpjr/t/zYWLzB0pfBNoq4wKES3ewfZ5uZoHogV8YjfQrVrbvE7kL/YCk3gVJ
	TBkMsAzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKcj-00000003WO1-0l6c;
	Tue, 22 Jul 2025 21:34:09 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKXk-00000003Vny-0Knh;
	Tue, 22 Jul 2025 21:29:01 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso5933884a91.3;
        Tue, 22 Jul 2025 14:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753219739; x=1753824539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPsJ4CMcMe9NfhSzbVCOjzfDWB1kVY5Qa247gGHQe3o=;
        b=L6+LE7ebXd2indS7gntbMKiSbjbDWQfdnaMxdr5O9uTJNSP3JPmJUNv+6ZqtDgCb8m
         jZrMV5cXIjFOo1tA+paXJXizqccIbgJTr0LyNa8S69dD5Qn4euscJHQRdZ//vIDEc9pT
         G2HluMBMSv/qA+rCgbTz8E0lJZyVeyv7Bl7uNkEXBdZlg9NU1E3oAwTZw72xlHvgRx2L
         FtuhOfL3Zq/XfpM7zXW/AriLBzd93qrpOtwcUchNtuC94Bu0pVVuDosZK9/2yRA9I897
         0jyFSFv4P6LTVOSCcuTb3f+eKtDjO+dzAXxSveEKFeL7BrMmdaKqnvhAJxKgIUQ17jTm
         PxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219739; x=1753824539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPsJ4CMcMe9NfhSzbVCOjzfDWB1kVY5Qa247gGHQe3o=;
        b=qDExv3uQHpVFt6rSEj5ScaFX6s6NgYV1F4rBNnPH7TZOGQN7hHCBMZEUU9NgohsZfp
         2kwnpoWL9uRiDMhpuOBTq3bNZ/XD+Dt0/f4WNW2dJWvl8R3kIH2sWU4P3oWaiNV8x3LW
         KkmH1c54Nuh/1jZPDyU1rDWv1GMGcoRoQqxYT8KZXBYWq/2aeM9fqp4kRcdXcvsuqpRV
         dka90WkAuikGDc/x4QDwtazTl7qsTHV/nXU4XdlOc/8XwSUA2kLMNiEcu1r/G94uNdWF
         dAywm4+Akd0hq3F+OfsWTiCx1yUmLyTCiuCszg7s+tTsqkt2YwnuPXBUsHtUuL88+1Yj
         yHOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIlyqtCXDeP+fGsbjIwv7FkMn7geW9lm/7EXJFxH2gGa1EYmPgRTGw4953JyoGvqK+Q7EI+n8ZjgsrAkNNQgM=@lists.infradead.org, AJvYcCWHXUdS4LoJjxsajcth6XHHcE05wIwnutQw/eEZDmIpEcIWt3iC+eISZVUwMMWmaUo2tnu9o39C/9dAZsTkoirh@lists.infradead.org
X-Gm-Message-State: AOJu0Yys7xIddaRVArqNO1yR/bactL6JF8yjgo0a4TORL6A7t21nC5wk
	lqXkCRetLNLWY/IPhx5gU61TTLs/Ga/ZE5Z8FG4in4NPoGMyphKPyhIZ
X-Gm-Gg: ASbGncsSVJjOoQn7g+VEVUEC2dBHpjCxf9DwmkPq7Fn4d3tKsSaNbV+j8ZfMaW6krBc
	LvwggxIESaZ+Wbwbvy20iuWwe+B10yxaf/FdGTfBxyGn0GmRphHUptvykXM5C3LP7U+dCcLtS53
	XKbNJx9xEIROAKb9sqBy3Ro82j6qleuz8RM4OityUC+qeC3aHWeC0YxKYwaVAHk/V5f5dWnbxAn
	P+28rW/eS5aP2+zoDzzX892dT1wsDHcQXv2SuMs7zMlUsAYuYint3rAkn/rDWOkAV2YBzgv34Xi
	iInIpn2Aq3UdqOsRFFmyyCylICcKlm1O9sgeIneyxJkIj42C6PvEeXWa0d5bzPKypwG6yJz+evZ
	6OuFXjOa5SvB4qw==
X-Google-Smtp-Source: AGHT+IEbbYJBzvZDQvAsIkV3QlZ0kiIfsWL443r6EXrQLyZIxgWxL6sqZ7lB3fbfVSpJVV97L3dmqw==
X-Received: by 2002:a17:90b:47:b0:314:2840:8b21 with SMTP id 98e67ed59e1d1-31e507fe4femr824094a91.32.1753219739276;
        Tue, 22 Jul 2025 14:28:59 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519ce384sm94942a91.2.2025.07.22.14.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 14:28:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv5 wireless-next 1/7] wifi: rt2x00: add COMPILE_TEST
Date: Tue, 22 Jul 2025 14:28:50 -0700
Message-ID: <20250722212856.11343-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250722212856.11343-1-rosenp@gmail.com>
References: <20250722212856.11343-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_142900_120630_9394C603 
X-CRM114-Status: GOOD (  11.86  )
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

While this driver is for a specific arch, there is nothing preventing it
from being compiled on other platforms.

Allows the various bots to test compilation and complain if a patch is
bad.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index d1fd66d44a7e..3a32ceead54f 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -202,7 +202,7 @@ endif
 
 config RT2800SOC
 	tristate "Ralink WiSoC support"
-	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620
+	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
 	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
-- 
2.50.0


