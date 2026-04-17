Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EF0F43697
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArPcEjtZ9SivxH550C9rk73iUbB8go/eI9x6T8uYRDs=; b=0/Z9jppLlxzb/GU+Y7uMPiq87Y
	ZVZKGm1sV/oLgJdyjT9KaRQANaLYfowpNrOKxq0nRzX8ciTLDLarRZuKSVCrovhIjk4TrmcKrpTgk
	/pHKQQLBgtxhjvCfJad6yp3XNr0qG1nfcTuEgGcCVOdQSYUJ7jDIBL7FU0ov4YHlApjq104ZYd8BE
	/uVlcPic5Xpw2pJEUEiFJUhBz0RAzf0tQ3eSyFwwfjedWDt/M39qsiaeQm5UWQCYhBfTZS56hw4dU
	/TDWcQn3Cf8WcK1FbGJpWdY3lWRzyczYXrVX7oLQWTQJbm2zIm6MW+pMyi+2nVkT3YzkMNdlU60pk
	LfPIlrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDitv-00000004461-0mRA;
	Fri, 17 Apr 2026 13:06:27 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDitq-0000000445d-0VHI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 13:06:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so493900f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776431179; x=1777035979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ArPcEjtZ9SivxH550C9rk73iUbB8go/eI9x6T8uYRDs=;
        b=fdPcfBcASDgcEznnT8xaJeEP6ysw1n8Of83Q65d8sQVFOaPGU26K6iYUInBJN9e+xt
         s5G5a1mzXKy7pMgPIyiEXN/bd+Hz1LeOKsod/BAtO10QMTs0eDQTrm89YiE3LejGlHeS
         74N//NsbyeEUPXQbFwcNHa12v2ZJLLYNLPJRivw6CrdI7K4dltlCqSOsFaFsV4s2bFhR
         RAyMA83fHfkAN0xXWnGxHNsdGywukk6+tPG6iLZA2ul5YQ48xqEfJ6sp/Yi25SYEZ9XC
         2V9wvOwNjFZ3r7lsDuHEpOi55k43h+9R9PXT7qcKDxffQG/n5Hy/5w9wB4lL1U6oIF51
         OV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431179; x=1777035979;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArPcEjtZ9SivxH550C9rk73iUbB8go/eI9x6T8uYRDs=;
        b=kPtuqgf4E+vE1mMew1CKUFvE/jDgEFAdO/AydmTBqySTrHAPnpclmR2SMG7iZ++Hac
         CAHLkzrA6g2bRPoncdFuMVmJXOCgE6ve10AJ+vkBTT/9UYqsZ9UM83lGzd8l6yYxEXLj
         1auv7V52gEmmZQGHgEoJzbzcYVjFgOOPoIwzhmzSA/HwkvvdmJvCSqII43sKMOkrXlhT
         SLwlr32bzC/+VeBU2eJpzL8XMd1uokArVZ4ROw9ovC7XlE8lfFctSdu1s10+ki2QicTM
         uSZP6oA2HzWxR39E4keGwIpIdsj1GrjldJsuuqzOCxsOImI3Du4izLv1V2GXdsjify9E
         aL6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8qZRs+12iHA8WI/gfrK+vkdXjkOpzEX4YcTSxxH8EEMdk0fKEWWKaPdN8U3m7bpCSBaXaJgA60SF24g+cXCJ9C@lists.infradead.org
X-Gm-Message-State: AOJu0Yyan8FLb1sSX3yrkS1wHd1IPNYjq0lL+LNBpfltKxtzC0sw2GQ6
	F52lBxjnAb+Ou1biGSXCbHKKYNcHEFH0/ipo4hkQEA2Q74b65VdOMFoKpzdpcpsFWR4=
X-Gm-Gg: AeBDietLWMhiXBKcqKjmKBa+Ygz5vh16yQTrTxdp+b8bgpX/Z3Cht/hjcs6zAu9BRAl
	9oYY+hRvC6MmUWNtXrEDc1FZHXt8OJVO7CyKLVjh177GMbrp5lyz94eESJkxoFQ2CrIYXV8krLY
	KoIXoode/e2Y6yGHjRWWPTdO56gnbX618XqYsIccTxcIzxssvDmlFQgggx0KP02HIcTBLU1BHMG
	B6gIT2EdlLEsesClEk+345nyVLVXfJ3RyeXNr68QHJ128m4T1QJmpYy90b38ugColszs/BPoOcW
	kI7QRVxeXMwbG191DbyEtoeTlek2mCuuRdFzjqeWfvohhoSlC6/NXEZgNX2zZKgOUBZki3cwKqq
	VeedqP8Thp/O/qe0aN3q2BPtXsYyonqnTOXhvdhO3PgeST/50of6PSgOI1O96R34FUu56Us50VP
	qn3Nd27AYTBJKLWi4jHdyCR0D50Rk175hLs0fyJbtQwA==
X-Received: by 2002:a05:6000:210d:b0:43f:df55:fe5e with SMTP id ffacd0b85a97d-43fe3de41demr2740203f8f.0.1776431179277;
        Fri, 17 Apr 2026 06:06:19 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc09b1sm4687367f8f.9.2026.04.17.06.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:06:17 -0700 (PDT)
Message-ID: <976440e5-f433-424f-8ff6-c7553799f1d1@linaro.org>
Date: Fri, 17 Apr 2026 16:06:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101 TMU
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>, daniel.lezcano@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <DHNUUPQPD5DR.18P18VV0LNTI8@linaro.org>
 <63087cad-a8d1-4ff0-870a-6e1a738ff8b8@linaro.org>
Content-Language: en-US
In-Reply-To: <63087cad-a8d1-4ff0-870a-6e1a738ff8b8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_060622_185719_DC5A37F8 
X-CRM114-Status: GOOD (  10.04  )
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



On 4/9/26 3:22 PM, Tudor Ambarus wrote:
> No, it's more than that. When I talked with Daniel about this driver, he
> suggested I shall really focus on using the .set_trips callback instead of
> .set_trip_temp. I'm not sure if it's possible given the static nature of
> the ACPM interface. So it needs a bit of investigation, which I couldn't
> do lately.

FYI, I switched to .set_trips and testing went fine. I'll recheck the
review feedback and resubmit.

Cheers,
ta

