Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B54EDA685
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pqHM9PVtocZZ6dJkagETpj+4ELwjylZhR4+lPK5nnFE=; b=JWPv7JghTcIqW2
	QIz3g+WyreZXRjz+PYWz9rSuGb/x3b7vRfZzUxltROnk9Wi5dn4AtkeiwevrcFh3wXDKA2igh0cP/
	511lBtdM4vBN8lc94AasxuQc0oTP4IOKmMmz5zlcgcY49QVW0nw8sStxorxdDldy07JuQWT80kEhi
	u1fxyCNBQk1lugKiWZXgbEZDatUt/GCMCoeNadPxydp9wJ/uvVJ9KXAxop0lkZrq3zCPB9/JV2Gml
	VwMle0PFQk48465fRg67cNDjj76Qknl2S6ElAwlk0O+SMvG9sYw4gttGQVaAwzZozL2boZYZeR7zK
	ZiEBkBjTr6fTVpE4wb3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRc-0000000FOqh-17Dq;
	Tue, 03 Mar 2026 15:13:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRY-0000000FOpc-2hHj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:13:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48378136adcso34456845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 07:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550830; x=1773155630; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqHM9PVtocZZ6dJkagETpj+4ELwjylZhR4+lPK5nnFE=;
        b=LBps/JH6lqwsGyos44EVZCmant2lLIh/zOYCKneDVd1nX4XtdSjWA/BG3zJU2obW5r
         s7GGKMmPwEQwDJzEFU2BHhWSj2k7htYds+6C2Dp2tDQarOjqW4xQ0HpKxgJOGPvwYL1m
         44rkWU2Ud58a/hTlnXLQ47MPoURo7Km7Rok7r8WYxcSt7g4+I5cTiW6LdS/kHPoBl2SX
         Gjxp3UwjUXMSbEwg3Z0EtuWmTXFODZqICxTWkxPD2i2o9/YR8Lm0eryiLnZkjCeBJckm
         nViBCBN2Fb0JCm3nPDpbEi/1xulQxFSRXd1vfJZrivz5r4MODxy5uXD0yB/GsbyJzmzG
         BYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550830; x=1773155630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqHM9PVtocZZ6dJkagETpj+4ELwjylZhR4+lPK5nnFE=;
        b=Ph1AAJzxsSxAnfPZ+lJhtirYVS53Jwa5U8f55zVLrtrKm3RprtmOWbMbmFxE8PY/5V
         P37hU7SWvgf2oId1D+ChfoEx2aBsyl2ky/aWY3S5LdkDKFGcqTDn2HRVAnAzlUq6GNIW
         SJ4Kt06Y8ZUH0fpGi5a10DwV86piTSG83Yk+Ow0PyWr/921xJq9dj00riiMYoYr4JUCo
         6m0uvRVDlxyqykJhHycrBt50ppV7fg3wQozsednhdF0v6HcTq21fL7bJGtQBDAAVwnQd
         HQtGnl9JQ01ZSWGvtXoeGk1/LYaic/3lZLQ2bYjMeIfaCHSWVIR87b5PnoP04a6iZaJ7
         16qw==
X-Forwarded-Encrypted: i=1; AJvYcCVvRKOxPvQHFNeeTgkE4RxX3Y1z70tLWSIs63JguMG3tufNOLBGqUqk78ZNV62bq+HYqKG5q8FcirFB+rEOrKgP@lists.infradead.org
X-Gm-Message-State: AOJu0YxzNb86Bb18wFBpxqWyij07HV0QrygbVKc5dUeHh6YZhgInWUcb
	D+OPZrJZYexyONpIdM+dFoAU0WzH5mWpJDbHbB447nzB98x8sOXMG+KyG+e/cL7Oim8=
X-Gm-Gg: ATEYQzzevpSRqopgCCYV6idcAzFyC0PTOGxTPfD+Nv5x1oDm69znf2Jxkgs1zQW5cf1
	bqVm49YsLit7TsO2vjoKFFhjdvBMT2X270uwNQJGiXfx2OceP6++qO+EQRkDMMFaHfFQ1ui+ldM
	ddhEnzvi3FtbZ9UozA2jOYRK5Z6ZUEmDKmTPQKBN7y3J94AiNSDxrnyM20iSjn1gsZZ6NCKE+6/
	uVQHLYeE9kXj4c6yDDrIAFS+7mNa94NWto/5Yh70DShadIyBt5eV55E3cqN154tVtGwZby+QU91
	vNuMrkKL+kaZcjS2MpDQ4iLLrQy9m5sVt5t2Xe8w+OWrL8QTehWcWCn4hEccl+x/EH4gGOASh2a
	pMAXhYj5Je3WWVHkH4tv+4XeAk/QkFKRTnnn4pqXkgQk2feATvzB8zDU4VzUBYTgEmge2CVtu83
	Zb4WBVBosPedFa2KV0OMnQMoOlbmcS99c=
X-Received: by 2002:a05:600c:34d6:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-483c9c1cc59mr302543825e9.31.1772550830411;
        Tue, 03 Mar 2026 07:13:50 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b7713csm321623695e9.11.2026.03.03.07.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:49 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH 0/6] arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
Date: Tue, 03 Mar 2026 16:12:58 +0100
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHr6pmkC/x3MwQqDMAwA0F+RnBdIcmjVXxk7FJNpDlppRQbiv
 1t2fJd3QbXiVmHsLih2evW8NfCrg2lJ22zo2gxCEkiY8Mi7T5jWIAk9qxbUA8+APCBpipGFetY
 ILdiLff33z9+f+34AUxmDi2wAAAA=
X-Change-ID: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=msp@baylibre.com;
 h=from:subject:message-id; bh=9jv4a1vz0B4Y0Se6PnOzjXSDFfM4cHN/74M5HEnLJGA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlvzoO1/L61zJk/4vPK15VZG7vLng/9u7+Cwwnt90Nu
 GbNe0uso5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbSuIqR4V2JyZ+ZU97MPb/a
 7gGjtFGJccxWsaCru3webIvdJlQ8MZaR4drsuf3GzPPrb/vwPpLfpyi6jcthf6vajiKRw5uVlAu
 1uAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_071352_954222_0D327963 
X-CRM114-Status: GOOD (  12.82  )
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

Split the firmware memory region in more specific parts so it is better
described where which information is stored. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data and resume from RAM.

IO+DDR is a deep sleep state in which a few pins are set to be sensitive
for wakeup while the DDR is kept in self refresh. Everything else is
powered off.

The changes in this series were suggested as part of the IO+DDR u-boot series:
  https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com

There are currently no real users of the memory-region that is split in
this series. The size of the memory-region in total stays the same.
The new layout is derived from the software running on the r5f
processor:
  https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd#L172
  https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/source/drivers/device_manager/sciclient.h#L459

Additionally the two important devicetree nodes for resuming from IO+DDR
have the bootph-pre-ram flag added as this data needs to be read before
the RAM is in use.

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Markus Schneider-Pargmann (TI) (6):
      dt-bindings: remoteproc: k3-r5f: Split up memory regions
      dt-bindings: remoteproc: k3-r5f: Add memory-region-names
      arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
      arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
      arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
      arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 37 ++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 42 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 42 ++++++++++++++++++++--
 3 files changed, 116 insertions(+), 5 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>


