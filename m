Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A79AC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GclhZB+I+gWjc1PWB+Tmja4z4M9XT8ugZhSsO+bEP7o=; b=pYs1Q3DOiHMjJDHTe4MGqxPCvq
	zglaHjoVxZ8EiezVT51wkOfPoLloW3u2mF/O+xVCFbT8fv3zakkEX2XE2l0vOnzk7WzypPMX/lQk1
	2m2I7wahUSObNWpTkjzSXvddMvYyNdmlBrzwtKOE8kCHubiObf6g/6Gf3lMZIed4YyM0naRDSc2we
	5N9BC4t7BsjRTQvBEUSRybJKX7/yBX/YjCfbWKOZJXgdnxHGm8iO1GCA7dTTLT3bK97iWH+iz/eBv
	zfJEmuY1qN+NsfsTPiRaCAm57TFdEfUlJbiB5T8uNLb9m8Y0s0syDUWo+rBL65n85Ug4hCq0F+Qsr
	ir8Qdyhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiA6-0000000Enab-2l8K;
	Fri, 04 Jul 2025 15:17:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi1x-0000000ElqO-14Rk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:08:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a53359dea5so503207f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 08:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641727; x=1752246527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GclhZB+I+gWjc1PWB+Tmja4z4M9XT8ugZhSsO+bEP7o=;
        b=cF58w540SFdg3SCF+3x672ttOEp+H5O7/t/b/4oYwJElkuKJLwUykKq8P2kslfUFXC
         cRTnkJj5sICbP9qYLhbwtQChXyi/D0I6u0qiCZm7kexmf/XLhW0rkG62zDwPIf2y3Oq0
         cihYO0cMgwlwPzk/hmJyGjANjhXiTTDzI2GBhqCRENFKgfKdRh9v5Xis15XoqIXnYpM4
         TDkuqCBbZUZyCotzchr9vky/oKO4NB7unBSYDxpi4FD0P54JTayYTyEP2tzPofos0D+3
         avpAF6zuPHKmLzmUrMhEgjsA0xbWxI7BGBPqqw6OGp2qZ4SiJ9Zw/joo6zfAiUyohLUe
         pj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641727; x=1752246527;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GclhZB+I+gWjc1PWB+Tmja4z4M9XT8ugZhSsO+bEP7o=;
        b=SkSUzFMiLvmDMkwPnJMeupCWNUExZojwyEmda1IGinU5r5KtO85CDCcBTtMXKiRA+M
         V2Co3x6mHnAYG3k70Q2X7rXrhscK+Hdk2NVxGfNMtelJfYldhKMIP6o//LomRzRFWQFH
         kwAqTevHu6JuGL2gug8C8+iMmQ3gN5z6qL5Yn730R1iU1BXnkMhLqykMRmSMcx+vatQv
         44t4tlpXvuxpuCAMhRbqnhqrgKgSuZEEIr/W+uL+z8MacZ8yBt5wb3y8C97dc7L26TVy
         g5r0pCuh5nf/5WEJfGUpFx9bozmn72kINBwO4LeZwMCgW4uf6XBcNGDH/B5z8oesAGll
         rYKA==
X-Forwarded-Encrypted: i=1; AJvYcCVMArjbRRpsor5WKLs7iT4+5qrihwnjgLuj85tR3qngNHcZTOfo/sMfscN+CzYJlFd2E+GU+mqFMtLP/hWjUnjp@lists.infradead.org
X-Gm-Message-State: AOJu0YwFxmTsW/qw0P3Cx3C7qeG3uwZm+oNOdi4uqDthmtCodcpVj0nK
	3wU/AZxlnw0flqTU2lUyk+T8UbvP5My5VVPDTF/jSD2fTIIQCYCe5wEeYhUiTyz4ckM=
X-Gm-Gg: ASbGnctEZOYD4butLM6kgtW3N5B4+pR4LyKDADc3Dn9Wp4uKHiBxdXQND/7P4ubzYba
	vtjLljzJ4b1ikBrfIpaU8/cs2oWoDPw569lChlb8jk03rMfUkEjE3X2ZK+br5NVUjb3yUA8WfwK
	UWlJt+wADxAhyptw+kiacttfMDvSH5U/wuzPz0z/zstxQ45dSBh1PuyIJVmMgOtQxsdGsFR7GIM
	PR810FNohH9fKiS3cWjUi34SeQoG0rEfnETqUCIqgtRGGcLxJlzAmf7ZKouLWTddUxNkPeO1abs
	lv5OeHZGhmOqcXFKk9exBf4LoUp5WIBQWqERBqvX/QBN1H8ujBVqfq5ckLWTilQ0oWCrlO/Y3dv
	u1X5GXLQ=
X-Google-Smtp-Source: AGHT+IE7H9vRYfC7d4kJ+PSNtqfq+5KdOErVu7jZId1urOwLE5iqgduTgGoQI9kj0MA3An7JAcpEWQ==
X-Received: by 2002:a05:6000:2910:b0:3a4:ec23:dba7 with SMTP id ffacd0b85a97d-3b497038e99mr2076301f8f.31.1751641727135;
        Fri, 04 Jul 2025 08:08:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bead7csm57231595e9.39.2025.07.04.08.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:08:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
References: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
Subject: Re: [PATCH v3 0/2] arm64: Device Tree for Ugoos AM3 board
Message-Id: <175164172639.2841706.12481135333211530140.b4-ty@linaro.org>
Date: Fri, 04 Jul 2025 17:08:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_080849_285790_DC101FF4 
X-CRM114-Status: GOOD (  12.28  )
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

On Fri, 13 Jun 2025 15:39:12 +0200, J. Neuschäfer wrote:
> This patchset adds a device tree for Ugoos AM3, an Android TV box from
> 2018. Most hardware functionality has been tested, as noted in patch 2/2.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.17/arm64-dt)

[1/2] dt-bindings: arm: amlogic: Add Ugoos AM3
      https://git.kernel.org/amlogic/c/ef491ab7cbf6a460476a41d8b5dbd8a4394282ba
[2/2] arm64: dts: amlogic: Add Ugoos AM3
      https://git.kernel.org/amlogic/c/b33f8cfb2b4d91c4bb7c16b354138cc205befed2

These changes has been applied on the intermediate git tree [1].

The v6.17/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


