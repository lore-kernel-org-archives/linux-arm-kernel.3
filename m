Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF7DC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/+dZ2Z79f3TnZjAcbASKi5bWyGm2AchTT4KVZyto8o=; b=OwyH6kVoCrjK8pj30WY7SgRr0D
	PlbJ1cg+ucyx6Dx3nNMqbi7K/AhAJAuOConzMsCLmJmTsp4/xfJ0OYGpj7dZYDh/wl038pdF+RAot
	XwPmnwHMqb1Vi2wXMvtwdQ9dp7vRsHNkBfnuepA1p+2t9wi9pB6RkO96AKlgPZJpMa3u7WtZPQMvZ
	aI38Jyrs6mzvTfrcYgIhNkpkngI4D5UfZF4KXYLGtL9USbFJA3Rck/K56RxaaRWMPlWVFOPHrl/k9
	4ask3DXpzj1MxKZ1cUQsfEdcGIJHgyhAHDDruiDSiqZTVjO4l4HhvSefO0JvPRwzHoaRQC7zUD0mZ
	wxd2Z/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5jv-0000000DPN0-3EBW;
	Fri, 25 Sep 2026 13:13:23 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5js-0000000DPLs-081i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:13:22 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so3629215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790341998; x=1790946798; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/+dZ2Z79f3TnZjAcbASKi5bWyGm2AchTT4KVZyto8o=;
        b=CQ+ECNjGB9PvBwXKluZRtwYAscX+EIoogcKn5S7501ND1wueZH4fgmMaHE/HpWeCmT
         c+NK8Ce4TG7tuFZZbe6LrDcvxb8lmYbO6xPwq6ivBAcnRI7CpMk7HaYACZt4LB3txr8n
         D8cNZ/T3Ma+15QHKarvTnybidKtzZpzLPBFIpdC1gOv+BVeU4QqAzXenxVeOwlAS0yz+
         B/4/M1ztpu0JfpA8tSKioI7lMFVmqp8SvMxsnjWXOlIdu8plvNnXrujcgQNnXyuCRmte
         8chaNNd4k4fc2Fin6XiAIxusEt21P80U5V4iPC+QnV1i3NSnWST1Ed0mllHvux+XXksK
         SXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341998; x=1790946798;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4/+dZ2Z79f3TnZjAcbASKi5bWyGm2AchTT4KVZyto8o=;
        b=bLQcPLtAgxq6wXEaysq+gZyBxnn+v973emhNwm6rGyI31InFTwMXlIBtNc8u/SHjhX
         S4LC930i2GqHQ36L7SH4FxMfqVakc2s3BrT5K3WjX36iNS4yQwIHYHjyQDBoVlDpkrLk
         TozQQk5125AIl6FJM6r3MMqKV473dW7x8xraQiHyXliWNLnMVv9PygJeH8uqMCGIPZiO
         uTDcJIJGMDAUNDKWPfq6YTw5ZdJDD1Q2GPoPPL//QVFQqS0J42xahHbVzhjTHNkl1xYS
         bUyIVH4kwcGr4MVGcE84zmy4sxil1S4xCFg6L9uyCkMd/fx67sJHULjFn859eU1lozSh
         9zVg==
X-Forwarded-Encrypted: i=1; AKwUvBy8691bVJqEQxskrZChousKo3K48N3e/CxVvgGrq2FpNN7w3CGeDkggDt9F0sX5GMo3cQeMaokvRMFY61pWP1yt@lists.infradead.org
X-Gm-Message-State: AFuF++mpDRf5LwI+SuFLAtmMkXJ5nlV+1cr1kUyAxOqJJuIZ1GHohsT0
	2wOUq9X+H4pPHa49lWxPNxshIRznmnTPo1KwQq2ZklN2ZUef+n2PDbzKg8VUc2gzngk=
X-Gm-Gg: AYBFou2Iqt97bJnXND6Q1EQLvQ7CIYhJ4Hti4AAReDfL8SAEslZ6evInsKsXk3ErYx9
	xCEkMI9FUVeKUi8gvdl8oGLeK6VIncsOZbSgQApb/Yq1KALAsm7yLwM61z3rrRfk33xcbXQI31+
	s3dSIuaK5xPLuPv+Ty1/AfHPrz3qu29zq7ULRQ0Fs0I1+YvXIKj8LDq+I/kKHM8T+4XSUJgi2gX
	DFaRsW+pg6O9vDV3oEZuOpzCONRXoKGdHaU3lLNsGI/wAqN+vO3WjW2evJm5WgashVRn0TCrU+7
	hRSHyIReX3EhdUB2heFADafrE1AEsWUfCGImfP1xD/4DFaF+ebF6HxmB6v3j6ZW1fR2cwsxlOJt
	reecQJRTYjRBskLfli9RNle2+1adu0HFnzz/2caatQNw00+5nn29femX3XhdkmRaK1DXdxVa0L4
	PT1FTY2/EYRKky2j2hZJfFGI2UcHzBtSXR/sT6hilp6N/ATxT4E6aOYRAJ1K8uzHh/S4hmLC0J6
	JZ48aGxYkp68tcRxA==
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr99559755e9.4.1790341998059;
        Fri, 25 Sep 2026 06:13:18 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fedec53c4sm86924765e9.4.2026.09.25.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:13:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryan Brue <ryanbrue.dev@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
In-Reply-To: <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
Date: Fri, 25 Sep 2026 15:13:00 +0200
Message-ID: <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_061320_411203_A530947B 
X-CRM114-Status: GOOD (  11.64  )
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

On lun. 14 sept. 2026 at 10:16, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> On 9/12/26 08:40, Ryan Brue wrote:
>> All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
>> field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
>> MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
>> bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
>> time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().
>> 
>> Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
>> FHCTL on for mainpll, mpll and msdcpll, with SSC.
>> 
>> Found by inspection while fixing MT8173. I have no MT6795 hardware, so
>> this one is untested.
>> 
>> Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
>> Assisted-by: LLM
>> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hey Angelo,

Will you collect the MTK changes yourself and send us a PR or should
we collect the changes you've reviewed for this cycle ?

Cheers

>

-- 
Jerome

