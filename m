Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEC8CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEm4VUNhIRm4CI9cgj3+YaFqPnvC9u9Y16aUqGdcNbA=; b=BiTfICiy8Kb1uSrwAn9cT9HLS9
	+k0+4+Y/XTeA6mWmoqkkKuohVVrUc4VQicaCLXGFBkSeyn9xNLuV7V5Se5IbiH2TOVoidZ/IJcaHA
	b62sFILWri+a5yp15pOODzIs1snHZSyPddqgUhzLUg7JWHSD548CSe3ZQu3+96ki6EpwRddS2bf/X
	eS6+uQY4LGn0LGm3juDLInMLQLV4RHAMZsCp+q4einxM5bqGhygEvMEeZ2eqEaunS42LyWeAV5RNK
	0eRjvSGxzz98LprydANMJ4bKEJlggZO1KoU/YXfqV4PGbntc1NBjKNHAZL+yw2uG/pDzJc1N8Dy8v
	nzEtJurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJsp-0000000Da40-0mIf;
	Mon, 27 Oct 2025 09:51:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJsn-0000000Da3W-41fs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 09:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KEm4VUNhIRm4CI9cgj3+YaFqPnvC9u9Y16aUqGdcNbA=; b=eVY6CjkCv69k1HtwMYCmG+NxBb
	1ezyxJfPeMtfaHhox70GUwLTCC43VOaNjaVRCyxTKb+P4K7yab4uHgE+J3iE2kI6/288BbSMJ2Sgt
	dQWZu0gmsLLbHvZq2VK0LWTntt+bD4eVUkMJGwJz7hI7jbPE8zJaD7RPazSwAWv5TX0RoJFA/T0Lq
	UdU9HpWffLL9GV55ChPVAc3d6mRb9PRayyTo7JkPjkwUew0izg4nnAD5w1JuvzFPYnSSRA9dSGzHe
	e0BKa5+V/CFTUdaaN84/ki8L/vzaeeZ47DHFVzcr+srSOoVEDSGgxwnx2NrwXK4xL9983nu7reMVn
	EvjGt07g==;
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ11-00000001nAv-0LKT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:55:48 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-89f3a6028a8so229208785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1761558676; x=1762163476; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KEm4VUNhIRm4CI9cgj3+YaFqPnvC9u9Y16aUqGdcNbA=;
        b=LVxnRgO28WZacs8mx59+TXEYSV4YHYuKy32qBGfp8nazUavvksrrm3HuGS1TmNmN/r
         pVS0vBBPTWeZXADwCc53mlE5W3rpg0XI+qlYkpcR8NT+A4EhjBwLqXh4OEX8zdOBRMPH
         8fTxCVzmfe3dCHrKP10LD6pGCIB9pDU0ERxfutAgMZTqpWDIXdt0IX5trq8VXvuBnekM
         /j/fYR0Xg2qy/8o2fg+2ZQc0cTnRl1W/cnQnVzIiDRVCwplAwtQqwdgTVd0FVC3H80Fv
         /Qmg4rh55n8E40EJJMWh34oAtpBT8jKKUYZdYRix9cnB6pilMSF8v1onh3dEUVOOP3Yl
         d6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761558676; x=1762163476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEm4VUNhIRm4CI9cgj3+YaFqPnvC9u9Y16aUqGdcNbA=;
        b=vd/1ScCWF/19eRoy2geSAvE0q3DITKNIaBzDX2dfnJ5RilewddQrkY4MPaUi30b6V3
         VGopgrROZMqJzOEjibcveV9J5PKaUs+S6rS1r2m9POiG3FxubNKrQ8xqQYhfYq/I/i2G
         ccdHW5xEW/8SQGWJegwKwwU7SP8B7Ab5BPqUT0bkCAENHencrJ8w4AmUfOnaTnx6xw/9
         4WutDLhUf6D9ub305pI3T1P/Mc8E4JaRLQYNqOKJ87ARk49i9gGB7VsxuB6SlhUth2VZ
         KRQTfquhJFgLTgkxDqmhI/OzJiAJXQTbNAi0j6T96aeuUwTpfmFAZJG45kBafrZoljaT
         iICg==
X-Forwarded-Encrypted: i=1; AJvYcCU8lmxaM7iWiftsetq2pJORA5Xxg3Udn2Q2kGdJdSafApQF71xm0QO44NMpDzbgd/qWJuq5ZLF1knpGKbedt+D1@lists.infradead.org
X-Gm-Message-State: AOJu0YxX9g5kvgO+QDsmAdxvKPiiYB80BXzSR9V2qhfJ5Rb8mbUlYFUf
	CcZxsIv2GNsOA/PZZaZSAqbiX/FQUkKzywnQ7hTDmjY7WHt52jvB8MilUv+ysa/4fpuV2U1zFYw
	RPTGwXuNEh+l2Nstsa5PV3QN3KHtLt4KDhxRMEPQ5lA==
X-Gm-Gg: ASbGncuqJEtO+scaJeH3uqiO7+B+skncD7DFyEE3wnhfzZC39Qe1bRE0qo9A5LuGkDc
	o/NgezS/pNhsdtVbloaO2AgMB2GjH3PtFKh5ezReug6mw8cr3pw2nejwloRTmIWaoQJYxngeiPY
	92Er0v5GXlaYG/Jg7GIAK+H0T9IBw1jQHQhVh+uk3DtBKWx3+YYTe3ql1hqbNi4yNymcy1aEdF8
	2Y1DB2QCzc70mkfSaxpaMdP1wA+hX8UqWDhUmOGNOpObcZkcauAmv6Zj20g
X-Google-Smtp-Source: AGHT+IEmWTiOrlsUD5Hm5bOmrc4XIQtZAwVHNawNjN449YPwWXnSlk4xpszoLq7387lR+vuxodMoY2+83tdmzyojrLY=
X-Received: by 2002:a05:620a:c47:b0:891:a91e:98c8 with SMTP id
 af79cd13be357-891a91e99eamr3319941285a.23.1761558676598; Mon, 27 Oct 2025
 02:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
In-Reply-To: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 27 Oct 2025 09:51:05 +0000
X-Gm-Features: AWmQ_bnUJmMH5yn8SNjXD9lhXOuvZ_9iWgyNcdJBRyB2VgWGh475OYJjqyOR-w4
Message-ID: <CAPj87rPTKv=qv_fHTVvymNmi=nZHyxW-PgR1EFQE7T8gV1pNzg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Disable AFBC support on Mediatek DRM driver
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, greenjustin@chromium.org, 
	sjoerd@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_085547_180772_F85657A9 
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

On Fri, 24 Oct 2025 at 21:28, Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
> Commit c410fa9b07c32 ("drm/mediatek: Add AFBC support to Mediatek DRM
> driver") added AFBC support to Mediatek DRM and enabled the
> 32x8/split/sparse modifier.
>
> However, this is currently broken on Mediatek MT8188 (Genio 700 EVK
> platform); tested using upstream Kernel and Mesa (v25.2.1), AFBC is used by
> default since Mesa v25.0.
>
> Kernel trace reports vblank timeouts constantly, and the render is garbled:

Reviewed-by: Daniel Stone <daniels@collabora.com>

This is definitely the right thing to do until we can figure out why
the DRM driver doesn't like the GPU's images, and how we can get it
fixed in either DRM or Mesa.

Cheers,
Daniel

