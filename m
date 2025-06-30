Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20452C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 07:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbcEwlMPoK+8K0Wa3mxW6OSQ+8uP+x2nz1ulJY9SlpQ=; b=krRYgWU5elO21/CEzNbrIXm8WF
	adevBYqNjTs2DIq1LlS/T4O+b5lEZ2pCBT6q0Fxwh4tmBtdsANdUH7VJxrF3Bw73j/244gwC7TN0l
	i9VxBGi5gwLKODz9YqpAmDVRGSaya1h8FNprQKlzza3sHb29+KnVA10cQXecwZIYAGl08XLM6YSCc
	smfMjxT7QfRdezkwSbFoWfEItLvq+uMNe0ZfdUTX4vT6Jrm8QCVDGKrK++DkhIEQyn/IkPtNA4b1x
	Ou24AWMlQiKzJlAnbd2++nvU8DgTgnnnDG5GdRl89HJ7Q2+QgxEEeDSl9EciDWKhcts8ZIc9LoV1J
	N0O4rKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8W9-00000001Ois-3K4M;
	Mon, 30 Jun 2025 07:01:29 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8RY-00000001O8y-2QGI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 06:56:45 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6089c0d376eso844655a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751266603; x=1751871403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbcEwlMPoK+8K0Wa3mxW6OSQ+8uP+x2nz1ulJY9SlpQ=;
        b=TkKKiIP3pElZ+JaS+6UuLPiik8zTs0kIDujqZni7PqpZfuKoHZXq2Vr0hB5uIl5N35
         M6862ljO8RsyDlc0oEC5BJwuGn5pFkuwVmlfLtM4WUY5iQn9l6diLYybwfvQVGQPnOSV
         8GVe0fKW+vOoD3ohueDYwdsWB7qasjUHz1oLrAllidbzjSAoHohlflDxbSnwY81UVbL/
         ystd3+jHi7yIV0/A8cUrwvh8lp1LM/Xy63D582q4E+3COt+/FSM/UKqJsBAjEyNOn8fI
         PT5FSxhco3VijV2mqi7xPBl440ZAPI8Txrd0wZyD6Mzylcuq1wV2rel5fGVfdlmVfB+L
         8hGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266603; x=1751871403;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbcEwlMPoK+8K0Wa3mxW6OSQ+8uP+x2nz1ulJY9SlpQ=;
        b=Obtv7Cdisc6Xqv/4B5RvCxszfBaEPkk2z6E0unocMfd0N9cIJ3yLUw0Ngd/O1FXT8m
         r+WbZUHxl0Ozf+Et/z5u3docxoY394OZf33Ccw1ARzTYn+qNestgOE10hkLw1mt/ZVbs
         WjfziWsJw4ALjUWLBd1jJEdI6oXIQumN0MrrJp5gkTdBjVzTSDOHX9xvIJClTwEfBpE3
         qSpAdkpUwzhgpeMF3rOGrGpzrrIsZcefX8MTghgOkxdQUOGMDXpM95nV1CwJIPWujaUm
         wowAKbBoTUUyYyZVCQV8T/Y1jbgmZw7tPIlGA3afw/DS1IDbClBGGeu0ziPd2CCy7jGu
         TcIg==
X-Forwarded-Encrypted: i=1; AJvYcCUeva2FrDnZ1rzfC7qiu32bPuXK2Rb0KfhcgJIxLMGU/U7al9tqncfCmD4yjD7sXrGtP/bRSXHn59lR1X+dc/JU@lists.infradead.org
X-Gm-Message-State: AOJu0YwYNKnaQZ3VrCvIeHkIcnCgjIFswYnphdDOjAbXG5i+Q33UhMQL
	LBmM9WJA7JrT/F2mzDDdMQy+rlU6GY7NoaMOL54SgvHk0oC1setjL8LXy9FiE6NQYMY=
X-Gm-Gg: ASbGncuRiZwqSqS9wFtcArhZ1Nb0Frh/c+lEEiwdfdjCnKaIPhm59kzSMJbgKo1+sH0
	4QB7rPWdVRW/elXfSPKOi0nRNRojhNO/A5iXCKf3SwkHX3dbd5VlzuzsuBuzypAHidwq57xDIQx
	kTa/eDzQDh5E8E0rvqCRmHeBniALWPltOZ9iyyabNDJrxc/ExEJlnckIR1f2m4lEX2/nRmkxMre
	Rv/MMuuAZt2xfPEUNdqS1aPytsEijefldPBfTUxUiXJW4OUPrcdharSPI/0f2nwfUCEn58KX2F4
	jz3JYbpBmLV7jhSoKZq9MbUKfe2j379TkpNcjlE+qit1577IzX5RqtoUbQB6j626Kt+UN952yrn
	A
X-Google-Smtp-Source: AGHT+IFP0wQ8NEUxXNo3uWDGN4V5O/Owg/HraPOpJkav6IiJwSf1ANe4iXPDIZitMnEo6gWmmey5OQ==
X-Received: by 2002:a05:6402:5023:b0:60c:39b6:69e5 with SMTP id 4fb4d7f45d1cf-60ca3de328fmr2215955a12.6.1751266603199;
        Sun, 29 Jun 2025 23:56:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb118sm5368960a12.2.2025.06.29.23.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:56:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250627-gs101-reboot3-v1-1-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
 <20250627-gs101-reboot3-v1-1-c3ae49657b1f@linaro.org>
Subject: Re: (subset) [PATCH 1/3] arm64: defconfig: enable Samsung PMIC
 over ACPM
Message-Id: <175126660170.23797.11112517547521144221.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 08:56:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_235644_616114_D0BCC0F7 
X-CRM114-Status: UNSURE (   8.37  )
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


On Fri, 27 Jun 2025 14:29:30 +0100, André Draszik wrote:
> Enable the Samsung s2mpg1x driver as this is used by the gs101-oriole
> and gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards.
> 
> It communicates over ACPM instead of I2C, hence the additional
> defconfig item.
> 
> 
> [...]

Applied, thanks!

[1/3] arm64: defconfig: enable Samsung PMIC over ACPM
      https://git.kernel.org/krzk/linux/c/a7d7aebed4005b9c287f9bd9d22c273da63c9028

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


