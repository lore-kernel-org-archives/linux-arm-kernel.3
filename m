Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A723C98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bU+4t3FGIXSiYOJEMQu/Cnc9Vdhxqo1btIx27NvDSa0=; b=ieYWt66WXSBZi729Hxih4ss0We
	kKrs21gIMxEslpNToXxsyhAvr+PoVzJLNYQAN3SbgoQCU2PjBqFjCESmR9AhTbSv5q7tc1A/PZ4h4
	dapjzkWJ8oFwAlq9M3qD5Hq+cev52JDMJduGlgfvHbICNoUVZT5lotVfyU1nKYfKPKeOiw+P959Fn
	5QUGHtHD6gImuJ5zcs4m3RbdRomYZwWZUL+rJBb4x9zZrzIbwJ3BxvndR1euc7kr5cbJ93YBfUvrN
	+1RuV3QJDcYuqfTKRQ1DeK3y/yZeWNBcy8O2bbTa+2IRYn7x3vVv440x219oOIEmOUpDsjRwIpTtD
	CVI8nExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dfT-0000000AFQg-1oPD;
	Thu, 24 Sep 2026 07:14:55 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dfQ-0000000AFPG-1lca
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 07:14:54 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso1223362a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 00:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234090; x=1790838890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bU+4t3FGIXSiYOJEMQu/Cnc9Vdhxqo1btIx27NvDSa0=;
        b=l44lwK19+/q9g24N3ECV9Ku5QWu+qL5jtzFlIasT5ThClJUuf66HPHA3WRL4CJ2X3K
         o7IhE+M7zFp8T8EzEwi0OgVJsBajH0U8Tc1dJlHEWmbY9TS2MPFsn30vDsmhgV95XRFU
         Ah4xDQW5wIhQpwdiM9JwnqJUqS7iqLZm7ZLpOz8NJxhKnBtyi1OcDJdoFeekUFgma3mD
         Rl4QAq6ZLouNxy1swFdJQkxthHytLM+rUpft0YM8uRx6BggBjAZBtmmEWzWTqHeBp9GZ
         NAa6snXSRfMcwgyXqPBQcDyhUXQ2hbBvqH4JFucNdhqYMK4rytFTYrt6Me0TMnQO/hzP
         d1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234090; x=1790838890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU+4t3FGIXSiYOJEMQu/Cnc9Vdhxqo1btIx27NvDSa0=;
        b=0OgQeRQkVhkgnED5xzpY3i2CEgE98xW3EmSBsRzvYzZPIEWsRD2kr5QyyYGtH1FRor
         LbwlqGVhM+YT7tAXHcE5km94PmgIEHhWEYJscN1vRHO0MmtpsGIyIWys1kR1F/Ex7Z7h
         NUcv0I8c/brtPfvVu3sZs0JHFmVuEwo/pSR9v+G/F+pS+tofD39aFh/bel8ck4AmB7jY
         WtzlWPN1RdlAvkCsHsiy+elk+QmQFfX+HislFyImeoxZcSCqGUiLSRRuvk4N32xmz1Ko
         4nCOqiG/qSa3KAf1MdFfQbqzd3mEMzdmTjHVcOzExNmFyLMfehE62eqic8tWwnWWCSiq
         qTpg==
X-Forwarded-Encrypted: i=1; AKwUvBw7PWDIiSo2t5jvPkzmH+G8v6TFjPanfm/ht+p6sm/E5HQzZM+E7jTC33QJ8R8HKHoJ63egqQ3JYtR3WJBTM7bq@lists.infradead.org
X-Gm-Message-State: AFuF++mGjSXxWh+pZNxzM7+ppCQXDCh6X0gPFByYXCSGSLWW+P2WZKUf
	G1QSpl0qtigD/zUylRUYyOKvCZXYkmJNyu2xGio6zCdLkl0WmGyzJ7+995B4eWjM2lE=
X-Gm-Gg: AYBFou0EOpBV3kU838G6Dn3LLRrg5ADoarI03/SQPG76hucJE4jZJz50C0Sn+Eb6p7E
	jcDZnXdC8xcDyCrp6i86+QhOllS7OSV1lgz8yzx1R+d/wn/7s0qXHZaYx4kiIOahRmilcnpRF4X
	uUO+Ukp8dksHAYZQLTBj7z66xlzdEcgLQqCt+K/RoednpPT0T38MDWwe+UQKk7SaY70i9XnvcR6
	3d/CIq7OOFnL0LkFcbjiYYm4NBdk1BziOJHoKEiNAMCwiU+M0ThH/t9mUA7XwMYXwZc9rwWwFLo
	wrhoT8Ii3+TfFUt5eGq6zFz+Xv+cNxyMy4COiGDFW53PExrDZb1vA8Jv8hJ7cSfwzIPXb8u+KsS
	2/YAjcGVd29L2q0t14Vcsx2Pz5q53dzFJ7H/PmcXmu8YlKUMzas9wh5G7FZrvH1kPqMbewnEkdk
	CrBIW7vWA9xyxpFLuCirXXe3KfxlhktsAozfDaAYgTkg2yWiiyl0zqKHzxZsFfX6lGH25VbNysz
	DTzjokUjL1eoTgoI46XnwUJOeyqtM/EwEnVY00sN4Gg3VI=
X-Received: by 2002:aa7:d712:0:b0:6a6:b2b9:7660 with SMTP id 4fb4d7f45d1cf-6aac8f86d0dmr907853a12.13.1790234089543;
        Thu, 24 Sep 2026 00:14:49 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:49 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] arm64: dts: rockchip: Enable M.2 B-key slot and fan on Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:42 +0200
Message-ID: <20260924071445.441822-1-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_001452_645571_4D094D6C 
X-CRM114-Status: GOOD (  10.53  )
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

The Radxa ROCK 3B has an M.2 B-key slot intended for 4G/5G modules and
a 2-pin fan header, neither of which is currently described in the
mainline device tree.

Patch 1 enables the second USB 2.0 host controller, which serves the
USB lines of the B-key slot. Patch 2 describes the power, reset and
W_DISABLE# controls of the slot. Patch 3 adds the PWM fan and ties it
to the CPU thermal zone.

Pin assignments were checked against the ROCK 3B V1.51 schematic.
Tested on a ROCK 3B with a SIMCom SIM7600G-H module and a 5V fan,
running Linux 6.12 (OpenWrt) with the same changes applied.

Adam Wermuth (3):
  arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa ROCK 3B
  arm64: dts: rockchip: Enable M.2 B-key WWAN slot on Radxa ROCK 3B
  arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B

 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)


base-commit: 23d8f49fcae5d72b77744c7f349c12462c3bb748
-- 
2.43.0


