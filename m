Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9BFE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQrK1HPme1KX8MRXKGRDKhR4HEct1R158EqjW1hnA3I=; b=aqRmJL3UDUN0kCDOIQoo5jxD1N
	XEGr/64con1Hh/IJX6JVMyVbecfLc/GTXJxqw8L++PW00ccwI294+kH2BHaqj2WikhGGyCnXXN9v2
	iwb8A1zwzhf+X5ug0QQmITfekksG+fCE5tXW/n3ShBZXBA0FhHZzQa4gZp7HzMsEimqpgq80+r+6M
	ybI5cjQa/kNkIIIoTvBQKVPl+aJmN5Da9FUtcjI9SKezm/mt6m0DMdL4S6mOoLwaRZR2b7iIvWc5C
	dO9VXBIZuhfWfdN6OMOc6Jwsz/EFfeixfpMke2kS18/tHld3cf2Cgeuvy4mxwRpOJBwNEiyLk5iDj
	nOgxXSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfuJ-00000009o7t-2DoM;
	Mon, 23 Dec 2024 10:43:28 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPft7-00000009o0O-3iwh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 10:42:15 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so636756a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734950531; x=1735555331; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aQrK1HPme1KX8MRXKGRDKhR4HEct1R158EqjW1hnA3I=;
        b=ydCkW/v9MGDm8xMpjlbmzr2uBJMnmfgiV5MuxNxjtoApwR5nj5QxLihE3j8kFmK+1x
         XbqlsYntoh4eL2NNX891OV5/zYpFmwRTvT7UaHZNoaCCYHovsFZEeEXTPgjbeQWJSBoa
         MiaUCVwo0kc3k9xp/cil+BqXMne/UBaeOhVh55il7jEj0VqUNJ033HDdJWdjnupL7l5q
         KVqN37gqcU2n22SO4y1VVXGRJSqo+MWE7yAN68qWcf/n6ePoNr4ambeibUOaQUzw+SO6
         hZ9Yo/MA6LfXMGr+2ckflhQMlkZYGJCTU9wI5FL7nihtCSDfGZLB1G1a+zjFphq1rA5x
         nlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734950531; x=1735555331;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQrK1HPme1KX8MRXKGRDKhR4HEct1R158EqjW1hnA3I=;
        b=q9yfpLwn6ORBxgEOB9YLnSvZ5apLIfkqTcgOjMA3TY9lkNFJnXl1hEggsy8UGanXio
         G7ZfUtrMjPctSSxbUMK1GJdfcwxCRnjWPo1ElBnBjIp+9zJRcnMPPHMgVHVpqMTpuob3
         RDGdkM6Dj1QgnKuKvub4/UdnEysDksaHjJgDqUiWc2NYoKzJXuIGGem4H6w7IV1lQWPT
         i4JKz8MttrJthX5Cz225CnFQN/JZJ/G/QSueQkydk3jO6bmw5u+ITDYFeZmv391lYBqV
         K0bPHHuuoDI8QWGT0U0NDgcxZUcOgGSJQhc0HPuzdzROAExseVn9l3Pgzf+flE2UfsQ9
         Z8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU79sk+qGz5bl9nX3IlXBckDFpni4rib0kwF+ytFEvVv6gMUqWihlpRce+gxoyXrDthNcvmXJwPkFWrZdCHp/Dh@lists.infradead.org
X-Gm-Message-State: AOJu0YyBI0yCNsJrzE3jGkagS0M38Me4QtWsGmG2gpLLIOCUi9Fq5Cml
	5TIrGTDA8aqXWO1tzesVBia1BCgUE+tMzuUxiB+QLVy9KgE9AzD+Y7ODxuh7w48=
X-Gm-Gg: ASbGncvcI6hkTAZfEgMUCcJ/9DhpyziviPdiLar2wQrNchblFJVtXx1Ac/ixPkO/Prg
	0G8pXM8pzz9FC8O6FWw/umA7B2Z7UOx3UwtfAkLzGkXRfNfXlUFWxodOVVN7GY2/8x1LG7lTKKg
	NfJB9K5xboRgAawDf2x+A6onhmCOISTJiyBz4Fba7LgDVACV/+s3DZMBio9rtXbuz/QZ9x38FQ3
	Hef1ZghFvnfDD4ttylwMqvqxlPPL2M4ldZ7eeHCJyxa6ngzgQ1YqWXXcdmk9w==
X-Google-Smtp-Source: AGHT+IHgWrhh+2AxSpUDrI7JHbusEzDDQ2ltYsz69a2vCjN8/HtQhE7ErhArGzKx/MO5IH9aoL+HgQ==
X-Received: by 2002:a17:906:c14f:b0:aa6:8e9e:1b5 with SMTP id a640c23a62f3a-aac27026ce8mr1182784666b.3.1734950531082;
        Mon, 23 Dec 2024 02:42:11 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f56csm504416166b.24.2024.12.23.02.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:42:10 -0800 (PST)
Message-ID: <d7dd7286c90ecf43594fd1d44975254479270539.camel@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: gs101-raven: add new board
 file
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Mon, 23 Dec 2024 10:42:09 +0000
In-Reply-To: <dbeb28be-1aac-400b-87c1-9764aca3a799@kernel.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
	 <20241220-gs101-simplefb-v2-3-c10a8f9e490b@linaro.org>
	 <dbeb28be-1aac-400b-87c1-9764aca3a799@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_024213_943990_58F2444D 
X-CRM114-Status: GOOD (  14.09  )
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

On Sun, 2024-12-22 at 12:43 +0100, Krzysztof Kozlowski wrote:
> On 20/12/2024 12:27, Andr=C3=A9 Draszik wrote:
> > Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
> > (Oriole), this is also based around its Tensor gs101 SoC.
> >=20
> > For now, the relevant difference here is the display resolution:
> > 1440 x 3120 instead of 1080 x 2400.
> >=20
> > Create a new board file to reflect this difference.
>=20
> There is no board file here, I see only overlay.
>=20
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > Note: MAINTAINERS doesn't need updating, it covers this whole directory
> > ---
> > =C2=A0arch/arm64/boot/dts/exynos/google/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> > =C2=A0arch/arm64/boot/dts/exynos/google/gs101-raven.dtso | 33 +++++++++=
+++++++++++++
>=20
> Nope, boards are not overlays. Boards are DTB.

Several other boards are using this approach, e.g. in
arch/arm64/boot/dts/freescale/ and arch/arm64/boot/dts/xilinx/ and
arch/arm/boot/dts/ti/omap/

Can you please explain why this here can not use this approach?


Cheers,
Andre'


