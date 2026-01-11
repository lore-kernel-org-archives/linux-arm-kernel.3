Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC66CD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=998LIQD26tTlqKe1Nt9hPTV8z5SAR5Xb1tsWRfDj7yM=; b=hFi39otgNyQHjMOG7nO+beSO0o
	UBg/jACnANAJoUhjLgIBh1wz7QR5MGGFvnKpD9DrxoNe7xY7i2B95BvxA60VnHIlBTwTcJL94LKkV
	jbMPSx4c4VpePoQQGDLuHey8g/up/ChqateK6IONERo5IZ+ROWv2djB9GMdjxZGa8TkiNs6wImpE1
	/r2N/KghW+DkT+nwH9hkroF6CzJnpSV2Gzqy3giL5tIbbZThcgbSTH293/QS1sTEKoF/wPiIpt5Zw
	LcY4OHh5r5hhcodaL/yGlntvH3hAe/Jj0YkuwHRnit83YWPgC8dIsqb+TVen4BJj0dP7jBel76xrA
	DeA/T6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewiM-00000004J3V-38Ok;
	Sun, 11 Jan 2026 14:46:46 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewiI-00000004J25-2Kji
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:46:44 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so9306495a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142800; x=1768747600; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=998LIQD26tTlqKe1Nt9hPTV8z5SAR5Xb1tsWRfDj7yM=;
        b=D9lRFcH4pwEC9xEyCNfFXmUtOWGidMQu7nQO/FkKbAQMah6VAfh9W2NQJTLfMoE6EV
         8ixKhNSiDMGIowd9mKEjoMGk2ADwyFT+CElaHlOgZaTXOvAI84j9ObSzYhn8bOu5midB
         M2YAW0cDmdETMV4B+uRWOD99cFX1Fw3Ny7BxNdjxKIh5c1/7h5+Aemy7WYtMzB/9wnxT
         i/hli0WdQ3GhykbLZbgmKISs/mK/UduZOoj5EJ3iyn7Y0uHPogl+QJ2wG6+P93qSzOWg
         dp6/scg46TeilEpHTToShvioXRRVnEw8Hfr6VcApFtMY211/5Xq+3f27629qUE2bBPd+
         FdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142800; x=1768747600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=998LIQD26tTlqKe1Nt9hPTV8z5SAR5Xb1tsWRfDj7yM=;
        b=fIVnsxWx/PvCZxZuFLXgjQ+XI5pB057AYsYxZs04L6bTOOwIYAndOnKoDnpRps4gjp
         ox1S8Y7tXnpV/VNkzR2xgP5Jxh7Kwsa3YhGUAds1wfvVQqVwO3FCyo4AA+JbA2rhYnzT
         VyV3VGIMlebXM163qsgR/jfUWYPPqZkkOGuC1EvAG0Ny2At8vM1GE7e3WSFvwytyu8sA
         e0SvES8EgFVP2IiBv4h/xcNwoxp1sdl23YaSVkoLr37s8Uh4JxZ/LLSWIewVeTp/o+Cd
         gV7TXDWdXR7S4LMg0527Ccq6F/jffPk++gm5HZPrnYOcKCFKRyB2c7H44jQJ2ABibnK8
         yIsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0tlUEiCNgUgwnt5Bc383h8M4YlAMssdpXFARBtr5RmMIr9umr93bizXFIUPUs9oDzes7ksF9EmuPXSc/Md5YT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw28iRJAN5oJyUeKNJGfFyAxWRxqm6XBQvQaljd5MADRFkrxHAX
	TJTrvN/z7/0EjjFyihPpK2TZrah1pMDFsVH89EGZyhRgrIopJuZyVwIl90MBseczIYg=
X-Gm-Gg: AY/fxX4bZ+Rz5MVFcC3RGeVYulwX7lcPELQFFQlta645f7vEikOJ1mA29/IVXLe2hMn
	tIHP9LACigC1D9ch5GwlRMF//Xy0dNgJ/RLTqvks0RQyiweZQfOX8UKO+N57ReRuTFI5gRkAIYO
	P4h0y+T898tyndsONXRb9HEA811bu55RUoJFROgrXiXX9G8hNj+26Ayp9Ptv0qrhX94DxXaINro
	oG1W3CECuHlrenvSUY6yxp4rAPXhj8lo2Pz6ppKLx+5uLhgzb8dllHpLUUp7dzojFca9GUe20rG
	YTCatn50//ryoPU4T4ehqpgnM6CkUw39L51pyiMJ/sC5DelJutVe/kU/Q/7u2lNg4EXI4dRyJqQ
	jGzDPyiQtJJYbnIVjeLOxfqVJpdUPGjfGh4oosbxm6Rgp3C+CWR5tFVomPfkkveuDnQg/DaMlpd
	ItcXpTk/pc1vb/6gI0F6XDQpA=
X-Google-Smtp-Source: AGHT+IEEnxtsLJjgQBqtCtTKdKKJ7nKe93tErDCONdjzSpalyD4Cf1jf8cogFFk+Jwao/l06OHgHEQ==
X-Received: by 2002:a05:6402:26cc:b0:64d:498b:aeff with SMTP id 4fb4d7f45d1cf-65097e8e49bmr13880469a12.34.1768142800347;
        Sun, 11 Jan 2026 06:46:40 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d4acsm15318996a12.30.2026.01.11.06.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:46:39 -0800 (PST)
Message-ID: <0ca4477e-cfd8-439f-946f-9d0205b62c6a@tuxon.dev>
Date: Sun, 11 Jan 2026 16:46:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] dt-bindings: arm: AT91: document EV23X71A board
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-15-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-15-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_064643_014509_986B3EBC 
X-CRM114-Status: UNSURE (   5.43  )
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



On 12/29/25 20:37, Robert Marko wrote:
> Microchip EV23X71A board is an LAN9696 based evaluation board.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

