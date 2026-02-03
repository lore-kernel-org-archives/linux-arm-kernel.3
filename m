Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB18CE8784D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lCCWfX+RTN+RFIpNru91vgHZ0s3vaP/vzRTVdY5xY5g=; b=keCrMFskLgb7ei
	p9dME5tMEjEr4b4pFSjgbDa6XdQFYhHrSdkHi7Aigx9YKwcRVGOWwnzJT4SKW14AfWwZlq6sAv5qs
	+eAFSIXWEu5e+Geaa++lA5eFUl5+jC8PMp7Tc5TEfTG8+OCqCEBryeQuSzqZcdSdUKtXAqCHpUIuh
	mzroorieschOE+UpZQDX01yN11Nl90POvzI67pAVvMJWngZOHO5LM+ID6k2ulr4pJkkLvDZ+VoBWL
	oej6WxhsDmsQMkr4wxuP9a4GvnkOo1tJ+vW4WL37AaJ+26RCrKfk8HkyTHgzdacxVrnI3lhEpU++/
	AQDJaiiJofBolaTD/VMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY0-00000006xty-1t94;
	Tue, 03 Feb 2026 16:46:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJXx-00000006xsD-2yQy;
	Tue, 03 Feb 2026 16:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137194;
	bh=1wCCJhLH6e42tAT4nyZ9Lh3XvYr8L211TUISUATgG7k=;
	h=From:Subject:Date:To:Cc:From;
	b=WN0UgWQcmkVUms0iz88FOseI4y4MEQr+NTSA1WZcu6zolrqOr1NoeujHLfPyyy4CN
	 Hyi+Fc38upyUhRdz6EwopB8ftTM4pkk2UmawEJ1fG1WCpHhTQgKSOE52JMclETUtLn
	 +D+Nrb5R2WQPBW61vogCdnbTpd3S2E1zqLF5EHQG/ah2U3pQjc+K8+uNI07GkYuVxT
	 xcmQhI8VJrShc9LveR0jekgGHdI3a23HjLvKU51p10OoGGLlvMxY6lrHAQQuAhTV2m
	 RLrWmBfhR2IqLXeuA0XxWRQKKikTN0p57Cq8Z5khJlNe4dgK2JCw7ENxL2oa/ZCXHK
	 uC0NEccXY/hQw==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65CD317E0182;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 108F2480024; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 00/10] ASoC: rockchip: spdif: Cleanups and port features
 from Rockchip's BSP kernel
Date: Tue, 03 Feb 2026 17:46:22 +0100
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF4mgmkC/42NQQ6CMBAAv0J6dk2pQKMn/mE4tMsiG7FtWiUSw
 t+tJN49zhxmVpEoMiVxKVYRaebE3mVQh0LgaNyNgPvMQknVyFI1ED3eceQAKfQ8AE5k3CuAcT3
 YlO3iEPBcyVNNSjeVFLkUIg383i/XLvPI6enjsk/n8mt/ff1Xfy5BgtFYV1pqZa1t0U+TsT6aI
 /qH6LZt+wDC95yK2gAAAA==
X-Change-ID: 20260126-rockchip-spdif-cleanup-and-bsp-sync-c94035e27640
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Zohn Ni <zohn.ni@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2069;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1wCCJhLH6e42tAT4nyZ9Lh3XvYr8L211TUISUATgG7k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmmIMEIMGxa/LwUh+DEcNuaUfRDMaGJL8
 fT09jiKT60EXokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qa2cQQAJ7VHDQRuce0yGO/qGD8r1Q5r1lG/dnLp7svx7oPtiBId41jyIUJCK6QzqazAbgGApQ
 PEpyJQK0Sc4PNPUDNloD/1G5V1S9zIKahiIMped55L6o2JwwomodeHa10OSruzYcDeh3Gz7+V+U
 Ner1nQm3V67xEVT+3Dq2ErvUS9xVxlX+jhm3TLyNhBuueDRrx7V+kUrytxb9Ot/Y+qkwyvlCZy3
 HNjlPcGfZNRWCcFNkEMg7+Ck+phQNlJ6x9Z5KhHSjwC11zAJCQ+ikHmPbB6ZK6fqv3t6bd+430m
 rh5JOFxI1h7rMuJtX7kcx8a3QtqpApIidPntk+wLNPy26ZRjEWiGRZnyym+9+E9jzsb+94ds7Zs
 a4BOVmyZ0bs1crJYK32SHHMUM+vSm/vWo+dUH5zGWXTn1SPAWj6DuInAOwgHJ5xKRtLJ29Vj8yH
 1BH5oO0cO4jbI4B11Y/4CwK1mUs2ceg+0bUemFsfQgLsQf/TSuMMFH7BMKyg0U+6xU9L3JRCZQ+
 cPOu8TI0lsoPgiEZwWIOoSmYNuLYj3c+W3xsF1qp+C24Zz9pX80u4/9HyusaiIrg9kquDMRVX8o
 VVdBHO8jjQeS9UMnpa4nPoBIcZeesIuGJSC7AJe8rrPZ0v4znawqkqiq5G1IKmLUYOcad1Jqg1k
 J567gVZpKPbIS5XeTSYgx2A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_084637_928864_3FD16F9C 
X-CRM114-Status: GOOD (  12.19  )
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

I'm currently working on DisplayPort audio support for the Rockchip
RK3588/RK3576 SoCs, which preferrably use S/PDIF as DAI source.

Apparently the upstream Rockchip S/PDIF driver is lacking a couple of
features right now, which are necessary to get things going (i.e.
setting the sysclk from the machine driver). I found the missing bits
in Rockchip's 6.1 BSP kernel and ported them over. This series effectly
brings the mainline kernel on-par with the BSP driver, but also contains
a couple of cleanup patches of my own to bring the driver to the modern
age.

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com
- Fix missing return in dev_err_probe() patch (Alexey Charkov)
- Fix commit message in sample rate support patch (Mark Brown)
- Fix missing bitfield include in FIELD_PREP patch (kernel test robot)

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (5):
      ASoC: rockchip: spdif: Use device_get_match_data()
      ASoC: rockchip: spdif: Move DT compatible table
      ASoC: rockchip: spdif: Fully convert to device managed resources
      ASoC: rockchip: spdif: Use dev_err_probe
      ASoC: rockchip: spdif: Convert to FIELD_PREP

Sugar Zhang (5):
      ASoC: rockchip: spdif: Improve sample rate support
      ASoC: rockchip: spdif: Swap PCM and DAI component registration order
      ASoC: rockchip: spdif: Add support for set mclk rate
      ASoC: rockchip: spdif: Add support for format S32_LE
      ASoC: rockchip: spdif: Fill IEC958 CS info per params

 sound/soc/rockchip/Kconfig          |   1 +
 sound/soc/rockchip/rockchip_spdif.c | 225 ++++++++++++++++++++++--------------
 sound/soc/rockchip/rockchip_spdif.h |  57 +++++----
 3 files changed, 176 insertions(+), 107 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260126-rockchip-spdif-cleanup-and-bsp-sync-c94035e27640

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


