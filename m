Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30197C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=; b=k2JVJI+1YgwmfGL+go3+EY1X5u
	0um9eid1O0rFHzByWyWZxIwyoMJPA52XyG+3YEJTY/y+v3iqncqFwbxVtq8VvXXVC9VA0KmrZONtf
	tbO3itCXBtf2NKKWbdJwvFTRvfyMIIWS04snJd40uyTXdS1g6hFkD1O1ZuvFetC8a65JwNXmT2vux
	mWHsc91J+in4HyAIOdZa0H+pUUXNGEdpf8DEQC0dbGD0r4xyUijg/Uak+u9azCh4+wKbGyaTVdBrZ
	LIdPTdMZ1lt4c2Y8YXKlSRLBwC0cvBoIA932tpdsr4P/DIah8uNCJZl1ERu50hFLzA7LFN9kPTikD
	cdFQ0LEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyJc-00000006oMx-0dbX;
	Tue, 10 Jun 2025 12:42:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxky-00000006iWe-0Tb0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=; b=BjtHr57T9hgRpty+m/Nuob9Olh
	0Y5y0h5b3LHXfk9FU46+IH4PxY9wlRZQx84SV268c4a57EXuHt8ruEpKQRlj/Hqv+E0rADswA7EZy
	I0lParNCslGjuxtoDgkFO8KMtvpA/0EZ54ddMUegvYWubCEOOAUbOPRx9e3se2CMs8mg7WiWj1x2d
	n4ZjML5yLwgqPGW2H63b9pkW/4Moe++wYPYueUiCFw4a9IdB2zIHkAqHdelWpqe/LvCJ9ZRIxKFdN
	pRnIeTS+aMgG+jOdQCBhJJqLYgMkYzMRc8ylaKiJU6faCp8GWElr0B6QHFdeQciSidvPqH7LNeBRJ
	jYuB95pw==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxkw-00000001nR5-0E50
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:07:07 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-551ed563740so6644247e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557222; x=1750162022; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=;
        b=hDZvqsQ8E94qsSIXnXTv+hRlwEgnNAS9ETdYze6rHvCosG/oKp5tGHQyochHWLKyzM
         z+cgrZ2EVwUdARe5JcnfsLWH5PQtWn6VHar7kbk4V715jisYZGsR7ckTBc07LIXnro4x
         rjrXdyaTuNxrAr0o16blvUktegGTdbNpvbmEZnqWIQQx+s2TyuE4MMvWyIwFTQwUaqQR
         u4MZOx3Q0uQ4fPNUMn7ywH1IEgv/Jx/hSS99T7OYHxw3fcH3sQwc/iIzR3Zp0dYHsR+P
         xE8usEPEND0gBLVL9lCGhjJ58gOdbc10AvvIoSkjI8JA/jM/GGURirtdPJtfvDV9NPyW
         gVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557222; x=1750162022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=;
        b=YO9rYtiM63/Q5H/jJJzCJy2nMyx9lkBJFINd0FKLYNkcGEBtduQYdGdyQq3RuG9/D0
         kvOWicw9tmjwTMw1c1iILmh22Lj/WCsP3NkEniomUgJiVSL0zjfejyfGGNG7WzOz6UjF
         6MJLaj+5hHN5ttRhbsGh6UVcuNwoV17WcyhTXrhX3JFvmnBjWNP0b0RT/VQuI1Dt9KdN
         zZ4WO5u43FHexMhlRuGZI4db3QFtrMgGl5pf1z8/ss8wJX/27Ole9dCX75sG7U45/gFZ
         hJBz+GMbHK4ufmYvSkWtV8bjtLlsWIjHOPqHwx3S0L5+bbFUiIGMF750o/mehs9HdgLc
         tx7A==
X-Forwarded-Encrypted: i=1; AJvYcCXNaZmV5O8EsFHTG4z/vS0+ynLNNAcE0cDq8pdTElHDrRkg8NrMAjqMuLfTN29NIGzkQfHCeCmSRYp5uj1UKyZ+@lists.infradead.org
X-Gm-Message-State: AOJu0YxXW68dgs8/WUuECB9dsL7YDkEFRkVu8pVdXs+yRIjA3lO8u/w/
	OKCwtjFO8sfj8Gwd2kMeN94IWGHaq+XDJDRELPPtPjDl+O30sGp/wqN2BE0WK6hin+HSGMpHFCm
	bw0uF3KgaoH1BlzzMYW4k24w1CPZJqFhyqkYplIQdXQ==
X-Gm-Gg: ASbGnct4qI9iJuQOqea67zdtClzC7OHXjxrq/0HOy4WLraMAViwM5q47ML01BHYrDaD
	s1pcP2hFCPu9Gxy80SjzwrOD178IdLo1wUwCqgrrMpMTcUxjvrglgrf6Kq+q3I/Zw8tIfZXuPDa
	awtiP5C8o1JeEUoZc150VVIP58UqvhP0zKFwLTEEEuOwLdMEMScCFt8w==
X-Google-Smtp-Source: AGHT+IEqz0WMqtI0x3GGlKwfWemlBSbd12UaQPMKKY+qV7hhxbjKafYK8sYr8Wg2JEL7ScFpC5Ui0NiE4JM2Acs5Gg8=
X-Received: by 2002:a05:651c:220d:b0:32a:ee4e:56ad with SMTP id
 38308e7fff4ca-32b1533b1aemr8972041fa.33.1749557222298; Tue, 10 Jun 2025
 05:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:06:50 +0200
X-Gm-Features: AX0GCFuHU7ZhdHSe32gs089Kj2im6LDUCERAjIX60g6Meb5i30AmFDVd_Qjjj2o
Message-ID: <CACRpkdaGMiNwBAa60hFzsboV3JCj=sWVz-NKah=eNk+vVnUHVw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_130706_198389_702D510B 
X-CRM114-Status: GOOD (  11.72  )
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

On Fri, May 23, 2025 at 11:43=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

> This patch series introduces support for the MT8189 pinctrl driver, inclu=
de
> the driver implementation, new binding document and pinctrl header file.

Cathy will you rebase & resend this patch set based on v6.16-rc1?

I think the code is ready as long as the device tree bindings get finalized=
.

Yours,
Linus Walleij

