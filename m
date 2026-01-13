Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BB2D0C85A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4wVU9QaczKT/9p32vT2mvG6pfkyMA13UZGXDs37Bbs=; b=EVsAjG8ydpxaT9lrrxmySq4BHz
	Y8MRDGGXEW8yM3amSnjJe1pBbgUkktxYXAlJkBp2N7BJXpX6rtPpklTu6TmRUY/wzSkn0KBqPZgog
	3EhTPkvm0zrnTK+0kY5zDuVjedpH2oR5v+yqVUNiLqicU17QhTx8r0I8C5KdMXGZOAH8QUq4A6aNh
	6adCztvmyD+XXELRmk4zE470GfLiPjx9UywJ7yt9ONTF8Fa0cBtsnvl9A0nDpHlC5RnrkOJwI4fnP
	pFm61t0TVZQ8wfgcfp00f7507Quvd5fJ2ATT4InnlkoqTR/B5xoOE5TkTnDbN9N4WVt+d7ym1IwsU
	PK51KI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcbx-000000071XF-0HLS;
	Tue, 13 Jan 2026 11:30:57 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcbt-000000071Ws-3wHi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:30:56 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso9571454eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 03:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768303853; x=1768908653; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f4wVU9QaczKT/9p32vT2mvG6pfkyMA13UZGXDs37Bbs=;
        b=hg+uk9F9nRJWsQN6+AcYDz6yIjba4rFfw5YPj/IDhFCDkaWhUPAibxEqDtfl9tihoh
         0vUrI2njoT0pZkRJZYXnh/JSod2ohnweVpjS8KzMEku2kpjw4qEhF+f2LqAmQfIGjmr+
         tJbA0gXUX8gosRfDju/S9krJGUZtzkJEf5Vn1Rv/l8gEHKZz3kWX+V4g0lstsEBRpeR1
         5TjLOv887kzC1V2fRkd93WK62V62Y0c6xX8jYV/0z0uM7w5H+xxPEYvVuw+gzouESIKj
         6flMjUYO+jNErZW4pd8w1BJN4sdmpqUWSBfGrByCwQDjROAuv61scGqZ4xoBk1DrXMRq
         V4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303853; x=1768908653;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4wVU9QaczKT/9p32vT2mvG6pfkyMA13UZGXDs37Bbs=;
        b=ZrdH5x3AThjwEhphMOH2+rk+5LBEUB8bPRVfhXC07OKdN5aZmO+W155jxMadifuL0D
         lG4u59SBw2rIqbyB8NYsMxJgi4RjNKYI6niqcueGipRVj6Pglm0v0RaUj2LpFJotDmph
         wNQv87XKP2/u9gKemsz/UciW4xAXNxxZSiHYNS+UJZQH4nSYsqhMT/Lxcl/hO91VZZLr
         I3ZFEL0S9biiOIpN/tmZh1EE7PFBdr18N57V9Z4cViha7HECxi9+7pFqDxjeVh1bkini
         8Qj4rsPo5NKhsiIMId7MJcKyFxQWfrjM8ZBQmyHFnwcYTBE277EYhfd2YZsPsMPqznSy
         aG1w==
X-Gm-Message-State: AOJu0YwEBE1Csvt7GllZjklkyoDhvI6Gg+B9WwFvLPR8EzP2Dx7pCE9P
	ToUuvpdaeixie0G54sOsHGZ/yMfMahDMojWnFVhXHm7KWJMZwydxX+WjOlqLj1D5wuc=
X-Gm-Gg: AY/fxX4PNW3hvHyipcRRARZ0LOwYyW5wuICx8COmhPG3Utc1Qoj/K0Xr1NpF5PvEo/U
	X20fHO+KLYEOvuzB2jP5ANUIiPyD4iXc1EMIFaZzHMmkYnAutAVAsT/wHm5MA6A2CEE9N2mIQow
	Bl4rZmEXmR4OD0nzQFn6P+Tvp0jGXVufCkHSIoq8I+xqcNJHzJ9/4HDR+tIz5va5XPoQcpXUpWI
	HKdNyx1TFF0nmwN5ZCsKUA39n75apZY8BdNwwY9pCZ6ZxV8OX8/sJuHZ5LdGR4BTcx5EYJo4oc8
	ufN4B6COu7aoqh15ZxYEZwT1fM/cuzS01w9rdGJb+vb7dym+NxAJRVUwKuIFFidvB0mrZ780UX/
	GIrQ1DR3Z4CtXTi/OnlG2tUM9tnum2p/Zej1Y4bqXQJh/+/+inJGwzh+G/xLsUx5PConqP4uf4i
	OMwTGiPR214TVpHonlWgsnwXxd6Lg=
X-Google-Smtp-Source: AGHT+IE2PQGkBRDHh0wt/RR1JmU3vgEQYzdNyA0r5cB4mfroq+TTyqSFY3sc0gpnweUJAe3hVTED4Q==
X-Received: by 2002:a05:7300:cb07:b0:2b0:3d03:37d4 with SMTP id 5a478bee46e88-2b17d1e4d38mr24451146eec.3.1768303852511;
        Tue, 13 Jan 2026 03:30:52 -0800 (PST)
Received: from draszik.lan ([212.129.80.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078d9b1sm19000610eec.18.2026.01.13.03.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:30:52 -0800 (PST)
Message-ID: <ca6de8e5aa0dbd99c74481a9dba9ea9f1ac61a1f.camel@linaro.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Tue, 13 Jan 2026 11:31:28 +0000
In-Reply-To: <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
	 <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_033054_097256_46ADD1B0 
X-CRM114-Status: UNSURE (   8.79  )
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

On Tue, 2026-01-13 at 10:58 +0000, Peter Griffin wrote:
> Add dt schema documentation and clock IDs for the Display Process Unit
> (DPU) clock management unit (CMU). This CMU feeds IPs such as image scale=
r,
> enhancer and compressor.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3
> =C2=A0- alphanumeric in gs101.h header (Andre)
> Changes in v2
> =C2=A0- alphanumeric placement (Krzysztof)
> ---
> =C2=A0.../bindings/clock/google,gs101-clock.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 19 ++++++++++++
> =C2=A0include/dt-bindings/clock/google,gs101.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36 ++++++++++++++++++++++
> =C2=A02 files changed, 55 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

