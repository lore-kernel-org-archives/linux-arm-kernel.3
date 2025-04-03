Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27D1C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 15:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAAs5sBhDh3GOIIMyhxexUXGZEn+pFiw8EHMs4GxRSs=; b=MXDiGpCTF5BISgWS0XFdAVOrB0
	M6rSEZOzmzt7iyCzC1YNl7Fscrao8Nx1guGSUtDSmFqWt9GgQymisDojXX24W0sqtc+3gh4Bgl6rV
	f6jg2cfKIt64fmLbucs5R8ZwTLQk9oMOkFIOmjCXJz8PFoH84AC83qgIvpkkAKgH/rBZ8RvPKB/fW
	8NVt8W8XqjhQBAsXN9QKs4b8Q2L2ql6ocsnxgX2TK628qzysCR68CHbVw5KCidK2/jzqKfIV/Einv
	ebMZaA4SA3NaZNW9hc2IMftwr7pjedB/EORsw3AP4xBTGRSIBLUCpcxxDfsx/egmba5IfRRM6PiN+
	sLYNt5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Mn7-00000009HGG-0iuW;
	Thu, 03 Apr 2025 15:47:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ml9-00000009GmS-1JD6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 15:45:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso10316675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743695137; x=1744299937; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAAs5sBhDh3GOIIMyhxexUXGZEn+pFiw8EHMs4GxRSs=;
        b=iWr/YNUqxXkVkFdw+lFPMpzajGFFqgbxXNX+OF4SMn7P0nr5WZcHExXk/PeNsZyEi4
         xIbKfrBYZLwe69BEseWm8QndgL5rXSVCQrOxjvg7WB19UhVP6a0BbmEs5ylLCSfB+64W
         le5J79Yu+OmlEs7wfNP9Z1OrzA2v91HkitTagTDE+YBuYoWwKh8554gfSQUWxLa3ApUf
         GyXit6DA/AE32frALx6ryXM7b9VawDVMy6b6yAlqGj1v6FvrXGGK0akytskOM5H8rU9S
         Y6QbGuyrF3VdJGmKjxY66ogay+mqt6Yl2jTjx9WJ9O5FgE9OP5ACL0d5sQr2RHSdo3Z/
         4DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743695137; x=1744299937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAAs5sBhDh3GOIIMyhxexUXGZEn+pFiw8EHMs4GxRSs=;
        b=isObGWM6gnW3JQr1RYAUYDKjiLkEVCDsrBm3SFJ0rEWtSIdIBkOj1j1FIdR/LcqBJ4
         qRJ/746xX2tFPz7LAPbUWQzfYJc76C+lGY/ivarZfkucqe9ihRvJowJd4b5K6pIRhnBs
         HIt/g6Vt5kbMMivClL07QdI4TvbtzPnQx86t9rX5TMJzn8UlXABb+FRt6wZzrL/3NczM
         uwh8wzWTdY6brlXtgRsZ/kbSEAEJK8KsL2uwbeiIbNnWXqXT42P76JHV2ROQOTn6qo66
         0MUfXrGbpvUN2rNO6CYQgj/YLm/iCwVKQ3e4ST9ywdKN6N3L4CwjBv6ZO/3t0U2ddRud
         itww==
X-Forwarded-Encrypted: i=1; AJvYcCXK5dMTXSAVFt5T22t4rB3gcrel5Kcrvl4xa09mpJ3GlGXsvLJNpE1hAt6p86KsXB8emjKQGvo1oBMk4gH2LQJs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1nIc4KlSu2kfOsrXzmgYUGRwpQ6eRW2+L165Ls1h8lEqFI9wV
	j06sHOU0XatRgybHxM81S5VcXisOXxT1IeGxIWkOdqoZAW/9JmhRxjHmyk1ICaE=
X-Gm-Gg: ASbGncvxDmcpgtOenTFsCJ/DpVQL/xt9w+SZ2BL+hl4kg/mqzEq6fLoTNNLUzyTzvGc
	OaRwwhn2TkqukSGlrBccFj40/po2xjeyR7G0y+ktIrhkX/0Qi75+8pjKEXAfmKkKqmacEkufwEZ
	TGX+lzZoLQ/4MzR8x2ixp3yd1l9K74jCAByBbCtdEoH5gXz211UzWsBeYV39X4apoPNNC4kCZzC
	hkc7pnxw0D+K7mliv8LTTCBDw6z42ZT/HI9VusqflJshQP4ZJNxfoZUrPSxJdv8GCNnh1Ov0Cwq
	YagBLUYa09K9l+3qhk57SJEh7kKuEk43uQcn3pxKiu5aHo0rDy77okZPGjrwLdX1gdDx47G5Ueq
	PVhNFlcyero4=
X-Google-Smtp-Source: AGHT+IEE+diWQwT3xdVd1/NUrTaV0zbs1L/rziH3lZrkM6YZXL2Micftxvudk2YHYcCtgwg5qaTPJA==
X-Received: by 2002:a05:600c:6dca:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-43dfa59a802mr133654535e9.33.1743695137355;
        Thu, 03 Apr 2025 08:45:37 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec366aa29sm21727755e9.39.2025.04.03.08.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 08:45:36 -0700 (PDT)
Date: Thu, 3 Apr 2025 17:45:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Simon Horman <horms+renesas@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, 
	Patrick Havelange <patrick.havelange@essensium.com>, John Crispin <john@phrozen.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 0/3] pwm: Fix division by 0 issues
Message-ID: <6hwirawnrsvyo5fer3km453fwhoic52st5e5enrctimatpirjp@lor5kdhnvuus>
References: <cover.1743501688.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vnasbrze7ocgubdr"
Content-Disposition: inline
In-Reply-To: <cover.1743501688.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_084540_001942_03165E5E 
X-CRM114-Status: GOOD (  12.00  )
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


--vnasbrze7ocgubdr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] pwm: Fix division by 0 issues
MIME-Version: 1.0

Hello,

On Tue, Apr 01, 2025 at 12:28:58PM +0200, Uwe Kleine-K=F6nig wrote:
> I'll put them in my for-next branch anyhow for wider exposure. I happily
> accept test reports to (hopefully) increase my confidence in these
> patches.

FTR: I did that. The 0day build bot already found a problem with it in the
rcar patch that is already fixed.

Best regards
Uwe

--vnasbrze7ocgubdr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfurRwACgkQj4D7WH0S
/k7JeAgAsYjzNk8bIempZA0RtwLtBpw9k77opaBkwnfzeHOr2KIGeFwILhiIH5nQ
rQmZ6xP6Tth5QT0wSAWPrhhvkNPDo2VExXFDG2YkKWHxkR2Zour2JOLQVIU2JFhZ
Ubj3k+R9MiZQ2PEkXfd0OoWrLdG/hwhYDgD1Ui3MOE5AmA+B+iLQ01AhtaRjn0ZP
Ud709bne3Q19clrQPwy6l3v6Yu+Nekmyh3OMkCwsPMhOHYsaKuw0qe6GTbY6Psd/
MBH65M+fv17Ck6kDgUqU5AKHtGandmmnRBWx2BLRyFhQqIQmmAhOpwZuHpAqCahH
+qQKNDCHtkckEGjTsobRus/EnDCNoA==
=mH1Y
-----END PGP SIGNATURE-----

--vnasbrze7ocgubdr--

