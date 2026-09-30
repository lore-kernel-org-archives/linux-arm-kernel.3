Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845E9CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfzXiat9H5DF2PiTWs4O9ojHJwLpSTSb+XBwmSF47uA=; b=MMgAgpkAY+LOXzlNQkEoTpibN+
	lCjxCWaZ7t5b8gN1MJWoxquIYBXeWGxhhJ0Pxx6XJ8fC3i7vCst59Bq/M/nRPhNYuu+8IfLTyPk9k
	4vSuc+x0bpbX1g4sJOb4/XR2waPSQ80aAqSLLT2X+6UX3SeRdFaD3Tr72N2d6sIyK746+1mvo4Q4A
	z2qIpyKl7MYWP9zvSRsuPbCcpRe9a6xvWtTj16E/l/7lgXUidhl9Lm7sykOkhlXg9p0wIbMwl0ax0
	wks5cEvEKnKd77O8i/3XzqVsGM31IB1ouzDqEhi+e8E2hXLIuSh25ZmpoYvdYKnDMQakM1Rfg25Vv
	Gu1pWHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC29I-00000007Hl0-0M6b;
	Wed, 30 Sep 2026 21:47:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC29G-00000007HkN-3ojH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:47:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EF7D43D45
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640DA1F00898
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804854;
	bh=MfzXiat9H5DF2PiTWs4O9ojHJwLpSTSb+XBwmSF47uA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UioBh4V9PQcDGpw9Unc/Da5NbMY7NE901fFzRagTGXiAlkHHTtMmv1OqBE/22sWOa
	 ngwmBVUj4zgjk9SlH7sYU4Nv1ZzJIwb4Zq1x40gAI9cvvsjpikYfYtDp+lgEnyYGXg
	 qScvN3edrMuJeR6BOwCCpC2Y+KnFw+L6rdq7ow0vWuIZqo0zXRVILaeDOaFVSQKNw8
	 LmaJ9GFc2x/aAm8iXx244y0PS3EdDOee0MNGKX7OzSxfi32rRN9FAnQh4Kp9dMnp4I
	 7p/6JJ3P9u0fBzDoVhvRo4kvrX0Rx95HHSgX7GHkA4gtPhA21ZGGayF7McLMZ5BG+m
	 Q5MEMnDNsf5Qw==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a776fd3b88so8572561fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:47:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxNWCC+NKvvHIT6k+kXO5rDXkHBk9QfdTUB3uGbz7xHQpyBDwurXeTHBcZ3MP9xpgZCih+1jFADWPUCifRvoHs@lists.infradead.org
X-Gm-Message-State: AFq9FYJfUw7JxFeHW9X3+hVQlmLwRZhYVomQeVU7oOWk/Y8y49eQer+2
	37exMz0xxQq6pWy5165Q8QaUX/xd5Kydf86gCqIa5yQSXi0GJR3GesEGrTCy+8shZQThTCU/ENZ
	KVjI94Dhoh4q0G/Au7+2y/UvFiK/tkTw=
X-Received: by 2002:a05:651c:1990:b0:3a7:7ddb:aab3 with SMTP id
 38308e7fff4ca-3a77ddbad7emr6934201fa.16.1790804853193; Wed, 30 Sep 2026
 14:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <20260918-contrib-pg-pixel10-initial-dts-v4-2-745eaca28b1a@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-2-745eaca28b1a@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:47:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLntPtJVosWrmO4Hh_kuAPyC2G8MRB9BAwwR0wx1OUzLiw@mail.gmail.com>
X-Gm-Features: AclHuK9JASmZ3mAuwTzXMDc2vQ_yXfdUx9hC2uGUMFRzKST4nRDXC-j2uJr4VPc
Message-ID: <CAD++jLntPtJVosWrmO4Hh_kuAPyC2G8MRB9BAwwR0wx1OUzLiw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 18, 2026 at 9:05=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> From: Douglas Anderson <dianders@chromium.org>
>
> The first four Google Tensor SoCs were offshoots of Samsung Exynos
> SoCs and their device trees were organized under the "exynos/google"
> directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
> Google Tensor SoCs are now of Google's own design. Add a location in
> the tree to store these device tree files.
>
> Changes by Peter Griffin
>  * update config symbol help with at least 4 lines to avoid checkpatch
>    warning
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

