Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3022D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfDtjbPnZQpFER+nbClQWcn44IBaDvTgM6H9iNz+Pz0=; b=SeRgTjDn97mFWdN4Tmi4zAvGIK
	DnMudnQVVl7IxoIgp2S6beFivzajIy6wACweYU6ZQgdCUe7PWWp2vPLxVJIsnZ0QTMEAtg8OWH/kx
	WAWa5R1qDdM8ATc+Uy8SHdGMWpECuJ33jQQfZqQ4w2gQZRy12bxMVSMikXkW1s4m3jD0TOKPSdlA6
	i25daO087qrNSXHEUux6t7Gq0/hYfl7EmgHOEZLPXcEQ4dIZIII6G+OKArNc3Sj1O47HgC4otmXZV
	OIxy1Vhg8FjaKCGvhTht7P+KvywOROVK8N/dOcgSFhwTB1C9pzy/Hy6NG/6/M7ldabraL6UdXJT8u
	j6nWLZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewhO-00000004InX-1yub;
	Sun, 11 Jan 2026 14:45:46 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewhL-00000004ImL-1hGn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:45:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso8879917a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142741; x=1768747541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfDtjbPnZQpFER+nbClQWcn44IBaDvTgM6H9iNz+Pz0=;
        b=PpdVhPWCP6+ZXVEtJP0G0C/YZ02g2HbWcm7J2g+WtLC+cf0HQlsqDdykHDp0OVkbWY
         8M/vulc3cqsdTtw4LsymCFEu6xxHZ/r4m6eUtNXhGX74G5Eu6YV3Bq+NTp0zwzj8IdOb
         LGy7gvhtOMPehaKRyX9lxyhLwdXs7mTfH3mpcITLLh6ZCNDOYPxho1Qhc0buZU7utmnq
         33COgRLFt574uONbYyMRb7L//3alKrPHFjLL/IYqjUq1v92t6joadbwYBrPKjtVBrRFC
         qcLsxw+N+bVNKQBovBD2e8ePqDsh7bPWp9qwT9VgBkK3uCP1Th+KlXOLzKMvdSxZMN5o
         lnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142741; x=1768747541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfDtjbPnZQpFER+nbClQWcn44IBaDvTgM6H9iNz+Pz0=;
        b=bnTcYgbGfmqkQtvCF8a3Ucrv0XmfHZJj8XYUI+zT+g2Fuq4aYdfunKCaZ1vP14uSSa
         aWMppIwkvp1RRh7rPt8UV4ygffuXhUzlh+h6DhOyJe8XbCirJSGjYevZS8ZpJVNSIi8q
         uxfgC1RyIUmrPBOt3RWb6xPOJPh4QLqJCHNTR8aRAKCyPugNgjPTRG7r6Ba3RctrM7d7
         9LQmaSKFDzCwfp3e0a/JhqKe6/jZo/smrh3FFIiyA/+a2487ayY8nrAXAdUFtjdEMWbD
         CH6ITIwbsTeiQNc3g8TRuAf0XqeaAQyhGAtTEKlQhZdtVrwGrtzPQ0y/ht26MwKm6cvm
         HlVg==
X-Forwarded-Encrypted: i=1; AJvYcCVuC5yPcEI8r3j2ymRMmfQgp5EeJH4YOiUm1rU2MSQfuYuJ/laxFIYmjliDLn9MAbYnOCxLKcaX8bhMmJf9MN3i@lists.infradead.org
X-Gm-Message-State: AOJu0Yxauc1JsIFFN5Fc43tCQsYtGoXuI3Nyo45644K+Olf36jKHAPb0
	Up0k6KXmEHHUBKc8KC90m70Fx4QnjSW6S531rClCHHvEdwQiNUxJP1WVxY5KULVO2kQ=
X-Gm-Gg: AY/fxX56+SOJw9VdZG+u5qRCZMH+ViGIMqPv9agpXzi9bT4kbBBXcIsYt3pHfaJbNZk
	H/mw1NLIo3B0NHm/IWlLjFgy8MslMtn6TQv6EOHeJ1dBOtcMHsXcfIwbyITDsFgZqUdGa08oIQD
	1n8WFYfEN/0tLCSEhTtcZVe2RCr2QO62qtmtWxAQ84hvUust8d141ZfIV+/xGALqW78pRZFSDQ6
	QlwS1vi7zFSEHA4UWAGfQL4Joodvm/D3aYyivFw3NecYpy+Dqq/hRZVmkEFXup5XbPqJj4QNACo
	UysvPIUpCTO2VXv60x8TrMrCz6PqppRDoLX/Sw9bWotlabzOfvcwHimWzlWgwnJSBlMK+e8Lp4O
	NXuJn/8VnzPAyn7DIj7+zQ9rm0UFi/uF3VakVa3RBONBFoo+ZE7/UlDABUo6j5ltDAVzaegMHaK
	9CQx6EBgoh9C9SUz0uCAxsgOs=
X-Google-Smtp-Source: AGHT+IGzzRSG9JPiSsYLBto386guzGNBLdjrzZm8+JQDEKUQ0tWs5J3FidjE880cd/bBYxLZJrvW2A==
X-Received: by 2002:a17:907:9455:b0:b3b:5fe6:577a with SMTP id a640c23a62f3a-b8445169517mr1585237766b.8.1768142741298;
        Sun, 11 Jan 2026 06:45:41 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm260020066b.16.2026.01.11.06.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:40 -0800 (PST)
Message-ID: <555883af-66da-43a0-a4d6-bd3bc52581b6@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] dt-bindings: net: mscc-miim: add
 microchip,lan9691-miim
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
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-11-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-11-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_064543_453857_8E9AE7E8 
X-CRM114-Status: UNSURE (   5.06  )
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
> Document Microchip LAN969x MIIM compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

