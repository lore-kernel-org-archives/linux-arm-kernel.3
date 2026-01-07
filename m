Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CE4CFD658
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WihJclLNTP76N6hz6eqMpZoD5cMEZ14VPXp1pd6gG3I=; b=douKRS3KuOrA/exNgeXCBqhxeD
	lEXfcqLNucq5uNdJ/rb2V+gQdAXFxCOXKr7F0sEEBlo59WIjOLsqe0iV3PhBntGSDMs2ax0SJr21K
	weUDDKsU3QCvGL/cyioifwCCYrs3qa95++yW+zt4HXmgIvFmTslyZWR4CHmcVS+Ef35L0Te1p1LTD
	UTAMe6jZ544oiWxwOtz6CwrpKrRQ2mxDCiUWo7RcwSx4oE7iaMlJJsW97BFQmGEN8DKAB1tEVAv9Y
	b/WJChNLgDq2Y0CZ+B//PstoxK9vaPoWPVi3hWr4mmDmNRT1zgEr/P/ZYRz7oZsPnOqgoAk3v+Na4
	y44JwrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWQ2-0000000FI4h-1i1v;
	Wed, 07 Jan 2026 16:29:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPv-0000000FHwo-3O52
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:29:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso5162865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 08:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803390; x=1768408190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WihJclLNTP76N6hz6eqMpZoD5cMEZ14VPXp1pd6gG3I=;
        b=hY6PmXgMjXpkesuj7Zk+phkrrK+MCaW/G+i1Xr0/G75PJETzzy0m3M3M2CC7IpuzNC
         0UlD8AmT7RGY8wlJsF9JvquQRD0L1nufGE0GtLWu8/Jq/qUOLdw3BHSPhmrApS04tGJb
         ElfJiYoK5c+avQ51MeI1KkcFir1cBjmFOWJkr/xajm8ZbMrtCuGXIGw8kE7Fan2bRKAK
         wBQniVPVWJv7ccdngp/aH0HiA/F+mEPQ2zwpwnMzJ5HJa6cx1eQ3qFSnDQLTfwsrBXSJ
         eyr7wIzppk6KVsFkzssjhVqJBYJ7I4T4wAkbCt+T3k51xQ2OlBW/xRf7EgNrvUjfgT2B
         ay/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803390; x=1768408190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WihJclLNTP76N6hz6eqMpZoD5cMEZ14VPXp1pd6gG3I=;
        b=Fn7RqEaDZ8Z5eoNHGWHMS57oRYfLjaC+hZC6cHjtAU6Jmso6fxBgKwGdFB7HY3f4jY
         C8sxlEt25Ezam61zAgAF3C70uGG40uyPtKNRiBmHv4tQqcoakIiAt0SB7n/QldjmVUss
         nh3aBCswJ44in43Tg5Bns/ywLMCnuAVD8QqyMz6m9enOk4dScvV9t8nxUZvVaK5Bg7rK
         Ez3gl1qLPDCkk1YsXeaxz0lO9e3kQzCjDbKygM6ACrTC/yJxWjKCp3r1PP3RA655v42r
         UTLS6JFqQz8kT9riTRLN1JIyBSa/hNNgt151ik2r1BKKnWbeNNmMQs1l1JHcrAjQvD/l
         Wyzg==
X-Forwarded-Encrypted: i=1; AJvYcCXBKw/Qr8kHifoQQa/ZNDct728jrmmSQnxu3el088tQLvEBnYQON7zaWZpnuWgFYFn3HLWkVv1Dipu2s4om0bRH@lists.infradead.org
X-Gm-Message-State: AOJu0YzksZLZYEbAGZqfkheVdMuBC+Ch9OJG/5m+TwO8mfH0J+rBJoIv
	VcfhutyPUIJR6/PR0zvTPIjyj19q+oiJwZ7bs1paQL16btOTa4nNG9Bf4AaeDL1zwn2j
X-Gm-Gg: AY/fxX6q5pgqKQGNH5Ksr3re/mr7bp6tWFxACctcrxkVTv1JPrpfB7lEBupb4UCCYAK
	2RqTiojTwhvQpj3tleNd5bA6inmblbBY36nyVqj3A6OGBntVZXLb4JUbbwGJrd0rLoaGnpJVK9x
	CHJPZ/hFSshV6UrrtFoUD7eNIlnPDXFV9quhtj0lm6Xha9Scdt5roX6HwR81TFXxDh9BpDpXneN
	+Ty5rgz82lbZOjxKbCO8PmJfurdZmOmEqpqrNfvvWYfq6727TGKykx37kmyEF0QBL58BEm3B9Pq
	42LBdQ5V+VmbQUTJ6dqho79ad9G56XVuV8nnkKjXcpKeZA8qFgwG9Woe2pvf8ex+vrHMMNZa7Zi
	Qm3bwS+NjE91tQZ7Cw1H5LmYWq7ARwKXTie45DlFZiaovTRNbyqPYDCj5Lb+Kf6U2DU7V38dmPX
	Ib1Jsfp4XHRBPt5XSTAA==
X-Google-Smtp-Source: AGHT+IFKD1+c7SUjD7a/gByTTs7FpF1prAJlqO9osr5dmkMQRiIqO+8yFt3RtGpmL0uKFm0/tPDRBQ==
X-Received: by 2002:a05:6000:a88:b0:432:c0b8:ee42 with SMTP id ffacd0b85a97d-432c0b8ef25mr5297882f8f.11.1767803385887;
        Wed, 07 Jan 2026 08:29:45 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:45 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 6/6] MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT bindings
Date: Wed,  7 Jan 2026 16:28:29 +0000
Message-ID: <20260107162829.416885-7-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082951_861473_29076920 
X-CRM114-Status: UNSURE (   9.85  )
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

From: João Peixoto <joaopeixoto@osyx.tech>

Add MAINTAINERS entries for all the Bao hypervisor components.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..4286efb307b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4321,6 +4321,19 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <joaopeixoto@osyx.tech>
+S:	Maintained
+F:	Documentation/devicetree/bindings/bao/
+F:	arch/arm/include/asm/bao.h
+F:	arch/arm64/include/asm/bao.h
+F:	arch/riscv/include/asm/bao.h
+F:	drivers/virt/bao
+F:	include/linux/bao.h
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.43.0


