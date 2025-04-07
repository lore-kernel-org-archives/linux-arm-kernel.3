Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7560C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 06:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XX4Jkq7F2MHTZ19HnSyenZ2sT8C/TpJOx93V1M+Do4Q=; b=KY73kWpzxVUJbE+BdxOBREkQ9x
	KaGasB+olUt8tRK9+Z5gAWM1e2wzJg4qfco2ND6uFj8tACr5dqeQQONzNSX1pnRgRPDGkptTo9mIJ
	6IG1ixCIGSDUmboVahc8XctI4chlCDYx5NtOxIij9dVlK7pNrG7g+Fq6HbTCcmxmFzNCZYCTF6fAs
	nGSATVW07B1NuqQATqNSnjuXZPZyvuDuCNPJe+8e5FLxgPUjEvNXgrrfH3ewallVd7pXW7fx3k0Ai
	UG5+2denX/0ot8kNseQVYpuQhk2XHXCHUEPIDBX9iCYaASoVkthZe+sJkPkPAxebuliKBqm5HBnvP
	cVOcMt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gJG-0000000Gd0m-31Qq;
	Mon, 07 Apr 2025 06:50:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gGH-0000000GcSf-0VoH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 06:47:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39973c72e8cso440455f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 23:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744008431; x=1744613231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX4Jkq7F2MHTZ19HnSyenZ2sT8C/TpJOx93V1M+Do4Q=;
        b=EqrqZXNTdLrlZKV2L2no9m5FZKXVyBFpzMoYHiXo0zta3iNtm+OMewMRYplTBlGNUa
         p7uJBLZFPvZmXwEXuLiRZT5j+JZIoiXeb2UrItd9pod8Eg8bKDBmwNHFA7HleMafGrmn
         noTYwL4PQAZ+IN3uPYg+gED2hrTw4P44H3hts6yNxvqTZfdU5KWLRK/prXXmrWtIqd85
         zfiss6yM7C+dMrGBkM3n78Pu6cq+5mmhtPFHtOFQ2/xrnBnWIJasQBuW/JXxanQ1DCdB
         oOHR4hMcPA4F5CONHaUpz0M9iwU1wYmfwxjgTNZ9M5YaIlw6K+bngzlNST66Hqb65CvN
         MDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744008431; x=1744613231;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XX4Jkq7F2MHTZ19HnSyenZ2sT8C/TpJOx93V1M+Do4Q=;
        b=wW3S3Bn/fVjjt+h29H/A9Fp8w+evHe2dtqOLX5mIflm63iWiKBYbEDu2Etht6ohimk
         GgiHDWrhqXo/QPpU67dceqc9Bh6J8acCGc+CD9V6XRp6x2lebzgr8VG5QPJN/vDYQy0O
         aCc6i7W+a731VtgHwVNUSOTZuwNPEDu9VJJ4HEPgf3Eeo3Y4Mdwri/LyKmqmlgaz7IxS
         p5mGYwddQQjHoBgFMQ/3Ji4hoAQWZHH/IC8AtnCIvTFfUSQazRPhc5H1h7reytluGQi4
         8RiXika1ozqnpRKZX4orSFsS/vzgoO2iJNffdOwJVQRsB8x3+jQzjNMrs+QS9of/SWZp
         Z4SA==
X-Forwarded-Encrypted: i=1; AJvYcCXFuQ4R4U36EsfGWwr6O7C9AA6V7IEbHyHFaOWVz66VaTodj2k+otX9vhsBEqEFzru4ZYYx0eoZy/smTbCuJER1@lists.infradead.org
X-Gm-Message-State: AOJu0YxrP4eiTRCMp75hPQyAWTj286JTJnEYbJrFClHSRPm47DpRPs3U
	YxVJ2zg9G0qFzE6PHaojRhHMEsno6o20sJyZN9j7Rhdq3h4EtQdZq1D5qzrY8v0=
X-Gm-Gg: ASbGnctghzU9Q2y60mAsEldD+17lmGi7o5jGchcrXaHWb6GgGicidYzLHImg7s+/new
	Dn1VBGr1/vpobF/N5RBjCzEKjeu8yCOYDjwrCj+oa01hfEOaah6yei04QR5Juvzni6LxohNvxoZ
	AOpnjLJ37Ay8Or109f1ohjLrj1e5opVodXIj/v1s6qWN9+Mf6wz9Am4ynl9Ic/3ObYlqNP3OdwG
	otvoeQj6fr2MH33Avdvk47dR7RC3fWqlpCr6j4lD/4FUwTuX3m4LywjiNfGImQvR34zPpcSbQ9c
	aLzqdP3mfJwMWI3m/fpGmUQSlLXON1WrWk2cGad/mlUZ3ByBWGtzab8iVoSZCPc=
X-Google-Smtp-Source: AGHT+IFPlo+ogc8IoUpTutl/PEc1yBD2j3zf2hRxADVMO+meHMTOAqAONXCBpw+hbR5fT9xhQjl9zw==
X-Received: by 2002:a05:6000:2511:b0:391:320d:95de with SMTP id ffacd0b85a97d-39cb359e2b0mr3957525f8f.4.1744008431518;
        Sun, 06 Apr 2025 23:47:11 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a67a1sm11024855f8f.24.2025.04.06.23.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:47:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
References: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
Subject: Re: [PATCH v3 0/2] firmware: exynos-acpm: allow use during system
 shutdown
Message-Id: <174400843030.38277.2924199101043205009.b4-ty@linaro.org>
Date: Mon, 07 Apr 2025 08:47:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_234713_157904_8C592167 
X-CRM114-Status: GOOD (  11.47  )
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


On Tue, 25 Mar 2025 09:46:06 +0000, André Draszik wrote:
> One user of this ACPM driver is a PMIC driver that needs to communicate
> with the PMIC during late system shutdown [1] and at that time we are
> not allowed to sleep anymore.
> 
> This series address this by switching the code to using udelay() in the
> specific case of system shutdown. This approach was inspired by I2C's
> i2c_in_atomic_xfer_mode(), which has to deal with a similar corner
> case.
> 
> [...]

Applied, thanks!

[1/2] firmware: exynos-acpm: use ktime APIs for timeout detection
      https://git.kernel.org/krzk/linux/c/d2098981eb7b7d20edd294a8431908f8a0d2f9c0
[2/2] firmware: exynos-acpm: allow use during system shutdown
      https://git.kernel.org/krzk/linux/c/2d14c680e92f09d18b984cd1a8fae437f9ebc2ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


