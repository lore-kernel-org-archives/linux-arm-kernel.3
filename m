Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25EFC982F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsdpmGsyOkVZsi/y+GsHdikzRvoYJyk6QlblSikl37w=; b=QXMm3LDe15Gjf9KzGodBCnUbNI
	qnDXdr1Yakv1pO5mCIYI/HaY5VTdrDOn3OVil270OTPPCzfz9TTYlGsPLcUeRtvT+d2guk8L4w7on
	meukkvhDHHZdgaQVpsGFS95RftjAAoxB4eQ4bGpwIR1iZyIXQpzC0W8S+BSaLv8X05Bt5ZuRKGOo6
	yI2hWDoMnn6vFsd/Lt2igQNuFtgUSenOodokKHnjTy8P3ZjPhTvy1lBqE+7SylCXAUuNqFBUfzvrM
	lGoL1j0pBlPJ9yM0FN1SOrSd7j7Hlr2tELlnInmeSCVoHniSU+OfQAvaCJA6Szasvq3XzXOHghx6m
	vb8n+Qtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgp2r-0000000Ef4n-1H7T;
	Fri, 16 Jan 2026 18:59:41 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgp2n-0000000Ef42-37gx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 18:59:39 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-12336c0a8b6so4849546c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768589976; x=1769194776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsdpmGsyOkVZsi/y+GsHdikzRvoYJyk6QlblSikl37w=;
        b=bwkA6mRxEQFdo7UJE1Izy9JHRJWmrH/Tsz15BUabKgUaqJncHDRX0uucmUFWa91Gmm
         8mnYgk++zc8/JtWMfKLideY2AUGFgGaSBP0MCUMzRDAcG/QQaoY9mMDRWxlvY3EMSkJl
         jXsAsoW9JOQagLV8R9vEy2P6BCsdWfOlpdkEiv7kGUKSesd/RmukzSpnFGQGqChhxdRV
         tSG9ct7RNfDcc47q8WVNYRV1QSZZ442LT8mM7DO7E7uqnESD/3QTOsRYq1pKHvCc6HW1
         aaajvx/0hPKs+9dPbfpg3EbYcrbZbzDQeB3UUW11isuSCzQH1jau8525ItUntDPwskcM
         QV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768589976; x=1769194776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OsdpmGsyOkVZsi/y+GsHdikzRvoYJyk6QlblSikl37w=;
        b=olOCb+pDuhP6nNbiKyN1J5pRxKlv0xAYuJBBnKwGZjKPabdXmS13sN/xF1e4cAJ7zQ
         c61SwY1SPXZk0s2GyCWkXZ1pnvkQSBi2dMYIlxi3Tw7GgIqNA587n3qr2x+b4BDDfctY
         bfTQXwYWvDVIwu0hwOJPSi0uJ52DZcxC3nJwujmnNxqmC/aiLhCb1tzl4AfEXHVG22Kz
         wKU0QCssCj54WV/+D+TxNE8Xs9+zMxwXAMlmY8wxHJLzCNdEVZcONfVEY/x99wBiBro7
         458v99xyedzdWGRg9okxBNPw7eblyN8jitnk4UO1TOo0WyQvPodqm0FeQRSdZ8VKG1Xq
         SJKA==
X-Forwarded-Encrypted: i=1; AJvYcCVBu9fCcub2+/GWPCsnyKns3v79sEG628GLthoJ3id5MI5JIumMaA3ed//6IKLjI5HMNX2G47/iMwvKyUepA5NX@lists.infradead.org
X-Gm-Message-State: AOJu0YyE6alV2blC1MsblOVmHcxUrtI4Oisy+baNiIeHQyK9vldk6YnG
	9/j0AlGQbWFGeqmUCz6ZvyERw57PAvvtrts5NM/uTG9z4m7WduFdhQTy
X-Gm-Gg: AY/fxX5MaNfzDNBhmAqlljItxx5rcWjivk2VP5CXiazHRpBcqwl1ZejgYdpTTiCIQIQ
	lwqZeVKwj4OALh2t+kEnObB7H5VTbZERmHQNLjv3mBMbZWF4NPl7PlOnOVT+Joly8WfjHjXaBua
	GruKn9gOuj+/kcjRq73/SPJgunTVTUYGfFbeaDxMAKPlpJ3Fqd0fB1Aej1hnnKzEOG1GAo6FcVS
	CpY+TplxOCjznJ+yn0gE+xrwHFfE0RtFM9PZcpOXCkVBSYlvsX1mwwDoRdLOvd2ZnLdwc+vbsET
	qqTm2iMM2ri0w2TiS6xV3Ow11xBdGcIVK42Pj6ZXOwGOJNOOW/emEKSKucrrWgOr/es3yhJaRcz
	939JqE6m0jU+QAGm20322n6qo4S5pgl7r+GOW6h9pvw88TOy1BT0hWv5HtAq3oklssktKGAvBcY
	zLvUNYwSoOVK/S591rHaIT5VQwBaZcHGi+izHKKFCrtcuvCpawQFIeqgJD9i2LAMbzRYGXM+A9S
	WXIvR8=
X-Received: by 2002:a05:7022:2397:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-1244a75f051mr3682555c88.26.1768589976312;
        Fri, 16 Jan 2026 10:59:36 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac57fd0sm3522534c88.3.2026.01.16.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 10:59:35 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Sheetal ." <sheetal@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: (subset) [PATCH V2 0/4] Add tegra264 audio device tree support
Date: Fri, 16 Jan 2026 19:59:27 +0100
Message-ID: <176858995889.167465.8638060731154515673.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250929105930.1767294-1-sheetal@nvidia.com>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_105937_788462_D303986D 
X-CRM114-Status: GOOD (  11.41  )
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

From: Thierry Reding <treding@nvidia.com>


On Mon, 29 Sep 2025 16:29:26 +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
> 
> Add device tree support for tegra264 audio subsystem including:
> - Binding update for
>   - 64-channel ADMA controller
>   - 32 RX/TX ADMAIF channels
>   - tegra264-agic binding for arm,gic
> - Add device tree nodes for
>   - APE subsystem (ACONNECT, AGIC, ADMA, AHUB and children (ADMAIF, I2S,
>     DMIC, DSPK, MVC, SFC, ASRC, AMX, ADX, OPE and Mixer) nodes
>   - HDA controller
>   - sound
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: dma: Update ADMA bindings for tegra264
      commit: 919f6cd469c605f1de2269d46d04ebf80a1af568

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

