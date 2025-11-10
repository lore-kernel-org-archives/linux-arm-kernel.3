Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB332CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 23:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5qle7VxOWU8iKUzLYgzn6NH9G6XRkWvpzlofstrVjo=; b=ikknY+2jIttQu32mkJgDQAJd6s
	Y6xonQWPXVqlFg8eVsJ5Vc/H5aEYZIBDlcDM0XY1jSbcTMVILvLWqDePlOMH2B8I3KYSrjYJMFb3d
	fRHInsR0r21uz7aeTHaD69vOt+GV2oRAAYkxMZ9a22WBqnPwZo8T0mzdQzEzuEp/7Ge+SknKjm7te
	tYDvKzuvWguhTGIHgEmK9fEkONqildC/DTFskNkR1tsYjibwS5MNwSIpVHopuAYbGLfWHyhmVxEoZ
	d5XAJOIJZhPHKJWNCcpuXOYrmQSS+90ngOOY6WfL3Ee6KbsFEMvS+bGmD3T8h49KM+0ZUP7IZWEYz
	RTwXLHHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIauC-00000006EWa-3S6e;
	Mon, 10 Nov 2025 23:02:36 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIau9-00000006EVo-2N6R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 23:02:35 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-63f996d4e1aso3170513d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 15:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762815752; x=1763420552; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5qle7VxOWU8iKUzLYgzn6NH9G6XRkWvpzlofstrVjo=;
        b=f7LIjMaW8HAKmtEDuTqfZxnnm6ETeOg6wxiSM/7gGj6gfq6cI0XSyvt8gLDMya5YEV
         QsEdprCZeUGXZhQYn9JiRePk1HTrsgAiBdD7Lz7cO4OR4pSmr37oLeoQ84WPE27/GwcM
         XpGKlqNxe0uuIib9kOKGK4+pL23K8zl1U+MS0PC79J/Hat2ArDwAqqGVfP94MSCk7Eb6
         jPuaZf7ZJuHjX7YaJJKVFs0GxEQmuRycwuXsotPImdXuDPFQyiEyjV35t6J6GUIh9ZJ6
         gnG0HGCQG3vHuvO5sKfgiUXmnHe6/wsaF+oVWUpRiiJcsUc06lI1qTBo60lc0FeyYjk2
         THLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762815752; x=1763420552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5qle7VxOWU8iKUzLYgzn6NH9G6XRkWvpzlofstrVjo=;
        b=Rpw4p54O5kBZaQzymF+m4Iv37FABGkvdf5Ea0nIryKzE+E7LxCdFOSymHv0JYHeA2H
         oEGgUcFt7zi9crjUI1onNvwjHmod4N929A+jYMe8ZVVVraQ/J4NMBh3J5W2xDESvhTV1
         qzUIwJXtQeHO0xLiXDezMrlb/D/kD2+L5oHAgECgQjxBnI6kvdcfGWwcO1A/ouKrF64V
         CSka359VogA6wJD+l/n1GUTbiHLICoxbsNJRQ83vup8xkYRLQ3fo1q5ia+Q5OG7MtZ4R
         jM9MCsRrXtHgIICcyLCbnFiu7Z5bSyQh6vamXhXMv+zl4WEQxS66TbNti9ja1vm0fUb9
         bUCA==
X-Forwarded-Encrypted: i=1; AJvYcCV7A04ZzBg0BZxuRflSjeS3bcZXCKxA9rdL06T631HJpvA/l3P1/NGHXLlyVsrZFINBIRRlxjCOvFmkkYKBHCBN@lists.infradead.org
X-Gm-Message-State: AOJu0YxY4dhrhEvXzgEwNYql2fLODLQCZ8YhJE3F8ISK3zwLw2cQI6R+
	mxtjDYDN2CqV9d4JjYNYy9qpb5G7zUyjM7rbpsRKNg2p29I1TDRky3BazkQrwWsJhpCnM7XtDmb
	e58gayyhgFMEn2Rj9RkmXASegDETPq6TyEsXxvW8pZA==
X-Gm-Gg: ASbGncuN8LwF/ftCZ4/2dhE/z8K2B+cDREtMecLUyxSwfM1VfEfA353imw/x0ZPyOgn
	0IABbWVBFvv0FWh6YHGmh9N3qmgOcC8tt4n/3fD4YNeoyrUj5osFsUa9h3HeLpOK5HjtRwRMTDK
	KwgT8ceU91mGebGHll3BLPQ+Q/0o/gVz8/xmDnaZVcIkjm7MfB1gtgbEe1B9MEIiEpp6hkKSZiG
	QJ9HTvr7ys3ILCmeBJHYnI9Aue1LJYSNRq5yv3i+31DyR/SnD5Yp3w130q/
X-Google-Smtp-Source: AGHT+IH6NHwNRdzXaS+QmN+qfk8m2r/FZh8cnCLNpPmojXJfkBdWQ2u20ATg0QrVP2xgMhdnhTJVLjKCqz+f06cVvC8=
X-Received: by 2002:a05:690e:1508:b0:63f:b985:66b1 with SMTP id
 956f58d0204a3-640d443bb2fmr7893340d50.0.1762815752364; Mon, 10 Nov 2025
 15:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20251027132817.212534-1-linux@fw-web.de> <20251027132817.212534-2-linux@fw-web.de>
In-Reply-To: <20251027132817.212534-2-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:01:40 +0100
X-Gm-Features: AWmQ_bl6gy_kvbbOxsO0c9yQS8V5cJB9oHDprLAgoRQJdA1aIm3YFAnru5uFW8g
Message-ID: <CACRpkdYwh69JsvUGoG=SrYTBtgUCFxTUV4Pxo9aAHuDyMqbBdg@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_150233_610029_9DF8282C 
X-CRM114-Status: UNSURE (   8.78  )
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

On Mon, Oct 27, 2025 at 2:28=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

This patch applied to the pin control tree!

Yours,
Linus Walleij

