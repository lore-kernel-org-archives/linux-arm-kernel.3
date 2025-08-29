Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D72CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 02:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8rqunLN033sFAkyGdyaLYf8O7m070HCgXqjcGrGgaTc=; b=pJyKPPE67XmUqRPG8qwZcDVvW4
	8AUJxtGrUYPEcfg3KRxXIaBsgwRwNWidrg6JJxI/YYxMGH9fMyXA5Omh0mPDRvh/kEC3De9ULFx8k
	dT9U2T2PbAgoHs8Rpbn+9JP37pz5YKYjZA+cygqCuVL0RLj12D+QaEjLrLG+mDAtVlOisr7oZ6Nh+
	dKsOjAZ13DDjOLtGmi6GkKPX1F8rA2AsVglyfmTS/fqATN8cBPtMieXmBND2LnWEI80AlDtXGbych
	DLr0F0n5B3HbN3A3JAhY8YftBIxARnuuucNrPpchYv0L2V3K+VKrwhrAQcpyW3zy+47kFGKDkM2db
	Xg4FxZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uromX-000000046sF-09j9;
	Fri, 29 Aug 2025 02:24:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8b-00000003tZE-0IZP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 00:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8rqunLN033sFAkyGdyaLYf8O7m070HCgXqjcGrGgaTc=;
	b=X0t+9GC6MoI0PLs/HRu/PxT+/AY4xABaaScSagmhPOusllB28RY8IWK3ypJwlUkOTOB1Qr
	714SLQy7zv6d2N28AkfP04ZtcKt1BtESlHrarkzmouELJWpPMfLtvLBr7PGUJE7b+EMZ/c
	wqFX+NeSFVSEoj8W3knQsb1FI6x1njw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-mf0-D3jPNVa6OpmBnFP1RQ-1; Thu, 28 Aug 2025 20:38:37 -0400
X-MC-Unique: mf0-D3jPNVa6OpmBnFP1RQ-1
X-Mimecast-MFC-AGG-ID: mf0-D3jPNVa6OpmBnFP1RQ_1756427917
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b0faa8d615so68361641cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 17:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427917; x=1757032717;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rqunLN033sFAkyGdyaLYf8O7m070HCgXqjcGrGgaTc=;
        b=DYvF7uEFSwFms8Q9W2+ZnxG8Mjfg6tsFD2jyzmuTge3Q6BKkxHVWiN5ZhmnpmFZaJZ
         //LRpqPKMgH1Hb9H5ZioFzGGuGVnugDua3yoSmK2gXK6SH91So3E64W23AKGhvf/gORq
         QUC5fSBQ+m9On9Ctng2iP83jF94Z92P82m8E919kYgbwC556MzUbtsBtRiyMduMK14ra
         OHDB9qERs2dNseuF6G6BMvEIfFtXyn4s9cp/cxBMqz1PqofTd/vdIAQXz9ITK2ziVIE6
         MG7KhUmeuGnrsExpQkI9dT2FIZUFQ/z7yXLxwmDQJxbF+4jZ043M1A3hiz7OYrNs6Z4N
         V/DA==
X-Forwarded-Encrypted: i=1; AJvYcCV2AXaohcTqlAviihAX8O8EY/7j2IH0KT34ovIx0ShIeoWukddt9qWZoAJ1Tq/x7ZjZysuqTAcLN6REporfeOeZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8unq5DyaZIQ5CbBoQH8Mb96sn8UBINvdIjm/I9iG+189u1H9j
	0CbsXf4pq1hQCwO0JPguLsInkvoNW9xXhpvFwmc14VHw7UmimCxKFYNmOffOVutNMdZ+f4ma6fL
	+kYkY8uEn8ZSGXaM8Fn5RXE7ENhbQRxt4911CIprkpHD+ZSVYSCT+M3XpmlGFj7hF4UPe/yehIZ
	IT
X-Gm-Gg: ASbGncsUUjWSKgTqHDxdwR39SqMV4ceJ2Rk/5EhoKxfoEyeM2z68mkGVCvnbvz6Shrx
	9ss0KzKuDCl8/ceB8hSXXMNQRiusbJzSX6b5AE3gcI1sr+fHUvgS9aFZUbsBPl+ph4HW1lBWgGs
	ULZsOIIUjgKdHI/6JHki82c2IdWFBEmzM32sPNWHgCYIJjZfyYihD4zSZBsYpWJs3OhwSYB3hAB
	x9fGcLNDDt1PUyYywFh9j6EKH+rDKKPrf9qC463KJdGwY7NY2wz3pY8o+9PISGjYL6A2I5+K6WT
	lv3y8uURu2qyExBpfrr2tenC0LgiY4yOvija6RH/hP3isqn719m86dSYYSdBJNYECXt9ZZGyU3C
	JMU3kg241b4GRQUbjKYevIV9ptkkHeL0Brg==
