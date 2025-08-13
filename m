Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C5DCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZSse5z3Xz3M0O4BGbTx+nqu/znB14s8R4egSwB9b9M=; b=AbPTIjl4ZawGqYi97DH2ovWdAF
	zjMDJRoYdtwmUgy4kkHOEKeyvqtHPiI942FFOJhBHiHnoWpk8rukUaEDNMyLhxJ439U5Hsd7GvvjE
	sdIsuswIKp9gRecjJhi/8u/v8TmOfSGrxjh8Z55GNVm02E2av6fQAxIBLwahJX0vUUO/gp/bCAcj4
	2KUqbPX8GiydP9Ze2orEdnfIdBNbCzje3eRutN1AhXQQ5SbXWga3D3v6Ae1DuJSBBCbulQ3gKWDWI
	UYvgxZvUyYhUa8kk9jfR9j+Lm16CicIIUetX6yQEjsOivSF+zwCT1DLiHgI4KOKp2eRKbDThIfH2D
	mr9Z5m6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Ux-0000000DV63-0xup;
	Wed, 13 Aug 2025 11:18:27 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8qS-0000000DOxH-1hbS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:36:37 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-af940717334so85190466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755081394; x=1755686194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZSse5z3Xz3M0O4BGbTx+nqu/znB14s8R4egSwB9b9M=;
        b=LFwzqzPFBh8QY9ZwrdVTnLom8NLN9xV5vmJzynsoLT2Ao3SchheB61rgfswVgeACYL
         etcQvvPlEA3Y/+TrAU/Nr1nDS0XAV+RDp/ilQntOe7u2vgkafjfmZCPPsub5tcxSDTx2
         C8hzcMz9d+0W/WxIL32B0dcKuWycWmyVD1M8RDl82ZlCXPFQimOUwl5mQqGN3apP1a4x
         3MbRJIBD1cy5wcpfDMGUxQCOAgT6aCN8vQqgBdcK5buYcMVzfkHS8vKKPObY/PaIVKbZ
         w1nAR9l2jBJRnRahW1hh+Kog9j7zXlFKdlpRdjDm91G2LxH9qLdWM1ukRBDN+aZMgR2o
         il4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081394; x=1755686194;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZSse5z3Xz3M0O4BGbTx+nqu/znB14s8R4egSwB9b9M=;
        b=RQshe4w3qAoRVF59zE59J9HTp8fpnz3wVcR/37zC+3L7NGzcOa3hkDfNUjiHgTkmCL
         nGnlnBspU2bqEiBGFulyvzLvkl/EQwCXkuJo5LsfcBaxEQyAhP5WcRWPYJGq3uUM8kIn
         GYQE81ZGtbZHoMwy25s6QJAtG6U1yUr8QPU4toeGim79ZQ6UFdW78n+JbLYZj2C4FolM
         r5BEtZ3zuytLYtPKmtDkdXqLJ3i657TMyXsHQIEhMfRg7q99qyBeoGCTqNvbKvZRRsBO
         ei0axIa9+pkx5n+WDAljsvgf4t7f40Agbzf4mtC2qfO+LbUm/IRdFALxzjck5TGz6H6S
         hLCA==
X-Forwarded-Encrypted: i=1; AJvYcCXJOZzqZQKzs0jvugn84JCNHwhKBpvd+6QZYw2vh1EG037GSSLZvBKu0aQZDvQAtt07qk/EEmLHr1cgqHlty89z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Mj/SzfAnjFtHG4Pc/VSZWHS5zT9hFzifSTwzeLSD1Cu6h24a
	8s2vqT/qMJAT+H1tVD3xXfP2y9C+8oHZ+DKOp58gTiys20vwHRtPhtW9BMt4NMWNFnoTzXpDkj1
	Pz8Hu
X-Gm-Gg: ASbGncszggIyUPDhuVDnoF1lyWWCvybaVsrHLPeToUunKTQ/iFWGZ4jN/knI8KsKvFw
	v/KOfwFNUEJpN8xu7kfGXf1k0PrqSvVFDzG8PuX2dMT5uI/FeiCOIv11+lOlv2opdZWIvlHEysI
	t1oEKMsIQiMybMcQ6SMhKjW9vxtplaxmtZRDzSAYG9FJB4E9o4Ve1b99VOG8ns+hxVN0FU2clv8
	C+/gjJ1t7I2tIiD59l/G2acdJeTZfnq/+tQImIvoJEzA3bNe1rlTtAor6QhNmXswtVxGqIRBKej
	eexEyMjvrSCZdL42sXri+1SF+iYTk/E+n4y2YFwtT0OVu4PnIJ/8s979JeP7XR1MnyzTFMKw9bC
	ahK4j4LV27A/Bw2cKwYJilJ+uuO5Wjj8XchcvwG/oSo/MRH1lLQ==
X-Google-Smtp-Source: AGHT+IFIGBvJE51ImLFwJEf+HWdvDhMI/ga9sn6qqV6XG49qX/4+cl2bNcAjFXq4HMH1UQxepumpXQ==
X-Received: by 2002:a17:906:4794:b0:af9:7e88:e174 with SMTP id a640c23a62f3a-afca4e6e6b9mr94000266b.12.1755081394358;
        Wed, 13 Aug 2025 03:36:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c08csm2392328866b.118.2025.08.13.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:36:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250731234532.12903-1-semen.protsenko@linaro.org>
References: <20250731234532.12903-1-semen.protsenko@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: Add Ethernet node for E850-96
 board
Message-Id: <175508139304.40388.17997940621075080202.b4-ty@linaro.org>
Date: Wed, 13 Aug 2025 12:36:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_033636_449825_AF05DB0C 
X-CRM114-Status: GOOD (  11.71  )
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


On Thu, 31 Jul 2025 18:45:32 -0500, Sam Protsenko wrote:
> The E850-96 board has a hard-wired LAN9514 chip which acts as a USB hub
> and Ethernet bridge. It's being discovered dynamically when the USB bus
> gets enumerated, but the corresponding Ethernet device tree node is
> still needed for the bootloader to pass the MAC address through. Add
> LAN9514 nodes as described in [1]. 'local-mac-address' property (in the
> 'ethernet' node) is used for MAC address handover from the bootloader to
> Linux.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: Add Ethernet node for E850-96 board
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


