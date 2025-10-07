Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C668FCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4kdCtbMpSolLUWzyca+TrSgBjxKOUaqCLIHEI3NSpw=; b=DmsqWehDDrnFmb6Z+2hfVkUm7j
	wrPE9NAteD/KPfziYZOySe2zRGZkhhB1pPzHqsd5p7mu+X4ptIPHzSmIEAjIy8GMfChu17D23GyLZ
	p3cFu32kO5gHQ3UcrjDa8cHFjV6S3MaipRbZwBrrSO/hFlUGK6necraY1cc5pOj6CdIPsIA7XaBSN
	MNPp9PvIeGKRWBFVbMeXyNq/z5XTbelGYl6vFD/a1V6DrMPTm3LQ5Kh60D5nnFlCYfBcuybz8Vsnu
	f2LSb+um3hSDhGJSTw1NErSfTyp/ig4S2nxxUF1dW1qb3wJVxP/6hVg63hO65PX3tbhc0n8NnU0Z5
	fKdn2b7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6EBl-00000002kFP-0ecN;
	Tue, 07 Oct 2025 20:21:37 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6EBi-00000002kF0-1nWm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 20:21:35 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-64e84414cfbso987457eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759868493; x=1760473293; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4kdCtbMpSolLUWzyca+TrSgBjxKOUaqCLIHEI3NSpw=;
        b=Swhxg6LaxYHxsYCgcKR2Vt2uPJUqDGFRQDPjYmeuMLGivjR3cw/SMhj3eAZcBt2UYN
         NGINx9mH8jrYrEe6QOfY5/FS6JtJvWV3RxZpMe2fTF73SO44i4GOCGnXQDtooLpMuxDd
         6/JPKaWBN2w/LkR81zq3Jcm3VgMMfbnmHjYuKmrosrniwaDDcKjLxtAoeNpk8hC71eBz
         NJVgHUQErShtcxJ0Xq9d1Qj9T5ufVdTE035x0uUCKP/L6eQkFispUTfElSS7OZAIvQZX
         m2sh7Vnva/AjihEQshbwHoww2jNSYXOrWB2kx2z7Wb4MgUjGx3SMTMgtW1FSR8DGrRTx
         9hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868493; x=1760473293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4kdCtbMpSolLUWzyca+TrSgBjxKOUaqCLIHEI3NSpw=;
        b=PwG29m3cP6zyR7V/4p1kkNGB+8w4KA2VYwqEJS6oWogerLKuW0S4ICTwkUzOP9ENuX
         WWeGnvsP2bpfa8XyPjNt5snev1J1earAaZk81taYz86cm9mOADDnlidm3OIf/chb9xDm
         GN+xhA+JrPBu+KmYayehETpzFhC6ghAVUQ+p7TLSkIIUwG1SiFvDsOUKxi0rqzKsLKiM
         LQCiq9jsPV0s0HCu3nY7F/QvkolNSGE4DhyT4yVuj0s7LlnrNZtKkYRCKR1ickYDVoty
         HGxEw+l/S+KmjhyzrfMJX51of6Zail2VVe4rojxKsFucRBDlOI2rVozQRabqwyUxibGz
         qP2A==
X-Forwarded-Encrypted: i=1; AJvYcCV5c3GH/enk/wkqfyVGtjZoEeQ9mhwVVVlA2Frc798MewFLA6SUqMsCx1JbOX2SlmbCOKVKlSVbztEh1qMw2mi6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbi1l2gypODX5zv/cuSahbR7Wu0hga/KZnbykZKVZJtztptlx7
	LDjKil+a9OWWScAA0DJGNG6hb16XPWmiFBHEMSskMf9QahdEusZBjgZnIlBV60nRPjG4qahh/SW
	Y+tmfpb2JLuuh4bPHjf32ajBNYNfB+iudVvL6HMBkiQ==
X-Gm-Gg: ASbGncsw9vEcmnOFXss5X1KRpR2ysw7M9FFdBQTeU1AAY0w5ux+v23/BySZO5x/Tamx
	UMNoJUqds/FHfsf+CID02tvNtrWS+zTZ3D2qsE2/mk72r4CnsXjY8B6PUpSNeCMtyrwKB3Eqsin
	CTtHVWOZ0rAOrLEWExfpNoFQ3CUoeCEI84EWa6NnBHfQqFrbJqsabx9YV4w2GzSyctTcmPfWzse
	YkBxAQJoytziTy8WoVvG55NiCcDhXnBbvvrUQ==
X-Google-Smtp-Source: AGHT+IFpXtTl/XW7xSv6EAre9JtZi5PYEJL3Nxxq8Z5J/VjHzSG4hRXvlO0e3SJ/ojRDNDKk3AnJrSSYwAUNIg/KUXU=
X-Received: by 2002:a05:6808:e8d:b0:437:f364:8361 with SMTP id
 5614622812f47-4417b36da9emr428435b6e.11.1759868493573; Tue, 07 Oct 2025
 13:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
In-Reply-To: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:21:21 +0100
X-Gm-Features: AS18NWCC9b83T6F2zFo4-esWHDAnbT_8yqAmmeWUhP__nUnwGaXjsaGNRCUZonU
Message-ID: <CADrjBPqAXYBsjPaG0w2tdA7EAW93x=DU_OxrEeyuGKByhyG5vw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: google,gs101-clock: add power-domains
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_132134_466065_AE5B3446 
X-CRM114-Status: UNSURE (   9.48  )
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

On Tue, 7 Oct 2025 at 17:03, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The CMU can be part of a power domain, so we need to allow the relevant
> property 'power-domains'.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

