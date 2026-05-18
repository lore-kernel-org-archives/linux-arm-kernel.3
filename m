Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567B7CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4c2AULgCr+oAYdflJy/tl/FD0zXRMyuMjKCi/X55po=; b=RkQn9W2QpLDpo8JAV0EJ2WPnWl
	kuuUmwB/6HN1IcCXehpPNNogapIRiEnngEZCaMJzEuMMcGVwX667vsfJc/xrdobf9zEf7EGjjZUcH
	iXEYpGWKclbow5bRsA+7pqp8r0Qlrp2aTzH/Y7QPjDyaJlVKHuFXHumYfyyri9A5MrLuGU5ljRUS+
	0Qv/pSnf4Gd/DACVb1baYg3Xiv81NX83cjvjyZnl+iuFfC24F0tf5oS9umnpN0MtUVNrXODM96tf6
	KuYjPB+iiiSyix3tOGYe1TEfBGSenBbxOc+FQgFYqDwxQiUCkFGIRxd/7U13vf3zjb8/8llfuopkj
	5bFFasNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz8i-0000000G1Sz-2O7x;
	Mon, 18 May 2026 14:40:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz8h-0000000G1SN-0WZU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:40:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so28560415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779115213; x=1779720013; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S4c2AULgCr+oAYdflJy/tl/FD0zXRMyuMjKCi/X55po=;
        b=q4WMaaZc3BDzewQQYfW0d4ESO765oT3+viYy1e6ts2S3IW4HwQVtKB0arZ3YvXFJ0L
         TBfIdEz43xD6IoUyWyik03QNItxe7Sy4jtzIk+C++Uoetn8Ru6+MkDyBQh5Ysds1ItN4
         dqLQRwFHwxrYh4Ji02wCPKP6qy7pK7K8UB4OqIlC4mCZCcF2zYvuPrrlEAcEvDwAqxmT
         7nrHMqqxpP4VTSyIi4rRuv56sPvif/Peqo13Oq5hWZXW8xsn3iiL5klCBuGk6+/k4/g2
         IyJjcOUt6QXsTKheVbZNlQ8L9JyzdkjXsFGKMiuCa/sWLdqum/r2zhNNTYjXuAG+LoSc
         DDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779115213; x=1779720013;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4c2AULgCr+oAYdflJy/tl/FD0zXRMyuMjKCi/X55po=;
        b=H0ixj4NVzJb2wK5ZVZmWeb2qZ4Q33d+DrcXKO0nxeqXHwPz+AV4P8ijBdRektRXTsL
         7tWaivAygyO/EZ68ecqB14ZnU8U/s5QAoueV8IstwOn/hTUG2JRyPawCD1TkDj2+pBgD
         WHTk9RUO3r546JaZ9u+aJyxF/ETWe7pWTbLr+rlippXb6HgV0zcWoJ8+ATPFnTjtuR9O
         W68th+6ohDWfgVfNVWXv1Xt5WZ9cV6BZESfm/IfIHmycenDroDJ47M+rHL/yMEnT0iiN
         0+x/sVp9a1HUp8hD6yXdj98Gm4PsAB471x+vZwROHzr9BOXjXMccalXzvGAhpzlPu/Up
         iE8w==
X-Forwarded-Encrypted: i=1; AFNElJ8RFn9bXPdGogtDbEA3/Mr91OwRQHrXU0i8STF7+/CLvsxGVgRFIETNVtSh3duI89Qz5Syr+7/tJJOR3HxY92Zm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4M5P5P+ITthiHYIvfSqXOHxNlSr7tlL3DqprB2QwXQU75gYM2
	9sgbqZjkGlsX1TlZUITfJ29o7yr1nChqoHcU8mHQ/fruM41qw1nsFNyx
X-Gm-Gg: Acq92OE9zknH61NnqIKWh2JesCdGv7IuzgD/U4u1lTkajZHx2PQjuppQhIsukxRF7cF
	LWxGdQMjYRxkg/V2/WI+vpsBSbDSmjbsHowRCDArg+hh2doQGChV6ZNpLgLyd0dSLPHPXItw/S9
	BoNIsGOpXR835yHlGVbxttdveOd8h6boARMslwYkQx2etoXNTE/6vERNY1zTvfa+BrQAySaf9ow
	XLR5CCoAXxskGyfvGwBtD5ainPU4AxpTEbY4PcZQbFzKC37t/VteO91bLaS6MBg/iabiiSDiym3
	X5AiQ2HiFBPGqVrI/haEX5fPspHFTFhWW9SHsG4dtKqDMfGykacnnQ7OXp32JrbkzCaGb1lKOdK
	UCELehndzdP2h5QuP1WsKlzMx73mppB7H0g+BxQ7GIGRueFOh7rFm+N4WaoaAvKpJUKe8cwKXio
	tBEyuMZFwpD0QKtcIH8RX4z4hfblrviMfuN+4IrhX0VG9kGFqF0mEiatsXtmpQNgnO+uliGuuuz
	Ds=
X-Received: by 2002:a05:600c:c087:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48fe5cb36aamr189623285e9.0.1779115213181;
        Mon, 18 May 2026 07:40:13 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5e9d5d9sm303576575e9.15.2026.05.18.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:40:12 -0700 (PDT)
Message-ID: <bc3b786313adee30cc00c65ea98ff5258a816abb.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 16:40:11 +0200
In-Reply-To: <agsezxcxjQlBmesm@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
	 <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
	 <agsezxcxjQlBmesm@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_074015_169996_DD01938C 
X-CRM114-Status: GOOD (  11.71  )
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

Hi Paul,

On Mon, 2026-05-18 at 16:14 +0200, Paul Kocialkowski wrote:
> I also have a U-Boot config ready for it, which I could send once the
> device-trees are merged on the kernel side. I could send it to you if
> you're interested.

I do have one as well, I'm testing all open-source ;-) from ATF-upwards,
just thought U-Boot would require ATF merged and kernel DT merged
because of OF_UPSTREAM in U-Boot. But I'd be happy to sync when we get
there.

--=20
Alexander Sverdlin.

