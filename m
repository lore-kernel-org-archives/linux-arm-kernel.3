Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B02BCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=; b=Jc7aPYfkOxaF2TPIxFN1pXmr4W
	QhsH0bilUV2KVQ5fwUEEJhk+vBkXAJb65xzxe0xUnAchhHlTampuauwFYqfrnOOvASWtlO5VGORqq
	PHPGj8wHiENkmrQ1WHWDHe4/9q29uSyhgHBRNUNT58v83eGSD2nh1/+AXWj2h+YvjxDaegkrZG/+p
	5LJQPpfP+UVjfp25qJSe1tnR0mf9RxMGJnF1wbYLh8g5cmrFnG86x9Uee0TytyUjGxn5LJhyL984P
	B2iY9IsUeEtYovhqqWbKz+UBoLcR6U4rU0l/ZCpgguoVSfRXoah/CI5cUWYJkFmEyOGH8Snksm7X6
	NxWNKieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvqe-00000000IpC-24uJ;
	Fri, 28 Nov 2025 10:37:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvqc-00000000IoG-3ELA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 10:37:08 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29844c68068so20074485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 02:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764326226; x=1764931026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=;
        b=ijj8xiygJtepoeTiedj4dF9b1zZitosnnCc5MWSTsxyX0ccCu7BzVB/kVq9DaLOm3K
         PP9a0dPyBUB0sXTJI0JkzSdK18U4omP5bbxVsh4762sWdlKpXPp8UQR2oClVLyFJ3l39
         +M/lsAg2U+m0oOBBmKiO016Mq46ja2vPbZOuV09Mp8HAXR3LOu415TzMvYvpahRFumcG
         3ZJfK5ZIke0yKCFPsfGPfpLEJvi7gbS5AN5/+4HzWbQJp7o4BKcsIXlTzL8RYc8D1zQU
         UfowpXj2cqtvxVJ2z8+rKO1lVnbdKYfv7QcphVEX0YfVbvCX5W32vwZ0xGBpSxy1kFML
         uWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764326226; x=1764931026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=;
        b=SgS5jebQfxzg2b/1nItRMtygfnbdjlcUcq77dplxWRXku6CBDo0WnOg8dTcRmQ5aF+
         OdTBh5ajckyAYmXYAZ6fFHak3Rs80UzBeX+VNIar+tsD60B93LNSWBwmqDZIm15c1HyJ
         Vf6oIAZcPhK8ViYjgZlSUZ/l73NScFnYg1APMyaiB3mEmMSdScLZvewH+tiGfrsu3LLp
         pApj2BiwJlNNtbXlzTX//wjvD8C1Ke0M4QHNFIi1Tb+njh3quTN5nSgOPowpbKCO8j4y
         2YDu+bCUJBTQbtjoMeVBdbD2mDLLnLSZCNM6ZcqBQhm9X1dpFO64OxQPbLfDgEZ52+kn
         BnXg==
X-Forwarded-Encrypted: i=1; AJvYcCWMM1FpX+gb1XMPUZklUZxIyn+vTVtX9ULup2dkY1g5B5CDpfkPmQVxwlM+5tzVwTg9gqvVHOaO894QI7+qA7Sf@lists.infradead.org
X-Gm-Message-State: AOJu0YzVZHWu9FWzp5CPVvkLtPNh8TCvrswW2Zu1EkJM5RpFsp4y6AxW
	fec5mR4Yk99Ue3rd01Qfm3Chq869AYCqWCrBJjUccYbkwnOz7f2iTWeF
X-Gm-Gg: ASbGnctJTxx09K8nZp8bczWVUzUR9n3uRHPsTDv9daoTisHLLRkt2CFIrtyQkBoCpT5
	ZQqHOV8+xjVxXcqVIa5GKRZ+HNhS5yYW98et0j2bnEr2KsxGupRsg3lw4PiHG5FxoPq3LnyXoVV
	fsiLqtMwlYLY6fZn1Ivd3P3j/T1nSPUl9Yy8NRCC5UdJeuXeCsCEZaYFiByPsdulmniWN1eUg+q
	p0LAyJqSkXyLNEpGDgJb/7pB1tDVzBgtAx0aSsa0fAQoQocutWrcWMfgh16g7x+mwtjQGtKET+U
	5uaR0nhHKAYhHrNf38ysNvexPM3gYurL8vFXwVyohlBOYFXQJ1oH7TSlOSNyfMNOt2T83Sp4SmL
	XhGfSoHHvXnFJ7wQvzfh9mQjpKjLNJuB6aRf6Te/g4JriI0pT87kgDfyvZmRBezhfAZTY1/rYkf
	JLQXKP8/mtrLMooQKPO9v+X5cXNO2haT9qkXgUw/4Ql5qfXlhC1W5S4r/Dp28YRtU8yCdEsWv7X
	6bD/5xOJNaYJtwRO4TnQNrxs5AG33orhFEEPueGcr2l2rbvDPnObaFlAF4sU812MWX1yhtIQ8ok
	thDKkMayAFa9TsPMbDf+G+3Dq3suNotIuMDWFdkNtVIJlWzAlathhrs=
X-Google-Smtp-Source: AGHT+IGMXq1Dh7hKw7TbowlI22iUZ08cEdFKrn/i/FIQAiWpJQ+dGpYRwCov3xkXMTBkJf1Am/GMAQ==
X-Received: by 2002:a17:903:b84:b0:295:b7a3:30e6 with SMTP id d9443c01a7336-29b6bec45damr309873285ad.18.1764326225590;
        Fri, 28 Nov 2025 02:37:05 -0800 (PST)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm41643525ad.41.2025.11.28.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:37:05 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Date: Fri, 28 Nov 2025 20:36:56 +1000
Message-ID: <1938104.tdWV9SEqCh@setsuna>
In-Reply-To: <20251120134445.GC661940@google.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
 <20251120134445.GC661940@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_023706_816950_89321195 
X-CRM114-Status: GOOD (  22.24  )
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

On Thursday, 20 November 2025 11:44:45=E2=80=AFpm Australian Eastern Standa=
rd Time Lee=20
Jones wrote:
> On Wed, 12 Nov 2025, James Calligeros wrote:
> > When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 err=
ors
> > out with 'case label does not reduce to an integer constant'. Introduce
> > a new __SMC_KEY macro that can be used instead.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/linux/mfd/macsmc.h | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
> > index 6b13f01a8592..f6f80c33b5cf 100644
> > --- a/include/linux/mfd/macsmc.h
> > +++ b/include/linux/mfd/macsmc.h
> > @@ -41,6 +41,7 @@ typedef u32 smc_key;
> >=20
> >   */
> > =20
> >  #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
> >  #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) |
> >  (s)[3])>=20
> > +#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) |
> > ((u32)(c) << 8) | ((u32)(d)))
> Are we expecting users/consumers to be able to tell the difference
> between SMC_KEY and __SMC_KEY (assuming that _SMC_KEY is just an
> internal)?

_SMC_KEY is used in the gpio driver, and I would have used it here too if n=
ot=20
for GCC complaining about it. I wouldn't expect anyone to want to use=20
__SMC_KEY outside of the specific use case this commit addresses given the=
=20
suboptimal ergonomics.

> I have not tested this and it is just off the top of my head, but does
> this work:
>=20
> #define _SMC_KEY(s) __SMC_KEY((s)[0], (s)[1], (s)[2], (s)[3])

This works fine on a smattering of M1 and M2 series machines. I can submit =
a=20
v6 with this and the hwmon driver dropped if need be.

Regards,
James



