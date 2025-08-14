Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6198ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qda6eKiChu1mXCojr2a5Wn7iDIeLm6m2hQhqg1Pn4sg=; b=VUGKDX+eQYC1dZInWdHZnS3Wh+
	NpJmPd9APtJobKlBGFqekPsckrTMjOHwy8yccLdB5kkEcipm4PrajKpp1GXR/zMjkYTJtJSKkHe82
	gtdaznxpWQLYc8GVTDPhu5M053UsJFYYIEF7ERYfkvbiNHrPRUlOyflAcjL9fNL7Ab5Fe5R6svoMG
	qXVmtB0j7k3WnMAUxILV8Ca5nulgUVHZtNzyiRoOdmZxTwLWtrxNt+pHRSOMi2LFncyIfdBl8ZwEx
	8TC4nQCH7ZvL5EhodjcGcXHDS9tdTDDbNm6IR0Wdbo8oZDWiLoFr29hGexgudpIstxA2IqQylP3CD
	VQdWLYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZki-0000000HPpI-1s7x;
	Thu, 14 Aug 2025 15:20:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYbO-0000000HABB-3jE8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 14:06:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso534846f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755180405; x=1755785205; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qda6eKiChu1mXCojr2a5Wn7iDIeLm6m2hQhqg1Pn4sg=;
        b=L3QlCAvgGvaO2Ycv79E67sBcpIO8B3IergeqXVhOkzno0o0E9cnWmjqpK2YDE8g9TQ
         DTvS1GejutuFqE17vIjYgYJMcioZ/G80UWWflDUjAPPcQuAAyBkh+HpldHUu863Q8HyG
         4IwfaKyeexlx0ZtZCCpIwxDAmRiryJd34Rv2heFOPbs+9otl1bbOKMIjD3PliJcUbIvm
         qNpWjyfmQdLbIeDSCSXxlnZgnis6NpV4OALKEiRoAFll5REvWZb4ahPI1fKzRSAFwJkW
         YEJlZN/Xhb01MHCGFboN6o71tnz/JkHDwhHUwvvSTaJy1U/TgNBSPCIjMhI9NAvYKig3
         3BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755180405; x=1755785205;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qda6eKiChu1mXCojr2a5Wn7iDIeLm6m2hQhqg1Pn4sg=;
        b=YkG8h5IBujuq+aL/ykuesrlr0pItXxUeUik4n1QsaeEkDILw0pSrhAdhwPy4oy9638
         MDzPDGS0xPybKLLLOYr+S0eLa0BRqzCTtOS0aH+wxK9jPu0JXQOAZIBkHVYajBWC4xA0
         phvn39lRQUS3v6Pk5Y581zrc2ZqE6S9lA7ix1IGVMzyVFT0HHAySHvx0NpZ0xz0qFSZy
         hlYogp1qWeCNauAzLi4/bhJBKVkBTFcwBMeg+p3UxDcAcdebqRCQZoQB8brjFIMtEcaV
         gFdy4c/WVk+AWmpI/C2sY9vBRpI26xvbF1CjgO5YzlkaOkE3KicLCnznAZs7yQGXbb5H
         QxrA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Ecr3McqVqrQ0dbFPsleDTHiroP2L8rZbRnhv47GBWpW12yEbS68Nkj/N+6m2pRx2+zjrurXk8cACdPeE/nZy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3LG8EYWDof2Md+cMntF/KbFvSFJQ6v2Ht3+yD0LlPrXXhb6ky
	FVeXP9dg1WO3NYWI0lW5HHX+OEDZ0vbsvSJTtNLklGdTLV4ZX9WygUrB
X-Gm-Gg: ASbGnctP2FWR8L6WADloyrD/OWL3GcQISoJispfc1SxhYYyVfF84KqnT8WXx7QhXyG5
	WD/DFCXBNchpe/xh6eKzqDgmxRzuUxmNO1JTvmhgOHVewoWoEIetQ6I6uwybH2ev/9dyIOoJxeS
	j4RBpsam7sWdRn8xL/ZXijYu2iTQFedJFiYky6UMg5/DFiHWlZ7Z0n976SahDSzcJhM8reH8BUY
	PXYW76wesLlS6HfcfT+Q/qgPqPWKfFIJXMz5VevkGpLfSXr5/W6cvF7An5myY0ZKbsMxJWa3WxE
	r/qS7gaOMIvb4Gglkkb7kTDsR1nyVjcUm5O+i6Ue05FR+EHp+8WhV7aYusy/V7NwMbIEBw2mfJv
	3NV+3Ee1sO3A4bVKts3RXNvYWZxNNLlZ5RU89whxRB7MsPs7OG9O6J8NS+cBa0kC4eZDHKqSnz5
	Tt+BSYOauJE14o+iAuCmhgFsC05r8kpnsfx6Iz/ySoyhkulkzeepWp0BwV0bqDEkcce0ad6gGwz
	GY=
