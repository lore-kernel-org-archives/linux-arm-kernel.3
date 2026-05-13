Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7848CCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wDZNYuJTOodTUWmKm8ygZ3ux+hmWufjjKn9F0AZmjY=; b=uICt7DBiqTAf6YGW90YMWSe3AT
	dlPKrGgl0uC1Mh3J7Q9/QZxBJPe5BXEZXJtiD1NvRvOqvMI+XeRxbF6YSh/YwMopdfJ3tKbN9V+wU
	v5ll7Sndq53wE1WSAsAgPFAY4I05XTfvgzbgQP/Vaokc9QktycLTZr28nxvllLyD3h0yaQYEV5M8U
	1M0JrV+s1O62WfPiqfrkAK+xX0B7ntCrUhHsBOvJejbJJJ1H4xlYrVGCMl0RlFLeC16zwb2AlFy8o
	9vDug8t5Ta5oETHjt6BXceoEnGpN+dlHLLFNUqujeLruXNUlahhFWAdHz5xzuQDUBiHlWZSPCvUTp
	CZqpKwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pw-00000002VZq-0lyH;
	Wed, 13 May 2026 12:37:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pn-00000002VSI-0soN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:37:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso60988675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675825; x=1779280625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wDZNYuJTOodTUWmKm8ygZ3ux+hmWufjjKn9F0AZmjY=;
        b=RcvHINsgrhupSUop7gI7qaYz2ji5j+yUTArEeuOTxpAoa0z3iUYOKaQE4Pw04ubpJY
         L1y/Tc9QeEUDj86y8YlkuuYnofChzvVrYvnvgoe5mW/mG2OAqZ1JsGH16OvlDujL4bp2
         TER+FuNXhZHNqvh08nfNeJWU1gG3rD5R3XaF5q0oehVz87cAjFdYIcwjiTt5OUMBdOAZ
         CMvMkc5ocSXXEqciitZN9gOak8WGgcEAo2F4f90MG3/7v/F7HKk3ehTnSfDqn0vsSWbz
         i9mlRXz8KSYJDZVXsnawjBUA0kSWu0t0PcfC0pQKBZ9ZRLcazhv3GYi3aSV74zLuIneK
         090w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675825; x=1779280625;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wDZNYuJTOodTUWmKm8ygZ3ux+hmWufjjKn9F0AZmjY=;
        b=NXs8cawUQ6KGmnv6vL+4Al8r2F5H4TcJhSCT1c21vKhpBUz+cuWNztbs0nLtHiblzP
         kLL559oF2i2TSHmsgbnJhzgnpxItAx2cZfmENbCoIzTRVyA92H7npLBEz/w61CTguN+b
         xiXYzkRzdwsrkQbEV+7R2NLc0QlnXx4gajsB2dnEck2HeWnB1zxrqIUuDXdFQBEyQU3O
         ENRkaGTEPG3VnNVdqJpEKPzKzHOSoDuJFyDhI9K5ty0kDgJmnxBLUF/vVYK5UYxMaHNN
         nH8EOT0fQBL3aw7Nmh4y8ZTlUvcqZ/nKI95gYC0NfuFDEsi2J+G9+x/tZfgExDxcXCF+
         meeQ==
X-Gm-Message-State: AOJu0Ywq/5UoZf55A6/rU5zP5S23XSo/ULc09Bbud5WDU63M/C8Qd/eT
	R08UsV6jXD1Vm+n4AkjYRDyn5QOk275oB+Dch2QFW0hKLuJkLgo6bjGJ3YVLTCQa8OlQMNtWXJK
	ZSshNsTE=
X-Gm-Gg: Acq92OESum3oJw3e5J8m9RclN5S0DBYhBkDFZTsTfdnbrOgywoX6wh4DUf+ZCjQ+ffi
	h1mW9HfBERNeTaHPTqxNy1ACNv/TCKlWjKZrQDfFa2uGCzyTP/NPav5V8unN4CDsg+zwM2PVkwq
	vNG2rSdAhCsmhLq/RYSQcIhJnV7ljpwnQB+9t1YXEDLSobrZ/QXL5dxMYJsLCKvZPK5zYp0FLhd
	GCiPsLxjmIzYHaJGEMFhkH5R0AY6Czv/hSY4k5cSrOZdpYvbHqHSehPPaBs0E9KijoTBF5DVFbQ
	74nIHcUgsXFGRzKQP58gDiLxZfPf1HfTwrEB+nweGtZNvpKRAveFJYugddKtVpBPcqkKxqwkDLH
	sMGMJZvJRE7ja3gNm4oTV3xi3XMkG45+oF1hazrDP4aXzvdobzU7GQbap/MSKbe/dWNwHc6QH6Y
	rc9UT6fuHxucRd2TawbqUJ1XJ3BRJNerMQJRrOvjbArsyP
X-Received: by 2002:a05:600c:a31b:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48fd5b4f6cbmr4318735e9.14.1778675825113;
        Wed, 13 May 2026 05:37:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d74536sm75006895e9.15.2026.05.13.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
Subject: Re: (subset) [PATCH v2 0/3] Khadas VIM4 PWM status LED support
Message-Id: <177867582446.1433419.3719715146957232929.b4-ty@b4>
Date: Wed, 13 May 2026 14:37:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053707_256993_C5C966CC 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, 13 May 2026 12:43:52 +0200, Ronald Claveau wrote:
> This series adds support for the PWM-driven status LED on the Khadas
> VIM4 board (Amlogic T7).
> 
> The VIM4 exposes a heartbeat LED wired to the PWM_AO_C output, routed
> through pin group pwm_ao_c_d. Before wiring it up in the board DTS,
> the SoC pinmux definitions had to be corrected: the original
> pwm_ao_c node was conflating two distinct pin groups (pwm_ao_c_d and
> pwm_ao_c_e) into a single ambiguous entry.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.2/arm64-dt)

[2/3] arm64: dts: amlogic: t7: khadas-vim4: reorder root node
      https://git.kernel.org/amlogic/c/308e24fb9571be23aaee2e2a5de3da6f5cb3b029
[3/3] arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED
      https://git.kernel.org/amlogic/c/2bb37dc2976dc980a05ca93f529ff9977a24875d

These changes has been applied on the intermediate git tree [1].

The v7.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


