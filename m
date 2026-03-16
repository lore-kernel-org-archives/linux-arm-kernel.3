Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA768F506D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 13:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cvdXFvlQulifAsDCud34sW/nfnMYNnh593LHQBbdnc=; b=z9ozK8ZcZGxIPN9/McRBMgKfrG
	FaItUpA8Jct8137fB4co53ZWPr9FGVfCPMrm3iRJc2VTV4Am9Nms0b4HdzDgTWTROYMx8LAqX3xFo
	vXd58EpJoLzDlyZv5uOMnztZTATwxkmU0s0lZWfPFPcLK1d9mufS2IcqQyIvzh/5TEzYa+s2CI9Be
	bsZcXEdP0oSHrA5pM2VBUUYrOk+ucOFD6xlrASshbdDHW6UCgAUveIJg4drAxUHLzDi8+SPpHMIR5
	6dO3BlM8b9XhL7dzDb4Mgg6CM61e9o3lQN52VPJNryszdCFmkOhBTr44BY6QvEfT1VE2TmaeaWaFN
	5qTh1nEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Ji-000000046Vp-2tgp;
	Mon, 16 Mar 2026 13:49:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Jh-000000046VX-1ha5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 13:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D341B60142
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DAF8C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773668948;
	bh=4cvdXFvlQulifAsDCud34sW/nfnMYNnh593LHQBbdnc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sBU3WEMARYeFtfEE+AlhwSnUkJ5EJRMbtuSCokihQMPFtL4fOF1DQjLFBV7tLaFeb
	 T+g8TOMDoyDOnotauBZotffVGvqew2uOC+8j0NVmfJBG3aonXu8u7ekMQVmMVW6JMf
	 Q7TQZ9EomgF9UjZy4MeCmn66upcwMUAFgbNtvwsJRC/ixvV7dPy6bT/rykRI0npXbP
	 DUyqzqj1/YZy+iGiYKlY96c+zFx8dKyxU+sXUSpSbzKgEaUIu6Ef+Dye8qbYw9eLVV
	 ZId0lXrNkj/ideXPMXdj0oeU5bswNtuIIqXFRJYE37njzQsMp4WLNW/i76DlVt94ZD
	 AUec0a/UFF5sQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a40fb9890so11839467b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 06:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUS9GfqoarHVDXtQgcsQ2hGQrkdXM+8aR76QDht/1w16jHzTDKedWZREZT3MLfjhAbB1+TcdZoMTVw1/STLX3qZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzGu+/n101HenGEv6nRXuAD5J5TcqjiqcyD31/+/Zl8wDGYTgOC
	+cymCykxbMM3YqX8Y5i2QaruEuy3TLkWmqRLEOudByPsVy4ch6eHgwBVy3Dyo5IUpie4BXvOHOt
	R52ZJnZ6gS8Kw84cgnAdG94TJz9exMes=
X-Received: by 2002:a05:690c:7084:b0:795:294c:fd31 with SMTP id
 00721157ae682-79a1c1a7751mr128404507b3.38.1773668947880; Mon, 16 Mar 2026
 06:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260312113040.68189-1-eleanor.lin@realtek.com> <20260312113040.68189-5-eleanor.lin@realtek.com>
In-Reply-To: <20260312113040.68189-5-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 14:48:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLkGGSh=9GJ--=6VqMmKxDD+VRepHh2+yYD0hx7o4WJu5g@mail.gmail.com>
X-Gm-Features: AaiRm53uWyqF9u3u5P6iIbQiRhn7ExWcjXBra8ph9HHpONePx6dshNEP9l450Ks
Message-ID: <CAD++jLkGGSh=9GJ--=6VqMmKxDD+VRepHh2+yYD0hx7o4WJu5g@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
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

On Thu, Mar 12, 2026 at 12:30=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add device tree bindings for RTD1625.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v3:
> - Changed slew-rate to use valid numbers.
> - Revert realtek,pulse-width-adjust to realtek,duty-cycle.
> - Fixed example values from hexadecimal to decimal format.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

