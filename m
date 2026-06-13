Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0ABCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=; b=EvaMId8WVxCbheqd2jo8ofOzuL
	j0yAzIQ6M0nNn0DiU45QhGge+vT+RyEeI7PI+yX400oXobPG42AmnEXK75Xy7gy/12oKFCJgW0Kyc
	IANoyO8ewweix3fVpinattKHjyOUeR1kQasKAnv63G4BQbvwV7dMfyPpXYQ1lBareFpVPUKBYqbQe
	h64Db9Ss0PPvg4Swl9dak/fzxsbzNxvgIiKSguwcrr+P2Q1HYfMdAwWjI0F/ZifuBDs1+jGNL56f+
	T5qRzoUFpqhABT3aiHQXcJBd7fpA7Ny1p+5K8O5SDj5eAjfg2hiHQX5/fBRrs6BrqoyuBOfPWAsmF
	a7aUZa4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKjo-0000000C7bo-0hpW;
	Sat, 13 Jun 2026 09:33:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKjl-0000000C7bQ-3u6Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 09:33:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso16599915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343188; x=1781947988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
        b=DtTwBwjxnhSoD60gCKaH9bP3A5JpbX0zL181rqsfCG7B1avev88vhHMflGWXM0Sc2n
         raOIj5p9hc9atVvIzZ0bbCNAobyCxEUfNOBdWGsP2BDNsDghX/IsucQu8LKbOMDtvxxE
         BZAKHOJrQCmn+wxdW/6pP8w1JVoqLOzQcqZ7mySlcF7xkbXZhUHqD1izJrcHh5aAwR4S
         rTfUzhdxo+yRg+3Buf+DggKzs/7CEWFOhdorxWJoyangofQJxYSLXZi0PXgGrsKLmHaT
         DU07oRkE65btB/fRCNyEKm6/6v3vP+/WojrXGJ4wtmQUDcibbkVe2Jzy6ro/J+KtvinN
         2tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343188; x=1781947988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
        b=KOmTzPR98qu8/uA5VVAopkhrzV/Upu0oSiG7XsuSqeArCUQDeLenIltgJjrTIKiZGz
         AW2hWsGh9Ack69fPrHvx0HfgIXJ9WzvsUYGRqWIYTJsYt/woFFSxo6ztHKR7urac5Hrn
         ZqZCS7N4lGhqHSHETeQNMCRk0OTHeYNeLZn6b+RQ2aEuD0TKFdwRvXxCU+WC7glDxJVz
         vr44wOqFMWQGKMaX25YDTDhjcWtTvwY3g5WWV+63vSwqZuRNBfKdGazssegUpC4wqHd4
         BgRekjtXtbfk6uqaG69uXVleDMeGspEpFfE78u5Knb2P1XAxN8BfNq6E6aXFV9ZWupE5
         kAiw==
X-Forwarded-Encrypted: i=1; AFNElJ+rc4flDb5Juc1kuGOLSl4/K4HiqLehlxCIJ4kULU5OM+4rYl8prEnRfOnyJbr3gmq65sXHL/WW44rx6rIkbBtw@lists.infradead.org
X-Gm-Message-State: AOJu0YxVwAdOEJzKoLfl28286iyYvz39j6TfCKju6ZfwE26sJKqGrl4Z
	k4TFBDs67K3yRWHl5Ol5rZPvFc3yxoz8/gdWuuhFUL5bwJxyDGe2RHtD
X-Gm-Gg: Acq92OEcdgJRDvG5SYdTT9cbECtq2r3BOUff8Mpc9j9jcA7vVxt1TmCgXb8mkd0T/Tw
	F5qKJsbAcQfVEVon2jMVoz416Au83MiscvprJNAbKgqtGJejpMsTO0Bl0RSHGA40r6dn5vjLqrq
	J20rJ3f9oASioplBdZQrCsRHYU9fICjDR535mJw3nquBM6lLM7EuSfM5RHGJRHf7EFOOdRod/ic
	9eJSXe+SMHoRk/2MZSZ9hNg58yVCHpZrqfq3aREwLrvByAsk0fOnJLu5ll8sXu5tLJrdqgWZl+7
	7/C185COO8PLEV8gWt3uOCiFxI4sudfbt7AtSuVUURE3+PU85F8mvKuR15eBLfhHepiRwlkVvTb
	wx8024ao/Eg+QKpwhR0p93Bu9Wq/M0Y6+RBcrRuVPsYokmcIAJfuqw+e1ALSnc4a0ylieAEiiLo
	4O4WmHeOZaeUzh9loQBk/gczrC4ADSqY5U4FtrCiYOJnxa8WEBVKpNWWA=
X-Received: by 2002:a05:600c:1f8c:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-492200768abmr37382835e9.15.1781343187661;
        Sat, 13 Jun 2026 02:33:07 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26392esm13886883f8f.3.2026.06.13.02.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:33:07 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Sat, 13 Jun 2026 11:33:05 +0200
Message-ID: <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
In-Reply-To: <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
References: <20260505134812.408316-1-wens@kernel.org> <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
 <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_023310_009006_A686E198 
X-CRM114-Status: GOOD (  18.31  )
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

Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das je Ch=
en-Yu Tsai napisal(a):
> On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabe=
c@gmail.com> wrote:
> >
> > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> > > The Allwinner H616 SoC has a video engine hardware block like the one
> > > found on previous generations such as the H6. In addition to the
> > > currently supported features of the H6, it is also supposed to include
> >
> > Remove "supposed".
>=20
> I can't actually verify that, so "supposed" is accurate from my point of
> view.

Isn't info from manual good enough?

In the interest of unblocking this, I would be fine with "supposed" too,
but manual and all my experiments show VP9 is supported.

Best regards,
Jernej

>=20
> ChenYu
>=20
> > > a VP9 decoder. However software support for this is currently missing
> > > and still needs to be reverse engineered from the vendor BSP.
> > >
> > > Add the compatible for the H616 variant, using the H6 variant data.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > With that:
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Best regards,
> > Jernej
> >
> >
>=20





