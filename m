Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73058D25039
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgp98Xl/Ij96yBO8OoKZQJN+mUE2nEt7kKcPNZRNTLE=; b=3W5sAWTFxeN/lRwPtCThrTPJrS
	BJ8jyFS/mj7AuRMTW5EE+NuRIAyt7wdUd4WXnU3nqW8ugS9S5bMRqoYaqHx/W+2EmdYEUauJ/dhPa
	RPkcqfj8Wr6+UBRh7bL7vlQGw09BhhJEhcS9Va0zC4SdXjk/rdyJ8ob5cFSbvpus14zfa85Zr+Cx5
	gx1ILgWceKcRsjq2FyTw6+tILDibcBJ9q8ih/VXxKi7eXdzMFUFuuAtJiCTq+f0equUB4dy61Terd
	CqSWyh8KJI1TWKDsfgCkxSK01FfYMQk148FcTe0Q4arKrAFQuYf9Nvg0k9eW+YatAavExbF2EW+zN
	DwyXG9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKH-00000004sJ8-0Ygm;
	Mon, 12 Jan 2026 07:26:57 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKD-00000004sIP-23od
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:26:54 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59b30275e69so7016509e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202811; x=1768807611; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgp98Xl/Ij96yBO8OoKZQJN+mUE2nEt7kKcPNZRNTLE=;
        b=AJrYy0nlISSrJYCzvyeTcpCxaFRE4Q0R43yeRsr0ylKou+MTIm1zCHTTKjndqSiqFy
         wpZ7MME3KWjFK3tin3bOcH/pemU6Ns/anXx0UUbVjhXHrJV6lJSaGz1Eq+yfdSRPiIOb
         5ZqXPaYHcOWXO8YR7kmV2jGbV4Gt4+5vM3pHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202811; x=1768807611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mgp98Xl/Ij96yBO8OoKZQJN+mUE2nEt7kKcPNZRNTLE=;
        b=BM+KykInZqNVFjTkbmQCOr/vFfZvF81QWC9y9ia+IaK+x7M91JxMDD7q8WP8Uct4i2
         EXuv0w1KSXv7yB3CBKE2OO0+tHRSDEzG1QdK4YiMnID+Et/ilA2YHoQvD/o9UfsKN1M1
         XaOFjf9z38MprNpKfAU1MSYptTIx58Gfgz7WYxfLnJTZ5r23ferKt0pfsW5AtyNMAb2C
         xAfJgZk5uwPVh7ckb4DIq0aQM5SZi0ZIgBTQoEFl/MXsod6E6IURd78XLirq8tsKJaMQ
         F9s+e24W8HWzi+vIoYZg2hY1gNQYzJHsBDgzfjzF38plzbIc4rgWrQBpiEWsK4va75wk
         CN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlt/uy532cCf97+TJpxJs4Uknj8jfeeonUi/aRxWOUPr36CPZJI1XlDqIYJD0v5Kc2LspvVpBnhLXT86dCsJfg@lists.infradead.org
X-Gm-Message-State: AOJu0YxEDdgef+SxjARyiIwm/QltrmyjMGn9Os6a1OT5F3KEVBWtQ/Wd
	72PF/EBnrKrNbby1HWBCd5rZFKmq9SpYAYC2G4Ytffizz+Sk6+8fDMdtJwfuTAGHq2NKok4y0JM
	tF06KMxRi4OeABlJdZhBGYWKWNHi5D/tgvEASs1wJQshW3/1DG9t2EA==
X-Gm-Gg: AY/fxX4nMr3Op7r9tDFAxBZUM+iMO27uXJS7ttWN70swO3h4VptqdWVoawUxJ8ngZr5
	pMye5KJMfhMqqU4FAB2xv804XyTb2j8rlcViYy7wiWDsgx8TVJ/SI5NDKdu70mRvsGdgxjRSfqE
	aL5NHht0nxnNp+Sk+ARqkcXt3H1kjgrtbdz07DSd1pLqkN4BVJocrtV4RQU266TzsEAQOo1hDsL
	WQlAg51tt6KFZZ7Rp6cH117W3jYAQ1OsfIRVGdUqnAIYtvnApCIFFhGaRM19ty3DCEKGjD0wtOe
	ryhSjX2aUrhe8uUA6pHhzr+f
X-Google-Smtp-Source: AGHT+IHq6HJyogErRwRuF8uYG0l1rEuOGyuyg1CLZdmDapOhugecy77eR2OV0LOvv0EJZ7znHYv5yg4KCxxMDd1cRnw=
X-Received: by 2002:a05:6512:b17:b0:59b:71f4:3df8 with SMTP id
 2adb3069b0e04-59b71f440d5mr4669766e87.32.1768202811171; Sun, 11 Jan 2026
 23:26:51 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:26:40 +0800
X-Gm-Features: AZwV_QivUko9VD5wl2tpLh_Jtkrw2h5oLTr4Z80Ltaif0J7lb0PaGCnIE1AKRSg
Message-ID: <CAGXv+5FDQ-GeBDQk6MBj+Ddao+6pkr9Xm-n+CLTggzZPTuC+=A@mail.gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: mediatek: mt7981b-openwrt-one: Remove
 useless cells from flash@0
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_232653_571202_46F0BDD0 
X-CRM114-Status: UNSURE (   8.49  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In spi2's flash@0 there is only one `partitions` subnode: this
> alone makes specifying address and size cells useless, but then
> this subnode has no address and no size, which even makes the
> currently declared address/size cells wrong.
>
> Fixes: 869b3bb5ada2 ("arm64: dts: mediatek: mt7981b-openwrt-one: Enable S=
PI NOR")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

