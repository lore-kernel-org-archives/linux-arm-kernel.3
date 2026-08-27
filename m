Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14BAC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i4ukql9tjc7O2uHiUIhyqjgrtBoEY/j9Aw/McRizAKQ=; b=kNbTSKYiGksb0TeG+/HTwL9zDP
	RjglHkjOE969Cj02cL6LdqAhcgRJR7ogpj16Q+vRj09jKjeS/bx8KQBfbGTFa0wwsIhBXYYVn37nX
	Vy2USVkrOMXlKv0ZRiKvT4LQw3UHcOdh3YG6mLc2QsA3XTgiUy2YDmDznbsFcc3YAdQbn96035ud9
	6j44iUf1oWjNxC6DXYsjqcngsdfe9MvLJYD6XiX5BOU2El8DTbAETWvnkjedXm+TH0OAUg3f9eK5U
	kN/69EBZi1UW+1d4OCOQxWVKjKc+O5wOjQqfUOAt8feUTlMNRnVJ3rzW0paqbBdt0gDznYMs6IcMZ
	bgYDxJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZ75-00000003x4S-0oeC;
	Thu, 27 Aug 2026 12:21:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZ73-00000003x2x-2u7X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:21:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49b8687630fso3860835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787833303; x=1788438103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4ukql9tjc7O2uHiUIhyqjgrtBoEY/j9Aw/McRizAKQ=;
        b=Vf9omm9UG8x+iMflREDexLxbVmhhQeY9FIeRibkV4Wml/2ZR8B+BataewHOzYN3ekP
         nwSUnTqu9gaRLsnBI59IhdolMT7Z8rmJ2R0DuSI562wU7Q9e2uylR+AaaBAuFppNqq5O
         zRgmESqSBODqPgxtaIOWWIE38gTm+to2vNP01LpctE+aG4WwhE6vRl9ezgbVMaD9gnUr
         3E68PZfQVWNunxgef5nltaALdhMDpbrP94Jwv45fYdtLYX1bNdijhg6rGUOJqqECjp70
         dsvWEYWfcwJBwhOkuc3NfJuJOOxG5+ebQDn1wsApxVVRhLC1xVIq2s+old7QuibJZa2n
         H65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787833303; x=1788438103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i4ukql9tjc7O2uHiUIhyqjgrtBoEY/j9Aw/McRizAKQ=;
        b=b/LxUSCFGZ7qfvJHNwtW3P84Z5g8HjByO7xJ8AJNGvK1uRXGQxu8yky2GsNoFrd9Ev
         owvZMmqAze/u+7Ja6qBQjQfMNtRv0okxTzNXer1pcBTk6tJxAb6JSDasMG1AS2TLp93k
         Bq97ZmTZpuQICc9ty2jJO67+O3YtN16rtXyo4kPhibgPczKu8J2PM/oLpU9DusyEz3yn
         ddX+chtgmR/uiByG+ABrbCEd7Y2gmB6lxDeJ+5gd6ZEzQG9Ae7sCkmKOZ7dag1CFrHsF
         0EVQo59qR6/Tpknz2YUqaTtIWbPlACftN8WV0mNZbyKNJOf9qa+7E3kfBg0QxcE44KdD
         D0ZA==
X-Forwarded-Encrypted: i=1; AHgh+RoUVAldGl9yhz8s9RYcootH1amq2BQpEBaH9MgliaN2b8iDwckpKlXRAdo2+aQOMfH8GnYZHAA4mcyVnKHohE4S@lists.infradead.org
X-Gm-Message-State: AFuF++kvJVWyyYUyCXTguZLPhF6jfOlBRkGvaRp2VwM1a2JLvY1qKFCl
	1P4yQvVxQ7t3etEIyGSWE4T99X31QxXQZNzlb32yZy1ELBliSPVrM+L0
X-Gm-Gg: AR+sD10vzpX/5xCzJGEKJCMQcNfKByv+lVyHQrQOqmOryHRGYYOc1iwWzFD1szjbrBE
	cXg1T8cRfYb6neaI1ogNzJSRGH6todsbQtBhOHROI4Rx3ZbG60EXCGItzpiWWdx3e5hNKmaPM61
	jE+jCw3qWd0+EkwDQRj/D3O8beafvxNDCyg9Wh1CU462yUn5lR4epN2oEI23oO592m3I4BVCDhf
	F6snOBMiIy+5g+BU7h7PQrBV6frgKDtc8nbsGZsYEuZh8cpP4tB6ZdSct6uCADz6dFj+cqCl+5Y
	f+9APIQVzjvJjm5sPx/j2Pna4ppXjaBekn8EvRDlBGh0MjFbErYci2uvoqq7jwYAi7+s6/bl0/T
	qaNShakihwAOc5vrT8WhhZCmHvPKnb00yIfH6CLZ3gddVwrVVl4NTIiZMw70IybFQ5LTzHh0pxw
	aOgq+WEbhLzZ0ATvLzS1c2p3XZMBb4hbwxxrVgze6e19pMpk2z6rsttWEtYJasdlt6eGaTOVfkH
	BVQbznwrYLzKHWUc0TQ5GseuFVcc4s0VxbPluBCXcvBzhhuCc905w==
X-Received: by 2002:a05:600c:4e15:b0:49b:8e8f:a409 with SMTP id 5b1f17b1804b1-49b8e8fa4a6mr49907815e9.13.1787833302721;
        Thu, 27 Aug 2026 05:21:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b465226d8sm50099535e9.0.2026.08.27.05.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 05:21:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Thu, 27 Aug 2026 14:21:19 +0200
Message-ID: <20260827122127.18874-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_052145_741007_DDD5A3D4 
X-CRM114-Status: GOOD (  13.44  )
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

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   3 +-
 drivers/phy/airoha/Kconfig                    |  13 +
 drivers/phy/airoha/Makefile                   |   2 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 815 ++++++++++++++++++
 8 files changed, 1283 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.53.0


