Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF849C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 18:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=; b=GRq7X8h5TqFyngi16/xaqeaPLX
	MDodcgTQnAmzQp22GAj2Oa9WunA9Jn0NixliGxKawPh04VwU3ymYB9Qmj2FIZ1/PMpA1GFRqGVHnx
	P5kN2u0Yb5CRM8AWzfAbd4Biq2cNTyCw3sbQdo4ttQeOvW7rEMLuY2CbEnqMMr0Dgdz3y2VAgFT6R
	7SxwRTLGCdSn2c5jeQxItIRR3x3pEv07mdhDa4X+u/dx2PAqLVMcVqLssX0oyG+UuhOd+kaiuJvWZ
	1eYrkxR9UpDGm4w9O0EtBjZKp2HWJxA7xhVAo4hPFBgOOCG2KT4EX5LuyUvL9BVZHJnqD1c+fvfnE
	w/5ZUWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toRLO-0000000EkVh-2q1a;
	Sat, 01 Mar 2025 18:13:46 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toRJq-0000000EkIS-00HD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 18:12:11 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30b99c6cd35so14501441fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 10:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740852728; x=1741457528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=;
        b=T29TXPqbpwAvNwNu9G938HiftVWgTKQto7Mvn6toqG7LEDexjxbdDVtsa+Z1LRDkYo
         VYhOymHb6DfayyPOHo36E2XgyhatEy6X3ZgS0wZmetBSPQFPaGFsgi4LFTVPbLVCgQ2/
         1cWz0bkj4M9nRyx7nN94uoSIy1qx2IRGAI9VCNe38U5X4u3fW3yEme/R5t1poX+BoCnE
         DzpfNkYmGcjS8tYncD99J3xD9djd3bIfo2kmgkrgMIOSIDjEWbZqA/cbJAQhQNiguK9I
         FKrQ/edTE5wdy674S7/9JP79L/khj0qkYkOluXVdfC31HvqfzzeWsk99C8SXJuWwP4sy
         6cdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740852728; x=1741457528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=;
        b=iTBtQS6rDBJGsWsVWmJOHx6cCi0o5scOs9pkFp0xoWff9O8ozhtWIGW/z2UgCOahcE
         tIpJxMatJnOsfwg/MB/U38A+ovizD8eJZYqZb7+9YUEHDngpijxTScZNDQSnfdgoaywY
         GLNV6YZQIsmMyoA3eCyIvzoO8HQRt36ewM1LtFpoUE3eYAi0VjaciQRMjS0smVxEr0Ik
         YVYZKRehpgK3/+iA49xhV3TtKUE8RtKIBpLFMHkZHcddk9A0D99POL6/1AY9k03A0BQD
         uo+3nPBqXnTI1Y0y5Rt6KTmUwVur7Hptu86GEVlf/IjszU7ACBG1j37x1OS6ddvkbTv/
         2o3A==
X-Forwarded-Encrypted: i=1; AJvYcCWqNv6yGlsJoJXUyCaFycAli73Jqlv0F4LY1xWKUV2djRSvHj/8o/csFnm0ur2eXYPtLzxJVXK8zDTcEXHzoxGy@lists.infradead.org
X-Gm-Message-State: AOJu0YzIamEYlS+dJwsxCNtUvG5EANGbHYuN7LZ9sNmoB8NAe8Rvy82g
	F21Ax2Ko7fbEeXxmOgapATbOY78e7+8OX6MfAbruBHjCaQOI7OE9SvjGv30tO9a6JmiVBWxGcQa
	3fFYAKMKE3cXpJIukGXvUzX6gHVLz9eD6jBLsJA==
X-Gm-Gg: ASbGncsb1kY0zCbYu1fVFyFO/Mbg0oAMINxbUXGui2lvstXQ5TCCozsxH/VjdVapTBM
	oUax1g0GfJ31cYLDBsp0uhmBuDpcO4PklfIdYUHt9Hdy7C1NuJHnRihHvg9cpZxHabG+9ZwBkvd
	Jg0pSejTC4LkNfLTx6krVOPL6x/g==
X-Google-Smtp-Source: AGHT+IEH99Tq5urSrvxoc72GqejnsJAsNSDML6g3rnh8KP+Vmtk9gqB7j3gZFHmLs6QHmiQqUlP2gDlbwUBJuyx82iI=
X-Received: by 2002:a2e:8052:0:b0:307:e368:6bd6 with SMTP id
 38308e7fff4ca-30b933037d4mr26808421fa.32.1740852727658; Sat, 01 Mar 2025
 10:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org> <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Mar 2025 19:11:56 +0100
X-Gm-Features: AQ5f1JrUCPCMLG1ATCrGher1b7FQk-JSwRhx_use4qjyzNuoMvAXn5iqo9KhAOA
Message-ID: <CACRpkdamF4B1y+zr-Y_XB8gAoSv2Q2U4VxuZd+ivZq7KV1Quyw@mail.gmail.com>
Subject: Re: [PATCH 10/18] rtc: pl030: drop needless struct pl030_rtc::rtc member
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, =?UTF-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>, 
	Dianlong Li <long17.cool@163.com>, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_101210_053446_FF601E88 
X-CRM114-Status: GOOD (  10.59  )
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

On Fri, Feb 28, 2025 at 3:07=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:

> The memory pointed to by the ::rtc member is managed via devres, and
> no code in this driver uses it past _probe().
>
> We can drop it from the structure and just use a local temporary
> variable, reducing runtime memory consumption by a few bytes.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

