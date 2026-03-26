Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F0A106F30C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cSFou4RAM9jBcIrdaxJY8v5ZGpuFyXZx62301CfC+w=; b=iSvH+ple+xY+LQqnKwNZm2jrpI
	3uH1lfunkNS/VlnVtqpYELwN0ZEeLJXXdJvviHgR54HVj1BM6sa5avfViYCAhT2CppN+bGFGEnNOc
	EQ7V8D68sqfNZjOcNRaMfSROjWeWvj170RPAg4GXg8uyqOq10vF0qAVSUAK9+wTeXoJy5g2Q0bk4A
	BlsTGcJT8p+dKZ8vVCSEtZZ7/WORIOdbWOzH4qtqus3StAUDG0HqbY7zc0eR0zx4v/X3Pe78uW7sG
	GmTKlE5rdOR8FNSYeYdMthgc7mPW5qLYvWrYi2DcwEWJbOsALFxIq5xLRmI1/Y07otEMz1qSb3a1E
	QX0i53aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ggP-000000056UY-1j47;
	Thu, 26 Mar 2026 09:07:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfq-000000056G4-3q1B
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 09:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=2cSFou4RAM9jBcIrdaxJY8v5ZGpuFyXZx62301CfC+w=; b=NGLdSxXo7ohMBYtX35Dwb02kjH
	w8YchQenTA6zRJJBaeNh36xhR5qFcNhQhiu2hOUKtcRM5TLEKxczBaL+E7tbS5hVaTvW3ZBFRzNEe
	0eUdPBax3D+fvff3ofgHk8lU9FGvPhOJZ+eHjckpHN30t0XgDehp8IwWIW0sn/oBI8A31MesAmwBI
	ybGd5N6ZQ84D4JEXWzxYPbc8JLcpxslxHiShR+wr9nn9pRT+SJCpKce8LCcdaGIPlH9CMdEQsPtts
	f2pgAOiGncfvBHelSjYaHu+tYjF50qRrGQ1oOKeOFSVMyjJ9StI1LEHkFM/m14B0IxWq+/VQct/9P
	agRTgk8g==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfn-00000007pwc-1uvP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:06:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so6984945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515998; x=1775120798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cSFou4RAM9jBcIrdaxJY8v5ZGpuFyXZx62301CfC+w=;
        b=CnIgaWE+J7fNGrlsv+V8jheWGrUZ5ekhNviPRLUEjfEUyCTOXbOaQlAiR1pP0HLWbP
         AAQVOrvMi/5C87z1FdISKlquG8e+LDrWspihtArSvd/JLVXbxMF7P7dsdDvrRt409lq6
         suyADLNLFRPUZkaYTSbMkdoBLgZgtP6rgrGAHH/mDNkGR6eiye9D9LY7Kgx1RnsvIT+3
         gLkwE15bOoLUJ0p/H/UzQNI8KhfJnp7wjcd4L7JE5OW4IDN0LHnxZQiZbM06/xT9w5Nj
         k4Ph6sLaxD+hJCm9Of1L+OnbMyfCuJsbsY7wW+uVGcb6Z4YUCZAsh25rFoz/3lt0p8gm
         Cu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515998; x=1775120798;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2cSFou4RAM9jBcIrdaxJY8v5ZGpuFyXZx62301CfC+w=;
        b=E3krw//MmuAmF1OVeqHpnNSc6MduIpgMLihxwKiN0FSWjy/idZJpqa+6L8YU/Ex29s
         hvhqsvNMDmgolA5+aj4Xzeyhd18G8Ght1J8mwvo1N74nB1lE/J3EsgGUyvHPgtb1TCKF
         2WtnUnUedpwiwtdErLgMr9FysTrYzXc/7QhQJGLgEI5IhVM5HN1LiP80OdUmrtH8MK2B
         OdUMj6os2vy+2QUSjg9tc9std8BRc1/3DIJQzdPsbD7c6PVYa6+eqYxTAr6EPnF84b5V
         d9WIupxeU51O2osNen4O1LaNgUBvLDV5WPUug8jQqnrYdVnU7RAscKK99+Hj8THaYbFT
         JDQg==
X-Forwarded-Encrypted: i=1; AJvYcCXQSF+8+0LGYb2iiZNotQgDOClc1dNL+AiKfxUm+fD+Vu4bMcDtif/BaS+4xgTVSUZWK5XYWblggrw20ZeZiWka@lists.infradead.org
X-Gm-Message-State: AOJu0YyVe8q4x2LE2XkrKLTf2elwvH/crrJJdkl9QupqrryqXD5o57yR
	ET0a0NpC270jYn4mt765eCbIfVsOhIp2jPKtIwxzwNhry5tRKIjbOKTA+HpbKCVBEfU=
X-Gm-Gg: ATEYQzwFLEXVPKwojjwPveuab7ExExPROWNHDkCEloNDZ3XQ2oep8OAA1F9hsSAQKFa
	LyOIS7Z5t9oyWLprYu+fUwejc8aPQFyo191KBVfBIx+yVvS+xSbrmknnSXic1W/paejMkVnx5QZ
	W3s/MuzIrzwCL/QiWrP8nJFMKH9U+/HeR7KE2Wqx6Rx0JLCJYlVuWo5Fs0hK8s7STwWe2+xxrlv
	7glkAjLjRhw3rTOetPkDd1MCW4dlZqNPB+A5OYd/xtgpLATbBF3WfnSVUOOeajSquYiPMGRo8f7
	juXiByl7j/Jkbglge3M2wVpp3Y6PWGY2q2RwW+1e281gWTxnl6fm60lRU5aZxEbal2d8IfUJOwk
	zQBmQSERZG7fVeLnrkhvXoZSns/05dG3TMGlyckLmdEVK4dLanxBIi97ffWt2P2IF+PFd+oSy0a
	FvGywu1/11MysQbD911hN6/7VH3sasu3ufeUPX70sPynn9
X-Received: by 2002:a05:600c:154b:b0:487:243f:dc3e with SMTP id 5b1f17b1804b1-487243fdc55mr572145e9.6.1774515997897;
        Thu, 26 Mar 2026 02:06:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anand Moon <linux.amoon@gmail.com>
In-Reply-To: <20260219103548.18392-1-linux.amoon@gmail.com>
References: <20260219103548.18392-1-linux.amoon@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-axg: Add missing cache
 information to cpu0
Message-Id: <177451599694.122020.11374125029762505205.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_090639_628914_0CAE3DAA 
X-CRM114-Status: GOOD (  11.76  )
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

On Thu, 19 Feb 2026 16:05:46 +0530, Anand Moon wrote:
> Add missing L1 data and instruction cache parameters to the CPU node 0
> for the Cortex-A53 caches on the Meson AXG SoC.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0
      https://git.kernel.org/amlogic/c/e28f4b18c134f944b0ae93ebf1bacc8e517fdcf5

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


