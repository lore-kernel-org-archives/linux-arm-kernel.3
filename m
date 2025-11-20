Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0EDCF856E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY5BvWFohYUsQWWAbdgvSo56iCSLE2VcTftjflKg6QE=; b=iGL7aMcWzLtqGygU4f0Uh9zR1j
	glMqJ9OUUrjWjl1t/PYfSCEDSo860+upSssrI1lbEcT9IBS2fsfC1iI28kmEsGCTjaMar65nivIZm
	ahUUabRuiqGC4ZYudxRpmiNw18EXTlTnrIKxQbxTz7o+7EENindH8xMWbJveIe4fODvg5cRpMQLvL
	djujRrP7Hk6krNYkRlw4BesEzZXinU3ldvlgEwq7n7FHVnzcqRO9m6Qxzfe5hPwmYwgaxugCz5M5x
	FAnbI7mhRgVJiV3ZQbrLzN2GVrmQ9y1QtwQW5eN1HMJQwpUmqZFXwjIzip/Ec1iysJca2XFy/AHTg
	S9H28S7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7AV-00000006yIF-2mIS;
	Thu, 20 Nov 2025 16:05:59 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7AS-00000006yHa-2sbK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:05:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b7277324204so175623566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 08:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763654753; x=1764259553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY5BvWFohYUsQWWAbdgvSo56iCSLE2VcTftjflKg6QE=;
        b=LGBt0DTs2Ua3C/8EYFDy6eKh50DpIutfae2WnE3a2t9K/OVGPt1O7fkcakJTZGPM/A
         MnnL0MBmvZqpvk4ysShfdBitmlb/P/ziEAJVCGMT2LrIhl0i4QFn9nJ71OR4jniVaXm8
         xXtkIDw7umTZnqM8ZFLHclKCENX8H60gL+/7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654753; x=1764259553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fY5BvWFohYUsQWWAbdgvSo56iCSLE2VcTftjflKg6QE=;
        b=d9BO2YTCI2f6tRxlwt8mE6+Z1am99Pih3l2xHQAd9c6T0Hl10UmkD+g1Ylgt0Dhb5i
         D6x8dqgj4dk7y8hUWKelG0l6vh9fwEJ3yXLbrlcl3YteAnOc8L3YbIWqBF/Sv0/OZJkz
         nXH4a2TGH436U3KA/RYBqRNCqJGshII/yyaKlQaxtmlWBiyO4rXqSNdoh64kWNae7Myh
         TnJCF4yeXnijkk9OD6/Hk9tWzVFHCY0gMQsou1uQmWHDFW3aa/5Bv3dtzucWi4BoQBno
         hKBwiBYDLz/tkWlBSQSXHzKDK7ncUnb7GQnHq+dQEWXhfdkFC9dgCnBrGeFcO8ZodrJf
         w5Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWesWbZLcEGzfPSotFHZSxNutygZY7yC0e77GZLAi+fcAJjHDWpG47jdbA6gYfPA+GbVA010BAkUhfoMiXv9zi2@lists.infradead.org
X-Gm-Message-State: AOJu0YwnHMmk2erEzjapHyxHiXxTrKfFV7rGzcxYUjz3mB50ZCwVYtiW
	7UCzimmJzKvtFmAOmoFUn+HG7x4Y8U1GpMZQnRK8e7Z8jFu+vEYVO0NErwkheJo2qUDu/sj73yo
	mioB4qtji
X-Gm-Gg: ASbGnctmajT5dbo9DAJIrs89ftejwbOjpJM4Cxk8KalY9WlDH3q9sE+Sw5J10LSEYHl
	AbUU7n2GPjwWvS7jDnxwQQdBFsSm98bfX+kqTrwCJ4NIJMjVGr9+aRsOSrC0YLf8fBvYlrg7j6J
	SNS45nW2eeo51Ll2k2HP2Nkrmmvq+4tNeb35e/9uU0K0cD0/sHwsfBLoJb5pWZFmffbHlGFuvwY
	lG+BGvVXXILPxgA6unYVJEzAgRi5r0dH2+mi+AyiN9KkBcMf/iXkk7MdDCqV1FT5UpuEL5Q1jiM
	t7j5/Vtwmb/bs1ZDs2VT30wLK+q6srJJzZflpXEiM7szmgcQneTiuF4OoQp2wetoqzjAkiXsPyV
	hpb+7B6/q/NORTgt5EEDyu+b+2gP723kucZRSXBjp0g1BWrh9NK7ngR92UkoXt5SIsc6q34U4P2
	fTVqp4fKIvh8dEc4+8j5j2buqxsPMPS371Efs+xuEQV2xvYTqkjg==
X-Google-Smtp-Source: AGHT+IFU3aNLBycXpgxG3J7NVY66Ifgrm1IGUaecDg+Q94/TFIXhDo8ahc7MvGFIjmSs6zbo73fUJQ==
X-Received: by 2002:a17:906:478b:b0:b73:5846:b78a with SMTP id a640c23a62f3a-b7654f838eemr388651966b.58.1763654753142;
        Thu, 20 Nov 2025 08:05:53 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43e2sm233731166b.39.2025.11.20.08.05.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 08:05:51 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso1590988a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 08:05:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfc77xaUfa5LWpxd6HVyxhuoeKtGspW6rzVSEt+O0J4YJtdI+JVt2/bk+CRmRDpuwdzqAsQkZZXrbN8QKryfIv@lists.infradead.org
X-Received: by 2002:a17:906:dc8c:b0:b76:23b0:7d70 with SMTP id
 a640c23a62f3a-b7654ea998amr379971766b.39.1763654751460; Thu, 20 Nov 2025
 08:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
 <2025112007-quit-enable-3fa1@gregkh>
In-Reply-To: <2025112007-quit-enable-3fa1@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Nov 2025 08:05:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V7jja=CsA4QyrGNHPKbSb3wfbLbhET+j01cUeuZGSdsQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmHJc4rIzwwFhnOnl9hbzodCqBW9sxgLfvryl54nq-vWqoNlY_oT15PM_w
Message-ID: <CAD=FV=V7jja=CsA4QyrGNHPKbSb3wfbLbhET+j01cUeuZGSdsQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf()
 NULL deref
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, incogcyberpunk@proton.me, 
	johan.hedberg@gmail.com, regressions@lists.linux.dev, sean.wang@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_080556_759931_A48802C7 
X-CRM114-Status: GOOD (  11.74  )
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

Hi,

On Wed, Nov 19, 2025 at 11:12=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.

Sure. I'll send a v3 with the Cc to stable added and collect
IncogCyberpunk's Tested-by tag that was given in response to v1.

-Doug

