Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA82C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hwQVXIa0QHzqYvJgZtRa9WuBPtpZJLxZSfo8Qc932g8=; b=NasqsssaPdCMWJ
	5SKJ1t8ULNLLxd3nUaz+MtbIQf4WmaJ26SdGQk49uxX6RwY1e01sXslK5ACuJoKU4XZ9u8Xy4IvO4
	6I89CCSiv5W1ITTvl5LMf218xEuOTvDq+EqfeKbRQdPGgRVghLAmG/yO9dkFHXgWQo3DysEsV7uS4
	sMx2KFhrtwpI0GcpuGZr25p6ophp4qHEOW8WKVjcY+qWi5DecWZ1Pbso8V/9nulVsTMZF703uFz2A
	Y/8iPnjvgk6ORWw9I9Ir38mSFiSICIqSYUfsBl8ltG4+DDP06NuVFrN88c7scuOGO1DPW/u+rL0VT
	mFAxidXJ5/2ZTZzM7v3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BaK-0000000Ag44-1R6a;
	Mon, 31 Aug 2026 23:38:40 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BaA-0000000Ag16-0xPm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:38:31 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-398b21b02f3so318985a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 16:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219509; x=1788824309; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hwQVXIa0QHzqYvJgZtRa9WuBPtpZJLxZSfo8Qc932g8=;
        b=CHMGdZa78kqAhI2Lo80k93sszVJJyu2y0fhHYvqV+u/iv88QFWJ7EthJ2V/46ycyNX
         4y3BxnZhS497P7Pnwv74Sf/Qg6SvKRUoCJdjp1N+ee4yj/wWRLxt6L24rCRg2h6kV2na
         gRdQcKqhKb0mKbilYT7Ui22z3NXAzNkoQGwAAZv/Z5l1JA82SensqEyE4F9iu5Gcnj9i
         dM1nTU4rGj6BlrNmN/OQg3uVlesuppxuhWjkObTxyZSrakquKB07bUCbZVgXB6YXesEL
         JZ1CtN/6ue7R+ClpqXEguHKO7Mhts/m+WzBrIJXHdQhHgz/a8dbybeETXajWJ0j8NDSZ
         6DDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219509; x=1788824309;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwQVXIa0QHzqYvJgZtRa9WuBPtpZJLxZSfo8Qc932g8=;
        b=h9ofKS80cis+SPtZQ+9NAQxMwakjWHaIOGnMHCjjTWW+Ll6DNlWLbJVpJDEStGgXf3
         0kfaH2lUhLx8/+vKyhmpECtqPd4Gqju1NMu3RnIKW7jwBNTkyoSzXGc1jtiBl06/ZAkL
         ngUwwVzHvwfdx55jNQjZqDYge458ap1OEK3azbU4PLhBQEMkuYtBefmbQ+O9CeFE+7p2
         Is5+IIADWs/kTy4rcgzDHgmRCUSxQcaSM9Idl3NUVf7ty6nvKtHZ2Zex0KMpApBs4bNq
         B4plZ/XkMpigW09NDQbE8R5TmgZz6DR09qHx+vOzzPmgUyBsrwcEwbDXqId5WQDPOomI
         iH2A==
X-Forwarded-Encrypted: i=1; AKwUvBy5QVA5Phh73rTO8wAePgnKAQnn2Vn4blyEOxosXGpC4bYsT/Qj8ZkcIDRLxFJocu0i/6u9/mWzL/n9EiWapcWh@lists.infradead.org
X-Gm-Message-State: AFuF++mLu9DqoYasEYicruLk0facbpZeDZwXZwVKvalSYb8I3Q9qIjj1
	96f7kEd6W2NkGi1Waph56aLyq5mYvurl267hXbWIg9mDIoawaFxCkrr5
X-Gm-Gg: AYBFou2DKbs0CUPUDWhC7lPUjj5JI+DvJliDS4T7IXYASEy7xInk2S9yL35RhptJ/hi
	4fMW6va6PF6xyE9AMSQi4K3bAEbf5bDoujxImcM+Wd8l7uX7nHQveusD8f5UPjIFBmR75jQuK+s
	XqM017tu2xw0nCgaFXVyIXYUY1lGvTuHCq8gZkYJg4A2Hpw5Kg4dbVEWSHczVfnltFaD076rcMm
	unf86DrFQojlF/LHcjeSmciutb016apy83GwtHrqJf+QcUffNvkWg5Jzza85b0U9yOaQjNWctkb
	jqwENXTL2CZL0c3hIN7zDxx63+PLLsVj17oz4TTm/tzjwDDiFyky6pMOt0ewvfF/fR5Sb12/5ZB
	jLyhzjBj2k78ASYB+dZt/sSMb+9W+R2FWwzuIe2OchMWGQAl7DMhjx3s0sHooUjIQb0v016Sncz
	VojVbqEzebAKu4SJLzlzQOHqDqPef9LbTa+UT8qDZEh/UFL22sSh5iMvMKYPfnEluW2D76XTs=
X-Received: by 2002:a17:90b:58c8:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-398bab4a682mr15645724a91.2.1788219509209;
        Mon, 31 Aug 2026 16:38:29 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm2143682a91.7.2026.08.31.16.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:38:28 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Tue, 01 Sep 2026 05:08:11 +0530
Message-Id: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NwQ6CMAyA4VchO1uzbjDBk+9hPMyt00YFM8giM
 by70xMa4vFv2q9P0VNk6sW2eIpIiXvu2hzlqhDubNsTAfvcQkllZI0aBoYLjf3QtQSekhviFQy
 VjUIVSFde5Mt7pMCPj7o/5D5z3o/j50nC9/S/lxAQTJDW1hvf2FDvTjfL17XrbuLtJTU3zLKhQ
 EJlj0ioHVYOfw09MzQuGzob0mAZHB2tDF/GNE0vFcnxUT4BAAA=
X-Change-ID: 20260813-ti-keystone-devctrl-6e49212fe35d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219500; l=1991;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=rA4QIuFO1naxnZ7iJUUs/gm+e2xWDF9gudgR2Nn64Gk=;
 b=H4FZ2/dn30PCO3uXPEo/aR1of0PBoI48JMMqoDbWkWPQDQBUKVtcpjEkQ/M0rbwDir4sxD+je
 qH6LYUnKY3LAKQd/JIeAiazlV/rSsSrA8xyw/e+W5KjAUYZrf7+m4E3
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163830_279405_8B50C585 
X-CRM114-Status: GOOD (  12.10  )
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

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- add compatible as required for child node
- Link to v3: https://lore.kernel.org/r/20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com

Changes in v3:
- Rebased to latest mailine 7.3-rc1
- Removed note in patch 2 as dependency is already merged into mainline
  and there are no more warnings.
- Link to v2: https://lore.kernel.org/r/20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com

Changes in v2:
- Fix legacy node names containing underscores in existing .dtsi files.
- Dropped 'minItems: 2' and the conditional block. Made 'simple-mfd' and
  bus properties strictly required, as all in-tree dts uses it. 
- Updated patternProperties to strictly enforce standard node names
- Link to v1: https://lore.kernel.org/r/20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone: Align devctrl child node names with dtschema
      dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

 .../bindings/mfd/ti,keystone-devctrl.yaml          | 90 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   | 16 ++--
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  8 +-
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |  2 +-
 7 files changed, 106 insertions(+), 35 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav


