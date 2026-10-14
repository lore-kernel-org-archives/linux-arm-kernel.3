Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ED6CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=62WR7HSbpTYVFTv5L5GyNfp/jte/MYhYGnFTixB56k0=; b=IsT4uHdn0PbkwV9RBLkbd38xIv
	JYjBJAtRMpYYmq+nURte3TIe+eRxEDXv65+KC7pSrjMnSfP19TwPe4XMehNaPPGvIfpWSy5ZvjwvI
	8lbWvxoQoXpdLAgRrLCZiwquFjPmXq0NRfhcVbBhXsoGzq7PK4jsv0iGVie6xDscfFE/kTWJ38F5z
	M+p9BM/70eDGyS5HfDEt5RFsV3J6JcHpB9awnlakOtLRf//BUJ2VVPaGzLp642VHQSJdyF/L3iCHM
	iJT2ktpbyf7R45FJ0sIYV+i3A31WT6K/XIv+++f6VCl5jERPaCgq09+TZuLaMJVYIUSW7+6beT/fo
	lNNwF0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyD5-0000000FRJY-21u3;
	Wed, 14 Oct 2026 12:35:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyCy-0000000FRHk-1Hub
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:35:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b060ec084so2662743f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981346; x=1792586146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62WR7HSbpTYVFTv5L5GyNfp/jte/MYhYGnFTixB56k0=;
        b=rDd9G8qsFUZWG7AUnKNsh31GOl4IpuAhv8sLJNuPDN6iEMCdw1cFxkGUl7dgy9T5am
         TCR/dKdErofaYQVjgtm0lb5fgAyiZB2PfyEIJ9WrrQIHBFQV4tnJVNQdpq6SYAnuEI/v
         doyyk8GQ//plTK02sSNVpRnO5GktU7Lu/km9C+MJs3SYlZ5lLYPyGpqrJ5HcwCua2hs0
         etWi0Usq1E8Gm/iwrRbohvRMYhCi5HEPhtu5B/ibj7pZu9idfCF7gEVRuRLHXvIGGQ/D
         qoQbvTfakLxdCHdrPMx6gLU6W+FZFUK4YsvGHkgEyU9iXwjRvHmWVK1Nt8PkMeDmESum
         LzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981346; x=1792586146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62WR7HSbpTYVFTv5L5GyNfp/jte/MYhYGnFTixB56k0=;
        b=ZgLYFDNYjD9xDVoiK4n00rPn3s/L/u8pdfv/z7trIJdDrjTpVo5ugMhHa+d+LVH1M+
         JI2QnAQ+F2WI1OWnk4rxVC9ELLUfPXba0hY0MWqIyI86sLexoXtpBvvoO1WNhCLV2iyd
         mNIeTCaBSXY0sym4LD3hg3QRwdWFCbhfNkkx2sYQarKENbZDiMzwZux0lxfl/gPaKW6D
         vZ5C2//sv/2iUsY1g9/gFaUdNvW9Lc2cLv5F1/AHmNOsKDrClAfkZKmyjHYAOzoei3gT
         5TXmLYpyuWxZEqr2fxJ7bnGkKJpsvuLpPrZA3uSMAahAEuLVfyHplpjVy9gr0Yt+ZhXU
         1XgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcWc0DOZehW5OZs6bRN+XFiwY6eOuTtNaoSL3HODOFn8oQ4HZbmvCIP++Cz7Hl7ncTS4rMjR00uGXeE/S8g4bq@lists.infradead.org
X-Gm-Message-State: AFq9FYKCojXwksc1TNVQae66nfOYfQq+L7t0Qx6Ev9MCeZdsRL/cmTzh
	Y/QpPpk/Ca/YcArZtnDkwdL/3En+x0TRU4wri+nZZCwUc8k/v6VmtfMZ
X-Gm-Gg: AYBFou0i4yhCsbITQXoLe121vhT68+ZLqDYkbn+z6qeJMCV0n4cKYvgCdQVWMpOuOrS
	eGv7jPpHpl//YB9Ma07pcGeUiL/IuI++gDcg7TJ9U3SqB/DHxlSRBD82gJL2srAN6IIeQ7liOp2
	MWrQkB7m/v+YJ2KqIj5nrY2GdO1Pz8Ta6W/CZE2WKvojVCYePQrEE6X0vAiFsEBaI1nTeznbGLX
	Q9FOoW/nuh08jcacyRTTu9zjxaovGRRVRUNkgCUtbg5qk45bqtiePp7jdUpryjLpeFPKBMnhT19
	N4FWGWyl7LsqXOkRV47Y2U6vA6wHfcQQoYFBNJ/YUw3379XrsFnp7xMt0+xU1+WPOSxn4WTw79O
	mCP5wWWjh2AveMlnkjZZeByf/e2View7vqLVF9YxrMPp4FmaKIKdi/ekONGSiiMK43Tx2VL7CyM
	e/fiuqk2hVatCI/anraSPkwiHsAJr4dvcnUckgDPCevVSzmUg80+nmeowG6jE6NoiQv2QsdCjvw
	VHEL0utWPaBXXJBVseXkMIRYkuEUBt5K5gvS1vFdFVL+2NBRAQ2FqKwOBVvj8OX
X-Received: by 2002:a05:600c:c104:b0:4a1:96cd:2f73 with SMTP id 5b1f17b1804b1-4a196cd32b0mr167859285e9.1.1791981345889;
        Wed, 14 Oct 2026 05:35:45 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded3874c6sm3003353f8f.18.2026.10.14.05.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:35:45 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v3 0/2] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
Date: Wed, 14 Oct 2026 13:35:37 +0100
Message-ID: <20261014123539.2259230-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_053548_375996_996F7DCB 
X-CRM114-Status: UNSURE (   8.40  )
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

ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
dependency, ARM_PSCI_FW, is met.

Patch 1 of this series makes the select conditional on arm64, and patch 2
adds stubs for arm32.

---
Julian Braha (2):
  irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
  firmware: smccc: provide stubs when discovery is disabled

 drivers/irqchip/Kconfig   | 2 +-
 include/linux/arm-smccc.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.55.0


