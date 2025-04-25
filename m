Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04739C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lmkpxLdSDmguPpgr39UQg1XxREgVIbUhK4JdlMT/H/I=; b=0hb4X4RnalQsl/
	Pn31tL28wLomzCf3IAZMqMIjSlNhYgIFU3tzoc+5aeiRJVorMpv4eV/ZHNvyEROO1/WEUtONZOxRO
	ZlHEFPZStcxgwuPBIQvX+mxr2Eq6LzUOeWen/tLHpi65ZaTT2yOahMsfaWpwtw5y7PFW9hANJTWDo
	KKcKukZmE0xFAsXFNhPK6MjKJGJA0kaqdEEUUypE/nYb0qcvyiGSwxJXFRET60p3cg5ydkfiPCBdM
	wstjQn2YF7gRYkE1BhgOvV9r4iy71d3+adHlApjtlwHi5Frxy5CrUTGzF2B0WxvA1Tyf0vxb+ebAn
	MkBoRJQ5f2so7W/mjm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KFa-0000000HTQZ-2ZqX;
	Fri, 25 Apr 2025 14:41:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JAu-0000000HILG-3ZCW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:33:06 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2254e0b4b79so34608395ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587984; x=1746192784; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmkpxLdSDmguPpgr39UQg1XxREgVIbUhK4JdlMT/H/I=;
        b=TQY7w+VYGz/H1dxJCLj4Vr2GOnpi7DfPdDR48SsjKtiMrAE+254Erm50SnPRvm3yzw
         iKhhq9XHvOCpBkuQlPXIFoyC2qi+uldZHEMG22wu7xTbLVL3gna0TotcvlO90icrGe0z
         MqpPerL+Sq7ocldUqwHhkLZRjb4yrGd/SjTFLh9M7sAVQDqmDjUk9eOCwhasZ7awq6Ds
         PU6NJj84rsytN0qx6YA9Pp4ZfljmwUJpjIcjvngIyILCcaCqKcDfi3WJXm+YeEgMLWDM
         MVvwLguPp9cweLa8awIcQPV4UHvWoVijasz59GvYzsk7pKS+GtYbc3/F448uMOxjqWdh
         CzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587984; x=1746192784;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmkpxLdSDmguPpgr39UQg1XxREgVIbUhK4JdlMT/H/I=;
        b=R0J2ctW4GJEbNPm60cy2uhlLCc62Ruzhx3iKoBFNjMO7EcbH/PKdM4JeqqQQyrW4+1
         AY/LNZDrP+GwmJot1ZG8LRh3FnDVpiaAXR7ODOypUxKoWF/Xx8FMqa8/MavfxQR92osw
         lze8r1fEIk0VasVgHOoH3b3GtW/iwjQ9YfArfM7/ysX6C1m3CBz55X+TFE5gLOVQH+I+
         VtfoZPRrRusla+mpsrOgpnvz+Fqv92k1KBhfF21W+KvskDv/niEWA1OAOW4UHlMPjxDJ
         hQuyolhoeWV24ulZcfu/zDrosWPDsi+Gvl3TpeBkmzRZZObai5nh8Uy+BL2jNIYmGxhK
         t4wg==
X-Forwarded-Encrypted: i=1; AJvYcCW7zNKjA+tjuZTtS6pv1sj1Db32f4sfUkuPRoAXJV50dfvT3yzv2a1S5y03UHh+REl4EbOoAVaGWMzZnH8gfSUb@lists.infradead.org
X-Gm-Message-State: AOJu0YxJxLtmS1OQoFceQO8Y5Y5PEVyCSCPTg4OVXbnU57NETNwN0NjT
	BCqLKxRY6BvrSqljHreDAsxN2tg7+Dihx65NWMeCH09OV76xrtGH4Eg8tpApmGQ=
X-Gm-Gg: ASbGncvUNnjv0GeuPAjzTjgdgohjhIMMEC8BKZrXV2Rgdojr02VmoXRy9SIzZUbnIVs
	HOxKRHNaTwOqlDg2nb1ncSW78gobNKhaW1K5pL0vDMlAoAHj9QTG8PTvfg/jwfD96ACRbTj2aSU
	Xd9IOScpT34RM0OQG6v02JIsw+b064S1gKrR0R2GVJhFjRIfmGEkBkbu9UaQe8hPK9KFtlDmP8G
	WcGvfJCg4LSuJN7y1KAQTJblNchhWqAB3mCw4UM7GVzbvalARm7I6lC/nCNvtrhK/iawnzUmWE5
	bt5dVZfzxkJz0nMYcL3prs6pPhZYM7yczqWvYsC+0b4W7dFd7r44
X-Google-Smtp-Source: AGHT+IFH0+eanNgJQjmBZVObp5br1Oh/XJsL2tYmBOvekRvX/qXK61fom1pOmxFDl+NTfGiRbzGbgA==
X-Received: by 2002:a17:903:2987:b0:220:c813:dfcc with SMTP id d9443c01a7336-22dbf73671amr38327055ad.40.1745587983942;
        Fri, 25 Apr 2025 06:33:03 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e766bsm31834165ad.149.2025.04.25.06.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:33:03 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v3 0/2] ARM: vt8500: Add VIA APC Rock/Paper board
Date: Fri, 25 Apr 2025 17:32:55 +0400
Message-Id: <20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAePC2gC/32NQQ7CIBREr9L8tRigatGV9zBNA/SX/sQCAUM0T
 e8u9gCuJm+SebNCxkSY4daskLBQpuArtIcG7Ky9Q0ZjZZBcnvlJKKajHaKOmAZDfiTvmJpQo1S
 XTnCEuosJJ3rvzkdfeab8CumzXxT5a//ZimSCic5euWxNDXN3i6bn0YYF+m3bvnJDTfKyAAAA
X-Change-ID: 20250418-apc_paper_binding-8feae286710e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745587999; l=1417;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=l6zMCpp5giwHkMbUogA1VIJYL3vWli82v31S9OuDKOw=;
 b=Bkdw23JrX9vLXcy/AKC7soIdSaCj3F//7wBwkWnI2aQC0+HV5YUnu0Snzi2RfFPOwmmGYb9HH
 2Ml1xoezjsZBA+8HmuoqRRdtBrcHo55v/jOfamqxtvknnO2Fo4anC3v
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_063304_888282_30342055 
X-CRM114-Status: GOOD (  10.05  )
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

Add binding and DTS for the WM8950 based VIA APC Rock board. Paper
is the same board for all intents and purposes, so reflect it only
in the binding description.

Split the series from v1 into several chunks by topic so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Changes in v2:
- kept single-valued compatibles in a single enum (thanks Rob)
- dropped the empty overall description node
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com/

Changes in v3:
- submit DTS changes together with the respective binding change
- Link to v2: https://lore.kernel.org/r/20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (2):
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add VIA APC Rock/Paper board

 Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---------
 arch/arm/boot/dts/vt8500/Makefile                 |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts      | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi              | 11 +++++++++++
 4 files changed, 48 insertions(+), 10 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-apc_paper_binding-8feae286710e

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


