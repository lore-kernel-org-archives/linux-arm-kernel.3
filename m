Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F32CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7efvOtPkVQs2r0jJvys2pZpGeATiCwhTrDVdy86Rwg8=; b=1gFljHC0fVMS6Zdk+mIaVtTB1/
	kPtsOiaqbmg9lCY0YexDiDh75LKHa3dID5T59T6xC8456lxb2kgwBWIVdJjdqyaCF8VtLnqsdoUTj
	dc4ftlUl/Zv2NTwP8173HgSHR50T+nmTddjgepVX0wcFvPZJ4/CgTf6quoG7EvqM8gnoUoj3U8BS2
	RI4YYrYSZf0aHr0xr2TXmodFRwlJQKpAcD6FFYb5LEETYHf0t1K3okPs8UWRxYAtRYDqeK/YZ4OM0
	N+DDZiQQj+ahgKiIWSnIT7aIqCq7ennIkKN/VOeAnkLSRvajAScswFQPbe3hEkXGHL1UBmrbE2D1J
	EJOvPVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKJh-0000000BAF1-1YkN;
	Mon, 12 Oct 2026 18:00:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKJe-0000000BADZ-1JYS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:00:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso15005635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791828000; x=1792432800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7efvOtPkVQs2r0jJvys2pZpGeATiCwhTrDVdy86Rwg8=;
        b=p46KUBmH1voUDn7tk/zYNTUmCJCLtlM+TA1drOwfvyJBZu/sDAGZxQyWuCNIwIA6TW
         77bx17NPHLaf32FEmqkG0AJOIXUBqJ5JV+Z6YVL5DA5DE1X3Z8TfknDX9CSUFd9mgu6U
         73u4vSNX8nQ3T7OwTOHFU1SuqkocobX92oYOWjl6c4oTgUwGMc8zAsBnRY1n3mv7NJat
         /Xh8IlaUKL7BOtjPtMHVhGGJJRdNIdvLA860E5CcKWJHQ0V+TH89yqCyMTRi1vTI5Ebx
         mc1igQEkI3fhfMykuOFCdJDLxi//5tnYwYwVarDsXyAES8aQmrL+vaXuhy2atiIyTbQY
         eZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828000; x=1792432800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7efvOtPkVQs2r0jJvys2pZpGeATiCwhTrDVdy86Rwg8=;
        b=Vmb23LZDRqJ13hmD2oX58M368d66eVre26PoJeHwICx7n6TRUOXdqTxHVae0Bw7ORG
         53U/mRYB1CSEZcwf62jQYwtaAaair3PoivKKT8zljA4IKR+CcD+1D5Z5bGjxb3lNWMse
         s0UmvOwt2w9f4ItFDMMDLuAtjC9135f9GrrMDQi8mx0cazzdD6F4SyPAndvcpCtlU3MM
         uWGqUxomn2xcoYg5q8RMq6mcahHV3iTmxNnkMQXNtl46d5HZ9qTzSVWXZZUIR7N8jENC
         a9zObYXvH1OSYFPB1ppM4rjbqN0jGlEBQNr6nCfjw0wT4VRSEfNYVYxcb4vFkt4I/zU1
         Yfjw==
X-Forwarded-Encrypted: i=1; AKwUvBxZ6ohJi7h49hjLFaBBYaE7UfD18fDP3CfgcIi4EKVUfBWWaZoBO03vZjhFea1BJQ0iZ/aIdf0MvRlAvhNmztWh@lists.infradead.org
X-Gm-Message-State: AFq9FYIKviImad+kwp3MYGGjAHdZm1Y2/lyMjBK9XrV37OqaX5WH2X3K
	TAd3n0dcM0SbQRF+EYRK4Q/5ngeKL8h1IX3EUbmbsiu/WRhPj3veTQRy
