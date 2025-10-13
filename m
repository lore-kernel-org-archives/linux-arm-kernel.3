Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10390CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h7DDrA7j+9540Tqy/6NV+bqJw0DCMI3GYZXvoLWyYk=; b=Y/Nu5Z4Rnc0Axxgxf0dGnwNYIR
	WL9iWEDSvQc+1GH41APfESRI9QH04E+XrOBYUzmg4YeGil/oTICTovCFZqlz/lI7s7A35d5qc8If1
	1Ymn6qp4I1bUg1l0Y6YfjNRp+pIm3peseN7pF8rZJS6L+Y4H9UWph9GXG+uOnnhfzolc1lcEC8fJa
	pEUYw1rbdxS2bPbBBtgM/gyU9UJ6wyGm7CYY6atrD2qsIDPMRhEoivjuVJhoe/SbX82oOiolQByyS
	G9rr+1NNzEyjXY2pFNF8pDppTldBNiJuutx35Cmx04mBn50KzPG1KSDwhXC+0enPpFXwEKaO7yGpC
	Or19mcvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86x1-0000000C0sn-0SQA;
	Mon, 13 Oct 2025 01:02:11 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wy-0000000C0qV-19KX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:02:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-781254d146eso236835b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317327; x=1760922127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8h7DDrA7j+9540Tqy/6NV+bqJw0DCMI3GYZXvoLWyYk=;
        b=cBIfLAMuaae00qoOeCOKOYs4egpuzIEYMKXomOyAjBOeqHTr+T0CUm9xMSSNEedxG+
         Pf5yvzRtpvMiVvPDtKnNzxEc1lsmy83pau88rdq49Sf8d5nbtRq+3Qi2x3w+v2Ok9zxz
         EO4tKPG52cd3io955TfmqOUS8miCxcyy/JOuiWKNmelPMUG0ozTJdw4D1efnZO+6aAyq
         mlcpFTwZbIRQEHwFcvJ0MUniUFZV7n1Wbc3QVPiwRp/eygmrXH1Kig5wLAjcHVPRl8B0
         eQytU3qL/8vEDZkmq7LDvL9I9vXeEoSNZPaoDs3pNV6OObpmw20iroHt6xstvcFVO3Rl
         v0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317327; x=1760922127;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8h7DDrA7j+9540Tqy/6NV+bqJw0DCMI3GYZXvoLWyYk=;
        b=qxuFQuDOP8bYfmANkoNqv58ByKB0yBjxz1oA9Z60aj8nx5LEUhWlr3diKXCC5FQRmu
         rfEQ4AAyO9bFOQVd44kU3FdRnJoHCOhoB2ZLulTKzZ8fG6x2SkNZMJfhxiru1pp2whrc
         rJndHOH8jkBatOUVTnjNPnMlBQxMglhsuYphGbfnN7ZDS/caL5K1l4OW4E80+okRXtnx
         J1b1GkeYl34FtYx3jaYO6o+8+vr9FNAztjAAY49587xUjCrobLOozC5SUNhOliaEdNyE
         dS5qpuHjNGpfYSAtIjGW+bVttLKk4zsmuHP3UIMr2a3xKCHgd7GEVMrcB/WQOPK7FRyD
         Y73A==
X-Forwarded-Encrypted: i=1; AJvYcCUiHeyMyBfZTLwNTmKvFFa9EzttXCmJAT5ZrBEOpcVV/MHKTqQru+/bfkFaQaQq4FPgFPa8rbfvOPxP4bfFSKrF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7wL7BN2pOytf+gXg2NnqX1jBjUJJNjFBGH8GEFJckAISXK6jp
	u1eFK7lMjLg40sknWRSdJCtC6RygqZA1EEhQuz2yHgoO0QCKs6VurkQ7ZxcBsV8I/ZI=
X-Gm-Gg: ASbGncuNeDO8e0aaCUKYNn0Dj1/CjW187bM8qVNyBpWW0Us3ujeJTxLHWXVNhODzPxZ
	e4choZOyVQl3YhmYhWg93H5KBrS+AYPwep6k0pb6l/ojzB/QMCIS7WSIICAY6qlqnyVT0qCWXHO
	pYjOlQTwj26twX+2tZ0CJc83D7PI7+CfjdQXo5/pLSjkinDVntNszRm/BG8/oHz9zliYqulJham
	t1HsWMnTVyq2QPOVpPRLupbI2Zd8JXHQi/jEz9BKvto+XXfDlMcF5QJYjCkRJ9wVShhXZekwgeb
	R/5aDLYtwBrzGTg3IQjBCrGOBZHu9tjSHlypfGPuYbIpKSnJXQuPgmRB0G3NvIKKkuCIPRzaZzs
	lYH0+TjYMqIMU2ub2TnqlEh1Ssu6Hh/Vv/64zVRIbHgU5EuH1JqxDYs+fHTWheMnh00H/HX8=
X-Google-Smtp-Source: AGHT+IGnD/2S9vnckWUYx+lQefO8k9+6JLQFNxeCb9U29jbHzHiJy1UtLcBAdXedqp1xT25g8Y9crw==
X-Received: by 2002:a05:6a00:1705:b0:781:229b:cf82 with SMTP id d2e1a72fcca58-7938762f1fdmr11941331b3a.3.1760317327480;
        Sun, 12 Oct 2025 18:02:07 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org
In-Reply-To: <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
 <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
Subject: Re: (subset) [PATCH v3 1/7] dt-bindings: soc: samsung:
 exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
Message-Id: <176031732291.32330.1246219208832468083.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:02:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_180208_324854_F1D771A9 
X-CRM114-Status: UNSURE (   6.82  )
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


On Wed, 17 Sep 2025 21:04:21 +0000, Denzeel Oliva wrote:
> Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
> controllers.
> 
> 

Applied, thanks!

[1/7] dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
      https://git.kernel.org/krzk/linux/c/ca4bd675ec459bb7bb008f15f5d866c9ce35f4e2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


