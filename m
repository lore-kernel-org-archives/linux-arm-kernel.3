Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9877BCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 23:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrQ5V3rA/8SexZba/BeMJRaArTuw7Njqia+jNFussIY=; b=YlIAsTirTGGelbEsmFv8fZ+YEt
	G9bu05HCKP0St4en4VHX/5s5DSfrGzROtJuIAdUyM5jBAWJSZ9vAhNHHMFHt5UmwmGJYBz7ZFp/L/
	/Rc9kT0kKtSQpOJPUO8B2PQKPJ9pAFvZDq8qWK59oBes6xNWGcyX1Qvs+ZuNQeao1eD80hBLYimlY
	upE8R4vn8/l5A1cv2HVNCIQ2ksptfb/rWyau72BMcSsDCP3ncCf2E1blqZ2E6Nitxg0vD9ZzkTJSr
	DtGPWyi8Q8ge4ZRmm9wZK7i3OA40HT2QRoMvtgSTSl+XCU7p1Vro5yqs7xluLvD5sKTo/qQIngvPb
	j7kvru+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRHqY-0000000FoUD-2oIO;
	Sun, 24 May 2026 23:03:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRHqV-0000000FoTX-2Dcq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 23:03:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso55787025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779663777; x=1780268577; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrQ5V3rA/8SexZba/BeMJRaArTuw7Njqia+jNFussIY=;
        b=tF+DOL2FHDs49YfaCx2B3n4T8tgjEQ24Ww5ipUlKemTGi/ojanFNMo+4gt57zEuEQC
         qy5D16hjeJ0QOBta/m7Ohfvgkm/NVwaNyFoKX2c/2lapc1jZiF9svNKsljei6d9AYFSz
         Q+9qQRz2I31vJuqYC3NAUNopZNKvy4Uj4xiQPopviGQ52jAGmDRs6xLP+IgKTBaO4Y+v
         rYnjXgs5uw6d6xrd/TbfXqmihNeVqtIDGyA1Fqh3fD3xVjQKg0W/yjpm6pzqkG0wQ4Gs
         9uadBK9a8FEP+fIIIch6zNblyT+NeaDpkJM4wG5sBIxrceu8S+UFNqRIXkQnVCYthUMs
         CuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779663777; x=1780268577;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrQ5V3rA/8SexZba/BeMJRaArTuw7Njqia+jNFussIY=;
        b=CdF39nsKjIFfuIVoa4n9/WedZG211Sbe4Pt7VlhzwO/OKQAY0QwAuPCSBsU/IAgjzn
         RYrqz8jPVmZq7hcu8b/vyh2EYXbaIApayDN7CE0gZrWkjww3Dd7YwYRvOXc0aNATqc58
         s62kQNBaBx/LQVr+5p82+43R5iNrZlNSg31jL5w3VyyJerlBJJ2wYi9j56SlCw9S/bs8
         xsTVF3axhHY3s2cdEGJoAMzGJtRe2bAdXoIyq6S8OuzdMuclDa4WXyoJ0cwSYAyNdozW
         ILWOFbEpS/ET248S8w6YqQEcLh14JrGxcC5mV6ddUBLbKt/qt91PKPFReuH37Ot40WrM
         2xFw==
X-Forwarded-Encrypted: i=1; AFNElJ/nrrVgczD5bE5mReKBKUY4pzMkqTdgpj02vqkYbaRspCVRUWWih7feyh8uCyQioaeffqxUHyD8NeIVY4b6Rwzy@lists.infradead.org
X-Gm-Message-State: AOJu0YxguyAZfKmCwkTwM9BqZJBv8x4thHhlwdaiQ4xV6lsB6KBgr1e0
	htQxsAGGI834KEss2BQtutnAcKaeoAKOe4/6E/rZ2OyccSXNeF5kN1hD7J4NTzdDOCC/Y5DPEVT
	00+m+
X-Gm-Gg: Acq92OGEtweX0EIHiYlxTMRSi8KVfhku3ydoqJ3ESF1V2BlvYCBUm1j6hp8ZqTAdhmP
	mO2md9jV9W3v2JUcmjfwI1HouHAOsA1kbm/n9HoTJxVq7qeeUAZzrzzFtsAilsgxPN3Sui4JTNt
	X3QghN32GUDar/8GG0g1s/a4tDIIRWPcS7ae/BOKdQtYZIi9phLNkSzytZk8W4mHNKXvLKtqNMc
	hNZaAXT5xAgljpvH59fTlqhj3Jf3LAGi51TkDyxqIoUnM3QqW2Xb5vg+1dFFsuHjP8xMxIoWdir
	aLwP8KFfS52gG/FudDT79qEtjr60pyA8TqPHCScHtEoL9gphf7UHfQC04dPGbe/9yPCH40GyQWM
	SSb7wGOm/er6MK9/7aRda5mMj+VKpvbItFhe0Q6JhtzIzKXAlUF9JR/OT5r2WSzQtA4S8wlp/DF
	jrDWqdBp1rOvqMK42NxPRwjPNSuKRljFiIx8nS80r0RU3C77dKVOuJfAnU4tmVIBnUloghiuZDy
	ojtgszbLzzqGQ==
X-Received: by 2002:a05:600c:1497:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-490428d1551mr125681675e9.22.1779663777178;
        Sun, 24 May 2026 16:02:57 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ea134sm232108475e9.8.2026.05.24.16.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 16:02:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 00:02:55 +0100
Message-Id: <DIRA5NR89DKG.3MFIRU9TB3NHD@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Peter Griffin"
 <peter.griffin@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <jyescas@google.com>, <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
X-Mailer: aerc 0.21.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
 <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
 <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
 <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
 <b061d100-c0dd-467d-8289-be2c0935791b@linaro.org>
In-Reply-To: <b061d100-c0dd-467d-8289-be2c0935791b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_160259_598977_D8A9A99E 
X-CRM114-Status: GOOD (  11.07  )
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

On Thu May 21, 2026 at 3:49 PM BST, Tudor Ambarus wrote:
> Hi, Alexey,
>
> On 5/21/26 4:37 PM, Alexey Klimov wrote:
>> Peter, I agree we shouldn't bother about hypothetical SoCs. However,
>
> It's standard kernel philosophy to not add code that __might__ be useful
> later.

No idea what you mean by saying standard kernel philosophy but people
do add code that might be useful later. Some examples are:
-- ftrace subsystem;
-- commit eb2415854f3ba7d95c4f30d259f6f598ab604616
-- commit 78723fe309f189ee4010d5b7a55f6a14644a40c2
(if you so fancy about debug printk)

We can probably find more examples.

> Please consider adding that print when you submit support for
> e850.

Support for e850 was already sent:
https://lore.kernel.org/linux-samsung-soc/20260513-exynos850-acpm-firmware-=
support-v1-0-3858d097e433@linaro.org/


It doesn't matter now. Krzysztof already accepted ACPM TMU with error
conversion variant for gs101 only.
It will be nice to see ACPM that is more generic towards Exynos/Samsung
SoCs rather than gs.

BR,
Alexey.

