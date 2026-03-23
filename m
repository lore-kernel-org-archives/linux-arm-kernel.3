Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49ACF4610F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fn67HXpA7zjDtiRyKaRULlABylDK2UruwZzMMz6sLEw=; b=bk+wz6pQ8YMkGCcnYSrWKRXxtr
	yftuxqdOg3eezazkNlpKkLA7hNdJ+afrzz+rl9zJIy1jSYPeABPeg2ynTcWEK/mDN/9D6ELkIG6K1
	aes54g7JXhNe8uY5p6uBvfheBeLKeoDsfSVllw5AbOx0WSvPB6bx2RwlzRFGLM3qLyACHhTSzji9F
	raH46ECqwueWaNCdWB0lL3MrV0vnEEeWmvS8mrIL2Gpqzb3K74PMXOpw03WY+O997Wn/mkLXyLHJS
	0zM4EddvbHeSaa85EgGKRSZ9454Ik6TAXxCMUginvhC75JiV2p2JAQn6nDEXaDS/lPOGdgytTWNnz
	E3l7WiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fUI-0000000GqP2-0SBu;
	Mon, 23 Mar 2026 13:38:34 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fUE-0000000GqOB-3au1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:38:33 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82a7539851fso1663821b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273109; x=1774877909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn67HXpA7zjDtiRyKaRULlABylDK2UruwZzMMz6sLEw=;
        b=PWRE6P1MqVwHKx4n3dhru57QOhBr0JZojTdH+1fT1uqwpUrG5BJ7zjHDTzJonFBUWA
         TD/BitNtLOGo1NARGhAi0Ib+fJU38kKAnIxoyBsrBv6KWDa7EJE67kDn/RHUsUZ/SOL2
         saGi3Uh3v2lypCxwkAdZS7OxPPWHmLiGtBbclyd44QJUFgn0hG9E60sIn4hUPd2UvNOZ
         S9sjEi63n/72rSLH91Eiduwexrkv1jZgI7p39HvRwkqFm3tgZuMnHbjvKQp4NMHPg44w
         jmEgp+gfv84qx6qPbZXaOeouLiNQddmX4RrxOjrVAqY6PXHNCq/3CduNvEz6qX04TIRc
         TYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273109; x=1774877909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn67HXpA7zjDtiRyKaRULlABylDK2UruwZzMMz6sLEw=;
        b=InA/yZh1HYMOVJnYwpnkpxkyTGQKw28ZTYKUWOKCzD8N0va3gHIVUvWps+DKFPmoXC
         aXmZxAP4063WeP6wy50x1K90stGs8MVISD3MxzA0vqJ3uZzySAIXKK5wJEv/rMeZnNvD
         7+hpqxVeq1WKllvedhVBX9wlvl+ZfrPSOh51pSobXdZiU0Ozfi8scxrb1U7JIQ6V7nTV
         cen48U+bwnntLsLT25nzE6jJx0y9ml44T4wh7tQI9m8tf2iMYsGu5Qb6pZ+e6jw4I2Jp
         rwno3zzySxduJMhb8OiEtAqVGVfPTaX7xorpnlGiTAO0OguJFEwvJUxImRm/M1SuUX6k
         8Ffw==
X-Forwarded-Encrypted: i=1; AJvYcCXt/TQU6pD9U7bY45J8TZgzu9JZCxtKfy5H2rtgiGwS3W3l8O34/3f0DDpmrsiIe7+1wb1BrsTsyshdoUxOzvqH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4pPpPRS8Ioi3D1DHIVPgWJJ4ZXhBc5wmcL+dkxxiSeRj5cVBZ
	Da8+pkKW10oOUQ3pNAsXou5vnazlEXlUenVfzmuQfXQ8VnTKEYO2sBLe
X-Gm-Gg: ATEYQzxikHY37sxHU2/XfpkJ1RF3UpN1ezh7KD6+dGeL2Uzat+aF90Im0AtA1Ecz9rZ
	hK7xQ3dqPr9uQZ58Lb+fUZ8t5rgCpvs5UnvZadDOrR9O4107ZZ7qGUBtcsyYsaYQtu0MulsydtN
	5s05UXUDksq4RbPRn9WXmwIX6Zdh1wbkObUV1V/IYQ1tCoHt29o3ccwTQABiTeLjNuDzIxBG/0e
	2uLO+KWJ3OGtSdrlP2GLu+FQNkkGqGnTU2W0OoBJu44LLl3C5UfPGC9XBjHxJ0EzNP8oCOT6i0y
	+iXQ6F8aeBXPCK0Aq9BQrVxLVnGOj0S6cFfJBhs5V1zCDAZIMYW3K3qEKsUJf2xYq4y78PA0/mY
	djpFC25OQkoGSHovNEWMalLkzL5VOK3HcTt9LcvV7YvQsJbjA3AXNA8QZTF+W70Qu/e0dCcQBZ9
	kacxn1zw2issFmJHi4ktGRAaC9pYf5sXUyATl/Dz3eVuo2t1y4VHytwLRVTDC9iC3BuUAs4qk8B
	s8=
X-Received: by 2002:a05:6a00:10d3:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-82a8c301dacmr11323142b3a.34.1774273109336;
        Mon, 23 Mar 2026 06:38:29 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410b1bdsm12069224b3a.57.2026.03.23.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:38:28 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH 0/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Mon, 23 Mar 2026 19:08:07 +0530
Message-ID: <20260323133814.14152-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_063830_891578_079A97A2 
X-CRM114-Status: UNSURE (   9.52  )
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

This patch series converts SPEAr Thermal Sensor bindings to DT schema
and renames thermal_flags property in spear13xx.dtsi to
st,thermal-flags to fix the unevaluated property warning in
st/spear1340-evb.dts.

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings


Gopi Krishna Menon (2):
  dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
  ARM: dts: st: spear: fix dtbs warning on spear thermal sensor

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 arch/arm/boot/dts/st/spear13xx.dtsi           |  2 +-
 3 files changed, 37 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

-- 
2.52.0


