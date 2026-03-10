Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702D9FCC9AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 02:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPeNaI7yJ6rN7QDAg6cmHZUEk/n4Ga/qldWclJyzUAo=; b=unyuOki9wNdEPdqtdAFhA1JS4c
	yjU4jkIVaoVlQxZAelbOXOBT/A6/ombLc83WOZm1h35ARphwukRsjD/Xi0iRXNnYHumJLkyUYJ6SG
	LtSMnC8UG0H6btu7fz/AGjvAYfsQns0iAg96UND0C/POugL742+TitTyWe0cZVIzJBg5Eds04K14a
	gv5uQRe6x44CS1VBstWGuKKKqt/HgYxMZUejMzNpFjGLOH+NbyzPBktirvvTlfUV7uzx5zLe+liXt
	LlcBuqXKSoP3C4GuiqA1g0G8H0eEo9WWwkCAtSHEOxXR3QpjwltZO6nTxmI6Ukl8hQ/WPzXhTis95
	qOdbiGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznGt-00000008b4H-2F8F;
	Tue, 10 Mar 2026 02:56:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznGl-00000008b2v-2LWv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 02:56:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so16328245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 19:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773111385; x=1773716185; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPeNaI7yJ6rN7QDAg6cmHZUEk/n4Ga/qldWclJyzUAo=;
        b=HtttWlBuogdKXYhh4HGd+xxJUUTqZFOPK+dlTxOppVx/CSXM6OlsYYEEG2C2CDGBwX
         SbjvNL9nbBP4589EkAHqhNINB6VU3GCbsEw4oNw3s7g2VuEgbg87iTqvg3+ZFA5vBuxv
         XDP19t/XQL1BuINqo1zmakQKH9NmJeKD6pYy5FHC0uDSdJp3HiYt6JbKHzlqgtvrLFM3
         KYDrNxpcaZUDAagOBvj31EbH92DjwKsf0ZqPPBlC3feuxA8f8Fy8Z/qLynqA8tkjJL20
         cyjoUoPQYT1+ZZBIAPCFpEsGIjhdjFeVSH8T86UtlS0ZDRBtk4Qr55ubynSnOH/VASK3
         gsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111385; x=1773716185;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IPeNaI7yJ6rN7QDAg6cmHZUEk/n4Ga/qldWclJyzUAo=;
        b=jHY5W+mLMWbsn8oep9yrO6dle0aJcEzzquhR9e/JS9mcaJ+zPQxyRRF2ZVr8pEfw03
         FKnr3zs8I7OjhfnxSbPJ927OnmzEFxMma47CfZ163sRrFVSWqlH2nILMr0C0R5z7Bf93
         4Og1b/BxC8itN29KUtd0jptMdClpfUDx7iVHr5qrKkKpX5yQoOAJr83iMynEVeRw+afZ
         llABnzT+p2N7ZCaSvDTIOW00MGKulObg02/fJLD4u2Ve2yYMG+9apviJ7fnii2yH5wDk
         hQG6ZwkiOOAnmFjk4NERqnx2tUdpsYioFIyDew3ooViH6aTLRWJMBURbtkOS0dRO4Q/N
         pzyg==
X-Forwarded-Encrypted: i=1; AJvYcCUFzOJ27goudPTlHekWDxXQtXasFl9KitoZATIsU4lT6iLS9q0+cvcL3HQcEZzy0/vjo5Etl8HRQov9RAd1nMv3@lists.infradead.org
X-Gm-Message-State: AOJu0YxI1WlH9xEgHfLqQF/7EV2zkcvilUXKMt3xjwEVcv7wszhhiFfG
	XxA6RX3LhbEPzjyGr+DMt/0JfZqfliyCXN6YD/b7a4eGD6aN54bsE9CpConjF3q7Tuw=
