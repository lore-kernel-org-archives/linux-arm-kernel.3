Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2556FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPgYO/h0P6jBglEJ/FzHxwNEaZtQJbUM8Z0qBsYUCYU=; b=dMURwlRWiGxHcwXqnZKjuMIyMF
	iWnQVp0DNRnZOougKnR1agoE4wGK4G3HgqgkbozyD2WZPyGEH/7xOMCZ4iSqmEhY1hLZv5Dm4jxEn
	ccqCRlJu3SNo2bfAk4LY+9KmhPD80AM/gKKul0x6nzUghWdmxtEYIanxRkVdFQk7gQaN4lNn2kjcy
	hD5H9BugbtFSyHGTLpVa9uRCn+Wl4GCusOkX5atijLwg0MBey2RnC3dVw5DzdGiqtAmnufyflTpjg
	KlPiu0+kNH+hYnoJq5QLvz37e4zzLIudMl8QW1JxCgtL22ZuwWmfBoY8/vXTbSxcbhsXrvvhFT6f1
	ntWK3VBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBy5-0000000FdpV-3Lus;
	Tue, 05 May 2026 09:21:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBy4-0000000Fdoj-0v2F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:21:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FA3B60133
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D62C2BCFD
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777972887;
	bh=fPgYO/h0P6jBglEJ/FzHxwNEaZtQJbUM8Z0qBsYUCYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LnysTQjuZHQyFzRJFA0j8SG/R5gdS2CRSC3IY8xU6QwuPZNP5oZKQAqNMJmItNh29
	 1GJkhuXoRY/LyGyOgWwCkvnNtc/kSQ1h+PICY21XnG66/2utmiopUCNkojYZFirxBR
	 2cwOe7IL3YB1iroUlVrix/n4dXiQHT4iPhOfptAgYxa0VUuwGp7tU87NhK7C4guQ60
	 vDgMJZg0A3/OKf+7lyhGi3WBa/yLWyhR7kQM4H1Dx5D6asQnJ3skbCzdHCVGKp8+4n
	 sXUB+D6gBGIRDxvN7HLczCTh7RG5rMqM6VN0pAi51h2q/GRL7ss+uc66QXr3lKv+MJ
	 w5ef2BFtwxyXQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39397d63804so21787541fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:21:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9AspUS4ok9gI5eaA4X8bOG5T3wsYa6pNPpMbN+a2mjn4Odemxqel7cL4EToTd7xItC6XpnQxwUvWeZvoybH6eR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt5DIvlsJfalyMbDBZ0CWTALBBztEaEdAzmxKquMcAo6yG78Q/
	5Ne4MhjEUxoJuGWitqtxk3LAIU8DUX3p3yHhKWPzKYAbeXAZCGACpCY3Nl3Enut236CXXYfbPTa
	Ehm6go+lvV26j5fuFK0J04zR/TvoCW6c=
X-Received: by 2002:a2e:360a:0:b0:393:903c:225c with SMTP id
 38308e7fff4ca-393903c23aamr29489301fa.9.1777972886000; Tue, 05 May 2026
 02:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com> <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
In-Reply-To: <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:21:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkX27ceGQp4w9J=MDXmibo7h=Rzg4RdRJUGRvA67zj7vw@mail.gmail.com>
X-Gm-Features: AVHnY4JqgJJ_-DwBFHnVz-Fim1cfJYHsgLM7L9yfuud9N3SuTcVr04357vZ1UsE
Message-ID: <CAD++jLkX27ceGQp4w9J=MDXmibo7h=Rzg4RdRJUGRvA67zj7vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi Xianwei,

thanks for your patch!

On Tue, Apr 28, 2026 at 10:22=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Update dt-binding document for pinctrl of Amlogic A9.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Please update the commit message with the information the DT
maintainers need to determine that a new compatible is needed,
i.e. "registers are allocated differently" or "new hardware registers
exist" etc.

Yours,
Linus Walleij

