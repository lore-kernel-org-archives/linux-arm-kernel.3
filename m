Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31A8C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 08:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHgNhNb80DQy4X7ezcT4lUUrnZzt8BAUNO4RPQLnr14=; b=bui35vsAsOzer2fDLBi+vcTFm3
	Gwo2LS3TjkX0KBQw8ki08neSEXdaDzhHA8OG/a+6182lJgxwl6ZKe7GAByYtbdeu6ks2zzVQFfUba
	Hl3UwSBn1ua2zXo36gGtADnHfxK3Ubgq18dcEiv7ghNgJc43kiGB050OrKJtD1XuTASO8t6Y52J2y
	ES5dOcKS13ZskkHduxKAwpColTYSKnmOPG7rUBX8/Ocm7KD+zNjBCCIjMNHQVVIhVxpCNEf0UFrSl
	zxIUOTtdbJY/CFBPe2f3hByLzBrkxKPXcnKQYMrSVj/7hlK1PClCIPTe9mV+sPgDjDww/40ztjECa
	RdjoLKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvlG-0000000ABnP-3qjW;
	Fri, 28 Feb 2025 08:30:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvdo-0000000AACr-44Tt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 08:22:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so12747505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 00:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740730959; x=1741335759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHgNhNb80DQy4X7ezcT4lUUrnZzt8BAUNO4RPQLnr14=;
        b=eXAmYiv2H5LnwS+USDVDqj0cM7K54ACNjvOBdE4jekXExybZ8TdNquyjB7zFKF9X1z
         /XuUgQpEybHKRJJ7YndyOna7TH/8qX0BzxULqtbGvgLMZ9jKJ0Wc4h8zXKFSnKzUWcdU
         1dW5bqr99TyZ7pkoL8/obDaZpmE8uEWNJj5cpp6B2LNXOu3iz7o62ZJ9fP4XJVk+KO9X
         VwRh5/n+B1VRsTNuVEaTaWsVed9k99uAV6AduZ0dZL5zTxkDa7A5jAeTtiO/0l5AaeYB
         2kMf6AY+oQXNILcRHTF72jh1oRCJpfI4cRaLCxXRMBtjmTqS/rq9Z4JWB0MgNAZtWAkq
         ZmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730959; x=1741335759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHgNhNb80DQy4X7ezcT4lUUrnZzt8BAUNO4RPQLnr14=;
        b=UBO3x93Z+8Se5l5onxIiIrOXUJQDTo79BX4KtABYTdvDW1EOQ7UriBb0k3HSJnIztF
         4E/Zmiz48hN9kxOd5LPiIdQDQAuRpw8tyUItfFxGD5zkJsto+GAKsGQvap0QqYWRiBco
         OuKCZbUA3p1nql7zQsRXdITcckQy1ODWmUMjOyIink0wK7wXEMJU+8aDRoDKkpHdnxYi
         Lklf8dxd9p/QDBZXgaKmmcW7N4MHU7if3rd8AVVwa92Vq67YnY5BVdV3lLKCF7e2c/6x
         Z34v1ASYMvAotxvDI3klxumj+56JwpQc8z+D8BkDFuKu9dro/o6Crxw5TFwKspWI/7Zg
         nktw==
X-Forwarded-Encrypted: i=1; AJvYcCUswg9+xNLNKeWquOzOcJECO1JNRaZNSjma4yY61xWtvk7/Jwm5Zsfjk5qbZcxCPFun23Pl92l8HaZEgW1lGAvC@lists.infradead.org
X-Gm-Message-State: AOJu0YyaVv66YHmbp96myELl9lvgrZUzW9gCNU5EB81Jvrtty811LHM1
	Nt+GB3uEgTTv1U2w4mGVCN+ivy3PeXdoJNyQDzdkXz6UGPwIg3iQhOeqf0eVRE0=
X-Gm-Gg: ASbGncvL+9FrkK6kMvLvyiWvMM8fbukG6JN5nr5FiEos/wBfq4sZ4SoJ+vkhGvZVq+k
	M/Rk5T00JD+7Xz4QoxzaVrEaCNu4R2kHWeh7mJTQbXAD/MyKYUJsQvNKu7l9IvqqMMg0Vj7admY
	VSYpRNYkTR95/NzZ9z3DW1S6OHn0e5pLKCarTSl7xbxEBMSlmyVASP2fAsqpp2HySHGLCwDiRH4
	KvmEn2rS6k0AJjjKK8Q29Szo32prX8UVZniY4XUAGwWE4gt4Ltt6A6zH8wK1aYni6RY49tuZKaM
	ZcnmVjn8PI6b8r1npm6j9HFe47v7r9cH+fG5dGq26mpRKy0=
X-Google-Smtp-Source: AGHT+IFh9o/6ArnjhiUzlNBx86ioNJTlHz7etf9q2i/1fT39QQaodFUpScWDIhXR/Ov2pOocchf/qQ==
X-Received: by 2002:a05:600c:1384:b0:439:9f42:8652 with SMTP id 5b1f17b1804b1-43ba6704748mr20910835e9.17.1740730959239;
        Fri, 28 Feb 2025 00:22:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b737074d8sm48750365e9.16.2025.02.28.00.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:22:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
References: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
Subject: Re: [PATCH v7 0/5] Pinctrl: A4: Add pinctrl driver
Message-Id: <174073095841.1139542.4947939584999923520.b4-ty@linaro.org>
Date: Fri, 28 Feb 2025 09:22:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_002241_013581_74D524DA 
X-CRM114-Status: GOOD (  13.05  )
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

On Wed, 13 Nov 2024 17:37:27 +0800, Xianwei Zhao wrote:
> Add pinctrl driver support for Amloigc A4 SoC
> 
> All of Amogic SoCs GPIO device requirement is met here by
> adding GPIO bank definition instead of the pin definition.
> Binding header files will no longer be added to future
> SoCs's pin devices.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/arm64-dt)

[1/5] dt-bindings: pinctrl: move gpio-cells and gpio-controller property
      (no commit info)
[2/5] dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      (no commit info)
[3/5] pinctrl: meson: add interface of of_xlate
      (no commit info)
[4/5] pinctrl: meson: Add driver support for Amlogic A4 SoCs
      (no commit info)
[5/5] arm64: dts: amlogic: a4: add pinctrl node
      https://git.kernel.org/amlogic/c/ce78f679e08cc4f90db1ad8e61ba9f85530c701e

These changes has been applied on the intermediate git tree [1].

The v6.15/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


