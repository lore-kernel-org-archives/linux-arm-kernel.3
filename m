Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE584F54ADA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7U+uS9u3k8MKiXu31MQXeVeNe3hExuIgcOumm3duMAE=; b=Q5YGys5KYFbHRZzM6a5D7jtupP
	JcYiGU/vWkH76taQskzQA5Q3QgPp03+/vqUSyMnVw0WxqqNuVCpHsKOPXxyrTvzUHEtR5zwQb9GYh
	Ee7ynU+Er8i5W9mfmYlNvFPLmNxz11bFBMSoSlZvH9be9a5lavSOxKmjjrLui2lRLRGO36HK7ksfv
	AYup6FT9ZDI+ph2Q6l92r4p3WiLx0Wyznwtn/+az0B7a4cprhX67cgwolcT1UgKREQ1iCOEMDApo1
	mnBUxz7drqGtGXN5gQhvIU2VoQ9Bfdt0/qi7elB8tY7BOqnxPMwFgq+kJlGOgaO3AJt192NzdLmSZ
	DX0TiXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55CM-00000001y9g-0OR1;
	Tue, 24 Mar 2026 17:05:46 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55CK-00000001y8b-1JMp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:05:45 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a12c19affeso158582e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 10:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774371942; cv=none;
        d=google.com; s=arc-20240605;
        b=fT9oC/2OxEMFbFs6mk3pbQkULAXLQUEwJebrwyY2XKrp+fM1Lsj6+y2EBsAlNOWiDP
         xkmwJNc9yULNzWjNi/kCYObpoFg3+wmJ4i2tgeopK2ujZsR/eLAi+ZUWq1WeoabDQsqp
         EMTSO8A3tyKISEVzi46A4fxzWf/Wsfi+wgxsztHxbnzM4eeXtLT08jTQN3yE236U42Ge
         fThqt0tXYbD6jpfcJZ7rnRncUnDMhIzXRGwFElMoqWUNAfT4KJ3MMkFootd7yvfuqizg
         YvUzXsl1iZ1xTQigYrpAwZV188uvweWqFhnKoEin8t+Eb+Z01IIgrT6kU478LcBM8B3x
         ED1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7U+uS9u3k8MKiXu31MQXeVeNe3hExuIgcOumm3duMAE=;
        fh=frsbbTdzZIJK5ZrNFbKZdLMGJ+hq1AC2+mButSl07C4=;
        b=JSa5uLU2ZVKy5xiTVb/kywLNG0x4foLo+NOH+RhnAHSTXFSl86TJ9E23vBCg90q5M3
         ftETgDZPSwGKIH1dOHg09c/z1PBtofx5wx267z0VJfsBtuU5p16lvW5H3F2dBK5DmKH0
         vt2/QHaKpq1suqbfHVCrScpeZ+MM5c6r2hxdVKzFyA9u/YEJaMlYZ4g2Y6OKmMazBoOS
         TY3V0B1vpVFFynpGbLK6is3FIJJuzA/otVibHsCSrvIP0WzI//3u2/atormyzu/hWFMl
         aP6+bSF+Y4DMh3OTiNMlFCqZL4mbP/2do+Mr/bo3dkjnFNPzi8ajcI7PXyGGttVY78bO
         FqAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774371942; x=1774976742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7U+uS9u3k8MKiXu31MQXeVeNe3hExuIgcOumm3duMAE=;
        b=SIJ3bPgieq3lKlKKJ2t5LtmC94oj5l25nbD57LA/AbOOk/nseFJTt54E4beAu6DGSP
         qRtojjy94K0B4N4c4khj+NCUrCAW785tZEkwxdJ6Mm/bv0Tg9CJCpHDi0f4rNbjqsVX7
         BM6YJJGmbyhQteyqeL8ad76G5qzP/sSqGMadqvjkIuMgqDgj0wtM/WQmeTENCmQ/fZuU
         dECK989CbrIJZGp4xWUf1Uxt/rsCJtP4QlRbvjg5mX357kwLhN9maqe7T9oCzEfSve5E
         WNfbMHvOsHgyku5IqIC2ywLEQB5RCTKeeuwabMMMKBSn6Piu5T0QtTP/MEQ2tSR1Tl4R
         9YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774371942; x=1774976742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7U+uS9u3k8MKiXu31MQXeVeNe3hExuIgcOumm3duMAE=;
        b=U+faqYdTgVQ2Wv+Ya9lyvMNikejmnV6RDxe/wnQgwwYG0P5zBICdWvNj1tje3vSiLB
         pofDqwhvW0jIi+7Lhuz8tS6ItnIAJnVY6qA7YP6YQzH09Caff7fjp4eNS1Q/1hrfFFhM
         3se1bxol/CbnfNJ+U45y4yifiOXLrzQmUB79CDO+4KwImLfOFGtRirWFcfGToh5pLNtV
         YQ2NEnZPniBhoMu0UY2+g6u0NjJv0QxHjoo5mbFHXde88PFUaon+6vKgE1KQrVAVajKD
         0E7DKJ9rdtb3OAJMhQHUjI+TH2z5tAK1PkZ1SRk4+aCHlpkaDlfMz+Xz1hAgHKVFRMyS
         6y4g==
