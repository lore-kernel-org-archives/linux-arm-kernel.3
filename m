Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD42DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoEspbh1eRKE7g7m7KXe/ScKkbCYU5aYNDNwW3OSB14=; b=1RtL6p3eurhsrvOYfJIIXPeRX5
	pQurpDWcy9RVoOWNEXm9+KFqlpLXmGABAqZmOqbA1MpzkFQ2kimwbcUh3F0XaGShVw89HP0mVHwt4
	hqcT1qPf6XikXF2KaBcqBTasoqw6qxWf/smCFWdK2aL2tE8Z3mHrNWJlouQaft8O2mvvUMI050jKn
	U2229Gy+cGHI6pGTkP6u0PeBkUzeHUvqJEjd9C2SDixk9H4YoW/tgmwfqXcw9j1iRicpG4oOnEW6U
	x8FurHNT4cQRCcrRpS99HuEgbPxhsNtNPe966BGYP65/Je1rkhyuRt7f2C8JdPaAzHqgqSTgDp54j
	TsPinqqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiEk-0000000Eo50-1IUj;
	Fri, 04 Jul 2025 15:22:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi4P-0000000EmPN-2EOf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:11:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso961548f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641880; x=1752246680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoEspbh1eRKE7g7m7KXe/ScKkbCYU5aYNDNwW3OSB14=;
        b=OpJfCaBK7EljszedIji8IvghvfSjej9e/idr+iDsaM4PxMSPOFjm+sQKiXaXXYfSIO
         TdxlJq6XN7lQYZbbAk4CWyfEGghQwmpeQzGYdgdRf4DSlL71uktrFBXAY5VFz29TU1HU
         7dcITdJguH+uFVYBlRf5Vn1v7arANImrprVGrXVp2dlKUpJ73kknCs8cQDrp0YHRK8nj
         cI2iWg8llqxmnewDN8q3CBIQL0Z8pXYet2uFXCPb+f40yNmzMB2/fRRX6II0lHs9owOo
         b0UegJ3O4UEnkJ4uA4V/Wer3MR3Gf5YY1r8ujlzzb40n4lSiknKHNk6PohMddbGVf+k4
         AAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641880; x=1752246680;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoEspbh1eRKE7g7m7KXe/ScKkbCYU5aYNDNwW3OSB14=;
        b=rV4VDCtR7HRcKLoKhz22H0dCZdbMkRiUR5O0040J4OJO6HF92MUWlJAk+2ZcYzt34H
         j7wKnTc8dFs3NQOKYI5O7ZTqgcys/dYlDIu0iCP5VSyHHU3CyT07Rd9+/dMgRaDZkiCj
         pYQCAnDpoaepIrOyS5Tko+AWrGnLRtJmw+cliV6dBnpVUydYUKljZSw/63q+3GicLYh2
         Sc33ET39QER4HtZTf3V216e4DWKu5uNCZTtityI+inoUsf3LPUH21IboMLrcNCoyuFuc
         xLEcuFzRhs45IabJcx+O1Pu3TqyVu/XzxAZojo5uTtFQRR72qlwhR4YrViUF3EqeQJb1
         Ihng==
X-Forwarded-Encrypted: i=1; AJvYcCVBPqNvocM2kQt5PH2ECndYNCl4oY8mhjdVS8BZIFf77P87ouZ8ery4X6NOufhezVIYIJKEAQXQf6Jb0HLJerO0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9LK2ybiSi1AIw157q5awMqbdVD9dW+VQH8oz6YnVfD+PnPgFk
	hweaJpnRnGxGEnXLfg9KPNiqSYhTo8oxJa+C78FkVRnupZz2PlxvD5Y9C+wo6K4Kxfc=
X-Gm-Gg: ASbGncsddLMfbHlHIJVCdgb8ww2T4dnMNapM6BDgCPDDCC08fFFzOOGYdUSIfld48ca
	REa3my5LzPDy9SaSbRpLMFNtP75yw7R2ln1IAUVhLOzoGJKNWmLJ8ZUWTPe6oK4VxRnedRy43Ue
	dWMybqIWxWJCQmu18OHHCnmv92SrfZ/2+TbM3xcU0Md8HcuiOPWw6oRZcGmo3Xi2RRZSxcpYmXI
	3jf8w/o6XpVzCfUVRjGR//yDpp/SP9Pp0rEmTWHJmaAJxhmEnuK2yySRpKA1ySYnWhvgy+cr1yC
	KR6sT/6ye+Dww6K5bhi2jOslfLTDHj9U+we7N51b1v6dAidTbQKXI5YGb2fSm6ulUZc2jBu8eQl
	j5od/luPm0PeI9viI8Q==
X-Google-Smtp-Source: AGHT+IGJq4QH4n1fa8cinoR1z+3JkFuWIr6OSpZpSR6Ueat01j+mEIj1olmOHplIEibyLWK0AicYSg==
X-Received: by 2002:a05:6000:250f:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3b4964f8b3cmr2987717f8f.14.1751641880123;
        Fri, 04 Jul 2025 08:11:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470e928aesm2675416f8f.44.2025.07.04.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:11:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20250522092940.3293889-1-tomeu@tomeuvizoso.net>
References: <20250522092940.3293889-1-tomeu@tomeuvizoso.net>
Subject: Re: [PATCH] arm64: dts: amlogic: Enable the npu node for Alta and
 VIM3
Message-Id: <175164187949.2868628.8689971906930320435.b4-ty@linaro.org>
Date: Fri, 04 Jul 2025 17:11:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_081121_574154_8C7581E8 
X-CRM114-Status: GOOD (  12.09  )
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

On Thu, 22 May 2025 11:29:40 +0200, Tomeu Vizoso wrote:
> We now have support in Mesa and everything is ready in distros such as
> Debian.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.17/arm64-dt)

[1/1] arm64: dts: amlogic: Enable the npu node for Alta and VIM3
      https://git.kernel.org/amlogic/c/587c1c00f75565567d1f26a333a3392f7a21c28c

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


