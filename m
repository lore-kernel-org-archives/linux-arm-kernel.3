Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3117C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=; b=vzqBvTZtc8141qeg09YeIwyXCc
	uA9Y50Hdb9G3eClBn5llsrkv3jqriG/Iiyb3ukWecoCwJ++m8+pE+eg7KWT8bdBvSof/FTBoNdEtP
	FYmv4Xx2SH+H7OqFjjPrdZd2SJUwwROxx192BxfclaXbr6V1sLh7RaU63D3PNnq9YuZDDOUUoPcyc
	Nw+UyFqUy+BU9RFaXr6Jym8TTfwvvxehd2HL3n5saMHD8wVL2UD2XNDP4UYi6rD6+gLXa61gHa6wH
	CZdstKvz4fmb8OMrrjGzziLYJeUakvsehG5L1uU6EZbwTUhy1xvc7gAKbUisXnFfeg5H8rKO39kKN
	yrRGvrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wAq-0000000G5E5-28pV;
	Fri, 11 Sep 2026 07:59:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wAk-0000000G5Cx-26sD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:59:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cace91f112so5152235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 00:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789113585; cv=none;
        d=google.com; s=arc-20260327;
        b=ljX9a61fyzVsSvf1/I9RZDeP7i0siZUNn4P6STFHfVgcgIuX2TJPTOfGZ4Bg06Ua95
         auSt9buBJPHIQUUP5HruDhzna5+EWdqeHSpbZbySNqCSs7ON6/W0Olthp8Pof0P+XKRN
         ZK87Ci5a5Rfx9uzSC28JQ4IKlurgScxR5myyz7E0vGmDUtE9OomIuLqBFAPEA7i9McQS
         IcWRw+fxMXeXUq9O8mz6oNVsvVFLHemSlM9R0aj6L2Ut8N4VdmHiH3vmobPD3Hdl7WWF
         QUfdAiS19ZVEWm0w2DD1rawQv5zcllEVdtqbki1uhYTeF21IQKPWrkmJRUN8s0J2NhQK
         3Pfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        fh=ucaD1UYDrJORt9norX+eewQwFNSZljI8rLYHldvfELM=;
        b=jFNV4jwM1j8KeOYGG8pgbmOHePaX8c+1e5qKoTv7jpkku2XElUWlDOcrYTXez5yMiP
         S+P5qW9Us5JaaUAq0fO7LkPfbgbVnMLK7tuYEDZL0ZpK5WHChsN2meJSixdETQxklI0D
         WJM/mH4DGICqF0K2mS9c/UmHxAC+SxRv7wW6YOGiuC2TFuHJJc0at1xloAg+fqQ0OREO
         r6HtiG5m2etIOSYSG4UGszT99ZRvFYP6W/6fG1yf+Uei6wtxmwd2zvVGhJfJibsOISPK
         zLx5H5QuSM7vUa4jNeXdo70SivXqTNGCty7Kzez7Fr34Cpt2EVWHokv2JfhlVDJRhOEj
         xVHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789113585; x=1789718385; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        b=YLHx6eJjdc6zWjkhL6vEFft7ArUsl1Lj2zkQE+K0tKJ3xO7CJaXZrhSSazSdEyU4/7
         kQo2HEscvieTwUMxxaF6Sf4cK6Up7kEHSDWA6KdmRkIotWVyMbiBSKI+3zgBs66cW+Vj
         iO2EA2VavsqqCS1grVg6wnVQnnjeaVBY+IMBenKJoJ9RXCg9FsqfCt/Atz6rAqZhGQKk
         3CPt1OstBhYMEhdocLJLOKzYsvFc5UTqRnFoJ3HeY+DVpWlwW3y2+X17nyuUv/h+mYjS
         dozjPAogwvEsY0cSzMmIZf5b8FILP4fnmSQisjxIFoy43SAXj5pUJXn9186WqNeKdklA
         rgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113585; x=1789718385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        b=XMtO2xa2DdCWXS057Qz1JmBt2tty7LfQgrpjElxBuHGTv39hADbr81sILn8/tgtlPa
         l38Nqg8hBHGkKtjEDIYpVBWDX8rx5mP2rN3EMVz+UIt5P+DG+3z0LIi4HxRp3nBJlaEt
         aVN7wZaTXzQinp+E1DIknv7j3K0sKoVi2sfXs+qoB3mxFQdoUc+B1qWZ+pdxlcGeNL7W
         BXRF5eOuRYgsNH9KZOp1UErcBmErSv/jQXz/UqQLwwTUttoNfcQENMzqc2ZCp4sBVvx0
         ygUJi5VxxX/MHivqspL+P7lwP0LCbob9jEgZxc6BtlxKWREb84BHOxJ2R7j7bNvnz0XC
         lfjg==
