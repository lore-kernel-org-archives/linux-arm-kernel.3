Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C583D3F083
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvMGMjr+cGrxf3kN3/yzoufMe/etzQ/b/TcpkTkqcfA=; b=mh5Wk+MOhyu/Sixk2cS34yEMW5
	sgKZecsY5jbcuKeyQfdhaneuFws+VIZXjRl++XM6tbQouC57ZahRFDcQt76kMcutuayKlfRG0IASG
	lJV2UaSnkB0hforu/3XcpPDWHprvCWBNnybkC+QWdim6N9DJgJWB5WU+HAfRk2q/hmiSyv0RaTV22
	0lZRBFq93hanXcwABMfc1iGnoIxftD6HfUYTTTTeBFU8sJJJKkbvG0WVWjOMsjxO4rxPutvEzwR/l
	j6D/etDpvOT5dApGvkduY+8L5VHdgVIC6x0Wd3UQq475Pt6Lx7DWU0wdphGe3h0h8bou4SD1j9VkN
	b7bpsBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7tV-0000000GK44-2Gbf;
	Wed, 28 Jan 2026 15:55:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7tJ-0000000GK2M-1pin
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:55:38 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34c21417781so3787898a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 07:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769615736; x=1770220536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvMGMjr+cGrxf3kN3/yzoufMe/etzQ/b/TcpkTkqcfA=;
        b=c4/8FtYLDeqaqL5PecoQYr54L9HnNmoUi0Sebj+V/SEd/I6AZnO45/JQaJajOAxVG/
         s4KK48mA3CcdUNbjM/ffrSSiRLHSuRZUlvU5DQERNUYoE3IhD3hxFzFVDnj95ftUB6pG
         fF8OdP9fMh+2XYMqAucydPf5tqN5BT3Z1Gvrr8PrFgizMohtbA5KWQzp1Aug43CQ/dmd
         4BkxQKSJL6tu/D9Ddp/7tl+sF//LDQYk3gQw8DHXEtFhngAMCUK3aWA2v1WYg+IIzSeJ
         jzd5yv5UCIbD+UkW7l+yw0XBp6q3Lfxk8J/97HsaEA4mWcnU6O2L7vBcI6oDF3Qj9rSS
         ytOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615736; x=1770220536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GvMGMjr+cGrxf3kN3/yzoufMe/etzQ/b/TcpkTkqcfA=;
        b=U1ZfSXQrOe0MZhtHt8kn982+z+SCGXA2FSpIE2f4v0BTws8lxR/yec6ckULqljEZWy
         crXbs1WCf6sKPrhl/9GofZIFGB3mORn8WrO1gcV9NZSvHlARiQPlJBYcmiee3IiNYjLq
         q+nDSvHX8d8Nd36+iLCvDj0nAtsXv3ygSeBWi9gKI37VOT/NziDUNBxGdkfB1taEhp/A
         f9/6CaSazKzsMUQhBRkra/iUARAEbdfi9d9oCjcKzKtucdQ38Mr9sz2TP82Yc3aKvfTw
         hLk4iuHGQvwD6T5FERM9saOvoIFXhTCb4ajmwVkIQJhsTK6RIbKD5LnUwZ6KTECjMilQ
         I1/g==
X-Forwarded-Encrypted: i=1; AJvYcCX1jCy4HqXNvJjVKDqfrK0JS9Jxmb9NrHxCI8wW8ge50EPS6fxB48jJvkvDBH1I6WNWn4L+bEuYMLcxD0m5aBlX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+T/V8tHb4IMO/nXz0tz1nwzKSZSx67v2DTJUkuR0uXhlPX9WR
	XSqAJ1+qXfFkqT4CKEw4Ch9Zs8N3MEMhmRk0bFzxwoVzSFLwcWfkxH+Q
X-Gm-Gg: AZuq6aJCsn+ZB+qvPqLTN86dexPYekFDtcEMdGs60a+wwYtr+ZA2e0lQgeuG1BATt7G
	euYiQPN8Qkr86udo5d0J/UQifkto7JmlV0wx1LlkLnlRMqOP/OCMDUJhapIbaEX/B3nZBTYSBC4
	LpQ2HYZUhxn+XbZSjW/HW+RpEbv7ryLtgn9nYKSYyBymYZvLCaYUux7zRE1pXZhJrDBZDyvsJmS
	6EMw+mE0PDvy8Fxe+l+yIaYMkknwnEgU0X10e4oYDyEjSYaPf6CJmjDn+ZtrkDYQ7Xdvjc4PNZF
	G9yl8ZZSd+e3oAlCDoTD8l7aQCFeclzrhG8aTzZURM57iwQuti95i5JzUMksQN2DO1XbQYODnfr
	EYFXnlzTXrDcvD1tlA0NP11HCTGvFNMWBl8/KY2vbaqoYqtO1NaNCsMY8kaSiS//tyli7SzCZPN
	SDQXK6YNB3u/yMk6pA5UdCQGBzfWh7Doc43kXAiDNhtuPXDeiXG++YW9k=
X-Received: by 2002:a17:90a:f946:b0:353:f7b:6d60 with SMTP id 98e67ed59e1d1-353feda10admr5504546a91.33.1769615736352;
        Wed, 28 Jan 2026 07:55:36 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6427da845csm2621521a12.12.2026.01.28.07.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:55:35 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v3 0/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Wed, 28 Jan 2026 23:55:28 +0800
Message-ID: <20260128155529.3699599-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127025740.2601841-1-onlywig@gmail.com>
References: <20260127025740.2601841-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_075537_479498_26CF928F 
X-CRM114-Status: UNSURE (   8.96  )
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

Changes in v3:
- Misunderstood reviewer's feedback in v1, improved commit message description

Changes in v2:
- Fix Makefile alphabetical ordering
- Move vendor property before status in device tree
- Simplify commit message as suggested by reviewer

Wig Cheng (1):
  arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM

 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

-- 
2.43.0


