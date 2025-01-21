Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F7DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cmLKgAbd0s4H/WjP4JEXIpMzxpQ6pfh6XVvXVJ8p1M=; b=MfgxHvwoQvOB3uKLN3VRRD4rpP
	vXRINlCYJvG17aCAlbZQIU3h3rdOiJPlI0uQfj1Db1ifpA463vUmpOlDd2lNvOupqjZTyVY1l/TFW
	uQmz6yLbdtYfSoiToey/mF+yawRnRTS7GDKqGPwZUFV3t5y7rJxW5TtjtI/upYsYhEGv0NxCyR0yl
	gWgtM1GzgDYoB+etNT+Ed3LfdwloaBXHsjQU0PtnwEK/40eqkl+fwZ0kjlnkae8rQfUSvAK/6J9ef
	RbNmERyHVKjClBSQMpCHRb187H8C7wnkTfn8K04JL93PJG+uUcuxXU5pZOhjOSnSFIDYWtk9lzkDo
	bTa/895g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taARG-00000007OZT-2bOf;
	Tue, 21 Jan 2025 09:20:50 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAPy-00000007OHT-0ilf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:19:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f441791e40so6944739a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 01:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737451169; x=1738055969; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1cmLKgAbd0s4H/WjP4JEXIpMzxpQ6pfh6XVvXVJ8p1M=;
        b=F0GcHn5JNutBIRDIOQXlU5GKCRXs6i9/DNoAJXGaGKZx6Vm4wpmc3lTlPSbFU6pAG3
         nxvjI/bkFjOJIEehQcjwVqC/S9fF+XiYmi6V/fsiHrR8tkm8ghCxCqekb7ra0bxahFFQ
         KxIClYPnb2SrQg8Ncc8QcQFY4tTYa9t36T7Lj/4zZoqqa7fLhWQeTVge+nAmIGqttyfi
         nBLWIM4dyrcQscAicvTIvgfws5fTRb5IqtaEPCuSCu5P7DfF68egeUCZ7A6EBeKLNdzC
         ffHGjyQ8NSLjIy+kKobuBuqUMDwcThYhwfjZ3Nu5Oirm7V48KxjUvzZuA+uXpzvfT5uA
         jvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737451169; x=1738055969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cmLKgAbd0s4H/WjP4JEXIpMzxpQ6pfh6XVvXVJ8p1M=;
        b=tlSO2RzRk8fv6oLFKsUmsfYWVcU0d85RJUysv+KqcEp48ZRDPnhMSrNAUGwBaVlhBS
         dBLd/dlyip/xUWkTJWUlEX1DcD9du9iuOaD74fnX8FNsnmW8I1GmIocUtL2mRgCOJBb4
         KSL7URiP+vAsB2NqCVOnaybmsH/LDBsWtciRq3KDURHAr+hTaA67gGlZcHXHdyBt8XjZ
         YK+/tzZBGKzBi+gufvYXAdFt1HT33CnkEj/b5hQCNkNbla157FcloISzKMWubnvbRNcn
         w1q39/YPJgkLZS517WwR1CE2IIZqI3KMEAi8HPpCdsmmQ1uv31LqoCn8mNmlrfo8XR2R
         QFDA==
X-Forwarded-Encrypted: i=1; AJvYcCWnAdkboO5f4LF/els5zhdxd2PWA+qzKSR92vXh32biVsc/SmKiT0gx73mQ7eysOrKouQetwqgTQo+yRpyPS0bp@lists.infradead.org
X-Gm-Message-State: AOJu0YyODeQ2hM6nSeB/qV2FR+57WciJAhbgNqnA9pOD2mekO5MRMPMO
	6Ii4BJlYdXa2HDtYdtfXiFCCZaYUgr8AEp4ujNkJl4GptM+PEkMFCA71Jh72iluEtpOx//BHBfy
	HzZfjcQAH3xXjaYkDpST90Z+gD8M=
X-Gm-Gg: ASbGncvL+eNapqMaHDTVWtbBA2kHByiHOlyBhjwj3xqXB+8ZZBdr0PcSopup/8MA79s
	aQcCZjX4w/z4VAHJjCz2tT6seEDuzrWuUYCVG57bJnHpdO4hPx8myHc9CrZhBbsuz1g==
X-Google-Smtp-Source: AGHT+IHGWqxvT9gpiCi2M50sC7hANpRZHJI/Fb/4ZsNlfTW4QBH+d6oGf9mhsqDy2J8HXKVAlymqclIkcRr0VJ3gbc8=
X-Received: by 2002:a17:90b:258b:b0:2ee:f80c:688d with SMTP id
 98e67ed59e1d1-2f782d4f168mr22914331a91.25.1737451168941; Tue, 21 Jan 2025
 01:19:28 -0800 (PST)
MIME-Version: 1.0
References: <AM9PR04MB86041F11E6744FB41C40CECA95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <1f7289e7-8e5f-448c-a443-2f27a43e640e@pengutronix.de>
In-Reply-To: <1f7289e7-8e5f-448c-a443-2f27a43e640e@pengutronix.de>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Tue, 21 Jan 2025 10:19:15 +0100
X-Gm-Features: AbW1kvYMf3N-mBfPacW0Bl83nBf5PXk-cPJ5NgOebdXSbVXyMxjWfW3gWa_3_g4
Message-ID: <CADo9pHhNbq-i9r8QwkCCdzmMf6L8QNiiKmzP=sr=M8=YfsJcBA@mail.gmail.com>
Subject: Re: Recall: [PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Luna Jernberg <droidbittin@gmail.com>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_011930_206700_82B41154 
X-CRM114-Status: GOOD (  12.68  )
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

That was what happened to me on Gmail, was wondering what this was
about, thanks for the explanation

Den tis 21 jan. 2025 kl 10:17 skrev Ahmad Fatoum <a.fatoum@pengutronix.de>:
>
> Hello Pankaj,
>
> On 20.01.25 10:26, Pankaj Gupta wrote:
> > Pankaj Gupta would like to recall the message, "[PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave".
>
> AFAIK, recall is an outlook-specific feature and most readers on LKMLs
> will just get an email like quoted and thus recalling the message only
> adds noise.
>
> A single reply to the cover letter that this was sent out by mistake
> is enough.
>
> Cheers,
> Ahmad
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>

