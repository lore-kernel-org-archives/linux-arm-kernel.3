Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AE8C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh9PSGzU/M4S09lIfZ3z8Ixb0mf2rZg7R0cuTMmpra8=; b=qrgu9Ms5T9TidRsZ95XamYakL6
	6gw9aCJNNFyrGM3f1Z2BWU+1f2Xqk1mCpWJ1ZCEvlDUYRbs+sOsYI47o+cNgOx9PirHEU9FFenrcd
	IrLlt5n9ntkHfv+tMxVUG7BidDNRbYqUnXbJrFpNLopUchScOGiW7fYCQhvxU8YXIwEpnm+6w4Q4E
	+yzXW0TaCBk5WWy9Opt8Qhj2V3a/+C9OE35CbKAMZkZ7tSmQOZT1gIXcvNFVUklf8iwYUUr1Si65A
	lSp8FA1vO1JT5tFPlGgntunyztl6oZI8DRdRy9H15IW9xaRDVxau5SJu+IkdDsEPeLA8DSN17N/FC
	YpHRL50A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrE2n-00000001mwG-1o3i;
	Tue, 04 Aug 2026 12:14:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrE2k-00000001mvt-41qf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:14:52 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so1650752f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845689; x=1786450489; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wh9PSGzU/M4S09lIfZ3z8Ixb0mf2rZg7R0cuTMmpra8=;
        b=Lg8XHlWo2j2iPko1kHEdBLve9HMRdiA11yfEYvjn9hXsQsA1z4dRg0F/Tp7PgJBMwW
         AGI+Ld2Bxb621DZeaXNtBvL2VQiDHGme5z7m/mo6gX5wYe/g5Zy2ulbazWc6k0Lt6OFz
         yXYBmXeWQoiIDJX+nkxan56CtY7YnFzgzR6OaUYf4YicmVbmuhdKcAcTwUZwAW0y45ki
         u+G9vaE2/1W1Z7oRL8COHJxUEcLsvGoOj3VNB5rSvBoAgxHQfGSXHxneA10l7nMCDWms
         lUimHHYxVhn0vl2E4eU1ykbuKMo8uleaGxGBYPkZ6kjPOMWllMCzQ3CQspoZsCkvpcpd
         3vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845689; x=1786450489;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh9PSGzU/M4S09lIfZ3z8Ixb0mf2rZg7R0cuTMmpra8=;
        b=hXxRMbZgPKDMw/gq0opdNsw25iOZ9OF2/VKKOuNs7OS836vq3pLcQilHyohNkqYBd3
         q0ROi/HDYogtBEYqXQdnvBtsj+SLrffZ1Jf1lJGk/M1M3KytuKAwE2hpI0fVGThe/njt
         /gBtYnTzP+kYa5qDaMIY4xEuRgzhoEMoUV16YQ84aoY1KX4zMpCVft7thCwNoMKNB4Jw
         DCFKsaiy5b9hPz2N/P2LOnNWFQ18K6DsUhulMTx0FTgubERfihR/QEgl90Ur5Y3SG3CU
         2/3oJBpM6nUBmsAnFVLG/X0uZSb+IEaM07md0rFqWZF+N/krr7x2BMjibX6L53T8Z1mu
         Si/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrYZu9pHAUjwPjKUzyDqkXpopGKbSWannhkSaSEiQB4wBaS3LUFyETurarTJAx6vt2x6VDuUH70WhACLYmLkpyf@lists.infradead.org
X-Gm-Message-State: AOJu0YwWa0I6hH2DClXdqKw59EAcO/mDB7C7v7NDPeD+XS/JAtZdJ3Bt
	CebAos5m563elZ3zrqeft/MwSVjGsasBl365JsBnCmN4087TfqPb7m8kzrhiA48HvZBw/McJ9hj
	0JNo7doQ=
X-Gm-Gg: AR+sD10fDdplH0SP+1wlZFev2Zr2eVJ04RhsFdiFza77UOEj7+C3/R7PG0ciBWdcCt4
	HAgxilknFHV4s4FAQu1uyo5a1H+FTWHDVyjksF700p+mNBV1rN+r3W4IFvh6cbZmdP3BVDsBOMF
	/aTsa76k0ic+JQxjCsUjo9jQlEy3WwyaBrw5dZ95hVo561faQbhZDPDbvyWv+2bDtDJVVJcrtxR
	4M3pwCntx8D2VFPeT6JhpV/65c+BhYXqtTIdvtkFEKHbb7TTWnDdjgzFrq6fXpoeliUWtvB46AA
	lWOQzPhVPv/9Uo185PL9Bmy1mQjtP13yH5j6v1oq2pnbN6TAcGLVyEbdv8cgXgWVvAatMQ5dtjS
	JazGObnsEws6Zh6qlz2tLo3zBswUamSjB0kW0cuKNpxg5BjHz195GIKbu/7ybhvzGNf9iGOMtbP
	omEit1+lVzptme8vsbTDqZ2EmvmP6oAs6skrZrYHFK65uwwzgMqVcHQuw6RifQwyIv
X-Received: by 2002:a05:6000:491d:b0:47f:93fc:2d27 with SMTP id ffacd0b85a97d-47fd72f08f6mr36907224f8f.30.1785845689066;
        Tue, 04 Aug 2026 05:14:49 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91bfsm45894550f8f.15.2026.08.04.05.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:14:48 -0700 (PDT)
Message-ID: <6ac14ee5f61625e4254fac74d7e8894b3136e007.camel@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: Correct white-space style
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter
 Griffin	 <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 04 Aug 2026 13:14:58 +0100
In-Reply-To: <20260801210353.383880-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210353.383880-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_051451_004586_B91AA8A8 
X-CRM114-Status: GOOD (  10.03  )
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

On Sat, 2026-08-01 at 23:03 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).=C2=A0 No functional changes.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi=C2=A0=C2=A0 | 2 =
+-
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi | 8 ++++----
> =C2=A02 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

