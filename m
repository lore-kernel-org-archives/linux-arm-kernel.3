Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A9FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJtC8axtxZ6PlTBw/4plYqbYMGHIdhbjoFEFpeBa84g=; b=1FESS9yivUR/U/EQc+VroWU04V
	D5KJVngvn92Se5eaApa+/driV9wWsou+h9wfKHW7F5GMnErctKTh4T2qb0O9nTTKlT9O4bWwLE8xT
	RHmF82tiVVnd8ZX0GYLKlkAA2FMp8XMLu7wTTofQKh+F4aacyP5N38xfcaWVX7O7JjO9JTxYWhnyu
	J7ePiPGZyF+8HZ+RGZ+Twl8GvhpV4JBT8c05671gIMQtV2ZeNoaD7zih3npipGyXTL0WlH+JK7T5l
	K17eBePQEzwKgPglac2rVydOCGu/547Chwua2uCjjiBoUeBe3njVAsIw3omWby/3+wInOiACQ6m4X
	RuvQdwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOcQ-00000005CCX-1BDp;
	Thu, 30 Apr 2026 10:27:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOcL-00000005CB5-3Twt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 10:27:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-449e96a8a80so76140f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777544856; x=1778149656; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJtC8axtxZ6PlTBw/4plYqbYMGHIdhbjoFEFpeBa84g=;
        b=S8UbWqOMMaE4OXOL5xS78ghexGfFloBNY9/V6h5dWWzRfPBPrUHJTYrmaGVOav6Pni
         6mrkR5lUGUp2hckgmoYQLU8eQNM6VjBioa/4E/9ERu8S9iXshYEIkhPAKXbzqE2NU/aK
         KbxFpG5cQAuOaSi01cpV0LzjaglfMnN9dJLe4YnzTW60E4mSP107JFYYVBns+2wr5ZPe
         PewGK9BOPgJTC+1BPMzLJt2dSSiXaP+UF/lPZ3gIRkJy7h0p2ntdyRFjdK9krn97oiO0
         9q/mjDfkSWaWpygAUhxTJyWJ/kTdkRrEe1mRrEnUXjahQstp5eOCxJlppcXO7e02D79S
         XdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777544856; x=1778149656;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qJtC8axtxZ6PlTBw/4plYqbYMGHIdhbjoFEFpeBa84g=;
        b=BTur4iRwmssnmribAx2wNcYCOrKEtD79EFDUNzc5AmTY7DmnPjNeXh5GxjO1QtGjjU
         R70RpnBNescT0bNyagdoakqNkfpvZwO5/NBBIL9lH/T/pn9/nzk2hryTTFooOID8Pe4s
         KjPdKJ5pS/B/eKSqwAycrOw40DGNaUT7+Y5uTj/j6krKu+ocRClx4BW+cq1pH9GKGWmw
         l0Vb3L6E4tz3+2gwfaSM7ulPVfPrnBCH20e1VaUaEFaybHTqHLiANZDcY4V3Np8pqh72
         HRWSwz4a/mZ4De+7ZSbGndehXE5bfn/mQG2pA07sOFys+RWbVwUtWZEcqkWZUTTXIlP1
         yZeg==
X-Forwarded-Encrypted: i=1; AFNElJ/Deo55FJGE1xF+XwcAM1oi6edVfDd/8dGDnnOzOnN2pfs+erXJW8UcNtYbkhsnF6Z/0RHkNIv+Xms3A8B4wshW@lists.infradead.org
X-Gm-Message-State: AOJu0YwjhtgOkdBKcCKPY29+kOu+eZq+/58GT+adt1kP8fPodPisUojV
	MJXTy0+mOeZ8Uf+FYzwRG25pf6eJZ5g+4gLZBZjPPQIUZ/ahA6prrsX93EtBQmEAfew=
X-Gm-Gg: AeBDiesANRQkXtmHIRtI6Uyvxd1FjQQCkNgh1wmom6WJLEOS0zu1NGi9h93VeuLk+Nt
	gNzc7PLJWS4Y010mBAJGQTVPYgTZYU51PofMYki7ALYbWeMpKCEyqxP2+TJ7BIyKdg7eyNTmapk
	1uTBfZK0cuySWXMAM1MH6G2IHhMi7nIU5RdZFc2eYnbdBc4Al3KYjahCOgeU1pBVq8eyaT/xa+6
	3ZNt9tboqg5wnBH8i+hxAH0adyiAkvGZRbzLWXMvDzjee/en1S5mPBnV1Tk97+2Us3JQCmgl5P6
	A44PWyploFnU8LjZInOTEOMYv0yMM43Ver3kBhyP4OtJ7jlWXojGY4kuU3xGO3KCv9s7SGJaRzc
	S4uCJHGy6kvXIvIogWx0rBrxQMJiYHQlrhMx+lv7Q0Io0BUxZ7mHYWyloALgfkUUiNOpJUGBTKb
	fOho1P8rkwNIPJz49t9Rm6nDdu2v/Zp7U3jOkYDl2QivOGWFRChd1e3IW0peC2NqesNV/XGW60E
	yIwDkscu8XiTeLLkXCrQihuk0Q0
X-Received: by 2002:a05:6000:2383:b0:43c:4810:dc4a with SMTP id ffacd0b85a97d-4493ffcb2b1mr3621503f8f.38.1777544855840;
        Thu, 30 Apr 2026 03:27:35 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9e61:b264:2b8d:1e57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7218622sm12070800f8f.21.2026.04.30.03.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:27:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 11:27:34 +0100
Message-Id: <DI6F28VL7ZGX.1ZJNLS41FF55N@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Alexey Klimov" <alexey.klimov@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
X-Mailer: aerc 0.20.0
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
 <20260430-exynos850-cpuhotplug-v3-4-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-4-fd6251d02a17@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_032737_885453_25407D50 
X-CRM114-Status: GOOD (  12.00  )
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

On Thu Apr 30, 2026 at 2:56 AM BST, Alexey Klimov wrote:
> Add cpuhotplug support for Exynos850 platforms. This SoC requires
> its own specific set of writes/updates to PMU and PMU interrupts
> generation block in order to put a CPU or a group of CPUs into
> a different sleep states or prepare these entities for a CPU_OFF
> or wake-up out of idle state or after CPU online.
> Without these writes/updates the CPU(s) wake-up or online fails.
> While at this, also add description of Exynos850 PMU registers.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/Makefile                |  2 +-
>  drivers/soc/samsung/exynos-pmu.c            |  1 +
>  drivers/soc/samsung/exynos-pmu.h            |  1 +
>  drivers/soc/samsung/exynos850-pmu.c         | 79 +++++++++++++++++++++++=
++++++

[..]

> +const struct exynos_pmu_data exynos850_pmu_data =3D {
> +	.pmu_cpuhp =3D true,
> +	.cpu_pmu_offline =3D exynos850_cpu_pmu_offline,
> +	.cpu_pmu_online =3D exynos850_cpu_pmu_online,
> +};
> +

Ah, sorry, I forgot to remove blank line here. Will do in the next
update.

BR,
Alexey


