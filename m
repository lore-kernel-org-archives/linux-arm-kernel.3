Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56556C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+XCkwCvaAAuIZkZZLVZsURFvoJh/USKiob5RH57mbY=; b=IyoeF+Z5adN0WT1L8zeFhjV+6T
	YuEY6MGFb9qrSJjaKKrG9jvmHzpOkM8fWn6x/AXHWpEAoGhnmeWlvO8LZ6gfitUgovaPz4rrdn3Ww
	cqRlyHBByhMil7ovwHEaY9T1uevLCQGfZQR2LowxGtAb4+QAFZldcIXNNge2UAFcDI+0yGGcsRM/Z
	4wqL4opijaPSyujTKkC8Le/Sd6W/SgOISjzpTN7b5g80RbijsJ4DJH6MPGdHEaabF5gdSQ1gsddq6
	ESc8RHPVSudAS+ZkhyH/PbAnPpM49yU6WSyD3cQIAII3OyUR1hHVeMwsRDFMjDJWxPydFtZO+LIh2
	zX1lUJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKS5-00000002h0w-2NdC;
	Mon, 27 Jul 2026 12:29:01 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKS2-00000002gwo-0CTl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:29:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso5549355a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785155335; x=1785760135; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g+XCkwCvaAAuIZkZZLVZsURFvoJh/USKiob5RH57mbY=;
        b=GVuU2/u9SmeOgf1UYcgrE7uS+BGgISUq0XhrzRhVrmiIr0k1S04m7paxOLZPwQ5AcS
         /+DRG2t6expSTJXeJIjABgmE5quOvRtLx0YHcsP24QobnBGXtaIZpbNj8jC+KRDaMTtZ
         ly/xdIlh45qD+/qYhnuXfkL7a50y5ZQ8dWcIfg2ZmBrg+T5PbZkUucSUl7+koGWVnfp4
         Mcq0EFYQBltsYU1I1oPE0q5xiW77EwSR6jpMs9oJDBPrygAnnrGSEe/fdObvU2WVgfas
         P+LvvSm/10DRUckjvAKA6aihs4xCyzWT1WkIS8De2f3fcU/JAiYF91gcSbGSWDLlKAee
         KFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155335; x=1785760135;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+XCkwCvaAAuIZkZZLVZsURFvoJh/USKiob5RH57mbY=;
        b=hVyYROfObjlgYWXo8Ax0gUrsJfLOyN5qN5eJrVYanN8qZBjrNl2u0MmHwIMk8CNcV7
         kOEhUlWQma7SHu1Yq5ElAvvqJosw3Gt8vDuB2G76tLICAPa5dOiUAqP+RMApnQabEnx7
         4aUkAj1HPJ1QK+YXN2o3q0PwmwsRsM+mTvB2Qfk6oJVa3Kc1Ja2+2W+++b4gmlnx3fhJ
         kPPESqKMQ4FSkUYv52YRdcqFUj/Tmv9puttAYQdxlQsvUXjva/SUHi7mZbJnPhtCdufM
         QacePb20f+OZzNY2mLfKkPZM5KkA5S/sy6dE2PyD9QgQecKtVJlkhkv7BJkWcg3wXZPm
         OkEA==
X-Forwarded-Encrypted: i=1; AHgh+RpPs9qNU5IKMPLsDXb9iNraYBnqF/CpcOgNqgUyelkcGfihSa8cd8VFV9iTDiVV0rkqgZC10dkYS7h7FFN6GF04@lists.infradead.org
X-Gm-Message-State: AOJu0YzxKgp9veROM2F7TmZ7yPPzqi0TcxbwWSGkxSskKq/Ms/k6GZ4/
	nMSeO+FZ8MOZfrfbW0fblMhEGX198MpXL288rjGBCsfPpHXOjhbnadZ31P1JPyKhHr4=
X-Gm-Gg: AR+sD127Q69AQggYtWCurKwvOgMoY0g6jKmMmQY2OmSD55WbYLZ5jZzxTvVbCVq0hWf
	sS5IM8fdcXmppq0bZJlNO45gVIGDsyjAEtnMKUIqhcJMGT7++AaWf8jPpduy7dph7ZOmfOwCzDH
	s9YyoX4P1qhxJPnUGM0uYL79fgcQMPQbqsw4ctrZu/PKl6EznZ9BIapHddrxw0WiwreS04hkpDj
	bdNQnHoZFCw0Bk5ct52t6Pqy3rMexIJ9AAPS6ANQfcyrutfL98dPKZKwjSQYTq58ZN2Rmg5sWvC
	XwMQFeh4m5bNaj3xIAZnyy2x28SkQB7qA8yaGJfldKUvvhk5KAG/JXgfC5WDxiunOzH5Zkzessb
	pkICtMO4ZaJSW8IUaZts3OpKN3tGIIpijVrJ8l/jBfKO8tsnMykX2FMYUPYtOhaQMw5M2HN6Zs8
	CL9ZGGVsNC92OhCOdxpgoSsrGYpTzXJsN9yZIBf8syXXQ5V0mICccyqkcJJpxcRoZD
X-Received: by 2002:a17:907:3d10:b0:beb:d461:7b09 with SMTP id a640c23a62f3a-c1f1fc592a8mr419795266b.11.1785155335110;
        Mon, 27 Jul 2026 05:28:55 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:13d0:5c8:5900:a6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90b4dsm636270366b.35.2026.07.27.05.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 05:28:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 13:28:53 +0100
Message-Id: <DK9CR2QF1U9N.3UC55U0EM9EJJ@linaro.org>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos850: Add acpm SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
 <20260723-exynos850_sram-v2-2-c94968e52f42@linaro.org>
 <20260724-hissing-fascinating-terrier-6b754f@quoll>
In-Reply-To: <20260724-hissing-fascinating-terrier-6b754f@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052858_135486_A950BD77 
X-CRM114-Status: GOOD (  13.73  )
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

On Fri Jul 24, 2026 at 9:38 AM BST, Krzysztof Kozlowski wrote:
> On Thu, Jul 23, 2026 at 04:29:47PM +0100, Alexey Klimov wrote:
>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>> information and configuration data. Add the SRAM node.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 3881f573ec08..9a8d92aae9a8 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -917,6 +917,11 @@ spi_2: spi@11d20000 {
>>  			};
>>  		};
>>  	};
>> +
>> +	apm_sram: sram@2039000 {
>
> Looks oddly placed, suggesting this is not part of SoC, but all MMIO
> nodes must be part of the SoC if this is SoC. Compatible says this is
> SoC.

Thanks! Yep, I'll move it to SoC section then, in the beginning of it
according to sorting order and address.

Best regards,
Alexey

