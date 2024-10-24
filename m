Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28AFD2E00F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFc9tj0AdbcvCZ9hGMOALSeE2VN0Id5w0yWCtY8sEP0=; b=S02ZZlHdm/LkSnbQXF+ZpsOzQd
	36okhfQKovqaRcwj7nCZulUzkww33czno3TcpVL1igQHRThWeoZF5Ogu3M0ZqM1K9K1pzRAmjOF56
	Qc1SSdKLqjAdToOKtH2SLrxHxyGCnieOqu1mjnpXrzmZY4eo7mmQBIbYy+aiYnFRWDyplJ4zNOxlb
	JYxY44ug+9GnhJ8/FqHQq+yh0pOgH6IDinzlcJNMNFklXgfPMw88ck3PiQELhFGFH3eBX1i40tZwD
	kP0HHUbMOg+rgEwN+ggfiNhQpAb5o5gSvJAigZq6pjbCGpgdmhkD2LDzFRT+ODhQ7pDLoQg44erhn
	Qg/Coyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vjg-00000000AwK-1h0R;
	Thu, 24 Oct 2024 11:10:36 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vZl-000000009Cf-43IX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:00:23 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539fe02c386so1889905e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729767620; x=1730372420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFc9tj0AdbcvCZ9hGMOALSeE2VN0Id5w0yWCtY8sEP0=;
        b=GUPucRsQ2YhEjPYfQ9Zl13IcNNQSeFU5AzwHMFF9MuqsNGRTu0f+PZ0Jx0v2z3GmYy
         wk/WZDlyegOLqzeW1PtzgDHzn8qIPJWicQW671ZsUd44lo0XNEGstk7CPrRvGHLaYImV
         enkEEXCRZwiSAdIgBFnlD5saS3+/ezIFLTsYnl224TPB6UFthd82SxdJnVaHAKGmHJvU
         QPyOkGl6zhvlT0I9NbLzP14b8LnGeGMxN/2IMgY3N1Sot5hTc/hNV+UrB5q2GTf+6cR8
         1DHuNZSauDNYJtJjDSS2kuk98+LTRUGQrEbYRNr7aAtr35EmT+HT8mR30ynoMZ43L3gk
         jCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729767620; x=1730372420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFc9tj0AdbcvCZ9hGMOALSeE2VN0Id5w0yWCtY8sEP0=;
        b=GpqJDRvufs1uNXezRZK46GjQJJ8T0OBO27leGAyRU09g31VapFeuaiDLbr/rTLjXIi
         WTSgGImTHTUNggwnTcb0A0wwvo7OP5M1qhfrWTIX2O05wnFAmpsq8Ps1s4yzyZUsl1p8
         jDsJeCVmKISIiRHlJTPXaDdYPe7Xe3qpyrRzy9y4h5YVZY9qdtf8FRKdg5IEM85oeJVs
         0dfYNOr8KWjTPQb2OtQ/Hwh0aXVZs/Qen2aWB2rCNizbtQYiBUNAWW6780ZqYM8M+0JD
         iUxVc6IdU7PS9vVXRkpKMQ+gx5JhEGpel+YH9FQS/pKy0OJw5UC0iog5LPYLO0nOCLNn
         /mpw==
X-Forwarded-Encrypted: i=1; AJvYcCUpie+yGbtSu36QGRvxJKNbQpqYUnWFdbl0sf9ivJNTglQh7cphLHhH2B8GZe7UuNutmWP3q6bSQKuKWgzQCHcp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz46ESUWXCuxf9MUY3Q0JiMe8KRmniAqIWm18org09zQP+8rO6j
	NGTDTf7k1snqAisv1FK3urI0HKYyW55aB77y0G07unPAyVY/ttNmGIEsnZ7bxm+BHDoLmNMf3GJ
	FWHEgqyfGHbCePEpaSGgUCgVIeUivsA==
X-Google-Smtp-Source: AGHT+IGWkE1pe0oLSYDJWS2zXqP8+hBUfDUf8ZYKKOYozF4a2KG2zriqtwVIIi7sY3pGg5fedlHT20ZHJPOCGO/2+RM=
X-Received: by 2002:a05:6512:3d0e:b0:536:7a79:b4df with SMTP id
 2adb3069b0e04-53b2371753fmr598477e87.14.1729767619349; Thu, 24 Oct 2024
 04:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20241023144206.1099622-1-festevam@gmail.com> <20241023144206.1099622-3-festevam@gmail.com>
 <5qukgvhiszyyqoetl7go47qen27uwnq5mhgwz4lejdgyhyupkb@i2dre4tovzqh>
In-Reply-To: <5qukgvhiszyyqoetl7go47qen27uwnq5mhgwz4lejdgyhyupkb@i2dre4tovzqh>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 24 Oct 2024 08:00:07 -0300
Message-ID: <CAOMZO5CqOwZ=h61x+iUnvPtrcwvvdJeU9aCOuW1_vZs1w40+ag@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: imx6qdl-apalis: Change to "adi,force-bt656-4"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hverkuil-cisco@xs4all.nl, lars@metafoo.de, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org, 
	francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_040022_027745_651434D4 
X-CRM114-Status: UNSURE (   8.96  )
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

Hi Krzysztof,

On Thu, Oct 24, 2024 at 4:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> This will affect other users of this DTS, which we try to avoid. Some
> sort of analysis if this is used in BSD would be useful.

Thanks for the suggestion.

I checked the BSD source code and there is no adv7180 driver available.

