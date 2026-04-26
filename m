Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AB4FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s7Vri4uvx6ICfdudfHf69UQj1XDimRGVCirH9YF26Z0=; b=XyDaJf1Vl2Hj/Y
	DlT60x7OmkAy3VjmbtBGFqdfZozpEXYTLKf+Tr3gizvZdNhbqZAUGEloMQWyqiABa+EjAO6w374j4
	DHyikDh+9hnOC69rKW5hGYgbsRbjw7M6VqoqTGWLQ1l8rAFCChTeHe58VK7gBbfpUeQZp7LpApZvC
	0MOwOnLMa2bCMH4ybGI52593XSozsE3v1iul7TE4rsZucWrNNwzTpszhpjHYyj5SiNmZdlMHry+vi
	UhIHfvz2SSIhlPsW0u9SNiTHH/q/qQ7Gdhhn3gVSRQ9YRO8lH2SIc+zkesfSXq7omhoR1BeDlcmWG
	cd9Hega+0GlUaNx9nHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwXI-0000000FRGh-2Ihb;
	Sun, 26 Apr 2026 10:16:24 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwXB-0000000FRDs-2jmM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 10:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s7Vri4uvx6ICfdudfHf69UQj1XDimRGVCirH9YF26Z0=; b=fgTBTP5pRUAdmMHivaZCYGt8LL
	MqYDacMsHGIfuBVMt795ZH+TGKhcm/Wkh+0j5xVJ/ERnUICQztZf4xlmUEJRzEVvvPWOIhUOnvdtG
	w8W0+/Wls7CwKI54h6tnc+w6CgVB7v0hTR31PBDY+fSYtq8HlSiHS6GKZplVd83kwf8NOusD1lnwm
	BnfRLD9xAIRFB+XDOT0D8k02n4u7wcsAG4nnnI++TbK5izqW0/YWfYPe2IDbKqy5uZ1wvI5CJtvme
	iraSjMCx0787u5RPyFYVamW+FKpRgpPBRMdpjaBxkF3iEbepmMNbA0snLGrHXiddu6S0aZvHDAV5i
	zD9SebaA==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wGwX6-0000000CADG-3c16;
	Sun, 26 Apr 2026 12:16:12 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: [PATCH v2 0/4] Add hstimer support for H616 and T113-S3
Date: Sun, 26 Apr 2026 12:15:25 +0200
Message-Id: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3l7WkC/22NQQ6CMBBFr0Jm7RimYLGuvIdhgTi1TSyQTkMkh
 LtbSdy5fC/5768gHD0LXIoVIs9e/DhkUIcCetcNT0b/yAyqVLqsqUKnSWMiqgSdJB84olamMqY
 +W0M95OEU2fr3Hr21mZ2XNMZl/5jpa3858y83E5ZInW1qvrNt+tM1hEkWSRzkOL2g3bbtAydLj
 uC4AAAA
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777198529; l=1530;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=JZpe5juyjekGSl3KCHZz9FQl9GVXcxrzou7nqEme28E=;
 b=aadCL9ko4VIlfT7g7cDV9EBJEIWSGLjvkbnjogOi26mShXAxUnKPKEmdzgQb/c9Hs9LbOtDSP
 6L58evY3Sj4AwRTeNqUsqZ3sQbjf+WZmiIcXY3f2Cu0Se9+CDEnVBcu
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_031617_864911_6B107C11 
X-CRM114-Status: UNSURE (   9.21  )
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

Add support for Allwinner D1 high speed timer in sun5i hstimer driver
and describe corresponding nodes in dts for H616 and T113-S3 SoC's.

D1 and H616 uses same model as existing driver except register shift
compared to older variants. 

Added register layout abstraction in the driver, extended the binding
with new compatibles and wired up dts nodes for T113-S3 and H616 which
uses D1 as fallback compatible.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Changes in v2:
- Change driver handling of different offsets to using quirks
- Change from t113s to d1 as the fallback compatible string
- Fix conditional compatible matching
- Link to v1: https://lore.kernel.org/r/20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl

---
Michal Piekos (4):
      dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and D1
      clocksource/drivers/sun5i: add D1 hstimer support
      arm: dts: allwinner: t113s: add hstimer node
      arm64: dts: allwinner: h616: add hstimer node

 .../timer/allwinner,sun5i-a13-hstimer.yaml         |  9 ++-
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 11 +++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 10 +++
 drivers/clocksource/timer-sun5i.c                  | 88 +++++++++++++++++-----
 4 files changed, 98 insertions(+), 20 deletions(-)
---
base-commit: 897d54018cc9aa97fd1529ca08a53b429d05a566
change-id: 20260413-h616-t113s-hstimer-62939948f91c

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


