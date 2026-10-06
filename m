Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA3ACA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J8q1Zp2FdwvzE5fOrPSeuvqoT9vOFY1AG6osvW0MSLk=; b=UkGt3v91IQc60N
	rIzMwpiHy928lbghcuPRrq3dbIbmVTVfn/a8Ja3dvYx5v2pcFvLQkN5K2svsbERIhTFm51uEcOwZh
	BbjDJ0w2PEug7+9Tn5lhogexb8GqHnZ5YDKvjhGAWTwOX5azQZajHLPWqbWhGFw5zzFa6Wtumcw63
	3sUvtAS+aVU0d45IVZWPIXEv+EBsrvuqmymXYM7un7VVQwNbCKGN//fwm5uq0C8Mzq+DAGBKQ6tuq
	q1LVQK4Fa9EaY7yCt4PDxaxT5W3s6BhJdzaRjloTgKWoJLDC82eDR8DmjZj8GEVBCMD+y4XmTgTzB
	JP2GJIc2LCWOkP7r/bYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7dC-0000000168y-2iLk;
	Tue, 06 Oct 2026 16:03:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7d7-0000000163C-2RVt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:03:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a01933b584so8166255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302576; x=1791907376; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J8q1Zp2FdwvzE5fOrPSeuvqoT9vOFY1AG6osvW0MSLk=;
        b=PTsuQpjr4ZUSTZd+q5xR2gv1WrT6FlrOtrovBSoDZ56XyyK6WM69lx/n59+X5ULznu
         Aw80mdRLLLmbT8Jk1j9bIBmLOn07r09EXzvdA0QXRMwCtJhfpbCrxdblHEF43hD6Syd8
         uetErdIhUcLv/MCEDPVDyU0pHsfqIxDJy3B4Si8JYMQNWhSng8pa4Ua9N3UWOFYiOmOt
         C/cHNp9ChVbLJdVuXmNfop+SOlhQ3ztVCA566MhuNTxpiSNDXQt7r7QSL0LlNJy1bP9n
         cESWpjKraSjJ2M0QNPG2qpGmwWjLln+yOx5CXSFBNDi2X/b0o8xUAc9sTJ3RvWVUBPAh
         GgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302576; x=1791907376;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J8q1Zp2FdwvzE5fOrPSeuvqoT9vOFY1AG6osvW0MSLk=;
        b=Bv2/mrArD3fNf0Q2Ns6v4xrdp9ToU14uwLIGFS79+LcZrHFLQpZ4dyWonsrEKcOokj
         fM+1n/GfHZQZQ3aNRJXhdYpO9grvxNurNC56z4hqG5LyM899H1VUl1q1fFWHgQGiRnDK
         +6PfiKw8pAscyvCq2osZQHJgs89HCYa4VYfb/zRr8XeHK5bqTZ99H3gGMqYCajQXwa6S
         sRQDy+LkM7EIDbxeaMqWjnBVqegwcBZ+iwhdFZkn7Jt5p5aDgN/XK9VUGRJtSEwIFVDy
         acUntcVWf4o7UP3RQjGN/ZXRyuTIcxYykVa24xsmQJ9B7ufksQas4+ITNNp29Zo/G8NU
         L8aQ==
X-Forwarded-Encrypted: i=1; AKwUvByNMKOHwHTW0fchvydeJnf2lj25H1A+mTynDiPxQI8/CbeRxWrB2WbyN5e9SYiDBAhGA/4gKXX6ZSx66uDFKznW@lists.infradead.org
X-Gm-Message-State: AFuF++mPNruGImoBONufg7xeLEia+NAGPuywNRGnKPDO6zWBE7um5Psr
	DDnqiKmcsE6z5H7eW/StDxiszZRSmPavM63w7EyWT3pahkfE4ngK0xeWoBtaIByTXXg=
