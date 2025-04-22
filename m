Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B52C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2SXaJr1crC6irGTaWOzi3O3ULAEyfrCbSvTACAoxuM=; b=FvoffnjA9un6Loe38dQ1988HrC
	onUHgyEWHyAGqOIO+9azKZCjt8/Fs08eFZzW+rrKVlVc/5xiBLCwMHvEHO81Bropd4meSO6FdsLEG
	YgzfaTN+EqNSnWjR2950G1+tybMq7X05Zx5Gz/B06koUTbV97m5X0WaK4hDUyXDe53uOMGSO+dtcj
	OpIGDu+PY01G+Jx8NegGtQiFFGKNP6t9MGRPTx2RRQOdQgoUwIFpjwNXZjkLXo4f2QtjtszWD10+I
	ifUuS4WxfS1KuqB38J1zB5jn+AFn7umZ1UO2uqWtir6KPEEEkp9VdB2imx3bfQHfPwGPhRCjkndMo
	idmtyxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79u6-00000006YRI-2kWs;
	Tue, 22 Apr 2025 09:26:58 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78aq-00000006Dxx-0Oi2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:03:01 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso756808a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 01:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745308978; x=1745913778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2SXaJr1crC6irGTaWOzi3O3ULAEyfrCbSvTACAoxuM=;
        b=LVKqsrJdwB0zqqZu32/96i727VMMdUySip1kMJ3Bo4tmQyjeCLjS9xw993u68lcoEU
         0vKaB3jmtS7eiZc+oYn2+TSOTIrpWiGrq54yqZjReZOYCXVpLFmRfQTOYRSAgJHPYoBM
         PHiRtvTSbIKcJx/RS9tJni3L/BrxfbefMqXW/Z43fSkZdvyOqaGE/AdBwU++TqcSCgKI
         Vq824cQvXQ7O/Cd5YqOqupTIOyYaiMRROtXs6VUM9XQEytC9Q9CM2b8wi26BLBxM8acr
         497QBNi3r1Cpm+Hb+6CDyxL2pAXqj23y96Wu/L0W+yDdmPz7kPQVN16Y/hxZKHkNgNq0
         e/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308978; x=1745913778;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2SXaJr1crC6irGTaWOzi3O3ULAEyfrCbSvTACAoxuM=;
        b=DrSmWdMBkq4lj9Q56LwjMxCWoAMM2jAfbUbjaNs3EEEJKeA+eVpWcaoEJRk+zkDRCA
         R95OuqTdHJGqWq3YMGRcwZOr49WXkWJNEHv2EkpwzBgSDj9170JMn/VYqB8tUQTMbbiX
         hTI90CdYa6L2Accwq/9pbTmyh4aaA/2jWeaOOfIeHChUqeGdh1Kvg2nlq/S/x51jgKNA
         /rtHm5yxZAjT2i/nG9f51l6+MsVHC39c9U+JDLx1M0VCFXtVO21hBJIV+O4LMuoDY4Db
         5itHeGdM8D8zeRRfIPwfmwAEQecEXNvIAVxLFSEuJUNXS2Lmod2dBR3nmI29nT+Yv6S1
         XQ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi/Zs1bezOduDLShdjzVMO2q8BeOXPGICwyjnw1CKla6mJsy1Urw+AXHeTETQ/03SbjI3tZrnucL17cgSEHBQ6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3W/3S6LcxfgJTxjs1RBJx3FpEit3r8e+e5qtkwGGeh3d8Ofdm
	axYb5FWJmo2oOPUAFoHYgDD7la2XHNTRZupOGQHQFHZI+dpxi2JC9DN1Kvmzx8o=
X-Gm-Gg: ASbGnculB4sUnX4xxRlpNOXA949pBwKyGwe5jMxaI1DrAnuTggewQIMg9AyH9bWlso8
	CRXWIAcyDhfEBRxfRpD+RbyloLd+rgiW1zFipa+JlJb+dkP3CXfcG/7NrgTXF/ijdpSxkpwFZEH
	hw7iuTECdZghRqlKsR57iiFpcQ2KVO2M1JJed4834CZjZUQbebWfL8SZe0AGAvwVKWQ6bebm9f2
	FL4K/G+E1j4xROA60KwCQGzJvgc4Q7lpq+RIZlg4wpeEtrt8qv0henVMc4hd90c6Ab4wnBW+ooG
	neqNbgKIXAO3btuXBqbjf0Z3YRim7MwtwiuuLz4sB1T91BI2OE2ykPt2HKM6ZJSoa5zkbQ==
X-Google-Smtp-Source: AGHT+IEO95pVgcbTTuL6m1nZThpMsZDecLSZl0E0qY4XHaTmqD45YQmuajiyCZeoAAauzastwGCgcw==
X-Received: by 2002:a05:6402:4312:b0:5ee:497:5221 with SMTP id 4fb4d7f45d1cf-5f628628bdamr4155171a12.11.1745308977929;
        Tue, 22 Apr 2025 01:02:57 -0700 (PDT)
Received: from [192.168.70.232] ([88.154.3.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625593409sm5532352a12.37.2025.04.22.01.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:02:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh@kernel.org, alim.akhtar@samsung.com, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Faraz Ata <faraz.ata@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dev.tailor@samsung.com, rosa.pila@samsung.com
In-Reply-To: <20250417113511.759268-1-faraz.ata@samsung.com>
References: <CGME20250417112513epcas5p2a44d0a4cfca2cccf97f1599af0e6b494@epcas5p2.samsung.com>
 <20250417113511.759268-1-faraz.ata@samsung.com>
Subject: Re: [PATCH v3] arm64: dts: exynos: Add DT node for all UART ports
Message-Id: <174530897488.9276.17366412245478167269.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 10:02:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_010300_138530_D9BAFD8F 
X-CRM114-Status: UNSURE (   7.04  )
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


On Thu, 17 Apr 2025 17:05:11 +0530, Faraz Ata wrote:
> Universal Serial Interface (USI) supports three serial protocol
> like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> Add all the USI DT node and subsequent uart nodes for all the instances.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: Add DT node for all UART ports
      https://git.kernel.org/krzk/linux/c/1a6ee48d8757dbd1c243fa518ff31f33665d4fa0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


