Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D901C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acq/A4AGzwAJdHPnrCOzGeerCbgW5JVrTLnSuWrfwpU=; b=wbeeH7cpmvTYx1hF5g8BwRLheI
	87i/Mdka4EUb66JYDZeyQtIOxPOeCcH4+I97zBwkY0WpgI1shVj8U/lPCxFo/ga3hNYkNdzaq/57o
	pKHYXOvo2UQnhv7MonPIcnOJpPjcmp0doxw3PdLQRjkY9cHacA/mC7pXbF8bGdGH9IIsQr32odjfa
	190Jhy/JXaeL9j6ID9vTsB9wc6m2IRolbCTHSWj2SGjWSaAFRx1TVc4KiF9w8IXvhY6SPcozsB5UC
	g93mjNI83oS8LWA01fxwRDz5UR3xtkM5+bJVdpstj3Sx8BvFSAZS+5xKQ2TqgAVc0o424fElNX2Tq
	nkYz7OEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16TQ-0000000AFrl-0032;
	Mon, 31 Aug 2026 18:11:12 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16TN-0000000AFr6-0Ijk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 18:11:10 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d8fd3b729dso18189535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199868; x=1788804668; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acq/A4AGzwAJdHPnrCOzGeerCbgW5JVrTLnSuWrfwpU=;
        b=KZ4KCmuivF4I6hv6z7cNIf4GPN7RcR9yDCyPz5o0szZtjhjJTkzJksGlOJPvD8/USm
         jM8bK64J+nW1J2UPpPsmiDKMviYs96oeA9q8JDQm5GCTMABw7+3J+fEeGFmOsXhV/pA5
         QENt2zlUs4F/x/J5lmJT+abS9j2v455q+hKaUTJrgYXdGgkw3LjKoOxM8ABLb5bR9xYM
         vuUdegOT7SBdawygRU19DxmNZRAPL8k/rXTDl3nn4SZ+T0zePlrgEfB/9JDG6ELpFORE
         BPruyETHmanSJCC2ciRAp+INeuuX1wjJ4hLD+J2X//HlG6FD5ZldW9NdTJheaZ5rEAPn
         dlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199868; x=1788804668;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acq/A4AGzwAJdHPnrCOzGeerCbgW5JVrTLnSuWrfwpU=;
        b=nHh1Lq6pWm84MPh7XkUizUZ9Pg7Ukk2RGWzfeAjLW9FnB15FwZxgWRZXO1ThDDjKv6
         vagrjIwky84GVjGUX/kuSPTKXikvITzb2lUuqna61GXbDQx3G2uqvAvvgHgPJzozYmhU
         GF+X+xEYCpZGFRMEuaYifRn4gyxKK74vPwEVz+NVhLYKCWCB+zPdkkZSSbphgMSHIqtX
         sfWNHKfHIRM7Xq/kfYnBLPGZ8oHH230adIoPJdGJGWlHsm18ILvajqlB7ERIy+YMBJWw
         NbB2NO+xRaq9QqT3wBu65JpPczztE2UcOgjmNHKiM7eU6GQeTtOJvQgZ9EufE6+i3rZy
         OJTg==
X-Forwarded-Encrypted: i=1; AKwUvBzq2Wrc+fgBnZc1Jwtt3Tje4GIdFdnM7hwTqDvJST7izxKackjzIZ15VSS2S13xWdeWDnLH79Ow8iMuYtaJC5mu@lists.infradead.org
X-Gm-Message-State: AFuF++m5e/FhAnJgdyetZGO1UYyETlcpp5ahPD+XTb3j1rHv5C26jRCt
	FE+EPerAIU/+PYII6YWz91QHurYmtqK6LtTllPmX2w/8vr5OrQKdxU0Qt/gjuDauSes=
X-Gm-Gg: AYBFou0SDdyXmbyVV8grdz1gFttHNgIGfR9AB0MkkiJeVyjka8nFkA6GGS/3jTZHsST
	5BFVKw4ddIWr/gvqKD3SYq14xA4fSygIkqSetmBsJQTHUMAsHm/gyNkKUqTrN0DPMskmDyqEEUQ
	8gTX8WeGiJtoDN0gPsOUZXQqjE9EeUOiTWAXfDLfdjljlXE2hkkI1jR4UKnlF2ofuj3MnhMwBet
	4uxkhJlzD2XSnndq001JlIN2m+jriLetV/9sGbLL1scyqfAgovjaR+Q2GrJ6ScQy6KEG88Zg9p3
	wchn5vvVPTrcwXVnQ9UEjuAPKSiv2kbdACUgF+k6fuUlbGse3+UIUJotmKZ6fdf11dgksvq9MPc
	6EsVgS2hLCPXnhS+nMXk8T4ip8yWeIXqIRY5j4XE81w2YZozdBTozGc5sazj82UXbhEeSfkV8g/
	OhHFLIwvJeMY9/vnoAR6VZMxULiL3vVLR8Po3BhGdMYunu5hdG5DoRBbPbiA==
X-Received: by 2002:a17:903:2286:b0:2d5:2f49:b3f4 with SMTP id d9443c01a7336-2d94a713d2amr28505335ad.2.1788199867991;
        Mon, 31 Aug 2026 11:11:07 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d90e6e10cdsm24043265ad.14.2026.08.31.11.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Sen Wang <sen@ti.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260708221032.1600089-1-sen@ti.com>
References: <20260708221032.1600089-1-sen@ti.com>
Subject: Re: [PATCH] ARM: omap2plus_defconfig: Enable SND_ALOOP
Message-Id: <178819986708.2869653.1615558663659219045.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:07 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_111109_115650_3CCA2386 
X-CRM114-Status: UNSURE (   8.96  )
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


On Wed, 08 Jul 2026 17:10:31 -0500, Sen Wang wrote:
> Enable the generic PCM loopback driver on AM335x, AM437x, and AM57x
> platforms, matching arm64 defconfig (commit 7235cdd9cc52 ("arm64:
> defconfig: Enable SND_ALOOP")).
> 
> snd-aloop lets a test setup loop audio between capture and playback
> without external hardware, which is useful for automated audio path
> validation on these boards.
> 
> [...]

Applied, thanks!

[1/1] ARM: omap2plus_defconfig: Enable SND_ALOOP
      commit: 9d6dc4125c110e19026ae0bfaa891fd357163d41

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


