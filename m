Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D03D5C0C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 08:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUFe47qtGYjU5Yn2pY9F8UI7JZG74YZxx2wQ1k0dRgg=; b=PuKMW2TPf0ROtqqOVUKmdZdJG/
	kPZWP2itkdLwVS7RWShvNpx5ZoZmRw92lTMgyyWkMlYX0xeW784CESLgEiDrUcLsCjeYpdr27y0qM
	xaeYI5LAEktlm6ZI4w8sIRi77QxSg40l1zK2ZvALv6mUzbAAHbfLoK4EeLipP9yDtgKmEKD5bxj8l
	KW7ibzyj/d7zKrWpD+N5pnhUFDC9JsLB1jqc63SRvRsvDJpuc89cUXN6149KC9Qzi6TK9WA2VVB5Y
	isO7PAD55VpXYqH1V3Fn9Ws2Vke7jYcd5viV0uCbGU1PDhLZATM4yUAqvGVv4WaIgi2sxp1m+M4rx
	W54FU+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQl1-00000004x24-2ChY;
	Tue, 16 Dec 2025 08:50:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQkz-00000004x1g-0ccM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 08:50:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0f3f74587so23327185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 00:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765875008; x=1766479808; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUFe47qtGYjU5Yn2pY9F8UI7JZG74YZxx2wQ1k0dRgg=;
        b=FgMLtGRv1t7wNJ3cdDr2ppiLRD4k8LB8fPKPOk8NYznZDexy6NvXsbjfNcncYFbd8R
         gVbF+0TJmtHi1UKwu1mYF1TdSJgMlnJJpucEVhoAjzblVxIf9CjaraYOZZ0W7Sw226qA
         sL8WXpwV6MInu7/vVJGelrj1aBxFsEuxvkeoYDqsWjqEUfK7oKyIytMHGCvYzyXk1jVw
         xu4wig54vnGxFhra4kmcn+CUV4RGkRWrQ/En1iu2JUuDnx/UBqvHCKMOlctaat+PIf2K
         u36o1ww2n+Ry998kUjFqcWnOtA9F7+f1/6fH9r8wQSDh9VxrDrJW7UTbvb0vkGkIwm7c
         558w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875008; x=1766479808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZUFe47qtGYjU5Yn2pY9F8UI7JZG74YZxx2wQ1k0dRgg=;
        b=mTI4ZuGIyRKgIrgZm7eZOxEUELGdPHDi8yI23YCDBz4hANBGsSJgawzwIofjXegb0Q
         fVuTg/GSb0jQfGmHDbjpYkdCU7NF7IfY5aERbPmB0y45UWXO6BZ/w5Cziq88a5GS5AbH
         3QMxHh/1ew3e09IXjQdbsk7qv0JF5f/o+Xf//RiBF6BX0oM1Hm+sWVD1T2mbnuCvqFYV
         2juYZ1H14cxBhZIrjVYT33cy4/5T9A7JGcEmREuXKkdqCtg8Xj0ezI/ZtrgZjRHlPSHh
         pBaRF/fEYbLwdGEaCZ5zMwgQM/78aqOjtbdGzPDnYa4R2g6miu/1SpdmJ4ekkxRJwsIn
         LYTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3ZH5X7OG4XJJlx+/QgxFv34roA+c4FoE+Rxm4giNFBxgHO9L6ypt/qtuuGtWel7f/DzKf/aa1lM0Sy1U9TVa/@lists.infradead.org
X-Gm-Message-State: AOJu0YzUpM2dkslrWEeCwM4xa79w5PEeXXkXgc8cQEjiav07fWKHqgX3
	QfotEA++NELdslABwdyZzuzI4HHYAkp9IlXkuJ69SmrxEpVcgP52WTLpMZe0ENt2j2frjAVuXcf
	At9UjbkvZWBWX6iOyUvdeKaSeWBwiTcvoYQ==
X-Gm-Gg: AY/fxX7YYjemqDLA9sEv/8VvKFPmUvLxzNaskRH3q5f03tsaU+6JVRI22lVaeh0PI7Z
	Cgc59OO8saBCTl2uZDN69AitWnhzY/JiPT9XfiraAEQg4/jcq0SRgk3HOpY1pTKR1wdfGn8F0OD
	etvqdJFEYlWbRG33kH6HF5Xh+AtrYkAO/uWu9wDbDduaICg8Grk4J9VTDz60cSit2oSeU4XzXVa
	oXMupUiLiFkr5pTOSwDK2mGOxc9qRe2qi116MjmPXkPcHbJPgSGpohaLevZlGIdVLx8vMd7W3sZ
	yoCHmA4qu/n8oO/lLOAmTiHbgUOoJF9tDmMRlTyzOZ16u5JmqR01yn64NkHQNC6c98a9LFVeuTM
	kf6lmdNwCfZAEZuwIFKC9
X-Google-Smtp-Source: AGHT+IFdZYFT+NIwzhAXA50MF6zrj86tN0JwKIahPILeOcWuOCFok0qYlbb+VZx5E16t5BM86z6amXtW1CuiK+Z1D7g=
X-Received: by 2002:a05:7022:5f04:b0:11b:88a7:e1b0 with SMTP id
 a92af1059eb24-11f354cd726mr6498824c88.26.1765875007985; Tue, 16 Dec 2025
 00:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20251216074216.447193-1-shengjiu.wang@nxp.com>
In-Reply-To: <20251216074216.447193-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 16 Dec 2025 10:52:38 +0200
X-Gm-Features: AQt7F2qAJy_LSqPhNedKh08SXl3wUZHMX7Nrl3yXqFHsKDgpXLFzkxbItF2FoEo
Message-ID: <CAEnQRZCZe3z8F7TsFdCz5P6mu6qzGkdoqC76XkyCCzQz+pSpmA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: only reset carveout memory at
 RPROC_OFFLINE state
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	daniel.baluta@nxp.com, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_005009_488918_AFB44207 
X-CRM114-Status: UNSURE (   9.05  )
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

On Tue, Dec 16, 2025 at 9:59=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Don't need to reset memory at suspend and resume stage, because some
> memory is used to save the software state for resume, if it is cleared,
> the resume operation can fail.

I would rephrase this as "Do not reset memory ...".

"Don't need .." suggests that this operation is unnecessary, but not wrong.

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

