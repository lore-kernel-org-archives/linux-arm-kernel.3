Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71729C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H1NK0tzYOIeRiomQzn/eIi/wBlnHg9DB/qELdDwMN18=; b=iNUefg2D50I3rqg59gVn9ECAdE
	ACq4kgMIsQ89VNLRx5JvGqCGaeNxGMBqs6nv9RjkFEcW6fom+SyQ+X154zFOWYCjh8Nfw4IWFPeC0
	4/AhT9pFFtZuFsILEACUbQQIUFI6Sp1qoc6xjiFaiZhOg2mRFE8gYVZ/bCvLmAgpJMwG3nvqfW7CU
	9BZqqvzZ/m6tbMlINyagxu0V7B+kdCaeTWhmsxFJjmcENHSMjJj0ONMqi8fN6Pbv0c5Zy7DLStUXw
	MkxjRTAsW6AgwFgvCZm97nxH4hFLJchx8DrQvGP2VoixHMFhArS2zvbxtJt/gyMHC3z7FiQopkyin
	RBcNKBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukmM5-00000004gMk-24nv;
	Sat, 09 Aug 2025 16:23:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukmH4-00000004fxy-3PgC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 16:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00C985C547E;
	Sat,  9 Aug 2025 16:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94A83C4CEE7;
	Sat,  9 Aug 2025 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754756304;
	bh=Bwb6t2YuRUfjH9rtbL/iknXzFlmnm4YAv6kHXJJPfCc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WxmhfCJANyNDVkwjSJprunldKaEGS8PyJKlbE+ylFclnnxnKfQD/pPhr3rmyYryDW
	 KcvFI5BjMbU9D/xwFGwFIUUjMzhtlqoJXvmWJaQ2jyBwct9C4zLo6nPEASitzbaelv
	 mLNE1UMe+QHlDtTkoidxwNAZvZGUJBXbzM/KZL2jmwW6jMoefOizgph2qE9g1EPk41
	 4n5Sxxb0EB6t/0b4IlIQ8L3Wg6jD1RYzauDnIOakSk0f5/jabeu/FR2snbnyIT3Ogq
	 wzCCkj84Abu47SW8fkVXxBUVLxNVr3ut4fRvdkEpMzqX4yzpyrzW9hsSknqh9AyF2h
	 iBiDL3o2muC8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF1AC87FD2;
	Sat,  9 Aug 2025 16:18:24 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v2 0/3] Audio and other peripherals on Orange Pi Zero
Date: Sat, 09 Aug 2025 18:18:05 +0200
Message-Id: <20250809-opz-audio-v2-0-f4fd15552a82@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL10l2gC/03MQQ7CIBCF4as0sxYDSC3tynuYLgod7WyAQCVqw
 93FJiYu/5eXb4OEkTDB0GwQMVMi72rIQwN2mdwdGc21QXLZciU65sObTY+ZPNM916q32hiJUP8
 h4o2eu3Uday+UVh9fO53Fd/0p+k/JggmmUJ+NaY3tTuoSfFrRHx2uMJZSPpkBRDSjAAAA
X-Change-ID: 20250417-opz-audio-890849c8bb2e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754756302; l=1005;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=Bwb6t2YuRUfjH9rtbL/iknXzFlmnm4YAv6kHXJJPfCc=;
 b=M7EvQXq4AITTYxKXjvWKmbdYsFY8YmBweMFkH+7/uCjZJtk5oXQhfg7cjblavaI1YXjCEMJfv
 7Qn+cYdiikoA1sq1BfTl9mPzw6SGataXmHp07VPaQvx189eg50rM062
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_091826_892606_27F09498 
X-CRM114-Status: UNSURE (   6.26  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v2:
- Rebase on (almost) 6.17-rc1
- Disable audio pins by default
- Provide separate DT overlay for the Orange Pi Zero Interface Board
- Link to v1: https://lore.kernel.org/r/20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net

---
J. Neuschäfer (3):
      ARM: dts: allwinner: orangepi-zero: Add default audio routing
      ARM: dts: allwinner: orangepi-zero2: Add default audio routing
      ARM: dts: allwinner: Add Orange Pi Zero Interface Board overlay

 arch/arm/boot/dts/allwinner/Makefile               |  7 ++++
 .../dts/allwinner/sun8i-h2-plus-orangepi-zero.dts  | 14 +++++++
 .../dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts | 14 +++++++
 .../sun8i-orangepi-zero-interface-board.dtso       | 46 ++++++++++++++++++++++
 4 files changed, 81 insertions(+)
---
base-commit: 36c31984cca32c5d9720c8c1eb5bd17fa915419f
change-id: 20250417-opz-audio-890849c8bb2e

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



