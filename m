Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09786CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iap9wqIfUNfzgRsabkOWwLbHyEDjwXlweruKw/9NanY=; b=fOwM9wFsD8lfnI2doZo+QdVQ/7
	AOn02Kj3b7fbr8xnBcg78K/gbRQ7pvPmoHUhLBE5hpX83qYDcuq6zCIO8FVABdaIRndrvH3uViCcL
	aDYG/sIt97rZCt5HPiOFkfEN2/2SJ3BjXgxLG0sqWy1KlaXEQHHgs1EJT5NQjRrtRQtsmTJEM+0fi
	9I91M0g/ha4EhUp9j58Te2UlF/LZEsF78ybeQHlUgqwu5yGc5W7DSXtm9FOhfxrY9twPVZueHDWrc
	o/YVXufYRfL95cLsMDbMojOAZsYUvntGDEktnS5dkQJIEU7lCfCXbRppi78nYQNq76SG7wLLv5ZAw
	F53K2ZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gDk-0000000APWJ-1pKq;
	Mon, 22 Sep 2025 13:04:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gDj-0000000APW4-1Jvy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Sep 2025 13:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=iap9wqIfUNfzgRsabkOWwLbHyEDjwXlweruKw/9NanY=; b=BR57Lp5NX6txAlzrDva86mO1tl
	M8F+NFP7yGdoPgzVZNWBECG6zlVvZdVpSqUbarz9iC1ho7ZYF27RjM21KCy+qa/pGKPfJXF4STQo/
	xyr4koMdrw/7RfbdnZnbg7GzNsCEu8KxqmOxiAlnG6s3y+8yZ5CeAWWMbAYERN/A1uNERZobnNvRZ
	a8n/Tu7mQs42grd6FYTmcmrNdaEplb2L+weDCDNkbNDSXy5WDzhhs6ts08Aiu/66m4MPVNI0GOIEa
	WOd6m78tsDujNHZte4uv2bI3ODJch618E84hxa2Q4waNblLU7V1CAPSop8mO+FnMRRUFy2m1+eDl2
	eF//OUOg==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gDf-00000008HoT-3DfE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:04:42 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3ee888281c3so962462f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758546278; x=1759151078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iap9wqIfUNfzgRsabkOWwLbHyEDjwXlweruKw/9NanY=;
        b=ybB99mgfgGHfCNReFIgjGIQfbFoUC+tRXV9Dw/q3bS4TBsvTj3q06IVj9xdnyXo90O
         XCDVPh57CSoGURcT0mAyXT8onEoulx3SBCV7jnhbatw/F4Edba/mwZhkjHyzlhiU4WC7
         Z2MKRAEfWi4m8aT0ihiwLC+9/iMKscWTXnnB/C0RisFeL39ohb/squfZ3MDNaoqDgG6d
         OrVkgl5RZXR3Nak0h1X0PFzgmYMbM874frchdaHKCl2qYdn5tuZLYyBs52N3DV4hULP/
         R3zf5Ar7K7IAdvXv5hYAE0GbG98lfhsfkGDmii0BXmvzq0QmEzLpvAsnONOEGejhNSbT
         MvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758546278; x=1759151078;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iap9wqIfUNfzgRsabkOWwLbHyEDjwXlweruKw/9NanY=;
        b=TqukWqFexQcWEhUjGrQsLoAvjjGbWem9FRfwnP+HQXutr9pShkbDhGS4MPxzedJl//
         l567+RGmkS0JH+Ylqvfg/dOhWg39uEXoOCKWZLTqI1G1I7qoD104rx2qok7a+YsGSIsI
         5EeYObv7CmhzN/6axizfszhOSGKr5JJhuruBuHSVrMOt7jUVSVzFrLd2dZyZALS8k9IZ
         uUbT9ivmgO9GmDAA8I7XzxyL3g5QpUoyIHPAi8NB0Iefb/GqiZ2kcPnDh3eg5LkR3HVa
         Id9yZ8aMxQne7kfL/tT397NYeXAea2wyLxdHVIFygYq0hxSks+BfQCX+OBZRZNZvYYUE
         CMqg==
X-Gm-Message-State: AOJu0Yx3JRF/wjc1Yq2pV5l5DAj+/AaPXfRH0R2wsKXo7owHNNxYOHmZ
	VKAYYCeZ05Mt+8Cq9uFF61bHTU0i+DsBIogvsYxgrgWZGIMTQMNhpuPU5ZyVuY4QTzVq7kJT4Y+
	ECCZOc4ggDZnIBudAuVW4unyPFVLeE2uPn2pNk1mHe15B7G/c1ZfnjJEaI2Gprl/gsziLZao4pW
	qaiSyqFKm0pQf3IITgCxLQUsywNR9tVgY7kTLF9iCRpECbxhV2eWg2H/T5c7PW
X-Google-Smtp-Source: AGHT+IG4/C+rN4qaU8lkxJCMdTPbpFXd+PfBKwy+XEmnl90zNWLAtfCNII+uZuRAKVlJ4dArjk/TBRTMhKKd
X-Received: from wmbdr20.prod.google.com ([2002:a05:600c:6094:b0:45d:e232:8a66])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2dc9:b0:3ec:ddf7:41b4
 with SMTP id ffacd0b85a97d-3ee87e9c87amr11321359f8f.62.1758546277574; Mon, 22
 Sep 2025 06:04:37 -0700 (PDT)
Date: Mon, 22 Sep 2025 13:04:25 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250922130427.2904977-1-abarnas@google.com>
Subject: [PATCH v2 0/2] arm64: modules: Reject loading of malformed modules
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dylan Hatch <dylanbhatch@google.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_140440_115042_664C1154 
X-CRM114-Status: GOOD (  10.21  )
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

Hi all,

Here is version two of the patches I previously posted here:

  v1: https://lore.kernel.org/all/20250919122321.946462-1-abarnas@google.co=
m/

Changes:
  * Renamed the parameter `is_module` to `skip_dry_run` in scs_patch()
  * Moved comments to module_finalize() and improve justification
  * Instead of rejecting all modules with callback, reject those with cb
    pointing outside core kernel text
  * Replace -EPERM to -ENOEXEC when rejecting modules with incorrect cb
  * Fix missing return in apply_alternatives_module() placeholder

Best regards
Adrian

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>

Adrian Barna=C5=9B (2):
  arch: arm64: Fail module loading if dynamic SCS patching fails
  arch: arm64: Reject modules with internal alternative callbacks

 arch/arm64/include/asm/alternative.h |  7 +++++--
 arch/arm64/include/asm/scs.h         |  2 +-
 arch/arm64/kernel/alternative.c      | 19 ++++++++++++-------
 arch/arm64/kernel/module.c           | 21 +++++++++++++++++----
 arch/arm64/kernel/pi/map_kernel.c    |  2 +-
 arch/arm64/kernel/pi/patch-scs.c     | 10 ++++++----
 arch/arm64/kernel/pi/pi.h            |  2 +-
 7 files changed, 43 insertions(+), 20 deletions(-)

--=20
2.51.0.534.gc79095c0ca-goog


