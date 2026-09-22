Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF002C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=; b=19fI/Azr2X4Pcm2dDTb7Kj4+jk
	lMiT9REQF8k8YFeC1HrQ7PaV8pHV/Az01yAYzIDJ4ilnWLibUFYXi0ur/RUf0F9MnXxhkvImJuG5G
	RptuuDCjJvqCcq7Q+OtBu+guR3xtSvVBR/oSoJGVfwDqQaSYH1BSovHmt02qnIC588maMB6iBlnvz
	/HpKP5OfL7EpnbgjW8/KOKKOa7cFiPXitreb+SHhEmnTZjFyqsWH1qLdHsNZihyKw3Yq0D2KhYbga
	Q+jHpzwgRZLIb8sy5JdUzLPvFLI4fep5c0TYTxdqAtkFhcPHV+iWBRJKafo2DkCBb9ynnOCya//1d
	xfiggFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qS1-000000040sd-0xJq;
	Tue, 22 Sep 2026 02:41:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qS0-000000040sL-0uWV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 02:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=; b=NG6HStVvHw5RqcEtDflpI2A8Km
	WQzOUpeBPkEX5TQpN52uoes0h9XGoA5H2GbG8w1jYp8oYNtlquH0ba7rffSdwWMPzPed8/leNvoMH
	KxbsOoTTZE5LvBIUwqA0AmWcVvGqb8U9CIhrB5na8qeWHXuaY0lzrbZOZOkXThlLQ+AbjZPAJ9kal
	IB74nK1nDuQd3C7wBbqiXbS/nbhmAmXEsdvWShuZAJMOUYr5AxulcDpFKrS4VgIcTAetK81LbjZgL
	+DRC/wkSLCBgqkGGbbI4tjfwMJ2+aHStCn3W4y4t4wWW3caCtevNfkmrsWlgVw9krh82AzZR/xvZu
	5q/+mIag==;
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8qRx-0000000D1ee-0g8o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:41:43 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e56a1b327so2808893d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044899; cv=none;
        d=google.com; s=arc-20260327;
        b=nv2naHpFb9u5uA2pjmyt4dnj/wu9eXPInh7pFlFfi+9u7C+54/EXENmC6Eek8DMyBW
         50BF497aVxkgZaN8zIymqNc+T9EbrQX7GEzSSDqtSDl9utntjVEORrgMLjQ8OkbKimu8
         SY1hydUeYfNYBhIRrrjAMwKc1/bRXpwH4tkaIs7+AkcK4QtjHoY+NDZkle+HIW/q5CP/
         8OE0+Xl70ashsVGgQ/RwThOBBjZ+cyn1K+TlIUSr87xPx0LONBN0/OzLn9rLCB01fNQx
         KDebfi+eXZ/U1mmmXEaTPlD6ox9oY2tN1O2fcqcjIEhjPOY/UxTYC8e46US/zPLywjib
         sYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        fh=QQsBfdG32j8kf7BDPd1BKy2Wadsjx2XBYigaxnfxqv4=;
        b=YqsKKCEWgMVADxBzKX0SK7jKKiMI3wA7I7jcUeTKQTtAsvU2EB2nWSp6gbA5B73Ezv
         K5Lc575VegqO3ptBwxT7RK4dOBUF4vNUhb+9k23wx0rcxQTLnvcmQl6Gl3dviKSB2P6Y
         dc+I3Yk4Dvt3r2K5N66tGAaGNclK/eaUVJ3MwACzVqZ4nMqaK07jrp0V+vU9D5rx4/1o
         qfTVa9WWsx/vMcDAjnXYVypdFhtP+brcgeoxvNcapXO7L+93KjPU69jwxGWXhYe8it1P
         IX8Pk7RYU0pfmWkaLzHNIRe5ByT00Jr4epyQIQ6pWFZ361of+dCjaoPy7ylKfKQVL1ic
         fGCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790044899; x=1790649699; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        b=R6jAQ2jiddKdWJ0LkuDUSJydCSY1aWCoOsVgF1BQJ2x/ciNdmc4A/FC53KzmvXlhzS
         Vn2Oyp+X+vHCuhNwbOnWPZWhckCqZffYRRWJRl31fuQxwgVYkkjebOEaqg/cIpAo89Xu
         KwEl69TF810XKz9SOVvx1jCjRxMgj2AlIBnPE4G4tGuzcUxw9nptG7s7AelYtsAbLW1a
         sKuKiOJi6GzRBU3Uys7r180St1gffwyyzcRUFxtki7qmkHHeVL/tRFf8V/IbpZyn7NOq
         oa+nKnh4DQo+EAohIr9J5HqYIqO7px0gg4FMa9X7xhHssPOP2fsdkhrqszRwmu9g0r1e
         Fsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044899; x=1790649699;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        b=oHCeLfEqu/ry8Kx3SAfr6W3vajV3T8vVPVOrO3A6uQdp+Ryg3RHL57np1AdAilC5Xi
         eA2DbfC1jM2A9Wx2gmZphsJTIBtar394l6Qzz8D3RIkOBvUl5cgKQCUAQi4xgawbXc4j
         lw78WoHtrBTA8T1SDS0KI7X9KUInLGbmk2+dNEBtVmvLkiv/G3Mgfwu4W37nHidvdpsy
         gzdMSSTzFpyghZoQtq86RB8E1QE69T479MYTb9Xlnn+4F75Ire9BDigeS5a1ZZkSqS/2
         b3Cx/yoggUJle90fUb/dO+jln8ayfqRxdgH4U1AiX4zDZd1Cby1VXMLZCaXNDr+WoSII
         1GHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8FTz657wdBhW+jiG0C/82fQ7xcLW/PwolzhCZmrW2KMKLnBYmZgi8Q1/1iY7UV0xPOdpXbEFbczEoI6f2mNpI@lists.infradead.org