X-Google-Smtp-Source: AGHT+IEnQ9do0ALLGKmunp/XJpi/t5BmL0hnvtsNOXrAxguTK/fiIMH8QwU2UzXZuUzOb9KHxDTCdQ==
X-Received: by 2002:a05:6000:2405:b0:3b9:7bf0:88e1 with SMTP id ffacd0b85a97d-3b9edfd55bfmr2615620f8f.56.1755180404714;
        Thu, 14 Aug 2025 07:06:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:941b:4c00:f383:4db2:82a:81e9? (2a01cb08941b4c00f3834db2082a81e9.ipv6.abo.wanadoo.fr. [2a01:cb08:941b:4c00:f383:4db2:82a:81e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0bfc79fsm40404341f8f.56.2025.08.14.07.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 07:06:44 -0700 (PDT)
Message-ID: <4055d2c4-64c7-498f-8cdb-8d749d32ec68@gmail.com>
Date: Thu, 14 Aug 2025 16:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: Re: [PATCH v5 05/20] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
To: Julius Werner <jwerner@chromium.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-5-03f1be8ad396@foss.st.com>
 <CAODwPW-FjCtPGYkNYozo0ybEjz_rVOeDqkvEPiCmQ6M2in0OeQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAODwPW-FjCtPGYkNYozo0ybEjz_rVOeDqkvEPiCmQ6M2in0OeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_070646_928072_DF851D85 
X-CRM114-Status: GOOD (  19.92  )
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

Hi Julius,

On 30/07/2025 20:27, Julius Werner wrote:
>> +      Compatible strings can be either explicit vendor names and part numbers
>> +      (e.g. elpida,ECB240ABACN), or generated strings of the form
>> +      lpddrX,YY,ZZZZ or ddrX-YYYY,AAAA...,ZZZZ where X, Y, A and Z are in lower
> 
> If the revision ID is only one byte for DDR, there should be only two Zs.

Indeed, will fix it here and in the dedicated field documentation below.
Wouldn't it be better to add a regex pattern for the compatible ?

> 
>> +      case hexadecimal with leading zeroes.
> 
> AAAA is not hexadecimal, it's a verbatim ASCII string (at least that's
> how I would define it, for readability).

Yes you're right. I'll add the numbers of chars it corresponds to in the 
dedicated field below also.

> 
>> +      For LPDDR and DDR SDRAM, X is the SDRAM version (2, 3, 4, etc.).
>> +      For LPDDR SDRAM:
>> +        - YY is the manufacturer ID (from MR5), 1 byte
>> +        - ZZZZ is the revision ID (from MR6 and MR7), 2 bytes
>> +      For DDR4 SDRAM with SPD, according to JEDEC SPD4.1.2.L-6 :
>> +        - YYYY is the manufacturer ID, 2 bytes, from bytes 320 and 321
>> +        - AAAA... is the part number, 20 bytes, from bytes 329 to 348
> 
> This should clarify that it is excluding trailing spaces (so only the
> significant part of those 20 bytes, since they're supposed to be
> padded with spaces at the end).

I'll add a comment about that.

> 
>> +        - Z is the revision ID, 1 byte, from byte 349
>> +      The former form is useful when the SDRAM vendor and part number are
>> +      known, such as when the SDRAM is soldered on the board.
> 
> This inversion of the statement is a bit odd? I think it's more
> important to explain why we need the latter form (or just explain
> both).

I will document both forms so.

> 
>> +      SDRAM revision ID:
>> +        - LPDDR SDRAM, decoded from Mode Register 6 and 7, always 2 bytes.
>> +        - DDR4 SDRAM, decoded from the SPD from byte 349 according to
>> +          JEDEC SPD4.1.2.L-6.
> 
> nit: Add "always one byte" for clarity and consistency with the LPDDR
> equivalent.

Ack


