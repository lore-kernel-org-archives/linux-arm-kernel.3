Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B3FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+lsaFQ6qjDO50EbBx7FyJYhCbTrcZAazW4ep3ah4bQ=; b=tlxuggEJX5wax+3joNVG1Q5n+y
	qOxDsHzgtbYoT45kh4OIrzd8+Z7U31+vniPOhQMkeyTB+bB6kLdmIR5sK+yz2eXRZf5J5siapXxt8
	HCN45hcI1+5HED1ej4SYnyjMMMEL6LVlx7zk8b6YIx3ndC9oN32uYDuOvyPGZmLqLHGnIMSX+4mtq
	LgIidJTkPF1gvDqyIPryEyV8SU73SNtnQRw5aGOqyy0Lz6ZxhpnkGfGqUWRBWJYRuGOxUnyqZwQuu
	GoVytuSnKFgDjAC6AmDr2MLKFgiiB3lvIdciSQ/9AFXiI6T0w6EHNxEl9Lg9Rw7XEoiGLo+NmG3hH
	8MgQbwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSCb-00000007kBN-0P9b;
	Wed, 08 Jan 2025 09:18:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSBK-00000007jMf-1D8M;
	Wed, 08 Jan 2025 09:16:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21680814d42so206883765ad.2;
        Wed, 08 Jan 2025 01:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736327813; x=1736932613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+lsaFQ6qjDO50EbBx7FyJYhCbTrcZAazW4ep3ah4bQ=;
        b=VAtlLQ7UjMrsWTBWXtLwtAlwE2/9CA6sRTMwt4EyQsf6shtIsfD4T5e0BqW7U35QGg
         1EYvZTAD7Ef7FQvTFX0DAkMjrGqv/xqgLCVcJ69aPOBjYJfgJ1ySqHfj6Ytpgadc1MtU
         TT+Xh10eJa8gXEq3vQr9DneWmRxqs22jCV0CeIWVvHofVTK3tXhnsEdxM2As3GS4eF/y
         uJElD8I4XEowPkTta0Ykb7TNNprecXYQCsOCAJYExl+hwmrSkgD6A0s8mOc706OG87mK
         L24UQBZ/l4wHePLBc2o5s9mPkmwGj8m0mG0/hI1xWYQ2CQHdytkL45hXlzEwUrUkUM0b
         IA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327813; x=1736932613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+lsaFQ6qjDO50EbBx7FyJYhCbTrcZAazW4ep3ah4bQ=;
        b=VdDzGAuQqodVjR4fzcDxPsrwEAw7y612ieuHrh57Qh6REtfsJz5jUiLmRGcui2V1qp
         oOjDxwFvw5xOeg1HaQk2haStTczOvoT4tuacxvGW/uD4Ml8DYcayvG8ERxMSnFz+oFNN
         +p4QT+7JcAiCxuv6848VQ+T1YPlB63xpeSTKILFpzP/EVlH4etFmQOeWSTtD5gphCsW+
         8ke9Dr2CK2K6TXbHp0SaLyQrsaflp6GM1bSzKqrNtgQwxEaMvMO79jIPRM517QQA9vWL
         C3TUXWLRKChYEB7yHa/VHEfHKbth5/+IdKuxQ9qJ5Hrh3NIS1kwvL27JsOgrQiOfQbvb
         CPjA==
X-Forwarded-Encrypted: i=1; AJvYcCVubCDHSG4K9YDzk3eT9v8xUEPgSIoLtqwLSglKN/kLiDDRd+LwOoD51ttYAbD/x50JY1RnFufWufhx5e6Xyx5r@lists.infradead.org, AJvYcCW4/8Yg6oDLdOIAhBTVYKHmWpleB9DfG8Q9LFZWNcPi8naX9tVDVIR8N6D/yLV35I9mzR94M3kiCoMYNz9JNSM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqUzV7OYm53EELVLBhKgVE3qWrDjj7hlRYBFOGub3DNNeyjy4g
	ckEx6JCGDFiTiBvuC6AUIWC98ibO8h6vMY/UYUHm4ZTLM4bqFYJie/ZH1Yj+FXS2y6VgGkMQW1Q
	HuZ64uzw41tnCmJV1QgI/0/wEUic=
X-Gm-Gg: ASbGncupbLCs3LJSbkY2sQTy7eqd64twhSxBZlerz+ZVTS1+dbGELXF9qjHzp7V4SGn
	pWHDOBS3Kkm7NqTB96fYqk3cpaQSD2i0UDKwz1AuZMENFEJWDEA==
X-Google-Smtp-Source: AGHT+IH3iOc2Myq1ZFaIa3sLIrFF2t3w3HdXbphVO11vWiGihfTl8kdvLLfGeZBOO3GJq1a+M+hcUjbLLuFVFCQP8Aw=
X-Received: by 2002:a05:6a00:4502:b0:724:f86e:e3d9 with SMTP id
 d2e1a72fcca58-72d21f64f72mr3418520b3a.14.1736327813534; Wed, 08 Jan 2025
 01:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com>
 <20250106-rk3588-h96-max-v58-v1-1-d25255f851fc@gmail.com> <n4p5ixqoqm6innjzqk5wlcugok737f6yv2zto2sdgpm4ew2bhq@3bhqk3mkott5>
In-Reply-To: <n4p5ixqoqm6innjzqk5wlcugok737f6yv2zto2sdgpm4ew2bhq@3bhqk3mkott5>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 8 Jan 2025 13:16:40 +0400
X-Gm-Features: AbW1kvbaaglzhbFnXw6JwID8AFi1sMusKHWcifZ0v6WJbwKA_uyX39-6rXdPIWo
Message-ID: <CABjd4YzZ_uf1J9ARxsuH161hfM5F-mRxo-f6DcUGZHAoi2WLnQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add H96 Max V58 TV box
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_011654_322627_99934A23 
X-CRM114-Status: GOOD (  10.53  )
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

On Tue, Jan 7, 2025 at 11:11=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Jan 06, 2025 at 01:07:17AM +0400, Alexey Charkov wrote:
> > H96 Max V58 is a compact Rockchip RK3588 based device that ships
> > with Android and is meant for use as a TV connected media box.
> >
> > Add device tree binding for it.
>
> BTW, this can be written shorter and clearer:
> Add Devicetree binding for H96 Max V58: a compact Rockchip RK3588 based
> device that ships with Android and is meant for use as a TV connected
> media box.

Thank you Krzysztof, this does indeed read better. Used your wording
in v2 of this series that I've just sent [1].

[1] https://lore.kernel.org/r/20250108-rk3588-h96-max-v58-v2-0-522301b905d6=
@gmail.com

Best regards,
Alexey

