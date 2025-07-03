Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CA6C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDlYEkubd96z9MwJzBRtpwFB7aA0Q1bDJcX399/Kjr8=; b=OYPsZ6fJ9f8wwmkbjEU3IkxJC+
	euxfmEZkvU39uZBD1e4n9r8nmmIlLyerGR1cRGVgxkwtW0k3PCb+l3bt5Juhyg9sUmaZd5djg0ZqS
	skwqwpCC1SKLi4gZfoRs0ymV4fOQj8tz9oc6bVlzaEdOlw6drg7Vtd78DV8/oJ0OWqui8EEVSOpYa
	IPrtP1aMfCGsyyykSuxkdC0vSuNNjCpVrSma+nRhXBGHnvHLRZOOZMzauu29jvV5KJ/6htzfnpEWs
	QD9X7d1jiT+Jdj8OcvPmQGX6CWV7/OEgq/hTzqMr+xnS8E49SW16DE2tS1jakLbHFYxEn/WBbp3w4
	NLh26yoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKsW-0000000Bemq-44lc;
	Thu, 03 Jul 2025 14:25:32 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJJ6-0000000BN54-3FmY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:44:53 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55622414cf4so2885776e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751546691; x=1752151491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDlYEkubd96z9MwJzBRtpwFB7aA0Q1bDJcX399/Kjr8=;
        b=Bmq8waMJZC1Ea97ze7f0flP643gA6Lcr/WXjXoSJkW3opyYqWK8dVvCN9lPQ1PdMaX
         +n0ywuE9zeVH+JIVay/Us7L66KvSO33vUhm160frLZi8+8O+ZJQmGkuFilyuTftj5WQP
         ojDdkFPjVPsZe8ybGcgUyxlBgkXddvxBV2ekx+gsxTJHIq8tiu7UBy4pYf+oyglzb33F
         NIuJ4Qkgwl8QvoFZuYDYM6Gzq81NUwcYd3iAtPCiDN2liU1B0FSzkxYfq8d8wyZlD6ku
         02hrnQQABflmsHtsFVCR9Ynk18ZZEU2wCk7SwwhcyzZdIONZBfAcZtnmPRnyuaGmWU0h
         n4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546691; x=1752151491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDlYEkubd96z9MwJzBRtpwFB7aA0Q1bDJcX399/Kjr8=;
        b=o0omiNHMqpK+3C+6JEg6g/JzA91cbavTBiRpN6X1Fk9GstphNQc9HhLTKiwQdI0WXR
         Ct0mJqUATae8stECBqDYcQwd7Ku2hgVJiVuQ1XojkuQ7Vk2rpbjmHbXzr0mTVYcjIjZd
         iofhZnPqbGZiQhPKAh5Lc+5sDm3wsIY+us9Tso9P7s9KJWEprTouM2VV3MWVVyt4Q7IR
         ONH/osWMl4g+RWJdB/tT44AK8sonfG042IQX4XbWeu2EdCzWB/Vpxmnlf1e1EOypbRbt
         eMEFtQNE3ysx+JpbFN+f7cR3H9maXLyyJGrhQGZJzh9LKQwafWJotR++Mt0h7axN46zz
         s7ZA==
X-Gm-Message-State: AOJu0YzxdtC60iZdDinQGjLGM+uvbEN6zPjdEXUI6NMtGTo8CC81oJ4s
	RWpJP4l5mfN0idn8MUcB5Si5bUYx0cS5bt98lDEMTTpxf0bkXaxoqDBDOpQBPKIn9S91TopiKQr
	+G+DwFAL85hAn0YxkUCfur4qPkBN9r7c+Iw==
X-Gm-Gg: ASbGncu0j8iO3lsRIiudm8PDhg2MZoAca66aEDfiD7jh+CgGONFdus2BwJVOL2b4x2a
	pQ09wVJjh0aReka6TpXaS65+1o8W0knznjLbVA7/KLkaNZWpGfo0CntHc0uW3q1EL39eluDOjBq
	AX63RDv2X6l0PK1TZEQv8+bn1eWFMyG/QagQToZE85EjvUy/Mmvwc2lwZKoYu+4QX01DMnLedF4
	mg=
X-Google-Smtp-Source: AGHT+IFKVEiV+VQbUtpCqC9WckskybLMn53BW4tS3ehL1ZkM1xl1Mfgo8fk6N8Koy0lM0uprCJl6fTzRVH+Gd2z/05I=
X-Received: by 2002:a05:6512:39c7:b0:553:2cfe:9f1f with SMTP id
 2adb3069b0e04-5562ee21536mr1060794e87.6.1751546690574; Thu, 03 Jul 2025
 05:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 3 Jul 2025 09:44:36 -0300
X-Gm-Features: Ac12FXx8tubzpqCb7QAhaROTPHQN2B3IX372b8SYzWGNI2K_HNEsG1Iuj4faMGA
Message-ID: <CAOMZO5B-7LuYs34ACmMD7S3B0Sxihe8A+atdNi_3QfMP3VFYtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_054452_814361_56F18DD5 
X-CRM114-Status: GOOD (  11.28  )
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

On Fri, Jun 20, 2025 at 6:34=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

