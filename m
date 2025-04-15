Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE0BC369B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuiknlKiSA+WD7K8fGty1GjBqI96wU/H/9BL6EACW14=; b=hPWJPXYybqQRXKvrZtkUMqEc62
	9012kytiMTNel8GAfa0TBR/aHLv47fWKZ8N65eMLuTlMHQlrsAzj2Cl3H2R+2HT4f2nuUt/qy7GLg
	Isv5H9cWmAhmxn3xivSskzQSzvE2xQBYCSWdalRS2DQKTzzXRga8+qRvcMQTo+vgk/YN/rUo/jUq1
	xysbo7Rvtd50aIKEH4ja+B83MAlsczm/AdMUyROXVt7lWYL+h8KJlgA6eTU23Jb9AMb2jy5BWI8dt
	q4AmiScwh+gVRvIclL02hBBu+jkjk4DCWIYUBdujva0WQNzKKQ/PrCCov9fOIzzkq7rBiMbG9BLX0
	SoRDex3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bQu-00000004wtT-444O;
	Tue, 15 Apr 2025 08:14:16 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bDI-00000004uTp-1eXp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 08:00:14 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so46808641fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 01:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704011; x=1745308811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuiknlKiSA+WD7K8fGty1GjBqI96wU/H/9BL6EACW14=;
        b=nE2+W2uGbP9x3bMblBlojwZkmLC2DZcvK6vhTbY0aY4B7kICpfMzSVrOMlLqbRA+GS
         +yRwp/9z+WGQVisWeBWDuva8R/4stjsfEbh5PB8b09T+mnNT4uTCQ4I05ghCI6VZotw+
         e8A3VXU8zDI3uYggufRzA5YI7Wbi4cWGDHltVDghKleFLb6OjQxgapekfUwXzYw7SMnn
         95K3Jr1vFC6cnuKOLUMDHG3mhq6rsN+yP6R6iDBnMx4yheU2U1i0ANUiboJTKrgnAwYZ
         7/TGqpNkT1MWwi+Mo7lI6dV/4GEZV8mQ1ZwybpMmOzVntA6ZPKkJOpOPZeL5e3ctbgf7
         wNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704011; x=1745308811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuiknlKiSA+WD7K8fGty1GjBqI96wU/H/9BL6EACW14=;
        b=oeHflcGYr0POpvlqAEFdn9272iQRWSeIAZE2vmKChkM6rGdsgROAKfly/paX1jfRJz
         jAW587IaQKjTd+2G4vg/fgVOI61wyaVWGmghrp+ZeUi4WuhnlwU36xIN2qNRjmbR/wk1
         ol6WcJoB9LeYCpyjwVE1RnUw7iZcCXlcNDzzQCIyFyf0L8kwI+QY1nxpm1tx3KCA2FdA
         VTN+ceirA+IAaRadINl31Mr8Pw9kDxuHsFZuquNI3khM4R25+W8yIBy0DboRagM5DEY4
         4lRMnmUV7zBCU6squot8StLD4zZSATpHhnqHmrYd1D2tPDkA+kOXgOLynZKqY3pA5M+I
         DE8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9He1DCeOQZJ517vE3vT1OSNRrJQsH9bocqjCtNZs5mMv98wU2zeqRj89GlA/RwlBdr1iZKZWLC+vVu1g5VO2z@lists.infradead.org
X-Gm-Message-State: AOJu0YyCEva7SrmLPD4CscVpuD3KI7hhplteXK0ch9aVbktEg+wQDgW6
	mLPbhEDHJVoiUIj2R/TGYs3ER/Fyf7LfOI7vrI16pxvAlbMxsi+3Ku2z1lQtGoCpFW3gPKw/Bbg
	udhXwOYrnXHn1q+tXvcu6X+97CYOU5QkmAv4BVA==
X-Gm-Gg: ASbGnctNbf37D+xdFHg6T7f0ZctZ4YL7zq1Choe5HpZorYqarJgL+v2ZEidJrLWsWDi
	1Ss6i6sefbFm7HHRnLE3bY1UvTzKV2sd1zecbMTxNrLstt0eLgWBguRwUuIyp9B9iAihvMVlG1S
	1bni8O8mvEtqTnzhJOZZgLIQ==
X-Google-Smtp-Source: AGHT+IHnxXKT+pyd9gBpYCbMyVQZAO7XqVpYGkBSNYSVfaaSRz2f0QOsZvZ5bl34m2PPRdwZD5oWN80iP0qENOxIShY=
X-Received: by 2002:a2e:b8d3:0:b0:308:eb34:103a with SMTP id
 38308e7fff4ca-31049a7ff11mr54687661fa.28.1744704010562; Tue, 15 Apr 2025
 01:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250401135026.18018-1-ansuelsmth@gmail.com>
In-Reply-To: <20250401135026.18018-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:59:59 +0200
X-Gm-Features: ATxdqUE1-4C5Fb1JmQvyH7hBozN_RXpvZiZvSLKiPhH1VCoFIEKXbvFQJXlM6ls
Message-ID: <CACRpkdZdFhpixdhsmN=oCEmdAuabUpXtQ9RRh0cFRuxfYXJ0Ng@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: airoha: fix wrong PHY LED mapping and PHY2
 LED defines
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_010012_430870_7DD03C9C 
X-CRM114-Status: GOOD (  13.94  )
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

On Tue, Apr 1, 2025 at 3:50=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> The current PHY2 LED define are wrong and actually set BITs outside the
> related mask. Fix it and set the correct value. While at it, also use
> FIELD_PREP_CONST macro to make it simple to understand what values are
> actually applied for the mask.
>
> Also fix wrong PHY LED mapping. The SoC Switch supports up to 4 port but
> the register define mapping for 5 PHY port, starting from 0. The mapping
> was wrongly defined starting from PHY1. Reorder the function group to
> start from PHY0. PHY4 is actually never supported as we don't have a
> GPIO pin to assign.
>
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied for fixes.

Sorry for the delay!

Yours,
Linus Walleij

