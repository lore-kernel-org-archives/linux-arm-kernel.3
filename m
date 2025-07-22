Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1577C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=48867Pal/1jOpEz3/91Ogv4kveVZARbA4EPs2QFDNFE=; b=yUFvCZqRP3N1K2hii8kBdfMltW
	oEkn8VDXCcJ/U0CedMsKb7JXPJLwBmB/zdXguT1xyxiIp/RIWH2oiI6lLgJZ+1kLN3DsmDr/XyjZa
	6vsGcvWQ3vF3Rdt8s1kmfxf7QdVvw6dBwngja/x1ACjQa7IFBci8p2Axzs6H+LDrhdSmwllXK2apI
	8ObkM7+wnGJyniVzhG/X5x3C/rL2n3yWuyPRA93IKLaTSm/U0fgCB+TExBu+o7iJEMJfxX78AxM4A
	FJjKKS2C4GzW1uB0aznt+a50TW8Dqpfr19fA3FLscNrihqQWSXoij8lHkiVrjSdoycW9WJRSSOE1v
	dFvKxW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKaG-00000003WBv-0Yqn;
	Tue, 22 Jul 2025 21:31:36 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKXj-00000003Vnl-1Mhj;
	Tue, 22 Jul 2025 21:29:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so4680857a91.2;
        Tue, 22 Jul 2025 14:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753219738; x=1753824538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=48867Pal/1jOpEz3/91Ogv4kveVZARbA4EPs2QFDNFE=;
        b=bud0vRxvxyAGfipRjcp0Qk3yMu0h4gzf4NnWnyUaMLqr/B1cD0vYHLJCVsJvzlEIQV
         KnhrSJYZjlw1Mymx8752hLQ94lC/nTTduDtX8bVR2KEVj7xgvs6YayZjogUntnhDzV1F
         MH/J07g0X7fCbVVtzvAkWubkPawYjOvUppXFg1yUI9OUiwTIeKjQbHjf0wGqWSSkriLE
         z52LgE7SRcrF6r90POMhGmtS3rKMRDSyub2qwqIwHxfRGesF9ZcHK6ymNjQsfmzNLyIV
         n6Quh7defPUkMuxNuL2/pOjCMFdBuaw0ibDo2wqCKKqEKYkwBK9vXS1w1IpIWmZQNf2Y
         v5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219738; x=1753824538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48867Pal/1jOpEz3/91Ogv4kveVZARbA4EPs2QFDNFE=;
        b=ufNRPW6oLBneX33Al6vx3RCSFKmNMIII6SjEr7W1uu9GxPR+YTUE6XRfTcvc7oeJ/O
         laMUdMzwRY0Wh7yGJjVwNRIqC2INj7O340gvVIcqSoFwlFgBkWjadgriTdveLfXuaJqC
         08SKqQvfQgXJmf6e8zqCZmNs9NawTm9mFvibj5miYbBfOsU5iyvgLwhV5JZaMXDlJjnV
         yfCIF3+YiPr9dafawpGN0rCC9T0znQS/EFN80WkwDcTx6w35PWvtOOagSbzT/ymo31bV
         hoW0xJXylv9qjNOsO+oIkgEeproyNEqDNc2UmDy2AFDnFqvgXS7636zu0WUm7BIW7wVU
         kWig==
X-Forwarded-Encrypted: i=1; AJvYcCUp6C/PDno3wzpqe/iqv9Nf0Db/2v6NCUrwWlcW0XcLiLqcWDqp/5NSOLi0s4bROqXJKLJE3fC7aERiUBVgjQ42@lists.infradead.org, AJvYcCVljltqO9KHLYxug6nZXWqSKN47Gyn46+QdAsw6/EZvWptCzLZNLZGVQBeWngyxqniTzCBvPKq9dJMgdQyw35M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx7Mmyix5Bu/XOHOjA35K5uCkZAnSwcTdG8h/1z4BauZfYOO31
	BrRmYLMpRJ0gV2x0kankGunSV/PUFu6fns1NyWqX9MtI8btYoe0jg1+N
X-Gm-Gg: ASbGncsEe7wvhEyuhXE6TtazMmcCmS/aemLo82htIemTrWCNbZZ/6HGUoVsTlE2gWDg
	aBAo4JRY6mjJHbGnL3F31bRUxW5E2TqMWoK0Axch3Lq/EbI0UufSNOLZeds1DXGrNCUhzoL7JnJ
	r49RsD1Zf78umBR3Nh4vmtWmXdu66J2pZF9uITBKrg+9QPzcp5PdZpJFPEsOET/8qpqCG3WSp/x
	vBvtvrBK2VB9aml2Vt+E6Ia9ovc/LsqmleUdrLOE5FZPNf3w0WKqj1miQVfgW3M5M+QFlNzdSX6
	WnYYJO8SvnTqekmM0/NHCaq9Ic7zLDmzKhm3IfLIyIGgYHSjoyh/a5zf2qGQwV40xsQ9taxO7Rc
	fPxI=
X-Google-Smtp-Source: AGHT+IGdeHskm5Ee4Q3qMconqScb7wNu5KePjyblDVvV/Acs8WP6sY23sealp7liXFINeKE+T0WJQQ==
X-Received: by 2002:a17:90b:4b0f:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-31e5076a94emr948092a91.13.1753219737973;
        Tue, 22 Jul 2025 14:28:57 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519ce384sm94942a91.2.2025.07.22.14.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 14:28:57 -0700 (PDT)
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
Subject: [PATCHv5 wireless-next 0/7] wifi: rt2x00: add OF bindings + cleanup
Date: Tue, 22 Jul 2025 14:28:49 -0700
Message-ID: <20250722212856.11343-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_142859_363117_E7401787 
X-CRM114-Status: UNSURE (   8.80  )
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

It doesn't even compile. Added OF bindings, documentation, and other
stuff to hopefully this doesn't happen again.

v2: move all of 2x00soc to 2800soc. I didn't realize only two functions
remained for no good reason.
Fixed typos.
Slightly changed probe for clarity.

v3: fix wrong compatible in Documentation.

v4: renamed documentation file as there's only a single compatible.

v5: made clocks and interrupts required in the documentation.

Rosen Penev (7):
  wifi: rt2x00: add COMPILE_TEST
  wifi: rt2x00: remove mod_name from platform_driver
  wifi: rt2800soc: allow loading from OF
  wifi: rt2800: move 2x00soc to 2800soc
  wifi: rt2x00: soc: modernize probe
  MIPS: dts: ralink: mt7620a: add wifi
  dt-bindings: net: wireless: rt2800: add

 .../bindings/net/wireless/ralink,rt2800.yaml  |  47 ++++++
 arch/mips/boot/dts/ralink/mt7620a.dtsi        |  10 ++
 drivers/net/wireless/ralink/rt2x00/Kconfig    |   7 +-
 drivers/net/wireless/ralink/rt2x00/Makefile   |   1 -
 .../net/wireless/ralink/rt2x00/rt2800soc.c    | 102 +++++++++++-
 .../net/wireless/ralink/rt2x00/rt2x00soc.c    | 151 ------------------
 .../net/wireless/ralink/rt2x00/rt2x00soc.h    |  29 ----
 7 files changed, 156 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.h

-- 
2.50.0


