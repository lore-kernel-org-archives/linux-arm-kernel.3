Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B4EC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNpRGIZi3b7vxWPUvyY23xmfkUDKlM0nIxV07CpFzTA=; b=ba9IKq2B0uzdOSNJ/YOGURG5s8
	6BKtPpdRuwXmd+Xey8LJEworU9uAx5M/o/FzCYHpnopSaWr4HCz0hTqZJoFtVyZduBOQwSX7nV0vT
	CtLUXhTiw4jg8jAv4MyRelLJQgx7jZivsa92h3hCPlQn5QMVQXyJTCnG2126QdJLFO8TPWKNDs8nW
	Q2G9isnUU/hYqhUbwQUIV2Kd6fQKYfBpLkrBPurSuYR5XrTMVPgc7RKI+XFe0geDFztvzJYsZoYbZ
	Ii5jWfCd2yXrBD6aHDsHtA8kF4TiU8pEHRkiMBiKv5/p4KD03qKpuxPy5kPFIRhEqwZz9KtGUAJWV
	i7aDKNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trE0s-00000000NUB-0bJl;
	Sun, 09 Mar 2025 10:36:06 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trDyU-00000000N7a-0C05
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 10:33:39 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so2644041276.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741516417; x=1742121217; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wNpRGIZi3b7vxWPUvyY23xmfkUDKlM0nIxV07CpFzTA=;
        b=rgqNQdxG7eYpjV0sJoo9vKnw1DwmC28XhObudhMb/Z489YJ+Oh0SfPGS3awr536+P3
         vZcdBUigRU0u+2NTyOkv1+Hfm80WH7SvSxQrK0fSaQsOYtuK1LOxoHdMbapR/RLpPf3g
         XQXf/ZHdo2hHDZ2Bi8pxuNOr5czclg78UyNn3wswSsZHBTQsEaoU9Xg+4JpBGYCvPVXY
         1K10QmzExiWOdl9oQNoWjldBENz91arLxlIuR0ziwAIR5SAY6/JMHinMPtn2FbnonLDZ
         XHS092ma4LfBRznjLi9lJrDCC2UoLuJJr7BGaqyM2NJHzBQQ5vm+tx+xuNzfMM1cL12P
         ow5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741516417; x=1742121217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNpRGIZi3b7vxWPUvyY23xmfkUDKlM0nIxV07CpFzTA=;
        b=J2e/ZCyYD2eUXOgfj0QB5HUmluOWJ8BY49q49Q+blRqnh+qyfanRTGMJYrsOMl1GOl
         6EsyTb0xMeZXcQvRO79cPMQoH/Cizt0D3YnsHT6z79SgnurOBRflYpM2xFvidv74C5TH
         ewEkU/KM9TPq16hWCPBzf9Ol3vxcR1Ahgh0WrBBFJzqIfxnXKK7n5gacGM1KrEmJzC7l
         UzQa5oFpGQmRy33acIswT7gCRnkK9zfGJli0OQQNawG5Ekd9EHFTe2jxwJ0qcd7Fxwmv
         1YXyP1fouqPW5KOpkpubzjvDXIhItgR4b4/lEyHrttt0+9pM3bDGK0CrveF70BTg24K5
         OgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIyaGS4nU2p7HZIqdcKK1JIVwmg5oq/xmETh/A972YpgFJxQSlBczMt9JrNtyAbOtmHXU5SNr3roGOLglPiQx3@lists.infradead.org
X-Gm-Message-State: AOJu0YwlgHTk0pooihiif6BO2YDgEkfHCKBIGaq2L0D7CXWMD62iQVAu
	aGxxUZNVwthF5+v0y/sEX5bBQiubZ+u8SUOuuZnhKNyuKvBE19Sc7boHwMIip8x/wtnQ8ZK2JiI
	btGd+2bN6BB07fOBO5bLNwBK/mWct/Np9ag9bzA==
X-Gm-Gg: ASbGncv4d4zSfin77FJZEjgajHcyHvTa7gyhrPbLm2o8N8z2jpdNCRchDoquTN2ecFR
	WN6yoJQe31zYoKcr3bZi5SNqiNRGk8pX87ZnzWvQceUMVrCslhE3D316m9RbdhZrEReL59fYO6t
	WVyDvNb1YiA8lN1cFopo4Lu3cCQ4Zj7a82Abobi5hIJ2RNqhzTv3Y=
X-Google-Smtp-Source: AGHT+IGVt6euUeWJaHel2JO0R3PdrFmPyg42bYFogZr5LdUenoAcHAoi+gtckgcA2kBzPh3bWUnzK1DaGMhNqPsRL9w=
X-Received: by 2002:a05:6902:154d:b0:e5d:dd0a:7fdb with SMTP id
 3f1490d57ef6-e635c19566dmr13607641276.28.1741516417063; Sun, 09 Mar 2025
 03:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
 <20250308-phy-sam-hdptx-bpc-v5-11-35087287f9d1@collabora.com>
 <CAA8EJpqzZaRoQ5mDeKUHpNhYsegC=V6c2SQpKaQn4FYhozQn1A@mail.gmail.com> <884acd6e-4936-4b00-88ed-cbccc10efc9c@collabora.com>
In-Reply-To: <884acd6e-4936-4b00-88ed-cbccc10efc9c@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 12:33:26 +0200
X-Gm-Features: AQ5f1JpGOU7l-kSySgvwGTxj7XdS5KAe8kqPUkQFgXHpSlPZef1sDW4xG8Fp1l8
Message-ID: <CAA8EJpqDiK37uLid2ap0E=Sa+DU9vOmSf6WBUe4ZeVKj9mVODg@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] phy: rockchip: samsung-hdptx: Optimize internal
 rate handling
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_033338_108655_774591A2 
X-CRM114-Status: GOOD (  20.95  )
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

On Sun, 9 Mar 2025 at 12:32, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> On 3/9/25 12:17 PM, Dmitry Baryshkov wrote:
> > On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
> > <cristian.ciocaltea@collabora.com> wrote:
> >>
> >> Drop the rate parameter from a bunch of internal helpers and, instead,
> >> make better use of the newly introduced ->hdmi_cfg.tmds_char_rate driver
> >> data.
> >>
> >> Additionally, rename the rather ambiguous ->rate member of struct
> >> rk_hdptx_phy to ->hw_rate and ensure rk_hdptx_ropll_tmds_cmn_config()
> >
> > Would it be better to name it tmds_char_rate?
>
> This is only used in rk_hdptx_phy_clk_recalc_rate() to provide the
> actual rate programmed in hardware, hence the "hw_rate" naming.

Ack

> Renaming it to tmds_char_rate might add some confusion with the similar
> one in ->hdmi_cfg, but I don't really have any strong preference here.
>
> >> updates it only after all the other operations have been successful.
> >
> > Please don't mix refactoring / renames and the actual code changes.
>
> Right, I should have moved that to a dedicated patch.  Will handle in
> the next revision.
>
> Thanks,
> Cristian



-- 
With best wishes
Dmitry

