Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WOmdmEUP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kh3+kFOr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ets2vkH4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=; b=WOmdmEUP2BXybn
	k5pxoIwuFTAESWVPDxDp7//6WDP5pMi9AFVJHwkjQrz6m7P73wniXTXzdXukd9/Bbs9FyZOBWZoh6
	9TwX1XnxnGlwsCxFvxdFSlPXJjQdsnvbjbko4DrfNz90uRqI1M9jAet1e7oLYFZzkQ3CkKFLKIHMm
	5f7tK8K+4qLErPruvv0yrcKXui2S1xb0gxHaG+OtC1ZjIUfzmzBHHpUyOHH9NUgj/r3I8VWq7OLMt
	WmdssGLdw3cLDvAVdRvyhaJ2mtIZedfO4DkBUwLGc2NP1IFS7Vrr7fUl8v0ZSz0CF9iXqv7TBQy0F
	qm1E53QyvV/xQ4clK7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGx3-0000000Gaax-12TR;
	Fri, 23 Oct 2026 15:13:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGx1-0000000Gaan-2Rjw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 15:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=; b=kh3+kFOrEgKxOJps8rvJHeSC0k
	0jWnQiFDmtjcLCTpRux2yxvVJboeeJWyXaKwndBZUdWqcUD84CE6p6iOXfpVxLtO/Dyz7PX04eSk+
	xNfMDRqr37jCiIXW2b3WMXVJtZcehk4GYce6Ny6GfLvAnd2kLzTwC++7JUt5nPnTFyfQ56QJuH5sF
	LgX8SYpEwwnUlUDzVUPrs1e6lFQF9jekfEdJdkCjtzmXQ6NHsjyhnP0o+ruLVda2OR5G58JMr5k5b
	K/V6lTIlTIVMJakf/K234jI9KeG/oTYOb2PwYILPmp+iXnequH2ccP+CrPhz9dG8f/I8HS5tfZvG8
	lp3MOGow==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGwx-00000009v3y-3fMv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 15:12:58 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c3fd91337baso137786166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768374; cv=none;
        d=google.com; s=arc-20260327;
        b=RIzXWVJGZj48ZWhB/AlC6eAmIKo/uSirRoS/uKqad4MTThXKsNe5Hw9t9/1+xhdiV8
         hk6BvvzwukK+dUQr5EZvUt9U04iqoXw+YVoDEpJBjxwR7YeFFOPjxFVk+MvQR0qkVnvG
         ZnHjMFUkUAY6gqqmQcyRx5uDKGdF3TYgo2hICIXu92hnozMMGC5IBeMxI4jWEX+ON2Nu
         WwZOosf5RDjJwU0eoF7X/GCpkILtWCHU7mTRFbpjyiuODDo6K9rut2T/abeyKFohUkZY
         mjIofRNsd3Q/4WxIpoq/yeskhBKJDpZPd4K8ax00ML2JRAuULdtMrUh6Ly3J2bO5a888
         dcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        fh=q+k9fhjlHa5gGwN9av1A+2rjQpEQYfPuQ4Jeff7k1So=;
        b=IfDd5nwoBIz5cssndX/CeSFVgcEUYeQvBwJVtrRvPs5gLmasJBDgqNfkhiiB4hjD8m
         t3HYby8nNIgCOaVJ+ecCe/1+DmFBEJBYI0E45jvqOwZ1E8fkLRPwYjgtW1U92PO1COxj
         Uz66/eM1yNcvc3RGLx+/uFDW0tU74h7lYIUnNg8LjBzFN6AysO8p+/PoVmObMOPz1MBw
         Vyg3MQjd5AGczObLrDX54zOGCsyuPgxntyB6iDFmIPGAdkWmlIKOEIW8YmnxjL6o0NUr
         rOp6uUICYzf5iRDJdmvx/K3AdykM/MyY9KNVLVAf1hpDQB2kXSdtkOAY6cCyFNAjNCLk
         D5bA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768374; x=1793373174; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        b=ets2vkH4xcImp9o21obQ84ZLSaS6XHkUa8ao4gEZLfd+nt5gwUR6aFwaihSkNo//kN
         0bmdqD5gxhAkqv8o6mOFW5tlJcHYty/EPEri/ND0Op/hl5juud6D4K7pfmnSrkW4hvU9
         HDdWvzg76a7Z39Ro6VZCP2CvLk8LolzA4sfj5tgczDRr+D2Ty0ZjWtDBhO0Voxo7q7hn
         Zihu97RFUoMj69SL4poWUim5GcUzXRQ/UhqFG6RdFyZbqwexRm79Wo6HXP7zEOr5wO8/
         E+0orRmtpb8If1BjJ4SzNYzikCkuDv1gNgpUbxNEGLSPSV4rn5UKmKo5pQChROVCVz5Y
         rKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768374; x=1793373174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        b=piv1RrU7+SKwEYbeauEP6CB1u2sIrtqycw1ACO3dOWqjFk+KqKsCU2QHM/EK8N4NQC
         /dLE6ztVrU5YZHvFpdOdf8wjrYleSvwbkeO5IdbZI5RY0g4uFF9QEzygtDmO2VIi8eCF
         LTQGK6FUW+teH3AGFWcFNMLI+ugZ01RIgTH9WWFRr7WtSMbfWibu2D3OBuCXPtHD+v6p
         udqX6XpL/Jbrw35pbE7jCQiL5f+/O1TPN/ZR16FvtKvQYzq/5igEp5pByOTRDgFYv4p0
         Sa+mMfzpDr6YZxqCs35hoSaNTL5zp6uUoV6XZ2igQgHINvO9/2/5m09jQ0dA4l1FTAjC
         LUTg==
