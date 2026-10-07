Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469E1CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wziumXR0C0JuI6Dmj4K/JRRVx4+SJT/JltIQlJfsk50=; b=ByI1NEcGYps0c1K++g7KMOPe2Y
	KOrRNbiX+6Scl0MVRdN4NTsl/LA7BwL+vRRcmaJ5ID/IJf80H7DldmkLSlDJbJ02d6MACu02353xH
	53Rb/bRCJ5+rrrz5snsVvKm9wxME8DThyNHpavWtv1TKVpYJYXTFNt12qvUIvp8LX1USGkMgqAY76
	NYmvsgnfnVDBik8yIDqml2LW6vdO2fTD1zeZr4Xj6qJjr9auypBlfeWm+GNuiuBpJlkPz/L1+1JOR
	gTGC9bYpoEpFBdTxrtw0tG7QT4C2VjdlvuZePqfQZ68d1sSnb6JGA79rZq62phHbVy4a/jTO0wyAs
	En5gzVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ11-00000002Lue-0PJN;
	Wed, 07 Oct 2026 11:40:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ10-00000002LuH-15Rd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:40:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2CD56021C
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F6A1F008A5
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373253;
	bh=wziumXR0C0JuI6Dmj4K/JRRVx4+SJT/JltIQlJfsk50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JQYbzekUcMuAPJ++XMZv4wh4ozvGN/Wy86PFLHAspa+xaoF9UcaS0BjOE/6kcYdGt
	 y54g4iwlDoOoeUs2zTB9S9S7qh82uJnlBIYKhyuliNQWl0ogxLAixR7uHQmZxndlvp
	 0Ftvx5cIrQVVq5rD/TtgPjGepgg9QcGmD0B2Ozj4sjfPPhRkGfjpVgq0WYA9CfT3bv
	 3d4depWwN1MAV6mlgyuF6dJqRqxz1ZCVviqMye4vX5Q5CJIkWDSZmZBKFDqswxIgih
	 /TI+4Dc2/IEzA4uCmhgWgvJaHigMF+hJWpjDIcz1KCycZub9JVsv7ODYaZ6fTtZo3B
	 7RWq3VI3Py3XQ==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6deb848ddd7so2820752eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4ms4n5TH6ifGTGX12As3Htz2WDb5qJ/dTqmKBcwYhyj3tpkFVxJCkx0qQg6q5pKTlrIY3+rqBLtDpIHgVW6o7@lists.infradead.org
X-Gm-Message-State: AFuF++k59+Ww7f4eqgyoQ+Dp7KoEhh/UpETYyCgQtCFk+Z9JmQ+RvzGh
	2t2anDkOhMKCAXFhNEbZNsP4ZbyAWVfX2YiFig4KtrjEr4RQ3swr53fAjK1YkLKbl2MT6Zat1Y6
	2PLUdznqnrIaAbaxcMcewp8K3iHajw2E=
X-Received: by 2002:a05:6820:1788:b0:6d9:5636:808e with SMTP id
 006d021491bc7-6e7a739112bmr2000179eaf.56.1791373252731; Wed, 07 Oct 2026
 04:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com> <20261006-b4-cs75xx-v2-6-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-6-b7d6e1e24d44@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:40:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLkfyv96v0VQorp4izy8ivr5eCtfDDVoNgWf5TRyz5JXXQ@mail.gmail.com>
X-Gm-Features: AclHuK8byDgRIuSHw8cA06RqOCCjXEr36nPZzKXnufFQprrALuEAe-_uffVuuoA
Message-ID: <CAD++jLkfyv96v0VQorp4izy8ivr5eCtfDDVoNgWf5TRyz5JXXQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 06/10] dt-bindings: serial: Add Cortina Systems
 CS7542 UART
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Jason Li <jason.li@cortina-access.com>
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

On Tue, Oct 6, 2026 at 8:17=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add the binding for the UART found in the Cortina Systems CS75xx
> (Goldengate G2) SoCs such as the CS7542.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

