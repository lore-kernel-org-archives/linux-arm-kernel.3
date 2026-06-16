Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6936CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 20:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BPpoQ7v1yBgGnokyZPjeSn3hpjUfo+LeGZ8fvnOwicA=; b=w7iiDC9CA+e9gX
	xGCj0+nhhuNfgXtBSS32REV6gyRzDKVr0yK6Zfk2Sv+Ym9M8uRA+JgLVCrVppb1LuB8Cx81Khyoiy
	YNZGGxd8HDM98KoLzOEqNj8iXk7OSu211cetEdDGlQvesBiVYbi/cghLMizMwUpsoMUh50hlcyXO/
	+l2BVFJIeYb1GSu8wrVg+/JW6kSInJfmkhvdxS4WwWZeIYPc4XRTxCgZqS7MaExBNgTiUT8hGiXYD
	GDoMrRxA71jUDNMJ93bcy9Lpgy+GrYA6ziEBXzWTAc/JtV3Q4R5WgsP41qZWmdJjGtJnpWOhJM0sb
	gqClmPOUfBX1DwCCfv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaN7-0000000GHpY-1haz;
	Tue, 16 Jun 2026 20:26:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZaN3-0000000GHou-2xbV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 20:26:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490a76757e5so36355265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 13:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641611; x=1782246411; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPpoQ7v1yBgGnokyZPjeSn3hpjUfo+LeGZ8fvnOwicA=;
        b=VgkmCrKWsh8AGJoVOCvNE274tKvYv4pwoHmncmHeJ+ePUmcmGNJ95QnQeARYFteI/t
         gs6VWwzi5fbeKYf/pLx7XZZw+s8qKRQ9i4yECe3OBInFN/yjPZV4/OlN8zz2cbej6hqb
         SLbYVFVwakt5Sf4GRHtIWdhr346/Aw26JNSfh6lJZHc0K9U8HAbeSa8isOerTwl6DDi6
         T/wP5AjEJgjeCyhQQxlAK+gQVZOYucg2eNaHv9k3drz04tyxNVhGzn1LTcILIZ+HRWPd
         KKuZd0KXl2w8ZuKadRZ2u+yXhF/axzSOCrqfyMAzxzK1O7JwSqOiayqypW6WPBcx5yqD
         tA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641611; x=1782246411;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPpoQ7v1yBgGnokyZPjeSn3hpjUfo+LeGZ8fvnOwicA=;
        b=NKqj3cG2/YIbLkZiow3FNqY7Gnw0Gauy1fH5Ej0SfCAFLtgSyERrMS3qhlY6stSCn9
         SRJs0KIMxwwfhdVWe2oHkw9AuAF6bIDsIRGFEF7edNLNft4vU61TPwLAn5DSdi1DB1K0
         4qeX/uVjzinOBup5XcHKRPF+rdCXbHgew0hA2j1quc3jws9ZEuVK2g+5lI2qD2YhifXH
         FuJPD+8K8hfNEhED1YsOSEQ2oaTCESqL0kK7yPhPLQQrrT2+yNhDF3N/4/6yeA9utVjr
         oQz+OyL5J1FHQc0cQbbiMjklUAg+8bSYYErMWnUVD/cU+KbUsN2OCeH8+aKhc58MXZk4
         eI8A==
X-Forwarded-Encrypted: i=1; AFNElJ86Cy5kCGIXMxuhOOy+GuidP3JBJL0w9LdHcwT+j/ncTYsnmf7Jvg9HeCAFW1WdRuBQdyY7ySHZuYuA5ZEtrDFI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrh3DGHTYHXWDTP4unj8LD41sQe/iJ/7eKMPgTNWDNRN9ZqOKO
	0CSVJ3k+eb0L/KCQSMEin5EAlrCBIsFWy8yRamJVT8tRtj3uwoubZ/2NwDmqOhzdDGicrw==
X-Gm-Gg: Acq92OEVIY2funlVSwcKHNqtnIHw70GdRlvf9aNPbA3DRhlxngUEtvlLuH3RbO4Nnt3
	3wBXUv3rac/MEsSwAtBy2j69PTHDp2N+16CSUtjlf3XOVBXYcxMRnxa7rlQuHu7y+aoNNYuAMV0
	5QuKAiRUnlxho8qLZykzHwwohtYBhYJQepPPlXtArKhuvWVekD+Fcn7hhwYkbFvv0Y2B4iUcOqH
	rKRG0PJSAOih910X3X7ztzzQLpShgyHY4Ve1Qu48pghRXLB3yMpKHhFtlO5eufyZ/IylEDsrSUh
	QPjy2w0NDffRobV9h6BMFchu8Tid9W6bmzo9tEXoYU9fJdwaywkYe37KMY+NkL1fn6V0hZm5I0X
	LfD5cFuBTuwIVJxsYfGHv8aAlVqErF71KZEQl1ac5B42hkmuDjtJJIw/rexYyAorZnfLnPEfjd7
	nXsAJpyMdHIGvqpLzalGji+muiCtgK15/bUA==
