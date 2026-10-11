Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449B9CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksiJ7Ku4UCtrC0N0jmz3YWLOf08sKJ5ATpUDWt0FsFo=; b=KrTViY9eHi1BqbM36KnpfkWeVu
	bnfB+9uiVy5bxkWgiMzjkI+yRIfkrckskcPyXKnTxPdrD0ijZpOuVzvhOwYMirXt1JGt/NI2YHczu
	3dYdEujfx+521WyKZT6JyChPuF4xOuoiemvp3RhkWTOUTcHZ6Gj72Bxc/hmpJaxSA8If7uv8++Cit
	ZRQLlb2Zwa7HBT5PGoVz8LdGuvfu9GWdCMYhDR8aRISPgEol1vy1MxPMwqWmCsL8S76yYubrkfA5O
	6k4F+lU2YN9rtcXOZ4SRTa9odoTJXW1VmcLL6hTEPxtijo1QZybwQqa1q/RhY2rN8okVKPwAWvp8K
	nIQoDiow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFwTp-00000009Dpw-0cF2;
	Sun, 11 Oct 2026 16:32:57 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFwTm-00000009DpV-3Xq7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 16:32:56 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1068048f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 09:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791736373; x=1792341173; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksiJ7Ku4UCtrC0N0jmz3YWLOf08sKJ5ATpUDWt0FsFo=;
        b=XowFKMeQ7NW6ubxOBlveDonWxtfpqfHMlhxF4FMT5Rk+fzxD2WEB1cCYVnJ1uYLo90
         DDyDZvOcV7/fKe3AIww9uT/PcPXb+fsuB2ykEwBVK8hzowOd/Mj9YKqFCgIsNGcyL1G0
         c5aY1IVxPajOvoomZxMT6K4wKnU8Bf/A5lIAHew/Ra+fUN5U8F27HwyTn+/OETxXxXSI
         +RWPly+6eTQ41vIvUhEBX86m1er7Mp/prtojVNgZ6m92yXeheSBG1SOUKBr9a3icrxXL
         8nMIFdPPpyadC9naGarnjmZPhGQwoWDoA2RFXVgD4vOvHg8VN81sOf0phzXei816xcmx
         9ygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791736373; x=1792341173;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ksiJ7Ku4UCtrC0N0jmz3YWLOf08sKJ5ATpUDWt0FsFo=;
        b=eubh0jAutIkQ1NSzVd7U7m8CyJJeNUjiLzGyRVQAhfUwygxjtBWK5Y8gEtDrRc6Uwy
         JQiYsI2gtsiBiU+yB5WVGpHzScCnUEWgM/ciER1j0zppO3D8E/Yvy+7cpi7X3+fV9weI
         CzFM7t29AZH7ydEAu5fXooI92lkVvh46uLo9m0rvHtczDwaPFNLeiMjsJ1zzmHvS/HR/
         FJlsI45rD3sh7S2QacfHmJc8F02f3dEP6wAy7X+w3lB99iMO37AwjNEUbAnbKLhn4OyC
         TRRCGs9wzr9EebPV1g6y/VC2JyikH1VdoqfHi1Y9Fbyu7YdcNxJEG+EE9UVhn7RfM+LL
         hhYw==
X-Gm-Message-State: AFq9FYLjpCr2p0l7LZTlmMKKYQS9OM+xvXQzB6CyRiBvYok/YeellZPj
	jVEQM/NQs0bPaa4Kq6KWV2gUp3fHPoCB+L4HwsT5rCIScmtf35Io6BgkEkTddbKR
X-Gm-Gg: AYBFou3C1qVoSQ4ICkNEXhfeoWJiGasQmYnNkwt/qxSytMGispWbCFqWtTYSvWL4ZPT
	ZSsWvoQmLeaBkcZkZ/5oFMKm+SNcFiraCPIk9hCqyMp8DYgxK6OAPHuyEY977D/ApKxEvateSxe
	zHSf0mbiu1lYwFC+v3+r1EBBurm5lOWVbomE8U0VyimuWFRSfvQ0sw8q+0AJXLzOCfxjSH3PdWA
	vv1hgzdr9ZReVirrK+xLZbnf+BgfqojlCist8W5VtuwCAOuj89LjrYVHjdxYoptFdwHJmin0QCO
	ghp9kOIhf/0wtMw1H2iprHo2YgU41MAsFL4VPVtGrsUO9rUISKMqh+Z55nz5JZVxBFFf8tUZ8cX
	QOH5TZZ7RvtrlIxRqkMNmMTV4i0cy+oFVRri73Hg8+lc9NXDxfr308vd7vOW2e3Blux82xcbBWc
	HR4RKNlhbvGSyUbV2S14/5Jhen09lfVCRz05itDt6/I/tIXIuGjmpK8isWR5btSdzhFLLBTw813
	d5Q/lGy/0MXaIX/SzbQKCIJTM2vozaWjnk4yVTuWKWYWbyJcdWK5GlX
