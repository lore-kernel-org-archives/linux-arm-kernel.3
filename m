Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEABC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 11:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tvCpGtC60kr7PZ8TJ1YtQ7guU+6pXgo5tCrHV/eKdI=; b=aruMDvTkBsvfnq3Cj7w1giFJX+
	XJkvGzgWzULKLhGefHPBdY86F06wGHqEY1uCYtyhPzbOIhHNRXufDso139ZM8HCli8OITlQ4IrchB
	ij7t6qkxPfbFzOU82AwOfTeQazGOzcgR9qtkAhbMDbT1ojlDAK3EQL6RV/mitn0/Ydwjr7J/DsHv7
	xnn1/sZw3PXz3qvWel+w8pJu5VBM3XkeWXLyGa31IHwo0FqUtbOptylZfIVzsLGxUALP6zWGLNoGm
	4awbXfO7nEjUVMAC/MkcyItRixzRTP8OzeDAegcw5eYiU0xx3ypxTLQ+XpNN4kjkxQ3b2IQoTJ74l
	RlmkDZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtOZq-0000000ERVf-1BdC;
	Fri, 20 Feb 2026 11:21:42 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtOZn-0000000ERVE-3PwG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 11:21:40 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so1968650e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 03:21:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771586498; cv=none;
        d=google.com; s=arc-20240605;
        b=ca5DJ5YJtgAx9XgYR/Sm9a0WaEl+BTiUSNlFwbLkcNCJia5X47+AxPoWC6WYxLasoJ
         ksWjrg/9wK3wxbRABAYYt+oPy8DeQt5kZ0Y3lMndjOzyElzMpiQ2o7gIOopSDZuOm+TG
         n7m8RjkuyvVLuk8obdBx4gNiSi/TTVbipb82BabEi4cdtPfP8vKNcwoZosZhdPjrVTTs
         IQXu4D/jH4tl4mefl+iamkDy70cmYdkWVZm4niv2QtJyOlzwDQSkKeQloAt/Are4lfTs
         gbf8y+0Wvgw5JA0FxeDdsliou7XuKAjRUEv5qZH2y6dj7Mtcy2jSf3NHPqH31KDZW3yR
         hTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5tvCpGtC60kr7PZ8TJ1YtQ7guU+6pXgo5tCrHV/eKdI=;
        fh=FFaCCnxxIBQ8ohZIK+UNpYYIt9eHzeivGnvWrioBhFQ=;
        b=Gg+WwQ8arjKoCD82UHBr5n+Qj6+z045zZODIURrc2q13zIwngEmYVkCwf/gyRwGu7S
         WTo4eTx0YaRjQl6js5DJIb9NBhjKGG8QBE160zzoyvAHxyYDrLEpIJLfW4PN1tD3eCSM
         DSP7CEd/uG5dBsUdKRnBc+7rzZXyxVVMsWLtsbkOJ6p/dDE6Ho3L+fBGbIsxkWvrwQOQ
         /A8KKVE3v/f8D/SzP5xL4e1h51sy2ePbt+WoBCtqsX4od5S1VcZUNPhaSNdXoVT47Qe4
         HDhGZPgFQ8FyHhq/xpnYhD7jaMKeQzP/ELHsDZoHF9W+iyp64ZuugRpHUs5aMfXKkfYe
         LTVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771586498; x=1772191298; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tvCpGtC60kr7PZ8TJ1YtQ7guU+6pXgo5tCrHV/eKdI=;
        b=iTUxSQkSCcXZisUVeXZxxlUZHNwPwuYtXuVoRQvcHdAuhuM3NgKL/w9FJusSucX6d6
         baRk+Qoy7aDBV7FYlPnc1WfTN4m66q5wejb6lAJjysOeILa90yEavo0bCdXNAhxPnZZv
         4qoVSsQkrCm9uh9bY4aM3ejRdM9RotM5qK9PgSmORsh+To3PPpYHzsdr3g5c5VHRqD2B
         FWW1M1jyVaQVJKWdvSVg25QE/I71VyNAOjpzmHDFbF51sf7AenA30G08RiWQy66Hl0C3
         7Fj/ZlQ7Z8JWfEZEh7uEFgPHCFOfGrz8/cZpvUXI90StNUYGaBODKQYhr3XQgkZbuaep
         +bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771586498; x=1772191298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5tvCpGtC60kr7PZ8TJ1YtQ7guU+6pXgo5tCrHV/eKdI=;
        b=ckEOJhMBqaiyENV5pIeUlg3TexkNrm7ND+ieHSyg6l18z2iwbPxv40QC9QpA9hV2g9
         Om0zieUml+0NkdmBo1GL+bAOf+3adRLMdrMZ0Y633lcsAKpWJj8az/oZz2wWnJEdFJ2B
         IA+g1B8RdPYg+7t/KBl7vpyiqCM75f0ochxmd6/NeFd3Z8zCwR5Q91Gn1NKQpU8rE5mx
         lC73Dmcn5aK0DHKgxH6I5Qwe92TSxm96y+mXR1ByYnPe5CPvmLk3LeM91FmzSiyN4mSk
         EJ/8xho7CmDxRKSLDjtFSz/0ww2ifDvJWGqVj9L5ywE6zJSghv7sD1cpPXK5dAlPHJZJ
         pqKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgPSAlqIDsyJDesDpLpmqySm2hQRvHtJ00ErHov7qpF9uOJWVNg/rKeviPvLWhlvm633qbuNA/xaPv025GSRjb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+BaqMxP/enO7lj+i9kpPVfM5WVXg31V05QDr/DZYx1EGRZKR0
	VH4f6uZeN0m4VJu6Jnq3HBdC32L3JN1LB4gmS4iG29igrQtyN0vyxGu0D52cxoOQ47n+/GL+/rh
	fdUjBf5JkeZ0X3r1u283fMH8069+i+gs=
