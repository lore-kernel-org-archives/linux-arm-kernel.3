Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5689C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=; b=t4UBkOMTSHwBcfcdkjXrtVmR7w
	jmrHm5uvsPHyJrmdy9F0M+j6+Oxu2N6za57VoGlRqEoobkSnwfrLgBPPtVL7s9ZggJrsgbYOy8+Jy
	yv6WNS9hpjsOtVngXHfO2lOKprXkRjvP3CwL+Pf17YCVQIF2TDVEUSgm2eyqdr3zorYiEreiuQ2Wf
	lKYb6W9pPJ2iiieYjOzN6I9WkWqwC5Dnd4HxiMVPC/wZULTu9DrWiohz8cPLIy7DARGeuC1Zl7Txb
	GvUJow7lIgE3fha+YyoDKDw0+quttiZWWZu9jjrtqgZLj0Vm79jWui6zSGKL9ltc/otQlK1cPF9Jz
	JiT0l9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBbT-0000000Fm8A-0IRe;
	Tue, 07 Jul 2026 19:37:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBbQ-0000000Fm7J-1KsT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:37:09 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso58209905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453027; cv=none;
        d=google.com; s=arc-20260327;
        b=kWZo9EkcJtfEBhDn3aG4fD6o1egKnJRWNrLJHjx/3qgdkmTfG13ARsCWXQich7gz4D
         t+RerxOjOOZFt5vLc61xGtkjm1y2rpt49m9ruLMU7XEtOCAtpQUSaa/vAcfchZ1CqbXL
         0kT32PeS1trwTknuzw9cr/DbRbA1vsIdnjcjmq992zZDrrQPMPN7aio3AChCVeOyy36O
         L3cc3BGSUfCOTKhaJA2ttyMeA441x9rx77GhxKZdUivT7th7Uz+yjAO7NnepZeJDrUpC
         SDp9mu0ZDVJLsqxePwJ6ldgjZjumm5Fz6R+nRmoqlp+TqAD+9jF6BIAQ+MzcteRWXME2
         DYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=;
        fh=hAzRnrU0BrdVOMwX7ot9dfePajksDURArUKrYCaecqE=;
        b=iOdcdql8Mqwz+Oliqteno5HyEmZ+u4/d4fs4WptWJ4lwdtlSPFZRTYQlFFWg+5npvr
         vVSqsHLrW21BIasakxv8fvDdGEG9yoxLMfRy89Hs45whDi2s+QiB1Enp3Pfyhb/tYE7Q
         mrdH0QaiGFDHGwfzQzK9BTPGD5PMKWxLU0VA3ZCmHJl65R0vY2FnVieSQ6/LwzJ+fmyY
         kG96ATOR8v/wXlLI6uVPxcaUx/brcGh6ckIcs3XwK2sQwA6FAABRPLNE7nUt91PDk2ts
         4IQOFFqK7m2Qlrw+YDlLUtlnyb81BFHmGxlb+OVSc6P+U+54Cehdwu+C1/Y78ExdNJAn
         ay+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453027; x=1784057827; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=;
        b=IuIJEz78JdbEF4BdB9Yf0EdtNny4lTzOojE2g+EP6X5CcxudMuqeCuuC0mUSC814fM
         P3jgwkFlAFn3nilJyp6l4BvtPd0SRhq+5nCFduV24iJCx6heUK3cft31p4nyNMr0bdml
         MfX476lSW//ZbnJEa8wnQvlu3ZaQDNcwr4MWPC2knpAzqloTy60Opbf3eE/jOVOzWE/3
         BV06DmJY5PYUw9/Bybd7GZMhyIPJvx8JF5i3vYpqLQqt9C0zP/pvdBX0VqgC+BjtG8Ea
         qImlU2zfFflpwU9lZFaMuvg5xyj/mOjGLQQfKFNJF1TTqGNemqAQwMXlH6n/66OUKwR2
         Zh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453027; x=1784057827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=;
        b=Ut4UlitMpfUGeTvBhrfcJEuLY9cRiAwgGgUR2UNEcbIptSgGVIYv1nKU3cIYbJtP8E
         jlfVoKr6qBm4phqrEoRynjBvA9zbBtHTkIvU8TycyzSS0rNhG/KwpMxy0aHBoHTvyiFi
         LUaaUSaYiXynSHMH9iXPpf+MXSXpw/J08ayUQXSDussTqvSx541A9qiDDHR0mJ8KaWnv
         Ul9cRFnreLBa1XCcHHt2URlHv2nuiSFHIm/iesvhYEOvzBylLLxMSs3LpL6FDIMfKhZH
         ZSyT1CI9AFtijWeVEB6wjHichgEgvG9ijSLHEz8Xpo9I/8hcDKGCh0p1B6WPENwb55wz
         CQ+A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0dH5STDYOSRHsGux5JG/C67nOTg3gIvw7YgzDywcgFLf+z4BjVNJFaSOavQqF/8sZ9aEBZPqRZ5hdtvoFWbiX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/DQgAmcjbWQykgPmv0cNYa5l/Dy1aJ1pbre9rYuC1LaJNkqUw
	30Wllxk0HJHbyB22C2Bv3ptOg2iiJUWQ8zC3eMGdKkPRD6DEXZfQp5e7Ye9v8itash5DkP/BvvY
	JIuH2KXphFDMPwe0k0co4mg5uJ0hPw2g=
X-Gm-Gg: AfdE7cnzpiYcPTqRDM0wxSvAztsJfkiBhT26iP7Rnpx29m+4FAt2zRQBDqhNvd+0DPi
	yX3oWlaERUBZZpUoSJkbvoXjKQZrKsYksOKaYjvoh7shdb/I20DtbloLzUgRo1xDiJCkVdO/29G
	U7YcEHsLZFqYG0pv4dP8Yxi5oSNW34cPNAUYu8yOLR9NodSakfOCQQM1GNUenlnIFcVi9hD0PkF
	b0/qBCbHxA0Mtq/g06dRuXz5iySFFHmD92yHQWHacCjvBUUF9awqdrqtW4LsfNZW48e6oWO+P26
	cuGoDTqICgMWTiphIga+SFCflQ==
X-Received: by 2002:a17:902:d2c8:b0:2cc:90aa:878b with SMTP id
 d9443c01a7336-2ccbe728946mr63686975ad.10.1783453027559; Tue, 07 Jul 2026
 12:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-2-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-2-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:36:56 +0200
X-Gm-Features: AVVi8Cf-yuy-zDtbpT62GueylgVb7F5kepgWe3Xe-FkNm7a-D4HMWegM9GI0Nag
Message-ID: <CAFBinCAz7nDsXc80LQH+f2yC=o79E3nBhzL6OAUwYk2r3n_n1A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: amlogic: meson-axg: Disable nfc node
 by default
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123708_368195_1BC74ADF 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jun 24, 2026 at 3:57=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> nand_rb0 and emmc_ds share one pad. Before enabling nand_rb0 for nfc,
> disable nfc nodes by default to resolve pinctrl resource contention.
>
> No mainline AXG boards enable nfc currently thus no extra DTS adjustments
> are needed.
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