X-Forwarded-Encrypted: i=1; AKwUvBwGOdJH8WJqAde54ZrfcfhAbmX6Rvu1nZ7ilYeWBapfxgijF9+Ty9Rc0nGz4KzqozT2UfKY8CKsC5M7BmPFQZ5o@lists.infradead.org
X-Gm-Message-State: AFq9FYLcW6HI0WfZrrIZ9JBiiXHu81zIDLsBa2ejSIAhplcoGZNlvBP0
	GbybJgrs9qxKledU+UZR+FbTc+62xOx4aL2aZBPh7HXUobsovCYnZuka/l1pz6LUkeX6TB5IpzG
	L9fvVOycVy2x2YEGDc4KFoAe5b7Vdf7c=
X-Gm-Gg: AYBFou0oEQpB3mQOMhGw3rBqg4ipF5RHvLCShQRR1rrqwuF/8jtgHvw5ZGI2hcyLCqv
	Q8S3q5NPxdDsSM+4cTe84W6ZIA2k35yf270p4TLKhyvCVFBQg2WsFBQM4ckuoUEwSC06fwPpvk+
	YQqaS4pF0MqkoVAcdPtjvNv1e0zfzpydRIPQhIPMzoki/uE2nqjZFMe64TiqSlbakcPbNQsrhfv
	HBDphPNaGCULzk+lKNZAVZ99tq6VAhA26/WyJr7OokNLEoiH3G+D7r2DxWsjogSv556BOkpA6pn
	2IXWNRluWhQCTRCL99EqPhUkIs/1NPKs7wO8JQ6xDuEXjp+0csxDYDgHQS3a6OH2k1gepu/Sdke
	XxuEzzgMzHxbIQKPFzlsAYPqnPZOx4eHiABvq1ZDHx8ojPFCalKuqmLSuMtget8bhlnvOM2gtmf
	gFoI3IC+1WygJT4/fkWi7ix43sxBZDOerARfgQotrjZgbSGJxZUuKEDSMDwyiLbeing2F+T3jcG
	9qKw6HaiVMVI9/7v3/eSVikjMdnZg==
X-Received: by 2002:a17:907:3e12:b0:c29:22cf:b0f5 with SMTP id
 a640c23a62f3a-c46a922dee5mr411130066b.33.1792768373956; Fri, 23 Oct 2026
 08:12:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com> <atseYvQUYvpMFEIM@ashevche-desk.local>
In-Reply-To: <atseYvQUYvpMFEIM@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 09:12:40 -0600
X-Gm-Features: AclHuK8N0aoS8N5_iVP1byTsJlqPWe2cGv2Z_GYIPJWKyo5TvqjUOKI8du6YHIo
Message-ID: <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_161256_896278_35F9FD30 
X-CRM114-Status: GOOD (  27.93  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
> > H616 has 256-byte transmit and receive FIFOs, but its optional DesignWa=
re
> > component parameter register reads as zero. Generic 16550 probing leave=
s
> > the port using the 16-byte FIFO configuration and its trigger-level tab=
le.
> > DMA attachment also depends on a FIFO size being available during probe=
,
> > so these ports do not reach the existing 8250 DMA path.
> >
> > Use a fixed port configuration for the H616 compatible, with a 256-byte
> > transmit load and the documented receive thresholds of 1, 64, 128 and 2=
54
> > bytes. Select the quarter-full receive trigger by default.
> >
> > Skip optional-register probing for this fixed configuration. H616 has
> > debug-divisor and RS485 control registers at the offsets used to detect
> > DesignWare hardware RS485 and fractional-divisor support. Probing these
> > offsets writes unrelated registers and can select incompatible callback=
s.
> > Keep the BUSY-safe integer divisor hook and software RS485 handling.
> >
> > Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled dur=
ing
> > termios changes. Its clock is a gate on the shared APB2 source, rather =
than
> > an independent baud-rate generator.
> >
> > Attach DMA from the fixed configuration before registering the port. Th=
e
> > 8250 core installs its FIFO defaults during registration, after the pro=
be's
> > FIFO-size test. Configure single-byte RX and TX bursts because the
> > peripheral request can correspond to just one character. The existing
> > startup path requests the firmware-described channels and falls back to
> > PIO when they are unavailable or the port is a kernel console.
>
> ...
>
> >       /* Internal 8250 only */
> >       UART_PORT_AIROHA                =3D 124,
> >       UART_PORT_AIROHA_HS             =3D 125,
> > +     UART_PORT_DW_APB_256    =3D 126,
>
> Why? Besides the poorly chosen name, what prevents us from modifying the
> corresponding parameters at probe time by leaving the one of the existing
> types?

The new type was primarily a way to reuse the core's FIFO configuration
table, including the RX trigger mapping. H616 uses thresholds of 1, 64,
128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to 1, 4, 8
and 14 bytes. Overriding only fifosize and tx_loadsz would leave
rx_trig_bytes reporting and selecting the wrong thresholds.

The core already has get_rxtrig/set_rxtrig callbacks, though. I'll rework
this to retain PORT_16550A, supply the H616 FIFO parameters during setup,
and use those callbacks for the correct trigger mapping.

>
> ...
>
> >  struct dw8250_platform_data {
> >       u8 usr_reg;
> >       u32 cpr_value;
> > +     /* Use a fixed configuration instead of probing optional register=
s. */
> > +     unsigned int type;
> > +     unsigned int dma_maxburst;
>
> This sounds like a hack.  Why do we need type here? The address of platfo=
rm
> data is enough, no?

The type member selected the new table entry and also identified the
fixed-configuration path. The matched platform-data pointer can select
the H616 setup directly, including bypassing the incompatible optional
register probes. I'll remove the type member and use that instead.

>
> >       unsigned int quirks;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