X-Gm-Gg: AYBFou1N9kXBhSa/W0J1Dy/agLGgcPkjiVPWXoUzj/1TKiRaMFkzWY8bmOaLi8sLy16
	0JV3Sr8zVJFEnwWYAL1dK+PSiDlpYXN/fi/TG5F0zz8+Jun3VqbvWIzgsIxaMggPWAlYaMIz4c+
	ZOfuLZVNfO8DXWEx7FGYLLmf2L38dYtmZkm8rYhUnN7eEwAWU4xCzcWT2r6K+YrxJDIR/aDfIm0
	1apLbHhwSQpsFpU4+S742XBjHTHFYWl97NhgdDO9Lhu0twRfAY5KMMi0VrdAHWxD+6jh9KuDZw1
	2FlME1g5vnPs0y41R1XPHQ+VurBd4Kc+4xFxt8bLOdk/OibA2BqAev+E30n+c5+Ms7wtsolBoe9
	JTI5/V1aLuQ6xYn7KR3qxfMAd7hl406gfKz6GAgrg/X5+Zid1AqXiKROMCzS50rb7cCOi/w0EkT
	ww29R61JpNNPDQptYwDNeOzK067Zj+jaBceLerS1KQ2KH7kIrVpY5Vtlb5KixzCtyXbfFRRcSqU
	MTkkwO3Z5pRDNb4t3V5ECvhtTkf
X-Received: by 2002:a05:600c:2049:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a17b562c6cmr22905595e9.35.1791302576578;
        Tue, 06 Oct 2026 09:02:56 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:02:55 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v3 0/5] power: reset: syscon-reboot-mode: Add support for
 Rockchip RK3576 reboot modes
Date: Tue, 06 Oct 2026 20:02:38 +0400
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNyw6CMBQFf4V0bU3pC3DlfxgXLb1IfVDS1kZD+
 HcLbnRhXE5yzsyEAngLAe2KCXlINlg3ZGCbArW9Gk6ArcmMKKGSNLTGmmN/YaKS2IN2LuKbM4A
 NqwkH1piOcJS/o4fOPlbv4fjmcNdnaOMiWxa9DdH55xpO5bL710glJlgKXktNmDa83HdXO47gt
 wNEtFQS/fQ0vzw0e4RivFUVJVKob888zy9LK+Q7FgEAAA==
X-Change-ID: 20260928-b4-rk3576-reboot-mode-d3804e39df04
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2803; i=alchark@flipper.net;
 h=from:subject:message-id; bh=eFY0EL/+0X6JOgjuwcgNPswP21gloYHJF0IpxpUkDLE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV59fO6HO2LMB9oMc1MOdcTfnsIoI82R/TRb7remg
 NKX0slnOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq9KkM/3MONbC/dohs2apfalN85pCjm2yd1pPstUdFlecfs7hx5SzDP7spJ20
 qkwzzb1f+/ZzfrO0/1yh7qSbPXtnj37NCH95w4gMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_090301_762844_800E855D 
X-CRM114-Status: GOOD (  15.11  )
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

Rockchip RK3576 supports reboots with a specified boot device priority
mode, allowing one to override the board-defined strapping config and the
OTP programmed priority setting.

Supporting it requires several changes though:
- The boot mode request needs to be forwarded via TF-A to the boot ROM
  (upstream since TF-A commit 2a97ba20e901 ("feat(rk3576): forward any
  boot ROM boot mode request on reset"))
- Some power supplies need to be kept active across the reboot to prevent
  early boot code from running into a synchronous abort
- The magic values for each of the supported boot modes need to be defined
  for the OS to use

This series enables the above with the RK3576 EVB1 board as the example
user. Other boards will likely need a close to identical change to make
use of this functionality, but need testing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v3:
- Dropped Tested-by tags from bindings patches (Krzysztof)
- Link to v2: https://patch.msgid.link/20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net

Changes in v2:
- Fixed a leak of the dynamically allocated syscon_rbm->supplies (Sashiko)
- Uninitialized access to supplies[].supply (Sashiko) is fixed separately in:
  https://lore.kernel.org/all/20260929-regulator-get-all-v1-1-e887c66a47f1@flipper.net/
- Link to v1: https://patch.msgid.link/20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org

---
Alexey Charkov (5):
      dt-bindings: soc: rockchip: add boot ROM download boot mode
      dt-bindings: power: reset: syscon-reboot-mode: allow supplies
      power: reset: syscon-reboot-mode: enable supplies for the next stage
      arm64: dts: rockchip: add reboot-mode node to RK3576
      arm64: dts: rockchip: name the reboot mode supplies on RK3576 EVB1

 .../bindings/power/reset/syscon-reboot-mode.yaml   |  8 +++++
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 16 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 36 +++++++++++++++++++
 drivers/power/reset/syscon-reboot-mode.c           | 41 ++++++++++++++++++++++
 include/dt-bindings/soc/rockchip,boot-mode.h       |  2 ++
 5 files changed, 103 insertions(+)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20260928-b4-rk3576-reboot-mode-d3804e39df04

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


