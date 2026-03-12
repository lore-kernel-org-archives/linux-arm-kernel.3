Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0853CFED2D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oVguTUzToSREXHO6bdHcFzlyooNi+O9a4UrcClhK8M=; b=QF9xa2083x92GKt6sBB7fw0d0Z
	mXJwKvncfJBl4KmXfseGc/XE64XKhKph5MKVz1WXMOjFJwHrrDNn6kYt6CGUnORw4J4k6YTAJUlw/
	E+pwn+rvRkNa10GjvmpnfNCt+vLr65CKHt4lJ9stIMmhI61RHk9LcW7YFBa7p2graDZ8AK4bQbIyg
	z/Q2RgxxRmP+oXFXNjE3Valn0Hi8THxjPfCTSEmE0D+GNANquL3cod2EdfmrmovRs+DSgRSlXPaXc
	g5LpISxlNe3xyFhXDVfpTiMtdS+E7iTzaIT5yJTcKPsOhtOGsQJkQhwtqv+JOkbGfgMpPO7SVX7mh
	06l1cFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ZwQ-0000000DUtB-0jHY;
	Thu, 12 Mar 2026 06:54:42 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ZwM-0000000DUsJ-25FN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 06:54:41 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-662abedbeb7so907709a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773298476; cv=none;
        d=google.com; s=arc-20240605;
        b=Ax3SRti94TBNQG025eG8g7d1obZddALreheEMtronDapOD5zHe9HcFE7R6lhs+hK5t
         oqx1hRXlaWtIDMmLgFKiDL6eEvCBS9l81U7E3t6jZ5suVbRo2ZHU7q5qAG74GQX89nmX
         KJFzqK8gmfTnsajWKVL6Wan/fe5aP6vPlARVdY1ORsShKvn/q4GFNe7wCSnKo8gR1VDH
         Jc8Rlcou7Z423JwtKGAlp4YMZ+uvnBwvVqjsF/uMKaD458KaLY00prK6idlGSgWXnB28
         o+4SFYD2P8io0gVYYP+Nf8QI4c4keqJciAVaOy4TlIy4FVofkqElDPxC1VbS4Gi+ogNd
         w2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6oVguTUzToSREXHO6bdHcFzlyooNi+O9a4UrcClhK8M=;
        fh=2HDf3+EKgKGm3nboJN8Psu/pSx6N3XEfEMFiCw8u92s=;
        b=hWQXcsPOmzE7OL9fbm8DDbgFVdFQe3GCSlb0YgnhTe/s1Ebcdex4X3nkcG4du0eRlN
         F8idjW/k5de9oTkH1Fehv6610/1Wo1XjbQkCkdeZcJhb9VEJ7XI47a6q/wdgIGej1UTd
         I8cvNHD8ue8mHjdJeJxOiIVNx9pD6nmRmBlfm5NvWCwtktmkspNJXz3XoV2qf48pwBYJ
         PrftJ0b0ATt8NgIuk2BZi+Y9Y5voqwIvRv34Bv2Nv8Zr/Dqhd0iNa14Nwc/sGW8AXQ+W
         waqE8vXkhQbdchRGoRzq6GI9BdtD5mwfBex3CcCeDyVVohmzKyxMJLywWHQ0pXgHA2Jv
         hSbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773298476; x=1773903276; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oVguTUzToSREXHO6bdHcFzlyooNi+O9a4UrcClhK8M=;
        b=aUhIrpXbH3IFrZ4TWHzOlO8UdDTXJjk4oFysLaAfB21QIwCNTVxcPYVX/TP72z+/Tp
         F42/id2JytHLciakHO/9Mvq8cwesOqc0jv0ne4FrexlDM5kZ3rv1Ef1Ac6v94DhYJ2RP
         jCPa5Vpyqwaykse07NOC3pZOCEkWjl6i624YkkAjuqtwOkUi8w68MYBYt1xm/VpCte1Q
         RK2HCuC7XSkVB1hiFAubBnDexLqPFG5FkjLPYgzPYcw7QwINUBMNsqDktuvV5gX7mI1G
         JS6wl4MEpPooVQk/Ess8O3DxvsnsY46+8U022XJf447NkRP9QjJ+2IVnU0J1if6H63H0
         18XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773298476; x=1773903276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6oVguTUzToSREXHO6bdHcFzlyooNi+O9a4UrcClhK8M=;
        b=hMbHt0zGYIvwMTYCLibSnURJjlFnyMt4mid/LAzdfYs+e3fK3Bp7/Bh0dR9yPkE+W8
         pnUl0e7pl8KWq3gMcPKa+tsG5V/ctcnGo3W3RaeMv7byFWUhj46SneeR5CWvO4fhdGZ1
         gpmVhoZ8JPf9EpwgP3ZBQBgDMDvP09qrtpjQkduPldnPzZZEb70OYVmvziuzh3MBoMgr
         zkV+K6tyQCiQF4n+lXywnqRyd4v98s/WK5Tx2oSjDKC/wNCwm8kzlb8UjWz10lN9zqIU
         noRJqUq30huWLR5CctrHnVnOpwyNTpgeIRIyJD7HzvpbLdTtxHmr96ADLh3HpXcZN/cE
         WJ6w==
