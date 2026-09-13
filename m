Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1715AC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 22:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NhSRUlqeyUz4yTc949Je7U72nl4ZdEKUBnpeXKWqOoQ=; b=x0CXQWbpppTtqY5fzi7jq9Dtq/
	aruqNi2fgfTcuPJyuuBLfrn7h9u8LnmFp20H/sDRkcz0GO/zkYsx/Nr4z7bOOIDjOu5YlvVkZFsvS
	2KvvUnaa+TNxA8HEMIJSAx/GMdGofCWTB+CX3SpePp06AZcDDK7ur/74KtnOhEjvLdtwaGuGHFsBB
	1aIOGSiuHLU99QwocowmNPzGfAkgUF2IO+TDGKQVOEJ3ZKXhcT0JFwVJJaZrZdt/M/yd/KIzWdLdX
	mHYe3KbYydESpzZzEQW6DqiknXIhaQ/1UwcGWP60koGSZ/9CVowTgiBmciChULUiCdp/FONU05AhT
	txWxbAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5spb-0000000253c-205K;
	Sun, 13 Sep 2026 22:37:51 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5spY-0000000253J-2jPB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 22:37:49 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-91219376dd6so19691416d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339067; x=1789943867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NhSRUlqeyUz4yTc949Je7U72nl4ZdEKUBnpeXKWqOoQ=;
        b=Zt2cu50eFi/feFTEm4eR2n6nmKf4W5lJypKvTQpvGiHZJ53OSqQ8+raY5RwgGmg4/3
         YygmJF+yHpbh/KpUm/AG3IvNeISf1H2QYqoHl8UGb8mtb4ba7S/bd8Zygl+Km9qDqe2l
         4gcxYDqEtXlCXtr9ClJtnvKQZJCZ67ETqoaRIU7yALRCl1/0lkOxFrfPQOydahsS+IRc
         ezBiBez1qpPQ4jo1ISNc2/jOYsv8IM5fq2TewNucWqwtpm4K/iE44uAzfhNMt+XsuCpl
         4B74CLQC9EBXVKxa79afRywb65C4H631U3n7rWz8bkYYdBUgGL4rE9yOY46Pg30hK9zl
         CVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339067; x=1789943867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhSRUlqeyUz4yTc949Je7U72nl4ZdEKUBnpeXKWqOoQ=;
        b=syYcEWU+2tOk2cfsYzIMJ2gdlFIN+iUr0C93MO85XOcmC5qNoHKxIPIe6jrI/PCJx/
         UerNPU1O/zzx5a62lqtCKWBqtcIJCHtYDJ0ewnKuJ2AQKsQqNZdkBctHr4KEWRmJXXTn
         SYSwAhv8L0d0NRA+VjTuR0RIpTE8/yihy/DdRYF0EmaC6LvVGVOwU9yBSCeOo1waVHNh
         xwgv/ItNljpNOU3LdHRWTvo9syujk2eeE9ToMdCG5cCs4Bes32hNv931PGkVz5g5PjOH
         uaIygvTv+vsO0n/bZLutPzZx63yCWX/0IFO26QxyEOvz044Fu37j/3zbhIvCTEoEGDyU
         DIRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKG+P3sKJqOCUS3yktwqveAxOmmRR/8Mz36VUIdWGmioHJpEyB8VBcF6bbnqzOjb9jsN4o7ooPjDrvz9di8eF/@lists.infradead.org
X-Gm-Message-State: AFuF++mxFm6lPKhgtq2byyphdqxZAJQnU0fJmrOAB/Fg/dSQE8NEMIIT
	T5JYgvCr+lpB/obWkzOf1yJur6H7gGPyo0TIAAF3zgpza12AyK/++jc=
X-Gm-Gg: AYBFou2fGMKUB0DldCTIasot8zFjsUA7Fx1BeNqDSH+nO8CLJbgPOwOJbrw1ag/jWW6
	t8tiA3oLE/6asOF7cuv8U68y8RdPaNs0s7WjL4MaG8uYtK+DMCgZmbT6xzW3uz90gu1rV4BTA1r
	EeCHO0i0BqZUaByEp41HcioL1tL0cf630vBEm8e0dnQFXB2qvxhB/yD8sS5LpggbFEXK1gMsR5j
	YI0eHir2xnhKkH9pnAKANsQ+eU6NTf5ZvKxPvRm4kGvyZIzH6JHNH3vRGMyFU6sDrsaVON9s/1w
	cOycyaMwpry4O4FDYS5U2BLU2Gv7VCKm8DKEtWU5i09uzweosxIhug2jHxxjMhK+DVlra0y2eaQ
	Vax5NZUJRy4LSGR+FomtsBHRG2RtO2dr6KInYq+g5TR+tE02c34Dm/9l7PDPd3mK7akZZiJPuDK
	GBkSnkOATa9ncbBoLKo8gzWBiZtRjEWDpOIwL7ntLxoJF/4/yqBs+e+PR7Y4jBaKYXQFFveKNBO
	u/zA8487UbL5NKl9609TepMZDafctgS1lr8PiIDehM7bj6poe2lh4cMrCpV4NaexnGeki+bVLrE
	NIvET1sDBcRoF2W3WQt+e5XysQjn3rAVNw==
X-Received: by 2002:a05:6214:4117:b0:907:bfc0:781e with SMTP id 6a1803df08f44-9122e55673emr2317736d6.30.1789339067037;
        Sun, 13 Sep 2026 15:37:47 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cbf2sm79361056d6.17.2026.09.13.15.37.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:37:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/3] usb: host: Disable controller wakeup on removal
Date: Sun, 13 Sep 2026 18:37:29 -0400
Message-ID: <20260913223732.92882-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_153748_724453_AF5CADA7 
X-CRM114-Status: UNSURE (   8.48  )
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

These three independent patches balance the controller wakeup enable in
the generic EHCI, generic OHCI and Exynos OHCI drivers. Each disables
controller wakeup after usb_remove_hcd(), before releasing the remaining
driver-owned resources. No shared USB core behavior is changed.

For generic EHCI, a wakeup-capable ACPI companion provides the capability
setting through acpi_bind_one(). For the two OHCI drivers, ohci_run() sets
controller capability when OHCI_CTRL_RWC is present. If probe successfully
enables wakeup, the attached source otherwise survives ordinary driver
unbind because the controller device itself remains registered.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code. The patches and explanations were prepared with LLM
assistance.

Compile-tested only; no hardware runtime testing was performed.

Myeonghun Pak (3):
  usb: ehci-platform: Disable controller wakeup on removal
  usb: ohci-platform: Disable controller wakeup on removal
  usb: ohci-exynos: Disable controller wakeup on removal

 drivers/usb/host/ehci-platform.c | 1 +
 drivers/usb/host/ohci-exynos.c   | 1 +
 drivers/usb/host/ohci-platform.c | 1 +
 3 files changed, 3 insertions(+)

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780

