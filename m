Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01201C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geosNIRimRwfO8HRfTW0XaPt8QyFJOsPlxIx1190dzs=; b=ZUkqi9A3/xpEIoK39AHJZ2qJXR
	CtTti/ZBg2xZpUjseCAkyhxy91h/vCZYEKx1W9jGBxGfC3muk7eHoTSldb10b0m7vCXgD1IK7NslY
	YlRL11s3bXCd2R6KMqijzG7SkSIfCtxGhEyyjNiV2LxN5egQFeSO5w1e/hegQQPWn3g8gl2F7YOWx
	TFiMSx9kWOrj4UnlinMtcg+KMFgifgH9voT1q/neGft+dE8A76yxHFLICY+QPayTJorbMn5XHL1wF
	WxjC2VGwWtuWbjA6j0eAmuVHT8hXdUzgBuN8RmWiDra/GBv9PxZlU4RgK4V0MgHGpAwUXwdlxgBlq
	3XidIvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9M8E-00000008FkF-06QE;
	Wed, 23 Sep 2026 12:31:26 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9M8B-00000008FjJ-0L6l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:31:24 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c29440ee0e7so49826266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790166681; cv=none;
        d=google.com; s=arc-20260327;
        b=n5wvs3JmKZG9dgDUVcdXABm2MtsDviR2kHp4gOEP6cURj5Al9aWMEQb+ps0FOOmaWH
         ULogPftcUxI09jV/xQxm8yEUICUhKN2wIkABJQQ9HxI9YlspprAO7HJk/UjiGgjRi4RH
         DJPVnMCkI3r2h2+Eexh09X7/fGra3m66sfIYB1s2xTatrgyErIyPwtSluRU8VTUaysaj
         jKTC9Ze2ioopbd++jJI9TOgeaeOXLYPRVZs8+fAdNVDNwyxMr27blvSvsPnZNHxAGMD3
         q/cU2Ujb3rrMIkEzi94jhfZHcTY38QHtTRfZ/GlFYhKCJ8oZ5QeINx63NNx3pOoty356
         UZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=geosNIRimRwfO8HRfTW0XaPt8QyFJOsPlxIx1190dzs=;
        fh=o1DG7cnSyoZTh6/BjLPN+2facm3jQnbOj46hwejXwU0=;
        b=S37yvgeVPAZOwHmEY9H4y5PYI4s5Z9GCJWJ+h7MxVne6w7DI4qA0j0eOwlhSocLftw
         EWPaq1mL3NfQlzCesO6AUV7UOShOTGoL9nt51ZIbVK50uBEJ+dqvK+KdWOGVdJg+M/rq
         f2/uy5cQ/j7Mg+LK8ZKepU5zge48y897YPxyrdgMvbzg/26gXR3PpfwpYNYRAl5VljqH
         xEdGdqqJ8eD5NATqTIGn4tFLi9JTEEPAF+PnE80RWBgrVBLw5Bk+cLe2poppBOVuULp3
         4geF2T3atD/hsmh9Thad/FaaGjuReh/31GBfu+xTd0dWSw+TPDQL3jLwoNuhVphm27y+
         4LaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166681; x=1790771481; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=geosNIRimRwfO8HRfTW0XaPt8QyFJOsPlxIx1190dzs=;
        b=HCbX8XuzyJqhRBx34xXQjl5y+II/z1ZIY3ZNomC/aXjLkTOJMTTocveCnwwiKatgEn
         nSfGl+t1OE0rz8JK2pai5j2DenKZwPNIfDh9JYGH6D5jqwBnPg5PZKGkcJNvK6sj3F5+
         YDh4z2j2BJ4QO1yGDNO/JudHNC+KIlBNtVX5wegcgSnV68mzSGF/pDXF/awek1iq39Xk
         GCPABGbNI/YsRUxlGbyLmIwVWmuu+DFGBOWgcxXdfd3m9g2/CJAB/OnAhrhzAYX8/GEk
         IqIi+mQuN7PMLf7KPGzMTtIQSh4NabVu7GwRWZqLnSNEZ+ENVXjpkFqIYaOitkxDM12S
         RBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166681; x=1790771481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geosNIRimRwfO8HRfTW0XaPt8QyFJOsPlxIx1190dzs=;
        b=skex6U/tIAfsxt0382dGLy65XVkwlJj6ZLGVdkN0mgGr1h3WbXbiF3JtHzgtWldDUa
         pr1DMB/EoA0IblankFhuo/Tv7hzmNwDkzGfnGP5IejnQ+/kE4QzLz2ShDc3tCntuc5Xs
         Q4+xhNl1Qalp0fV0LhTWA8ffeORL86xyB8xi/u77whPxgp7W6TouXjTIoH1/TnT2IkUu
         qbYQdWveJjTnUej8vUxUfyu5BmMmlSYFC0cA7Qmm9ohMX/8G8X3TgQVwvL36g7UgpGhO
         +WpBgwG9fRUmJN0cUKCl2CVy2UoBoBOwI7A8RJ9kAIhqICSnkaZH9Feqg+8LiFBGzJA8
         8Q8A==
