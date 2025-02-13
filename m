Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF6FC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUlydEpuFrGUrydFPT1DYlM8hxRj3C3viQCBSEEaXH0=; b=4fFQ4sOH8xIsd1pyFbgny/pMSq
	yUU0uWcxoaahDok/CJT9yEQlu/xcbn0exTjoSlAvx81vrzDQLz3V/21nKZXbfyEMaHeQs0Bsp7xcu
	IXyTigeH4dMPuP4CBgPavokU0Kaq3c1Nw8exX9LHOs9gtM7a1JI+Xu6CRV5JBXNcpJhcMwkOe5SQ5
	lqsJjfZ+mdC3B3bZhuGYg23G+T7nyVeJYpFBPClQrI0wzTVF6rB9P9NOp2Zh1JjMGRrp5q5ScdHC3
	yA3AomlTmB0T8HtlAoqnCfy4XN57d2wR5miaEDsuMEO8PqcU6WU3j97cDpmmuwQlyVoab1t3bcOdn
	J5o/SALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTYi-0000000A4mG-2cV9;
	Thu, 13 Feb 2025 07:22:52 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTWM-0000000A4Qm-0V9n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:20:27 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso3444760a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 23:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739431224; x=1740036024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUlydEpuFrGUrydFPT1DYlM8hxRj3C3viQCBSEEaXH0=;
        b=yXNzi/T/7NEgdXj3c8cOcM/IKfhyvN83tnvKLuNTQWxkBslH8IIMbqOCKo8e9hvYoh
         bMzDHUEqwvEYRT7DrNb65jB363dL2on0eYNcxRzJIqcFeYiFDfxXK9aaf4IIlSV5PZS+
         m8Lmp4QBRCZttEhQylJQoUNRFae02iNaP75piV8xwiB0/7WTo6WzEgg/3abEIekNhnb3
         I3t5mzlkrEzX5nz3LrEVSst0MgPE/wwAGR+mqLQdY/Up4LjCrcd6dxe9+ir8Le6Bca9P
         aCqLHZebQtCB6dn2Pl6sSZiIXvP2+bGn+i3YEkB20ARH/859OHPy/FxfuYBuYjY4l+vp
         Y7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739431224; x=1740036024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUlydEpuFrGUrydFPT1DYlM8hxRj3C3viQCBSEEaXH0=;
        b=Vmivd25vBBJyDu5szqSiXpoAzSp/r+28vTSAH1tYe59T8Ah+V9m6f2kxYJPM/PwLAK
         2ElUCe1A0OxIKCI76hBcYjIFkrPTYyGoZTRZ7miZ2HocLmnJuDchGZGTmglNidXB4Av5
         0A2XHnlXnlvZQ8UbN0dryFfcaonvZqCd+kBQ2Jef8oT4iS47p+Jl+lOtLptQo3PeHHZ9
         ETNimZXsj8UppYclourKZm35sE8H6NyKMcZplir3GI4eZuSYAlDWeYnJDy5DIu0sAK92
         tFzJnbkQxbPZcX9BqKR95hPmELtH0hA5d7VeiNBkXBY4szL7lKJeEgQdGE35twplPj4Z
         LotQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1RLi0ujIKhRuvqPa5/ixCZ0GSvzevyhOCt8oORGpEUFGucGDAzYdas+Dvil0TUZNH9kOE5+rfurgrMI4VRNcO@lists.infradead.org
X-Gm-Message-State: AOJu0YyRFEG4K+zGitNfrIbDZnOVRoKexo+WZkfdc8C+AYBCWdu2HQ6n
	MCmv9yKbgJpHuLvP3cgsEHOu0kxShxqbIbFuY9ayIXYfCUnnx2M2TNut+QJoJAk=
X-Gm-Gg: ASbGncvTFG4o78i8nDJGyZL9DcEjz2FipaDUlbUdyPqBADtodtkYReGKRavo0smXAKQ
	9dbM0lvlm1EvUOKSNk0QnPvNjTBilUrYkkXhMKnzoxO0lbZ/txM2ezIO2gsI0dyjnD/6c7Pb8sg
	siyzzHGaLId2fnmtgSCn0sXdb7LFoQOzA4gfCZb7R0P3wtoXAyH8DgqNcgroSxw1Sb7P4tBnbmd
	qbsumGebne3ZnLL/pYDBmUXY5CA+boXts53H9Z0E0j7UMHjmobNKglXQvLNG/aYJRxBBiedZJ3D
	mD0QsHpZPcCw7nKWbKfO/f+7
X-Google-Smtp-Source: AGHT+IGhPxIg59b6w0WCU7iMGOfAb73XGY1LMG+4SX9yxgvaUCg2qqNEqVjigzMYlqAJgEcHDBCS0w==
X-Received: by 2002:a05:6402:458c:b0:5dc:abe4:9d8d with SMTP id 4fb4d7f45d1cf-5decba62fcdmr1363256a12.9.1739431224388;
        Wed, 12 Feb 2025 23:20:24 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c4687sm674664a12.22.2025.02.12.23.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 23:20:23 -0800 (PST)
Message-ID: <fc341dbf-3add-4728-9ec5-7291ad3bcbe9@linaro.org>
Date: Thu, 13 Feb 2025 07:20:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: serial: samsung: add Exynos990
 compatible
To: Denzeel Oliva <wachiturroxd150@gmail.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, semen.protsenko@linaro.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-3-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250212234034.284-3-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_232026_245780_E98BB760 
X-CRM114-Status: UNSURE (   6.13  )
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



On 2/12/25 11:40 PM, Denzeel Oliva wrote:
> Add samsung,exynos990-uart compatible. It falls back to
> samsung,exynos8895-uart since FIFO size is defined in DT.

doesn't the 32 bit register restriction apply to uart as it applies to
SPI? If so, you shall probably fallback to gs101.

