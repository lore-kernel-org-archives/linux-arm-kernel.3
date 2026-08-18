Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDCDC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=; b=IjZ3PgD3qDHJVvVpAxjPUX7Wor
	LkkzipToM6SeZWJqp+nt/MMBBW1nda18rjTrA05QrJIqj96Q9mBf+v2tzYtkN2awhpGgKUabZHgjb
	m0NvX5yw1buMBy2zZqhFgjqXKMoNynN7vWY4dkN/e4Kpb4qRHfqGpYzNYCrmi3S1LZiVaHRFug/3M
	YAyvF70+JsP2SPoQr/9FsaUX5FnsXqmmSNJ3M/keE+ddApjpINvC7JqZ+2ADRBgZGCaxluXj53wBA
	bNMcr8p3bjWhw+L14a3qKRezR8m96Qw6WO9HThmqDp6DxEpQAIRPAI91ay4zc7ssr4tQNx82ynwMc
	JgudZEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHdN-00000007oGt-441Z;
	Tue, 18 Aug 2026 11:05:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHdK-00000007oEk-2ZZK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 11:05:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so56219835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 04:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787051129; cv=none;
        d=google.com; s=arc-20260327;
        b=FNfbtrSeG5jUjRJwxtlbFNiWyMeZevLF24BuWMF0Nn+/+/OUklNUItgKmbKfYalQqF
         n9gIV9BGj4CRe6xpP8E7DZP/QrlhsYO3VLrD0Pm/qPUrfB0WS/3Ek8fmqqt/s8tsRxwC
         N3kk4sn5srqZXzcLg80c6HDtAMrP4We09803PnZ6Tgklxek/I2+I1iC05Mp21k5apEX2
         SfwbzfB+PxPUBXUpTD942JYEnt3YQxmAkeQOAVp4NnBxf+JZGZOmmBAr+Z6MeH6QdF6y
         sw0jMYo9QLL9ptHU167CUxrZe+STC1Nn4lAoZZh6yflN9R1vIYy1Ae5FJVQqu2+fKBYQ
         tbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=;
        fh=4z/LcOqChH7naefldx+VbNUGSETqQoPZJBB8y61VICU=;
        b=kg+TURIm/1ufPyc8/2WOp2S628MTkAi13Uzd9teaohmQuppfUR7yHB4ON2QxoKFqeq
         UlkPs3vcc5Yp8zI3ZvuWzObUYdRCQCNOVAOw60Lt4ErEjXKP8G5l97LIw2GaD6odyvaz
         WjbLa2UI5LGETNwuDi+bST7UbMQQdLEexHYf2oKs7Tm4nNTqotP5ftJYqBrS1ihpbKYA
         4IILF3E4v3lEcrifZLVB0XBGMmFbh/7u3q3C+Nw5uxdZ5OJNhF7FCNpNV3rU38j23cMU
         92s1zqSk3si3FyC2KvmNyb505MABA2QHq+Xox7UWDBHo5HoB8kkKYWnNNQlPUpY4fWWB
         t0Xg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787051129; x=1787655929; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=;
        b=XVdoawZqCFaOS+c1+UqOwI6AzBTJp1YK4KjOznbc7vgHt7YGTgcitkaBNC7P9VXQ+9
         BtDu2fYVPq1Kg2YuAhyDVJym5vrK0MtPjw2KJWyhJWejRuG2PrQsGbbOHcoe/jtz1rFv
         OULYwv6lc1L0q95H5L1LL8YQa3Pv/DUbRtz5+Pq5l/MCalJj9Bvews8rN05FxjqUva9e
         5cNUgNOq8Td1eUxjy+2V2QSCut+yg9CXRpbvqrllZ2isDh0Dcy6rkC5nc455GcrmsUB/
         wN9rYPUCg/KNBdjxOggvMG794e06BF0Yw33ARmq5XAYmePzWMBoUysCDqc9SaEewgh+l
         bkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787051129; x=1787655929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=;
        b=MqETuKQbxHvDCtKvvyUBMfTwNp5r0Nibzb5ibyVrkmIiOg8HqbOipDO2sg2yoYewBz
         OqLnBabCi3v9TcKO5GhWa08eYdC6lX0Z/rsUVAnq6qJZi3xtrrxiEN31YwqOJeVYEAjy
         1e1I0PgJkeuMoYao24T8iwPW44Mn5ny63epLPd4ecx91A2NHL8OUW4pQBANW0CavycVv
         nAOJ17OYzbeppugDSwLe8Robb7m/uhgkTAgNX+YMyUC1IqPlMAKXNFGCu9Eswpfd2dYY
         3t50ivYNRb0hB++RQDGnE+8YeOzFJfADiUfHIs8flO0kHh252nUV9N22YTB3zKtVeiRh
         +/cg==
