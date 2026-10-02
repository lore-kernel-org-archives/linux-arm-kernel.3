Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCABCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECA2Ii7AnEG4kznNqv+ar3v6vnQStjMbIFJDndf3wus=; b=TRniWEEH/MdCGf+wmBB0xznQu/
	UhfYPRS3e2/H5zjhtFnZz2aAfkx5MXlE7q+wtdBg/kDt+mOJTtmJvMSmyqHmmJ8YGca4edJIH8kUI
	cf8xEf9WUb/WgEPe+bQAFsCJT0P55yG4GelYPgMIgylVyKG3wId6Hsa93Ycb3PcZgxRuHViD/6Bfp
	dieloT9kGUhx49fWCXTLzrb5wW/T3+7azmeFkkzHFfb6THWsz9myEkkJRbUbi88EAwaPyZ79wIYyi
	26wSeWvxv/94xgvH+QCuM+9pkVznPBy3racxj+zqnGXB7HGcHuZuFvPt2UJiZq4BGEQzOjD/KWxRx
	H8AoYOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCj6f-0000000CPdc-37B5;
	Fri, 02 Oct 2026 19:39:45 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCj6d-0000000CPcc-1Uz2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:39:44 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so758275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790969981; x=1791574781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECA2Ii7AnEG4kznNqv+ar3v6vnQStjMbIFJDndf3wus=;
        b=OKKMxIslnZm2Ckdzc+sqJEwwtX4ipP4mObKosbFly9TfVht4x/gqrMTiazd/q4POv9
         aEw1ARPFv3KbCy5uOL0KlVgLFNuVg5jd15GM+CAt+Zxw4OG8pnav5TOqr5uImyjpDLO5
         z84XoFqXprGNAA4JlmuKppDUZ0Tjq3mh920X5MJDbPXyBnMf9V80ciEHDmJEP8JbMQmZ
         9YnsqCpA4RhT508sbcIwiiyAPS0TBE1W+SzcbQXMXq0Q6z+cKgwSQQt2ZQ4YBFQJsntB
         5hkdiYem3b/l4JLaKproyJ1YXePBfecZIUbmdmUyK41x/83vI3YjgI8jV3jK8nEFBG0J
         fioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790969981; x=1791574781;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECA2Ii7AnEG4kznNqv+ar3v6vnQStjMbIFJDndf3wus=;
        b=eZPyHE0nTJMBAXZtspY25zRmiehESXUkaVm/xsWO4dV90pglnotgceRWlgqD9yemIR
         zpaKM5DAIvEao7UpzgIgvBmicgxmOyp/6dE902gTYxlveEHxmCdWaBQYK5uRm2i9uobi
         F2k2kdUqjLWbYy7XUhLwokNYqdBDjADVfjh3j87wx8tdF9Fgpa+4NdLHaSzpzSibFZYV
         KPPotdgSqjzLKOsDMkAyAVY6QwAre1as0e9mPXRUEWUz4MCH54UjzQEfkTLeqfV23BOe
         MWUMKXjdlHyOnMVVIqRO2TVdlj/w2vOWv3hzWpQu+OlvTem1QJPlmaim3VL6lirDFBST
         Fnzg==
X-Forwarded-Encrypted: i=1; AKwUvBzI08t8B9dxfwHAnmko/MHdrsyTYOuD0qsxyb4g2PPCWVMdI0qhQCkPspRr3YaEybjFxJgB/wQDM2BG108XLLPH@lists.infradead.org
X-Gm-Message-State: AFuF++lU/rCfE5sCcSOlx4uVKjY3tc4Rj9peojHQoACihgoGskA4MqHK
	+K7BnTY5CdIhGiI1BUVq6ekTTym99Z1Oe5WQ3Ra4TFyxFkTvHwwb2pGeRPFDLGJfwWc=
X-Gm-Gg: AYBFou10T1XuhDVfAtPmakLyJjtVTj1JcVuU6I6h/Fu3G6Cc3NYEeiQE4wCYPHo1hW8
	hKGN7ywr16iFLXARBBB5NmILt7+S8ZbBQrfwFdVHpggseXs+BRiatT5cuHRGHFihRtlZ3+ZcfWq
	J240B4Pvk/eRM8xZ6dfGFRq64+fEtVebQttDJbyhGOG9faZC2oSeUUUENanuQp6n6kwyuIQa1ga
	+/ZLZ0OMlZBbuqRlNMZn2AtJI0t8niPF8Rsd8+SEeGNitZ9ro1Nbntn1cnmJT5CKSUwLQHdFZyl
	bOjiEmT3jTZ7xa6R2TuH1TLYDr4QwvcH793Iabu8CbJ8W8aBiCPbINqSNzCww+wWR1WuFp11AC4
	e80QO1gxzWPknatgfCVmHSGxz8MuSX6gcb6PxoXUwJU0Zog3lVRqoTLxs5xKwBEHKQs16Lq2aJ6
	SA5acYk+JXGM+2TTvIa3oDSvsTe8sOKuv73cyeeN95CIFd5iPYs7WYVGq+kuOc+SOUx4ru9eFtY
	QiXPdSV3GSDaoJA37U=
X-Received: by 2002:a05:600c:354a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a027447475mr68982555e9.0.1790969981261;
        Fri, 02 Oct 2026 12:39:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm104389955e9.4.2026.10.02.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:39:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Igor Velkov <iav@iav.lv>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
References: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
Subject: Re: [PATCH v2 0/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: fix
 the SPI NOR
Message-Id: <179096998039.3351815.5090635259555854831.b4-ty@b4>
Date: Fri, 02 Oct 2026 21:39:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_123943_419185_23286767 
X-CRM114-Status: GOOD (  14.59  )
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

Hi,

On Fri, 02 Oct 2026 21:36:45 +0300, Igor Velkov wrote:
> Two fixes for the SPI NOR flash on ODROID-HC4. Patch 1 lets the flash
> probe after a boot from SD that bypasses the SPI flash. Patch 2 lowers
> the clock to 40 MHz, where reads stop returning corrupted data.
> 
> U-Boot takes this device tree from dts/upstream and gets the fixes with
> the next sync.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI NOR HOLD# and WP# pins
      https://git.kernel.org/amlogic/c/0b825126590879812321cdab53786fcd906f7761
[2/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz
      https://git.kernel.org/amlogic/c/b44e2be772f866985cafdf90355285069ea68495

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


