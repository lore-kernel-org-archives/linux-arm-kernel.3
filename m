Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B58FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juPJKcDTKas6DmHfE2eez3lteaa9FffyFh6KyQJpAPM=; b=iEkm5C0U3yM6y1rl4zAII7wrg4
	jf0JhyvI4ewbVKBdFxWtqPek40Yt0XEAeps3gAG5CoI7ojfNThA5UMOQuN2ySbv5ErhT4UyA/CvL9
	zXteIJQ475WVW+rNCy4cJyOQTD0ZyXsu3epDTQiIY01MAXwrvE6nXFLMBXopMuWj7LfuLzzwoR3T/
	30rwhALIfL6siyG7sMQOZpSbUwkPZCJPdilVGkJd4iM1xtzeW0wVjlSUJFyuR+5AjmpJ+UtUOgHG4
	BXemG5teC8zG262HLbfwYVTKIq+PdR/XTlIX6fHqnoKJ/Ao60yuQHHO1xG634lb1PdsN+W67ZGVzy
	eoVVZ7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXvn-0000000DdWV-37zJ;
	Tue, 17 Dec 2024 13:48:11 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXtE-0000000Dd7M-3avV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:45:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54024ecc33dso5732349e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734443131; x=1735047931; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juPJKcDTKas6DmHfE2eez3lteaa9FffyFh6KyQJpAPM=;
        b=upvJOyLG2hLmQ4EVUjbr6NwDcCZ6LV6xCcrjOYNACcXSHF8Lbdk4QLq7n0i5qMXePI
         PY7KH8y1e4ChB/s/dfqYt/muUQKP4IRkkVZ4tgJ7jPny4OjXKo7TWGaiHEMrruDtkTkc
         18OYZi714xpM+s7XavpANf3Vqf1/E8fJWUWGSseSezPhSBXb2TOdAVtPjdvcHP/k9APY
         nW+NQRnRQD14aIg6m3b79/45SamMQezNwioAnt0+WJuAo7Rxx01/8x9EmPgGP4WCauWC
         om40pkWh578knXdulEiV1F8aVz0BfOwGDJybDWTpIG5Iugf9RvKg+21CRr65I06x13J+
         KmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734443131; x=1735047931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juPJKcDTKas6DmHfE2eez3lteaa9FffyFh6KyQJpAPM=;
        b=Jzh1sb67Ukr6R6wzl2Zp5LdocwV+26FTVX23hEVxiWU1feTpa4O6sQXHh140yi4O7+
         3Jg0zZ1CxSSJT4bWGjZ0Fs5+3Q/eLq6SfAJSC7Rpjteln+3hPTmgtw4trz8XWsuWKvMi
         PyAUIOgJALzGL/b4OHCFaD/6nVgmBC/cC7iO+MpmFxSOzp9NYSCdJmRRUtlzwrLRfpS7
         L89lLXhFVrT26KfCoXjZ01TKMxk6auOZFQy9WGS+DUnIt2IHoWSO17yEqCr+ZwvviusT
         9k3mfT0hisfyEWgrmqwUebKPechfuZ4fNmQYAGfGGi9y/Lv+Y7i6TqDxY3qeZvGqcIrr
         rpag==
X-Forwarded-Encrypted: i=1; AJvYcCWjFI9WoJmROXiU582DlLTse2V9VmWj0vFhYBXhNNMQJ/qv7ImoWkANcqRZpxm8mILmP3FMgDA9ZwdXc1eYC9cJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ix4i/nXk8JmigdeouXbSqno0Ss3RkDpaw23jc8bfiELHIlPY
	ohbAZk691zMlfj2lwa93rPVJ+rHj4kUXyZxnb1CruhKhUm1QP5b+ZuocJERQorplP+Kb/KCSPCg
	ydUCr+hoCvC1Dxkp+JGQuvRacR9PqdSa2ZtCgnp7MjGCVF/jhcjA=
X-Gm-Gg: ASbGncvRQFHujnROmAZsf9wl62/t66uABJ/ArJkAmki0E43Fz6nLWH2FHBw0Q4n22HV
	DLHD8iJE1cA4pVw/PZzXMPF35s7Vz9SVy6jSMvg==
X-Google-Smtp-Source: AGHT+IFR6FlyV7xGudG0pVgEPvwRzGY//Q2aR/ufrejSiOLM3v/BAnZMkPxq7smAseJgipFLo05KDrbMR1c3Zo+kE9k=
X-Received: by 2002:a05:6512:1383:b0:53e:239b:6097 with SMTP id
 2adb3069b0e04-54099b729dcmr5985204e87.50.1734443131096; Tue, 17 Dec 2024
 05:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:45:19 +0100
Message-ID: <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com>
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: chang hao <ot_chhao.chang@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_054532_890532_BF5DEFD4 
X-CRM114-Status: UNSURE (   8.07  )
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

Hi Chang,

thanks for your patch!

On Tue, Dec 3, 2024 at 2:13=E2=80=AFPM chang hao <ot_chhao.chang@mediatek.c=
om> wrote:

> From: Chhao Chang <ot_chhao.chang@mediatek.com>
>
> Change 1: change EINT from 1 address to 5 addresses,
> Eint number is stored on each base.
> Change 2: Compatible with 1 address design
>
> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>

This patch looks good to me, as preparation for mt8196,
but can one of the Mediatek experts please
review it? If nothing happens I will just apply it I guess...

Yours,
Linus Walleij

