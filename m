Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBFFCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 03:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72HjhGwzLL0PbZTSkv6wDk9duccZmIns+xeA/qk65fA=; b=1Yg9BXz09pygWap9NAbV8laquU
	dnuWMSXHrwku612D4n9m4ZqTtpsTpblzlM6lDWNh357KrC1FeouJ7TGQ2w75M6x8NHFbfeusf5tWx
	BcpaGor9Ge6X5VEcfIpX+tlEpx4SaXnbzQXRUAdPSEYrsw9tZewBNV61o4nbfkKXGq6W/q2wVGW8z
	UuD9+NAYq4S8HLFU7CLewrmcUBGwWAfI2m3GKI1WfQJrp1NZB6jnGw7Zblm+mFiI7ckdJ3oUTHGXn
	uqSX49387l4BaaPLS0R8to1zfh1pnMIOjH6efFWo2/gf4E0ljRPO3V2m98MUMFMhAKemcu/VNji5N
	2b0Fwhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unqyY-00000006Peu-2G3C;
	Mon, 18 Aug 2025 03:56:02 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unqvz-00000006PVg-2mSw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 03:53:25 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-333f8d3e67dso27863381fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 20:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755489201; x=1756094001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72HjhGwzLL0PbZTSkv6wDk9duccZmIns+xeA/qk65fA=;
        b=eKvpZSw/a5GL9Q8ouS38RaBJkGCOnippZP7DBLvMus3y+4sDpsWz5wLESo+Gn3/eJ7
         3IPZ2Vfeyfqt2qxotX3mEGffx927j31kgrAFDyAnsZLcKgfb48x3aHKTyQvybuF9VKLr
         YmuWeeImIzHf9bINMAGqX0MHtYpDYnZLlRYrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755489201; x=1756094001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72HjhGwzLL0PbZTSkv6wDk9duccZmIns+xeA/qk65fA=;
        b=wES+5oreASgEHu6okbafpiNLhH2TNS3JXZNpIkAV/jRfzvOIpB+UCPvnXvx2t5k8pX
         /SQKeAmZjjQJP4TPQDXKwN8EBaxjdwmXmn1GHOGx6PR3zOTt0o//VbendbYfyBjBKoBc
         FoUZqhG11g/cWQvT/LJPyuZ4EQaAedXwoKx/qACvyRW8dMHPJRo3aXsISmAFxaDn2ofL
         3hYFjiG3FBo6ujUMJ3vVDWIy3a90xxswfcSVdRgjTkbjK/9KnsHgI1WrMu7bvbrykPh+
         R4XKLAvfZly+ogRP+AU9wRVIpP3q2MOrGfiU8db579dzmJ8Ez45LEPn6OyMsQXh6qwEP
         i8dg==
X-Forwarded-Encrypted: i=1; AJvYcCWmb1vG7HBy+hrIok1RZa+y/3cm0LAxYz7WV/ROIV67MrEfBAD7z9LRDBivTl7pyKs9RcIy519eTqFIlPBg9HSN@lists.infradead.org
X-Gm-Message-State: AOJu0YwCvkx9T9VYyPubHqgZqdfbnFKzR9n48dJo45x66/MzQnRaz4Pk
	PMEIl0luLJ3S0Ha/kSICHq/zG9AAu3+nFgytoO/zDzLiu4lSi+JJlxagWRhVHA7Tk4wK+3SHzJC
	3OuApbP/AxDGH+1E+bI3drV2kk+++FfMGpPJL+58p
X-Gm-Gg: ASbGncszaj9aKkn97R0faOg1dyYQVx/IbGN7z9imGVmwQH7cVcl/hTOx+GFPmddqZLr
	g6nibM34nPEDJT9cSGuRfbZN9/wmNF+Yqa6S/TlY0sqhmUH0t2h/3oV0NocwoN0tfMJpY0AeT4F
	nEiBv6qlRHbW2kgVKVbcOzRuHde/qmrp0zYF8QBRwntUYVLOCpUXnhM+tDtPc7NlgOapDWyJGOD
	V+wIeRoPSJhwQ2vDVEpccJiBzMs9gsE0Q4=
X-Google-Smtp-Source: AGHT+IFPS+3sb9CZbTWfnTjbDa0k7A4z8cLwROgvhlDgLeCCeIOup1wcDfmt4xXnfNBN2Bv5bh02EwambURnN0B3nkM=
X-Received: by 2002:a2e:b8d1:0:b0:32b:6bae:e3fe with SMTP id
 38308e7fff4ca-3340982d970mr29405411fa.9.1755489201494; Sun, 17 Aug 2025
 20:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250816075434.31780-1-leilk.liu@mediatek.com>
In-Reply-To: <20250816075434.31780-1-leilk.liu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 Aug 2025 11:53:10 +0800
X-Gm-Features: Ac12FXzbC3a5fYlt94iOei7CP2T8RPhSU-BFGXIPrEu4iVpFb5TXKRGwyAlG1lg
Message-ID: <CAGXv+5F8ABGTRdUrf0j68cLiHZHSEFjwDOBtfTZBTOWt9APVVQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, 
	Wolfram Sang <wsa@kernel.org>, Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_205323_724104_A31275BD 
X-CRM114-Status: GOOD (  13.22  )
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

On Sat, Aug 16, 2025 at 3:55=E2=80=AFPM Leilk Liu <leilk.liu@mediatek.com> =
wrote:
>
> From: "Leilk.Liu" <leilk.liu@mediatek.com>
>
> The old IC does not support the I2C_MASTER_WRRD (write-then-read)
> function, but the current code=E2=80=99s handling of i2c->auto_restart ma=
y
> potentially lead to entering the I2C_MASTER_WRRD software flow,
> resulting in unexpected bugs.
>
> Instead of repurposing the auto_restart flag, add a separate flag
> to signal I2C_MASTER_WRRD operations.
>
> Also fix handling of msgs. If the operation (i2c->op) is
> I2C_MASTER_WRRD, then the msgs pointer is incremented by 2.
> For all other operations, msgs is simply incremented by 1.
>
> Fixes: 173b77e8d8fe ("i2c: mediatek: add i2c first write then read optimi=
zation")
>
> Signed-off-by: Leilk.Liu <leilk.liu@mediatek.com>

This was

Suggested-by: Chen-Yu Tsai <wenst@chromium.org>

internally because the code looked funny.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

