Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E18AD25020
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AXLLlxs4qW1+ZesmiLUyjALqG1DyG/LyhBi2azmiHI8=; b=oH2iy1rkanzmiPB5LwK4usIP4D
	ZKFKob1RAzsaSiTbZ5/DmfvBz0u+4lhOAC+3zX8BwjUFVp9YAfnztqWlp1y2S7qV7/ogJPfodnhEC
	ytGeGx7SSD+UL3Goe3QqiqwwFrOtT/Wz5/L8L+K9IEwqVQj2rQ5dotPAU/o/Krc0Tc1N78K8fqHSK
	YCI2xrcGAMilav0thvfqwZbdlK0uEmqJWoJIoKDSZziilT0pDChPJ4ZPuaOPAJ3eDnrC7kYlMOOyd
	hfH7TzAx4HAsMp19X0/ulXHeAkfK/ReUlMsUmvx6DQhONpW4FZUod22hgDd6nB77r6KqfAmJ9YJ4T
	hQKzz/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCa-00000003ebJ-45cH;
	Sat, 10 Jan 2026 20:04:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCY-00000003eah-19I3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 20:04:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so8077493a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 12:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768075484; x=1768680284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXLLlxs4qW1+ZesmiLUyjALqG1DyG/LyhBi2azmiHI8=;
        b=hDptILyUhAXjepyUZb5QuR5rGxfQ8N0UDwp6lmFL4AG8pTxXWvZ58OhXcrg/1gDBmb
         tpPBKV5lh67xqywSeXKEoAUY86krrE8wDnveXNOk/K+Hjlt9SZV5zDge88P+9b6k9Grd
         FsROyqcEFU4KM5NQfI86XlqTarlrTiWIeoAZH/9lrIfxBd3Mn0TML9Phy2VK6tJzx1f6
         lp3oj6nCfdelrccdI3PIFjgTQjj2KRBkoRYGW/Ke/8PmJAePZ6XXobVg+aIN65NrMTDz
         TraUrT+M79vt9Vl9HGMOGZv2w9ysqPv1YRqPiukXRnO1jyAFA5g5SkreORxLd/f5H/Oz
         OSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768075484; x=1768680284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXLLlxs4qW1+ZesmiLUyjALqG1DyG/LyhBi2azmiHI8=;
        b=bezaghpf3JPliTH1vMkIRj+oP3PROkHGo9tNN0GNunpjtiVmdPo1DG3QvCkSSgFMWE
         +VWL/WIWbI+6A0sDDQPEiwSvm7UlyVTK5tFSe6U62+D+ul3XH0kqi7FSD9Olp2VCa9SE
         HVMGh7Dg+h/i8rR+2Ufrrz9VLojnI8Y/+SFX7Gd76joLm1QSWmOgKP+usMoc4XaFjf3Q
         tXI54zkqW+S2yX0ko3l3Bydrh+VWmy65f6gu3RclHUuW9ZcfJ5oBwhxL46xJ7+MBi0HW
         2wmJyAyqiCnEDMbLMNe8PnlpLlk/RkvH2paTR+LPb6KL56ppX77mysYgPL/vQIc9Qtol
         ijZw==
X-Gm-Message-State: AOJu0YyfbSG/JB93qxOScHbyXM0UDpGHkLqrx10YORguq4+UPPdQYLOC
	6D34cv4ggy1RVpLzAbwJzFtg7QEoo9dB+QHxApScAzS2xu7GN791PHkd
X-Gm-Gg: AY/fxX79u+oDXSYXEHMGgGFGO34bwmLE+6hfPlwhTM0FuMHUOrB7gcIruNqTnc8o8NM
	7rP2JAYpc+KDxCL5UJJFBCtyLjpghEB9V6AmsAaoBG1kk0p8XLLyq1olOByBsR308KMnuHIna8S
	NqOhQ9SgI8meadXNtWxYTq8WbMFxdGRgPJrcAzu7KdubfVWdxOd0bh1c8CwrR+HGR6ktlqLnV1P
	rnCw8tm8cl6grSvvZhzNZGQA1BbCPWKWxMPuIYl6Rw0fUcBINBJ9Xrp7FIsug5ItM0J5S0dYSNN
	ykX2iUqIF6ZwNdKHwFEu3xMpyJI98jtB6rfCLMrCXFrn264Y+gPqB0GGv2rD8gEmuICoX/6WR8W
	92ye1Wl1om+L+RTSL7bT8a+6sknuEym24Ctxktc/wsNgFlVtzPcVIkfpjkXzQJh6miNxj7WofnI
	aXXjGzvA5csguI1KmNa4ae/WZEdwfhZ6val+yZ/qwYmc44miyWotDf24GqtwLwL8Q2RxWVI6kyB
	ABBFNYMsrl/mC7IsIMBvjPAEZ+tSriS+GkMw5pyzZ8=
X-Google-Smtp-Source: AGHT+IFIiQoUtSeyn9mIBbOOpJhcZYBlr/ord7EW8wnXlRpW5UAw9sYZWgIe46tbc0kW+YaZ+jiBYA==
X-Received: by 2002:a17:906:fe0b:b0:b73:6d56:f3ff with SMTP id a640c23a62f3a-b84451d416cmr1398267566b.20.1768075483987;
        Sat, 10 Jan 2026 12:04:43 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-af95-6f00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:af95:6f00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a56c552sm1483591066b.68.2026.01.10.12.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 12:04:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	adrian.larumbe@collabora.com,
	steven.price@arm.com,
	boris.brezillon@collabora.com,
	robh@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/3] Add Mali-G31 GPU to Amlogic Meson-S4
Date: Sat, 10 Jan 2026 21:04:23 +0100
Message-ID: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_120446_328685_4DC306DA 
X-CRM114-Status: GOOD (  13.15  )
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

This series add support for the Mali-G31 GPU on Amlogic Meson-S4 SoCs.
Overall it's similar to Mali-G31 on G12A:
- both are using two reset lines
- both share the same OPP table
- both require the same power override quirk

The main difference is that Meson-S4 gained a second (bus) clock.

This series updates the bifrost dt-bindings for the GPU on the Meson-S4
SoC, wires up the quirk in the panfrost driver and shows how to wire up
the GPU in meson-s4.dtsi.

The .dtsi patch needs to go through the linux-amlogic tree. Would the
dt-bindings patch go along with it (to prevent binding validation
errors)? If so then only the panfrost patch would go through the
panfrost (drm/misc) tree.


Best regards,
Martin


Martin Blumenstingl (3):
  dt-bindings: gpu: mali-bifrost: Add compatible for Amlogic Meson S4
  drm/panfrost: Add Amlogic Meson S4 integration quirk
  arm64: dts: amlogic: S4: Add the Mali-G31 GPU

 .../bindings/gpu/arm,mali-bifrost.yaml        | 20 ++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 49 +++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +
 3 files changed, 71 insertions(+)

-- 
2.52.0


