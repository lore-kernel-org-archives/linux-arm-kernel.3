Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65249C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 05:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2dYl0OUyzZ06MfTi9YwzB+RT+fpto3AMtLt5rd0qn0=; b=G4ylzMzV5PL0YRT8HpupLoSnPp
	eipxRHEjXAvgiCYqyPoJmYCYrrT4453owvE41wJA2nXtC9lz7iBSfQlih6oV5peKlKlIsr6ApUK7T
	ktNz6r2oMfNh2FQ6sKQ3OBgTiXpmhZ+3ow8vfdJz1+onSknNIuStIljOAUOxPh4oJObyMHTcjz1ln
	bX7lAgUvMkGEv2mKx80B6yP/TqrF9Do33VzA4yxCt9mVunGlb+7C54LxsmyobPIPSLItUwH7bAMP5
	1qtC47yjyn9SCEo/nUB1YkGxYyELIB9eB7tvOE1APf9Y8pTJNj6m+ojhVDLqUtfdBG9Wf592PbqSD
	7BkjwZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wennX-00000000hWw-3w8r;
	Wed, 01 Jul 2026 05:47:47 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wennV-00000000hWU-2M8U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 05:47:46 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-664ce3000e6so194393d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782884864; x=1783489664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2dYl0OUyzZ06MfTi9YwzB+RT+fpto3AMtLt5rd0qn0=;
        b=gYZclWG8hcsJnCm75kmCf6MXc8zMervsGp9aiRNOxjZCcrsIoGA15ccpc46Ojs5eqc
         tj1fN4Pcfy7Pff/snrrcHMb58mLUBtYV9gIK3gku7fpriK0WkvQZRf4XP9jbSZKTvmZh
         OFVcIf28pu4jQ3DqOzeXZskfymQe3AInGnULoHRYVv5Hpkk2sE47hugWSmaExZTsdQRp
         otcM39AH0KEKkh/fVinhSBQ+1fkSDp+0LTQu8RpNkW37jxa3L6GOxM7RZs8UOtE3nkRv
         cXMpBnDOuir/Az5cziVDnG3RGLiErkgj9Seeoy7r2k3/O9oIu9UU14qpt598YpZ3Vt7R
         A+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782884864; x=1783489664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A2dYl0OUyzZ06MfTi9YwzB+RT+fpto3AMtLt5rd0qn0=;
        b=BUgfp1zq/FpDBHadqjcY+/rN2P+L4ORQcMvaYl0Y0BGbklzNEExPi+Z6JZRolC7upO
         TOVuh4rduQfkiH6Aw72Iz7mURIKRaeCcACpZR8lB9tmPOrYc5PBjixVJl1LGiJ/Z9O9N
         s37PU/k/nlZKc1GXPI7H13TUn7E/5lNKptm5uKKSU8CJuftdb07VJaUISvExOmgmhflO
         Xp/hc5/LxlXT7Rj9+Bj6dm17lf4Cd0MyM4uivlIauHcZEjcxbfDsOWVTTm/DeN2ycmJJ
         3TW9/PyJ1CnROFq98yGEE7VH7ftw1S16jZMYdQyufG62EtUIhPRMRSWh7OwRG2hATLK9
         xS9w==
X-Forwarded-Encrypted: i=1; AHgh+RpLGUTv30UgR49eChyqbhvDWY7Uo5AsJbk28hiLGRJfFLcsSKDLa665RVed7kQIwLR4Y+dnp67dbe3TI9dHG/qX@lists.infradead.org
X-Gm-Message-State: AOJu0YwuUBqnJ5A+dHgLbuKgOvhAePz/CTwPralLONBjFMWA0Z6SIEgd
	TgeAuojN1+fWu439HXVeC1nD057NSS45IkLdJAQsR18UIlcmyPJ7xGbY
X-Gm-Gg: AfdE7clvcRO2KqLaM28qGDk2fRJfVPRPxoHuA9/Z43lEa5x6Q2Xo2cdMz5FJyC/YfdZ
	EJSRzOHaLa57P9Uh45woRkc1ACEfDRvGX3o3/vaN2voOol4zqV++I0EphkHUl6bpBfyWokTCTR8
	er0ZlG0BP9OLjsLh7KBP7pOkRtG5ZqjBlkbh56speQP14oJSFY+wzR2mLfjeBk44+XF6Dq83TRm
	a4pfVoX2FUhNX58WL19pKJCBisdGIxfSTYjN7Yy2IrEqxU9RZGKUDzgzafpeO8rff+ssKxcxjBS
	qeczui3+L2pkSyZ2pbmpIivTKpmRJhUT5xqYCxzBVqrPSlOsHYxTX5aEZ+OiAEsKqv85Mt/1q3U
	pPq081y80n2ugYggnioiO4gLk4AdXw9TVC+q5U1NwexaD1n+0/kPizy++ZmF+pdA7QGdEJP0btJ
	fierstQaK8mESu/JMisQi0CC755ZpAdCzrMjBLaI72GZVO5qpjM7wyg8t6RhP5
X-Received: by 2002:a05:690e:bcd:b0:664:d899:e3a9 with SMTP id 956f58d0204a3-665219a787dmr223821d50.20.1782884864130;
        Tue, 30 Jun 2026 22:47:44 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6650163752bsm1836441d50.16.2026.06.30.22.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:47:43 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Yuanshen Cao <alex.caoys@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: conor+dt@kernel.org,
	mripard@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	Frank.Li@kernel.org,
	vkoul@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/5] dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
Date: Wed,  1 Jul 2026 01:47:01 -0400
Message-ID: <20260701054701.3961908-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akQuefaUpt6OPNSo@b82beb281c41>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com> <20260622-sun60i-a733-dma-v3-1-f697ef296cbc@gmail.com> <20260629003505.18f0053d@ryzen.lan> <akQuefaUpt6OPNSo@b82beb281c41>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_224745_651540_7BA70C08 
X-CRM114-Status: GOOD (  11.28  )
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

Hi Yuanshen, Andre,

I applied the v3 series locally on top of dc59e4fea9d8. The
series applied cleanly, the focused DMA binding check passed, and
a focused drivers/dma/sun6i-dma.o build passed. I have not done a
hardware DMA runtime test, so this is only static review plus
build/schema validation.

On the IRQ accessor shape, I think Andre's data-driven direction is
a good fit for the enable/status register differences. The
A733-specific values look like data: enable offset 0x134, status
offset 0x138, stride 0x40. A small helper using cfg offsets/stride
would keep the call sites readable without needing per-compatible
read/write accessors. I would keep dump_com_regs separate unless
there is a clean table-driven way to express the genuinely different
dump layout.

While comparing this with the public Sun60iw2 BSP, I think the same
respin should also fix the interrupt channel decode path that Sashiko
pointed out. The series encodes the interrupt register as:

  irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
  irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;

but the interrupt handler still decodes with:

  pchan = sdev->pchans + j;

For A733, num_channels_per_reg is 1, so j is always 0 and each IRQ
status register would map back to pchans[0]. The public Sun60iw2 BSP
uses the inverse mapping:

  pchan = sdev->pchans + (i * sdev->cfg->channum_per_reg + j);

That matches the encode path and looks like the shape needed here as
well. The register-loop bounds probably want the same treatment:
derive the number of IRQ status registers from the real channel count,
not from an implicitly exact division.