X-Gm-Gg: ATEYQzyI5Rm2Mwt01sZMLD6eXSl3r66IxZQfVRgJwu0HWpY4YHI8c4M6C1HULqTd/KQ
	ik2+lYLcY17MhfCI5eVvnDzfC0U8TUX4DNE5xCb+9RcAwaNUFB7lBlJffSfKm1feGFlW+F33yvt
	EhSEgItvCTG7AtlSdyCX/O3uiJDQLUC15148LgHZbhpjlVvZQqmThORHHksFTJukdAj7y/FYDN5
	66q+BdcsKW4EByronp+4q0j/xA3K/q0a6Y9SYSQipoCLb84swaZM0Igo/Sje/OxTT5VNHM08Dzn
	8hx9BZRC68TOSv2SnGiypJx2V2gj8Cg8FumF785wlEiUTJDcN/QMqTpDveTAhfv84QPOWF5Gjww
	4dd6YYq/0nkqV0IwTnYN6pba4a6SCyNuwmCpMqlBAIslDYSIWjBn2pXmDb5y5aYaWaJchJ1yq9H
	e8i85p2U0f4K8RVsf/3Yg1lWR1LrPmI8FOVRFG9q8ehsMzG17wbZTNy6bR/O1QVmKpk6kA81vYD
	PY5jmYwHk6aIaz1
X-Received: by 2002:a05:600c:a0d:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-4852695b6fcmr215782145e9.18.1773111384919;
        Mon, 09 Mar 2026 19:56:24 -0700 (PDT)
Received: from localhost ([2a02:c7c:5e34:8000:7b62:c11f:db20:9ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b8d4easm38369165e9.15.2026.03.09.19.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 19:56:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 02:56:23 +0000
Message-Id: <DGYRJ0FUBJIB.3HUS30VW280A4@linaro.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Rob Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Anand Moon" <linux.amoon@gmail.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 0/7] Add initial Exynos850 support to the thermal
 driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mateusz Majewski" <m.majewski2@samsung.com>
X-Mailer: aerc 0.20.0
References: <CGME20260303090219eucas1p1711b5b0f0e8ae56bc421ad8f6e5bf365@eucas1p1.samsung.com> <20260303090211.673143-1-m.majewski2@samsung.com>
In-Reply-To: <20260303090211.673143-1-m.majewski2@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_195627_623889_05212273 
X-CRM114-Status: GOOD (  21.49  )
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

Hello Mateusz,

Sorry for delayed response too.

On Tue Mar 3, 2026 at 9:02 AM GMT, Mateusz Majewski wrote:
> Hello and sorry for missing your mail, thankfully Marek pointed it out
> to me.
>
>> I applied the whole series locally, it applies fine on 6.19 but I didn't
>> check linux-next; and tested it on Exynos850 E850-96 board with the
>> following DT node:
>>=20
>> tmuctrl_0: tmu@10070000 {
>>     compatible =3D "samsung,exynos850-tmu";
>>     reg =3D <0x10070000 0x800>;
>>     interrupts =3D <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
>>     clocks =3D <&cmu_peri CLK_GOUT_BUSIF_TMU_PCLK>;
>>     clock-names =3D "tmu_apbif";
>>     #thermal-sensor-cells =3D <0>;
>> };
>>=20
>> and thermal zones as you mentioned way back. It works just fine.
>> Temp goes up to 48 C with a loaded CPUs and settles at 36-37C when idle.
>>=20
>> So for the whole series:
>> Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
>
> Thank you!
>
>> However, do you have plans to update it or re-submit?
>> Or any other plans working on it?
>
> Honestly not sure. If any other patches are merged that conflict with
> this series, I definitely can resolve the commits (for now it applies
> just fine to next-20260227, though I haven't compiled the result yet).
> Correct me if I am wrong, but I don't recall anything to be done in this
> series otherwise. If there is interest in this series, I can retest this
> on the other boards and re-submit this later this week.

So, I bumped into the same issue you described in your other email.
Other sensors seems to be not initialised and always return some weird
temp (minus 29 or smth like that). Only first sensors works.

I initially started to look at this after enabling idle states on E850-96
(they work with only some un-upstreamable change). Having at least one
sensor is better than nothing.

I am looking at enabling ACPM thermal thingy but so far I see similar
issue that temp of all sensors is reported as 10 C regardless via ACPM.

Having said that I am not going to oppose this series moving forward if
you wish.

Thank you.

Best regards,
Alexey

