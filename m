Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2734CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpW8bJVhk5zYu8hx8WxBDR+Y5xwzZmAgq2/PvnTXnyY=; b=1apSfUK0e40g3SzgqeSinRweK0
	P7spr+w68+1cDdMsC7z30vy4Hjm6l/ys6gP0HRfT1Im8qQdQKujZrVQLI4i60dMaE/5xIQ40BHhdo
	XVb/lXrXjc5nzW/wdueVxXyw2covuRSDNyZhSqnwP7E9PTAmi2DYbvd4LhS9dDewpqwcs0Jiv/+Wk
	qyQgZrQZ8np49SBA85uinUsIg1AA8Pp7SGozFMQ65JIKDvBqYU77SL3v+3fa3Yu7FRrogl5iAIN4t
	RGB/n+Lq7qAJc1a2GHUBMaWdBxbnW1fo4CL6pgXPXF8w9DLQ36czh3nII8Svv6Ww4DZVfJDOcmMBe
	QXw+tMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOw4y-0000000FPtg-136F;
	Mon, 18 May 2026 11:24:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOw4v-0000000FPsQ-0VNY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:24:10 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43d73422431so1379462f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 04:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779103447; x=1779708247; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpW8bJVhk5zYu8hx8WxBDR+Y5xwzZmAgq2/PvnTXnyY=;
        b=hKoqMYOuDquiEWKs3jZLp4iwfkJM7d710KhQfO5mceEuzD7bDpJa8hOssB89Tspw7T
         m7feHt8aPMH4JkqPM1NLkZ3ugXfRg6QLOkf8eRaiFN0YftAAdi3Utsk///dFDXuPY1Ws
         GbQE183mo1XygMfe3EyqwhSw1suX35qDq9RPFQu8e9x8eqg9oi4lU/YL2IFA/fIm6lB6
         q55pMRKtcJYw/GuKyjqKC6fXEOpscuWYLmKPzH7guHnbcwZBfVm6Wct8XpM/+/G7IqvW
         oB+L5MAGnGq0iUAz/KkanfujXDAaEGnsoi9UfNFQMTzkg6mhE9+CF2t2C+jSCn/2cHUt
         NjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103447; x=1779708247;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpW8bJVhk5zYu8hx8WxBDR+Y5xwzZmAgq2/PvnTXnyY=;
        b=MRpHyluKC0/j+EiYb64ggi3zppQbO6uJWvaJdAtOY70BeAfL29w4PgrTdxPHYmyOuo
         1B53Dv6qYTY0QphgW931Eu0RNc66EIGoTurzxQbQCc3YFQH6hjiDhYEk90p7y+sTJySA
         ofospf8MTtZcwR3MkLdJ6jkKf7k5tjbqkqzbZeJGxDyOI9Ac5dWZDnozh/y6KRRRzRju
         h1PgJ+zy7ZKjNeob/uI6wWKrdbOwTs81KVxn3ejcI9wqcHubIJBEhI8MXPkVnDZ3Iq+1
         CAkIx60PdYDQ6gjemPRQC9WZGyppXgJXKZElz8A+kgZu2kfPDUVYB3hn48BPYihDYm4h
         nyag==
X-Forwarded-Encrypted: i=1; AFNElJ8RJWhT7kEoNYQNKqh9Umb34z0zJDN51w0RViXvLnHoIttcNnxeK5YbRiDh19XUoy+01eHE7jpasaoWTUrtFbNt@lists.infradead.org
X-Gm-Message-State: AOJu0YyisqsYGRLMbIElklZnyYqyR5+X1J9LnXE0uw6t2gvlJ+NpGdcO
	vPS9+8F6iXHcem8KD1Mu8JzJL1xMxadpVcJkTu/cF56T9tgOmrr6EiyewF7J/CA9Ohw=
X-Gm-Gg: Acq92OHCwhyjoxlKPxPKSau0he5iiG/h+tbha6zzcEfY6OwOQqoj4fzg75deC81PF5f
	dpiKuDbqZPc25VHKX1stLSqzDtvavc9rXT30e2ORXJiEfmsSDFjbvm3hKCXcXZXl+Bu8y0GR3YY
	YvmEZCWwjXB0Xsmq6B08tTojwFFIpS6i+Qqq54A+sQu2bFyaPGXmY+l1wJVFOZAw2EKIJp/bCn8
	GYPmhuF20cWPJnB9vmutvr47yepAuhu02jdnWY7r7vElqcnsCJKq2U+vAPr4sAhH4U0F16ra7QP
	6CC9Suaq6lNkrM4gWnsUnlfnCCWZdYNV/oqbvzyLJoktdTxX+eGkvU2sdxYOJBsoevrlc0XNqGz
	giNDYCFSo6+ATvRm/QVjEvHbCIHNsL3sojhnWSu/jI62OHyb3tA9nQfSqEoo5CfSo33yx4XAPfB
	zikrTBkWHs0lTnVuJ64zEBt0m3VTlk76Sa0/BLzBYRHd6wCy5eJW08QGwBdG5MP7T0l2zwqFFFw
	ERH3kf+ef1FXg==
