Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6644AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=; b=LXrc1w3EMNDAZVuf4dhsNHXVJS
	W6AtNugyBxeAbXRV8My25ETu5v5vPme1W9nPjRec6JAS6MxfPO4d+xXU1hmRcVUI5jCun7hsnivxM
	hWpVwQionwOH77VblutzOKvKF2WmwPnzhgSknOPHP8QLVDcqeO++tCeA9HWl7QWFT4dm8uNOi41uh
	1otTv0YFL4cq9El4H2p55oJKF191rxARbO02AUejZ+MiKQanHOSStLrm09bptilWe+ehDx1hf/eyl
	0gnyjZjNwD1/aWYcfDDUjJfXndI8i5pyvq5WGjJZcAsq7O6CDFfd2N3hGWAIlPZynvKrnpBmc8upA
	lnq1LTQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0cH-00000003wO1-1b3a;
	Fri, 10 Jul 2026 02:05:25 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0cE-00000003wNG-0joq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:05:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso381067b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 19:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783649121; cv=none;
        d=google.com; s=arc-20260327;
        b=VSMZ+sq+cKNJbX44IunlBZC68wB8DZAa6T5QpbR2i619TMHymDu4Qqk60Pn0dpFcHw
         2wVcqs0SC89GhtrMIydS7hhIIQ2qAXZgld017cHw88d9AMj54Zl3d8rE5Ilnh6iWD+vj
         /4RXVAkkiiwZX5G9zxuFHeiDAzxvzDK3WRpJlh6HDzJle4Fgs3Us+vspkDDJS62GW6Jc
         vr+iEeOaKiHX74RvrHLB5KzGmllKqms3xSfvJFYmk7K/1A47m4Lygr/UO3S620llRqAU
         q6prMTewhVnmckMwcSd9W50tnqVy5c00x2goX9oPniCO6YHf2Qu42WiAOb66BoyvLcif
         34uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        fh=sQnMSgPLiTiODE0jJ9DBe5SNMk7N6qnn2k2KRP2To40=;
        b=s6k4pM6MQu5xrp6cOBF6qF+zuk6HDJKx5gOL6dIlLKsc2ITIr20RWue3hmvJZ9I/yt
         IBiFtevAnFClO3CfrczOBm7gkNkgVAfwNT1uDoQsW4iiIG86tDzK0p00r4VJJ5Kyynvy
         z7BkA1puBMBmh1EXHqKfozkftmDfD8ygz4WQfLwDXoBYlJZgE9SVg2iHVXZY8pmSCpS3
         Ad6kxRrXXp64ksW+iGDaAiFTmTpxDJNILD6mhREU9ukT+J/OAx1ryCcc90vQI/H4oxXH
         YrU6wgisRT9zjtPCBjXttMQ7lIv7WNRWyLOAcNX/XCk1Uay4SlHw9ID6/UXZNlFxpWfA
         1XAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783649121; x=1784253921; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        b=tDbF3nPiZ/BT9Segh7x8rzrOq+Hdf6KFqOY3Kd00b1P4eZY/Zh7RNuELNmGxhJ0Cmz
         LvK9bmMi8h0ekyEcFViGTh5rbDeqW9OroONWeJG7YLxy4DTyTSVPuL2c2ClhFozD6l+q
         RmGJoftRCflW1fIFC2tJanJwAvQ7Grfrt+8ME1xG6I/IWy1Tjr17P3XvIJBOFbhkGihY
         a+Pyv+0mENrFre7bt1oiHMjkKAinTb6ewKwO1CtrO8jYW89iP8w6VsL0FiZb9OYI/1T0
         OQNQduBIXNWHNlwVAGTHILpLGJukJddqEqIBzKs5xe48Y+o0hUlFHDWX3qtUdZNeKGhc
         yOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783649121; x=1784253921;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        b=sPJRqKdgwVfnZOynt1y+9nLha6x1KBxzWQWpCH9HJ8WmkxDYW2r6BeCTK1r4T/Bh0H
         DAkqZ7Bu/6ExL3joxUSG3t4/TY3pskhojfy4eACkUCHOcy2UgaSNXvfpG+KV38wKJlUA
         WbT41VfP63QkeAGjoPMq6t+jKk7PfcOO2NmYY3Jmv+yx0+w1v1u1Z2ZEp2fy2As4Z3z6
         dV63oZDMSK9yxQuSy3m89nPSaZWj7wxPOON6YjseUQwFcNZclqa0hnejYF1BpUXP3jOx
         +lIZVTcssLLoB3uDX5xETEQmHvTO/0UZtOnAbKZeO/s2LKBOTekga3ttWvQNbpPpjkZk
         /DzQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0Ssl9hrXrfjj2z2HdU4uO4Y479nEG9T3I8Q0U4nhMKPZJzYdwEMmbFOF9e1T0cRTi0kHwosVzl6IQppNIx4Tp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0g+w5E1wVqUE2bmWVWFADutRkXKUZTpdoUjxY51UYbRrCifQn
	enXaeuUHzFZDCQBauWW0VOfrFQsVWsAnf7VjyVBV0LmYOOnTvSAEVEgP6A1u6IrC/bUBdCn+0ur
	JYl0fDUQ6KgLIgNiE/6W6+4V4M0NZu+o=
X-Gm-Gg: AfdE7cn+qaQLBIrqcp2pI7TKKCX3dvuIgTDJfFsjRuvNi9Pj4T0un9MKfWDPI2DaLZ5
	IFhLTKyyssDmzBXrTf63qt/tNBK7jhbzzT7KcM4SzA7rmr0hhu2Ai9j8Qv+GI93p6dolT0q2Tb5
	VCXxnrG/dk1JEJmfjRga8FTrw32exJhqc1Tbf4CtJj/mJ8WalTTIkcJ47yKxhyX6+Z0kw5R/ezS
	KIMoznmOvZr+uWilym784JrlOL/UicOTSww3ypDopubWw4rEgkyLwNxhxpGwuiw3lWFHiev3VGc
	a+lFNoFVHUD3I2F+A17hPWZoO7do1CRDrWOyhg==
X-Received: by 2002:a05:6a00:858d:b0:848:47d3:47ec with SMTP id
 d2e1a72fcca58-84847d34a8emr7759091b3a.31.1783649120744; Thu, 09 Jul 2026
 19:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com> <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
In-Reply-To: <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 10 Jul 2026 09:05:09 +0700
X-Gm-Features: AVVi8CdIYYnh9UcwsbAJsmq3JOOUQJGgVvrgAYTobV4qxqGEgOj9QMvwPYMMhSU
Message-ID: <CAABR9nFMAujx-Besf2s=+ok=sctBYfz3s94s8aE8Q_yCSd_sbQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/27] ASoC: codecs: Use guard() for mutex & spin locks
 - part 2
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_190522_208540_A9E1CA82 
X-CRM114-Status: GOOD (  10.62  )
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

Hi Mark,

Sorry for the confusion.

> On Thu, Jul 09, 2026 at 11:58:35AM +0700, phucduc.bui@gmail.com wrote:
>
> > bui duc phuc (27):
> >   ASoC: codecs: da7213: Use guard() for mutex locks
> >   ASoC: codecs: da7219: Use guard() for mutex locks
>
> Only the first two of these seem to have come through which has rather
> confused things?

I've hit my email sending limit. I will send the remaining 25 parts
after 24 hours
to ensure they all go through.

Best regards,
Phuc