X-Forwarded-Encrypted: i=1; AKwUvBxhaO+s3pWzAqdPD5Zxkn0ygaMz5QaPKYoX2gDG+YjcyoCRt/bZHBrwY3trm4ocrSW/PoFqXCCV80q2sn9qVZBh@lists.infradead.org
X-Gm-Message-State: AFuF++mrjXph+WnsQI8wSNZ+YK+daCJ6BSfvM5PyATQrfYWJ1tPwfI+U
	JAD9aMg+TlA9+UxPd/Hdmz+rLFPhE46XsOTrfv/IHGRakhlnoRtFVksCbscP2dAZcoJtPAlS/kV
	KRJVJ4fChQe2g+xMh+s+ktxMzDOIrz1Q=
X-Gm-Gg: AYBFou3k41mmB+lQUiiu9fAL3brEd51jfQWUUmM/d9DqsnkRaoXoY8K7r/BELN49aws
	UClhqdbfd2dAPmjqS5DaduqtfJhafwaGvoc01HquvVNTuwwKHSnXGGdVIqjpyY7doVVYibYpLJZ
	FwVrAG3xRBZ0uu/3iMoa2VWYyFXPxO+0tzOyR/DiClBASPVAdDriBlzZfb5ZHuOCIFTZ1cmVocn
	0maijxtdzgbhl2Gxy9SHCiRpEiK8fXihZwdLiFYDZvUnNvxfrd0ij8oIgb/Gx1Q1rYHwsuHPkUh
	azEdG8Gh82NoDO4vQg50jj4VIccQmwwwJ3jSqpALf3MU1qgpu7zdSIkwhZq6BkhpUfvWuNax/fe
	mfOloHaEjJPQk1nS1yWvPw4tkpfAZBDDVGnMoA2JXPSugqsVtnS2lMI5PLA14EPz2mcWChehl79
	9bmg==
X-Received: by 2002:a17:903:32ca:b0:2d6:f6ba:263d with SMTP id
 d9443c01a7336-2dd300d2dcamr38221965ad.7.1789113584990; Fri, 11 Sep 2026
 00:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-3-phucduc.bui@gmail.com> <aqKxadkfX9Tqx8JR@stanley.mountain>
In-Reply-To: <aqKxadkfX9Tqx8JR@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 14:59:33 +0700
X-Gm-Features: AcwNN1Wl0GTh-Z2Qm9Mk1VLPm1ruxloX7-jtdmf-ROLjbwYmLn7UVqKFYyP_TdY
Message-ID: <CAABR9nHCK4X5iZORmHkN_jH62e34H2J_rBLiWLkwcg+5JAJJVg@mail.gmail.com>
Subject: Re: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: Dan Carpenter <error27@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_005946_569212_84FA79E1 
X-CRM114-Status: UNSURE (   9.90  )
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

Hi Dan,


>
> Better to name it err_clear_mux_setting or something.
>

Thanks for pointing this out, I'll rename the labels accordingly.

>
> Since you can't test it, it's a bit risky to start caring about
> errors.
>

Fair point =E2=80=94 though ignoring all errors isn't ideal either.

Best regards,
Phuc

