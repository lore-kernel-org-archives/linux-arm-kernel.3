Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25150F46139
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+799mjtJ424ayaFpNGDyPK5HSrH/GAuIDLlXAToI0C0=; b=hXweFM1upuazoK01c/JvmRusR5
	98yHYLdgs0ACppqHiNyYAbvjfcSBTYs5qj4uaTiP6FpATZM9F4PbP4WupmcSkJE6lOkzIp+OObs+I
	pW4m0qkAyF2pgmInXTuDsbJ0t5FL0nSNFHIyAPkBh2KTuqRrkgfohIn/9G0J2GG1u+3xG/aihSPp5
	XksjbnFrSSwpRUOJML3IY5nMB7QyLBBlc6Lz1cX3LNL00A8KsBUiKnAo7R8rpwMEJzGuFwa+vhum+
	iHmCYvn+KtrEo8oxV2qJhvGGXw2jIaokeAmYZA1nJURXwoumPlcNe9tOGUawrLTJeSFR0jN9MB3dW
	V2aAIROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hLv-0000000H2x6-23cI;
	Mon, 23 Mar 2026 15:38:03 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hLs-0000000H2wc-1fiY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:38:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43b7ffed973so147909f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774280277; x=1774885077; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+799mjtJ424ayaFpNGDyPK5HSrH/GAuIDLlXAToI0C0=;
        b=pYWGk1QDeT+aG7cJi/jERhcFs99uBP3DN0O2r9FaTKJ/pcH6TGlC0Q76yAPG6UTTzj
         WxA6DQRmQbNr7/uIb8qFR7jmMchyuUQsl3wMwVmooXoannfs9S/uP+qdVRy2SsNUAjPn
         VkcSpNzL8oiLyfsJyDKT5366q6l3xHy0oCBIq6W2FBX14cum6m6gKeN8DYICGCyLuqq7
         IZ3qK46Xjmikk94OvXRECS3csxrn3XLhu34gQ6y3SXJOBuZkFHNldle1GgCegCsLCpFL
         DYhRkHL5yIAWgMfMCPvUYrqhdB3LQZqpcQUynasg4HejaoIJRNSkoASAx8Xm7dBQKFDA
         5MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280277; x=1774885077;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+799mjtJ424ayaFpNGDyPK5HSrH/GAuIDLlXAToI0C0=;
        b=rLJDxQOuzJwLnm99ZyQH0bCrdVvz4Q9WmFPU6gsWnq1iTvddKTCzPv7N3dA/zNvcu1
         5kf5mGRxNfdfZe5GHV5VPaCFaEhBAR4YAFtxr8XpVb4Tlsfxxp0BOE9uXa7gy3UTtOk0
         g/zDbicbdkXWmFsVlJuRCD0GAz3+BUhYq++oBDhPJPYoLMuSNwU7XCPZOdX7W4HBVGuJ
         KOlNySqfMi+PTaLHf5KGbF8knuiAHjfcuCrgGTC4Rd1szIZ0rXzqyH0SX1ixSSYD+eie
         TwcIT05mTmKxhpn8pqcStO2cchAMb/k79cyrA01/60PDcw9uX5Lw7vfQ/7UyNw5uG2Kj
         7hUg==
X-Forwarded-Encrypted: i=1; AJvYcCWvXiIrucWDZqr1AKtXkWLIU82oa2KJi/w6LKs4uS4HAbxAAZXZg7xhwSQovvdK6ynJmnThajKy7vgEMtXTIN5p@lists.infradead.org
X-Gm-Message-State: AOJu0YxnDGrYXKERK1u6nCfH3ugckV0aZbX9+0izRkuRx7hZhGBfZjeY
	oBlxDHEsppJcO3g6RUG32zIFvEp7rUs/93Rh3AliGgH+v+ilvGuPg0x1Jmq0N/DuDdA=
X-Gm-Gg: ATEYQzy4rle7XNnxh8I0HttmenC2XbAEQvbvt7hti2xGRGyJ4T6twAavCrE6NSd8Qjc
	lIOhCZ5T9mOrsWiVAZqOm4GksOZX34gRZGYNCSitvg87WiiQfbSYtcuz6T+UbRFB6HzezoAzLRb
	siX63T1ouFIli1v0BzN4Uok+tO7c0Ou4ZHRNiZN2WxPqbFMtSURCKyf/lUYPTAhwC4KcsK/meer
	fkq0k1+x8GGZ5Cbmi5q3U3w42nrRFQWyKjRYzrSun6NXa0xO+994TBMerDzpDy3bl+JDCOydy9S
	ny2JjqugulK3CNGLqsLq32g1mrbvHZwFPAGif1MmUCadsZ1JwwQI1bRSd10PELTeZEf/uToiAva
	i36eJTEByjC+wqQf12aPsJrrEjX8sRAORArFk3YeVxtet3Np6SEoUgK9oYHY7DLBqDGfN0M3IdX
	JeQkSnrZ1YpuxUPH4rUsyR5fiG+IMm7r7WP48ZWiGz1/tHaM6tPr/U3SCkTrElb8bOG/qAfsQU7
	X88K9cNQ99h
X-Received: by 2002:a5d:588a:0:b0:43b:634a:8ee3 with SMTP id ffacd0b85a97d-43b642755cbmr20095191f8f.34.1774280277500;
        Mon, 23 Mar 2026 08:37:57 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bf1c5sm33324552f8f.14.2026.03.23.08.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:37:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 15:37:55 +0000
Message-Id: <DHA9V6AKRSFP.357L2LIJ2X96U@linaro.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 8/8] arm64: dts: exynos850: add PMU interrupt
 generation node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
 <20175026-1576-468f-b68e-4af18d22b875@kernel.org>
In-Reply-To: <20175026-1576-468f-b68e-4af18d22b875@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_083800_461213_D83F54D0 
X-CRM114-Status: GOOD (  12.04  )
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

On Sat Mar 7, 2026 at 5:08 PM GMT, Krzysztof Kozlowski wrote:
> On 26/02/2026 16:47, Alexey Klimov wrote:
>> Add pmu_intr_gen node for Exynos850. This hw block is required
>> for different power management routines like CPU hotplug and
>> different sleep and idle states.
>> Also reference this node from main PMU node.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index cb55015c8dce..e3f4fe6ee118 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -211,9 +211,15 @@ gic: interrupt-controller@12a01000 {
>>  						 IRQ_TYPE_LEVEL_HIGH)>;
>>  		};
>> =20
>> +		pmu_intr_gen: syscon@11870000 {
>
> Does not look ordered. Randomness of this file does not make it easier,
> so assuming this will be resorted someday we come with a tool, please
> place it after @11800000.

Ack. Thanks.

BR,
Alexey