X-Received: by 2002:a05:6000:2dc2:b0:45d:4c20:7285 with SMTP id ffacd0b85a97d-45e5c5bbe46mr24111628f8f.6.1779103447148;
        Mon, 18 May 2026 04:24:07 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:33b7:a835:bc95:259f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767ee0sm34384474f8f.1.2026.05.18.04.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:24:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 12:24:05 +0100
Message-Id: <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <peter.griffin@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
In-Reply-To: <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_042409_191637_C23A4CC2 
X-CRM114-Status: GOOD (  26.73  )
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

On Fri May 15, 2026 at 8:56 AM BST, Tudor Ambarus wrote:
>
>
> On 5/11/26 4:17 PM, Alexey Klimov wrote:
>> On Thu May 7, 2026 at 9:31 AM BST, Tudor Ambarus wrote:
>>> On 5/6/26 6:13 PM, Alexey Klimov wrote:
>>>> On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:
>>=20
>> [..]
>>=20
>>>>> new file mode 100644
>>>>> index 000000000000..c68d60b4c0b3
>>>>> --- /dev/null
>>>>> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
>>>>
>>>> [..]
>>>>
>>>>> +static int acpm_tmu_to_linux_err(s8 fw_err)
>>>>> +{
>>>>> +	/*
>>>>> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
>>>>> +	 * capabilities. Treat zero and all positive values as success.
>>>>
>>>> ACPM_TMU_INIT returns capabilities inside designated error field?
>>>
>>> yes
>>=20
>> Heh. Okay.
>>=20
>>>> What about other messages/commands? They just return error code there?
>>>
>>> all the other commands either return -1 for errors, regardless of the e=
rror
>>> type, or 0 for success.
>>>>
>>>>> +	 */
>>>>> +	if (fw_err >=3D 0)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (fw_err =3D=3D -1)
>>>>> +		return -EACCES;
>>>>> +
>>>>> +	return -EIO;
>>>>> +}
>>>>
>>>> Could we map these return values with better granularity instead of
>>>> returning -EIO for everything else that is not minus one?
>>>
>>> I think we're good as we are now. The firmware returns either -1 for er=
rors,
>>> zero for success, or BIT(0) and BIT(1) for TMU_INIT to flag some capabi=
lities.
>>> I can't tell if there are other commands that return capabilities as we=
ll,
>>> or if there are other capabilities for TMU_INIT, I don't have access to=
 the
>>> firmware code.
>>=20
>> On Exynos850 I see more than just one returned error codes. I definitely
>> see 0xfe and 0xfd at least. I don't have any data to confirm that ff
>> maps to -1 and fd-s, fe-s to -2,-3 though and what they mean. From my
>
> for these error codes we will return -EIO which is alright. We can have
> a more granular approach depending on the SoC if you want.
>
> For GS101 above is alright, it matches the info I got from the firmware g=
uys.

*sigh*

>> experiments I suspect that 0xfe means that call/msg type is not
>> implemented or not accessible and 0xfd means that passed parameter is
>> wrong or incorrect or not found.
>>=20
>> I am also not sure that I saw 0xff-s but, well, maybe that needs more
>> experimenting.
>>=20
> fe and ff will be covered as well by -EIO.

Of course. But it is about propagating the correct error (meaning
exactly "what went wrong") to the other levels and to a user.
My debugging of tmu for e850 would be a bit easier when sending messages
to acpm if I knew that:
-- something went completely bad;
-- specific acpm call is not implemented/not allowed
   (but acpm machinery is working);
-- passed argument for acpm call is not correct/not found
   (but acpm machinery is working);

Instead all of that I get only -EIO. Couldn't say if it will be helpful
for any other platforms.

> Let's keep this as it is for now, and if you need a more granular approac=
h
> we can differentiate that for e850.

It's quite sad that even on that level ACPM on gs101 differs from ACPM
on E850.

Thinking further about this I'd humbly suggest that even

	if (fw_err >=3D 0)
		return 0;

	pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
	or pr_debug(...);

	if (fw_err =3D=3D -1)
		return -EACCES;

some debug message would do.
Perhaps we need some convertation, for instance as it is done in scmi
code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have any
data for mapping acpm errors to some human meanings.

Up to you.

Thanks,
Alexey

