Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D3CC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gwDHlLSyfOGZDhUdR7viQRsWnq+WUz3dBSvyyL/oTI=; b=RZRC4b6CkOfH52KNT/1Huz4U1E
	QU1ch+/wtL0eJ3yk/KQ/j9wNlanfoNayOATyowIypuVo4pS8SWufTVlpp0B95r8rfZoZNP/fRQLXg
	6bHEoA9fXjO/EQql4OyGYnEIZN2aJUvjYKxZ8RTuzubxwO8/7x073qVt60auK5UJ0bjt3uWweTOly
	7XJOuPutUoMY1ytSK3T3pW1/vtvkVwfHpC5lWpcmbKSV9m1EKN6wUSyOdfYhQm2IRWpJQF8JzShWc
	tG7pLLmlVnqyGWVZXUmww6nmxD/runrGTrQoQ/YvkhvpD+9pTYob+abuRBzNfMjwOo5lB9H9/yUpy
	z4yt/dUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5j5N-0000000FsmE-2jks;
	Fri, 18 Apr 2025 10:36:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ixp-0000000Frvs-0mPz;
	Fri, 18 Apr 2025 10:28:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so14605535e9.1;
        Fri, 18 Apr 2025 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744972131; x=1745576931; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4gwDHlLSyfOGZDhUdR7viQRsWnq+WUz3dBSvyyL/oTI=;
        b=KsPRja+slpQWnRRJP12TiVabcqiA6AZMh4xXOiUxqZRbXvkxyNzfVG7VwKhC3/Yb9n
         uDMatME98Vu62fKR43uMbxtLPfZEW9okePiD8NDef23sqZxP9DEjKqrzbDcctQiyq8IG
         mLE7KJfAIttEDD4XEFwxIrnMQvwiK4FBtwJCRr4hQ6h9EH946kdo3WlIgQqRVIJKqu1m
         aDlxx/e/i0tdB40Xb/wiAGvwz19y052NDbc9GpmBLxN0Wa+IUbd9OtkVpLpuv/EX9rtf
         +DHNLF51FtfScazytP+IEay8u2S/IZUQ0/tipNPmWPrN8HlOgQp+fRS9lAGP4cARLirR
         9O+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972131; x=1745576931;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gwDHlLSyfOGZDhUdR7viQRsWnq+WUz3dBSvyyL/oTI=;
        b=WPn1s/dSpI1111zdmf3UIMZ4N1mhJfOIEOF6MTMdcRouQQmEiKsx0WuRLh8hchrvMM
         16vHeIyDR/QHG7IqGeTu3wLYmYlZzdjLn21UP6WUgiaosaDVOhc2NX/mOIqJP35tukJA
         NvdUjMMjhAqYWhh0SgMJ7TUNnxu3o8TdwbFlvVtn5EHLddJWHiPEm/+TczTHDFu/Jh+z
         EAdATXa6goTgm6PJxf1bCFeAgJkb0uL8+6TQpfENXrNxt5ptH1l/8KNJgJpxDBqYWzCN
         +HI+Km0D/RURzHplmwBGvYGkZbIl4RntaMDZblyxQUZcO90tvsXdj5WMFOKnpZThOnp7
         8THg==
X-Forwarded-Encrypted: i=1; AJvYcCVzQFAaw85qUuZpW0zPSrrZdval05bT5A1HpgoPltZoW1tB4aWZ/z5FvSRA+XIyiB839wcWOOqkLepV6hrdEa8=@lists.infradead.org, AJvYcCXElbiGgxf/c8GapH78S0RvARJMBk7GgUv5AnzEtSpYeT0+FA0HU+ZQYleb/FXUccXvAwXyKJIhwpRlHqEgjPvj@lists.infradead.org
X-Gm-Message-State: AOJu0YzBokLp5rar9V3Nm/AipYkBOay82HYeAfIwuk8KDCg/2HYwg70p
	H72zBygySDee3Re1N3UC0aleyFau9bkhePmZsaA6mxqWN3RSSzr5ylL7Wm1ms0M=
X-Gm-Gg: ASbGncsRPSR5GxPcgSnFcvahsFFJkauOGjADtvaxBQFDCXWnmtSMy/O7qA6FA3ZcVks
	ebDVbKCC2DjV6s/z1eGOUyzGy0QvvDNH9eRjIoicoHp1NMXNWcDi/BgFU5YpXS1bjUZGxh979io
	x/hfsxZsZBCMPd5jDFQbi+OoXhHJNV9gpQ4gOuMF0kAaUF42Hc1yLriadd4Bzfl50aW7NluRnSP
	rP0fBYiyY9fkd376TC50gzRDlKRWgE8vncBvnLjk7qwaMeK0+5YXrwrfrrud2SQ23zp78WQgIqa
	I0AiFWd9x6ChkXFrYSu0Jj+hb52dDBF0k5woxWWBstodckigBEFMSHV1WjFhfF2KqmprqETfQz7
	cx+WMXMgsHzXeziw=
X-Google-Smtp-Source: AGHT+IHzSil2G3YGnRzD5cowRm+z9RfTcSJoozpe7ba6NO1ln0LD3onqnxF8VbnwQ0vVLMFjQbwCSw==
X-Received: by 2002:a05:600c:b98:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-4406ab7ff23mr17936375e9.7.1744970385090;
        Fri, 18 Apr 2025 02:59:45 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bef1sm2245637f8f.49.2025.04.18.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:59:44 -0700 (PDT)
Message-ID: <c3399884bcd18ff730855103897f39081f409296.camel@gmail.com>
Subject: Re: [PATCH 8/8] iio: pressure: mprls0025pa: use aligned_s64 for
 timestamp
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,  Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,  Andreas Klinger
 <ak@it-klinger.de>, Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Fri, 18 Apr 2025 10:00:05 +0100
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-8-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	 <20250417-iio-more-timestamp-alignment-v1-8-eafac1e22318@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_032853_216847_FBEBDB5B 
X-CRM114-Status: GOOD (  12.57  )
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

On Thu, 2025-04-17 at 11:52 -0500, David Lechner wrote:
> Follow the pattern of other drivers and use aligned_s64 for the
> timestamp. This will ensure the struct itself it also 8-byte aligned.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

ditto

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/iio/pressure/mprls0025pa.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/pressure/mprls0025pa.h
> b/drivers/iio/pressure/mprls0025pa.h
> index
> 9d5c30afa9d69a6a606662aa7906a76347329cef..9fe9eb35e79d992b2a576e5d0af7111=
3c6c47400
> 100644
> --- a/drivers/iio/pressure/mprls0025pa.h
> +++ b/drivers/iio/pressure/mprls0025pa.h
> @@ -41,7 +41,7 @@ struct mpr_ops;
> =C2=A0 */
> =C2=A0struct mpr_chan {
> =C2=A0	s32 pres;
> -	s64 ts;
> +	aligned_s64 ts;
> =C2=A0};
> =C2=A0
> =C2=A0enum mpr_func_id {
>=20