X-Forwarded-Encrypted: i=1; AJvYcCViZWrMibjCNYBp7x2QBxPV241ydVDMTWebXrhgjzVznz3t/rhWNgefekXUubcpbWUn9NtzIdhHKDhlYhBgQGHn@lists.infradead.org
X-Gm-Message-State: AOJu0YxOKjAova4bJyOyK/EZTTuw54WqRl5xW4NSOBbD0leIrXfNPeWf
	PpDqGzbv65Xb6/rETU7fzXlWcvM9+MvawfsS8eCqmbOan9klFfTx7J9hftNU9aK28mysieX4md1
	0nvifGYOIMuBtUJJM0Y/4JWW+ZOcTiV0bYw==
X-Gm-Gg: ATEYQzy4fnxis6bz+W9DTYs9PVONlCxixPJIz3Srlomp5h8fWOmbbDr2yehY7OIvB1g
	+A9pWKQ+XTTNTbfvEax8T6YeF0NWxXQ3EwRWFvJihkVA++Ct/jGjw5+Hxab96CTMrBAHcldDZyM
	wKwUQUK/NUBWT78vO/v7b7MS5Mmze8lbs1OkZB2pSG+3lW0FP6z34lN4MrSOjf+EIfzLQI2yVXX
	kq0A6NHgLnp9Z8MF0V1/qFSeNbuRNX8wyJKNdeOElDdFCdJ6fcTqJ/aYZcdyglAOEnZrfH4y3TC
	qtRIA++DwYqwwpaLA3LhpJcZdPdDMFKj8dyMg9sN86elocPYT8aHaEAFGKiET3xxZbayvOZy
X-Received: by 2002:a05:6512:a85:b0:5a1:357d:8d5c with SMTP id
 2adb3069b0e04-5a296217bdcmr1702664e87.16.1774371941838; Tue, 24 Mar 2026
 10:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260313131058.708361-1-festevam@gmail.com> <177437057319.780275.6126712599317976655.b4-ty@sntech.de>
In-Reply-To: <177437057319.780275.6126712599317976655.b4-ty@sntech.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Mar 2026 14:05:30 -0300
X-Gm-Features: AaiRm52B2IjL4-VNNNNf6qbXItPEmRzE8Gd8zkY8yJVdgm6pvTVEQP-i1uoWhTg
Message-ID: <CAOMZO5DnC9ZB1w51iHQUmmhhAs4RSy=B__Es4=zgtfSvbCWEhA@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shawn.lin@rock-chips.com, Fabio Estevam <festevam@nabladev.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_100544_370175_718E0D8B 
X-CRM114-Status: UNSURE (   9.81  )
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

Hi Heiko,

On Tue, Mar 24, 2026 at 1:45=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:

> And dropped the watchdog node for now.
>
> Please resubmit that one, once the watchdog compatible went
> into the watchdog tree (and drop the status=3Ddisabled from
> the wdt node, as the watchdog is not dependent on supplies
> from the board dts)

I'll do it as suggested, thanks!

