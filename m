Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F5FD2594B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 07:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UP+mUbp/HODYFS6sc6VTtIV7GbMmQ0JMHLMxJM8aRDw=; b=aidJIwriz00EBEimBk+fBsntW5
	8NWfB2+/e5iIZHR0x0E+wbfO4UNeOGz2Hn3NMeNKEmxMhle/vHMEBmTLHRslxtB/wmcoJe4pKT+Ub
	pTbajinnf5dPw+i0qqg9D3M5ke6/ap7Ncgbv3zvv8f3rzw+CPBP32K3Wm04BFXUccHF67mTEyRDL0
	tGNwl2Y7azfaWunPLRZHwahTq7yoKmhN36ihTktQPqP1bKOEqdVeorJqXNRg3kIuQD8zbdC9EPWyI
	kwGlk0JWy/JM/s/WNJ6eDWbci7hOp1xf4Z6NTxLoWOpF8ALD3NnuA0wn5gDEQvSeMiZWDmCwtihl3
	REyTYtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdNE-0000000DlZq-2ckC;
	Tue, 27 Jan 2026 07:20:28 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdN7-0000000DlYy-0lmQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 07:20:26 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-12460a7caa2so7630534c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 23:20:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769498420; cv=none;
        d=google.com; s=arc-20240605;
        b=A4JKKSj1jWNDevRmunaPfTNhY5+htYYDjfsAvAiUWkby6BkrGLpXujbfH0+j3rgDk6
         sr8/NnJpoVBbUHS/tYtb6SnQj846O6nENTAMlgDEu0SGLvqdxmEMUWloCFS8hllZBtvs
         e2fh7jb4lUMKbQoJ9+DKvKLc//KMswu3i1Z9auauQSf7TXI0WYHNJjuXMwmZaJ7+mm5h
         WVw4QGZ07guG7s4ewLXhSbH9qMjiT69SGgw2t123pLd77OBWnW6JOKg6wZ0Xv7Kl1JKl
         Y9/ujVEyrgesk6OfrA6kcenFhsJ8+zs08D8WgJLSDiFcvMWJkyili0znapEacYsxSJy9
         H/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UP+mUbp/HODYFS6sc6VTtIV7GbMmQ0JMHLMxJM8aRDw=;
        fh=gfNzDeKEhNQaFiPl1LqD5snxLmfhlhq2C5xbRkOy1bM=;
        b=M/HBNZYhtGU0uhtUVqZpknWOpbshjntvk7TqrChDTPGTlmG6J4W3tiHowbPOJH5SQA
         GfPXsuddUrHAXkeXwpSH11R23SWNAF3eq2/7OpL4yIzpSeYBYv6QmfEVlQMTyzr2xP+E
         L12PuXH08EfTcqdQCzSYciCkIqDyKTnOV53Kss1/vnOkf4BUehNwMPQ6aRLqWLWcCNCs
         VONeNnx9cC74AhrfHoiR/6Yjm/M1Qp02keaz6sOY1PRUSNI7DVzT2u3aci+/umMhosHm
         HB7faMfrkWZWNto5Dd0fLSXjUgYMBTSCVOIxQoQWPB8o4MdNTBRWl2PkcnZBcvzHWjs+
         iw3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498420; x=1770103220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UP+mUbp/HODYFS6sc6VTtIV7GbMmQ0JMHLMxJM8aRDw=;
        b=IW5XKpBKiuwHdWezjnfEofzaNJIomWCtsCswFJg6Nbn1RwjZBxGv1VCcgsqnwAQzaK
         /Hcv3rThI6KoDGDq98c1nHw7D/6lji0C6YY/dp+rNrXABY2Z2Gdrsk5mrZpVQWtnRL8q
         hbxd0nDvMp2NejgEohVFmGxvy4xuUQTnBN4t+V8BZJsctW3gtBCcqEwva3pmE0/Ehyam
         PrzXir4HfHX8I4MTy3GIMjJ7rkR27+gnI91nR999QPaiImzOo3+l1W60xAxUUjp0pd6r
         3onoNjVL4Dn7MQPp84wde8a5kChX0L13vI3mRkKE6WzUQ8PGUkUi9c+mU892I7uR7wWV
         lwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498420; x=1770103220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UP+mUbp/HODYFS6sc6VTtIV7GbMmQ0JMHLMxJM8aRDw=;
        b=vCwl/MpydLjx2t/KEPS2BnvhYWjt2ahy34mLJbngZktmEhLrU/1pqaYkNpsI62lqam
         Q/S9cI+6dXGJj/nc63KlbUvjdCOCzDnhzF9QMkLovJ//s8UItHzxUzlRTioz6qlW5ZoN
         Trw933Yt2Bw2EEFxxhF/kesPwRUlkC/fWdblf0+Iq6BdkYuOMJHobjJC9POutehZUTue
         z1xdvSe3SlvEmhsKryASW6x+ZmL0bGaE5dDwKKZg6fW64zJMumluVyfZDa9BYwJJfeQf
         i0y2Kuzf7cOxC2YiaQzvaguffnoUElwSbDLIR+vnEfZr9pUBBtnQLyVrCrD0wvzLpE0S
         Gu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXujQCUqpc134eX7sGn/EXOw8GFDuJFIW4R3SyLncTrgm7kd08J5DL/zFEZL4z1wH/8E4Fy6WDsxoDXlFOGwyEx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9JCD8/XXXeXUrIHtMMJMj+NaT7HaB1mdnV4pP1KvsWUZkXV5I
	KpdxZgFgfiCZhrrFFXjF8UQfTin8vk4jyL58+Lb8/NWy5fPg5OfREO9sm0yO8Z/WtUW3uWZkq0s
	PTnVAgpk+Y4gBR3fuJG+SAiG9LcOFBf0=
