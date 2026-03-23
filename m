Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523CFD58CBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 21:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=; b=ntVh8812PnAgZi4nKHTvnx6pd9
	fNt/qNKZ6ZE/6SWWBA/2IX69SjcRLEy0fhs4J1RA/aQkfo40gMvjkU8tjaL0c80Eo1FHlBoZXxl1U
	4SQA0JFl/MQAejR6kW96gq+IYrnh6Xur88zb+R7VsLtHdFuvigUITkZ98Vlqz1VpxR5BN8gYy01RJ
	WT/Xo+LZwVT+7HIIubV5w9I7065qsMjCSOudvmBuroaFZ1t8WPka7vrPxYQxp174yObLC4OHOtZKU
	0b600O1+fDdiDD0s2TWpEJOVKB9glzPGrzUpy7a7Jx63PhwZIujipUN8RZGEbH/TvZa7EduoBpSmC
	jh7/7VuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4n07-000000001l5-3Wdh;
	Mon, 23 Mar 2026 21:39:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4n04-000000001kO-40go
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 21:39:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b04b4974abso6093785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 14:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774301991; cv=none;
        d=google.com; s=arc-20240605;
        b=FfdugdWdhQXYpAxvjkwftSQezNXNlqivhfEVGGSOe9gIWXNTv37/y1cClcwbIhSfD+
         Q1gfaJG7ihh5g7co4YidvuHnDr1O+nMmrLHKJ7nmdTFRBzMKdl+7Q2v5VSlck5bQ1z8p
         ge1XL2ryA2Wsagm9Bm6p94xLswBBLpF0COka92ronFvGIA8+1AobR+kGng0cFhj32kx3
         iKff+5fwA8xJhUOb+HmkL99YmjckpDtlscTHXnHDBjhJ6oMjn+9b7pogtJ0wdcB6nLKK
         ZTqr16ypYn69xuMDwpR9rzRicIXtlxHTNUZ3DcKVchaucyDN7hSuEZseFnx4ILWVoT4P
         TyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=;
        fh=yZiOWZ2kkxSHyKYqTK58GNKoausgdizgcxl8ikyUF9k=;
        b=TV8gEUOoZQDp9aG5S809GhTo3RPFQac3jqxFQsAf6BwzAY4PZB40S3Nhowx/0QUp7q
         LWouZUzEJ28sMV7F/FH3J7piCG0YxPckhQ36Vx8ajnSChenjx3LyphGea3UAEXZeuQ6T
         nqf6UugzM43177dEgfnE9Fn+GRNB3tc2JmmO1AA8grs3kIzqM7pH44/UZ6Bf9UDkB2ts
         7B9jHpeDFSZM/GgeJT1CSpxmbakJHLJKZey4wrlCS4i1AWdVnMiX/h+Ytxi06jQ+iIOH
         sXoOmQRzB7B9/mC6tPRgnfRkpgT22RZt2UhQr8wm38aEM2R1sO8j3g+w/SvJ2Ulq1UUF
         CTlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774301991; x=1774906791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=;
        b=lFb2abUCrBBzFk+KPpyGjebpRvtTlbj9imlpZBp5E6KBJ5EBcSGbTSVYn0m0UqChki
         HNqAhLaO1Cn+zHhyMcNNJcSWcfIy7bjFDxQKJTS9onclVjLz1YiyNWuu1CQyfhMyaSrO
         yCEx7OdC64fUiRRRQfD6ZYUkLsN9HzdHfG+ogvHRxbt/sj1/wuYxc+3wU1YHV2cJIspY
         bw87StTdSm9woOeehHTn91poH4Yjjjpj/qNiQzyX07zcaqQY48O3wLelV5r0k4u7hETO
         18ulVkGoaAOOimrlPUYvHyDBYVVaPzwTXqivrDVPJlyFc+tzbz+arpfH0eE3Obt47D3t
         ujHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301991; x=1774906791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=;
        b=g+TR5La7ex/EtO05GHXbKsoxjL0x+Pc1Ep6uVVjBlXBqxpYHuF+Z+8ZvdCfhP/0uom
         +fMnpsj/pHKCYuQDaL7B876oxuNL9a6RT6QAYBB8hEJ7FzKk+mr8+DAAn3wipF9KqKhR
         YQq2LEBDiOMMZqjAT9iih2Y3Eg/BiPH5/oOh9JXAxcpXe1NxbWRXLmicPlxfHXbNMX3D
         eflKQyymPCbQQQ97xHl8omnrjmNWO+yGqimf1WzKEoTxZEWgCCASUC8sQQM2YiKtWyYL
         c+v2IHRqkADKhLfOGjwxOI4GDZP/z/agpP41pa1BgeJwVfvjyzjdwehIztP+4K9K80ZY
         ESAw==
