Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15CEFC72DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwzPpDmwj9hCttbRfYAfKIIUGe5wCoRiVoOHsvFK2y0=; b=TaI1vMiJgWJuT3GthW0iNzQV8/
	xHtYXvmZJD3hXSlXlXRlPRFKX9TLjE2eHSpAol3Se8fg94asV9htazTmSBuHWlzsPVw2SY7/jG/Bj
	hkQtHRIJyVWIssnu9WDkq2K2e163k5rlManxQZpnwSouA6jQN9yboks95ok30X2v1hBvchXrW1DzP
	PrO3NLKT6cuRQL+N+p+WSGfp0BlUwG3RQ+2r3QtPOCrz5ZsC3p1RiUdMq55u+R9cRpj6q/ysLUAmr
	bTIkIcflpvZceDZKinLnbToq9+Ydwua7/dkEQ2NxnSZ9NOlE9G4hvtzyvLbhOKe1YdB7W3Nr61VoB
	JbXDgrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C9a-00000002PGr-18pw;
	Wed, 25 Mar 2026 00:31:22 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C9Y-00000002PGT-0UXi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:31:21 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50919fc3a14so48516191cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 17:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398679; x=1775003479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwzPpDmwj9hCttbRfYAfKIIUGe5wCoRiVoOHsvFK2y0=;
        b=mHk+WdiBDHGRvPqfysAO4sV442gLkoHQ+dbJJ1bWQm4zt7IK28zY2zUYU0yLSKaq5r
         B309TEZy/jltjxogKam+y2JTfaBRwjEfaFV4DOG3MggHh+Uk6roP5gWQwXb9nWpS5slk
         adOzM/09Sy0/sD3ZYUjNpahrGy9KUhD7/rJnBrCm2MKAh83a0SHnZlyK/3/a7cmG43VE
         0lQ5Efkq8Mb1bZV0y2Ld2XPM9HUqi/uCUP9xc0wMHi55rBAX7ck8WfkyDo6+tKr1rC9I
         USjat3U6iZydjrIxd6cnORExKbebpFNCSLw/0TJ49I4wG8s+VUdkN0co4IVWULW+QI21
         ZfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398679; x=1775003479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwzPpDmwj9hCttbRfYAfKIIUGe5wCoRiVoOHsvFK2y0=;
        b=FUcc9lBpYIpAXLjDBsgxupooT9qVGlfjNA/BSopAWFZmcxEcoMBwwnnpy5Uvjwh8vJ
         CEg3swEJY186mqp6G1RVjXepiep2ia53PS6EBN2uMIFQKfX+MvhcnWYPsjQMef33YwZH
         FSoEHeviku/tYDRVyzeP9/ciy/akW11/5cn8k6P0RyLY3ilddryOS3IKE7cXa5WF+7oC
         ukVxnFdsLtI0hzpJiYsZRJeANmMwXflR/e8WCnv/tJJSh+8M7Nw6i+2KewscQJC1VjRZ
         pYgRF67Uy8+mWauQqYxh+H9QFfthn6Ll7Y7bCeWNCGYbeG5lQMxcKk+zMV+pRkTZtY6I
         xJ9w==
X-Forwarded-Encrypted: i=1; AJvYcCWZbpKesIjmjGPbxbhsi7QSBoRiKKE4wAOTu9EElKHM6S2mpWfb1DvQu/OfdelkmaBBNFr70u+CeV4u76SVwuCP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+mtrKOptaOFJYuY+ZzGLCVN9Y5X4R88aXDdVwH0qV0t8abVHv
	gN6QSP0KVWe+WH68lyS1PlC0+ew9nyLBiosXtW7lFFuzKEs5h48MVk62
X-Gm-Gg: ATEYQzyJW91wBgxEWybc8vjwFlWwlz1ewch75tdgPSbkh1ihA2ZWK7TIFXgisgsSm1f
	hTkobbp2lC3l89kzb6sBAnKk0FUay7BQgFLNNCckFdBV/07nqyFaW5HWi5R9XJNLdvFoPIKFiU2
	t/pOyM1KlnFI5wwWXQoJUukXCnMPOCkpPJk5BhLF5Eb1VZrmNWEi21om2Slf3PmuaPm88qwE59R
	RJNDLK/zZE/4uWaSiUsEa4JW3ys/CKb0cz1USeda04xFIXxi8DNtfIwYQFH8SHnTYRc9a5FKc7V
	SZZ9GfLpelCHjK7cMkq45gxabgLU52S37DDjTkiRvSQvFgQUCVDWZ83hr+Q6LHYEHkFsMg/i3Po
	u0ANqAHNd0++BQO62iFfHi4rtuLz4DKzrMZwAgnLtqOvs9DbyKb+A0K3Wmo6tQh3qoOybIiiQ3D
	h7hSOBXMhmvIvW+ecqUE+w0z6ycrSaAcGhz4hFsHwfghTJ0RoQUTzG08YkQCmhv7k7MW4ppr2fP
	woWEBVozlJNIrRIZ84u2DO2
X-Received: by 2002:ac8:4a0d:0:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50b80de1f5emr18883851cf.40.1774398678791;
        Tue, 24 Mar 2026 17:31:18 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cbda0f584sm20056816d6.14.2026.03.24.17.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:31:18 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: sun50i-a64: add UART DMA channels
Date: Wed, 25 Mar 2026 01:31:16 +0100
Message-ID: <1851851.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20260324161930.1602083-1-wens@kernel.org>
References: <20260324161930.1602083-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_173120_153266_ED60F05D 
X-CRM114-Status: UNSURE (   8.38  )
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

Dne torek, 24. marec 2026 ob 17:19:28 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> All the UARTs support DMA and are hooked up to the DMA controller.
>=20
> Add the DMA channels for the UARTs
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



