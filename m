Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79443C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 04:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=; b=pdF8vLOfB8RTm8bHHsvTWo7hME
	/eTbEom6D6EtbUiVoAlPfJSqxwjqFxIJ0ct+ei8YV6jUFSCuWcq4Ydb31d1S0NBtDJ8+FxdPOVHJz
	q78Mi3QWdo5EmvLNmi2BzMU3UGi/EYq6aTPbmgSmWoxGu2Qo1HXNe+e7qbdAuRUkU0ZEehqDG6iTd
	F7uiZPUrWJwWaIeqxR/AgjmBYtZrugvhkReL7TATAwwUrxJpzTUn9qhmXMVKL1uIry24jswvkGiUf
	trQJTUicosDwkWbq900iPkEGmGm5D8UfEMP+wVUm+E5Twk+52aIHEyNMcsAqvIrg3LhH7nekkYMxf
	GUTcwqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WTV-0000000DN8Z-02Ph;
	Thu, 10 Sep 2026 04:33:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WTT-0000000DN7S-0k5t
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 04:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=; b=DXVHCWgaKmFio1syGwXggkWqSD
	zy+O+FbKK7nUPX1Iw4YfC8YAETXl/JqEQtUv1oCynGsvM1D1aja8d1P6rvIuSCSIR/oY99QWxL70m
	9pvCVMedk6OvGkRMF8fg+ZbS9zLTnFputRxmWfbJ/ErP/hAvKxBUvv0uONFYdy6gGY3jh8SXevoSl
	B/wIhIH+XneeESo95uWIzLfg5GtWm3cM6FIGAhoz8ly1+oZgaiG6yiVce9OCSdCf96w77lWFNq4ti
	NXBsyEKwwNDTNg/mpBbJVCLQcGWpX1L9jY5CYDkk47PY14sjn86qBdAx9C8ch2vAEjJqAEz/UYgpu
	zd9j//bQ==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4WTP-000000020ML-3J1H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 04:33:21 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4b29fa803so172027a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 21:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789014797; cv=none;
        d=google.com; s=arc-20260327;
        b=KDr+FvtRpPq7YZGiEHX8aTvClimD79B8OIslLD1Ijj2eWMIDXF2kjoXV61UNaY+vQW
         rbtueyiTPjcQ7NLRenZ94AdVZamm0WqYZjm0FrM8vuwjtyGAeg1fjamG0cW2T8vuVuQW
         w6nPwRpHPcX2I2ksFnv0JkABoOVpgI9lebQU3OF4cycY1cN2jEhWd+w5o12cSK2sM/Lb
         Skk04IrZ+xM4epu3GOmDVEvgn0zXh4gYhp8Na7MbVkQIs091vdbjw8tGE4Ay41aQiwmN
         3DIBRvQLWMm4GQeYHttiR8kAasCGIPYHEeGf6Bmgis+HlD/DEU994wGSj9XzeTUzvQwb
         r2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        fh=/I8T9yqS6+WwrQpsGvgPUalZtGfOb2mxp/OxptUatro=;
        b=p7aQbLpfSK4HJhbTKKdSURnEdj/48QQLfvb9jFWM7xJpOBMo5Os/HbSKCb73NRVHP7
         sftJ+JusIXfDl+NCQVo/LndiX2qSxjvvPXyJSYASVmNBTN71Vk0V09fxvjezbH5P+Njs
         tajtL7h2oUaH4O5b2LxRkrXjrZTJFyXWIxhMJ9yWqUYjn7FJtbXJ+fzqrrbhtfMxgGuO
         W8PhzxZVhwNuTIraToTZQH5Okr0Tc+G1xAfZEl7c8ZOJXTeTzLTuJstOGeZfdHFOiKPz
         SgiDj3fir/soNZQKNIYA2lvNd1j8Y/CKfm40Rgjcskn9EpUhFM1tZEcSyStnKPN6Yt6K
         pXYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789014797; x=1789619597; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        b=hxwU1VgC8iU8MX1Q1JbyNNH8zel7m/L1lfYtjdHz2Ttrdsoy1cJZ5vfVEY8H7c2y0q
         1mKgbl/4uuVdVMZyf1W3X+kUZNIbOKm3ocvPWgxwPbbwUMqkgOxbw+7ae4UKkGulWDDZ
         0oh96UbELWgovU2fblxUmfesGRGfh79aAMSWZAEqPFYICMTuBLRp3bB6DFGZdbayQMHD
         lqjm+AIKTPpMP2MsjJnbF39/pVayjwGp6DfY1ilXd86cvUAF63SunXZtwxNE65erMXc1
         JDKrEdI7WF8Sa9fSnOJnEzQIbVrOj60KVctk/hip+5rvF6Hthg8DyQ2CSvBFNmzwMqQA
         +74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789014797; x=1789619597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y6TX3N3n+lfa0dOxSnN0kQbGOsHF85eY1Uu8xL2BhHA=;
        b=XwfhftA/F+iUdAkYFpl5FU27Pf6DuLDxd1iP1B6dL+qlx01YwEyhItBJn/Sn6/4l28
         1LEeHSvuKq/aSNW9m5X4qhNkTPDV+IQxGRClFEdMM/EnrD64lvveOAH8VXVYGE1bFPjZ
         V+5I47Y6UdZVE5tXs1UXVIgVmFUWmQIUPhqvL15f8ClH2Q2F7NHsLxzlTHScPcQzlJ1R
         KPc2TjLhChgQKvPYJjAx+h1AjCIYCB3HvwUqZRo/ezYeqh4SQIuCSykC/rBYyAXBPO1W
         SyEiHLcuB1VJsH2MiQKfogURwbjllMNW237yJ8z9vYSC6ipeYt0s3pZuicH2XEqXAe3s
         +Z6g==
