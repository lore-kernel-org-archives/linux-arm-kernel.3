Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17022CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKGnF5CC4ETtaEpeIaTcRgQeu3JGhooJgfF4cVfOKm4=; b=MoBNkkU9TsOUzptmLEenrVJnCP
	h/uJVWUzZtLyqFvlCHLKx7gLiukMcYrRuh4Zmti1vbTKbWe576SMj8YPJln4quweJ3Cq5BEflRBCY
	v+3tsCP5T8cCgrpPaTUpl0ljZ6WYDIAS5Ya65dow2CIDTV/ySNBkax4/ZZRjXyeb4EY0AMSXc69NW
	1vVs/PJjzNJmUO/ZWUXpoM21+eX2ST30SPEUqY45V/7w/Zc+trKYe7TU4cUzv3pyzAfHz0KECjt2w
	4fTpjGmCmm8I9GDn4TZg8WJ0/r3L9TqCKipexRJztZRKJTVmQ3iX4LZdaK4UNWvr3UEjEm0fwmjQR
	or4a/49Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqyJ-00000008EHI-1wDj;
	Fri, 15 May 2026 11:44:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqyH-00000008EGk-1m3R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:44:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891b0786beso59048825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778845487; x=1779450287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VKGnF5CC4ETtaEpeIaTcRgQeu3JGhooJgfF4cVfOKm4=;
        b=qU9KaDighItDx5yq7+RKJ6tcJMAYp8r6MhNVJzxVnzTKmgCUMg0BksyLs8PKyU0Jwu
         KjXJbRNWptnNHFgJHabzTN8O7sJx7clVb3wXYhCXtyBT/X5NKJUVzhMU57skxZ4N4oCO
         q14fcsZtl4wzP9qROBm0j7DEoO2IfaJnQMpFmfdMvwTBqspxcxCsxUaCMAtYFquhp9+k
         PQWhcJJR6lAxbWAY1G9QLfJ8Z+nXV6htc+MbB+4vpK6TiAqhRbVpqhOXw1gJq4F1qkWN
         yo37sMBu6NWWFq1Hj/uZoEZkCAUsWwMapC0yRI8HKBZpgUdzDAuLogOLhQ4S4WW1bLms
         QnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845487; x=1779450287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKGnF5CC4ETtaEpeIaTcRgQeu3JGhooJgfF4cVfOKm4=;
        b=gYu8iAxgzMqARJWw870RSoKNkdFYhPGROQu/1YNjsbPei6C/5bM1EsgwLkg76FsU9b
         4rHoyJWNJrNbxQuEZSXwNqyfEDsWgKkWpvSgdU8kWmfNXP81/u3psY5tU2FLq7ZWXAcP
         V+66K6CX3lMJAfmqOIdRcNUm2V7mp0Vac/QAv9drFqzM/gKATPgksCEdmf6fdd0oqc0f
         3G0uz/9lZjEETVnTWIBjcujGvvCYOd5EbKgc+Mkj4Z5z4nM/W4onxWPv5pgGG/rUSeD0
         vaGp3cxpKBFpuSUJmOyIWAYt8E5+PrDsULx7rd5DCSSLf9N6q7bVXD8Dkw1SE/rTmWtQ
         fA5w==
X-Forwarded-Encrypted: i=1; AFNElJ8iKcz5h/u3vFwJ2XAt/kZleOPB1Xl3oPgbl4Gkj7jWRBl/BBPhV8lC6wzwob+62pjg4fNjH5HtH3QkVlXfQGvw@lists.infradead.org
X-Gm-Message-State: AOJu0YxLP94vVZ7qSm4HDjgLJHGpNv8ses0EY9GPKQ4LHngGAW3SVuPx
	CaIuAwaHddbhUVg0tj97EkTd8IhESKYNy/U1Viua5mTVZOoYkp6LtOUkrHVSxH60508=
X-Gm-Gg: Acq92OFO1V6RcuMFhie69ACL38ghwj+hrVQD6wIjhP+ql2oFdVj01WCzcTATdCbmQrK
	0PnDJ1MHfsl+echf0FO/TAWCAWGyJ2k5whjuCb6YlpuCvVOezxOc0VpBdSs0FHxDtgPtgk3s4OD
	z6r62dMFSi/BXkZCzf99zgEvxLypbuGR0qxDASdpTK5TQ7Z8fNHpiyXDSyFB9d1rfErFY4Eb6jb
	TJ/NF4lkVKaSXIC/JdAeymDp+7tuF7fJ/M3xyqnKIO5ayZOqO4/W260KKzNTBh5CoJYZUErsjxw
	9mzdGibD1v/FajOqaV2KDY0MJjXkBzBk3X2t0uGnisNG+cem6IpNA7BvhvkNOd5wTl/BvR1rtAk
	qxmMWe3oMkQLS2xmCiOCozuR+zmpu21e7dqk1ylhaBzY8Ii1Xl1YXjRscVXTlCVisJYPT182o4X
	koDmwxlRQQKUvEgdVkCnBD1+cH6YH8aCv0
X-Received: by 2002:a05:600c:8184:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48fe60edcefmr45897445e9.13.1778845487488;
        Fri, 15 May 2026 04:44:47 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe83ba2sm11472195e9.35.2026.05.15.04.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:44:47 -0700 (PDT)
Message-ID: <a4c287df-0300-4fae-8a2b-23e2358fb740@linaro.org>
Date: Fri, 15 May 2026 14:44:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and cleanups
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_044449_503833_7927F1EE 
X-CRM114-Status: GOOD (  10.63  )
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

Hi, Krzysztof,

On 5/15/26 12:32 PM, Tudor Ambarus wrote:
> Changes in v2:
> - collect tags
> - resend as sashiko couldn't apply previous version. We want
>   sashiko's review feedback

That didn't work, sashiko still can't apply:
https://sashiko.dev/#/patchset/20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355%40linaro.org

cut

> ---
> base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
above is v7.1-rc1 (signed tag)

> change-id: 20260505-acpm-tmu-helpers-4c5af0e2f07c
> prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:v5
> prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
> prerequisite-patch-id: e877f865862ee94f5750b877b5fad863d8acd7c8
> prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa
> prerequisite-patch-id: df5b1d9df4c8894afaff645c9eb84aa4e3daeeee
> prerequisite-patch-id: be74a55583acb36dedca3e118f49633172979617
> prerequisite-patch-id: 31ebc7bd806d4d466c256049f32e3270e2caeeb6
> prerequisite-patch-id: 7ea0832fcf76e4f40e18b74083904e7e37e1addf

While I see I forgot to update the dependencies, I don't think they
matter to sashiko. If sashiko used v7.1-rc1 and the prerequisite
patches it would correctly apply the set.

If one goes in the Sashiko link above and expand the `Baseline`
(show details), will see:

5e9b7d093f3f77cb0af4409559e3d139babfb443 (5e9b7d093f3f77cb0af4409559e3d139babfb443)	Failed	View Log
	^ this is v7.1-rc1 (signed tag)

krzk/HEAD (254f49634ee16a731174d2ae34bc50bd5f45e731)	Failed	View Log
	^ this is krzk/HEAD -> krzk/master -> v7.1-rc1

Shall your HEAD point to the krzk/for-next branch? Happy to resubmit
the set.

Thanks,
ta

