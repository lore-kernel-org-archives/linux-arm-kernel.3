Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4569CD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/zzCLz7EhPTekTyUs9lCQwryZmkiSO5kNovzXM9TrY=; b=IqYC2CWNcMliXAnq+By2GFCEFA
	xsASvq55npxICa0EVTO0rbmdCM26I1DFc+17/Ns/oLTjb/iyP6Jgyfm06cGWZTTakyFYxfLqyOOr6
	NxngDuIP9K609NsO1JVJWcOR57PLlt8zNOy7Awr5nS0jSOCYvReXARDDHaMJrbxWcUvBAwyaJIWYT
	tV+1bZsd92kLtLX7040yauvPlB+mLTekgXTP+AbAFf8CW1Yjllv8w9Y5Pkdp0pVt7Gb0W3titsP+O
	lrATvMW74EHR9QOVkYiysEpdkSrFi3CEEqvJtQYi5idDxlpW9TgPKxr4uKpPgZpc3sXWY192vvzsg
	9Bc5FODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7U3-00000003UKc-04Zx;
	Tue, 20 Jan 2026 08:53:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7U0-00000003UJE-1HOF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 08:53:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so45534675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 00:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768899182; x=1769503982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/zzCLz7EhPTekTyUs9lCQwryZmkiSO5kNovzXM9TrY=;
        b=wSxD2f/JseN+yXgen6lv0PWyoRD05+eC00me69/Np3tJgsRbMFIxr6U9nnjSDmcQXb
         XnLLjFBe2jwC9VHb8A04DfcSZfi3nKhKUq4eQB0zwfsVuck1NFF5cIdnhxHmR+VKlOo5
         ttM0bLME1JVdUetuyupin/fgJsalXpJz5BJwONRKX/yb0AwI93HoVM4ACPKN3Da+f3AR
         WvI5iGsYZJ5xiY0YTkJVP6/u/bjcvp70U0VSNlPxI3uTG1QbvipUo/PTSOSQleALmG6W
         ESj95ZL9MiJsWdhyx29qACiAP8WG/VkF2Mz+wd+haIsquzpzfv/rPf2RunXaO8b/ln2U
         O1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768899182; x=1769503982;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C/zzCLz7EhPTekTyUs9lCQwryZmkiSO5kNovzXM9TrY=;
        b=FHBN2uf0wWprInnAJ2g8xqfDv1cNerwUHCwIczFIVw5aN4EB8K3TBAok/uOgPIy+Lg
         0aCGK1sVrGs5UiRFLaABw/NQOBa8jfYgELThgNdRl5JWyRQq514CwDK4d1G6XMRM6Kh9
         vJbVefsUfRfsbN6fDBpRT51xhwnKVEhoa/hU7w8DO/PwoVlcWktf9XwtiS3MxupaTREa
         bTlgXoKPAVe5EK2gyHPY5d+gQN3CiIaIFVQTTy+S/falC1EgOM8bdLXLLA92klGzWbcA
         B/sy4DlRWvLrrACPZXAjQi6z9AZnoc9g41grU8KUNjk6mQMhxb4leZUVe5u5R2K8YSEf
         wMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXdsFtdIB08m35ZISuIRf2xkE87MUIGY39RkRJFfaRNFRPeTwfEY8+mJ1JJNbxxvWrsMyy9pWxjbPTxByqSDL4@lists.infradead.org
X-Gm-Message-State: AOJu0YzNxn/g+RZQghS1sF9owepGopqYEp2RJwG+Ip8mTX3HuXcrikqo
	KOYmLYSR+bG88PyDkFxuM4v0UQoiGP8VUxNQCwFoey6NC7+VZnKdyp3HS3LEbPGzec8=
X-Gm-Gg: AY/fxX5AASIZcc6IHkJxtWCJ7U1C/tptZiYLxlEewHGv0jXes7Me23joW8XKO3sz516
	E5hF7BRa8EgBrNnZC+aaeYpmljW/AAebE8NYA6v+MVv0ZOPGV4B3Oilj8CR3Y2/F1UAWQpjJIME
	ZFiUbeQeFIay7hitnj2zs77rbywrmw496v1i+l8SmYerokI2UEtPf2uNfngArKDnNu1yUQaur56
	O0ySmXCLMMpXkIvXQnx2KHQ2fAtg5L7sh/L1l4XOPcT0gMSwZvgA46wukdgkg8+wm/UsTC+5VVr
	gKv/8uNmnA9hdethbT8R2/rWScOnKF26BVEVClzjvsdt1pg6nNbFD0RU6VfbOI7Mz0bbE4m3Vzj
	NM+fztQyf+lNRmFdixOttjApVvadb/LDdZij1r1JlU6y6L0S4Mjcq44FGi7T/tWsGZynwb+w/DO
	Gd7TSlUb08v0laVttedLX97KVH4tkn7vQ=
X-Received: by 2002:a05:600d:644f:10b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-4801e2fef40mr153071285e9.16.1768899182300;
        Tue, 20 Jan 2026 00:53:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm27597335f8f.18.2026.01.20.00.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:53:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 xieqinick@gmail.com
In-Reply-To: <20260116023611.2033078-1-nick@khadas.com>
References: <20260116023611.2033078-1-nick@khadas.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable eMMC storage
Message-Id: <176889918151.1477585.16889853639398545363.b4-ty@linaro.org>
Date: Tue, 20 Jan 2026 09:53:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_005304_349729_1DF6483D 
X-CRM114-Status: GOOD (  12.31  )
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

On Fri, 16 Jan 2026 10:36:11 +0800, Nick Xie wrote:
> Enable the on-board eMMC storage for Khadas VIM1S.
> 
> The VIM1S features a 16GB eMMC 5.1 module. This patch adds the
> necessary regulators and the eMMC controller node.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable eMMC storage
      https://git.kernel.org/amlogic/c/1099b3b6ab01e481c5aaf6c74e9c8892c9636fe6

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


