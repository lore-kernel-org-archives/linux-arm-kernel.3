Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345E7E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 15:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wGpSjoV+I/C1HHA1GCDrk5eEUiIYLCQUe47VJqqo2Y=; b=PZEtKNJa7ck3PyrvAVhOqdpBtf
	Dt0QPPkvHGeJ7CNTVGaX3KvX9OwwlPR2g6nh06RvetP48MI1fV4hYERFRYxshG2ogy4MXR97gTMKn
	uQh9m7fs+AAhzczbb9eQhAvXHqhIT0oMwff8BvcCYdnb3yHDnris0ic6xJsip8vos8J/Rrj/iuA3r
	coZ/n6RQtTt4febK19d8L3i9RdNsSypA0LGWpYZUNdd9d6yM64nF/jGVRiVqUBOHXz3wVkHb2qcb2
	WRrBujl5035d75fmlc62jyXGqDM9qK+zfLvU5NOuJjB+W7TZ1Vc9u6ChdwvNrxEaBk14Nmf7acn3t
	oS3XW8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXLix-0000000CYrY-11Cw;
	Sun, 21 Dec 2025 15:51:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXLis-0000000CYqa-0xAB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 15:51:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477aa218f20so19834165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766332312; x=1766937112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wGpSjoV+I/C1HHA1GCDrk5eEUiIYLCQUe47VJqqo2Y=;
        b=SLIhVwp/ROeqpbIPERyNk2lG44A/eg5Oukcepcg8X+rJPcozXdYTdSjLTt6K3n7xxd
         jaSy5Jcu1uY2GqOJmwr/INS7msvsu4M8wYEBU8F9gU5Eh0XHn9MsjEIJSlz6MSxM/iK4
         k/RJE7n9KM6hX75rnn+WM2Yv3EynPvCYvXtvIYXnONgsuGzxBkdVWNtEFCk2qpt8KYUo
         DeJodPKFqlCR/3J5JH6OyFH+b0SwkT5JN7cKX54mTyPcxY1YtHcM6+WE6T2CXrVeHgdz
         MdrdWHRm/Ft/HO0v+TFL0by9lTdN9vQPZYNm40yLF1zK8i4BmGEDqB6xtJUG0AFDbiFn
         2FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766332312; x=1766937112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wGpSjoV+I/C1HHA1GCDrk5eEUiIYLCQUe47VJqqo2Y=;
        b=Ansr+S3ugFh2KuC0epybNZVyT62D83ala8FKrUlUxcjyO2y/Tuc8x59p+ReTsQv5T4
         jLqtmOt+8JRArDW6fL0QXJY7B/H5n/sjD2+NiufVa/+FOiSXvW4yb8O1cbPe3ae2vEt3
         wTDBPflgEh6E+kFbSFDla1XXe35q+rvJ93wSdT2yi8SSDiHtoZRBRTuaA1k1F6W+upjK
         T13byBvvlDUxwxk609NbaEG+qBoAmucOsxxF5YTwE2foDvHN7awnZg4nznEDno1JVnXj
         +1dFifo6FBs80Iiuz8b0Na9NCKiG5Zzv+dJM/Zy+mQlD3LP2ld6fM7qbo3CTXHRLZhju
         OmFw==
X-Forwarded-Encrypted: i=1; AJvYcCUKJJF+G9hzTYHQD33I4efI4HbkSTMVubQd+c6V+9t7MGXEH5QJrrknkMoPRzs+53afIWCi6etqWV6ncpRzNUTT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl57yPo0ajbJ4VAoRbrI5/IjKPzrI00jWQy+le9Ayn50LgwGrz
	lLkRuP47USWEkRw+dIjcBxw6V1qBfdlQCQ1d8IZzadWyxycx51Q6UYz2
X-Gm-Gg: AY/fxX729ruJ/cw4qY4G1TLQLelK2TKFvbSTNsQTp0aWijpORgwiDz4SkTDCiEFWoCN
	JMrUhyQUdMCQNTZ4gJUbZzxWLf6hK9wEtcRfHH/tzADyysS3AxSSwzQf8Mdb4PPb6sU14NfX8bF
	gVYT2mfLNVUkqIXKf0USwERaySkdmtkfBLsA7sSWAjLrcC5V+6kiAD55FdLaErRv+raugN/adTW
	ttp7Czqetgj5cO/cjNZmfXT/+oSq0bO/bxBlvjT1W+zAWjxl6rMKii2+ic4VAUxALCsF2ecOyJe
	26EMhnjwlaLAhGY2n31eV/ejRA7NryDyQ8hieWJ79hCGoDD+dhLkB+DqfTgDdJ0krKjpPLeuMa6
	KGfZfxuauDguhDC5VdbzE8McNUDdQHI1+5BSuYtOAMZragkezw4rLgCX8QaSHk7bmW0oPtouC8e
	6DckKYegLLudO5qZVqoW46IcAL4ozHdDyL+hEsqwTqbrPeQ0MTYja2uB5R0m3fYHE1Nrxj
X-Google-Smtp-Source: AGHT+IFL0JinH915To7UZbWNxmW3rxApkR6Mgi6PhRVUaC2JRu/YiTvBxUG9ri+ZhDZkaKBLH64B+w==
X-Received: by 2002:a05:600c:3148:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-47d1958e459mr83426535e9.36.1766332312266;
        Sun, 21 Dec 2025 07:51:52 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm17292809f8f.1.2025.12.21.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:51:51 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: sun55i: Add SPI controllers
Date: Sun, 21 Dec 2025 16:51:50 +0100
Message-ID: <1940379.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20251221110513.1850535-4-wens@kernel.org>
References: <20251221110513.1850535-1-wens@kernel.org>
 <20251221110513.1850535-4-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_075154_268817_1D363A7D 
X-CRM114-Status: UNSURE (   7.48  )
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

Dne nedelja, 21. december 2025 ob 12:05:10 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The A523 family SoCs have four SPI controllers. One of them also
> supports DBI mode.
>=20
> Add device nodes for all of them. Also add pinmux nodes for spi0 on the
> PC pins, which is commonly used for SPI-NOR boot flash.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



