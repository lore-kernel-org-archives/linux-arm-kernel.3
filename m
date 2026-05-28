Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63F6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a4sBWMdT1v36UhZue+fcmldfG4lEYl0qYcSf1IPTfs8=; b=KZVwQH27ZgCRhN
	DLVl7mUGn/wUcnEaKmVQvxNfWRoqRAbfi8YM7OXVv9jqkO2ovswRAs4AAXZ13X842dAB5uqH44hQQ
	aCtNRa7kW45rZ0YtgVyjr/PIde4fcdz2W1CRpuYIFeQmKfG4AWklVau5zB6HJEQ84zRXwP0hgEKEQ
	WuR+bRfYRxncpexEq1FbT7hqAvSNu7UsYgXk1YWbwx2ORIxmHOtujshZmtFrU+XIuPZ4Edn6aonUX
	T+ognBReC7s/czF09Aruai5mhA6HIfCyifFya4ZFmaZVLZm66+HVl0wd33RwGcMKSMQPWYkW4z7o1
	4enrQVArirbXADfGPl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSigt-00000006Qdr-1mBO;
	Thu, 28 May 2026 21:54:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSigq-00000006QdQ-1nIa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:54:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4903974854dso66213205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005294; x=1780610094; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4sBWMdT1v36UhZue+fcmldfG4lEYl0qYcSf1IPTfs8=;
        b=VVdXUb3RenbyqLWBq/bdd+ooxJq4jnSfKuy7OLRFXUhjQPPA6kMpy1EVaJjCHPAjDR
         DK35vLz/rNyKWcQVEhUVZS+q7W9PvrgzPmVd7+4jV2o2eTwbXzoqMqXRW1U+AeTOLHdJ
         YTNDkO7Rh//R6qgdlOrz3f7fCwItJXSjUe98MuSSpNd7zyrNPURp90oG33BKG8nER16I
         NfX3ho3Cr1NBb1iqL3k/qkzcm4tCMNKvqRc+yPEHir65e88h2rOg9EszzlHxer4sHyuP
         ZqVZPaHbOEs6cDWA3Kn22lqrJzYSgO04SPRlYojObtKMzF7FI/pZV51KrQ0NdcEEU8lq
         DUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005294; x=1780610094;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4sBWMdT1v36UhZue+fcmldfG4lEYl0qYcSf1IPTfs8=;
        b=femyTUzxe/BZP/vMSFKtKFQFt09/in4TvWFN7coX6djSRHB07iAhNNmEgc2XnbUVYZ
         eNYx5NCTHUI/aWg9QbLilbhVn33/rumnzCohiO0pS513xY1533jnXsT2aOfYI48MRD+x
         pVt/9UwZMtUNKuZeVb2vIYma/0OCBM/s1VZcV3KAxKf9azUlTRAOGve2rEOlYqeBvnYz
         8SFr5kHo9AMV8NZJXslzzXJSwexT1sUXBaol8A5bkrDvl1Pjl2rTxFvnzfSzX1y61nw+
         pPlfDGzWot5pXRmHI3ZbTH2Q2axD6jcewWkArnLRKBLCWQzi6OepNxlhAjzZzD5TL4gE
         lHLw==
X-Forwarded-Encrypted: i=1; AFNElJ956soU8V30vrrtKweh1Y9yJNRVo2U45V/pU9COiH2RbDW6EsKJ8u5Dpl67oQO+lJPnP8XIGrcwQWkZyXf+mCpY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy88WooubxMDeK8tNe0RM4jkTo6Tu6mxfRjKj/OatvOcpuYLVp4
	I91Y/xpB3xOZ/z3jH+zxG04REb8JzDgRKQQ4W7O5pPCT/WIC28cHp0hgTo33WMURUreWOg==
X-Gm-Gg: Acq92OFTuXiNdA2TRtrkJ94llT+1mTx3YRRAZJfpWRzFN/Ktau66BDnlVaewmPDA3kD
	7GCx5anmuHxsWbNl2QvI9Dgl6cC2nnYWZGPO6g1YhSIo+BGGyVpvjPYA+KuqSd4ygJT1ikKo8rW
	Pd9SV+YwdToAEOHcJwTOUOErw/oYdK1Qorhd0pIVgYR1YMCjkefHeAT74oWW5Ejgd/B91E/0JBc
	Bd0hB55ph8CMxA26PsBZMpZ6hFRl2ggTYc2uzqqG+f+NINdpFBRS3v68LS7aJDSsYpOSaVuefm4
	3BjnoyG2RHA/ICg80qCSfWdGyft/O/ofLvoe+hKLsJtXq6QFF/jjuSe4t9saWmNWaeSckuXa90M
	RbtlYwd3mZ0cYTVXtWgscMvMf1W9N7fzlWcecLuVqU2jmavH2nvuOM3C6UBpQOruJQuhwA8TPN4
	o5koOMPgBk+FAeRz/AOi06yyigGTSL18dyjVgOupc9HHLc
X-Received: by 2002:a05:600c:5298:b0:490:59cc:999f with SMTP id 5b1f17b1804b1-4909c072254mr4532355e9.4.1780005293915;
        Thu, 28 May 2026 14:54:53 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c967c6csm1191085e9.2.2026.05.28.14.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:54:52 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
