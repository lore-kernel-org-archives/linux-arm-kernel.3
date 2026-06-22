Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C18BCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rQ06gSt4q7f+tIOn1Us71LqGpF/6q5qCpZwpowAdy1Y=; b=c9cTQ0otQv0uGvX5/V4F0b2xOY
	VvNZwXvI8t6QIVy0qzXRafvJkPaiW4OVRhNUZaIRLGvncyF+EU1QJMRhk+NtVUDQuwssnSsRHpYO3
	9kVAd7n4rOTkm34iPi/YIAZYGa7P+HgwADbWrvyehfp9sZtCdPUzn9Up0iMw31Ks7lOieYrENokkr
	CcrWdcsCqwQY1tPXxB7/cgBUR3RzietwjsmmSZRxBcXa4q6/xtGdyN2lRQqAx09n+LsDF6ZlfMwGX
	YwSwSsNOw9eR89kGs4xi04RRUm6qbugWkYv9ytNctzTqOqAUen2AM8bsTZKODS5flf/SSoaWlsRfG
	1pmYSA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjXB-00000005IeT-13CA;
	Mon, 22 Jun 2026 18:38:13 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjX8-00000005Ie8-1kRd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 18:38:11 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-69ec2ebec61so3126884eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 11:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782153488; cv=none;
        d=google.com; s=arc-20240605;
        b=J0BdCvGcAxsq7GgHJHC9WPJogPoJYIm5pifnSDzOIr00+m1LaUaAYbAUqBYQ4SuQVE
         jXsxqLI5jDNlxyzjp+WapFN6mK10+GJa/haS16KZ7jns9qq0jvxKTfORqs6rDtGcBR1x
         1W6BjWpS9pjYw3k/VktFAuflUGggj8nxeaV7Vd4M8yVACAN+4Zd2S0NjIY2xllXToI4H
         wqmvgNbDB3EwpqYYFw5CMVyIbirhgOVZ8Tf/IaPgbX7wFdWAKBlErMQ/+sa1AAcowkH6
         VX2N1BE6moW2uUtSkX7YRDRwjmBhYJaJ8dOu39Yomg4cRx7VNQ3rKCL+guQOAYp7rQw1
         XQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rQ06gSt4q7f+tIOn1Us71LqGpF/6q5qCpZwpowAdy1Y=;
        fh=c6ZUD/4Y231P0LbSGNp7cC2/P7Vu3fxLAv6eXwBy8Kw=;
        b=Q1QxOIhUvgIOmJeASST39aKCnVvsm6BIXUePMRlCYLGRhcSF/5xJxiZdbtbFlZRhhV
         GMlMEhoLfR/MxtEJ5iOUbDmHHezk4TW6zJaGZ85BtbUJ4UQqEkQIIT8RiXIMXXJXqpdm
         LIcFw7t6xMBgsyfXk90RlYQvhClA9EMm4+mVQtVhfSwGjtol9taU4xV6lIZAZYKVUqcr
         PE1JsfhHA+BRWeuD7DyExfVNRCjxw+VDcq4ArpS1faOgZFmbRX7URqOeLqvSIXu3Ct8p
         WMQemQjDsEjCiEHLpFwpodrsn32ItwNKhr651H54S5BsejITb5egtLoOOUjNwJsZ6gY5
         ztTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782153488; x=1782758288; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rQ06gSt4q7f+tIOn1Us71LqGpF/6q5qCpZwpowAdy1Y=;
        b=PgQIMKxwsd+b1iEYGi2ws6oef8s1qXgcgbYe4gYifWG/Kj0yb4tuoXiaJ4e2q5UOcY
         /y95T1MwCSlE7XqTK529jtsKdiDhTYQT9nsfNW4dB9JaxP/HVxSQumutedk67VgAXvM+
         0TL00BIh/lxel/FFOyvoqNXnvFDqSzG/GU2NBloJ2aeusRbHbLNoy9esVM7x7dFQENv8
         nPVVrtBiBwTG1XX9/1Ajl1Ey11KJH/XaLtNQ9IB8gyZY2726gmOBrjnB/J2OKrGZDw6R
         XquCZtulHMNxantXhrNxWHzkHOiQprsrqvSUciG316H0PEHFEKqjDPeMNtBt86f/r3Cx
         WXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782153488; x=1782758288;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ06gSt4q7f+tIOn1Us71LqGpF/6q5qCpZwpowAdy1Y=;
        b=HpAX3MhGYSu1rXCdqwR6vruRejn21NGT/uGEdIJcpPE+GBGSWeVTT0r6GyHVhKmEkJ
         So3GjRamFo7ycyKoMBnsso9bHtOZE9wU+L/yBtbarVCetLQXr4EhWoZWqKAX3dmxjwP9
         3xKtPZpHuJF6Xt3aEN1C0xk6Xpf5ZOrdPttfsRXh5M5AbctHtm3tIjSv5cjfj25OokCS
         bo3liwvEyIbW6l9P74WLkVud4GXnaIBhyheS2kfymQ32HhVooYxIiCUpLZsFvsmYfn8q
         69gkzV5ucG/IENe1Ua1+hMYc29O2egR8bzPjsW3wIfQbdxbv+OBfAcKqBRbYQJHN0RfE
         WXww==
