Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D995DFF4956
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uh6jX3rHtT5u2c4N5fbPSMcMHgGUvuAHAXYaitg0z7k=; b=z5IzInCt58znePH3HvNu/zA9A2
	0Uu9m1O3maWWgtKxKNIgKgKD/OoASyq/ThznRohooocTmVHvFj6QV/A5ARZls8hQ7EsP3kNxezfm3
	OHloc8Eu48n3ASziEc27F5O+NvWI4NHShwPpXR0o5C7veXZM4rSPASljyRKMHmcxUndUK9nnLRH1F
	bnTnuUr3XZ6Hg0d/x8eyTd4XAV4AT9avU9KIRFwxepiDFRpVpbIQ+g5jkr1AsO05mJKRrhvtrljdN
	yA+WH+MY/JTLgZpqQvSBsIn9DplwDayEWxpKTt3u2G0z/AyGmgMXWlmC5RE2lt4BZkEHstdK988Nx
	2/2+LPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Qd-0000000AnEk-1HAu;
	Mon, 30 Mar 2026 07:52:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Qa-0000000AnDq-2E9S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:52:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so51587875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 00:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774857171; x=1775461971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh6jX3rHtT5u2c4N5fbPSMcMHgGUvuAHAXYaitg0z7k=;
        b=XCd6AiYUEaupwsHh9IlPMpQpGSQYWavJ69gadbRhFWIY7/vb0MPBif65aFMCnMVV7N
         eshvvWZMVD9OlkhU7bb5X6eyxtVK2kPfXBm5nTz0WMd0xK+MvvLpTjs//fFUGZdxkzsg
         VhzYHy8kTxYianNs6W8vVz5X6zXF/qzoJe1ZyA0l9rMxf0coX4e41+AAMBLOOYzSWcax
         bLGhSYktK6L2StglFUC+Ab9zBpeCB5htjZoDoDm/8FW1D124pFX8nlzwrynfZt/p0MfR
         ZPpleIKRj1BdT3BKkfkTg00j5nINEKH5WGcwcQf19DWU0t2OwzfXt4BrO7fjrl1cYkpE
         rZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857171; x=1775461971;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uh6jX3rHtT5u2c4N5fbPSMcMHgGUvuAHAXYaitg0z7k=;
        b=Lj8rw/fU74eFBFHQS1hiUoROxuKnmqXypFzmNvrrMtI7BYkj5+loUlntSLY985ZU5t
         6/PA/0+XHvKf1sz7V02gpKbfBHFi/MoglWXI/IZzFDGuxXdg3YLeyDiik4kCxnHMEgSx
         nIYcSsJe1XDqn0vH1QtX+eqIg7kOD+VsKwwdD7Tk4uN+eSyia5T0uohQnabEFpxLw/YR
         90PIKpHufl8oMtRXgjF/mfEAP1oYW2HlaSjJSXwzpsuSAFPhf04DL5KTfYdipSd2TKgt
         l/81O+efvb1KbYXOcT+50wAgZYJoeSXO+p6GNHaLwl+SkATzzj7StYDIkaoY08hAYT3u
         HFsg==
X-Forwarded-Encrypted: i=1; AJvYcCVMkNPxeiHNBK9rasb1+OJQnNQpAcra+2sUUc6YrGWLmWgVwKpFhXcWvRrPoHPBnAUzdScHtfs377FM0+jqYGkk@lists.infradead.org
X-Gm-Message-State: AOJu0YzLVu+n54agPdMPSyQCIzvMcE4ioSVhkknw6sndiUYnKDSVG9OO
	c2zus5rza90HxxaprCJIOMuSInn6VCSBRqtqVi0ROUQJWDg8qjCnnJoYpS0SCoKtE1w=
X-Gm-Gg: ATEYQzwK05vNRJ90WnmoAi44uiDSX2rL8+mqgJ35j9nnf55qDvTMSeGG2DE/A1YS3JO
	+E8haOgXGh2t8BMI+HTWb0L/45LahyeGIgXL9dy9g1Ou006+15w+bX/v3BLDot6vn72I/X5DmhI
	cgttGCWEutabAZ3fJtX/kvO9ijxPApO0Eftc6jxPIJVyEaG5K7Tu/EUXTWXbZ8hn7bUw0yZn6zu
	w8GJ1OmJEGluz8wuk1Z3qotGezw9G5rn/PoN64uuRvAgpy6JgUokK958nQ6I1HEBtGYkQDiFGZ9
	lydpM6I78Z8afnzUwNaerlCnD/6acDRn6kys9ZOFGlcLtDSYHbGd8uOMvb5x31TtijOf+0PErO6
	QN/oCexhPCUjGiFpZ5z39Mz9nyrp4rALgmAWYyIvmUIW9B5KBcFmhVglyxybk5Sxg25MZuTUNSs
	UQ1oHo0zmxOZmSF4fUw2t9rNx7mhS+iDk1AKGuw3TZgVWS
X-Received: by 2002:a05:600c:6487:b0:485:3d00:efd with SMTP id 5b1f17b1804b1-48727d679e5mr181633115e9.7.1774857170616;
        Mon, 30 Mar 2026 00:52:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725ec20edsm74580455e9.9.2026.03.30.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:52:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260327093016.722095-1-nick@khadas.com>
References: <20260327093016.722095-1-nick@khadas.com>
Subject: Re: [PATCH v1 0/3] arm64: dts: amlogic: meson-s4: enable RTC and
 IR for Khadas VIM1S
Message-Id: <177485716915.875961.15585645607067956492.b4-ty@linaro.org>
Date: Mon, 30 Mar 2026 09:52:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_005252_595648_05E7688D 
X-CRM114-Status: GOOD (  14.78  )
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

On Fri, 27 Mar 2026 17:30:13 +0800, Nick Xie wrote:
> This series adds support for the Real Time Clock (RTC) on the Amlogic
> Meson S4 (S905Y4) SoC and enables the hardware RTC and IR receiver on
> the Khadas VIM1S board.
> 
> - Patch 1 adds the internal Virtual RTC (VRTC) controller node to the
>   Meson S4 SoC dtsi.
> - Patch 2 enables the I2C-attached Haoyu Micro HYM8563 RTC on the
>   Khadas VIM1S board. It also sets up aliases to ensure the hardware
>   RTC is prioritized as rtc0 over the VRTC.
> - Patch 3 configures the default keymap to "rc-khadas" to support the
>   official Khadas IR remote control.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/3] arm64: dts: amlogic: meson-s4: add VRTC node
      https://git.kernel.org/amlogic/c/af0f8f769f89715692ba7abc4716ecb7aa9af028
[2/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
      https://git.kernel.org/amlogic/c/3da3598f65d00f72a17a16c171ba52897d8e96a6
[3/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas keymap
      https://git.kernel.org/amlogic/c/c15edbda012eff7cca4c6c6bfedc04bde5e8adf6

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