X-Forwarded-Encrypted: i=1; AJvYcCVDKLUBSz2pcFxkh76Sy1nD1BoT9ccOsnBvPeMCxZicNPowilovbsB/f1rGsbuOJBl/q2dv6yUwW1HijNtFCYMS@lists.infradead.org
X-Gm-Message-State: AOJu0YyixEOfb/1hpKp5/ynNUm4ooK3pTDTK+p4paiTvRy6h73VHIF4D
	WolN0xyoc7jl+4CejYw7uESt7pt7wUgYU6uIL78M30CZhw4c7HThiUE5zy2fyYnWKzTVxWJmwhO
	CB1ibinLUH2U0G9jkobSkQGKgJAS8jWQTLM5u0UuTog==
X-Gm-Gg: ATEYQzwRxHwTKSn2pipp32a7zO6MRbvBEQDNRyuguV+g3ddQw7l39rRlkO0fI7lOz7g
	BpjdPOUFrfxrGCtQVaR5vG1M6SnsZ7zgUmrnASPfPHU4gko5I7ZeYswYVjQh5sFjAINiPzAlbEh
	G7MG42Ffly+rFsgbTiXdf+q9/xntQyc9x0+L28miJ1ysWY0BCueBAZaZAaY0xI7nMwe/9VHZ2Qo
	fKQh0To3z7uZ+LbW8pBp0c/ccnbQ7zzdyBFyU3TbiXMVbsB//rrsoF29gEQuqD1BO4vMvGS+dvf
	skoZ9D0=
X-Received: by 2002:a17:907:e107:b0:b97:3bbe:e42b with SMTP id
 a640c23a62f3a-b973bbef8dfmr132912266b.28.1773298475586; Wed, 11 Mar 2026
 23:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net> <802df30e-607b-7404-6693-6691ea45618b@manjaro.org>
In-Reply-To: <802df30e-607b-7404-6693-6691ea45618b@manjaro.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Mar 2026 10:54:21 +0400
X-Gm-Features: AaiRm50M_qGeqn0F08G8Ku0uzvOc6xLaJrTU2Ngsn_GnwpJNfaW5F6HrcA9leKI
Message-ID: <CAKTNdwH-dPdKyN9-ohWj4PCfRZ-DzpG-aysoULMPb=-XzJTwPw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add HUSB311 Type-C controller
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gene Chen <gene_chen@richtek.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_235439_654054_7E39E17C 
X-CRM114-Status: GOOD (  20.58  )
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

On Wed, Mar 11, 2026 at 10:32=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Alexey,
>
> On Wednesday, March 11, 2026 17:20 CET, Alexey Charkov <alchark@flipper.n=
et> wrote:
> > HUSB311 is a drop-in replacement for RT1711H, used in Rockchip RK3576 E=
VB1
> > board and some other boards closely following the reference schematic.
> >
> > The existing RT1711H driver seems to work fine with HUSB311, and there =
is
> > no public documentation available for HUSB311 to identify any meaningfu=
l
> > differences, so this series wires up the existing driver to treat
> > HUSB311 in the same way it treats RT1711H.
>
> I'm a bit surprised that you haven't managed to find any HUSB311 datashee=
ts,
> because they are seemingly rather easy to obtain.  I've got a couple of
> HUSB311 datasheet versions with the register descriptions and whatnot, wo=
uld
> you like me to send them over?

Hi Dragan,

The only ones I could find were those I linked in the commit messages
for the bindings and the driver change:
Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4f09-=
bacd-0440d2c21088.pdf
Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Branch_=
Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%2020210526.p=
df

They are notably abridged in their register description (which is the
most relevant part as far as drivers are concerned), only covering the
common TCPCI registers and not any vendor defined extensions. It even
references registers in the 0x90 range on page 17 but doesn't describe
them.

Compare that for instance to the RT1711H datasheet:
Link: https://www.richtek.com/assets/product_file/RT1711H/DS1711H-04.pdf

It does look like 's/RT1711H/HUSB311/' apart from that omitted
vendor-defined range.

If you happen to see a version of a HUSB311 datasheet that includes a
description of the 0x90-0xaf register range I would definitely be
eager to have a look.

Best regards,
Alexey

