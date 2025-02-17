Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B91BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/PEWwDl9MB7g9G1AMh/oGEgtW4u5T+aVOkhOdQ40XU=; b=ybSK/2AIxJcJWp6Em8U+KJD1Es
	7l41hVByGbNRdTaOEg6/p3iCD1ILQXaXW7OXnWdpuVJnPKUAZldAtEM/MPMadS8yaS3oEMdF+guRR
	d8cqKGK3nM9UHuTYy+VrTODZr7UJSTbWJpthSguRoAfcIZ7VSgyvKZEj16Yi2Q39VMhJ43pBbjcCo
	YKa9SH2eHIg5Thj11U0sUDgW3AX605O/4A/Zpo8FmUTs++DEnDk5Tx3diN7mXruqJnENvPy4DoHYg
	bR8ktG0VQgTnPrCI/4VxnAyAmatBDyv8VYIywR7BtYFWH0t4OwlEI0hwJ7zb2ntQcUAspwOLl29KX
	H/VLbkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjylZ-00000004CO6-0BwN;
	Mon, 17 Feb 2025 10:54:21 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyUX-000000048PI-44qd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:36:47 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ab7c4350826so74794166b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739788604; x=1740393404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/PEWwDl9MB7g9G1AMh/oGEgtW4u5T+aVOkhOdQ40XU=;
        b=DTNEY9KzMTftJh98ZvSTuQMMpf9isg2EsjPd+LYUU0r47nZa8/YlNWB5EIWuZSGNCB
         21IRWbPF0NrUJhh54TnXX1CwJ0Ple0rXBV3DK9N0tMF+WamlnvcUvSjvKbfRO4BBBcmC
         AZxmBAFo/yloDIA89wfcEQHi4IuioesGcXMI7lWdUHxnx8bySOSZ6XQ1oz1xLpb6qhCU
         E2Q0IgQxSS8WqpkaH2123QP35TPJ+CbNOSo7qeKKc1NhSgqPl9tF/PwXARTQuBz0MqFo
         KRh7R+Qh18xVIsHsFThS4m4m6DGUjsrErvIwNpRsjqgUYH9evnuPk56reWJu89EqHoqP
         Cppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788604; x=1740393404;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/PEWwDl9MB7g9G1AMh/oGEgtW4u5T+aVOkhOdQ40XU=;
        b=t5QJcRiegsPgenP7Ot2TXq9+K7Y0vCvv4FhbnqM7JOXTRTbh17XGNRDY4OPNT3vbZJ
         Xi0YEsctzmbB9DT4IwMsUwhIUN8171GUn+gu1GpV26V5SNmAHVQwxXn5BLambArkRc5x
         ulO2iSjPpKVCx39hKFz1am+rUWRR5JieETRTnZ/SaGu0NYzgxZbMej0fHcDIsQk3gilB
         eY5BG2d2aSXAOvTMDAO2W27o37obYpZhELNoAb1+Tb16Oj/z7PqL/H9Puwnzf8PAy9Al
         Jh7C5UC03kmj9h0KVCPMwN3ylONB4O2+P0kfa4QxMToeO6PLCQomuDciMEeqTWB513LU
         Xj8w==
X-Forwarded-Encrypted: i=1; AJvYcCVx3XADQQ/IUIbLv0WNVLbfVTRhD244Jc4RgflNO1cIlfU4O9AGZIUyc2NjT8PFgVlU9SOQ1l88JiVx/aVBXoMU@lists.infradead.org
X-Gm-Message-State: AOJu0YxIRwgmLTd9clBMCLDUZEtqLd/ynrSyebabGAnFcJZYFTNGLJ4i
	IlQtkg6ehIJLUzHgFZo2hV7+w9/ycQ759QK1Oq1wslZfXOhIBE7fbeitDnZjkQEq/fgM+81dtUN
	F
X-Gm-Gg: ASbGnctPgCtcrclvE+q/pJ/FNPVClNsq/PNuZoE+xH0GKqojuaZ98adKKNaoMfCIZH/
	m46Zi/D12TKAYvT5RFOfiuVg3ZpUiHWFUtbN4GtVkHEDRhNKcE+sx+plDYNZnscuoefldO3/fQk
	PWKfkqw8xOg3SDakf8iupaalWOJ/OEeEbEZ/LT94y1xcDsMF+ruxnMrnm4FfgpHozFCoxQ0b+pT
	m9T0GaevP7FWAjkBCpA3WwfwAppdpFmeh6YWDnENsVqYFOjHBeDQ5gjrgwYcKJ2irRzS+UccU1B
	aBMqg815I9swpiYb3kQdm/IgxFbmoYo=
X-Google-Smtp-Source: AGHT+IGmMJF4ViTaqLqJAPAEqki9C4gvYmwTm6OvO86oLDWZLtgcjDXJ1cUh7+WEg2+muDpD9D2hyg==
X-Received: by 2002:a17:907:94d6:b0:ab7:c28f:de59 with SMTP id a640c23a62f3a-abb70e5eca0mr311989366b.13.1739788603832;
        Mon, 17 Feb 2025 02:36:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb961594absm230383566b.111.2025.02.17.02.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:36:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: alim.akhtar@samsung.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Devang Tailor <dev.tailor@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 faraz.ata@samsung.com
In-Reply-To: <20250108055012.1938530-1-dev.tailor@samsung.com>
References: <CGME20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344@epcas5p3.samsung.com>
 <20250108055012.1938530-1-dev.tailor@samsung.com>
Subject: Re: [PATCH v2] arm64: dts: add cpu cache information to
 ExynosAuto-v920
Message-Id: <173978860144.144850.3570517854379450471.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 11:36:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_023646_014369_75B9D411 
X-CRM114-Status: UNSURE (   7.96  )
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


On Wed, 08 Jan 2025 11:20:12 +0530, Devang Tailor wrote:
> Add CPU caches information to its dt nodes so that the same is
> available to userspace via sysfs. This SoC has 64/64 KB I/D cache and
> 256KB of L2 cache for each core, 2 MB of shared L3 cache for each quad
> cpu cluster and 1 MB of shared L3 cache for the dual cpu cluster.
> 
> 

Applied, thanks!

[1/1] arm64: dts: add cpu cache information to ExynosAuto-v920
      https://git.kernel.org/krzk/linux/c/bbfc70ca7fd26ee3e7eb16872cf7b1f1be5907e3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


