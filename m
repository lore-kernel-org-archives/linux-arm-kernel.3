Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9D7D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2L3/foWGq9pC8yegZf6IiDn+PF2X+eDkva4KX/VI9+k=; b=zjRhZP6WK55hKb
	kWRVaawWfQ1QJK/jOhsArt0lpAd5xdA7wlcVdaYxOSIMDQmQCb+DvN67QJjnAOzSnE2Zyfl3Tf3uU
	blVJuXnjxtA1ipItZ5IPYcKtAc9FfETcIaMDqaeKbgbv1583xQqN/LsBkqppHUB6DgAjvlHe8geBt
	u5Crrm6qMHWLxYHgymTE0+YTseU/A4dPXh+iYOWoaNFCC1orzGQ8P12VSjeYyLzBsut8HfdRfM/v4
	t2L346RQm9USGNvRYpoviQK+o2GtChY/BFJBc3UsHDIiPXyJfcL4FBldN4PC8E/s7jTT4UOwOaEO7
	Jjg6p5qf5taRO4rE4F6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lbm-0000000AABI-3Ze0;
	Mon, 28 Oct 2024 09:00:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KQc-00000009w8q-3aFJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 07:44:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2D76A4196F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62ED1C4CEC7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730101481;
	bh=sqtEmGyJxUrT/zTyDRuWnbONHCPX8v4B6zv0Gwkn+7k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=fpwY5iVlNZtt6cifQeQIfQZJ3OQBajKtiORcnnSCyAv4J44FKYhLIW3AWerJNDmZZ
	 ixBfPie5e/3CfHGnUXx/1UVWtEhDMl+ctYDfauNjwGhyQijTAnFcxHZOWITdIADP8W
	 p38kvDSQ7sYcU3TwC9MdIp0WvLbfP0aNHrMxLS+I0l1WzAzBz/v7F3vMF5rMaFaKe9
	 TiQu6orbq/522/kFY+Is0gdoGn4hxmjXiPJJiJ5ZHhxshOWJfdTwDlOEUTk8RZyyXl
	 QReH162f2xmbHy40QWroiZCTBu+nqWs1GWZhw2CXC1KEegkYE5APTLWiWXqvXMWkW/
	 /tO+YC/QZdfmA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so32719691fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 00:44:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1yVrMdN0fKRdwHB/9sRG18ULpjyEYmFER6hSLDIlxVqC6RymPMyKuoYqY5gGpB+rfIzULPiaVPa9vOUZKSkV7@lists.infradead.org
X-Gm-Message-State: AOJu0YxydL2+56z/ZLR3Tymh7wHhPFYFoYgDCfoIyUGSukPW111N7sE5
	3HgF/5b2DkGCcSN68aapPEUcBc2wfKGohrLtNUFzo1IBd1KWX1bxUnfV5Ae8JUqxAPaf+m7u/3t
	VWJDJUxPIBfZaQzTaNHawWg+++cs=
X-Google-Smtp-Source: AGHT+IEtwwtwCu4NZilEk7a5bhHxyxS236QhCQr+S/RpcV6NeWhfrwLpBXXtHddov7on8VB3TcEd5dQmDpKY7fFQcTY=
X-Received: by 2002:a2e:f12:0:b0:2fa:dc24:a346 with SMTP id
 38308e7fff4ca-2fcbdfbab66mr20894921fa.21.1730101479749; Mon, 28 Oct 2024
 00:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
 <20241027091440.1913863-2-csokas.bence@prolan.hu> <nlhsxigg3rbfvua76ekmub4p6df2asps2ihueouuk6zkbn56zl@xdj6jzzt4gfb>
 <b74dafed-197a-4644-a546-54c7a1639484@prolan.hu>
In-Reply-To: <b74dafed-197a-4644-a546-54c7a1639484@prolan.hu>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 28 Oct 2024 15:44:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v65ZXftjrG9+f1_88=EsU7rM8vnOPZCszWfWYFQ+Do9Xsg@mail.gmail.com>
Message-ID: <CAGb2v65ZXftjrG9+f1_88=EsU7rM8vnOPZCszWfWYFQ+Do9Xsg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dma-engine: sun4i: Add has_reset option to quirk
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_004443_083562_C9DBFDEB 
X-CRM114-Status: GOOD (  19.93  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2024 at 3:37=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.benc=
e@prolan.hu> wrote:
>
> Hi,
>
> On 2024. 10. 27. 21:42, Krzysztof Kozlowski wrote:
> > On Sun, Oct 27, 2024 at 10:14:32AM +0100, Cs=C3=B3k=C3=A1s, Bence wrote=
:
> >> From: Mesih Kilinc <mesihkilinc@gmail.com>
> >>
> >> Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
> >> has this bit but in order to support suniv we need to add it. So add
> >> support for reset bit.
> >>
> >>   static struct sun4i_dma_dev *to_sun4i_dma_dev(struct dma_device *dev=
)
> >> @@ -1215,6 +1218,15 @@ static int sun4i_dma_probe(struct platform_devi=
ce *pdev)
> >>              return PTR_ERR(priv->clk);
> >>      }
> >>
> >> +    if (priv->cfg->has_reset) {
> >> +            priv->rst =3D devm_reset_control_get_exclusive(&pdev->dev=
,
> >> +                                                         NULL);
> >> +            if (IS_ERR(priv->rst)) {
> >> +                    dev_err_probe(&pdev->dev, "Failed to get reset co=
ntrol\n");
> >
> > syntax is: return dev_err_probe()
> >
> > Best regards,
> > Krzysztof
>
> Thanks! And regarding v3 of this patch, I have `clk_disable_unprepare()`
> after `dev_err_probe()`, I assume I have to let that be i.e. not return
> immediately?

I suggest adding a patch to switch the clk API calls to devm_clk_get_enable=
d()
which handles all the cleanup. Similarly you can switch to

    devm_reset_control_get_exclusive_deasserted()

for this patch.


ChenYu

