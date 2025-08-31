Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABD6CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX2JSAZgj2wBU/RFTeov5tRZASF8EFkjg2DWvmdKZ/0=; b=yWavxerSLaONrZg+XR68dxyH/3
	iFGs1Npwdb0yxV2U5eX5DTt0lduxn3sebocjGOoXEQuTAHF/koU/nIyOYKL6TgkMFb6vbgzvIGak1
	03mZOm8RH4ksF5z/CNtLVAMiBK/QM/hWggKtKz/RKrJna/FZv4ta77lvF0OOyt4KPFaJp/Nj85ELI
	sfJaHvxIUmpUSUngb4edNBBhhOCQ7jrzDV5SeyvChSwiaRW7baOPJqI37YiGVbFJNj2KS4Wq8oN0S
	pTQyVJ5tAOoF1H9w9oSF60s8CYgf6Hp90HdVSo/U3yTA8s+FUhiAg98BzuuxcNsfj/ITrVNT0IVZE
	xl7Gw+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgX6-0000000A7aJ-35tV;
	Sun, 31 Aug 2025 11:47:40 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgMO-0000000A6vl-05Uk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 11:36:37 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-70ddab8117cso29633796d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 04:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756640195; x=1757244995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UX2JSAZgj2wBU/RFTeov5tRZASF8EFkjg2DWvmdKZ/0=;
        b=SvdGiq9ZnZyCcgjhq4hUiWYXukeIkV5/DhcE37Au+O3MKiCeY7AnfYAj+6xfAWSyFP
         bPeradTPVYE7RNKvZg8ljCYqxajVOlnWWszJ7qEiYUmDTcU1UioJDP4GDUu0BVUT5Pve
         SqnlJNlIVZyA7/GKoCaRcoAhLPccyTx+ed1vgn6/0foPSMaVew6lz1b7tBNI74mt1jl+
         UKLtLQUNTSLz4mhid8RyD2xQPVlArJ5GIKgGcTQ4eqziJ0PvrTaJGp/UluLWp84ew9zs
         8lQk8OiRMzqVQTzf8Hsor57RVyK230MLAGoD+JGlmSx3X09d0O+hjS8uoUBROS08wlLo
         zG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756640195; x=1757244995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UX2JSAZgj2wBU/RFTeov5tRZASF8EFkjg2DWvmdKZ/0=;
        b=BCuaEKwUIrfhhUQwlZjTF2be6ATrIkDqL+0Q/Mq0rV4ydTKts5bxqReDcQrMlif3Af
         UxRgKz/es0WcDFh1RLmsA7kZ2WAN/fmFOw56jrznCVZOlY1Zy+ojjyOIMFxLNyTgNuPh
         0K/CV2cpYKpnZn5h1DuhYSRJG8vy6c3SAXOD1Inpq/pfohVtR/MzjxHn6lFk2qeMcJc5
         q2xC1KqQemDaXdDUVTHE87aDut19sa1A7R6+ZpPfUL+fXvP0/hxOIyl57zADFuth5QgA
         i6zPecNFF9wtI/z9SNg6+6cqhXUXb139QFNvdKvT45tQrioq2DNie31zc1QbW5s9KWpL
         tA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOvT3KOsMssCK6UO3DQZsPxZFWZtDzzOc//AxEn1EF6T5c7mcqzobtXaGVJvHauKdIC0/YSOOYg2Bz+Urb+8lX@lists.infradead.org
X-Gm-Message-State: AOJu0YzrMmb3BjdNKa+7lOlqiWU/ZOUJ+baTNCJYiLQC103ChHimejKh
	LqEaBMKm8HjmMw/Bb1LcqewNsleWe6kmq4iTKQcxE6K7f66Qb+bdAipg
X-Gm-Gg: ASbGnctJgiMJ3Jz+FtcejT/82s6/X6yddlOQdkC/+GuoXe0Z8sEFqKiFYFfrEvYeXl/
	XATSJq/AdkglDlOP1/uvac9OaNrpdGpCnmUc1/1KFfZ7DlmOSk5oIEJQ4ktel9FghuCo3EOa48j
	ejrJ+ns1qDkgQggH6qUZExuH9nHF9Etgw8/OwezPqNQRW13SmG0p0Nm4PSt04efBAAJUHKG82WW
	8gWkOutpYIbeoidFJqv7s35UiOPBv4DTt5v381Sxoh3SS19LAXiDLXlgNxVNVnyU2ebX/e6KQ1U
	MoGKxKozWXVfO9fVpKx/Bc9Mnfdq6NvnRKEnAjdkQK21SNDzFGahwcTTLNmHAXKJTEQCm57FJtJ
	VuGTIm1Ixf43Kh3t7lROZBKlFGVmUK904CM+X9vnWxw==
X-Google-Smtp-Source: AGHT+IHTkP26xog0yMNm3B+SwhBdAjr8QJEF3EYmYKgDrxr8Gok7j2NB8tDWQTeOuXHpveiVGhgqjA==
X-Received: by 2002:a05:6214:76e:b0:713:12c3:9fae with SMTP id 6a1803df08f44-71312c3a291mr22891676d6.8.1756640194865;
        Sun, 31 Aug 2025 04:36:34 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28383b9sm20519076d6.37.2025.08.31.04.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 04:36:34 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 31 Aug 2025 11:36:28 +0000
Subject: [PATCH 3/3] clk: samsung: exynos990: Add missing USB clock
 registers to HSI0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-usb-v1-3-02ec5ea50627@gmail.com>
References: <20250831-usb-v1-0-02ec5ea50627@gmail.com>
In-Reply-To: <20250831-usb-v1-0-02ec5ea50627@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756640191; l=1291;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=NZAHdt9F5rXzmbN5Hw/0e1pggZILf7NjvtYrLHqHZzg=;
 b=N74W6zP61WXE3Sp8sdVokQOqEkn6v08RPGvUJjdp9ga8f8gznDsm6utDRnqmMuQ09GG3+2yM8
 u/VQPgqm0VqDiWMIupNJCxHf79sZFuFwKm48ns1pYGgnmsKOTJNWwC3
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_043636_068127_A887F8DF 
X-CRM114-Status: GOOD (  10.84  )
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

These registers are required for proper USB operation and were omitted
in the initial clock controller setup.

Fixes: bdd03ebf721f ("clk: samsung: Introduce Exynos990 clock controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 7884354d612c54039289fa9b80ad08f34b9b7029..47a1e0850c3020ab66931ae0c5ac4920f41496d0 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -1224,6 +1224,8 @@ static const unsigned long hsi0_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_SYSMMU_USB_IPCLKPORT_CLK_S2,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_SYSREG_HSI0_IPCLKPORT_PCLK,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_ACLK_PHYCTRL,
+	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USB31DRD_REF_CLK_40,
+	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USBDPPHY_REF_SOC_PLL,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USBDPPHY_SCL_APB_PCLK,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_I_USBPCS_APB_CLK,
 	CLK_CON_GAT_GOUT_BLK_HSI0_UID_USB31DRD_IPCLKPORT_BUS_CLK_EARLY,

-- 
2.50.1


