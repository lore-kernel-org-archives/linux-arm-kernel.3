Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85047C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfLYpHX9qwdgq0NabU5S/kr3j2tU7u4rdF6ed5atRmU=; b=SnV/bbg/Fk4JdHkrZ+C9yt8yWk
	g4qP3tOnjB1Ujo7AfxNyivkUCy+1GIFxB5zyPQP1VCYa7iZzzZ9OA+dBrRAnmrtirWdMTc/lRRA+L
	/uCm1SMInV5bTos8iNPZtuHUjVmXMDet/Ag+V89hzUnNAhBiNJ6W87NCS1VdwFYnH2R/uUBa2Z9CH
	ZKbS+zb9i+cDYj9BrvODFpRBJLRPURWIueAPhC8HyH/ERF0UCBCjays+wuCU+Yz9tosktUuC2PbmE
	MwjOGrpLcKLVd6hamwZKLq09U3Nws4dPzM5qh0P9XBPyXhP18OZO86KGkUjNXHS2nLeezVyIJ7vuW
	lYD82NIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81zi-0000000F8Of-0h1O;
	Thu, 24 Apr 2025 19:12:22 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81fI-0000000F54e-3qEa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:51:18 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so1251492a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745520676; x=1746125476; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfLYpHX9qwdgq0NabU5S/kr3j2tU7u4rdF6ed5atRmU=;
        b=V/DG/zpefEf1TIIqGe+99QI5cJK4/aDZ9D6e5q9+P+sgvOIsSNXTOJQEesSFPi1mJG
         qnBFCEEIVWDVCHTZr3llbSPxJcZkh527TdLW76xzeCGnS8pQkgh7jldSk2Vx3i8Eb6OA
         ZA4IjlRZTiFcW+YYPSUxaQjvA7B1GqCKkzud9QjVU3mfruQqWYwRmsXCFdEOsG/804zX
         KD3gCusnAkona9vdYIgLsDC/2IeagqEN8mdZh7CNa2mzFNIWznJDxSfkW7FZ586IYVQv
         F5xpUXPPvrlCPfQkvSnudJQRLysibXyt8LzpxyYXa4kUheUIDjRkZIVDzlnEWzLS36U2
         DE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520676; x=1746125476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfLYpHX9qwdgq0NabU5S/kr3j2tU7u4rdF6ed5atRmU=;
        b=NN/L2jHcG7rYchs//OgtkKbeSYgMVC3YTX0ZqSuPkCMh3Ai1SmGulc5bUKOXLvtYy6
         TuLaxOqZv0hbqnSKCPkh5XVUnMoYZOhuvqKilqK6u/Mb7Q3xvHTZxez0R9K9WFhZ48Gt
         Nk7MqSCwfohszX+owSTUoTwb1qx11WWXInYLnBKLl5rmh2hQEMa59+mW/TOtS8dKlKeG
         WMcVKu3w2iZko1Z0I/bFRtCV/U9neVK+cNMbJSzC9NySwZVa/9RXZIvY9HOECtrA1Bl5
         8QW2tgMTtcWdjGgsNxU8zW59LhjF++RNgHLZamvplyjISZflrIBsig8rOGvea6BpHKtv
         Yh7w==
X-Forwarded-Encrypted: i=1; AJvYcCW0IvF5DsB8w7M7y7PjYbnmFqkZ4tl5Ah2e9zwxzkdJhH3LyH/2/mg9MItKkNQ5wNx5DOtfJNCfJ7IuBA4EHfU0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2wSiKELF+xeLuQutrHjX8xQ/rdjlazas8K8N0rFYxFgROfzFN
	UYWHO4xYxDXlUvqf51PaUiiyP4GK7wz1O8x19Aj1DjNy/O/Cy6qmQl0Iji7XHwDSRCvVTnpB+mL
	YDniZmUP/bU9xff2q9GqAZq8s1gQ=
X-Gm-Gg: ASbGnct1JFKCGNbaPgEmbqCqST7YGkuDAAzLl8MmPSzkrwS5bL4QaL4P0Y7Qrn94oG+
	jMS0XPNDtCFoyZBC0IqwoGnqBVJu9680GdVf3SKdIZBR5265nnwu2f+fQoWocuAvmRsD/VWduvz
	L29w7wnjxoc0X39If63JjFh68OqwW2j81oQ43uHfLTlBVNkbKE8UAqPTs=
X-Google-Smtp-Source: AGHT+IErzNhSKSe/EMOcOw8cgkaJx5hBvqgDwBFf4ML//KAkMZG3deVxwQsFmQjZnlOQSskcoEfOL2Ba7r+EndHMZBs=
X-Received: by 2002:a05:6a21:3a8b:b0:1fa:995a:5004 with SMTP id
 adf61e73a8af0-20444f2552cmr5669561637.26.1745520675917; Thu, 24 Apr 2025
 11:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-via_pwm_binding-v2-1-17545f4d719e@gmail.com>
 <yscledgclp2v4p7djwrszbc3dnqifkcofky7rugkcip7o2rmof@xljfd2kfyzzs>
 <CABjd4YxK+4kEeS_tKBi9zhj85y6U1Dgi3nJNuQ8hfkeoY+iK1w@mail.gmail.com>
 <eydewrcn4tviu6fbqmmvhoc2zao3uzrxwwlc55tuxuhfrexk5k@7xg5fdeu7wun> <aokv26x67eu3fhkcrtdo4suoz2lryb5x5u4m4xeycwlpgt4njs@7idth75voi4y>
In-Reply-To: <aokv26x67eu3fhkcrtdo4suoz2lryb5x5u4m4xeycwlpgt4njs@7idth75voi4y>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:51:23 +0400
X-Gm-Features: ATxdqUFHUIJ7L8t27PgxByXvB2He_6LJ80dx71hPLB_GXjgdvnvl0ZNmvLuD-0Q
Message-ID: <CABjd4Yy=M+YCiVNF3OaTeQvR+_Xk9oEMBTq0JjxbLTtA1zUiaQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pwm: vt8500-pwm: Convert to YAML
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_115116_953865_B211F3A1 
X-CRM114-Status: UNSURE (   9.86  )
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

On Thu, Apr 24, 2025 at 4:48=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> On Thu, Apr 24, 2025 at 02:32:33PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > Nevertheless I'll play a bit with patatt and your key.
>
> FTR, it wasn't complicated:
>
>         $ keyringdir=3D~/.local/share/patatt/public
>         $ mkdir "$keyringdir"
>         $ git config --global set --append patatt.keyringsrc "$keyringsrc=
"
>         $ mkdir -p "$keyringdir/ed25519/gmail.com/alchark
>         $ echo "ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=3D" > "$keyri=
ngdir/ed25519/gmail.com/alchark/20250416"

I believe b4 can make this even a bit shorter:
https://b4.docs.kernel.org/en/latest/maintainer/kr.html#b4-kr-show-keys

> After that `b4 am` told me:
>
>         =E2=9C=93 Signed: ed25519/alchark@gmail.com
>
> for your patch \o/

Great that it works! Thanks a lot!

Best regards,
Alexey