X-Received: by 2002:a05:600c:c09a:b0:490:bb37:9d49 with SMTP id 5b1f17b1804b1-492333bf9f6mr15240805e9.11.1781641611016;
        Tue, 16 Jun 2026 13:26:51 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:26:50 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH RFC v4 00/12] ZTE zx297520v3 clock bindings and driver
Date: Tue, 16 Jun 2026 23:26:20 +0300
Message-Id: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WOQU7DMBBFrxJ5jZE9YydxV0hIHIAtYmE749Zq0
 4AdokKVu2MZpEaw/DPz3vwry5QiZbZrrizREnOcziWou4b5gz3vicehZAYCWqGl4F8XMP505EB
 qQEMoofesXL8lCvFSTS/s+emRvf4ME71/FOv8u3E2E/fTOMZ513hJ3gGaYFHpVoOxCKA1ahN81
 7vWkDNDr7rqOsQ8T+mzNl1klf0rtUguOElnfQiBTNs97EcbT/flYXUssOXkjYPCgQmCBo9CBP2
 Xww0H5sZh4XwXSCuy2Pdhy63r+g3mrePpXwEAAA==
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3793;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=FwO80H1E3JHTygfTphnHg7nPuRMZdLoWNR8BX9Qlzrk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGA2Nqb6P7bZNY0Jn4Ahgvm54BiflHnww1Wp
 u3KXRrPtbCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxgBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKA+hAAnx40hgB9SBYrpop0r6jTAhXwWFB+/nn
 8O5iuk7DJYzsn3lFHR+tQsG/3cq8O7tocyhW4ubq6jhNbAzdzsYG6+XgURtNbokwpiShr/YAiDb
 4oQ1NC8EXwXA7LgrmX2yZdOmbAyxuRhzMRybynIIdF1njxSpkjG00NV2Zd0yKyQcNzuD2F2YAym
 0FVMdmgtHajdER14GjV7j/lVTxhLlYSWAywYjzo12eOhe46yC2wEpvYNDXwvgnxqp/pWsMHS1UC
 +nK7V4n9pzLusWq0KIbO/QhI5e5ZqmigRzmls9mRjJvpa51E/tzbJCnxJm3JWpHw/ORPl6iMw5O
 gg4JE/Gq2lO3gfmdpPlFhXZ5BTAJWVB1bhiSj1rX+qok978+gl79sn34X1UFOI7leRg4W+bARP7
 UCH19kVRvyS57uxdSj979jBaGnUBk7W9m8YvESecdVtlcvRK47vAR/4QH330wX8kgNkxV9SfAlg
 Uk6pDKy1JQ+Jvq7EGbEIDjbjIPOfukvF4YJm5vu8z+QbLOMA0pimFP9kDsfHb6JDPEW1m83p9HU
 h+eW2BFnEfs75ZDUTn1jsbm/hhRvEGoCqKcq7hvHELRO3NtnT+5Pl/uJgIqMTepp4EDDqeIkjKK
 eP6OcLPboHD1sgSiQp35Tdl+pAfF0drGakTpXhQvSlYivxx4SD3k=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_132653_812809_E6CA2F12 
X-CRM114-Status: GOOD (  14.02  )
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

Hi,

I am sending version 4 of my zx297520v3 clock patch. The major change is 
using regmaps rather than raw mmio to access the clocks and moving reset 
handling into its own aux bus driver.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
clocks is not an issue, but removing or reordering them is an ABI break.

I expect Sashiko to find a lot of slopiness mistakes, so I kept the 
[RFC] tag for this submission.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v4:
*) Use syscon and regmap instead of raw IO
*) Move reset to its own driver on the aux bus, but keep reset and clk 
in the same binding as it matches the way the hardware works
*) Go back to having matrixclk in its own device because syscon deals 
poorly with multi io reg devices. List all PLL outputs from topclk as 
inputs to matrixclk
*) Some more hardware research: Figure out the parents of the 4 possible
GPIO clock outputs and declare them in the driver. They are unused on 
the hardware I have, but they show that all PLLs can be used.

- Link to v3: https://lore.kernel.org/r/20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (12):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset bindings
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset bindings
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset bindings
      clk: zte: Add Clock registration infrastructure.
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Add regmap based clocks
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 clock device nodes
      ARM: dts: zte: Add a syscon-reboot for zx297520v3 boards

 .../bindings/clock/zte,zx297520v3-lspclk.yaml      | 130 ++++
 .../bindings/clock/zte,zx297520v3-matrixclk.yaml   | 180 +++++
 .../bindings/clock/zte,zx297520v3-topclk.yaml      |  70 ++
 MAINTAINERS                                        |   4 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  97 ++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/zte/Kconfig                            |  28 +
 drivers/clk/zte/Makefile                           |   6 +
 drivers/clk/zte/clk-regmap.c                       | 247 +++++++
 drivers/clk/zte/clk-zx.c                           | 157 ++++
 drivers/clk/zte/clk-zx.h                           |  79 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 795 +++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           | 477 +++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-zte-zx297520v3.c               | 224 ++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 219 ++++++
 18 files changed, 2718 insertions(+), 9 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


