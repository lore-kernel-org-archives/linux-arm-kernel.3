Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2D2D2ED15
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+Mpn+b7S8kX43PRVWBWsEkr3ZlV8vDSFyyH8rqi02k=; b=EZl0jx9RguKM+vDWwy7ADQeY1G
	wFYfAQsj39cGADR5Zz+A8OW0Pkcfz6VqleXsUwS/5YCF0BKKXjr2Kr7/Ba7suJEHB34PR4z/gg2gp
	bTfPBPZf0Nob/HZEjvPmXa3ZwO3rPprqUlqYmYNFhGwgPhsAV9vF4MsNbedqWCurCoXjxO7KGaXlO
	qbYOqhEuciKgJkJLKi2gkaODNCW+StnZxojqNXvLBdHkC1U2QJiatuvqvELn1F8w0RdFdDVDQHxUD
	bOoL/u8xEXonNnriBVddb6eududb/RtSqbsKfPAiu3evZcX7wWaGP/DzM5uUL90F1MAwh6lmGft1u
	w1cgrh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7U7-00000003UMj-3P0G;
	Tue, 20 Jan 2026 08:53:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7U0-00000003UJG-43NR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 08:53:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47ee974e230so40830115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 00:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768899183; x=1769503983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+Mpn+b7S8kX43PRVWBWsEkr3ZlV8vDSFyyH8rqi02k=;
        b=GCaIVB8+Hhl6n4vlfMvy+eoK9pTg5zx0wLD3XrsSX08+7xZxXTLidV4+v1wxyOj582
         jdPG9xdr+WhWIqBKCKP5qNKC2Yn24lFFu8wy2p/F/eCkXofH7r4KuQz1aIVDUeFKvMsH
         4SJ9k8IbhzWJUOfmT8UI8K0L0Qck7eWNnrcFK9RAPXtCxMJuHV97/MAHFBJXH/MfPNCF
         ijotsXy/KbyXMZjVQLZL31C2hM+Hsn/7PZrInBcwZhg+HagQVvQIiXfFIXG09O+G4L5c
         awRlmV3BTE8r0RjW0m8ebfqkdptiac1fS6A1KHqlA7Dt9KsaGlhASnqkds5H95e7iYV8
         p0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768899183; x=1769503983;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+Mpn+b7S8kX43PRVWBWsEkr3ZlV8vDSFyyH8rqi02k=;
        b=qPc+uv60drBssqgP88GDzP4ifcBuUHfey509J9/BFPZ4S1JNNzrucDNeGI/5lMAxu3
         xeEoKSZjYlHDMWM6KazX5J+K1SQ9YyCLRQWNQol8oVd8fGllWQecy+8bFic/L408acVq
         nwxny9/8Smv5D2clTtTYJ2JEeH2e6+7vciIAylHKRoPXnMpUBqfMCL/o2VvNjPDeb77K
         SeBZwBJqvzktXWhejd03BlhSDA6y12bAhfYyljVvfDU0goEL97nwP21kjzpzqFgIKXtf
         f1Fhmd+vQwWNl4V2CwcvdRUYtrl+RozmUhJTm+XG+8AYWoNKOZhQgSjmtgYE+pN2+VnR
         1Tew==
X-Forwarded-Encrypted: i=1; AJvYcCU6r3LQG/t7bQqlqRTlbDvQumwWVm7jANYtJf4itZPsp3mHfhcu+DOcF5y/iA4oqvAxifvN8uHJSOBCzJek/0oV@lists.infradead.org
X-Gm-Message-State: AOJu0YxEzDvJGMFjTskBm7GBzczce3FCQhybU45udSBcvQBviltxQHQN
	fAz3VfKRjZfKeVeHEvTpdDBVsj/BYs1fbi9bWlIiZqaJgkTdYzoIVp6q/ALe1RjCCOc=
X-Gm-Gg: AY/fxX5Tmjv/VVgS9kcPgaMa2stfLGjPSg2qO5wlMw6q3/S9SttS0I8Mjif3eD/OqM6
	MoDD7Yn1v386XuVv+Shz0Ku1YKbj06Z5HXB7zqqhyyDLhg3M+yq77S/UbcWlaQHBhWL3hxHWPD1
	czyeoIzEc0EDCDnAyzffFZ4JkV21NFG+DitV3ZCcQYH8fvhr5K0+Hrfaq4TfF7ZvsYArFEx2JDI
	qyBbSqH82eJ1KL8fq+zzLsAZVzkIAyb+PPArHU1V5HzSiQ6RXrowX0ExzdO98o9jAuRb7ngRI0c
	sZEtTkB2pLzX1pHwgAj1VZ9NqDkPnCoTd6cK8343gQFkZfkcRg4zIn02aUtcKFSYae1LzaRWCRw
	XUg0nCZTrrxs1poCJ/vdKBzxaLEu/8vRfmAtaFfpUCNoS5eecnJBGqMgF7JzAHSOFJyfc+RdrC1
	3xN5NL6rbpgJJ1x21CstduWRo9QMNhst8=
X-Received: by 2002:a05:600c:34d1:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-4803e7e8562mr15375225e9.21.1768899183012;
        Tue, 20 Jan 2026 00:53:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm27597335f8f.18.2026.01.20.00.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:53:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Eric Neulight <Eric.Neulight@linuxdev.slmail.me>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260116-odroid-hc4-dts-v1-1-459b601cd5cf@linuxdev.slmail.me>
References: <20260116-odroid-hc4-dts-v1-1-459b601cd5cf@linuxdev.slmail.me>
Subject: Re: [PATCH] Eliminate Odroid HC4 power glitches during boot.
Message-Id: <176889918237.1477585.6813293385956996088.b4-ty@linaro.org>
Date: Tue, 20 Jan 2026 09:53:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_005305_024383_86CD6DBD 
X-CRM114-Status: GOOD (  15.06  )
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

On Fri, 16 Jan 2026 23:02:20 -0500, Eric Neulight wrote:
> Fix issue with Odroid HC4 (and all meson-sm1-odroid) DTS that causes
> regulator power to momentarily glitch OFF-ON during boot.  Add
> regulator-boot-on to all regulator-fixed and regulator-gpio entries
> that (1) define a gpio AND (2) define regulator-always-on.
> 
> U-boot powers on devices necessary for boot then hands off the DTB to
> the kernel.  During probe, linux drivers/regulator/fixed.c and
> gpio-regulator.c both first set the regulator control gpio (that U-boot
> already turned ON) to default OFF before then setting it to the defined
> (ON) state. This glitches the power to the affected devices, unless
> regulator-boot-on is specified with it.  In fact, U-boot has the same
> behavior.  So, during reboot, a power glitch can actually happen twice:
> once when U-boot reads the DTB and probes the gpio and again when the
> kernel reads the DTB and probes the gpio.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] Eliminate Odroid HC4 power glitches during boot.
      https://git.kernel.org/amlogic/c/436418ef5baa024b7b15dd730c36d651c6aaaf47

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


