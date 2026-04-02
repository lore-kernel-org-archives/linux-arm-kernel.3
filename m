Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2523FD3941D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WxgO0tK9ltbloE4Oc/9lVYcELxtyYhqEk3PbV+jR6E=; b=tkGsBib9kEt/8tIbnlNABTHfoP
	Q7Y1uXaiDA9ca7mYA/jVzOTthAIN18Flh6noN3A+n8digQEPdlRu2zCyQ5xqKigjYfoO2uaThbTAu
	Cq9OIJmBiDWnQKqiQKNVlEYTdqa+jrdp3zRzihrGzmc9bSnsHDOdcm6yVxJuJZhMn6gvuuXFFja7G
	PcV/5rwtqBSJM4VAtUDCMIFo6n0Ex7tZD/1wctlUSM5UKPXKr45qjzFTpGLFXgUw5iPzbScDt2vQV
	5PSN+JXP6J5LJ/1llvA12hw6hHLLm6ULX1oMK0xv0dwiFgQC9K9UvROASNUnOif5GCd3nqzvJcbnR
	9Qt7fPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8I7e-00000000BR9-3ARA;
	Thu, 02 Apr 2026 13:30:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8I7c-00000000BQg-18mP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 13:30:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48704db565eso9434395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775136606; x=1775741406; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WxgO0tK9ltbloE4Oc/9lVYcELxtyYhqEk3PbV+jR6E=;
        b=DilShWsUaV5nxd4JFdP1kUer4kzXfjWguhNK7AdI2tYt59q+/pZ4Vuo6KaGC0VfO/0
         MTzCDCkwB63CJv2y7u9rvZHvYsQXo8DPsiQj7Gd8pqtGZIF3YKd2fMIaMC3TJ1L/fLYt
         aLEaBjG+8gg63alWTfaAGRLTZXR1Ja2VKHREFnzHpzXYB5K3wGC26aS63kg05ScfLoIr
         tWuejJjaOXtlGMgZbWF6rnTLfcSo71vmzNq6NPpQ/44KENUGtFuNPJzW9K6TC1xeDddL
         OCzIf41pvVrvd2Zsc+KklIxYx9Rs2ZAYGOzjQP+Pgabdr7WS6vQjXxF57qNvNvQs0DpP
         JQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136606; x=1775741406;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WxgO0tK9ltbloE4Oc/9lVYcELxtyYhqEk3PbV+jR6E=;
        b=n5aBz6fYAAh1EW+Vj55joRIAylO+QEzA9hOTt+msrLx49sn+RPgMMhBk3duWMxtg33
         N4xV41lkR951aL/Hj8GE/LZuhylB5M/lji0oC5nUwQsS5tNkv0aMcHqpMaXG0CEM/V1m
         kD+SjmksHN8GLjBEgMkUXHmWYfgkRqwWLeim33AF7WpnxmgXptov5dMINy+8RecUZ8mr
         epDf8P3f7tjJmjtClFKrUmUWVP1sWqY5PuoDowFu3EwgRIVAk42txEZInDaUhkrF65bj
         gB4dA/fxTrYYsRK/sx4IRo5RWzYdDho5Q4Wi4mhw42kr2Klo8O4PTkfBzSDWd/o1kL+l
         OgaA==
X-Forwarded-Encrypted: i=1; AJvYcCX7C545OexndeTR0vvqTKka1ESz1NIFrD77luGdOacpWJkdEmBXIci1HGf9npHoRY+wDpE6zncLQTwLdj+EJ+Xa@lists.infradead.org
X-Gm-Message-State: AOJu0YzTLO83iHy3fCo04P9j39/3dHK24c+mViB61LzXVlanTR4N3c81
	Dw3fwnLis5phrARr83R5LLPVwtjK/m31dy9ijmE+B8puGecrslfBY51IMvAiMLmMLdM=
X-Gm-Gg: ATEYQzwGfn3N2CNHlxKcen4Jv4THGbCKM5ml1p0b8AC0pZXO2eWYcLqHD6GroceHkM5
	Y7u+3G5DdNey0vw4FrHeMjlesZbxrusDEbp8KDQwUTI8pGUtacMi+ChDQSVOIXssp/ElmNL45vc
	NBcmOKP5TPi4nNCU/jXZJ+I7Pw26tVNVzYSZX2vsRwAWcGN/6wnFq6lcNY+un/+ZGCvunapRwYX
	+5q26v/EHpcg/4k+fdJBleOpEkz1xw380SenCYGQ4oV3W2hzuqZYJorDK52zZTryJrvzS/zjtYm
	5C8NsQx5UmWJLoPB/WkdJFcp1Km/+DKj//LzWIdoEj+YVPbgNHFC/aC0nlqGPcVVitk0I/W0Xyx
	Wa3uSzJfEr7+r4hf64vSaHXNu4TznF41fXNM4/GjzKbGYVPcjXQEankQWBMmV1t/y9dt07w7QS4
	dZiyNIgLz7touCjx8/zC1AhIZ8bqihJcSvB4SDAXXMVsWdOfIEMAB4pHBat6hZI8S8yPqF/K3Zw
	aTso2rOkFmcJ8tg
X-Received: by 2002:a05:600c:a10f:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-4888b78657bmr38517325e9.23.1775136605817;
        Thu, 02 Apr 2026 06:30:05 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:a0c1:4037:aafe:5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad8d28bsm85916235e9.10.2026.04.02.06.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:30:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 14:30:04 +0100
Message-Id: <DHIPEQ4XDUI6.297HDXTP84FFP@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos850: Add ap2apm mailbox
X-Mailer: aerc 0.20.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
 <20260402-free-foamy-gibbon-acad72@quoll>
In-Reply-To: <20260402-free-foamy-gibbon-acad72@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_063008_353628_0B9F4872 
X-CRM114-Status: GOOD (  14.97  )
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

On Thu Apr 2, 2026 at 9:01 AM BST, Krzysztof Kozlowski wrote:
> On Thu, Apr 02, 2026 at 03:20:16AM +0100, Alexey Klimov wrote:
>> Add mailbox node that describes AP-to-APM mailbox, that can be
>> used for communicating with APM co-processor on Exynos850 SoCs.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
>
> What DTS is doing in the middle of the patchset? If there is going to be
> resend, then fix the order. If the order is intended, then most likely
> NAK but I need somewhere explanation (but I really do not see the need
> for it).
>
> Please read submitting patches (both documents).

The dts change goes last in this series, the commit 3 out of 3.
There is no DTS changes in the middle of the patchset as far as I can
trust my eyes.

If the order in this series is NACK, please explain why.
I suspect that potential confusion is because 2 clock patches from
prev series were accepted/merged, so dts change shifted from its 5th
place to 3-rd place.

BR,
Alexey.