X-Gm-Message-State: AFuF++lXP/Tk7fCin3cmeLELOMhIlkVk21R4mF9MnMdYuxJLpGBpYwY2
	o4ORTaCt++baatF28HFIjfKW8gq9dL+/E+LnzXM+9VRQjVCEaRe4x/nsaJ1hDcFwIaJ2JrQsJu8
	KolpUERolsYF+GmPnmSW54zk3WKGbekE=
X-Gm-Gg: AYBFou0ldeOKA7zk0WNNtNlQ5/AA3ptOtTAZEnARkmd7kkhhF/CUffk5CSFK/A4VQGD
	zibTSXIMjMr2zRIghXysXSIxzGELPBcdnnyo+Cbc30ls2Vg+PQjvM/otGcgpYGH8m87b1r4iUl/
	yNMRKIKQ9pXYK+fny5Cxx1b0c3iMorGBd6sdAUcJKmT5drHymfftmj7z5m/r2tmXCPNLfZY1CTE
	TFhAiiQtDM1WMZqoUMnvZHUV0keXAbS9hVc9KuUR3XsZ6nQwJub9CM2smtqmvHbITGRnhdjS/FN
	MAfafV88oxwK86O9PPJZ5/2KxjrsT9omO2IF+f88QfTWG7SPEFF1A8YdfKiyuTC3BC7Z
X-Received: by 2002:a05:690e:418c:b0:671:6e1b:3579 with SMTP id
 956f58d0204a3-6717fce3850mr3483604d50.31.1790044898781; Mon, 21 Sep 2026
 19:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260921085119.308981-1-lgs201920130244@gmail.com> <arFHWJb9igZQPkeZ@quoll>
In-Reply-To: <arFHWJb9igZQPkeZ@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:41:25 +0800
X-Gm-Features: AcwNN1V-Ux3fREqDv-l9JklLsk_41fzba7T8a5w0aNSBvvhTkqxYTyKq2Y8-7tQ
Message-ID: <CANUHTR-FtO3EAxgTmXeS0YeT+2CPB=4iA_T-2qFZO3QT7veYYw@mail.gmail.com>
Subject: Re: [PATCH] usb: musb: mediatek: fix child device leak
To: krzk@kernel.org
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, 
	Yonglong Wu <yonglong.wu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Min Guo <min.guo@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_034141_535336_C34EFB32 
X-CRM114-Status: GOOD (  33.69  )
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

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:03, <krzk@kernel.org> wrote:
>
>
> On Mon, 21 Sep 2026 16:51:19 +0800, Guangshuo Li wrote:
> > mtk_musb_probe() populates child platform devices using
> > of_platform_populate(), but neither the probe error paths nor the
> > driver remove path depopulate them.
> >
> > If any initialization step after of_platform_populate() fails, the
> > probe returns without unregistering the populated child devices.
> > Likewise, the children remain registered when the driver is later
> > unbound.
> >
> > Use devm_of_platform_populate() so the populated child devices are
> > automatically depopulated when probe fails or the driver is unbound.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/usb/musb/mediatek.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo

