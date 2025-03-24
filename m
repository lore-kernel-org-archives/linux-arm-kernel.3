Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CA9C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wYOaUvH2+wGNYkwE9FMO2ObsGp/j2F2VQglfrqeSwY=; b=HDqtWVKLT5e6HsX8lbJb6CsGlJ
	N6xtUJy8dIWg48WJjBuz0B2nDaQlX63h0a86nOkN8vDW2ngG4Gu9K0IcgExbjYWg7DjowSSyMHLI0
	ncf/oP4usO/6oLTRCUqZxtdP+x3N/08OvhwxZcu2xLancwMQ+Y67x9ZAQOzdt6+98HuyRmveU8Ur9
	1GadOa3koctzRA14eziB8EJlrJtceji9eZWRTNlqGlg2HVMfGc1fajot+InfWTH7xpBEJEciGWh8u
	wFO+tGTjckA/wO9Fb98Zol9Xk7RGvuTFE0zO7gk3oR0OxBvadrSBvNSDgq3r6Iwo4ma8epQQbMFdC
	/g8KkTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twceh-00000002Va5-0Tya;
	Mon, 24 Mar 2025 07:55:31 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twccw-00000002VKY-1HXH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:53:43 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54963160818so4867527e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802820; x=1743407620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wYOaUvH2+wGNYkwE9FMO2ObsGp/j2F2VQglfrqeSwY=;
        b=sVAgHFZwJT+fm2fFVXMh/5u+nLww4476nRF62ClolFhTM73TT+g4TDhgPoBd0oSbgU
         K2Gh4GxFO7Jyez/zvqu2qjYxvqndauNUkfQE+zD4uMdyFx25ODlYCGA46QPLEpIwEuJj
         k9Wd4SaGSj8eE+mlRI3dshScFEVkNDU21Kx+ddXUcyoqtTaRt5os9+GAMQxrlC7WnG5f
         OAPgjoIt08Z72KR4LzT5dGVcxerYQSN2a9sP5VGzMQ4PVb7R04aBUAkEs1PSOByy3FEY
         l3ng7+zCTxzWb6lp5JMmTfW65kpGXEjteQ5ufs/YVblabvljmmdBakkXPhykgABnwIBu
         kemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802820; x=1743407620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wYOaUvH2+wGNYkwE9FMO2ObsGp/j2F2VQglfrqeSwY=;
        b=Ej+956Jlj95K8WQV7jC9CV0k/u0fYzMosJ1upDqwDGrU67q+hqL6xpKmEY4umiLhdb
         K1fCZCZ9+j7wa7vgofd5qThlf+fqQZAdY/vfzXqUsPy+2pLhtcQAPoeXHEtoIGkEewIj
         xSJGP6ryKtqVvruyCeb1BZIfkxcszLwfHFKLiFi7KkF88JCrcRcy6JyK8yJqVPzErhdI
         JbBBURWo8p7RUdI16RRfiMLsArAovK/XvdGziAnwk0jsfViUEJvIAco91sSJ9AktFqQ4
         aMhdTZPtYHro4ladha0yRMUR+lUjBOdcseO3c8+yWIGMYw6OXAHziYuLiOFHUIutpFVI
         zeOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcHkWIz410kmzyKVW86l9U4dZyt3b4FgkIJBHMh9BMr4eyVTF0uR2in5TnOAYup4jOThEuoEHTASVZIl1qFIUV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc9Vsw3Xc1oU4ChvI+gJm30txCwcyq+NcL5HPj/8la5yjkX+lX
	Xy2VX56j0OS92tWLGDbX3dacG59A6rf5DfqD2N/isQgojlElbJS3LAfA4zRW8Z1Rmo6+A34tu8P
	o3rA+DFXW/bZiEcP2VLxWOJOHZS41qB7X8A+6gA==
X-Gm-Gg: ASbGncvg78O9QwytVH9ANIYRonOxX9hE/xu2cn/wxV08Tb1MfmtGk9VN+tdI2M3AAfd
	IEHGrN9I/umVpZGtUTkwd/qDOeK+G5yZvMGET6ZziP1LpRarOV1IwqIYoA2qh8Lx8+J6mVLPU/A
	xUoOUV4c3qqKxozLb/flPnNB9jwIeGLjBQ0Q==
X-Google-Smtp-Source: AGHT+IGCsf6gs4boVKvi872tdBJFNBLIE72SzFHUnHiJ2uqF225HOjiewrQhZXAtHdFlZf9qfC6RwySnYBdeijJWt7I=
X-Received: by 2002:a05:6512:ea5:b0:545:3037:a73a with SMTP id
 2adb3069b0e04-54ad64850e7mr3708934e87.13.1742802819820; Mon, 24 Mar 2025
 00:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250322035307.4811-1-ot_chhao.chang@mediatek.com> <20250322035307.4811-2-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250322035307.4811-2-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:53:28 +0100
X-Gm-Features: AQ5f1JrIT3jjMlJn7-UFm0QREZvmNoSOiORkmH7amKsqv7WDxLgWsH1QR8-hb0M
Message-ID: <CACRpkdZT1GYsZjeRHQqWJmuw5jg-kz7x+53_u8_Y3goyu=uRGw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple addresses
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_005342_335290_5F8B396E 
X-CRM114-Status: UNSURE (   9.30  )
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

On Sat, Mar 22, 2025 at 4:53=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> For flexible routing, eint will be divided into 5 bases,
> and it will obtain the operation address through the pins array.
>
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Patch applied as the last pinctrl patch for v6.15!

Thanks for respinning this, I think it will make things easier.

Yours,
Linus Walleij