X-Gm-Gg: AZuq6aKLU+6YPo+fkHCWKfYUKznvQMbDHY9iIMNRJ8NjzUbq5IwL4ooub+3rB1jcws8
	5BXqDi8lG/VS772cUuUAH5pGu+yFZVlI+AatWEHPVs5U95cElKqXhQc/FjoVt26gPJRzYYUnkCb
	1nJkAMz8aXFx+uwnt1dqDsSmfiO+pYCBVKxxF/8eDLdQu9AQtl5UId8vCzQHp3yTzJqxT5/4ibL
	we+AFp7NTi3sf3CrGkgZubpO5au0Y6OGwAKHhFZx0AlCBEQkccOF40R+hGtOx6IB7UDVj3AbdTi
	bNDz2puVU5jf2fEeHS0iBOhaXJDr6R+8W8jHiCxuB98V4reAAd6X7LdAD/+ddCq5iEK80HSGr6f
	CeNCPiQG7bxouNA==
X-Received: by 2002:a05:7022:608e:b0:11b:9386:8265 with SMTP id
 a92af1059eb24-124a00e4ef2mr592857c88.42.1769498419874; Mon, 26 Jan 2026
 23:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20260127025740.2601841-1-onlywig@gmail.com>
In-Reply-To: <20260127025740.2601841-1-onlywig@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 27 Jan 2026 09:23:03 +0200
X-Gm-Features: AZwV_QjajkSN5Eu31Sb_5L2tR2fgv-siHFOW2oZdIrE_vROYKnR4g6BIl7DjWw4
Message-ID: <CAEnQRZBmexggNdR78p8yTnpReLKxuDC_LKZqpHvXLzSzkDbfqw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: add pixpaper display overlay for
 i.MX93 FRDM
To: Wig Cheng <onlywig@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	zaq14760@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_232021_251155_4DC80A9C 
X-CRM114-Status: GOOD (  12.28  )
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

On Tue, Jan 27, 2026 at 5:02=E2=80=AFAM Wig Cheng <onlywig@gmail.com> wrote=
:
>
> Add device tree overlay to support the MayQueen PixPaper e-paper display
> on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
> interface and uses GPIO pins for reset, busy and DC control.
>
> The overlay configures:
>     - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
>     - PixPaper display device with proper GPIO assignments
>     - SPI frequency set to 5MHz for stable operation
>
> This enables support for the Open-EP Community pixpaper-213-c module on
> the NXP i.MX93 platform.
>
> Signed-off-by: Wig Cheng <onlywig@gmail.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

