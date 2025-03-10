Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A96CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAI8ciAGS5zB0DvlZGls9s/FLbP/T+sobHPu1PwltT0=; b=bcPf3ikiUAX4OA2eTQVn5D/imv
	QKuMF8IvbZEMZDrUosC0q0hf1mmQ1tSzhFxxyVJoWFmUKOFOx/m6Cgs45FQ531zAuyQUWRDR5NXIK
	ih/v3WMBkGLplvfPVVOd0sVFeUP8ElPTU8i9bifyzCcHOWvj88DB271tNQbK3KNEEU9mGXFWc54tK
	IcXTBI9nut3WQSawrR93sGNiECUilFrF2IsYbTkCrQXwIfCsAuADrCWAA02kaL6cqh4GuoSmbgpx9
	AkAtat6aBujac4cChyxmn518dwTdAHZOtzjksRKDYFfoxB1d/btrt+gn82UFsLnXjLMjdB7D27yJ+
	LZbRHvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trk52-00000003vEq-2g2J;
	Mon, 10 Mar 2025 20:50:32 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trhf2-00000003aTa-1XTo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 18:15:34 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2bd2218ba4fso1376211fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741630530; x=1742235330; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAI8ciAGS5zB0DvlZGls9s/FLbP/T+sobHPu1PwltT0=;
        b=FUa6ESVOSxkU6rBApx85Qdiz1esC+fC932aRAQmq+j/66xquHg75XmuWPVprh4imWF
         iwMtVf7qh4Ki3xtHZ4EOKLXWXYmQTYoyQ9PUcdS+OOoQxZYRZny9GltchhDMhDwqjIMX
         c/+hSPLEZKix6mZBUJfetuVE17kMpFjqOuqerfxc5IP4xQeWNRSKEVqaypsL/2j6UMIH
         SW+QuaY8c+xVDO+5H69GoDvm6CZ/OEO6cWkF15VGZy8+NFsNKrjb0exKKdRoPDXhIqbl
         nl3bKBBuJ4V2oA7kajTM4QarRLRzMQKYec8Rj+ALYE0JBGTvu+Zik7o5s//+Jhn9+oaP
         QaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741630530; x=1742235330;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kAI8ciAGS5zB0DvlZGls9s/FLbP/T+sobHPu1PwltT0=;
        b=wlI/1Vdt0ZlsSVN9T1/lY1tE49A+ablWVoe99MsqGjM+g6FHkCxm7fbRNckT690yO/
         OaEprbEWpdoB2yHsj0afaRP0IhxALWsbY+rpN1FJULnd6S8VMnWt1eYJB0pzF0H6bfLZ
         iKUs26T586N8jMLomBWhjbFR+IKTTiskhx13dqvj20zI2N5vj59UrYdY8BYalP/XUz4a
         Ri+c6Zoano+nWTx+oDs6IiJJY7M8Q5ZJjAi+Swrv0FqPO/NAWnHTVMB/5tP7Liy4U870
         oKk8VRR2wfyGJS0L0+uhHs1CJtzPGE7BMTwmdzGK6vTkiDTn3cQqAAcbFFaoV5M30X8L
         dvrw==
X-Forwarded-Encrypted: i=1; AJvYcCWm72P0SQsXT5XquzxtSoM904JUIGZXOSAs1rQ/Rt/q8zgDgzrnAxHftilez5a1IEzfA470zZgZFvqlhb5+fyd9@lists.infradead.org
X-Gm-Message-State: AOJu0YwPgWNmWYbZRTy3TJXODiFgSzggTE68Zhv3glB4y/m5OTw/9fhO
	sIa++rx3Rt17KByFppzNAq86CFqbyHxM/IrD9wwhLBTEKPBE8M7kSaLr9ke+Tmw=
X-Gm-Gg: ASbGnctwF+J4tBje+HM8X/3cY1sUw8Ql3H8YbodlJ4DcVG+BIixfuR45clVe1qmQSZX
	KiS15DZ9eAVfmzCUbb4nt0wF6jTaC8PWpitgQ3MYBEsRDOxgEiSuHLP6ZXw7x0RnhJIsF7oBAxd
	EQiybsacVfdMYrj4qykzxJ3M6Coyrp3B5U6s7wGRi5uHXNo1Tjaoptu+TQgfJDdJLZ08m3VD26O
	MxHTfFpbBZLc3ruLUzBPV1PmpwY2XMiuPLt8iodOPck+ODoIPsZ1lyrScUmKdADmHj6/9OCIrkR
	m8P6E23eKoTYekXUSz9FQIZsR+n3OWpJVWfovy4pMcIANYOlzjOGjluGHeNj2B9ZMCdJTF2O0ft
	WtUNoFg==
X-Google-Smtp-Source: AGHT+IFhWOlrUQlGauNsiAPR7fPPcoFbbBV+CDBh9F1smUyDI9GdLswjsb6iYSCOJNi0ClTHTURvww==
X-Received: by 2002:a05:6870:9110:b0:2c2:b9cc:afb8 with SMTP id 586e51a60fabf-2c2e8699e64mr372641fac.7.1741630530098;
        Mon, 10 Mar 2025 11:15:30 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c248d56112sm2276239fac.31.2025.03.10.11.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 11:15:29 -0700 (PDT)
Message-ID: <cf5b14f4-ac10-49a1-9f02-32cdcf62839e@baylibre.com>
Date: Mon, 10 Mar 2025 13:15:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] counter: Introduce the compare component
To: William Breathitt Gray <wbg@kernel.org>, csokas.bence@prolan.hu,
 Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250306-introduce-compare-component-v1-0-93993b3dca9c@kernel.org>
 <20250306-introduce-compare-component-v1-1-93993b3dca9c@kernel.org>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250306-introduce-compare-component-v1-1-93993b3dca9c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_111532_416581_ABC53E2B 
X-CRM114-Status: UNSURE (   6.51  )
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

On 3/6/25 1:05 AM, William Breathitt Gray wrote:

...

> @@ -301,6 +309,7 @@ Description:
>  
>  What:		/sys/bus/counter/devices/counterX/cascade_counts_enable_component_id
>  What:		/sys/bus/counter/devices/counterX/external_input_phase_clock_select_component_id
> +What:		/sys/bus/counter/devices/counterX/countY/compare_component_id

Prefer alphabetical order?

>  What:		/sys/bus/counter/devices/counterX/countY/capture_component_id
>  What:		/sys/bus/counter/devices/counterX/countY/ceiling_component_id
>  What:		/sys/bus/counter/devices/counterX/countY/floor_component_id