X-Forwarded-Encrypted: i=1; AHgh+Rp88/OmBvbynNZexdXU787ZfUNA/P1Ids756AGKueogT2Z6SwWwi3Cf/t3+Eqs8K18Muwz/0W/pXuVGLLduYsN5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx4VLhxPS6uiUcWrnmy6tHQavxiW7F/t0MczK7YblQQwxn3zXS
	JspzkNz6e3igo7/0VOQgCcz2+Cow2S+h3BTRWHYUKjZ+0JZgcgMsJSDO6lOWF+cOALB9S50AWs/
	4Es5VI9GwzPzRm91/C39ZdiJSo5w7yVI=
X-Gm-Gg: AR+sD10ZmJ6cyIZ3GVNb4SwkBtER/8Zs8zuRlnPikFNT47AipXawrSIcdEH95QenWi6
	VKVmx8oDZ3LOaIoFC+/tw4DaV5G0H+AUqdkSKYa2OuorRiWDukmayzqMo7yyXg0EkGL0+djSxPJ
	uFf2ELcYrIFtk8EWCNBYZv5fr2Jm8XiiVcpSNRHoUVnokebzl2Kv1h6cO9qp/KtuX/C2t3/tj/m
	lcDFl4QLq0xiRSNlC+++a3OdxmS/yKsUwMQKlu006L4cdXpxddQEYNalHReXe8cPxNVExd3oK7E
	DT4Rzb27xi/fE6xXGE5cAzsyamwwGa/n+N7e+xoGXOr0197oNiH0PGYiYOg8r9jDLRypEa3PiXE
	fkxTE9070RIkMFKDotc9D3VhpOHVJGHqesHbiKBs39mKJUm7GlnI40Mg5Gh7KHcrlfue0
X-Received: by 2002:a17:902:ebc5:b0:2ce:93a3:c16c with SMTP id
 d9443c01a7336-2d3b0c67d8fmr411073255ad.12.1787051129625; Tue, 18 Aug 2026
 04:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260817113249.69252-1-phucduc.bui@gmail.com> <109a59a6-0b3b-48af-a274-c6a58e5c7246@intel.com>
In-Reply-To: <109a59a6-0b3b-48af-a274-c6a58e5c7246@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 18 Aug 2026 18:05:17 +0700
X-Gm-Features: AcwNN1VRMmNaNH1aGeRP_HutF8udUVlQulWPHS_o-R-KQv4XRkLCKBfpTC2ozPY
Message-ID: <CAABR9nFdeXvEM9zVKWN4o3-fX00tzZz-YOoGo492yUJ_ZPJ5ug@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: mt6797: fix wrong unwind order and error code
 in enable_clock
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_040530_664842_A6B13237 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Cezary,

Thank you for your review.

> Aside from my comment regarding mt2701, this mt6797 series should have
> its title updated:
>
>         ASoC: mediatek: mt6797:
>

I checked the git log and followed the titles used by previous commits.
However, I will update the titles as you suggested.

Best regards,
Phuc