X-Forwarded-Encrypted: i=1; AJvYcCVfraqQ3KLgnbjqiqskbNsEy++zNZpbwogDGV6kGl8TlpwNRdMGZok2c9GcwKwcbki1PyqqBg7ijgRF/KCoroBJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzerstWq8o5PYIAnONtR2sYbKhLDGZF9b2Ji8tSKPjMR4ck0AdO
	uEeF9urffkl6l7t58xdrqScoVvyZAiNvtcGb8LahkyE1yZbUzBqDD/t0OUlpGPGdrAGvYJOSik5
	BKMOVjkQxTbSGLmsNfEzUrG6oTS+MdjU=
X-Gm-Gg: ATEYQzzJTFZ9UlotwTdNvweO2UGiHHeyGUdXo1ydcacNya19P0TGflAvISBVeE9HHeR
	ppMorQ5LPAbbTqRNs+mIrG7LHbJ5vcno9pkay55wCXyJvTF1rrPCqmyQJa7uBZ8/ChOmBQ8B554
	HRnsmsmggCZeMTHmFj23a3wq+WX5wEJj8u2Jl9cP2f2vbTW16R8rlJUrxeXlxIp3PoKggpf/kEf
	j5XRLDGT8dtKhuICBSh3Vl/pe/gZckFrCdn8QSp01MLWzvF4MfaTGaOPH/i93oetyZkOOrF/Lxj
	9jRUMXLk93DKbBMtGEaOGImI7zfZSDua1TE2osft
X-Received: by 2002:a17:903:283:b0:2b0:5bfc:8af4 with SMTP id
 d9443c01a7336-2b0827a4001mr128486395ad.34.1774301991602; Mon, 23 Mar 2026
 14:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260323013408.429701-1-nick@khadas.com> <20260323013408.429701-2-nick@khadas.com>
 <20260323-saffron-cobra-of-perfection-731c8d@quoll>
In-Reply-To: <20260323-saffron-cobra-of-perfection-731c8d@quoll>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 23 Mar 2026 22:39:40 +0100
X-Gm-Features: AQROBzBHwpJgqdryfoMYgGeaKe0N_FLrFJ0DYVE2fe5meqjo8yYkKZdDC7I4VPA
Message-ID: <CAFBinCARQWQCjDFVyy3XOsae00KhcO2qpgLjH_r85cVxST6xtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, jic23@kernel.org, dlechner@baylibre.com, 
	andy@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_143953_001854_E8C969A4 
X-CRM114-Status: GOOD (  15.48  )
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

On Mon, Mar 23, 2026 at 8:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Mar 23, 2026 at 09:34:05AM +0800, Nick Xie wrote:
> > Add the compatible string for the SARADC (Successive Approximation
> > Register ADC) IP block found in the Amlogic Meson S4 SoC.
> >
> > There are no known differences between the SARADC on S4 and the one
> > on G12A. Therefore, it uses "amlogic,meson-g12a-saradc" as a proper
> > specific fallback.
>
> You should explain here why you are adding that comment.
What do you think about:
Also add a comment indicating that "amlogic,meson-saradc" must not be
used for new devices. It's a made up compatible string that does not
correspond to a specific hardware generation and is not used to match
any driver. For old devices we keep it as it's part of the ABI.

