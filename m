Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=; b=h3ofUB6nF++iN2r0GNnDKsPG3E
	JMOyEqnKDgf2ncoDbQk8yCe7xcpoLXaVBHKx0BhmZOe3vFAyGaB2WTkGhJJJUm/B/Vd5o65/wjbGO
	hAWNK1G8nyRw0a8ettycWGALUk4+rcljfSjZjn+XeOUtiQfSk7neAq+NzpertGgmNhiyjtPhxldXa
	o/40T6g2yM1/9qGiWjO3YlGRxC8OhH+Mqhz2EZgoPOQp9VePVY7w9WkJe+cQZ8J8djFDKLyqRQhBN
	ck/ZPzWibtxPGBnz6lslFzgR97Xhy/um47dIU/SAflEzbbEZVLKzcJJ/a/jsoCe6Mq/Pb9Fxk4QJL
	RrM1cz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0e7-0000000ENhj-0QTT;
	Tue, 07 Jul 2026 07:55:11 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0e4-0000000ENgW-21iT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:55:09 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-51c2149571dso39956481cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783410907; cv=none;
        d=google.com; s=arc-20260327;
        b=lx3qTkligoT7YRE+RezqdT0sJtiiYPe0yGwylfhFU8a0ifcOAVxx2QUG949s4TBQX8
         CGWHRogm+Bqx+GJGEfUmIED+oHOBURtZsSnVwMwlJvkPjkSL9hKY0wyLKh77mVYGbtZk
         Yr53im5PjowpBGXykHBhtUXmmX/OxtiWiIJDB8ZaJitbihQVm+IZLUkb17hTxizRX55t
         GdyZuPxtu4LW+2Icgq8U3/o++I13ipfTyIuwOEUdZTlJuoy523S9+TOUCuPKlVrEAWAY
         AswzHA/482a4uLkV4D71TL5upRqcYuVTMWmxHRKraMOGDr7Dj+Ln6SRRP1oRb2H+x0Ot
         XJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=;
        fh=VELk2mLefKSLvB//PshM2xYsgYCUqXviTRaiU2o2QKM=;
        b=qJIr/3GJwSSEUlCIqQC2OiktjX9LNYzMkPJMj+tvCfOIrjToLk36itEXZPwmqmGKOi
         nNVRh6YPJ2GG05Zw+cBfyStX5XD9V0BhbKWZWDYI1O8LqzUfxfgGpr85cpurzYiFP/dE
         24lD/wsgslwQkPvvHAmHxmyV+HQIaqO9Pa1A1l1wfZtUKFek7nqzuB0BM7zC815f6h6M
         J2g2V07CMV7GC62RYOo0gTRiEvIc4GV4fr+5/oWDO+n7/U/SoVWLcAl4KoL3Yiinv3qB
         t2p93s0evd/PBXoKUinRT2GkudZWRJwuvDaD4YYCM30Yh9abnd0psDIWgT0UUnnDJeS+
         62og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410907; x=1784015707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=;
        b=i+803W2n2V2cxrhujNdttzihwdz9ibfsv89laWs/geDGg8nFrzcJr8yQyN1KE3kmn7
         8ZFAW43L2v/4Dcq62kJ1lAgg0X4xSP6kw/1HfWeuFEt7V1y545Uj7dX2yy1fpqIoiJoh
         Jqwk20pK1s8Rtdp406tE/t3jdnDQu5ItjmtPEIWhNdRPxys1SmZsZWF+pRxwJUGr+yTw
         Tk3Go72W2AdMy2HXnYvBptk+ha1sOi76NsoqL0kAzYll3yGgcPDVpb6rGHPVBMziyFxn
         UcltSm0k8SBMSjfO01xqb+5gBNx0iprplwvGcHwBHxr7XCZuXnrtLBP+SEbra0iwXkt6
         VO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410907; x=1784015707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=;
        b=CXz1SZctzoimsRjf5FOIpw1oTlTcU0zeaXd1KK8ARdis/5bMseB03Aj5tCpzOEmYmA
         Vw0y+BdkfZpB6Ak8xTDAzCyuM6TPN00DzN4vduLfDr8fSt4CA5ZFGC1RnfWNPwz/mN61
         WjS1PK3fg5EZSqhg5uO+8l0lWqha75B1V8E3vooyl/wspLfjTnc7Tbp4PjnQaajtqHY9
         4Lv3Ah6h8CdcQoP+hAo71oALS6ORDNxN1Tn7yfL5oFRdPKEpEP7B6Wrok2cD7tnWVUc6
         nLyLVVHXAAfYJ8YoMxuiToEymc3gjxy1F6+bISbhNXVhF5EIob+u+9E2gYIZbpRCLaqc
         tfsw==
