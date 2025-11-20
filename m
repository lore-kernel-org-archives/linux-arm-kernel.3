Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DB8CFA447
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SnSclzJUYUD1UpejWX4wHVJELscJwkV6MRhyXGKL86M=; b=0Z+VHuvfHNXWRr
	+tdAnKX6zX7RzZyidH9sftSEnSuF9QhurF2e3i3AvGEpl+L/MA68UMAZJBvHhgchlANeIz2QVKpxw
	no+TNUH5IK0Oad6MrTDtzI0M64TYLlRvRTrKoX6SR3NqfObh5GrHtZuqVColCKpp1dWUv304PYH6b
	vLcHq0TZixr5RTdlOeclmMARz6T5a3I03WpXsnXCq5DKhksfSJZ+uTigNDBGSDvKGh1AIw4TuAfMR
	Jzg+9RM+dv0fMfRAy79+tK/1sU2O3V3sq9SP1dAaM8lcEKUnq6eLxfiSRFdBtKFKy2QT6tsdHDRAb
	eJvFiAJjPLanSZ8GUw7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBrH-00000007Ora-2osk;
	Thu, 20 Nov 2025 21:06:27 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBrF-00000007Oqb-2KgQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:06:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3720e58eso1113696f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 13:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672783; x=1764277583; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SnSclzJUYUD1UpejWX4wHVJELscJwkV6MRhyXGKL86M=;
        b=eZvUQacTJEWGZDquNJMb/yhlZcE5qmdyq5ajkA8UG86ul/kRl/Uu1qIbo+tnU+cZTe
         dD7dLC82fE4+KXeDcIAL6Qrcsj7xqkCW7rKis6TyGvNtqoaNmfiFwKdEd8MzKL6eX0bu
         rDi5upQmWfEr+0aCZiMwAlxp9QGEJQJYUP0ourrPHg9Ewnq+xQJ5mmzYo35B0deTD4V0
         B4uW9vhQMehTrrTK+Ex7G/2KHksrIrOBurAbVxvsAhuyjThCLX69w6Ku0xV3WMbGIl2b
         fAPXTirKtIjVH5hZBJJ52mtEgn/1zmSfut/RroBufH5cRl1ZIbqVAhVpKs/GC37jtBp4
         d0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672783; x=1764277583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnSclzJUYUD1UpejWX4wHVJELscJwkV6MRhyXGKL86M=;
        b=NKOdtJu1mn7/gYx/Hnfs8pjh2oH/jjgi2HcfzN7BlV4TLUAupZ0abhtWhfF0LbHi9T
         DRrK5isJhDIRmKfky1+Di1w2yRRM2vOuCDIcyFHDNSK2e8OHK7W7wE3NOLHFrwPSlqib
         Lvwetij+j+7DhPKG9G485BK7VOrhpKkEQw3qq1H9SI9j4q2FKAkE0bHHtR2wBR1QCgps
         dddkhRMAmRMYmRESzc2MHsODO3jU3NYZIHzQVxxzqKzCF6LN0EberA8b59XSFrQn8t5l
         XNBZJq5iiaoY01IO9VI53xeL/7jkhHuXoR9j1zOFGh9h/4+RqCqqvXIV9v+DMY8UL+wc
         WthQ==
X-Gm-Message-State: AOJu0YwecAldll4WHlgApytPtD8TsQnMoyiDBGxdsLmUdy9UeoEGErL6
	dtWf8iDdwlzFKpQDlIyLvrGMeBhwPsu4kfWnRgMc3knlO7PXA/Uebz9PKvhGO6PaSlM=
X-Gm-Gg: ASbGnctsX6Aq2mDl6IeN7712qYiDdqmHsURIou4YBE2148Xm5yF3qP1CIkpvI5t7gBd
	e1pOhOz+XzinGLbjIrGpbNw+0l3VI6iUNJ6pj/p15hA+E7a+HVY0QEubsCw75m4LFfoKX0TRyve
	+xCEGJtIVUKcAaV6NTXuY0k+gylJrfBia4P96ntELFhy9wZlb8ir3pv241UghEC1J9vqENuBZFG
	JsRxSO+SIL4YjliV3OFSBEpzKQBF2Uf5RFfPU8KOvHNJeYnbXwvnUdX0F/d/4Vi24VH/yOUjd14
	3wvq2RM/9nuheXPoAzsn22cCwlhk/EASTsMckMwZ4o/OzUwkFxb62hMcWzam+DZsyKt85mu7NFx
	cjnK3AcRnV1zlbnJCgaJjMhLzaHspuqmVQR2dMNghxMUdJS6qOXuRcAgJBrXuYROPEniD6SpdTo
	SLfN8IwRCNCzUBBL2dQBkXdEftjlG5toR8Ej3atls=
