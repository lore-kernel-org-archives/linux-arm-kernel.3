Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE71FC5910
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkELXJ9KhXHMT5a1efTvXnueLkeN4tzHP27QeEGUl9c=; b=fMFuBh4bySxe6vjffqrUZzcMdA
	C0Lx6Y8723S+olYIgBfLnvjRuEDsQPMRbb0HRkedGtDELecsryvDFI3ML0pAN3XcigRMa+fp+PFqY
	FRYL4pL0mG7U+XT0+XOVKiUao/HBO+lZ9zulxzlcfO8wm8g3Z1Pg5pAD/CBI48G6ZQj2sAjRwlb1X
	WPdfYJQyDomb7BSWxu52ngkVnJ6tF2YLyS8VJrxpg9A/3WOyHaIdvDew3g80pBBQ0pYHiCiMHPHs6
	mw24vemIi4Yc/Hy7VnDtOBiMNjKbl0r+5H17g2Fu/lqTr6sopzxGviSFsce8X3pdW6M6LX1lnVWPJ
	OZq57Cjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYKb-00000005rJS-2IKh;
	Thu, 26 Feb 2026 10:10:53 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYKU-00000005rI4-3Y8n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:10:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-824a829f9bbso391040b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100644; x=1772705444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkELXJ9KhXHMT5a1efTvXnueLkeN4tzHP27QeEGUl9c=;
        b=bEETp4FXE5Y9lqUGA+23vKDNIltflaJpvoLQHPeUSvqVmV86JwzFJ9ssvGLb+R8hrr
         qnu88/Hb1PmEgcpbYGRuGZE/6sny3RM24IYLMhUu8uY0zD78bMgoy4NbCWtLVsf5TBmU
         qNvoLeUEFr96rfe5nE95bkXyVw3LhI0sXv6ut6MfPJBIuYGT9WvzbjTq51hMMfw483uJ
         +lifg8B7qm97kUcDOsNlTHgzsxDO4NNuSwC7wi4EeTkafNLvIxrCuj3n/aPEQxORUuk/
         RuZBm5SyFvuyG2seWLhnnD568CLf8RntFT0JTOlZmBCCqxT+/qfNfkcMSofCLO8SE165
         vW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100644; x=1772705444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkELXJ9KhXHMT5a1efTvXnueLkeN4tzHP27QeEGUl9c=;
        b=ZTXFUCT+xj523uAshqAJPNWrHTzS+vVKC/JRLPSlvF38yGFxQ5+szU+kMkzYNbfhiJ
         u8e1Q/78FBK4YiHWB6SNZsWO+nr2TOtmOUP0yqwXiKoD1D5mEdvN6Mcn3pV3N6i6C7f2
         Bw4XCSXFli54L26kjmyRd6U5YBFc797sNvL47paBGL+cRPCHj+m0KUPyo/9E6dftgO/a
         S9MCKQ2vFPV+Pdk7oyL5jg95Ke6xz6gSL8Lp/H/oyJ5dRsA57nKfykqDyuvePy63ePMr
         PQMHG4yv+j2uK96FFyLcUubyw5G4X/Uy9tlFoxD5JyW6rUni6gp6ooJo+ISBuh/13qDh
         JWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8nUAUlKEVvpRp/IlQ994WB3jZS589KLa90nWWnA4lwNO3Ot4N/jpbXVteyOhWUX7vTNYMzQR3DLlk0l5gb6LR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7gm5eaihao7OYR+aUW1QFVeAaBmscV/Uda1CWRDTwO6bUG32F
	nXZXcP7KS/MJQ6lZgTJI86uT1zn5TpqQ1n+TlY7H4cYrABcOEAcDQUIK
X-Gm-Gg: ATEYQzxRgXo8TK9cgOISX/HhBbAigyy9ExZErxLAEXZjszutc7SAUC9HKUzvFOIAJ6V
	hWzMeHdihqs00yNeWeSbTS+cl11y5Ca12iwIxOsIEZQm6RoF9ZcqoAZhUnwqyYZ5RtpZeJTHIED
	vS1HFMq68h6b4DhGNygIa7oKJwDrF1zUXu0abftPGCqH0ZN5bKFOeCxQ4wb2+WP+Zp2VtF49KrS
	goq0EritAeTYAAhD9iIKMH8e0oS1MfsvgXIrM6UX48Lj4TL+L1XBU1K4AOt7frDe5cZCeqxaDjw
	cdivndRb5xzJAymXt3gieQ48HmuOhFNATPTpvVFEIblumNw2eDqQ2ViA4I5Sms8OANh3uQyRoJy
	WCdiDga+eIBXEWkbjLGrtZj+aFMFQ830kQtc8ADcMqbo74Dny5mtO/Qc+6bkW3lbIK5Cr5iS9j5
	0yQL40RtL7xrUeaFzaKPY=
X-Received: by 2002:a05:6a00:748d:b0:81f:4943:b853 with SMTP id d2e1a72fcca58-826daa0cdc6mr13672752b3a.38.1772100643876;
        Thu, 26 Feb 2026 02:10:43 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739dabd43sm2252704b3a.25.2026.02.26.02.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:10:43 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Hans Zhang <18255117159@163.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	linux-pci@vger.kernel.org (open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Grimmauld <grimmauld@grimmauld.de>
Subject: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Date: Thu, 26 Feb 2026 15:40:23 +0530
Message-ID: <20260226101032.1042-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_021046_904175_567CD4C0 
X-CRM114-Status: GOOD (  13.98  )
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

Rockchip DWC PCIe driver currently performs synchronous link training for
combo PHYs (PCIe 3.0/2.0 and SATA 3.0) during boot. This process waits for
the link to be fully established, adding several milliseconds to the boot
sequence. To optimize boot time, this change enables asynchronous probing,
allowing link establishment to proceed in the background while the kernel
continues probing other devices.

Cc: Grimmauld <grimmauld@grimmauld.de>
Cc: Niklas Cassel <cassel@kernel.org>
Tested-by: Grimmauld <grimmauld@grimmauld.de>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: update the commit message to describe the changs.
    added tested by Grimmauld.
    https://lore.kernel.org/all/20240809073610.2517-1-linux.amoon@gmail.com/
v2: update the commit message to describe the changs.
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 5b17da63151d5..c31e0e9848327 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -746,6 +746,7 @@ static struct platform_driver rockchip_pcie_driver = {
 		.name	= "rockchip-dw-pcie",
 		.of_match_table = rockchip_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = rockchip_pcie_probe,
 };

base-commit: f4d0ec0aa20d49f09dc01d82894ce80d72de0560
-- 
2.50.1