Date: Fri, 29 May 2026 00:52:57 +0300
Message-Id: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADm5GGoC/2WOwU7DMAyGX6XKmaDEadp6JyQkHoAr4pC4zhZtX
 SEp1WDquxMFJCZx/G1/n/+ryJwiZ7FrriLxGnOczyWYu0bQwZ33LONYsgAFnbJaya8LIJ2OErg
 dDbLRMJAo12+JQ7xU04t4fnoUrz/DxO8fxbr8brzLLGmeprjsGtJMHgwGZ1rbWUBnAKw1FgP1g
 ++QPY5D21fXIeZlTp+16aqr7F+pVUslWXtHIQTGrn/YTy6e7svD6ljhltN/HBQOMCgeySgV7C2
 3bds3GJAwoCcBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4498;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=oe7aOtu4GlLFmto5XpUmD1HhhFhBv9aUVHHre0u6Tjs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqGLmKI4w04x1nG6QRvCKQeuusOziQaGLWe8eMI
 weOw6zeptGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCahi5ihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLSog//UDw5BlvHKGoLR5UJZwzXVjGX3lenNVg
 bvf45JWgt4lee+39Q4xuNjP7A95cZKR9LYsKq0tgmRTVu8SScOksETszX4q7LFl3c4F9BNiNq8R
 M+p6DkAnkgkcrwicS9EWzjhuUaqz1pwVNx5LNscKp6MWkEBMJ6agc00tUY+rktEGsX7+9rP5MeU
 79mnosxz+PktFmCdaOAwhRbtVLVCL6xn/ju/Xs5LD0oimYuJK7UUc0vrAZpOFWAYL296B3SYghB
 n1wOEXDIRxQzZXMXr08pkuDUvfb/f19+UnQfTgGNMUlPafddui6DCvm309OpIc3do2zdFllo+J1
 r97hrFBjpyI6ykP+KRIxhXcjwO7+VWGSHjSOpbRWE+0HCDKHe7Xv6aovNpVHmVKjUniDoSKTdv3
 DXibVh5Wrpf4qoUHTDbl+3kq8WKiUrBNtCSCBGYCML8Vi5ol/RZydDq5UV5JAi5IWpY5GLLW07h
 5iHltHQVLvm5Z8HFoJp2epsjoOiO7M057CdIf3mcKelF/J6/RrWiypKDGA2yHQeg/BqRzvigfv5
 ZyXCSefsv+pGyojFx3UlJ+6HJKch6lH3NvjJ08E/yHFzLYGfkHmL0s/H5XvrLinzAToMTFx8DmW
 1kIjeqpOIEY1bF+6WR78BagnZdcK5g62zBkScYP4wM08iCblc9fg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_145456_519227_4D1C7C92 
X-CRM114-Status: GOOD (  23.05  )
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

I am sending version 3 of my zx297520v3 clock patch. The major change is 
that I have merged the top and matrix clocks into one device because 
the interface between them is unclear in the hardware.

There are still a few open questions though:

1) The clk-reset interaction: Both clocks and resets are in the same IO 
space, sometimes in the same registers. I see a number of clk drivers 
that register a reset control. I noticed Yu-Chun Lin's RTD1625 clock 
submission added an aux device and placed the reset code in 
drivers/reset instead. Is there a preference for either way or any 
guideline of which way to use in which circumstances?

2) Unused clocks: I looked at recently introduced clk drivers 
(mediatek,mt8196-clock.h, sun55i-a523-mcu-ccu.h) and they do add all a 
lot of clocks that do not have an active consumer - which in a way means 
unused ABI. Please let me know if you prefer to add clocks one by one as 
their consumers are added.

That said, there are a lot of clocks that I want to define for the sole 
purpose of shutting them off. The boot loader leaves pretty much every 
device enabled, including proprietary timers that I don't even plan to 
write a driver for. Registering their clocks in the kernel will allow 
the kernel to shut them off, so they aren't entirely unused.

3) I took some naming from the old zx2967 code. In particular, each 
device has two clocks: "WCLK" for the device operation and "PCLK" for 
register access. Are there more standard names for them? Likewise I took 
some device names from ZTE's downstream sources and I am open to better 
suggestions.

My impression so far is that "PCLK" is fairly common. There is no agreed 
name name prefix/suffix for the other clock. If anything, just nothing. 
(i.e. "UART0_PCLK" and "UART0"). On prefix vs suffix, (PCLK_UART0 vs 
UART0_PCLK) the existing drivers seem to be all over the place.

4) I took care to test unbinding and rebinding my clock driver to the 
hardware and also tested building it as a module - but in practise, the 
board will be pretty useless without the clock driver and I have to jump 
through some hoops to even test it. Should I even bother, or just set 
suppress_bind_attrs = true and make the config a boolean?

Wrt clock name strings vs struct clk / clk_hw pointers for parents: 
Using string names seems like the only viable choice in practise.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

---
Stefan Dösinger (5):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset bindings.
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset bindings.
      clk: zte: Introduce a driver for zx297520v3 top clocks and resets.
      clk: zte: Introduce a driver for zx297520v3 LSP clocks and resets.
      ARM: dts: zte: Declare a zx297520v3 clock device nodes

 .../bindings/clock/zte,zx297520v3-lspclk.yaml      |  119 +++
 .../bindings/clock/zte,zx297520v3-topclk.yaml      |   95 ++
 MAINTAINERS                                        |    3 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |   55 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zte/Kconfig                            |   18 +
 drivers/clk/zte/Makefile                           |    5 +
 drivers/clk/zte/clk-zx297520v3.c                   | 1003 ++++++++++++++++++++
 drivers/clk/zte/pll.c                              |  450 +++++++++
 drivers/clk/zte/pll.h                              |   23 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  179 ++++
 12 files changed, 1944 insertions(+), 8 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


