Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA031094478
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aGHf8I/J2VEnDJOrk/zmH3YobGfpo3C4LWoVFHKvuYc=; b=ruYeTSIxOGRP+CZzkO0ssryG1v
	1WBo/MjlwiC7bB2/Ps3NS5Wil8meiZnRIVUyM8A8KhX/Vki9zZrcpo9YPFxDfbdjp9CWXe9wwJznl
	XpaKnFXF8MaGiepzETqYHlvjSgaKewNqHUq3+QjkPLQpr06X1XqkjMXJYLVTQskIrQRpOEfqf56yl
	o7UA+pZVRrGG7VIUw5C6DcthSb/uoJXrSsFC0vSz19cUf4gmktpmpdiqQREyyqOxza5Zfc8EixgmU
	cx1F7aJdReniC0nwUxOo483NB+sDHIedOCmHHZRYQUoi619aE0xj2l+LtaR/ajTHgkysP9VAQStCZ
	2ufIFDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3x42-0000000EWby-2noj;
	Sat, 21 Mar 2026 14:12:30 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3x40-0000000EWbf-2HqT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 14:12:29 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so1902381a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 07:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774102347; cv=none;
        d=google.com; s=arc-20240605;
        b=D84HwQLf/57Dyi4aavhZUtf4sXhlf8gUhsF5pAz37QZRML03FT59xLTDjP8kWJwQOI
         RNih5IxecJBIfKv8KM8vEgvnVrLZDWSaZGarRt/1Tl4vU3kZswlluTy7tN6vS/qdSi1f
         rAFGY5mzJcjKh+2BAE5jYiM8h1eDIcQw6hJJrOxVWUUgziedrAAsyQ4KI6K5Cb0HbT8d
         MTHnRuF88GgvIGwkI+hR6oBAlMazoKTj++uiIbowTWmNcPrJnYnPRLacLt6PIjqSmT6r
         ur69ZqQ61Df91h95zjklbYe+B1tH9vhrQd/ZegE8BnCcWhFNiR/2OCIRvAqSU/gusMMF
         JbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aGHf8I/J2VEnDJOrk/zmH3YobGfpo3C4LWoVFHKvuYc=;
        fh=Mcc35UhftK9FzVhtC4Pcse5rxI6NXSrdL2ksRIDxer0=;
        b=As9JTIxo/rQ7HqC88ji45YKkWZXDFPf+P+UJNDzbmaEicsdSnYme29UtQTqnVtsp9L
         YE5tjx3K0mcYylOWwaAcdA7kRVtwVdZ6opvnuQjhC6q/umLns6bhTMIfBN7Qsm0UkVJ5
         6JwLNBtJ88ow+u/QwCQ9D6wdbyl1BhdnO8edXecOMt86aufSZqof2lW1oj0Yv13zm3IJ
         dPIZvV7ZoUrfXfZ0OvMZT3kxci1zM55+rIvYwsXNJzi4tQ0ciTbXcv4AV4IFqZ6WZxwp
         A0ISkN9LQyc0wbiIsbyKgP2tmBwIlLKLiVl28G168M+vO3wFS/WsS5/IloSyywTHYxdx
         dZvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774102347; x=1774707147; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aGHf8I/J2VEnDJOrk/zmH3YobGfpo3C4LWoVFHKvuYc=;
        b=HE/zUmj1d9D8ewaziHsBh177AA5GnwSf23CeQj3G2Q5R0icsybNpMy02k6kn9owLPE
         6lgwCG3H2jTLhHCbETU0rMwOTy5r0qoWZgXVTtHNJzfjFM++8WdXxCtXoFho9B0z6X41
         G+TzcBOhTpBaplSPjkPT2TU8Yv8VcpRTHi1AIiFTnOixOpw3lV7U0yVWbsZD54Z4T38j
         MSidPhHjKjBevCgpTruTkZZyd3qlffA3Rc+njqNTwkwppAhiQQcIiTKgOiRP+Q3CbAys
         NGUAI/XKvyp/9O2nk4HPzz5CsZzv+T7pQ20htBgWxPMyyRGQGMDq2b2nHRNvwGezGgjb
         JxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774102347; x=1774707147;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGHf8I/J2VEnDJOrk/zmH3YobGfpo3C4LWoVFHKvuYc=;
        b=Cwpe619+/7ErrQbp9G5zR26cmd7Pyv9Qr3zj2lTZgrwGFuSyfMwzuHFXt9VrqMy/8s
         QpB6MhqZ3uKNHVWLYGsSyBGPKXpzAbP7RyU45zxn+MypkPxRR2H3sIkbtT9lL+tRqoQ8
         6A2BaUyinnR2nr2DXrEy++TPWoba0D27TTlMU6qJNQsEXj62b3bIHjFvcs2hta/kNFOB
         ELX4xmMWtVtay3ahwcnQQctX4Zg004m2crosJ4LNMdsHIhR5v6K3h+MM2IqeIzDWuGUf
         /hX2OdBRzxs7YKHp43xs8MXvd3fjmwUjcgBePBXBg135XIK9spsNiwByl+Jxe2aE2XaO
         Iz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuOulfU326u3hJ7iddmIiduuYuHgPjE82D2L8nuH6rHpzP/fEneGDg5UmmgUa9qhMp5hJsIGNYN2vGBytfMh7F@lists.infradead.org
