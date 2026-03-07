Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F0BF513ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuAHly0ED4Nxo1iGo0eqHkUi7nPY8vgZtVUsYNCIxXU=; b=uj8wIg87pKJBP/6dyO2mGsM1EU
	eBsaPxKpYNC3fUFRJjPzMStJbCBzqyTuGWIIxGjA/OKjtG0OrlNCqtzxm4xSuBxZmUsqaZCIKRSIP
	dmJ0PVA7MQwVjoZ3iTdbXHFRCiIh/0atbziUPHhL1LWwuX7aSKs8sJijcXeol/ieC+won/nHbpvl/
	2pm19HjQlzHb0VqCPjEfYn7tcwb0shTB/lioEMYp0X+Zb8gzPoT6Vu48krqEU+YA4E/fCzyCyORLb
	FDHdLkRWJyN/KaHfr9yC7un6b0K/wn05PteL1CPKbAHPPj8dyf1Sb7730h46oO0slSBp9ib5wJ29S
	yey2F6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysgK-00000005GKo-1ZvD;
	Sat, 07 Mar 2026 14:31:04 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysgD-00000005GK1-0PXe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 14:31:02 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-50697d6a69cso51974041cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 06:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772893856; x=1773498656; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZuAHly0ED4Nxo1iGo0eqHkUi7nPY8vgZtVUsYNCIxXU=;
        b=GJv0vmC97OTJECl+7u3KfGRyOAcmjFfb5hjZZm6ytQRE0aIgN9vqcu7oZmdiHpF55t
         bHVdCGLboECcFLjat4B//PXSdaIkuKcgsLRA6Jo1XgLrqlk3mcjKSatNuR8ID7+cHV+M
         HvJmaSliOdBT65Xq7KLP+jDMI8s42mRWLrIL0nv4zWX898WaCHvrEjWWwhJLPhlKwouC
         dGaZSOP81dIG1jXvmyprTr4phYjknBcgMorDOJ93+f8Dr70hAu20EAtxK7fmNTAkBtJP
         Bqqle3jhtyNdkXeWj03tt94pWXCwq8Yc9RD2pIYKeP8AbdDGoqe4Bt6qbPcVKrYaWsc6
         d5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772893856; x=1773498656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuAHly0ED4Nxo1iGo0eqHkUi7nPY8vgZtVUsYNCIxXU=;
        b=O7w24Q1+oUcEa4eP7/lsyvEOugTdDHxsP8UB5WjsAFvqOyYlQbnn15B7SG/HUvojcn
         kBqE4/Oxuuj6qQxXVe8nPRltj1Te+IcjsIwmpwGfOj+GWXTXUaFYRyvv3lEMEsj3UIaS
         eDnScOvw0ZBkof28q58pvldtmiXg0GYeH6Sva/UeVSkRKlT+wFER00uZRyrA3RrgzBEE
         9idkgU0GP3CwB19pK3omgOpKgNw2OpNOT4vWF57PJ+4WRjKmX1U3/zpQFywkWMefOAe3
         bnHshtOzDZzv3pR3qQnD50AMDGK+KrTFZW5+CJPUgQvcGbooCky7ZsJh+kPd1EXhTp8y
         nhUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpJdCWbUJpeb4DY26wAzcUMq7uF7we4Y6WtFLcvjb2bzuDA90wYcvRyoOg6ZdJn4AMIcNW2pbTaG5UjTBfYogr@lists.infradead.org
X-Gm-Message-State: AOJu0YztsS3yU39KrT0J5wRO6rEB8MxDsNVZ9o8O3VWad0Sm1sFI4G+B
	GLXmXWsJDYtpSAm5Op9Oyt6JPVMB0PPKu6sK/u93pH0BE6fz6jAGk1RuigOMfLNwbTU=
X-Gm-Gg: ATEYQzwCsJJoxqjzR8I6ZGq+kKBOIv4WAI0+3Af0eMZbuI7Twna33UhX1e3MgIVnK7N
	fJQEY84NczmxYnyGdeS6HtZnbcQQ7A7Qr17xOXN8HsRsAJyoE98bgMm7iCdLaE28oomy0zrR3d3
	3it4Hpq1htTy3Qwrv7t36PRHLyKGi3+vDHZbKxN5Hahg4tflSfVVN2lLSJJhIa3RX3ghhEWfT8Y
	EAHR74pPLCOI2Bg0ySN4EqXZyW+0liiBwasBMXpaxVKLv0ZAbCge50Eg8OO7mbOaBx3om5Du2oQ
	UsTIFBW6vaAUFwM191tMk0IYRoz1Ti/Y8zzMt84o8/3OjVDLcLmDfh4zg9Idhl8L8N1JUcmIYM/
	8DYA1my3EAl9NJVneoNfgeihTmDpV5gl4XHC8Kt3am6RP4cSo18Y9R4SFgbWOtB1kY8JZBbxWsX
	W/k23/JuQbawahdD2DGNyhcO0Tc8C4TQ==
X-Received: by 2002:a05:622a:15d4:b0:4fc:8ed0:d4a4 with SMTP id d75a77b69052e-508f4979a66mr69234281cf.64.1772893855568;
        Sat, 07 Mar 2026 06:30:55 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-508fd904d51sm21915021cf.4.2026.03.07.06.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 06:30:55 -0800 (PST)
Message-ID: <13a56dce-00ed-439a-ab6f-178a5205bb37@tuxon.dev>
Date: Sat, 7 Mar 2026 16:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] dt-bindings: arm: atmel,at91sam9260-pit: convert
 to DT schema
To: Akhila YS <akhilayalmati@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
 <20260227-arm-microchip-v4-2-7e2ae1c5b5d6@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227-arm-microchip-v4-2-7e2ae1c5b5d6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_063057_392711_2FA33929 
X-CRM114-Status: UNSURE (   6.02  )
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



On 2/27/26 17:14, Akhila YS wrote:
> Convert Atmel Periodic interval timer (PIT) binding to YAML format.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

