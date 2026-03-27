Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A8A10F2869
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ehw8PIdo0R7352FO6s9epFwoC9O36Cdh4t4yTnu/bQk=; b=j7gvRDAk4D/RHN
	w+zfbad3WijFPnyIxTYe8O+OcaWwDRUPTkMGlNXOzoe5naLT92intbB34unVsr9m4cBqvgeN7GCGR
	OxQA1WMZVbVvUJi0EkO1ep8sCrxnFFZm+T6mdePh5xVQsm/2mVJ8Tn2swcyGOd0o/oAX0ZAAPt8NI
	sKjXf1GCNqTbSj1Dy6Fydcm/l8ElkytmHyVQTy2xMnsKQK19roRwGWoXVlZ/SkYktzybo27usv7wp
	3NgIr8PGh70fIWQZmmHciEmicir1Laa7M4XyCAVlIbqrRzXMBnJwZrM5sJNf730qufFN0LJFrE9sN
	EY/9i03ENe5t3PM7Y8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ChQ-000000084vE-3sl6;
	Fri, 27 Mar 2026 19:18:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ChO-000000084uZ-2Zii;
	Fri, 27 Mar 2026 19:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774639103;
	bh=QZP/lyha2+VIvj4NB4fasWkqNa5p6VzbgR5UTeoggnQ=;
	h=From:Subject:Date:To:Cc:From;
	b=SXVryOpPLR24BxwMpwpwa3cTYUOyzKlfBPDnJnX4SbBN3EpXg3LF4DqVqkEPmyjku
	 5xRAkgWcEWmNVvYYP0momRApWKH2vLCQ7rgjlxDtoSaOkQz0TDA8UObwsF9gPog/Td
	 psSRPw7C5N/mg8E0z7cn+KsR7vEJum25ZaemDyvN19QHUQJVjit1UEtTZ5/6JUxxD+
	 C55klNcm/fQqFWeavwp3EMC79Cb1eNL4IOyfXQIqqWu2KUBQKyKQNOvJrakgdKIO/L
	 ONYm0t+8goqx3mAbUwDf9BYVE+Oa+G28TaTn8gn7BaO7chHIAnQzKvQmprw1afKG8X
	 TlS+kmlfDy2Bg==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0ADA217E5BDE;
	Fri, 27 Mar 2026 20:18:21 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/4] media: rkvdec: Switch to using a bitwriter
Date: Fri, 27 Mar 2026 15:18:18 -0400
Message-Id: <20260327-rkvdec-use-bitwriter-v2-0-a5a4754b0518@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0K6tqYtKuDKexgWdJjK+EPNtFQN4
 e4CHsDlS973vlEEZMIgjtkoGBMF8v0MZpMJ6Jr+gpLamYVR5qByU0i+pRZBDgGlpfhiisjS6Vb
 vKpuDK0DM0yejo/eaPdc/DoO9IsSltRgdhej5s/4mvXh/LpKWSlalAVcWxu4rdQJ/vzfWc7MF/
 xD1NE1fUm8Ajc4AAAA=
X-Change-ID: 20260327-rkvdec-use-bitwriter-f1d149b3cf7c
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_121826_836907_43912366 
X-CRM114-Status: GOOD (  10.57  )
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

Using bitfields in large structures where fields are mostly unaligned can
be hard on the compiler.

Issues have been reported with clang ([1], [2]) and, even though those
issues are addressed by clang devs, some setup can't or won't update clang
just to compile a driver.

Even when fixed, the compiler still might have to allocate a bigger stack
frame to manage misalignement. Coupled with other features like KASAN, the
stack becomes larger than the kernel's maximum [3].

To avoid this, let's drop the bitfield implementation and switch to a
bitwriter. There is already one for the older variants, so make it global
and use it in other variants.

Note that only buffer structures are switched to the bitwriter. The
registers representation structures are kept with bitfields, as they are
properly aligned every 32 bits and don't require heavy stack overhead.

Also note that the VDPU381 SPS and PPS structs are kept with bitfields,
for the same reason that they are small and aligned enough not to require
heavy stack overhead.

[1]: https://lore.kernel.org/oe-kbuild-all/202601211924.rqKS2Ihm-lkp@intel.com/
[2]: https://github.com/llvm/llvm-project/issues/178535
[3]: https://yhbt.net/lore/llvm/20260121230406.GA2625738@ax162/T/#mad878ec24a8224e1387ef5e73cb77b9ada55e3f2

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v2:
- Don't use BW_FIELD to compute buffer size
- Use correct size for buffers
- Fix missed indentation issues
- Link to v1: https://patch.msgid.link/20260327-rkvdec-use-bitwriter-v1-0-982cf872b590@collabora.com

---
Detlev Casanova (4):
      media: rkvdec: Introduce a global bitwriter helper
      media: rkvdec: Use the global bitwriter instead of local one
      media: rkvdec: common: Drop bitfields for the bitwriter
      media: rkvdec: vdpu383: Drop bitfields for the bitwriter

 drivers/media/platform/rockchip/rkvdec/Makefile    |   1 +
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.c    |  30 ++
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.h    |  25 +
 .../platform/rockchip/rkvdec/rkvdec-h264-common.c  |  51 +--
 .../platform/rockchip/rkvdec/rkvdec-h264-common.h  |  40 +-
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 109 ++---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  |  93 +---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.h  |  57 +--
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 171 +++----
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 351 ++++++--------
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 502 +++++++++------------
 11 files changed, 579 insertions(+), 851 deletions(-)
---
base-commit: bbeb83d3182abe0d245318e274e8531e5dd7a948
change-id: 20260327-rkvdec-use-bitwriter-f1d149b3cf7c

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