X-Forwarded-Encrypted: i=1; AHgh+Rqn2rpx0QMibF490c554Lit1LWcmvW/N9HbWWJrSnuM13AEzdnB4zPi9meUT3RY4RRNLsgxEmWW6o8y/to4SRZW@lists.infradead.org
X-Gm-Message-State: AOJu0YzmbMkGPyf1kEvLaLCP9etH4Mj7Uz2MHWd8O1H3LJI+FymF+qOn
	WMkRG5WPFG4v/GlnYv5aL+T7V8S56eECODme5Tm22YFZ9yXxEDlcxT2qlHKX+MmjYgdMqHH7XyF
	U8Iutd111e5zj9nvVUvaJH/B1S39NQWM=
X-Gm-Gg: AfdE7ckebrEQDxRdoTnOUxPxVGevbN6GHn151LopsZ/YKobkJhO8OjlcKkqMS1U3K9Y
	TB/7EgmzuuOzDjlX2npp9AACzjzXlLvuMBIKLdxp+QBQ5mgXTbcxbMT27+RaH35oMZiwJv9sC/I
	Cm+kIzC5HeXQdwllRiiamEwA9eHikW7qfm7b9qdLzaSEqx8DDQIAuG4opEbZ5s6LdbmAFn58/4+
	GLbjUpy15/8PHILX4nxXaSfv5jEAez2WI7p6ndEZfz/VR+6IyAOZGozfvFErgH1s25j0dIwglz+
	D/t6ViiRHEz6ZQ4=
X-Received: by 2002:ac8:5944:0:b0:51a:8c97:fb9a with SMTP id
 d75a77b69052e-51c748e99d3mr43147321cf.67.1783410907124; Tue, 07 Jul 2026
 00:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260629142348.273766-1-akkun11.open@gmail.com> <akwJmKqZJS1sJzFk@redhat.com>
In-Reply-To: <akwJmKqZJS1sJzFk@redhat.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Tue, 7 Jul 2026 16:54:56 +0900
X-Gm-Features: AVVi8CfBz91Cjj_2TyUNSllobZ66hJIFMho_I-2O9RLREdueZiXV-s936xkFDMc
Message-ID: <CAKr_iV5zZ2TR0cE6E8=5JLYqFwYsvGEs8vqKL-rN3RtuSu0Unw@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: fix memory leak on module removal
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Miles Chen <miles.chen@mediatek.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_005508_533521_6E964A62 
X-CRM114-Status: GOOD (  14.39  )
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

Hi Brian,

On Tue, Jul 7, 2026 at 5:01=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
> On Mon, Jun 29, 2026 at 11:23:40PM +0900, Akari Tsuyukusa wrote:
> > diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk=
/mediatek/clk-mt2712-apmixedsys.c
> > index 54b18e9f83f8..24522fc24019 100644
> > --- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> > +++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> > @@ -129,6 +129,7 @@ static int clk_mt2712_apmixed_probe(struct platform=
_device *pdev)
> >               goto unregister_plls;
> >       }
> >
> > +     platform_set_drvdata(pdev, clk_data);
> >       return 0;
>
> Please add a newline before the return.
>
> Also, please split each fix out into their own patch to make backporting
> to downstream kernels easier.

Thank you for your review.
I fixed them in v2.
https://lore.kernel.org/linux-mediatek/20260707074839.240676-1-akkun11.open=
@gmail.com/T/#t

Best regards,
Akari

