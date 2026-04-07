Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5FEFEEF49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Azm6ch8NFb4zTbwrUr8055qgKOiI+1Q2g+iDaKl9uU=; b=dWVx7w/En+S2Be
	Nv/q/wXMZkx1LUsij/u274MSxhVvIJ+0q6v2infMC1dL51uTaWE5RU6IhaACU/24fv/GHHL8NiLqW
	DxpBHRF7yaq6IIN/KajgSitoNBwq8BMfU4e6aTyJBpRts3AbsHaUJlsBu67kWHTaUy+5fQ7ZsoEv/
	X1H4ZxyGuulOyUxcP9i6yo1NBMx7A/Lvmwc5P/OTyapzJfuEb5uSiyWdUwWQBr/AuxZLlHe5sPC6P
	ZunjT4VxGOxhqvpAVpswvMmcQ53VmmpDw27dN1w9XKpj5Ng8YxHzOakIJ5zp/VXkYvb7TUkaOWHLv
	d2l5nVRbWZKUGJ9j8ilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6tC-00000006Xqb-2tR8;
	Tue, 07 Apr 2026 13:54:46 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6tA-00000006Xps-0Cgd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:54:45 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so5520980a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775570082; x=1776174882; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Azm6ch8NFb4zTbwrUr8055qgKOiI+1Q2g+iDaKl9uU=;
        b=nPSyhojA6+y+urBldtY1UnwYAepFowoTaWGc9TLcFDzAOjvCXTZLQtRHAL+Z92zCzh
         vRflBpnVsHMlePcG/0YrSZaZhpujrFYmd/OvGq68lqO9Hc/yNNzANhY38yGAV7hTsnBn
         TRFYJrcTxD84nwUoN9RtzG43defKoyjD/1jj6CFrgNzgCYi4ISSJj6Y/yGSfF/XBtfYc
         1cZosYuoThNdZ83JaIqmUJSB2NrgiG/ffiagb4lnlho9qSj235Z5amI+HaqD0yvEsTx+
         D2Hv4Dk5lDrp4Elrw/L9bnGSbcMAKLcbPzd/eqLwVop365mRklh1VPPl2aW7ruxHHiOX
         gBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570082; x=1776174882;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Azm6ch8NFb4zTbwrUr8055qgKOiI+1Q2g+iDaKl9uU=;
        b=FD+VlM++R3XCIwq/T/44jVOKBS5UNQ8ZCA0AKMCzI5HM7XDALLGCmslEx3rUGWpVyN
         i/o6BsTDocWhfOdqDlFkcISNbrNCCkLKTTbixrF3va17IaycQuO0LO3JhtVavUPA/Pqw
         /PAUDv8qOXopydU2P4LBT9LEqz7rzF4vJhH/r82lgoGBdX5poL4fGvmCctmbCVLIHXf6
         OCl+GMjKWeAygI48xQ2GlSVZDp7adcEoOS35TWuDYTpSg01CMur0ZZMrC3+q4BHrSkWm
         zzupt5KCXsuONkBq5bGtKgfQH5kdgIIhX1XneYFJGEnREdnGs9JPQ5dGHH1nE9DcB5ka
         y33Q==
X-Forwarded-Encrypted: i=1; AJvYcCWO0F6z1AfvvDeFSWcD3QmoGvQsn9VhWyaluUO34e6HobP7yc7PkvHcdH1gWrj1kePu+D8VtIZPbuKW3VCHyULj@lists.infradead.org
X-Gm-Message-State: AOJu0YyEeRpGR54gIpABwBt6IPdGgxrbE4hzyQVozsUkbzq2owpdbGH9
	59fiAFmBm0uOiA7a43tGCv9lHfUxRpASAFBVBrHN5v0BFRCh2hDcQxRh
X-Gm-Gg: AeBDiesIriOfq01PHcM7KqvpFUAwBo9wEX/d+UOin5Va0ZexLRzOElp9JfmfROFOnfm
	PlIl5TakR1tBNpRT6+FqbmYzFgHvu6MvFAEAdGnRHkBnXr83Z9mD7SsyJq3CvSHLrm5HFk+BEqq
	ioXRXRZ76HIg77h4Rjy4aR8CPpw7B4QUKvWnPL6Ugs/lJwj/b8oTuJ8/RJ2XtIbRzBooMm+W/It
	h65uQMzbQDOiJxU++ka+kFUBbJXWg55QX3DEEQVLcw6qi1rOqJxxVodxMEN0jCMNJ2e0ezkxW03
	VcPq6z0osW65R+ttQfoExXI3z/+I4kGCIBXPxRevSvvzXKXvcoRMtTYZkdd98d5oMlHEgH3QI/z
	/uNncw5JeSVapVXFdJQeAqLydeKea8gsS7rbha5OvnY9/egsBeKvZ6FB9318nJpMC9J1EJwgNJv
	/zb3oPGXxJeKhsDTgUbD0=
X-Received: by 2002:a17:90b:1d49:b0:35d:9927:e023 with SMTP id 98e67ed59e1d1-35de67df8c1mr15929957a91.8.1775570082546;
        Tue, 07 Apr 2026 06:54:42 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35364edsm17111559a91.0.2026.04.07.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:54:42 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Subject: [PATCH 0/3] ARM: dts: aspeed: anacapa: restructure devicetree for
 development-phase
Date: Tue, 07 Apr 2026 21:54:31 +0800
Message-Id: <20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgM1WkC/x3NQQqDMBBG4avIrDswiVKhVyldDMlvHZAYkiIF8
 e5Gl9/mvZ0qiqHSq9upYLNqa2pwj47CrOkLtthMXvxTBhlZkwbNyhHbsmbOs1ZcsIBfAXhw4mI
 /9c4HoVbJBZP978P7cxwnNkrKAHEAAAA=
X-Change-ID: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775570079; l=992;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=GuuPmRF0SvztskRDwEB1MM2bn2JoVv89mfGzEQQdwjg=;
 b=37ulHPY7QXaxwxBrpF05mKCYNz39UmcYPhg1ix0o5EU6aTX8zbf9G+9qqNsgYilWF/1k9OlaG
 tI6i/oQ7TjHB8LdcIZtdWK0awiBjxCPlQ7zq5OIiEG6ctvEtD/YgMy3
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_065444_099259_DF747AB9 
X-CRM114-Status: UNSURE (   8.14  )
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

This series refactors the Anacapa BMC devicetree layout to better support
development-phase hardware revisions (EVT1/EVT2) while keeping a platform
entrypoint.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Colin Huang (3):
      dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 board
      ARM: dts: aspeed: anacapa: add EVT1 devicetree and point wrapper to it
      ARM: dts: aspeed: anacapa: add EVT2 devicetree and update wrapper

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    2 +
 .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1069 +++++++++++++++++++
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 1125 ++++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1064 +-----------------
 4 files changed, 2197 insertions(+), 1063 deletions(-)
---
base-commit: cd44dc5ead3042f2873244b0598e39a16dc7b940
change-id: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


