Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9312ACF34C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAvWWiQSPgIYwk1AWP8/6DiVxFM2G8tlxz+0kwoYwpY=; b=rXU3mXOlKZ7fNcnHP/c8jQ29IS
	aBUmD3U7LLSXae2yZtdoP+OPk/kEcand8YdcQOgWKvUZQeAoLXiSZc1L728IsriRhln7yXPIfgZuF
	w0towpUlSutyWZhp/rI3ssy9TBP9hxQZqdxSE2Ho4dqKShiT1roxxtij7TMXPDIJCqBtZJ5NWbAfD
	PhUguaWneLeHGW7137FKKiy05k3fCyoRxZu85O6fPiRG53wFkh1KDnUzMJgzDV14kdbzXXkpZ/8sy
	ExLVY6lkkgGRC2x86+1365GpRzBgpY/WaKe3ojbRPsy2zGangobkAEqVmVrrT42TTrc2xyNFJKIPo
	Tg+gCK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjU1-00000003PY8-0EF7;
	Wed, 19 Nov 2025 14:48:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjTy-00000003PWe-1iEM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:48:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4775895d69cso35864645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 06:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763563708; x=1764168508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAvWWiQSPgIYwk1AWP8/6DiVxFM2G8tlxz+0kwoYwpY=;
        b=SOmJ28Wh7fLdKfpA6SLOs+5RMEFFHGn5+x7l65wsawMXzDWUdUtKfAfUh00hCgQ4xn
         n/FUdSCJLUO8cVyc/zKmf21XSotJP0He3VwO7MM4RFNMGAbFb5xkpqX0cPF8Q+a43wy2
         3C9UjsZbCRdww0QXs/eoxZCYjlBrXkl2kOhVEye9EFNiliDvx7EGAmKYg88LA+7PKwrV
         g8QFxMxRlu1wsOhw7sRMtpSkAZ8kQTYep5Fg4j4P9KCPLgx74xe+eF0O6QJx2aCD3CcE
         UeOT/goPR6iAUaDJpbUR/J6P/y3uEVcplyH7osSSbgV5TE69z+P/zBt6P8Xp2ojEg/Cm
         aa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563708; x=1764168508;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AAvWWiQSPgIYwk1AWP8/6DiVxFM2G8tlxz+0kwoYwpY=;
        b=NjrDvl89rhdGQm16cD3ptllm+awPQaER0s1KrI+qiiw6JBjTghpTrxOIrpdUh8bf7F
         z46D//M3ZYiUPWNze07my4uAWMXN7dvfzVHYUbnl43YR62NSRsCvw3LcsDPy4liYRlUG
         /BS2XY2OB1ss1ESYxk2tH3b3vnbmNhIpKcEKXvTJWUwnm5+GSEjQy0kMZ8jXI6TvjFud
         oZQq7aYKfVQZgdV2uYFETIqAgivvoxzhBk0Qqy/8wnqWn+t1F+6/TaCG4FJN+CknLnhX
         onzuhHaMuJ+9d7eJnvUdOs7QHEBN4qDe09G8e8ixVv7zmeO4Zi3p7ioJwl+mlpSRNMfv
         6QQw==
X-Forwarded-Encrypted: i=1; AJvYcCWo8ZNAvbCR5ehlzMyej7rbsKVk4mRcHBymphmBhV917PRTWD8P6H6WQYKgNMoKTJMiVN6ix2vr13hNjQjSGEwt@lists.infradead.org
X-Gm-Message-State: AOJu0YxC26I5yLCDcCkgqWCRNvMnG9e/r7iqAPXtnbNxjWZ/P4wz3f/c
	ez+gUtXGWme6yxpQ46YBXvdlsrx7ziDE9C3hZa6lxb+NYbIP6uE6L7DWzbWYtOuGqzo=
X-Gm-Gg: ASbGncuyd/l0bbUhjrR9AMGYRugV7+6I6Ya/bhSYXwf+z1O2Npfx8M2G1+iZFFmcv27
	rimjzED1Wk7tYnCJc+NY69pDqQCXm51g90F5KCAqJrqE21Tar0yWVB+VeasAcn74KksZ7MpOw/+
	z1aw3KL2IrUxzy/iQPn5Y1UsBZJ+GgaY0VszXFboQhbupvOBMIvyn6pecSx74LgMKWdCEmx0slL
	4AhKAL/9ocO7ovMi++qZKq0dHRbe0Yw8CCqAkhvc5ndW+NuZM1oP6uV0VsIdbI+HQhZEfd9XIre
	v3/qRgqxucFifY4/Jr+pC5zSqQ/cBtmuphODs0GtCxiJs7sFxX8yV2DEtKNyf28rEnljrm2AJo/
	pmqj4iyGrqPgkTIlKU23QGiFmSC9vj1BK2sd4atA2MpD6z0V8NtGt+yZb2dXn1IxCMc8/GbuvUj
	MdUylbaGa2/ZpGeHAoSeblbexlcQIKnVg=
X-Google-Smtp-Source: AGHT+IEwXhf12WmwbkhOzW6haSCLFbfitinhCu11eBWyJ+4WomkGncN25OlqCSrNETzoBABx8qeaPA==
X-Received: by 2002:a05:600c:a49:b0:477:73cc:82c2 with SMTP id 5b1f17b1804b1-4778fe6822fmr186919395e9.9.1763563708133;
        Wed, 19 Nov 2025 06:48:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm39187174f8f.41.2025.11.19.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:48:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
References: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/5] soc: amlogic: Add new Amlogic SoCs
 info defines
Message-Id: <176356370742.79050.14585932686305193943.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 15:48:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_064830_461980_2A98F5E8 
X-CRM114-Status: GOOD (  10.89  )
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

On Wed, 19 Nov 2025 10:52:21 +0800, Xianwei Zhao wrote:
> Add more Amlogic SoCs info defines, include S6, S7, S7D.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[3/5] arm64: dts: amlogic: s6: add ao secure node
      https://git.kernel.org/amlogic/c/fe85b8876768496196108a4c5199d084a6dc0036
[4/5] arm64: dts: amlogic: s7: add ao secure node
      https://git.kernel.org/amlogic/c/070fcd4448a1d49ddbebfb63c681766f75cd90ed
[5/5] arm64: dts: amlogic: s7d: add ao secure node
      https://git.kernel.org/amlogic/c/e490b52477b85ffc5bc8ae7124415345fb6a3f4e

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


