Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2BACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pvxma9zQmCdm279DUidXmwLHduEyeRuxuVZscrFTJwA=; b=lD59gtq5A2NL72QykCppGj5PvI
	GLYN+ltyq8yu6wGB8RL9+O08xjNHZUhJzl+kuNEPkzfdyPTeWCPnf5/RQKYJ66I+IU3pPALPYm+7n
	Zuz5Ul3OKJSHu2xzB7/Es0QsquL5TWda7frLBNb2khstMlee90pouEH5mOUgb72USaW+cao4ODUDG
	GsusCbu67xSKCNPEscDlDKDmSgauR/sQIsHylFzanPy0ZmdaeoifzI5+4OCTtVdCsZ8C2u0U+dq8R
	Ld+oLvrmHf1+gJ77NDNM7QNT4K29PONrBD6ooiXOeXt3tqDgLt06EvWhYTRAQyRVdNKDO96cLQDEc
	S7UJe9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqzs-00000008Eb4-33X5;
	Fri, 15 May 2026 11:46:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqzq-00000008Ea8-3VLu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:46:28 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-441209fb77eso499466f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778845585; x=1779450385; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pvxma9zQmCdm279DUidXmwLHduEyeRuxuVZscrFTJwA=;
        b=cIwP9RPWaF/esvYffIhI0wlhDlM4oIpfKCyQLTrToQIYV8CRbY2IK/K+SdmXgU/0rR
         pPAvMgQ+v7PgtB6Umug+xfKwhIwiV1mvCpNTYSEPRfD7uwkt9Vz4pxTH9bj76362U4b8
         cKEvMyxJ1H0k+bkzi5+PrWitSMmhUZx/+VoGaMsHcvHntqELH9sM03M6sxu3+TMAil9s
         0Jh3jiW3ImcMiwhWN37UL/VGxDZ7wlQhJRS0ZR4tVs1XIO2kO7/DZq0VVaM+d9p6Qmc3
         eqPyKKfD+LPHPk/qIJqEbpZ2SpIajOMXYWWmJR9IMY3bGcvH0ocRzJz4zBbCP16cjEbr
         L5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845585; x=1779450385;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pvxma9zQmCdm279DUidXmwLHduEyeRuxuVZscrFTJwA=;
        b=XGVPJ6z9nM9pdvzFOeezDArLNg7P2DaD97aQUecJXWF8xYwEDYxq2GCa+SRnSvKQ7q
         RnvNmSwG07IO3gwma9IhqgyHznrU9a21RHnqCVLlYYnSdF/xbgJIlBQRThIU55QlkNJZ
         haFY6t6OctDePBt3NaoQDOS55h2UPbJxmrcZ+Ml3WfQxbmDGh4suc9u2mYPAHsL4FuFr
         gwi5FdXZJa3zHgVbgpN3SNFBA7IsuvjQwEVlROqMdNpRJ14ff4nYqvCodzex41UH/xXC
         OSyaVV6Rx0Ovh82zLlAbXMqSkpbOF2/sxeoSatr47jbJINSFbmO0Fw3aafVL/bue0Cgf
         X0UQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fqMnw93MOv6pD8lCq+CIiVzE79VoRWXlsiXrPiATQ5BaBoDYcvz+qMy0/InXHzUJzOOvJ/xDNZnbGF4IATbUS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxaf2NzvZePfwp57D2mKMyN4pU7O4rJJENw8QdmUw0/xnqc61KH
	gh7KQkIXNFYAqo2W0/KqDTQO+MSQV9N0t6hBtYEkJzEG8JBtryD255oIEIBn63TrXQg=