X-Gm-Gg: AZuq6aKwjmom4Jgbfo8yc8K1L4bP1rwNg4Q1DrZgPPlX7SmiA51CqBluBL8jZ9Mp4Xi
	kGaO/K3GPLs7w+6SBhRL1j9DxKvSS7NljsHP9HKACOM/WdYDGAaMgHET9Y0tTl6WCf7IcvdpA/b
	wU+GX7KcJUUimcmv30plA+FPozpWMoevu+2reeCMFBNWN0m+aPocDf6fFXXbpNcd4h/uOxzFjfU
	0RkEJ52vzutDw9jr92GJlkYqM9dLxI1tfeBJxVWdhfnYszmL09uNoipuqPJ2Bwv3NpJWqaSQ/eL
	OyyhbtkZWZHt3Zt0nP7Ghnl6zfsUCkirg2QiPA==
X-Received: by 2002:a05:6512:3ca8:b0:59d:f80a:629f with SMTP id
 2adb3069b0e04-59f83b8b3c9mr2800376e87.9.1771586497502; Fri, 20 Feb 2026
 03:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20260220021353.40554-1-rosenp@gmail.com>
In-Reply-To: <20260220021353.40554-1-rosenp@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 20 Feb 2026 12:21:25 +0100
X-Gm-Features: AaiRm53ZEQkGl-wQSfiEv76gUZanO7ErQ8jxfK7qwDQjNOMQqFvrhR9D0BkWdss
Message-ID: <CACna6ryBW-6b0UYaMq12Xf6bdgQV9AxYajb9use7g4o=VK59+A@mail.gmail.com>
Subject: Re: [PATCH 0/5] ARM: dts: bcm470x: set MACs where missing
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_032139_888507_B5D425E7 
X-CRM114-Status: UNSURE (   9.39  )
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

pt., 20 lut 2026 o 03:14 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a):
> I believe these predate the bcm,nvram driver, which makes this
> possible. Downstream OpenWrt currently assigns these in userspace.

Changes look good, I just posted one comment about commit description.
Thanks for submitting this!

If you check
git log --oneline arch/arm/boot/dts/broadcom/bcm470*dts
git log --oneline -- arch/arm/boot/dts/bcm470*dts
the prefix always used for NS patches was:
"ARM: dts: BCM5301X: "

I guess it may be preferred / required to follow that.

--=20
Rafa=C5=82

