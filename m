Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8980C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=; b=olaam6Qytp3a3aid3Qt3tJYHzJ
	rpmnchupW9r/y77p6WKyHuoGwaTgeP8tywQlsL85XNjoPJTU3S7U3QRqF/KUTuojWbj9uQOG0tqTS
	R5Ok6NfpqrmZvtJRNOzi7qyN/4XprRAR3XS0kiW36xe6MHm2Whd7BWK1rNK1dxqM4ddWjL8E6jV+7
	nwZqFkTkmtBWrs4PF2zzvv6bSHpJyflt3lLUUkJA01zAcAZ9SLek7ISzN8KzppQZJSts7zRpw/IRZ
	r/fKtUDN2x3WnX0zZoJEBJdSHoUXems0W+pQ87+BdcuqeABv26tQrknsmLJLhxdErKZUYRI87kBF/
	NGQHz/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xuz-00000008yOz-2G3b;
	Mon, 31 Aug 2026 09:03:05 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xuw-00000008yOM-3mQu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:03:04 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-66f79f58123so609452d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 02:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788166981; cv=none;
        d=google.com; s=arc-20260327;
        b=O12P9qIvwjgcQkewvBPGwf+WMBSMKnPUS6/uOx3xcFhleqJavBE+U/KUh0X2QzrzuW
         rXG7l0KOJlZD1otIPKzM95EPHbAV4CitTrO7Bak25uYbQFnaq47NdeCwB+qTdDe3cd94
         SzTROrfSQ10H80q8NNm49lwUcF5mXZqTo2HDhiyxZI7K60xQ5tOKo6qmMdPLi22rxfnv
         a6Kt9E28/F46rwdVVA/z3XOqqumSsncddq2kiuVceWbStoxxJTNKqsQMmPTWcGPejuZ4
         PMQW2tzCUsO7ovxY47fjxkWZfTTyPpfN7wJMBbEh+0u5HTOmu4m67O4wZCvcjaOyQf5A
         L2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        fh=wugPlKcrdqVtgDDULQHGreawwCoNjzGvf2v5aAMGz7I=;
        b=JEPwtW1w1A1Ydmff/UwLVoTqBKva7RWKq3p7ihud0cPyaT2jJ+bUjEhFLMLGqo+4cI
         74Lkcd89mUolEWgsqDMBDs/ORz+/61fc93IALqfig/BGPCG/vHth5QCQbaEhEO9Yq0h6
         rsSo92V2GzoQdOgovXbRnasQpYrIjtyt+WE82JKgCNT/DOg7ii6pONEaUQs+C0HqSGlQ
         AQclXbKHafTRZV9Ro+oGRlI5pIAm7wcZ6on/1Ez1/aJp5XTCmDccut0k+uZj2UNX7can
         FgnQ98XcfoNDSBlXB7//0oVHxd127zVlgLkTQMwdO7crQx22H+AMGgq3LApxOkX9ZLus
         qzPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788166981; x=1788771781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        b=bIpKO5Yp+6zcVFtcAAtiGKQ0at9QmWGSQKCmtTOCsTzNMoce9h6bzrkwps0DOeSsvZ
         rw3nzbvESodOM78uEpmFj19tLjhMsfaoN1adaXSwUstAjUpRFYWJ4wMGY83j6mxlYGeM
         JK1l9lEjV9LUQwirJPj4aPgYSO5FgavTlMKfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166981; x=1788771781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJC6+3Z9te5tWmjIrgAr6jz8Uxtgp4B6abtI+nY7s+0=;
        b=n0bRizOJNFZXG7fT7dHvNTYriLprKG8OIRDxGPoesj9fwCs+QVXnC6+iR2VXzgYSTN
         nA16toEAx9Q2JDDkJodrrnVBy0pHDxPVuRi47lSA6ZJ0zmugRSZSMlARrevmepHddfga
         6IbDIWJ/EDHEfQPxWwBUTEVWNdg2RIHxycq210O+9Z+ln1DLgikaAR7/y0Y+HZJLOnaz
         UBBrFQcspJCMO7ezUatGupLnalxsD+HZa5XN+Af4pI/8gne2jiTgruEDpOqvvcO8dopL
         +QeP/jBLVpJgxSVBSULat4Ys6A6lsIGzHzFy+5zH1S/hcNDlzP0WT2wmVKNMGQTPSH/9
         NO5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxa0YRlqGP0jA6qvHKH1X8HPZNeUvW7epGoBlISekH0AdY396PAeVh3v0PkZq9Gkunl7Jh+R+7OgWLzUguLkOra@lists.infradead.org
X-Gm-Message-State: AFuF++kesHUxApxanzQZXRhu+TilgZflVZ61o16NRzb3lk7SnYxqO+Ub
	0GGmGTbj7J9fPTczT7blocdEpeCkQZ/eTtIoLW548wvMPVxMrlXgpdPWcofS3tp4JjcUcrUIOw4
	jf80TO51nOgsmQfbT5wn1Ausnf9MS/rbI9LldxQudtVeaNvtEBS0=
X-Gm-Gg: AYBFou1JYWLc2nTwnUjbhtQ4Eemk912qTucIEgiCuKT7T41iq/yZv3Ru59lUII94Qnt
	FRluS0mkCCzvLKAHMfCUiqoemwxY7xkmAAZuX05U8kkrpyuN2nSKn+itDeIfdcwNC1bNM2RZlYk
	9yaQQtolF8wmufitz5/SUX2iYM+02fZlo0VsqML7c+f0Q2/s7sqFMdZPyGV9UDZvX4LCchOLill
	e+GFYEOmEHnmo9NcvrCRY6UM3R/GfP2XljRHZk2OZKy6jiiGk064YKFcXjMgFRyFyfHQ+65cf0c
	SfIuH+M9Lxqld7iAUD2s3VqBd9mNQqWozW+BHbOTj8/IpniZ4Ha5OsrcGMxyELKAgQ4/iwH2PQ=
	=
X-Received: by 2002:a53:b9c9:0:b0:66d:289f:6498 with SMTP id
 956f58d0204a3-66f814d5729mr574191d50.36.1788166981090; Mon, 31 Aug 2026
 02:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
In-Reply-To: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 31 Aug 2026 17:02:49 +0800
X-Gm-Features: AcwNN1VqX8uTSrN71dAKaA8eOGbgkkf6CrhjupqKO6wVb7uBj_O5pF3ip4I9SqE
Message-ID: <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_020302_975617_DA585AB7 
X-CRM114-Status: GOOD (  14.38  )
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

On Mon, Aug 31, 2026 at 4:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
> adding a depend on OF, the following warning is triggered:
>
> WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
>   Depends on [n]: PM_GENERIC_DOMAINS [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - COMMON_CLK_MT8173_MFGTOP [=3Dy] && COMMON_CLK [=3Dy] && (ARCH_MEDIATE=
K || COMPILE_TEST [=3Dy]) && COMMON_CLK_MT8173 [=3Dy] && PM [=3Dy]

I guess this happens on COMPILE_TEST=3Dy with !OF architectures.

> This patch explicitly adds a dependency on OF to solve this issue.
>
> Cc: stable@vger.kernel.org
> Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks!

