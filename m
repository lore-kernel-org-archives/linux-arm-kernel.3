Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2029C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 22:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Jt14YxismGrzSFIUTNtRc9HQQUaY0k4x/qsI+lQ69o=; b=m8AJ18+U3XOvtsgQQUQCDpYo6R
	YB2uYcEwEdSn4IripFVXu6vihvcJctnTr35U2j/YquegHjBvYSlpNvfhqPJAMgfzpe046I0YV7Zgq
	qoijvo4BgLvIE/U8QkKTzgnd6TvW50RbrBXiOzBWH49sVKSYGiTwRRO3RDpE3hewdztemLatercSW
	OQjTdAyqWJ3ZArP5aJw7q3BFq+UkYdklp6IF6OcjheAiR5ByKqqX64iHp4Oo/C2fpac77x/0baOdS
	6t/8xVqXo+ALvpgpTyeKwrKuwMP80vjAsZP0weoGnYBPP1adBozbml8oOXMhmEc/dDtDOPkkr9J6i
	PB+Ncj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw7iW-00000000PKV-1nTE;
	Sat, 22 Mar 2025 22:53:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw7gq-00000000PGN-3YwR;
	Sat, 22 Mar 2025 22:51:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3965c995151so1644776f8f.1;
        Sat, 22 Mar 2025 15:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742683899; x=1743288699; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Jt14YxismGrzSFIUTNtRc9HQQUaY0k4x/qsI+lQ69o=;
        b=CUAdbrGC8Xy07x3cFhV3sIoxzV2qaA11crdawmVo1pUpouzlKmO1oq3x+9Z4lLrClJ
         vb/IE1aH/qgdoCUSh5NB/yy+tutpF1oB0zeMiEroTGgaSTcTK9E6TxNIEuA2kBb7+CQz
         zMD4wHE5nLsjteW/pPd75uatx95GahadlX1f9ybz+lIAjwyVKEUv9WsWcf0Wh+YI4HjF
         WKOJBFVBxxY8wTFc9GpChuRFQQPnEAgjYKdYue1uxcjLb4zChGCR/SDRiN1bWDik+zSx
         qV/WfiRG1fPmuR806V638ET3qjRtwRWU7PBBvqCao0aBG+kub7mR5GRKdbuUMR8ZeUxt
         7UUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742683899; x=1743288699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jt14YxismGrzSFIUTNtRc9HQQUaY0k4x/qsI+lQ69o=;
        b=VVr9vbGYwpuyzDjqvyxwmKo/WfWrSLcfZyuL9ZXkH9TJzMxMPmFHxxE/3EJT6WyBdL
         yN+Y90TPQYF7Qeo4nnfdPA2PgXyO1s4CXOMNfJ2XnFpRHQ8X+u5OxL/RUyyWuk2Adp28
         JF9ALfS5SUHjfmyndnv/FnDEW12O/sNf9rLcTrtlgsdUB5wEfZTalfHWWFovlWfa2xt8
         nXM1dSh8adoRRauJhd8EPl7Z+OtWRoOKoW721Lq2OuawK/wcis5CY2eSVqLzdDl5g4+F
         KIcYd8Irc3UDbcXEKaFHvjLDGe/QnC8yl5Tb71IUOg72gB7ctxUzUJUIalCU5sYPqMhX
         m/3w==
X-Forwarded-Encrypted: i=1; AJvYcCUPL2eAVmoi/5f9Mn0ywO5gifal9rq+3ZUFR+9mqwBidbR+WgK9ysOTqUX3ASQs1Ce5M+DgDh2VMKS2jgbpipHS@lists.infradead.org, AJvYcCX2TybTomYTootm05cZFPzwVUZ++yFfC3ZheMFCYvMhS4bve3PvrVFdfqH4u+qYlkOSQY4n52R3GMIOBGtTDYQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeTuEjwn5FWtLDxa4DLmDSpuXyHFOAuVd1A91pVO6f7imMUfST
	oNaUYrkirIjkLG3GU0xE9JimV56xUV78BlYYAeVI3blp6wfrciJ2
