Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BC3CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 13:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpBr89JbDstdIUMvCB+UAEmSrotPv1wv1lCMdlQElUc=; b=gLWJzkDCSlvTlbufuXZSaLJwLL
	dl0OTn1OGKGdAuKmd3ibog7fENwTNzlSpnvrtJILcEWQSMM0OUzL9leKtgHhTB/ov4zBuSa88j3Gd
	mWE2j5cU+0fhDenqdMSesjSqH6sVBTSm9Woe4BAVm6vIikZRqRw7/xyXPkkdwLt+MdEcglLmc61Cb
	rF1vj2H5I7nXCiQm2DZ+4iY9Lv7nwkS7ajN39SWyTIG9RH4AoZfNGpf0Y9laLSgdtRKFGzQ90XMwq
	oqNlNi9EySg0shyY4FrW76JnBmFQMuLVKXw0Ma3gKioHz+rAXrQaM6ZXWVr9xp6JqcQiaoKUv6A+P
	f+23oUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQWG-0000000DhUz-1uWU;
	Mon, 11 May 2026 13:18:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQWA-0000000DhRj-435U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 13:17:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso3794651f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778505473; x=1779110273; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpBr89JbDstdIUMvCB+UAEmSrotPv1wv1lCMdlQElUc=;
        b=j8yT8IFd0hJcLTlm/W+sWlR5F8FNIH9AA+Gzha16af8XuJKJYw1/u+eugCRUSv2ywc
         7wDM6y0VfHzPgM1mCCTixStZ27u/5bWRqI76KRxvjUw1teEmltUCzBfgAk+1Wj47KD59
         kToCJf10AoT7TOaai4a0CkfZdBIegf06CjqVH0H11IPSpm/CHdep2aOaNnkI5owFSAXo
         xqp+cnseEj4AbKtd7Qiwa3g6nSVIK8cMlG3VwrdiuJ6dohKGXG/kFCShnvsbMd/h4+RN
         dMArk6/2M8N2Iw4X5tuaF41xKaPcN3sv4o3aaKsKe10pJJN2L9Fuisu5Bk7RZNi0W0VI
         FZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505473; x=1779110273;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpBr89JbDstdIUMvCB+UAEmSrotPv1wv1lCMdlQElUc=;
        b=A/JQhGgJqyYsk83nIGqsnGYDzMZtrfqhOjc3WZpdNEY3+Mx/dYNujfv1RZt2mx3dSz
         pw3mYJSat16Im+CFiDREXyWmrbLEdjzU6vB8ZTPr3syTMZSxd/8O7SaLqvXXKPvAmWqu
         sWfnJR5kI9DVcjqq4uVdbXwdGt1liK9gwvTN78tInNofu1IVTysqqrOvTlRsY/gJIxrA
         OypOA+eW5u4pTW7RQsVAvco/rlCKgRRJ6I5dMC4NzNkOzY8UyyS4TQpOE7bdaWsDddX7
         E0/s2pEhhbzTh/thxNKZ09urUtXDCn/oRb4kHHCV0utiRHkW3d4rmHXvCpNQ2LPmu5cP
         7yZg==
X-Forwarded-Encrypted: i=1; AFNElJ8pY6k8iUtcjQdp6lxZv7/xlrmXHAdBX6XMLVJFD6ZHKboM9EQflCM651FGPiNWO8iB2WPifFQA+/6CdrihjiEg@lists.infradead.org
X-Gm-Message-State: AOJu0YynTE3HKxMiDWbt8XmGk0dIOSd/28EBkPlMPhCfLg/eRqZIfYlp
	qEIbkqpmwX6JPDgpVPiYEj/JKHm+79uHcKPWK0zQ3jCRVodaAUPXKnDkJ7qdWkaLzBs=
X-Gm-Gg: Acq92OHwMJgEeyiAdZlsv15g5SDy1bmFEJRR6PD5SxaeJtOrIdGKlJqJ5j6WbOPUKto
	eAC8TEmF5DylnOxO8wkE6Xk5NbeLCL/Fc7yTEEV3EDZOt6UAdlglpoMZAR+ppYW6z24ZSRX9aGp
	+wg26OH3r1fWHwfqVhuHEkyBzGH3bCfu5BpYRHoh7N+ss9Bptm6eDEk94Hob9p//NDPO27euMiq
	GFmzZ5ebXKWVYo7hqkRZI8zL29wqWw4rvV3gfBpJQ0jm1KHfMjbmjgj2LY25jVL4tpNGkWQBVxR
	ZBMfuXDm386u8yn2jBOCXLR6QD2YX/m8WLzdkiySLSNHGcKEI2ZqJSnKSAuQGzm6cEslmORsElu
	r9y2OYtmmxdp2k6GZs5dI5LQvYhxsA3tw1ADR2yduOTeXpYA1s6ynrJHnI6BWM/tm5138IzoKHV
	NwVdBI/mi10jmK93DEmRsjbbJTYyoPsdRZAB4QdY6VtoDC05aVFqPXKc9z1OCV8Nw1BaUyvNRyS
	+iSefyFB3dqRxAIdw==
X-Received: by 2002:a5d:5d0b:0:b0:43d:c2bc:21b4 with SMTP id ffacd0b85a97d-4515b525d65mr37422228f8f.16.1778505472478;
        Mon, 11 May 2026 06:17:52 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:5acc:6281:995e:547f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120f1f9sm25688565f8f.24.2026.05.11.06.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 06:17:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 14:17:51 +0100
Message-Id: <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
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
X-Mailer: aerc 0.20.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
In-Reply-To: <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_061755_074239_37C77039 
X-CRM114-Status: GOOD (  18.70  )
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

On Thu May 7, 2026 at 9:31 AM BST, Tudor Ambarus wrote:
> On 5/6/26 6:13 PM, Alexey Klimov wrote:
>> On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:

[..]

>>> new file mode 100644
>>> index 000000000000..c68d60b4c0b3
>>> --- /dev/null
>>> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
>>=20
>> [..]
>>=20
>>> +static int acpm_tmu_to_linux_err(s8 fw_err)
>>> +{
>>> +	/*
>>> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
>>> +	 * capabilities. Treat zero and all positive values as success.
>>=20
>> ACPM_TMU_INIT returns capabilities inside designated error field?
>
> yes

Heh. Okay.

>> What about other messages/commands? They just return error code there?
>
> all the other commands either return -1 for errors, regardless of the err=
or
> type, or 0 for success.
>>=20
>>> +	 */
>>> +	if (fw_err >=3D 0)
>>> +		return 0;
>>> +
>>> +	if (fw_err =3D=3D -1)
>>> +		return -EACCES;
>>> +
>>> +	return -EIO;
>>> +}
>>=20
>> Could we map these return values with better granularity instead of
>> returning -EIO for everything else that is not minus one?
>
> I think we're good as we are now. The firmware returns either -1 for erro=
rs,
> zero for success, or BIT(0) and BIT(1) for TMU_INIT to flag some capabili=
ties.
> I can't tell if there are other commands that return capabilities as well=
,
> or if there are other capabilities for TMU_INIT, I don't have access to t=
he
> firmware code.

On Exynos850 I see more than just one returned error codes. I definitely
see 0xfe and 0xfd at least. I don't have any data to confirm that ff
maps to -1 and fd-s, fe-s to -2,-3 though and what they mean. From my
experiments I suspect that 0xfe means that call/msg type is not
implemented or not accessible and 0xfd means that passed parameter is
wrong or incorrect or not found.

I am also not sure that I saw 0xff-s but, well, maybe that needs more
experimenting.

Thanks,
Alexey