X-Received: by 2002:a5d:58dc:0:b0:48c:77aa:2f78 with SMTP id ffacd0b85a97d-48dbacecfd8mr10168095f8f.56.1791736372532;
        Sun, 11 Oct 2026 09:32:52 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dba1be42esm16537414f8f.5.2026.10.11.09.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:32:51 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 20/24] spi: Add ZTE ZX279128S SPI flash controller
Date: Sun, 11 Oct 2026 18:32:46 +0200
Message-ID: <QRsVQG8CQny06omTkaluXQ@gmail.com>
In-Reply-To: <20261010130024.177503-21-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-21-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartl3bGPPFXTCGY5ZUHclgI1Q";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_093254_905316_975DE8B7 
X-CRM114-Status: GOOD (  14.11  )
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

--nextPartl3bGPPFXTCGY5ZUHclgI1Q
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 20/24] spi: Add ZTE ZX279128S SPI flash controller
Date: Sun, 11 Oct 2026 18:32:46 +0200
Message-ID: <QRsVQG8CQny06omTkaluXQ@gmail.com>
In-Reply-To: <20261010130024.177503-21-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi,

Am Samstag, 10. Oktober 2026, 14:59:58 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Navid Ghahremani:
> Execute bounded SPI-memory operations through the controller FIFO. Honor
> device and operation clock limits through the CRPM divider and cap the
> validated maximum at 50 MHz.

The registers look identical (though with slightly different names) than th=
e=20
quad SPI controller on my machines. I have a more advanced driver here:

https://gitlab.com/stefandoesinger/zx297520-kernel/-/blob/dlink/drivers/spi/
spi-zx.c?ref_type=3Dheads

Please give it a try on your hardware and see if it works.

My driver has optional DMA support, which does allow measurable improvement=
s=20
in situations where SPI access and CPU activity happen in parallel (althoug=
h=20
DMA operation is slightly slower than PIO with an otherwise idle CPU) and I=
=20
tuned PIO mode a bit (in particular avoiding redundant fifo size reads).

The qspi driver is a bit down on my FIFO queue (I plan to take care of pinc=
trl=20
and DMA first), but I can speed it up if your board gets to a point where S=
PI=20
can be done reliably first.

On the hardware otherwise, it can also raise IRQs when the read/write FIFOs=
=20
are above/below a certain threshold. That allows PIO mode without constant=
=20
polling. I found that it doesn't have an actual performance advantage over=
=20
polling PIO mode even when pushing the CPU during SPI transfers. DMA mode h=
as=20
clear advantages in this regard and I found no need to implement an IRQ dri=
ven=20
PIO mode. If the performance characteristics on your board are different we=
 can=20
reconsider this.
--nextPartl3bGPPFXTCGY5ZUHclgI1Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLui4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiohIP/jltt0RdhiQcFCJFiY+i
lBWYzFfkpW0WFbbuaPjW07QU6TdmsxABYgtMo5UywPDwJWTuxuWseKezgKcvAu93
aBjVqfPFTTzLHuLOS9Lvw9+kLzMTTMXNUDmyJdknX6o3MATiXogR65iHx2QLKXUJ
Y7qtesJzGYj6G5HbN0OmNJAv04MR+44AtAkwso0XQQ8okMG/yy9uebCsAGQTCQqD
zWHgbM+m2HAo2cGDAW5VAA49G3GnVUod7kAiCYN1+qwP7/Eahft6Ahvh/30adTTJ
I7StoebO/u6OmOpBrHLNCZRxGX/xZNNYzjhvsNz6cBPFxmcBmXYrs2nSe7daBbAj
tT890gloLO7vRy9S24zRzks4qRP58KjAHge/p82nw4n3lw0/WLrFWlwmnW5taghI
VfIrc51nV9hCh2QVh/duqzEMYSKw2pgf8PETjR2185t+J7ioga4wbMVsNV8FJ1cb
YGD335pLu8UrmU/k7yH91l0NUD4A0szLWfOmZY1bhcm7XD4MG7Yy3UAp1IqbVPb4
es5TEKmpx17UqW8PbxdRqYGSoCvm7PKVxz1W8/L8HHMPFdLh6GFVLn8t8D6ip9Zs
z5pOSJw8bzOEb6eU9zlkJZ1hF0zEgHLd+RcIJe6yEvwcV96D8waWRc8e3FYW5jyg
nGvefMr6NWI8W0ygaYQIDGLk
=l+tS
-----END PGP SIGNATURE-----

--nextPartl3bGPPFXTCGY5ZUHclgI1Q--




