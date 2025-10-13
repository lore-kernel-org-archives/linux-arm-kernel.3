Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448E4CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52qW7t9qFGfmc8duc2ZnW0Dwh+huBp5wpeF7g/x2FgA=; b=Llvq6kuUPYRGX/i/ULV9E0ULfF
	RwiUtBUqzMVrZ2AgraK+OYyPSac7MlnuFFMr/0i9vQaHy+TZxX/Ml6Yduh6VhTqFKQQAEHt2qhKjV
	3RZoH2O0ZbRykIRWAyENuxvPNYtu+iQpVJ9gWrgW0+ORFU6wwt99nRM7hB3kY2mkss5JFKfqShw33
	qlJHZp3ixyFioMrZLSKYuhPIo+LNpguVZFW/MOxxQiXeUx6btVqAaoOTq4HFTo4URgwVbcQxi1NwF
	7jgj7uy/6cxDEr3PRWMbUFx+SV9Infg7NN8ksWhDEbPou2zoLuJcWUg0Q/bw55e0/bePU6ZjrrENt
	zccF2CaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86OK-0000000BzKu-0r0o;
	Mon, 13 Oct 2025 00:26:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86OJ-0000000BzKf-1MkN
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 00:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=52qW7t9qFGfmc8duc2ZnW0Dwh+huBp5wpeF7g/x2FgA=; b=ITRPH99/EM6EudXUEGF/AubX1x
	cV/prsgEwbQbUT5wmPa1I5qN4IcqmCrXSe8D3qoan+nn3aVCbfkc/uFiinimCxEkPCpGuqHnGwyAx
	Lnxv4IZcjTbwrQLPVaHnYWiIMTUXj6T5gvOvTgZ4lPWNwrSMYiBusw2/3rQKJx0jMKDAeEU9u0yXX
	yS3z0x4RYjtx3sA/dMV7Riw2yt4W9NQlFo0AQsIKbecna85bcrtTVYUSohYMtEv9V62Yx/MDB69V9
	fNKnuVpib197BY8snjBCM7KviQmOHgPXSrQiXSQrJzsusmb68SC6gpcjGnRGxIbi7aZtmwljC2rnm
	WARpHwGA==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86OA-00000003x2I-1Rcf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 00:26:13 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b6396071f47so110363a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 17:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760315167; x=1760919967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52qW7t9qFGfmc8duc2ZnW0Dwh+huBp5wpeF7g/x2FgA=;
        b=bFD5l2m0Rc6idPB8vdB/yttMdTww6Wp1SjnzcjO4AWjF19eKNzc/DmMyf3s8XPhs1V
         9EQrdSabxmU0W51b5EesDVcTD5uMuc+tOt2x8bl+NMTggUvvpPTshQYjLrsXndOxLD1q
         AZ876QzPoOQapUyyOeRq0efE263GuDxAUlBRImfA9ECy220xagblUItg0J6S9KKxxZQ4
         0BVC6Ku0J/Y7PzbAnJu1nG/vyktq21Rmfz2N82b01qCfLnyBEHCFVy//e9CI6lOCcrRA
         svMgPiGIF2AKZVzD9TTETsXRVjNW8UEhm4SpTEyAunJUC16/qSgxBbqcMH2UjzlVRIBN
         1Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760315167; x=1760919967;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52qW7t9qFGfmc8duc2ZnW0Dwh+huBp5wpeF7g/x2FgA=;
        b=D/XlAOfaVItPetUlrUhR6hm/wx9u7GYGpqmFH77H/vlCV4HDYfj2y6L1ppCjMT/gkV
         BOi4mh5O41oAsB5/HpaAfXrlNoWjIZBU2uhe6fhLASrFlJbCH7HQANRke5fSolCElc2X
         6AonFU7pwH1VMHk3v4gLK0Atqf8xNsBelWhcmDOREOlg2lzDO9B0t5XFHKnzCVHn5fj8
         ZXAl6e0ZnG6uP+doz8pf6vfPUEIfC7s5O7cnXi7oMrkKu5R9v3+Qpxv3RbNedEZNHZrc
         YnHE5+k/Nmx79XP/0gLQulNSG5BKcLavPykCWwMRlBH9W/yHZ50MLyfY9sTakcYbt/xj
         uYaA==
X-Forwarded-Encrypted: i=1; AJvYcCVGzM2abhfv+se7R/2eSUuue+JxsMZQcnDBO2oGXo1x54cE893+UPKqB7wdX7frpNjxzrTlk/boDwIoHKp4B6Ul@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9K6u6iJsld+3qC6kDwH2JRMy5uWUmOQE7/Tq5eqX8Vw+mtItB
	SLVtS+HwIA/PpcB1txQ9TejDpUdV91KUoOmF2yNutuGahedeklnyKL+hC8Whdfqiy/g=
X-Gm-Gg: ASbGncvIndZNVCWro9cVDwGQIs50DI1VJQbxyemzVIBXJZaAYZB2tN3ZftOe89M7Xzn
	McMIl8zGdd9N2Y4eGgKGhMt5MPAnz2HUUN+gI7lNxhIINBtwnxvTwMsUjfSXU2rwlrXtVNHo7mr
	Om4PjqWeioDh46fCNTwvJ4VzpZ6dcHAEuFM+C2o/4ncGe7vuwO2GUCCoWrBiHEFFeir4KjH4JSO
	SFpiGORJYHStr6X7t/kg4kkmuLBd5Vjq5h2j3Oqmyh/NF3HH+P6qqkpG3Gwh/SZbegccxSYM+Fm
	Zro2fJ4ZG2O/MudDH7QVXE6+B8mbn6PUnW0sV23X2+cvL7JKssg/MPz8632n43SriPxeeRajPsI
	0GKie4leibKKTiOs3XrmI2jZJCN2cfY2GkIHF4Jlus9IEInEHM8C7ItUQ8DKHYzhfT8PJ/RQ=
X-Google-Smtp-Source: AGHT+IGvoh+AZ0SUxDtJK2K9IGdS0Lw3Mw50fcHGc3vf/lr8P7A3VShG6ttG1Wy2MqgJYHaTqL7WRQ==
X-Received: by 2002:a05:6a00:1250:b0:781:1bf7:8c66 with SMTP id d2e1a72fcca58-79387c1ae19mr13001682b3a.7.1760315167533;
        Sun, 12 Oct 2025 17:26:07 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096740sm9624862b3a.38.2025.10.12.17.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:26:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-7-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
 <20250928-exynos7870-dt-fixes-v1-7-a40e77a73f16@disroot.org>
Subject: Re: (subset) [PATCH 7/7] arm64: dts: exynos7870-on7xelte: add
 bus-width to mmc0 node
Message-Id: <176031516254.11660.11521062491196215930.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 02:26:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_012611_987828_25E1484E 
X-CRM114-Status: UNSURE (   8.70  )
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


On Sun, 28 Sep 2025 22:13:58 +0530, Kaustabh Chakraborty wrote:
> Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
> assumes bus width to be 8 if not present in devicetree, so at least with
> respect to the Linux kernel, this doesn't introduce any functional
> changes. But other drivers referring to it may not. Either way, without
> the bus-width property the hardware description remains incomplete.
> 
> 
> [...]

Applied, thanks!

[7/7] arm64: dts: exynos7870-on7xelte: add bus-width to mmc0 node
      https://git.kernel.org/krzk/linux/c/2bb07378bae9504f5122bfbe4a6082bcdcc8bdf6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


