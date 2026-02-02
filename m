Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8439E73145
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 08:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vWq9Hnp6KWeMpHzlDV6hhOVjTaAvi1IP4KKp2IsINYo=; b=oUG843rB9Vk6ciTstuJ0GdS07u
	ZHF5Y1u/v6YYqIIBhx59s+Tk9SN9Wb/5feVz35+XSMZBJPP6FgV5eZi56yVEpTRdsSKSoxDSODWcC
	r+pOoEmd4ZJTvTPyB5ZzZqX2HyxZdllf5pOy0LZk/kg/4l1yaOjaC2efagssP2E7ITvgaJNVGbxDP
	yB0T+bydHGhGNq4NmmsDfqu2oIAQd1ohpI/nC3gahlk6q4tA9dpd5RsUob4twbcuxp6wglmMd0/+s
	shxYyyoy9jLb32IWOF/gPnaggsMuyZergGX9zUxGkOxYWxixq2/JTHrrpkpJfiK3tx7p+7gtv3goD
	6PMTB/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpR5-00000004eMu-3MmP;
	Mon, 02 Feb 2026 08:37:31 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpR3-00000004eMG-1sJk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 08:37:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so30385995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 00:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770021447; x=1770626247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vWq9Hnp6KWeMpHzlDV6hhOVjTaAvi1IP4KKp2IsINYo=;
        b=RE3N8+E4SEKjwRMVHhEBOZJ56Ln4jbocKAX25MQB9Uc1hPwbzG3DpBdbgSbKIHm7+I
         R6li4BySQlp1FNIagvate6Bs18D5Z3U994IztMLezYWoRMUlOmyvrs9/WXw1uiZ1JyZC
         /oL+bsMYYwAczgxc7nnklKxEhvsTv4Gx0tQh+JfNmVaqTPGotBVf8Rr5lNaqeDD9o5WJ
         pgvOlXUxWd/e7OioUwluEXgvxEAtXUB3Bwocq1KUDOcP5fByZdHC/kzzADgy3EmBWLX4
         9W3MoYWxbMbMI6TGQtcn01vZhxMj/05dQ47HhuMgnJmbgNRW483f/ulTYsWg5rbuj9Tb
         MbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770021447; x=1770626247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWq9Hnp6KWeMpHzlDV6hhOVjTaAvi1IP4KKp2IsINYo=;
        b=btu88/4bYGBF28hHNvwWEVmmZLvnvkQEILxoL9ms0Er9GaC7DDozay9+xLzgHMem9Q
         SZ0jF9qF0mfP8Guy0ekhvTAiF2i99+QvfTdbVz+blEWAcx4tSY2KVD+ey1VmI4ze7xJV
         wnTJKbDv9mzDEbh+HQqAy5eunrCs2mzfM4kVNfi4MB6tBMjfYt48K+g9R3pap7FwxpCi
         BSyxtLxyTgHMsXA6ODIuRfLqOTN89x1K40oKnQfFDt87BGAa/V3rvI9rL5cDZgpR/L0h
         qaAvLqZXJqPsjtQ6v7fMJCCbjIIS7PFpSzRgVLPvPdo/9Dl/iomlPZdFS+1vOzFXkdMu
         WoNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT0tw8QI7ytEGOUJ0/t4hI2rze+wkg5D24h5xGwlz/j2xmMXFO0wpHSanuOe7x8t7xupkacMnoZu09TxymnW7u@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnim+lhJMRBPk7AsU22jA7BK4v2zL3Pf/O9hLcO1U2w3WltC17
	UsDC/l5Qx0l/kLvZ5+6xkmf7pPD0AeWE7NDgoizHJGTovXtFcWUTbJtF
X-Gm-Gg: AZuq6aJPCsVrBUnVVmFXeT8ePYMy4iaIUdJMGFgOykY6jqW+QFR2UEueVCdZh3BEoh9
	vv1tvYx5vrVzbrJhx6bQlyK3hJEcSCUL0v9K+PBWfyVaLF4spnMSPQFP20sz8t7vA2jbeoQFOcv
	364slFJePqBdjqFA1Bw8Ju7xOoW1Lj84//f/9FPoWJ0MUzJTjYXDP7ok1RvQq75xpOQi6NCGNb+
	RMYEYAt7TxOsULfD6r754XXBM/RCMGAl3ppdWKdfqe5gNRXUc08W+g+m+EoR7PTomxBvss6YeOu
	K8b6Q+mfAT0Tg3LP0n/tWqG9nhbYyLB/49nNMLElMTpqUZ2n++9KZAEGmkCa7YlKQyAy1Z8hg0x
	lQZyLArWYepqy/aNOyATn5nGxWEV9GdOleDgRkvxdorSIuLL8wLJb7yB0oIBSeepioYHHLsNuyP
	vkcp7eZhaU40271QnUIAaVW0gbRy4aD3q+1t2mazdNwpf4rnC7D+grebKA/SpbBzHU3DzgJe4Gp
	/vKp7HD3WDG1Kw2NycQCa+CxdZ72N4or4LQdMouxK1ZmvaD0YHckXV13Q0iay34L0EWDpTTKe8R
	Rc5FWtaX
X-Received: by 2002:a05:600c:8b31:b0:47e:e78a:c832 with SMTP id 5b1f17b1804b1-482db4b692dmr124615335e9.37.1770021446832;
        Mon, 02 Feb 2026 00:37:26 -0800 (PST)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm399535415e9.14.2026.02.02.00.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:37:25 -0800 (PST)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: ti: k3-am69-aquila: Fix DP enable GPIO
Date: Mon,  2 Feb 2026 09:35:59 +0100
Message-ID: <20260202083604.325060-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_003729_495974_ED090838 
X-CRM114-Status: UNSURE (   9.86  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Correct the DP regulator enable GPIO to index 21 on Clover and Dev board.
The 3.3V DP regulator was not being enabled by the assigned GPIO, as it
is routed to GPIO index 21 and not 37, which was causing instability
with displays connected over DP or via an active DP-to-HDMI adapter.

Franz Schnyder (2):
  arm64: dts: ti: k3-am69-aquila-dev: Fix DP regulator enable GPIO
  arm64: dts: ti: k3-am69-aquila-clover: Fix DP regulator enable GPIO

 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