X-Forwarded-Encrypted: i=1; AFNElJ+gm51iuBBAa3xnBFEjuDDWEiQDzUcn6BuFySLmIZdtmiyt7cKG3izqmJGpsWH32tTM8lIvMqv9F//pxnWt9JGm@lists.infradead.org
X-Gm-Message-State: AOJu0YyA86jHofH0J9kve2hIJJNHtN6xss0ONg6hQox7Zj9K1WG9FkO4
	KM9Ek9SWWIzsw0I7zGXpRNcZ+omJeWtG19NBsnSuPRdZW+n4Dz9Bd38DqFizs4Da2lRLGUkAZS6
	qsNRJbTPMOw50maimzTk25YJGm1DIqtk=
X-Gm-Gg: AfdE7cmwu3OIOqkEceV9HgSbZcZUejRDje4mbJB+cEQAga/Tey9zEcBCvZvGDLvnu6a
	3wgR4gK0qPzDUKO09aQQTdEWPTM/8xIWExEZCWIu+pVZBY57BFbdA7vWBJVntntI8XjiUuyavM8
	6Lke5o/o96RvjcNWcYxQUBZ2DigXHXXAQxeQEFNDxUBSlllAG40VkIQdw0CTEutQRrFZ99zxe8I
	ibkwEA5QtF/flqzJ7HOrqF8yGWCSmKJFZpOUz4ZbbizTKoKXmJ765U8tLLuhnMrSiM7G7a5VA==
X-Received: by 2002:a05:6820:290a:b0:69e:31c6:2e9b with SMTP id
 006d021491bc7-6a0d8d0e062mr12485004eaf.47.1782153488563; Mon, 22 Jun 2026
 11:38:08 -0700 (PDT)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 22 Jun 2026 13:37:57 -0500
X-Gm-Features: AVVi8CdYIwbckN9ZFZVg4uvYkxA2i-4_kD2d5aza1TPQSYswdzSQXtcCBknTmFY
Message-ID: <CABb+yY3Tns7SmNU+_iSKcnrg+Muy5eOTNHn49nj+uv73VHNgTw@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v7.2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_113810_472330_D04DE8DD 
X-CRM114-Status: GOOD (  13.37  )
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

Hi Linus,
The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:

  Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v7.2

for you to fetch changes up to 36cac4b5101f8ecbc851356df175b99543c84ec6:

  mailbox: imx: Don't force-thread the primary handler (2026-06-20
21:18:39 -0500)

----------------------------------------------------------------
mailbox: updates for v7.2

- core: add debugfs support for used channels, fix resource leak on
startup failure, propagate tx error codes, and clarify blocking mode
thread support
- exynos: remove unused register definitions
- imx: refactor IRQ handlers, migrate to devm helpers, and other minor
improvements
- mpfs: fix syscon presence check in inbox ISR
- mtk-adsp: fix use-after-free during device teardown
- qcom: add dt-bindings for QCOM Maili, Hawi, Shikra APCS, and Nord
CPUCP platform support

----------------------------------------------------------------
Chunkai Deng (1):
      dt-bindings: mailbox: qcom: Add IPCC support for Maili Platform

Conor Dooley (1):
      mailbox: mpfs: fix check for syscon presence in mpfs_mbox_inbox_isr()

Deepti Jaggi (2):
      dt-bindings: mailbox: qcom: Document Nord CPUCP mailbox controller
      mailbox: qcom-cpucp: Add support for Nord CPUCP mailbox controller

Joonwon Kang (2):
      mailbox: Clarify multi-thread is not supported in blocking mode
      mailbox: Make mbox_send_message() return error code when tx fails

Komal Bajaj (1):
      dt-bindings: mailbox: qcom: Add Shikra APCS compatible

Krzysztof Kozlowski (1):
      mailbox: qcom: Unify user-visible "Qualcomm" name

Mukesh Ojha (2):
      dt-bindings: mailbox: qcom,cpucp-mbox: Add Hawi compatible
      dt-bindings: mailbox: qcom: Add IPCC support for Hawi Platform

Sebastian Andrzej Siewior (9):
      mailbox: imx: Forward the timeout/ error in imx_mu_generic_tx()
      mailbox: imx: Add a channel shutdown field
      mailbox: imx: Use devm_pm_runtime_enable()
      mailbox: imx: use devm_of_platform_populate()
      mailbox: imx: Use channel index instead of zero in imx_mu_specific_rx()
      mailbox: imx: Start splitting the IRQ handler in primary and
threaded handler
      mailbox: imx: Move the RX part of the mailbox into the threaded handler
      mailbox: imx: Move the RXDB part of the mailbox into the threaded handler
      mailbox: imx: Don't force-thread the primary handler

Sergey Senozhatsky (1):
      mailbox: mtk-adsp: fix UAF during device teardown

Tudor Ambarus (1):
      mailbox: exynos: Drop unused register definitions

Wolfram Sang (2):
      mailbox: don't free the channel if the startup callback failed
      mailbox: add list of used channels to debugfs

 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |   1 +
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   2 +
 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |   2 +
 drivers/mailbox/Kconfig                            |   4 +-
 drivers/mailbox/exynos-mailbox.c                   |   7 --
 drivers/mailbox/imx-mailbox.c                      | 117 +++++++++++++++------
 drivers/mailbox/mailbox-mpfs.c                     |   2 +-
 drivers/mailbox/mailbox.c                          | 101 +++++++++++++++---
 drivers/mailbox/mtk-adsp-mailbox.c                 |   9 +-
 drivers/mailbox/qcom-cpucp-mbox.c                  |  35 +++++-
 include/linux/mailbox_controller.h                 |   2 +
 11 files changed, 224 insertions(+), 58 deletions(-)