X-Google-Smtp-Source: AGHT+IHCr7elXViwZypO3vz2gMF/QMkjwbp8BwuhgflwUBLArbYypsOsxTUGiDrcTKcrsd4O9fOqQA==
X-Received: by 2002:a05:6000:25c2:b0:42b:3ccc:91ec with SMTP id ffacd0b85a97d-42cb99f66b9mr4773737f8f.22.1763672782827;
        Thu, 20 Nov 2025 13:06:22 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:22 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/4] gs101: Add support for Display Process Unit (DPU)
 clocks
Date: Thu, 20 Nov 2025 21:06:10 +0000
Message-Id: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMKCH2kC/0XMywrCMBCF4VcJszYwCaaNeRXpIk2mGtS25lKE0
 nc3tIjL/8D5VkgUAyUwbIVIS0hhGmuIEwN3t+ONePC1QaJUQkjkfi7cPSf3SLzttVQelcbWQj3
 MkYbw2bFrd3Skd6lmPsY/adgOImpuS55eNgf3Y+X5YvsGh0Y6MouCbtu+qQhbh6cAAAA=
X-Change-ID: 20251120-dpu-clocks-7b825d05807a
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=zMmyX4hI98rT4xIF+GHY3RVx8brKYrtm3BxZE7xSi9Q=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LJSo5MK/FUkk0o+R9pPfE6qXx/ssGLCKTbJ
 odvNLZFlHKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CyQAKCRDO6LjWAjRy
 um7ND/0QmnOKBDjDsGJEHzq8JoLBEeeRK+2iHo4jSPsh+LX6XSG/y5frQ2LXNKkiX0wYn4lkuPZ
 7oCSxcRzsW0IDoorM07gZICU/rdPiqQ9I/E+Fwny2Nx4YsG0X3UrdHXhVmz6xQn+eSeb4f2oM9S
 Ev1yhUq2lJxsqGjvgXUDJ8q/5kjUOqsOzw+oNbUHCkXsWff3jBr2b0Y4yxA4C2desQuBs+ss352
 PzLes/1adCC8rKf92yV9XPZAy8sYpQDcbsQya9DL8S5qiqRAexOESoHOw5neKT6bGunmSfCi5/D
 bc/N3+VDG99bGQwlUxcj7t7/KJQWx4ezgVWKdfCjPc6jpQZl7t/nA8FahEnmNVaFvvMFHJceZxH
 0dLlYKVXHLFXWtB28NRzgWLWRko5182DPk7GrHlq9pJpL1XHRa/EPzd5OMJEbnkuY/bO2kRjtej
 WeOqcXAglj41e+YEhI72ap3qfAPRP1NUmMjBpivMbG08w6SxMWP2uwvZMw0lYcBvt8A/ZX23t8D
 Xm3ygoQMxEpBzyEPP8yFwXKopT9/8Lmglb0rqZZgGkJEiQ1FlG9vOyWFg3u7QZbQf7UIzDrJMrp
 tsRfthtirfylRyQHmPQXvUWxubwTXoCEczsNvuVim2htorwsdoMvt0rvn+wquxSdQeaORGU0HLV
 tYWkXgAZ+qp0nKw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_130625_642565_3AA0F66D 
X-CRM114-Status: GOOD (  10.26  )
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

Hi folks,

This series adds support for the Display Process Unit Clock Management Unit
(CMU_DPU) found on gs101. I've based this on top of the automatic clock
series to avoid conflicts [1].

As all the patches will go via Krzysztof tree it has been sent as one
series.

regards,

Peter.

[Link] https://lore.kernel.org/lkml/20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org/ [1]

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (4):
      dt-bindings: clock: google,gs101-clock: Add DPU clock management unit
      dt-bindings: samsung: exynos-sysreg: add gs101 dpu compatible
      arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes
      clk: samsung: gs101: add support for Display Process Unit (DPU) clocks

 .../bindings/clock/google,gs101-clock.yaml         |  19 ++
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  17 ++
 drivers/clk/samsung/clk-gs101.c                    | 283 +++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           |  36 +++
 5 files changed, 357 insertions(+)
---
base-commit: 7850d78b1aaae4eef59e519993bd8a8552b7c79d
change-id: 20251120-dpu-clocks-7b825d05807a
prerequisite-change-id: 20251008-automatic-clocks-249ab60f62ce:v5
prerequisite-patch-id: 6fec555c9a6442c6f0c53b27d096c90dc9f6e32a
prerequisite-patch-id: f01cfd5b3de005b646c158bb7277f417ca6b27d9
prerequisite-patch-id: 08f5690839af740c7975caff424288043474926d
prerequisite-patch-id: fee79bd7b5b1df942a0aedafd4d057faa354b057

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


