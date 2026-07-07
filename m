Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DDEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=; b=qfPVvboIk0uUEQP8YR94P+n4gA
	fe+Zjps1DB/5A15t0HrUF2uq0VGfYvsjVaLK5L5jQxHhDZbc5VB1Dt1GOLVZwZQEkJc4G6sdu+7hz
	CZhpwm0wDS2z05cDMIntT76bYqzuh7RIxnF2j6Ynymwi8HM3jmiDybEiOFGwq52OlH71eUZNxRj94
	Jq5OR2nMecYLFq3XrOmciJVU42IY+sV8znu/SRDHZr+hdfdWJGrvUZryPf5ZVXyMYVMRaRUi6o3DV
	J8PKp9MNpCSvEheMRl+8omqR2xS0T3iGdvcM+pTJoky0J3+cd43PKPOJOGWDh7peFXeDPcU+jpnAe
	d77Xjb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBRm-0000000Fl6I-2hW9;
	Tue, 07 Jul 2026 19:27:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBRj-0000000Fl51-13S5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:27:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2caced6038eso13286585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452426; cv=none;
        d=google.com; s=arc-20260327;
        b=HFPgsFtAh1SH6PKcQvv4TwnsdyKRmfNvK0NBT3MYmek7fJQnbQkvXeP3qbtu/Kqucx
         WOWgS8GYghMih/YhXgAJ5Efir1wRypHheoRB7T2Gnp7QJPGNXUIR1QDxQanvloY6a7+F
         PjfxC3bgCvLh2zFuXHbTdaqqmvrGyAk8DQZYhTGoeyY3IevEUsEO6JKAEp+ZhV8nEnIc
         a/nrapfbIYwQshB9cCnX8t5HsmySCqKm2fWg4FjxsBrPuyxXdfG24Mijy64Ydo9CP/+W
         HXwYMUNayY699fOn3DEBKFzQoddiLSwLdLjzcuBGkvuJ1fzW34vR5cfocmUJ+H+JtU9G
         L7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        fh=Xm7K+D/EH7Q29AdGVzuB4rp1NzerAsmqbeNinJHqbq8=;
        b=lZXIX9M1yuTsFqaA5+NV/ldLEi2/XN5WHCXXyLh2f9aH3Y4ly1vblHCt1ld77RnkIw
         MaRFd5U1TwD/xFhfBaNmIpPypYuSjw35P0jmeA14+m3S9Glmm5ypP/Yg2mBPRoEWIfDk
         oc7SpKPcv3TI6e8HZtJ9RxCwtCjLfedUoxuAhRKvNK7IUuOhWNm1DxHqPXctFjGCFvaZ
         3rbLIGPpbfzBXDsMK83LVatWt5GULlWSfLGs14uALz7ZNgQkeOS9aPx4khHGqfCSamIO
         2RK0CTQnYbdybC+xLyoHRU/HYYuK9dMb0gkck2bUQSSzSot/ebPHBY8gNHYFqenLCxMH
         dzIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452426; x=1784057226; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        b=j1ad1LKOG5YZSh4a6EHjXdFv2J5SMFblXNjCFe6NYn63bYmj3+cKo7MkJAa/sBxpZf
         mXFVBBzcEjAArOEVxn2satNOcTNqAhSEhd+MJsngx1MTcp3zhFkAODD/GlVV9ama70se
         1cGBQc1Wx39ssrgnwqhHeAae/MtgPkIHVzi+cTYVksCMlXo7ITXHcYs8pDF3vvvTbjVV
         AJtrD00MAhCBWUEMPtTQzgZA7gRMnzixPsu+DzWSmpI2p/NxoKwXct3aQkQiaaEyYM1W
         2YwkSE2Y5ifwW07tDtSXFrGYYi8aCG38O51ylV8nkaJAp+0RcR3MlFQOMGP43OR9Y3fT
         tnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452426; x=1784057226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgcC0RVl6Nt6QPS0xW3BWvWsGBqEPSdHq4xCHzzbh+E=;
        b=skeElsf2pRucogLB8ICmWpZrGtsR3oio9BGHX+ms9jyXb9sZSiT1ZDpj0CHOIvYZQa
         AC1Ab4T7wxwot43wjWYI6ttYHvluYZNDX7MHeGyop6ktzHrDzkNtlPThA7gjNaXRCu0D
         oUXGISSLAE4P06jkYwb+8aMxkqelubSkZRbJxUwAYgpI97jfLIGAJenGyvEG27pR4Bn7
         jrvURLE2cJ4iIlrteL060gr2wNSEg4S8LAPS+nfpevboiVpJKeBzIHP3IMDYHhsBLGV7
         YnB6kwQaeHEB4coE3m0lopGyQNd52hMqrFYe5vD1ufbK7d92w189d4M1dr7DYDDzUFOK
         frAQ==
X-Forwarded-Encrypted: i=1; AHgh+RocAjYT2dkR8+J0S8YhSdQwGRJR5fQua51o5KeJdN/hyEJTD64Xmf1Xxykog7EZcWf/pnPHGtVaLAxtvAEcjFdv@lists.infradead.org
X-Gm-Message-State: AOJu0YwZXokjt8ZB2LOqUvt2vOxeOXBgS8kn4DZihQTonk2hX/sqFtrX
	RaFo/p12sCf03PzObq227dOZwgyOPcXQjBkftnmWbNiz2KZLfvRLjTGt+abno8s6qBoG8bu/PFQ
	2CuEVvYRUSLHfQ1SWSfSWZZl4a9no5Y8=
X-Gm-Gg: AfdE7cm7zdB2fqp9Rnh0y3OwNaPfcAYk8FEd7bCyA1bTawT5zi+yNCD21a9Pd0zmfCi
	3KHolkgZrNVMaIK37wsbibH4KyUDh4I364AMpqSHhRNC1Hz/kHy/JppkGnNqJ7J3VZSaIcufYia
	VyFx2+F/bN5Wu7mQMqu+iExTVaYO5XZFbS7B7RNeGdGWVoFVFquaKUSXSKUgbSY91oi57IhZe+B
	hV2eUNkIlPfq1/5zNEm58FDid5xGv8bPZrBKBgCVNTaMvvYNsy09SVCOOWPMQOikkbLypqLYcPi
	nQ/yk8PgfPvwKi2PBKpciiUwpg==
X-Received: by 2002:a17:902:e885:b0:2cc:841d:cd7e with SMTP id
 d9443c01a7336-2cccad9693fmr37869045ad.21.1783452426303; Tue, 07 Jul 2026
 12:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:26:54 +0200
X-Gm-Features: AVVi8Cc4p_QHwDWk0aEYAh_2ulyl2XezrYxvB4AQz2uBN1snV01ZmTjZPjn_E3M
Message-ID: <CAFBinCCv-pUivmW4_O5veamSQBApmTvbyGSrOBr14tsg4yf8bQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
To: xianwei.zhao@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_122707_293542_6415D221 
X-CRM114-Status: GOOD (  10.00  )
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

On Mon, Jul 6, 2026 at 4:43=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Document the Amlogic A9 IR controller compatible string. The A9 IR
> controller shares the same implementation as the Meson S4 IR block,
> so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
> compatible.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

