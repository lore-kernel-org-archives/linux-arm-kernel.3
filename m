Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C87C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=; b=j/zS5RAV1hVXMamYoTFopWbjVI
	h1Mr8+OThYzeIutC7+gOYlMhBAQIjLDJMVCxf7cdhpI6wwmOSpFOeYWzXFx3Wx+NdHSVdHtSLxtyB
	N4IYmR4cLoGCwVDh039cZsVOFDq/hy844ZEflrSTDLtA1OpQBTs+/sYuLE9M06KIsIKP5vJ9LzSeX
	AA8SViCDOY4HSj2mKu6Bdl25H54iek8NVNOPERcmznjpvYj6/RFic6a3mNaYHkObYTa8GR1XV4ZcC
	8EjYPOVpQAY80+uMkaqxjlo2SkJWnG1QSHC6yNb96B797FCJ2KuJd1XcD/6i7PzExvzt8ChICSAXa
	QVVWoGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qoz-0000000Fktm-1vaB;
	Wed, 02 Sep 2026 19:40:33 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qov-0000000FksT-32ni
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:40:31 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c255acff671so218773166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788378028; cv=none;
        d=google.com; s=arc-20260327;
        b=CRL2yH5NiKzmTbQ7+OpYIQRkMDL9M7CEumDj2KOJxLE/y4agYTPsUDx96ClbkS2lR2
         MH5MRgAjm/Ik+OjkwvYQc+8xzFtYd1KnHQsdlHL1NCFdf4b1vLVmUIp+sAwikEfItmyV
         K/SbxygPORBjk81PFDgvP6AhR4uhDoAw8bahx+ACGP1opp5G5Ru2yOxC3P0hw9r3ruLe
         ySmgAH8O+67YLiSz0GSOAMhwci+NM4qlMGfw1Jp+YJ1xrGJKPNLZ9qRPwTekpnmu0uhy
         7b0sML6BWUN76xDW2jGL7RJ4k5TxOcGPnCo7pz4CDvRYCLREJMN4JmRNjQ7ej5VDli9z
         cecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        fh=zHGnlmaqW/JfzvYXuXkgs6ZtIk8WS0uVr0roJN6bPHU=;
        b=hpBy/1ETKJErRBREHoGdstfsN/n+j9dqNWldffRd5fU10a+c+Mks3y6gswlB3b3/ZW
         AB6aQIQ/rLnL3Q+a+4fSqiUKCiJ4QjbzWPgK5Flwl7Axlxoj20x2wp8YClT99UaUh/KM
         SnZphMv/YTp1hDKcJOEtCsxauAndtUZAq4oOEDhstBqLvxZVs0WZ9N6Oq+SC4DNZ/xrw
         9ijtBYCyK5au05O3DTfMQ8xagYxZJMWsUfmDJnoe9JpSfdCBv8tdjL97IOB0MZE1hXrO
         J4thWLOWu1Ks8VrlwqMYmqD2IbA01Cirai0j/VDniUgJpjvUEX1HAYuI9JQI3JJejMBh
         G/ow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788378028; x=1788982828; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=Gz4vNuEPHHMhnBPKJaBVK5+DB2l+ba3vNgoUzoBhRYZappn5yy8jl8KCyEjwJSE6wj
         7NAKfbZ7e69u/0G/rPcI8HZ8ncBkLpSR0n1FTFc6f9B6xzL+8tBGeGjg9Q5e4igyqVqH
         XOhDbqfkdIf/ddWL/6mr91NQzeoRBW7vvUspkbTXtDHc2cn6SboTTvSxSdkZMdY0i5P3
         HMJoHKAu6WJJ7ZUIe26Zib8hNTIRwMq5N+jyGTcOs4K1rY0liM7C/5bDwYEr51tLZ8K8
         LQD47kCKs02Jx2IZdLA5a/FLcYfGSuc+/CYz2qin2eL94pq89iuKeOmNDcIByE2QM3BM
         rPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378028; x=1788982828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=qZSrUpTqMb6kTuFeuo4EIYABt3VajZOoZ8p20v4oWOhH3wPDsVt5PnHYfbpGdw+R2W
         f2ArBnynVU++9oyGgOUdtvlfLMRL4B30QiWU1LhfPi+TLMbHhgYHZWhdvA/bTberXZKN
         XSvznN0hObwti7Eyve902AV7wvZ+PUpczEYUvEAf+L4JrxT1rMQNbsx/tNW8yyZVjUrq
         svwyuJWpSp+0nxXL+darhJ9SG1i0JfyJBLNjZmttkiojWc5/JTmk1eoczG+lVWz9WSwz
         OkMZ+gWK9tkFLq1w+cJObAtaNMrRc6kJR0lS/2eQmNKw2T/Gw1x1dIB+dcq0JKrnK7V3
         ErSw==
X-Forwarded-Encrypted: i=1; AKwUvBw39gKGcVyimPndtfiat6X4NW2gPBne5UXwdSmBJRZ2uI1OCXhZ02y8gzpcAFphNT5OcJeSPa6wU9njNAlSlTv6@lists.infradead.org
X-Gm-Message-State: AFuF++kGcffhh9/HzK7Ut7YZQO+WllqXaE3+JSJudVUjWqfAcrM0eNN4
	h/D7YOLc5pBedhkPoHch87dL6QFwqeJAwBfzrpxmDKpjn5NFlnLuHJ0Z2b9Q2AozFEs8i9rZHWu
	kAnalMF6mHPok+Hiq3tekdeHMKAD2lDY=
X-Gm-Gg: AYBFou1FpUnRqfSzZmUOOil3daFJfhuhylbYSyehzELQUhEbybIXHWQKybZC6ihfstF
	EKMKeQyh0MM62bh382oWflPNUT/JxENag+L7F4Pd5Fe7jwc7gzQXlmehNcLE8amU37KQch7u/40
	ZkrpgTVmEAwVc+sUMmKhTnhH+YrXmaZWIcOVNE8kyIOfinu7umhV9KZBUotyPyBTjEXwF6qwGKP
	Rq9Z8J9TwhYWXFBzHgY5fKY29rz594sJYDWAMa/hZGfDFjxDTGjIM+sh9Rvy5wv3cok0V0ai/Mo
	1AlZcilxEAo6scwBiIAuFsM0PZRymZW6TUXEsHrRCkk=
X-Received: by 2002:a17:906:6a06:b0:c25:88e2:fe25 with SMTP id
 a640c23a62f3a-c25d53cd18bmr358830066b.7.1788378027879; Wed, 02 Sep 2026
 12:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260902154616.GA2133376@google.com>
In-Reply-To: <20260902154616.GA2133376@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 2 Sep 2026 21:40:16 +0200
X-Gm-Features: AcwNN1Ue5U8Nrt8IK2CbOEno4dpAA-gcYG8T0qYRXxkQ6nYlNe8G_uXeI7qiNIw
Message-ID: <CAORyz2Kt=rKSJW0Q9pFJiBsa6nPGhHdNrsTsHcE4Qxpq5RsSaA@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124029_912393_7DF86AC9 
X-CRM114-Status: GOOD (  12.26  )
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

> What Acks are you waiting on?

Hi, I did not get any Ack for the regulator driver and for the mt6392
dtsi yet (patch #8 and #9).
I just submitted a slightly revised v10 [1] with an improvement to the
main mfd binding, so I think it would be better to "renew" the Ack for
that too.

Thank you!

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-1-l.scorcia@gmail.com/T/#t
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