X-Forwarded-Encrypted: i=1; AKwUvBxMjA2JvmNKEQeQaaola1BA7Y+y0loJhuQyJKozk3GO4XNhJ6YgAK8ycAPuxSGLFkq8oQpjQ5nXnrf/GWlm+KMy@lists.infradead.org
X-Gm-Message-State: AFuF++lks+h/LYagOzOv+3zWjvcKTiKI8lAJd8XULYrsgcR1rfRnI0yc
	aLgONlZZML8u725cZR7+rE8JIlpwfO8OFcYXBPWKS4T27CkN9th+6AK6s/ZwiUPGX9119cjU8uS
	sXVQb+uZA4QdYQogvzVdRL1+HxNfuOAs=
X-Gm-Gg: AYBFou273frfVrCdwck0L24HwEAs2RXw5Z9Mm5a6iGBWMt9ahDYKtddl2Yv3BnQlgrQ
	zaS9ZKEiZ2V0+orXDE2ITfqqPy9Gl1C9jN3dKmJ1rn8UNBMytJsEty0uaip5UV7I3TTKXVIEijc
	KD9VJUENpppIOUe+6LN+l4g2O76xC7PjA+VK8sbP9uisRN8o5/VnxNSgIbsMo2DB9/OIgQJmQeA
	t0ij/FajPyeVCNqI5t9dBrjQWASBd7iI36eiDTIHDOr/K9IegU1amx6/5nibiLUJfn4m30waGFD
	AhiImXEXbz8+UUj04EysOAfqcWPX2XUesBF5nmwWKKFTSZVJvDqmbmGu5iB8/YZQiIG7z98SqEa
	MaqC2Kt5NNx3D9ppkYLdMcVLX1hgEM5Vj/fwlXetcvIEADBzeq0tHlYOeDe6toSJOs6U=
X-Received: by 2002:a05:6300:218e:b0:3cc:2552:ddd7 with SMTP id
 adf61e73a8af0-3dacbd6e443mr7502421637.5.1789014796911; Wed, 09 Sep 2026
 21:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260907120310.135693-1-phucduc.bui@gmail.com> <fb39918f-581d-42f4-8afd-4d467902f9e9@collabora.com>
In-Reply-To: <fb39918f-581d-42f4-8afd-4d467902f9e9@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 10 Sep 2026 11:33:05 +0700
X-Gm-Features: AcwNN1Utf0CzSWMalbFPITyh7LOjNeseUmdFJ3DO0v7FQXT2fxbgmZ8RRqPBOlQ
Message-ID: <CAABR9nFqerKXDocMxFfzvvj1-DfyQDvh1z8W81S_Ss4cMok1tA@mail.gmail.com>
Subject: Re: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Kees Cook <kees@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Trevor Wu <trevor.wu@mediatek.com>, 
	Douglas Anderson <dianders@chromium.org>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_053320_170713_48D6DF6E 
X-CRM114-Status: UNSURE (   7.36  )
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

Hi Cezary, AngeloGioacchino

Thanks to both of you for reviewing the series.

Best regards,
Phuc