X-Forwarded-Encrypted: i=1; AKwUvBzrPvjIGw4I5TU1mpgzf9rgIib6k8/+HM0ANdS6CJFPCMMVjhFZBEyjKbCwdHcwW11kZRI5P8tAJXkP5O3yPtVJ@lists.infradead.org
X-Gm-Message-State: AFuF++kDOTxCLlzKwEegx6VVMIBPHMhGbZuyBFXfb++4lSSBlj8qw6RY
	EbAdMmAcW7FPR4lYpwlMlCVxi5gyo4/7A97snWhGH1LKUJa/ECfyMzhICRgQ0h/1Sl9557g05TV
	yWut/k9aU/0a7FTmGq+q1o2sN6iMbBqo=
X-Gm-Gg: AYBFou3/PvvAss7blWWgBmNIP42a0Dl74wHSscurFLo8expiz0zvvSnwGcBs/HfrFfM
	9kmSitZizv8c7A/NhEegi1EZwgb+HEIWG3B8tf3n/hS/bUXRdo4sgbOs9kqGHumWkAlkVTkNh2u
	7tC96J4G8OgOw72OZMHdu44IZr5H1d6IMmaD5NHwffKqJ/X2bRBsqoKex/FQCzUNRIbv1+wfn2G
	TXrPqAjHLFmyyeQqebnEeHxMkMOy3VeiUmlRhpINdh90GSFOng8bKJTN1HdoL2KnhsCeyOPIGZe
	0ryiJay1xBsXIjI54sxz/Mmj12v3WYqS9SyF3bhUeW5Ox4L3zslfb9ymF6g8Td7L/FsPUw==
X-Received: by 2002:a17:907:a312:b0:c29:f5d8:9c6b with SMTP id
 a640c23a62f3a-c2aadc48e63mr193301966b.26.1790166680835; Wed, 23 Sep 2026
 05:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260919174223.2356964-1-coiaprant@gmail.com> <20260922191758.2730da7a@kernel.org>
In-Reply-To: <20260922191758.2730da7a@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 23 Sep 2026 20:31:08 +0800
X-Gm-Features: AclHuK-NKWB18tJ6bEfQMpRWykl2_zQElAqMu29cCy0C8SHDtVbj2c6Zd_8DHvQ
Message-ID: <CALj3r0gPjraK9wy_WbTkeYD1OK_HhSeMi8bDmk03gOVJUb825g@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak
 when the PHY clock fails
To: Jakub Kicinski <kuba@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_053123_248689_0F036880 
X-CRM114-Status: UNSURE (   9.61  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=89 10:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, 20 Sep 2026 01:42:23 +0800 Coia Prant wrote:
> >                       if (ret)
> > +                             clk_bulk_disable_unprepare(bsp_priv->num_=
clks,
> > +                                                        bsp_priv->clks=
);
> >                               return ret;
> > +                     }
>
> Missing a bracket, EBUILD. I almost appreciate seeing a human error like
> this these days :)
> --
> pw-bot: cr

That's what I get for hitting send while my brain was EBUSY. Will fix
and repost shortly.

Coia