X-Gm-Gg: Acq92OGEwP+X7Nmb/JFJNsaYSGnCT4F4m1FqqroiTRvoAB+doCjDiJtXblH8dscRzRO
	1mZqGuawUBiXQbGu1K/VEfaD4gU72HM3hwaVNBzTp265JObVG0YgoM6K/IVg+3zxjzaX19PmH7P
	fdU7EYKUH9L8RGIBqxEFk2NJ3LZQv9ZT9jXSxCo+GHsQYHNrFtAeYC8Wgvzqgjhqz2fSDF8U4D5
	VS6owZ+YEAK854WsY8UOHKMCUn0gzn8c/6C7RhOAOHeLszbOxQAwgDxeyOhdrFeoygt2lH6Qp6P
	gSW0Z8m1vJ9lu95qDkSGGfdpwU/Rxfnx9ZeajY8AaGVClFlljoY+EcB3mDE8HoKYI7N6n6WNG35
	g9ZLz2q18n77rlAu+VQ/5lqJo+nscEQnZaABCiNZQMPMl/28SSzI+07mxeOXjo3qUSCJddIriHy
	WEGFegskT4QW6z0/l/H0ma7BKzLjPqY74IRKKZHKABd84=
X-Received: by 2002:a05:6000:402c:b0:453:9897:76aa with SMTP id ffacd0b85a97d-45d93eccfbfmr12213466f8f.21.1778845584636;
        Fri, 15 May 2026 04:46:24 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a5653sm14852612f8f.35.2026.05.15.04.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:46:24 -0700 (PDT)
Message-ID: <06c264c2-07cb-4157-aa2a-2502ae1f4bd6@linaro.org>
Date: Fri, 15 May 2026 14:46:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and cleanups
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
 <a4c287df-0300-4fae-8a2b-23e2358fb740@linaro.org>
Content-Language: en-US
In-Reply-To: <a4c287df-0300-4fae-8a2b-23e2358fb740@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_044626_897262_F49DC22E 
X-CRM114-Status: GOOD (  15.17  )
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



On 5/15/26 2:44 PM, Tudor Ambarus wrote:
> Hi, Krzysztof,
> 
> On 5/15/26 12:32 PM, Tudor Ambarus wrote:
>> Changes in v2:
>> - collect tags
>> - resend as sashiko couldn't apply previous version. We want
>>   sashiko's review feedback
> 
> That didn't work, sashiko still can't apply:
> https://sashiko.dev/#/patchset/20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355%40linaro.org

the correct link is
https://sashiko.dev/#/patchset/20260515-acpm-tmu-helpers-v2-0-8ca011d5a965%40linaro.org

the description bellow still applies.

> 
> cut
> 
>> ---
>> base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
> above is v7.1-rc1 (signed tag)
> 
>> change-id: 20260505-acpm-tmu-helpers-4c5af0e2f07c
>> prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:v5
>> prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
>> prerequisite-patch-id: e877f865862ee94f5750b877b5fad863d8acd7c8
>> prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa
>> prerequisite-patch-id: df5b1d9df4c8894afaff645c9eb84aa4e3daeeee
>> prerequisite-patch-id: be74a55583acb36dedca3e118f49633172979617
>> prerequisite-patch-id: 31ebc7bd806d4d466c256049f32e3270e2caeeb6
>> prerequisite-patch-id: 7ea0832fcf76e4f40e18b74083904e7e37e1addf
> 
> While I see I forgot to update the dependencies, I don't think they
> matter to sashiko. If sashiko used v7.1-rc1 and the prerequisite
> patches it would correctly apply the set.
> 
> If one goes in the Sashiko link above and expand the `Baseline`
> (show details), will see:
> 
> 5e9b7d093f3f77cb0af4409559e3d139babfb443 (5e9b7d093f3f77cb0af4409559e3d139babfb443)	Failed	View Log
> 	^ this is v7.1-rc1 (signed tag)
> 
> krzk/HEAD (254f49634ee16a731174d2ae34bc50bd5f45e731)	Failed	View Log
> 	^ this is krzk/HEAD -> krzk/master -> v7.1-rc1
> 
> Shall your HEAD point to the krzk/for-next branch? Happy to resubmit
> the set.
> 
> Thanks,
> ta


