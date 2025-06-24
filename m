Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65808C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEQZoH4hrkexTS/DVmXNzUg1vEOwlPVaJJs9/52SXD8=; b=nSykVQ/i2NXNdGGD7680FcJjdV
	96t5k6Cc+CdFigwWCSIdphkdEgujQbiEAPgXQp8idBGc6nfNZFFTKph0CN3SqxxUGp49/+jwf4tCi
	PltolfoXuzOvv/QT8CHRmnfIpIUpybwXGwTWJV4qZ9uE7f3E/QGbIZ3QMLnctLwWfsspndfaaxAeY
	IJ+rtG53kPa6Akh6pfIL0PwGg50RtGcCcw7LvFwyV/lRuOUZ6zFAfsmyHt2b/afz8Psgyjgui6uVF
	ZitIBmbZLuyMUoxvji/SC6yBnvFChiSaeApTMo/8ESBSHakL0pi4epVPNlJ20K0OSnEWLo9IyDMjt
	CvBm1WmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy2E-00000004rRJ-2wKl;
	Tue, 24 Jun 2025 07:25:38 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxsk-00000004qai-3IDi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:15:51 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so10749772a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750749349; x=1751354149; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEQZoH4hrkexTS/DVmXNzUg1vEOwlPVaJJs9/52SXD8=;
        b=rXjN87+PB4zmJdAGfOA1nPEW5uRvPADSQUP8wYTCna4R4JlEyYkhohezRa628YOSTi
         IYkMUaOE8Dq0o8eRAtvx7kSGrXO22m/ebV5Stfa86oPEngDmyUPJJcpK93ajrh/3R2EG
         uoqT5xuJBblksHEOLV6PmqHKnIVaNKVSkmDKNVIFTfua10qQQe1Cp9LPLa4R7leUtHif
         fGUHoCdDf1JbHp9HwniyCL6KkoafkD4q9l9ebLf397jEu28cDVa0apijFa0U2qP1h4Kv
         nUlSu4cUNj4SHuo1X0ZfFv9HuSmH1j5DoJS6QkK/vmDqXMxnh2sMVeCc9f8e8MxWCLsx
         /1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749349; x=1751354149;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEQZoH4hrkexTS/DVmXNzUg1vEOwlPVaJJs9/52SXD8=;
        b=QuQpzLOUtYbjSIo+4EOMSk1du4so+n8wvx3kxXres7IEyDz9g78qfYbF7K25L7xCu+
         Pn1jSvPAKhq5aHlXff5P78rfIRbzEG3LocJzTpmsYEmobiXg0/waiWqGw8Qcb9n95opE
         ujDhQMPSMjfjQk8PNpnLFPFv7uhdbR6SYmLOOZ1s/6GpB0gnHdy7m0ARVfl3CGXA9/N6
         8CHyqIleS/P2ligzNc4kb1F7oDf9I0s5P5Ev41v92VX5eZNrUCOz7SfXa737aS43eHHA
         YKLHUaEzxNA3atPb4yYxqdEhG92kSzW2jaXFUcRd2GRjnuS335xC4F9jvflknUoxWAzI
         cCBg==
X-Forwarded-Encrypted: i=1; AJvYcCUSqTckJBVZVh5lFDg8se3KelSWOJmMg2wVg9n3vie2o0P5F0vmwcVwc5UN/4mFO6YDdxbvcYtQMpHzj2fuwS91@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1O6vi5MZUNmWW0SFYZqqtxHhPL/AY52Bd+TJOcN4avjyCXlUO
	cynRuCEjftUB8XzdxmnXr359vf1MewCjw8caSAwi/JKlF+tuJmxBQ0XVmTdpUplP8TY=
X-Gm-Gg: ASbGncvvPScqhySqqUfLKCUr3Zqxpo+YtwPHwmlRVMKXwDO3+O+oG8i91h+mWWOK9ox
	eB5l0bFVPFgiqp8apFC5QtlxbhkJBl+FDa90bJZzLt/YvVxjD508tLsI6obxCAcK2Ryk3hAhaRZ
	a+FOPDCaAwW+NOW8Ahil+N1QUCjYWPU9f+D/MXmikBo7kQRBChBBY9gdW5ZHSjTgbyUGca2VLlk
	eekzCb4cG5SZoyIfI6Ubp5AIkHZEnJo2cuJF4CjDMCTKTSXPOiTkfD7vUYUtDxQBqMmkg4BOEpg
	3sMY6u9YuV91srbW3K/zf+SVBTAGaHtXsl0PxshCEFvYX4eP9gmtscto9gA3r9hJMExPeXM=
X-Google-Smtp-Source: AGHT+IGOvM+PW0iWDdlohtn2Rgc0AiMqqp3sbNstZNYo4HDuLqYgNyYYm6sUppGh8IGUq60tsNcbqQ==
X-Received: by 2002:a05:6402:3594:b0:607:ec09:d462 with SMTP id 4fb4d7f45d1cf-60a1cca909cmr14674524a12.7.1750749349101;
        Tue, 24 Jun 2025 00:15:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196fa7sm588684a12.2.2025.06.24.00.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:15:48 -0700 (PDT)
Message-ID: <aec7438b-f5c0-4fec-adc2-5d763b1ef366@tuxon.dev>
Date: Tue, 24 Jun 2025 10:15:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: gardena-smart-gateway: Fix power LED
To: Ezra Buehler <ezra@easyb.ch>, linux-arm-kernel@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>
References: <20250612074737.311346-1-ezra@easyb.ch>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250612074737.311346-1-ezra@easyb.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_001550_834032_9832F7D3 
X-CRM114-Status: GOOD (  10.09  )
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



On 12.06.2025 10:47, Ezra Buehler wrote:
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> When starting up, the GARDENA smart Gateway's power LED should be
> flashing green. It is unclear why this has not been done earlier.
> 
> The LED frequency cannot be configured in the devicetree. Luckily, the
> default is 1 Hz, which is what we want.
> 
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Applied to at91-dt, thanks!

