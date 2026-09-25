Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B87C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KR0mL9J3pFxTuxFhHbavstVLXuIlIRgXe/fcgJ1tOjw=; b=sf+s50bvJ0iwrJrk6emH7k/Vcb
	7wn83grjCz57VF8cQM8LxEv0fYKSfPHhMTHg9tvj30fjAVB2giOoSrBu2QLb1ZBeuLZfnENNUHfGa
	4WH3MA4MqRYzjuz0PM18+uhKEZMz6LlsP5yYS/e8bdQmGLTYZB8RvbcZjgxb4L67fsJo82ZvdUiTI
	OQJCaYBlCUUOp36Hjyq/zOcKKtyK5OkhKX4sZAwYMJ/r+2PwhsgdrlFMj++Uh/MDF0AAiBP1LgVri
	2ohuWE6zry7wLSRI3qT15Jxad51ClZj099hKcSwYGl9ErtzoCyYDM9+VQzV//l7inl70e3FvASYcV
	OMAuv2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0th-0000000Csbw-37DC;
	Fri, 25 Sep 2026 08:03:09 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0te-0000000CsZV-0QgD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:03:07 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c254fa663bfso94393666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 01:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790323383; x=1790928183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KR0mL9J3pFxTuxFhHbavstVLXuIlIRgXe/fcgJ1tOjw=;
        b=hYX4fv3wSk/14MSLbHw/6bfPF4YVEp/bg/qLZa1mObuBCeBUr5xJCpL8bZ3LqAAVs9
         hXHsDAUgouanYXP8BDDzLVjmI2QS6/qMyr5j5xO1lE4QSGq2dqnXQvuC8vTvfjPetKDU
         gHkpqvm2T4wJxVsWJ7+dwXzrDkVhjhVpYbTIVIg3sFFt6ctXvHxjyfCqt2qzXcD2y41r
         IJI0GEQ20LxVM7Yxajh37cH15mz/6RrF73mF1Sk5YklQH0IhGv2ipnHCvvCf7wnhSS/c
         sKZfla1tR65LkJHoMsG1jDjxEULtwxNN/6OEPzbAqa8VL1x+xJBs3pleURlRFWxH9Ofg
         1jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323383; x=1790928183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KR0mL9J3pFxTuxFhHbavstVLXuIlIRgXe/fcgJ1tOjw=;
        b=0yccP+J90eP9JQpqAIa3tw8BNabZJMZ9SMij1NdneAB9GkKR+mEtg3ABT7pE+f+hQm
         xkAfmM1wGvW0+d53vWevzJ8cUNfCEubkT0Otai1tZkypq5kWIT3V0i1j2zjJ18UuNfDZ
         B3fghhx5DtCT2qfXopE1Dk35mwz0EN1TVq8x2p7RvWxuhLfySvbf39J38YfhN7ISytbM
         19dxhRha/KZwTwWGMNKXcDwrHxCZ3StvvgKJrnvGJY3GLm8pt9XpUG9+AdmK0CX1j1ov
         6kTGihGuSTslt6r6YPqy87rCv6Mia43qc0Uw8XQmPP5LB37noLfuGUrVjkMXzU/JyD7v
         4VIw==
X-Forwarded-Encrypted: i=1; AKwUvBw1qziGVvw6s+Hua+Q8yARKr3NUq7dhHP6Y9kIjpE56JMussEB7Y7e0Dugg083MkFWB5HI+RqoucSAUfYnsurdW@lists.infradead.org
X-Gm-Message-State: AFuF++nIc4m94P4nhIA5GqWaUFR3Oh9kRQg6mjFaMIxThYTVT7vazomF
	5dX1GypRBCIAJWuRr08KKAjcgumgs/Y+JePxxLrdUzblMPJ3WEhFhyZC4O6Tb5EPWnxu0KubjTm
	Ed7hj
X-Gm-Gg: AYBFou3ytmnhSZ93OuPv6H6NVJx/nkFiNI/Fv53RmYDEq2nS1nQi+yVaNFbI2GpUp5Y
	o+4AK7D13AXZiXotTzKBlA8wt1p5hzD9LxFyIpZ+ENkZP5x8GT05v9vF5VCpUmja4gdaSd8nnKA
	m6+YvWIelEQJDRegAu0yNMrY2ZefmzIWtLvJNEvCYS363R+68YmWeOirAzx9iECmWhpyspXez7/
	2s87r/Nhazz/cIKI4DLkNg2H4ba/AhWDbEwkqt47N+G0U1NMCeGsmN8d33ZbwBu8tZsIADlAFAa
	ngL407YaVYGWgOSX6ha2mnqly4gV5cOUQ8mZ0QnbuAYB6TcJGLalLULwWa5O32rukQ2Fm0JOA7B
	dldFlMSRC61PzHg9aVkpVGW0fSdn+guEZ5JMUyZD6C8sSNpmOeuUO5zoE1njTljnfyTxWo+aQHr
	eVvTrHN8OTe9bG3dUd+0adqFoWNrdT+tJZJa7IsAOKBm0HRWTGltmU8wDpDzyIzl1i2fFZZeeqL
	fJPKyB/I5rNPchteM1W1YEgxjem718XrOO4TCNd3zhc4igvizhrnPjDyA==
X-Received: by 2002:a17:907:6c17:b0:c29:f5d5:5a9d with SMTP id a640c23a62f3a-c2ac246608emr448681066b.39.1790323383296;
        Fri, 25 Sep 2026 01:03:03 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm76976966b.33.2026.09.25.01.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:03:02 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add PWM fan and WWAN overlay for Radxa ROCK 3B 
Date: Fri, 25 Sep 2026 10:02:56 +0200
Message-ID: <20260925080258.46489-1-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_010306_337840_D84770F4 
X-CRM114-Status: GOOD (  13.96  )
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

The Radxa ROCK 3B has a 2-pin fan header and an M.2 B-key slot
intended for 4G/5G modules, neither of which is currently described
in the mainline device tree.

Patch 1 adds the PWM fan and ties it to the CPU thermal zone. Patch 2
adds a device tree overlay for the B-key slot, enabling the USB 2.0
host controller serving the slot as well as its power, RESET# and
W_DISABLE1# controls.

Pin assignments were checked against the ROCK 3B V1.51 schematic.
Tested on a ROCK 3B with a SIMCom SIM7600G-H module and a 5V fan,
running Linux 6.12 (OpenWrt) with the same changes applied.

Changes in v2:
- Move the USB host1 enablement and the WWAN slot handling into a new
  rk3568-rock-3b-wwan.dtso overlay, as the slot is not always
  populated (Jonas)
- Drop phy-supply from usb2phy1_host, as the M.2 slot has no VBUS
- Put the fan patch first, as it no longer depends on the others

v1: https://lore.kernel.org/linux-rockchip/20260924071445.441822-1-adam@wermuth.pl/

Adam Wermuth (2):
  arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
  arm64: dts: rockchip: Add WWAN overlay for Radxa ROCK 3B

 arch/arm64/boot/dts/rockchip/Makefile         |  5 ++
 .../dts/rockchip/rk3568-rock-3b-wwan.dtso     | 65 +++++++++++++++++++
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 51 +++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso


base-commit: 23d8f49fcae5d72b77744c7f349c12462c3bb748
-- 
2.43.0