X-Gm-Gg: AYBFou18ghoMNXFuv1QLdBAT6WOSzsEHpYPVcbalFoMT31eYpRhBWcRMVy7yFt8D85a
	IyByGgPpmp9PUzJLMpGbomuLdLoTW964tbqrPpxNfA0w4wS9W+BG2QshEgPi/p+eVmZdcTC/PAE
	9CCNgY9WQkepDcBAJgU4WOtG5LEQXanbT0VnM6DsLikQN9FZEnBgT7ZB4tdKK8G0zdkEcsB9+9P
	x1T8UOtNxA8L/spWioAUg0X2GaMvKbzGnaJMrVODIXV5aV7Ov57ASEGkwk5msEiKeeZHZCmO9zj
	y+OnVX+cIwrb8t/uym78/ADZ0vJwCtDkwMAMHrd852rK+2HR3sxFzt2bdyevc6XkZ1zCe5DEQo8
	Q6JGdNOkM0i0CceDxQt+6gIdxcb3+Dx/BZ2TgCUtHXjKTFd8o2B0PxolRoOSUV1bmhDVPUEIdH4
	rqEaLy+07TRiN14uCBmOqnpyQIPiJqORwFvGvLt1GtJ05k6aXnEz3vO9ciozAfO/LpORLDpYDo0
	X5mT6BP7v6SPmyp
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr193832545e9.24.1791827999830;
        Mon, 12 Oct 2026 10:59:59 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.76.80.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm561705395e9.9.2026.10.12.10.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:59:59 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
X-Google-Original-From: OOHehir <electronicconsult1@gmail.com>
To: m.wilczynski@samsung.com
Cc: Laurent.pinchart@ideasonboard.com,
	alex@ghiti.fr,
	andrzej.hajda@intel.com,
	andy.yan@rock-chips.com,
	aou@eecs.berkeley.edu,
	bmasney+clk@redhat.com,
	chaoyi.chen@rock-chips.com,
	conor+dt@kernel.org,
	db@domibel.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gandalf@winds.org,
	hal.feng@starfivetech.com,
	heiko@sntech.de,
	hello@big-grey.co.uk,
	jbrunet+clk@baylibre.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	jpeisach@ubuntu.com,
	kernel@esmil.dk,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	luca.ceresoli@bootlin.com,
	m.szyprowski@samsung.com,
	maarten.lankhorst@linux.intel.com,
	mani@kernel.org,
	maud_spierings@murena.io,
	mripard@kernel.org,
	mturquette@baylibre.com,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rfoss@kernel.org,
	robh@kernel.org,
	sboyd@kernel.org,
	tzimmermann@suse.de,
	u.kleine-koenig@baylibre.com,
	vkoul@kernel.org,
	zhengxingda@iscas.ac.cn
Subject: Re: [PATCH v5 00/21] drm: starfive: jh7110: Enable display subsystem
Date: Mon, 12 Oct 2026 18:59:41 +0100
Message-ID: <20261012175941.258219-1-electronicconsult1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_110002_368797_DF753F27 
X-CRM114-Status: UNSURE (   8.61  )
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

Tested on a VisionFive 2 v1.3B with patches 1-17 & 19-21 of v5 on
Linux 7.2.8, plus the clk patch that was 14/20 in v4. Patch 18 was not
applied: it conflicts on 7.2 & there is no Rockchip hardware here. The
same kernel also carries the out-of-tree PowerVR BXE-4-32 enablement &
the SiFive XPbmtUC errata patches, so the GPU could render to the
display.

- The dc8200, the HDMI controller & PHY & the vout clock controller
  all probe, with nothing left in deferred probe; HDMI-A-1 reports
  connected.
- kmscube (GLES via zink on the PowerVR Vulkan driver) runs at the
  monitor's preferred mode: 1683 frames in 28.1 s, 59.93 fps with
  vsync, picture confirmed on the monitor, no GPU firmware resets.

Only that one mode was tested; the modetest sweep in the cover letter
was not repeated.

One error at boot:

  i2c i2c-7: of_i2c: modalias failure on /soc/display-subsystem@29400000/hdmi@29590000/controller/ports
  i2c i2c-7: Failed to create I2C device for /soc/display-subsystem@29400000/hdmi@29590000/controller/ports

inno_hdmi_i2c_adapter() sets adap->dev.of_node to the controller's
node, so the I2C core registers the controller's children as I2C
clients, & on the JH7110 that node has a 'ports' child. The display
still comes up. Should the adapter get no of_node, or a dedicated
child node?

For patches 1-17 & 19-21:

Tested-by: OOHehir <oo.hehir@gmail.com>