X-Received: by 2002:ac8:5acb:0:b0:4b3:7ec:d22d with SMTP id d75a77b69052e-4b307ecd715mr29164871cf.20.1756427917029;
        Thu, 28 Aug 2025 17:38:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrNg2tdKhgAQRayLc8LgRw9eIVhmfPzttivKDw9wQ2+vibEJMjJFoedzMgEqufDrqQJ1tp1A==
X-Received: by 2002:ac8:5acb:0:b0:4b3:7ec:d22d with SMTP id d75a77b69052e-4b307ecd715mr29164561cf.20.1756427916486;
        Thu, 28 Aug 2025 17:38:36 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/8] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Date: Thu, 28 Aug 2025 20:38:19 -0400
Message-Id: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHv2sGgC/x3MQQqAIBBA0avErBtIQdCuEi1KpxoKi7EkiO6et
 HyL/x9IJEwJ2uoBocyJ91ig6gr8MsSZkEMx6EabxmqLfltR9isGlOEkzBq9GpVVk3E2OCjdITT
 x/T+7/n0/tcMa8mMAAAA=
X-Change-ID: 20250828-clk-round-rate-v2-c1b181f598d9
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2337;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=qOHN+W3Wz6uTZsr/RwMmfVYf0YXCACp4YcP7f8Cqg6U=;
 b=2DUui3a8WkDmdWMGxKa0tpZlU3l9oMHhpwiGjtyJgflCFJnuf9oCUJ5nnO47Aeh60KidBjjhF
 owMBgQLSuwVBuDusC8N4CQta4YOJg/XwS432e14Efcrlr58u+ubkwbg
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nUa66BJZdlNNP13DeWoc8pOv55StqQGodUIqI_MjshY_1756427917
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_173841_532642_3F607124 
X-CRM114-Status: GOOD (  11.85  )
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

Here's a minor v2 to my larger 114 patch series at
https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com/
that only includes 8 patches where a v2 was needed. To reduce the noise
in everyone's mailboxes I'm not including the other 106 patches that are
still valid. I will supply a 'b4 am --cherry-pick xxx' command on the
other cover letter to exclude the patches in this series.

This series has no dependencies and can be applied in any order.

Changes since v1:
- clk/rp1: Updated to avoid merge conflicts based on what's already in
  linux-next.
- clk/sophgo/sg2042-clkgen: Removed &*
- clk/sophgo/sg2042-pll: Updated comment from round to determine rate.
- Removed unnecessary space after cast on these drivers:
  - drivers/clk/nxp/clk-lpc32xx.c
  - drivers/clk/x86/clk-cgu.c
  - drivers/clk/zynqmp/divider.c
  - drivers/clk/qcom/clk-alpha-pll.c
  - drivers/clk/rockchip/clk-half-divider.c

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (8):
      clk: nxp: lpc32xx: convert from round_rate() to determine_rate()
      clk: qcom: alpha-pll: convert from round_rate() to determine_rate()
      clk: rockchip: half-divider: convert from round_rate() to determine_rate()
      clk: rp1: convert from round_rate() to determine_rate()
      clk: sophgo: sg2042-clkgen: convert from round_rate() to determine_rate()
      clk: sophgo: sg2042-pll: remove round_rate() in favor of determine_rate()
      clk: x86: cgu: convert from round_rate() to determine_rate()
      clk: zynqmp: divider: convert from round_rate() to determine_rate()

 drivers/clk/clk-rp1.c                   |  58 ++++++++------
 drivers/clk/nxp/clk-lpc32xx.c           |  59 ++++++++------
 drivers/clk/qcom/clk-alpha-pll.c        | 136 ++++++++++++++++++--------------
 drivers/clk/rockchip/clk-half-divider.c |  12 +--
 drivers/clk/sophgo/clk-sg2042-clkgen.c  |  17 ++--
 drivers/clk/sophgo/clk-sg2042-pll.c     |  26 +++---
 drivers/clk/x86/clk-cgu.c               |  35 ++++----
 drivers/clk/zynqmp/divider.c            |  23 +++---
 8 files changed, 201 insertions(+), 165 deletions(-)
---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250828-clk-round-rate-v2-c1b181f598d9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


