Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E201FC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NWr7T4d59y34KnfzO23vP7E7473Y6DR4P1HbwbXpOA=; b=MylSTq83LOvXYgdMWaSFN1Xi5f
	VPOLaI6yGB2qG2j9HW8JTN+v0kNaasPYlXrun5pShIOs6kDMP6XQe1MD/H1kORsSxSaOHuwlE+IzS
	TW5RFR3cB4QM1nxaQL6+5sR7IKIrTOUw50FWtWK+OrRN7B6HDjLWW8TUXN1rfc8Gpr0fGmzC3eyLf
	3OOqxDwCvE0rrROcd6Pwr5nU9fQpo2quZDR8NfhHxvpSUXHovPTaV7Yv9A/V/NvgvT+bRvKz47WaY
	wuXCdsQeHqhbjptz0Fplvr281zjYwPMvO1tXooP1zk8Xnp2frszp/E/sn7EJU1A2kCIWYzaGFXl5b
	5yiffzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnAP-00000006hn6-1dDG;
	Mon, 20 Jul 2026 12:32:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnA6-00000006hds-39DK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:32:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so9567135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784550717; x=1785155517; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NWr7T4d59y34KnfzO23vP7E7473Y6DR4P1HbwbXpOA=;
        b=tAbQ/FOIEay5zD81OjSMpgzPazuhMZG4o9Hd9XY176jfj4wiURwjWKs6HE5ISkI3Lw
         rbp0dxuRu9VNCjGDrWaPO2S4D2azGKuMpGlWT1rL1/Jn/Md3N9E50Lc8WoFaLukqsAJd
         CYNf0GXi3zHaUGzIkXyGR+5ZjPi7ljgBiqjtpWTVLc8nfHsRTQRAy5qQiBJY/hDb9hQH
         7xvHDKggINKVE2V8y1d/mfCFfdSB/GB4Td+s1FFLa8gowzL6YUdk41tGDUy+2KxO4w12
         IRxjdn7X9ADX3xskO98H7F2e3w0vNLUNQT4jz7C2wVKCn2ZgPHZ/kOX/gUVjRjKl4+X/
         bETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550717; x=1785155517;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NWr7T4d59y34KnfzO23vP7E7473Y6DR4P1HbwbXpOA=;
        b=cJW2cY/VWHDH55TwtMf3z7zXvpFTQfGxEJkmqWz1EtJyLOmuPtHDKIp2MrhmLkAdpa
         0Da+cw1DWwIOpF2/8ydbvC5FGEMZe6efivpLn2V8+fw9zoW52ftjb3NoSFvKaT91PHQk
         QqkeSapBmAQMC+ZYFpIvP3qjlw+kH9LSIBZ+ha759d84daioD/0w3PQsKnwgSOkBTXN1
         wZ9xf0Gj04wMis6dcxh0R2CaUAQM26d1UcIV7OKm6M9FfVN5HjwjJc3FjFaD1XkFF0yT
         3nUs1kqhWPnMn3XECmUgL6ZA9wfssaRsyrnCk4voqXGl81WIJCCZcgSJ5I+0axWgjVtJ
         a8hw==
X-Forwarded-Encrypted: i=1; AHgh+RqTHK8NJAUoEsW/oNfB2auDfaUiikEVzajjFNM2bSO+Ub+TCRxSVN4vCknBkJ2XtG0LsMBYjZKeUErw91BwElpX@lists.infradead.org
X-Gm-Message-State: AOJu0YyilofdS3mgj01T5VpaL57TlwUX5r9qCZMM28FkLrMlg+YOeSDn
	iSCn8B5rivwrxC2aIY/6mS1O4x8T6JxU/YUs1BUkWlk0Am4v9mS83zw8leemeD2+a5Q=
X-Gm-Gg: AfdE7ckNyHngMFH2JzsImnKusX33V4sK12g2H+Qj4rIgpKXXoJehy70zuCRW3nEjsGO
	7SE7CQ5LlTakc4pK7hhmWUIpUmE9/YoN2xsY9az63qAAsV05goVAvvVPnUYbqck8WSlVBKs6l7k
	3Gf9QTrQ7yj0gvgCQUqS6LAK++oH6uTpVRKYLn0Wh25rjINil2sKn7kgGIh3v2lzUSF47cuto1m
	4cPwUv3DMfnvO2bttx6IxahGdHd8IH0f2jWvfeYg+moMgDoOfaq5fh3BznIflFwSD4AsylygBGa
	tN9pOhaw4WeZ6RBPZpU1s/Chan5/K4q3iUs9dSXEy4MXb0C+looPMubkRLqbmcojjjfFETdEx1L
	YDDUK1KSNLJAhqjdqI8yvXVUOhGU8Yf7re8iNraFDIL6mEYrC4VplYOIpB0x1bSqgVQoh8iLE99
	kq5l+IACZZ2K6LF/ZhUOSzCmc=
X-Received: by 2002:a05:600c:630e:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-4954a3dc687mr158360205e9.11.1784550716629;
        Mon, 20 Jul 2026 05:31:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2692a3sm243086825e9.0.2026.07.20.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:31:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Arseniy Krasnov <avkrasnov@salutedevices.com>, 
 Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: amlogic: meson-axg: NAND fix and
 PCIe PHY adjustment
Message-Id: <178455071586.746335.9935948018468278045.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:31:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_053158_798202_6DE34D92 
X-CRM114-Status: GOOD (  13.51  )
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

On Wed, 24 Jun 2026 21:56:40 +0800, Jun Yan wrote:
> - Disable nfc node by default ahead of nand_rb0 pin addition.
> - Add missing nand_rb0 pin to fix incomplete NAND pinctrl.
> - Disable pcie_phy by default to suppress probe warning.
> - Re-enable pcie_phy on S400 board to preserve PCIe functionality.
> - Enable mipi_pcie_analog_dphy for PCIe on S400 board.
> 
> Changes in v4:
> - Add patch to enable mipi_pcie_analog_dphy for PCIe on S400 board.
> - Link to v3:
>   https://lore.kernel.org/all/20260617082239.645562-1-jerrysteve1101@gmail.com/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[1/4] arm64: dts: amlogic: meson-axg: Disable nfc node by default
      https://git.kernel.org/amlogic/c/77c63ef3be3972eb3d8aac2dd36f349d78620b0d
[2/4] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
      https://git.kernel.org/amlogic/c/45eb76f9ab6854f79690d56d04df227429a536b8
[3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
      https://git.kernel.org/amlogic/c/25ab968f7d27f46927658150bf466cac856e4f4f
[4/4] arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe
      https://git.kernel.org/amlogic/c/7f1d0cc86cb70fa550163b6f70fd1d484c03218e

These changes has been applied on the intermediate git tree [1].

The v7.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


