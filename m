Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F17CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pOSWDS5/Ihvyp+1XM6mV0GAPNEch8iMG3fi5kmx4byo=; b=RQpUwxDCqEwV/qLL/P34QOEYGC
	+DlKOkSAUxpoPrKGh/yWOQSR405KbQmVexPy5BK7YKTBW2ANsPZiyh1DScNZ9iNgqaDrZb/806nxS
	FG7wyeM0FAZmH2ygRB8ZlVUP28kTdDQlP9MQ9wVFnq2/2BwfMSj8ho9UcaZrh5Vd+/eOM6SAVatGS
	vJJDSg+GCmWqE4OHDznD2NjtiMw6tRlOhZnClCI6PmMym/Sb5ox51BzilSdMpGHNlf5raQaHYTtbB
	RfaDi/Rj6q/mkpjHsu3xG3Tp/znD2NM5fm64h2/l2iCQhAbX5HPAxsKPSy6LC1tX8h0mBesjXK4aW
	Zykjbrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtdP-00000004unU-3EyV;
	Thu, 08 Oct 2026 19:18:31 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtdN-00000004umK-2iHn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:18:30 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-35115b52125so4488679eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791487109; x=1792091909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOSWDS5/Ihvyp+1XM6mV0GAPNEch8iMG3fi5kmx4byo=;
        b=NiXvfYF6KuZIiz0KW8pcBBYXtPyV0IXp4g0jG+jJVGZcV0ZP2x0A8MwFoM+aXyCNRx
         oTboFk5B38Ol/3vazgf9DcqZASMeYjSOtTULd0ogdVkY6c/BWVO0VUfnlxSkXs5C4fER
         W0L532fzhtxjPT5ieLwK+/K/shVxmDTy/q8j1cDBjdY09Y7CkWxzUmuygnjmKByFgVmF
         oHJvIdUphdbvwJLitaTrQvu+KvOr4325o2xML4rGJSOE3v4M0aHu+Vsj1tZgq1C8lxYR
         lfYlCV9t27P0k3Shd8ExbuCUV+1uDadNkdxc52iMvKZpr64dHpKLgYQN4W4BXcnZNPtr
         wY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487109; x=1792091909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOSWDS5/Ihvyp+1XM6mV0GAPNEch8iMG3fi5kmx4byo=;
        b=k/oa1xnrAXhA8Ro5GDcr3SyfoX+JPLqhVKFQwWWw7b0393h+h5dSOwTOtvo8Y83gF7
         RqPlJOf6wQfaa5w+JmsPxXZTBr4bBMmTupXlAEw6kLlRon+kyvGjBe9+2IvXgBxvvGLT
         zRNWGORLu1K78oL89d2BZBC17U2IBA7FMqwxw8kTYdmTpXMRLVBE1HEGWlUpp1pAgPR2
         +vfKzvfiy9JUApf42YR+rw+CMU2xNm6C7kECYe1KQWfSMARBOhNfqZIrAEr6pN+j6bv0
         i93XAd5ZhOecE+6PB0OhTmnZOB49oRsV/BR6UDrz7kLIDyKIyKZU1EZJlZPAA91KzgUr
         ghJg==
X-Forwarded-Encrypted: i=1; AKwUvBwB6pf5lBplEROJJwkqaaDUnT/HANo36yg6ZmhXPT5SbRM1SF/8PCsR6bgdXxTw3jf4n2q0AFn50fwbZnH3omp8@lists.infradead.org
X-Gm-Message-State: AFq9FYIrVIb5n7RsC01GRGvwz79qTpFIjx7MgZ6snKECHXUAVkRnsHGt
	VEd8AXpgSTnU3PAiwSah8k0a1RkSc+SJnD1WKD5rmHtWhbTdw9ZPV8KnGaz1VKbyTmk=
X-Gm-Gg: AYBFou23QD7eS0UmjKGlkIbmtlhGH2pxvz4hEEXpHo3LoqfTQUt29Qb+e2ssTev1pNH
	ds2Y5tswMLJwn8HDczeIa5ArgfLEt2bJGGHu7ssnRnVRa1kxfIVDn2ssoqlE10gRpZsHcX+JtTE
	16ZKIz1CoF5KaebEfwg/NSZfpY7TRSGScSvWYphUeaG5kiFqttXFq4K/KIIP7Nkd5CvzsdJtlY8
	lAKxPjxba5ENKaU+gq+hCHzUiUJI+e3GUN2E7n7vsNfyaCreJLLeQs682rzsJwrFXlJYP8mM9VO
	lR1hxfYcSnrvf7qpWbGxU5tc4iQchzVlEGR4RwoTdbloy+xw8YyCRQd6LoH4Hdsyx8u6ibVrR3A
	MvX+s5Bm/ONWt6gcz1pZ1CGGYFvIxMq/b926irvxpcTe0Cp4riP3La8SRiJ1iVYHUU9pPRgbIVV
	sYz5YYmTIga/VTUcaThjcb5XzsnAH514FvDv8LmhGv8LT35+As1RuOX2X1KbxybvUmvlukhgH2J
	hZAWgh2LHuLjtYSQ87qJMOxIB+XTCmRiEVggFst5CNRV/OhAj8hCvVyUJR37O007w0oFpCK6UD5
	DuZC+A==
X-Received: by 2002:a05:693c:8941:10b0:351:1f66:469b with SMTP id 5a478bee46e88-3515dc54ec0mr7434477eec.2.1791487108233;
        Thu, 08 Oct 2026 12:18:28 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm117933eec.4.2026.10.08.12.18.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:18:27 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Marco Scardovi <scardracs@disroot.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	jay.xu@rock-chips.com
Subject: [PATCH 6.6.y 0/2] gpio: backport CVE-2026-53226, CVE-2026-64241
Date: Thu,  8 Oct 2026 15:18:19 -0400
Message-ID: <20261008191824.98662-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_121829_707021_F2FD6DB0 
X-CRM114-Status: UNSURE (   9.18  )
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

Hi Greg, Sasha, and maintainers,

I'm working through the smaller CVE backports still missing from 6.6.y.
These 2 upstream changes belong together for CVE-2026-53226,
CVE-2026-64241. They must be applied in this order because the later change
depends on or completes the earlier one.

The complete series is already present in 6.12.y, 6.18.y, and 7.2.y.

Could you please consider this series for 6.6.y?

Thanks,
Artem Dinaburg

Series:
  1. gpio: rockchip: teardown bugs and resource leaks
  2. gpio: rockchip: fix generic IRQ chip leak on remove

base: v6.6.157 (79643295eba17affbd16ca97f3ef04c90266b28c) plus stable-queue
revision 958ddf240a33ef26b1771be944f0ea6c3b597472

