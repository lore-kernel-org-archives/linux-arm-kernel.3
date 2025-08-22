Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C63CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaAUnNBQO1VRtLjO1YXIZilaY2y7K5KoxfwlKFSif3M=; b=FdkurgGXKuEU9vNasKzjmX8ER2
	sJBJ5uzZ3XZ7Rcr84t5p+idZa5vYcYVEkQ4V66NesOLYNh67+8d0M9JZd/acC8dwhehyM1ZgHhbUz
	VbgylJGkyIPC7WZESGnpw96GgAlDTLMEBFxGvVsfqqUbkVjQMhxzrepjDN4edw1ZPMDIsYEzw2VeO
	pT3Eb4IMymJ9PtVePPUpmc6IgGF2Wcwj883D+t5YDkMcByIHK2Oya8X+fYlQVvdlKrJ98xMELohwE
	yd0vvYIWhF0/uZr0yHf7vh2loRgvIjfvSJ1XXVEyk7K2CBLEvRXZTNMUwrx/lEMPNgvHCMtGB3Yd9
	jdGjayIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTz-00000004Ljf-1y0F;
	Sat, 23 Aug 2025 08:20:15 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRWY-00000002aOL-0QO1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:09:43 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3364f31784dso7862351fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755868180; x=1756472980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaAUnNBQO1VRtLjO1YXIZilaY2y7K5KoxfwlKFSif3M=;
        b=FTX1sDxlbSu7txN/cTw4s/lTW0gowNcrmY/5C+tajJLXgQBOvUuRvOySJZyhNyL8Js
         xtNzO+84H+Jp0AKjBaydAnTVb7ZHJB5ozWIWTJ2gv6iGlcSWeeVOpyYxWJ+nfwMBl8t/
         dhLdPTdA9h/1HVUKE2Ipkh6VL52WPkkCc4KqI0wYS+xRF7Ef47kixr++5XlRZVyQm3UI
         Dnzfx5gdJYrttjiNyOJulpA33W3feslDfl1m+xHkKeZFrnajHjOLqp0wjnenWT/qomBF
         BsFIDj9tKCvgqpd6oHsj9P6H07yp+oSrvLgHYRRO/lwMpdzU2n9QC41UEqlYj4xn5RQY
         G0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755868180; x=1756472980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaAUnNBQO1VRtLjO1YXIZilaY2y7K5KoxfwlKFSif3M=;
        b=IALB1YBpiFkvZOXoLtIA/OIh0pYcDsQMDgL5WXK7n5TmjRPg/LpBORoeOXxwb8wg1U
         aMshOGn0iJEgoT/oCaIPFaqLGhoX3WpBIkpNi8cf5KeDBMEMKrIhrLirQrPuUxHtqs9r
         ajmRXMQk0CX9LwDoWbWUadcIZLD2DsanAamoVTE/SgpH6YD35UbMyJPnQn2UtGh/QGEV
         JN8ZKwYqhardNI+Oa9AQX44FM3ltb7hdevnJeldwe8k+w4601RDzN2ayrZStUEJDXmA0
         IsF5iqr2CkPIygUcgMpRdfsLhwzjIY78xI/BTvcuUzpfNXrsqJbxsLjNPMcQTXy7Xvqd
         G30g==
X-Forwarded-Encrypted: i=1; AJvYcCXOhRikI9gr7wPgXXRMTzH15eSFXDwfA6b1QR+XyWt7OfL/ST5/4x1bKI8H9dXZRKmC7kfVFdGrkFlAjLZ1XcEU@lists.infradead.org
X-Gm-Message-State: AOJu0YwyKohLBjcfm6HlZBg4tIQMnl2MVRu3QY7veE84TlMysT/Xv/nN
	FaPKJ+Q9yDfAz0ce1/7Snde0pEtHSI53WDjxPqsKaurgVXPxSYtdIJ7YbDOD07yHhRf1m+NuoBY
	5EalZDIGfAByLm6LUz+nAOMp8wTk7mFQ1HgvJYh6H6Q==
X-Gm-Gg: ASbGnctzh1Q3sZ0serJHMr+/xLKxslzTdyqDeMRmlWSclHvIxh928Od0DeVvkDkTH9T
	BnGnB02kA+yB6l2uIK4zNc2sMnWLkQMvw94UbfNJyR8PDvUkxf5ZScM9m1Pu/I0nRkCiDRZPcLX
	Iv75izq7EcYvos+XHAA0crXFo5gSv9WXtqrY3NbzcQAEnjeckRUm4CoAItFaM4jfzLXhz6Up42G
	wHn4+4=
X-Google-Smtp-Source: AGHT+IE38aK14JH5doGJwJ/L1zggU/pkge8LUJowEiyqKCoskKkhAj74fv5SRzqMHcI7hWw+wLFl8EdWHeb5F4Wq9Gk=
X-Received: by 2002:a2e:8a86:0:b0:32b:6cd3:3938 with SMTP id
 38308e7fff4ca-33650e433f0mr7211421fa.13.1755868180212; Fri, 22 Aug 2025
 06:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-airoha-pinconf-err-val-fix-v1-1-87b4f264ced2@kernel.org>
In-Reply-To: <20250822-airoha-pinconf-err-val-fix-v1-1-87b4f264ced2@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 15:09:28 +0200
X-Gm-Features: Ac12FXyilBE2jL31VnOTILlWWCkKRSKs1Im0EeZ6mew8D2IIMZNOLHho3Nv17MQ
Message-ID: <CACRpkda4m8awDHOwo9fRj3dxCrGp9=pDYmV5N0qTw39a6-qQ_A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: Fix return value in pinconf callbacks
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_060942_155275_9B54AF19 
X-CRM114-Status: GOOD (  11.02  )
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

On Fri, Aug 22, 2025 at 2:14=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:

> Pinctrl stack requires ENOTSUPP error code if the parameter is not
> supported by the pinctrl driver. Fix the returned error code in pinconf
> callbacks if the operation is not supported.
>
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Patch applied for fixes.

Yours,
Linus Walleij

