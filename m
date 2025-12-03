Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC9FD12691
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0dqnFUxVAgOq5yOpOOqeQxSwqMfw0XwWJ0/CitF0RE=; b=4XqB0Bmq1moPFgeCwBoB9YvElF
	z+lWDD/0P2SodqQccPxUoWWHJAYNcMmUm/sIZQH+TsU7SdFrz8Ue4VLySidwZdiWVZa2o8viNHwBU
	fy2MfT02gBxa75H97sWUv64PE/DvFu2FlwIjen8QJ0tvsZod/D5e/ee4YRicmp7eFzKHt/Avj4B8h
	MyO18bFRC3LYr5zp09S8Xc1r4TIehn6QG42D4+Nqhsel0O4G1xEOd2LIr3GRoFl9ILQnnpDV9qB4x
	z6JIATfe6HXEAaScSAl+G9fEIEWKbYNMm0UpK+8vX8gH6UmrjiRRPW3pRgYiP+A8++eQzhyQ828Ys
	i5AEbtLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjZX-00000006QN5-3kR9;
	Wed, 03 Dec 2025 09:54:55 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjZV-00000006QMZ-19hc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:54:54 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-11b6bc976d6so942301c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764755692; x=1765360492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0dqnFUxVAgOq5yOpOOqeQxSwqMfw0XwWJ0/CitF0RE=;
        b=aBoFq0rM9C4tP0TvMSUUuA3tjGGneMRt3Rcop+fkbzvEyIna8Oa2IBCRNqJ8QvOYxI
         U4DfG/KeLqu1aipvgyu03UW7ynsP82cihwGdy/1GgjzI400JP7eZatQ+nGdpbBLZmNRp
         yBFXj3FRRE2E/y4kFstVzOM1T5HNOV19YjWVqGwaFDqRFPy3iiSKRF3Xf63+wbtx5Yq2
         3fX7Ak1XnH5MBijDwwjkN8khSm23UMlx5oSEB7HyLey3axSHHf/SnFPHPxYvrYmx4qVJ
         ayoz9SfS5+YUjCB4QWbe/+RE1O00rPMzuqqoYUsFoPnplcAl1DH728BNtb+BibGB2lBV
         /79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755692; x=1765360492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0dqnFUxVAgOq5yOpOOqeQxSwqMfw0XwWJ0/CitF0RE=;
        b=CxPYYnNihd1tVSKN/nE94BNyAxJgG5mYPIqbdouJkMV0QVDwe/g34N73IoXIFGMr0S
         HYuKHha3+l7LTCk+dM57IoK1hDURj4L1pZRYffHguBcDV/aeqt8Mq6EMgfWc11P18EDI
         K5qAIER3m1Yncd2o14e/DXH+u958v3xel5che72astazYTjoTPTehhrXrYOuq346KiUH
         Qy2FHQBxhUMVh2FFEBgBjt9JBiMloUF9z1BqxSJWceMQdBrCXMH+zm0S4urAXSJLsS4g
         IBdeZ5y7IZzWnWBAfShnd3Eip2bSr2VQp+1a/n9zqN0DPa503CYdOpXIYpdMlY9M8uiG
         3V/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMqF0oQO5jQJuv9E4DvuS46ex9b3pqcKsKvbXyDHl5+tEHWhKpdG2En9u61pWuAbCbpzE+N7gar6asjVwpF4Am@lists.infradead.org
X-Gm-Message-State: AOJu0YyzPXIP7yXeXtxKlO21e3qejL5ksre3pKGSBLQQE3uuc1EHeSae
	jYJ0qFYdwV1s1aocP8A3JlcGXVPRPPIsATdGZcX+c2KD7sj6PcDldeZkfELgooIJc9Qw4ku3udR
	VZJMa6l4Oqy8/gCiNXu/odS3NrG30574=
X-Gm-Gg: ASbGncstLi5CRhMc1pMUnwuixxudYJ188qJ93fPtchZOul2CWBfSIa2nGF19ryFGX1z
	ETvPMPtuDkVgljX4YaRUgnaDErBfJymSHb7KjlGbq4QonYGtjm5lyY/CuNu6WAQsTFLA1OL1KTk
	mEVTAst3LbDajb9JOW/K+WkvbL6cokbURZJtNQ8v6Os9C5Kok4/LvI9aSMyBwrjrPP86Vv8dVjY
	PSoX4+sYSgs8BiHAlOYK6BLv6QBtKzWtu0gylxWdyzxCKgpzkk3dGvqrJl68T7zND1ixGT714+1
	PIwGl3P5+4TnyMV3gzOWqFeRiImSPPN8FRuraNFxFA2/3eLxkyUdXcNW+zPxynMOHaQVFP177Q8
	M89VZuxv6/g==
X-Google-Smtp-Source: AGHT+IGh1q4mLj2gpybqPMtTKo+p6UyebY12iwCECr8rP8U6hfyWr+Vocugi0CQjhYnT/XilGYRxTAhtqzRWz5addaA=
X-Received: by 2002:a05:7022:1287:b0:11b:c86b:3870 with SMTP id
 a92af1059eb24-11df0bd8024mr1582589c88.4.1764755692362; Wed, 03 Dec 2025
 01:54:52 -0800 (PST)
MIME-Version: 1.0
References: <20251203070605.1868821-1-chancel.liu@nxp.com> <20251203070605.1868821-5-chancel.liu@nxp.com>
In-Reply-To: <20251203070605.1868821-5-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Dec 2025 11:57:24 +0200
X-Gm-Features: AWmQ_bl25_jqrQMlyIUwjWkr8w3cz7Pw4t74hPJrR4CZs7y8Sk8Qxgpyr61aeU4
Message-ID: <CAEnQRZDDLKyU9a1HPt=V=WvEmfOCsEBPd2zy8FWaKUAwUr5New@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: imx91-11x11-evk: Add PDM microphone sound
 card support
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_015453_312639_8EBDE093 
X-CRM114-Status: UNSURE (   8.01  )
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

On Wed, Dec 3, 2025 at 9:08=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> Add PDM micphone sound card support.
>
> This sound card supports recording sound from PDM microphone
> and convert the PDM format data to PCM data.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