X-Gm-Gg: ASbGncvH0jnkJc6dg8pjKdrhfrh9nngEujLmsWgHd2XIU+8v4hK8Evgbb9b9fod3rxb
	Gu/U1mHa1jqmlujjOJb6ifKrl/W8ldcC+BneY3T4NDfyECTDX5oHlYBLg/cnH31APLQXI7CYGWq
	ttWb28tCKwNYHnDMMtiFZ8bAiEQHJMzkwYd3NWP0xnIt1rg1MaHPF8da0tXjXqLeqTKnOjxD4ON
	K/d1ghd8Z6H7J1G/y7WFUngWPGH/6DoXFUgL4w6LEiznWmIUp2ktI7fN1BDaY14iD11Xrw/rtps
	vZHsUHDhiJqJeT2YmTL/DrRZWFmS50SREZuovpVXc/qqJo1K
X-Google-Smtp-Source: AGHT+IGxXIu9gFWA5FTHPGshtlN1jdaNgj6n+gV081Jt+w3afTixlCPB5LoK8q8g2bwFmjRD4hWrlA==
X-Received: by 2002:a05:6000:1547:b0:391:2d61:4542 with SMTP id ffacd0b85a97d-3997f8f2855mr7155076f8f.11.1742683898800;
        Sat, 22 Mar 2025 15:51:38 -0700 (PDT)
Received: from qasdev.system ([2a02:c7c:6696:8300:ec99:3da1:428d:90b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eef37sm6054754f8f.85.2025.03.22.15.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 15:51:38 -0700 (PDT)
Date: Sat, 22 Mar 2025 22:51:22 +0000
From: Qasim Ijaz <qasdev00@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com, Bo.Jiao@mediatek.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7996: prevent uninit return in
 mt7996_mac_sta_add_links
Message-ID: <Z98-6kXoYdSaFtVR@qasdev.system>
References: <20250320201914.48159-1-qasdev00@gmail.com>
 <CAOiHx==UCeMQpywQJCLPQqipEW0tK9youRxdR5+_T1LuGp_EHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOiHx==UCeMQpywQJCLPQqipEW0tK9youRxdR5+_T1LuGp_EHA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_155140_887522_2B91657F 
X-CRM114-Status: GOOD (  25.76  )
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

On Sat, Mar 22, 2025 at 12:51:57PM +0100, Jonas Gorski wrote:
> Hi,
> 
> On Thu, Mar 20, 2025 at 9:19 PM Qasim Ijaz <qasdev00@gmail.com> wrote:
> >
> > If link_conf_dereference_protected() or mt7996_vif_link()
> > or link_sta_dereference_protected() fail the code jumps to
> > the error_unlink label and returns ret which is uninitialised.
> >
> > Fix this by setting err before jumping to error_unlink.
> >
> > Fixes: c7e4fc362443 ("wifi: mt76: mt7996: Update mt7996_mcu_add_sta to MLO support")
> > Fixes: dd82a9e02c05 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > index 91c64e3a0860..78f7f1fc867e 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> > @@ -998,16 +998,22 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
> >                         continue;
> >
> >                 link_conf = link_conf_dereference_protected(vif, link_id);
> > -               if (!link_conf)
> > +               if (!link_conf) {
> > +                       err = -EINVAL;
> >                         goto error_unlink;
> > +               }
> >
> >                 link = mt7996_vif_link(dev, vif, link_id);
> > -               if (!link)
> > +               if (!link) {
> > +                       err = -EINVAL;
> >                         goto error_unlink;
> > +               }
> >
> >                 link_sta = link_sta_dereference_protected(sta, link_id);
> > -               if (!link_sta)
> > +               if (!link_sta) {
> > +                       err = -EINVAL
> 
> You are missing a semicolon at the end of the line.
> 

Good spot! not sure how that happened but I will resend a v2 patch.

> To also do some bike shedding, you could initialize err (with 0 or
> -EINVAL), and then change the err return to return err ? : -EINVAL;.
> But your way has an explicit error code assigned to each failure, even
> if it is always the same. So I won't claim my suggestion is better.
> 

Thanks for the suggestion, I think this could work however I think my 
current approach is more a bit more readable, so I will leave it as is.

Thanks,
Qasim

> Best regards,
> Jonas

