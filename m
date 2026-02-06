Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69632EB28D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 07:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0haU+G8kaq0CKeXvOdlPG1qWpXklEM3L/X+ta2ZlzJo=; b=cbNJZf1RD9QhgGk7JwLmFtqNvd
	R/WgGbtuF+DoMuMQvTHMIi3D1h20pENrqCNLjHcXNI+8cT/5FHrIWqz1ZH9U10FlM54FuBhZNUDmg
	inZRzWA7yU9+D8dSN9hqbv0OMN/ZjAizAHrz2YmNH2zQM2T32fXtaFWag3HqsSHzgNrKaU0SIf25l
	FlATWLZjm6OZwFXlbSvgao6JIuy37CWj66S/xMLJZwYqvWUutKO9TIO4/sB+n9+tIMC9QBXqAgvUF
	10EY7HNd+9AfUrMBY2jik+O66mjvAAneVWeiJAi9R72iwOc7jMuG11469Xd7cxDhdytVUbvvPFYB0
	3H6wOTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voFuJ-0000000Axqv-1tcC;
	Fri, 06 Feb 2026 07:05:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voFuG-0000000AxqW-2fD8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 07:05:33 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a7bceb6cd0so12657365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 23:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770361531; x=1770966331; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0haU+G8kaq0CKeXvOdlPG1qWpXklEM3L/X+ta2ZlzJo=;
        b=lQUiRAdwnlqa2HRemkHyNvvA0tinz0KQioxpX5fjc6LL7QtU/JPrXuYbvt80RDkCiP
         8XAz31fCrZ6Tx+4QO6z8xlFYSP97W9ct5hgkfVg5chA793xEgG5qnoXHwsdxkXOarucd
         bTh+sNVcG+xS6xrmj0U+tMwGfi6SNQZl0Z2bvNFltA2eK6w4yveBmHDfzgQQ+Aa/yOQO
         iXQuVFEBSoIb5dzgxnXCZwkiAcxF9jp30eR8xk1SkQEgu1v5yNq+3FP9jpF8UcD6mq57
         fBEfUkC6MTZupiu+oSG6kOY/b4PPsyIo3zGl+G+nAaaIvv/wZVgj9Ekn2gCRXwIkpCbj
         fuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770361531; x=1770966331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0haU+G8kaq0CKeXvOdlPG1qWpXklEM3L/X+ta2ZlzJo=;
        b=JW0UqNhViax5T3IgCDtfGaTeg4rTsBRdNYwhcRcahy4Vi3XAMSitCQX01UOLAJqfeG
         yJXdfH6vBG1xckMyoANGLrLCjvrHryWbprXklFS0J3imCNAq7svt1bhhYnF+t0qo8sd4
         Y74t9o3ZHfZxkCKsuhr3LeS9RGOQ/nytH7MO5Xqy5qjb4RTgGOX5DYllnG2dy4d12hM5
         qsUaV5QrA38Q5VsSvI8whx50tj/NAASn2Sgsoo6Dy1/Da0/0a0tqOKoKlk6Z5/kMsFHd
         8qYe+TCTYXwqMMjbw/FtsegV5OG+uHjSy2ZIy5XgOmooIGLX5I+rjCGfC0oSFrYJkGR/
         XA7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1xbz602+3Q7RwkjMG7uss2ibNz5cSjFfh/AAwwRllCIuiPbL5TlZ4qAX2oPfnOzi2p1twueTWzqrraxwdWw0O@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1nWA+XGz70axu7kWlntCMZAnQGYrBOeti5vh7wag8IF3j5j+9
	kA/UlZbPDj/dvCd1Skk/AzcHCn5RGQl6iPfMkN8a9KtJIwKCfCBTpHCZ
X-Gm-Gg: AZuq6aIUvuUiYxKg1ZhY+yCHqTlfGkBoIyNQINm91WrTIZM31R6qR/XpdwriapT9Z6E
	eVWRmloj0PfZ9IH1qyNliImNhW4E4iAi804TS1vbCd1+A31QEPDzFhA+hADrCn8AmlUnGtqjhBD
	N+TzHeJGHHAyUnnGP/OYaq7dDiXB8MFpjT86NUWjW4MVAf+buktfrQhCwsPStjDoFczucxDWdA+
	PJT5zKPIacD+5Z25sydmNUO+NzP9snawsr/LJ8Sorowe7gXEDNw2UdXpj+9uvh1DzoB9JBPlRQ7
	CWvYNbWRlExKcVBjwoXGGHiEGJh+zqJOJnvR5p6rRQo1VLis4UnmM4Ki+SxxkfVSAGosHki4xnV
	vOpC7OlsUgVxzxRCHQk2ImNgumjC+Em/4EYR1jJqeulzwflN7BdchwbmzlpztFOZ0Dgwmqb3uMv
	HfMI3iljO9fc0cW/WVRqfnwdVuxI00DvGZYuBFjL1uEC0BX/Aa6UVdmK9CuTNzhskq
X-Received: by 2002:a17:902:f546:b0:295:745a:8016 with SMTP id d9443c01a7336-2a951605e16mr19839485ad.11.1770361530915;
        Thu, 05 Feb 2026 23:05:30 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b9bc3sm13778935ad.63.2026.02.05.23.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 23:05:30 -0800 (PST)
Message-ID: <31ad6a98-66c7-4e95-b40f-ead8c594a212@gmail.com>
Date: Fri, 6 Feb 2026 15:05:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-2-a0987203069@gmail.com>
 <20260205-psychedelic-brave-toad-db4936@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260205-psychedelic-brave-toad-db4936@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_230532_683065_5B1966B7 
X-CRM114-Status: GOOD (  10.15  )
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


On 2/5/2026 9:18 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 29, 2026 at 12:05:30PM +0800, Joey Lu wrote:
>> +
>> +  clocks:
>> +    items:
>> +      - description: DCU Gate clock for register access
>> +      - description: DCU Pixel clock for display timing
>> +
>> +  clock-names:
>> +    items:
>> +      - const: dcu_gate
> That's bus or apb
>
>> +      - const: dcup_div
> That's pixel
>
> Use descriptive names of functions here. Not your clock controller. It
> is completely irrelevant whether you provide here gate or div or mux or
> whatever else. If by any chance in new design you put here mux, not div,
> then completely new binding?
>
>
> Best regards,
> Krzysztof

I'll use functional clock names bus & pixel instead.

Joey


