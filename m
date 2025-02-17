Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A14C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWb9c12CAhxULoD0dTGRwfEz9mcz+7D1z6r/WQDA7rc=; b=IFIpM//1LJAt4zFrKkpOYR4DO2
	1DhQU4FbYNGczGxujBgqpUZik0IVaIUpLRILwrBaYzu87yEAhOFqvBggB2LSrZ7FLmFs1Xr5Bsozg
	aGTUoqgTxo0UZTin8aYA2logdm3wIPWgv1Ob19ADE4KEGHJ7MuvOQQiccv4M3EwnM8SCnbiK199Kv
	C9xk9Y2u2kyoW/M4zJM0OSNaoF+PsOv4XnNGe2ccojpQaXUolbSu6mYAO6JDjbNv0ILRIng4fy+6i
	AWe6Hfx2a9CnX8XkHYNgYoeuxPZr+VO3Lko40Gc99VbR5urBJbarRcOnJtLErS8LIZV6n2rbdasbY
	Oi+6tNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0GN-00000004SyO-00vw;
	Mon, 17 Feb 2025 12:30:15 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzjk-00000004OS3-30ZG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:56:33 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30a29f4bd43so10778801fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 03:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739793390; x=1740398190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWb9c12CAhxULoD0dTGRwfEz9mcz+7D1z6r/WQDA7rc=;
        b=X9qvfVUwv8UQgjNYHGCg0vclbwEVpZ9QoBebIZluuuT2V4+Q2G5xN4FUwRtl6H/DbS
         BhnAuo8qOlppw5340BdnxY+aofExs2t92dxnHj22RGt2i0Y7KLwdJ3tviMzagc4dtQj5
         rAdUYiIGzVu0IoVZhSnIQ+HJgGFbYdQBkk7+6tmgQ+owk+95UluK6xDeap5B6/dxwU9h
         0Qh7Ax3ZVFGG0RUYeSUUaC0+u3+4nfFGTJV94ddczd3s7iMLQ4Zu8oNsmXj53Gc+ZH6g
         Ey8lRbZeD6eQ99YgzZ7Yet6S4vRxUeYyS8rYHYaz7Le7LoP4YpbRgFZZPvTcp38g0zsm
         uJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739793390; x=1740398190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWb9c12CAhxULoD0dTGRwfEz9mcz+7D1z6r/WQDA7rc=;
        b=b95yVW5Ek5/7fVK7EDmgJujIjV5Mo0535kLsXtXJlwDeHpPfNrxRaMhK8UJrA5XVR3
         G2ZX4+GCkRwt7/2WTK4A5AlS24RxMMN6tLZElxJtTSSrUZY8qiMjnH+pKz32QN1mcwew
         oZjPWpE/B/mlvO05JIA8hz5DTvx4AibiTRCPCy4TKN3fHfP+P0RStx87FV1+TxiNTj+G
         arXchom2Cms66Mkq3inWFhqfLHXOippBqng5+q5PKtWdq4ywdjdHAFm1CFR+sPjyC71n
         dEOqKLSbyKf1iup6dPDbhY6IQpYTIaBIScMvwRPMQtx8L5M5MKdVTileHScszpKThY4W
         GAKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKjcnWQMfLOy3HJpAF24Ld2zoIC7OIAXL+rCxOwVRkodkg7h0hHVxAROU7uQUSqUKaWB9d2KdJQ4ogF3l4SbeX@lists.infradead.org
X-Gm-Message-State: AOJu0YzsluL4c/lqWmNmnsyngO9ynt5K63O87aFLFsLDD1JUYGWLaIJ9
	USvAi8WzbfnJ8eoPpBdhqAmSgkEJmG+pz3HDMRIuvgOwLhm3GEyJQZg3+ovRO35neov3f6lbHl5
	bNGAtAUFnQegIA+f8MjOdxfRminw=
X-Gm-Gg: ASbGncsNoK+tVxGx1yZPXaaB6YDPD2chu2H6ko0d22O1NxBhRxRAn1EkowMPxWcu01I
	MZWPVLsHKfAEiCNv2WQwapBa1Kx4S9/D01PSmP1luzhFD1f1QQCb5znQSk6yoSBATO30tCvbkO4
	kfMHHMkxAsOw==
X-Google-Smtp-Source: AGHT+IHtj/ZdhxXotccy9rIWf5rf13ssM1qX/siRW2ohOQo19dHThB2bEMb7IsViEOJydxxoEPlta3cBjBRhxTyDCxM=
X-Received: by 2002:a2e:9e11:0:b0:309:20b4:b6d5 with SMTP id
 38308e7fff4ca-30927ad53aamr22443111fa.28.1739793390003; Mon, 17 Feb 2025
 03:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20250217110623.2383142-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250217110623.2383142-1-ziniu.wang_1@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Feb 2025 08:56:18 -0300
X-Gm-Features: AWEUYZmHvY_1XI6VdOUomFMuvpcQrKJqSxvERooJApcoU_Ugmh026Kvs_8J2YQo
Message-ID: <CAOMZO5AaLxmaz+c2z5W2M1SV+55pMmhKC2-oqt7_vh1TM6jr3w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: improve imx8mq emmc/sd read performance
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, haibo.chen@nxp.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_035632_754092_6182E44E 
X-CRM114-Status: UNSURE (   7.95  )
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

On Mon, Feb 17, 2025 at 8:05=E2=80=AFAM <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> Compared with kernel 6.1, imx8mq eMMC/SD read performance drops by about
> 30% with kernel 6.6.

Since this fixes a significant performance regression, what about
adding a Fixes tag?