X-Gm-Message-State: AOJu0YwNmoMr7h7qN6Pf0Zi4mjBzA6Hfi45/gN0qmE04D74AbWsXmuRG
	TPUi8c2TNRj9/MsRmEgd59brD77kgpCVSlDkvRwPAVhO3wmk9gOnAKBne+1Fbmr4YeoU0n90Eux
	2yWgWV2p0PIC1eRu0wMSmc/dw7vJ5YYk=
X-Gm-Gg: ATEYQzzvKiLHZfzuXpfXBbp4kN2IDZzL22Pvj9h5FwzqFsNOyi8bmY82ksHP/C264Zq
	mK9M9y8Ae5CJdfLTJIZ4FfJPOE3DU4iabRWlwlodTNJWLdB9YVtrx4WjooWRKyHT0DX83pZ93uv
	tA5vWuZUtZGjxYHae+ouShvYY6ID37OAd3Hs30F5AivCka90MIJxUM1z6rzmpsB2D1+KnCsa6Gj
	WpsbBYzIykHPNDsTJnw3C5MrmOjJO0Jm8jA2KVVxT3fISr/PdGJGCZq0z+ahMkRVDSxaIfp9vyy
	hjLhGp4ZnzGMxYKI8aZxlWt22ci+mzTvxi4SCSDPsWTRk+TEOnw=
X-Received: by 2002:a17:902:e74b:b0:2b0:7531:b61e with SMTP id
 d9443c01a7336-2b0827c2095mr60488975ad.41.1774102347253; Sat, 21 Mar 2026
 07:12:27 -0700 (PDT)
MIME-Version: 1.0
From: Javier Achirica <jachirica@gmail.com>
Date: Sat, 21 Mar 2026 15:12:16 +0100
X-Gm-Features: AaiRm53iyjb6fXZa3v1nSpR1aMp1CYwsL0Oksk8_yeSdjmRIuMm2dpkKzEvF7QU
Message-ID: <CACixm23xGCdrZ5wy7+KyLHcdxRK+-XK6R0grg1uJA0Bo_s_YbA@mail.gmail.com>
Subject: [PATCH v1] irqchip: fix mask alignment in gic-v2m
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_071228_611177_492629BE 
X-CRM114-Status: UNSURE (   9.98  )
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

commit 2ef3886ce626dcdab0cbc452dbbebc19f57133d8 ("irqchip/gic-v2m: Handle
Multiple MSI base IRQ Alignment") introduced a regression in kernel 6.12.58
affecting PCIe devices using GICv2m MSI on a Qualcomm (arm64) platform.

It uses nr_irqs parameter to generate a mask to align the MSI base address,
but this mask isn't properly generated when nr_irqs isn't a power of two.
This bug was found while adding support for the TCL HH500V router in OpenWrt.

This patch fixes the issue, can be cleanly applied to the 6.12.x tree and,
with a small fuzz, to 7.0.x.

Signed-off-by: Javier Achirica <jachirica@gmail.com>
Cc: stable@vger.kernel.org
---
--- a/drivers/irqchip/irq-gic-v2m.c     2026-03-20 09:45:22.170192561 +0100
+++ b/drivers/irqchip/irq-gic-v2m.c     2026-03-20 09:45:26.284210783 +0100
@@ -158,7 +158,7 @@
        struct v2m_data *v2m = NULL, *tmp;
        int hwirq, i, err = 0;
        unsigned long offset;
-       unsigned long align_mask = nr_irqs - 1;
+       unsigned long align_mask = roundup_pow_of_two(nr_irqs) - 1;

        spin_lock(&v2m_lock);
        list_for_each_entry(tmp, &v2m_nodes, entry) {

