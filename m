Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5862CD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYQz5WGjsDPNgjJtpHPvb9PJr7MMreR1r3TlgYR8Xgc=; b=Zm/LvA1zHOp08lJ51JEZlAzY1O
	jyET7SnB1EPfU/5oZUUonQxx7dLdpFkQXXgJ+uzPpLERaHDGJ44P/gLVSvAm7bOXUALC1GqaORMby
	b1m8SVqjJHEy5J1f41mOs0Ha4cp5dZ09pJ6X8bylCP1mFrn9xdSoWCLAeX81h2OcCXUKT/9l9mN3o
	EkdLx+WsjTO5C89aX6eFlZxRdMn1xvKDC+vLG8VAavaXZ9Yok4DvDwhcZGpJAt3UUwtIw1wNQcGhJ
	7TTv0g9Vdrgg5Lf9iwOyzrOFcOMkHKABxLzD1Ls60keGlZQ6PaT0Tvg8PrViPeDFcsr7iGsJCCIic
	Sqrty2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAyR-0000000H4VX-2VRa;
	Thu, 04 Jun 2026 16:31:15 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAyO-0000000H4VA-3HU0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 16:31:14 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so1310677a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 09:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780590671; cv=none;
        d=google.com; s=arc-20240605;
        b=afRuW4QA1c12LeNuB4Ou16IV2UT3WiTE0KIZUfRxmqKwRDUSEnBNXUiTK4QpeWz6zr
         3QTe4w34QogCRCYrlLQVe0HZVpVV8VqSjOFNW5r3IGeMGzYB4p21XAPMjXBTID89UFVt
         byVBN72GmsEstpliHT2Cms5tw+pqpybArcWAxVU5x8VzLCPmAovwr/OYXMPX45XJBpLZ
         Nzza98/YvuaNA8Y65DgqAktvMnMiDz9KMitAC2Co7yAS6jChKAm46QYDw3RmPYoOFJjl
         lldb8PbAUb1CcHk3Ge6q9IdR9uXSeDXrYvDdHBpeLDe0ctnF/jSr22ktu3KngWvW8056
         Iacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bYQz5WGjsDPNgjJtpHPvb9PJr7MMreR1r3TlgYR8Xgc=;
        fh=euXWsbnumjsLcUCeTRMn8FiZFe2HfwVHPJBur/+r1Ec=;
        b=CDDTL1TSMNMooB2khhahuWP5rvLzGlagbLZGeAnEQBm4tFhKTP9oEgAWbkVftAC/qY
         ps9fbSdkWMwYDMOmK0Fok8pSvN8gNJ3RLdxdfS5SMibRWuVbhhfQkmrlne9j/0TVDozu
         pCzRm+aY050OJ1bX1/Hi4kERvUsTxsS20hpnVGYLO07Qs6AwWQbHHUnGhDTWcMdEEFQw
         viv8fjwKFYnh9DY6YekGe4Pnm7SpZ5m1hVDlNSVfOQ7E9KGb4dOdqZwLLG9WwqdyFadb
         7W9oKGUS1i2vX3bY6SO4feZdbWVNmbh9Po0Pj4w4kTlwZzRve620ZbqP2WZgiLNs5CFK
         CvFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780590671; x=1781195471; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bYQz5WGjsDPNgjJtpHPvb9PJr7MMreR1r3TlgYR8Xgc=;
        b=fdGUEB2dBi4JtsBDLXXCgPLYF5yAOIJtX8qdsHlebcrpoBEQkm42gyvIzjGzR+w1ad
         pOUrpSlYP6p1PAl4O19StrcpzwKUxhn2HzRJFj3D6ULtXZRsU9nskmmFwcs8VuMp9fYh
         TXPdf6oYo7Q6ExEQOaeSJ/1zvKNoEjBLFWjFfsfhl1st1kzrxokrwKNoFON6j18paxnu
         VOikJDG3IZ863F+mwRhYruDn53MZoL9yqG+HNthg+xP2gi2S7w/DcZcityarDBzNCrPE
         WLRqBkI4F6VTPuJv8MgEAuqe9qXTtbvL7jUymQ6j0g0hNhHiPjHE4TWIDnIl+h91lBzo
         WYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590671; x=1781195471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYQz5WGjsDPNgjJtpHPvb9PJr7MMreR1r3TlgYR8Xgc=;
        b=Mhzi90O2+pHyq9B5u0QgB6+0LxHK8TAA5EOf4bL3XTR0m1usU9RW0H/IPuzNecdEA9
         R1wgtL8lkPnkQqmXOWvn2i3wNOPrnMuWqxanL9Kpxy1r5dciOtnrPYdR1F1HTTQIGo8G
         BLduCRBM00N+g6ytwVWeMRO8xwqxQ7K1Ac0iZ9tMU4H88DsOMkpx2CpgNrNmZC/HaJZx
         ywMA6ZIuWiUYwep7+lRH5mtausK2grYNma8doqg5joH1pQFVNIRXfmWys2hfLrJqnBc5
         vyWM6lEqLJ09cuT46Ijo7HtHEhmP89SIabLBC6mn9nDoG6fhjUYP0iEPaa2gA7Mn5Ngj
         ZIgA==
X-Forwarded-Encrypted: i=1; AFNElJ+v5fXA/y5wXSffnBfwir3+EMuSExXtsNQtmOSuNHpm0xtoYeUQ2JNx3k62H+sU8Amg9W9D2P2HcWWEeEMJxXf0@lists.infradead.org
X-Gm-Message-State: AOJu0YzaUKcUtsOImvo3vR8tDQJx0oumV/afhBRT1WclB3Oge0Pey689
	Z8tF77m1VR+39L1BPRvg7OsDeFeFR47cH/CdLMfMFrNMysWQM/za6NS7y6ODrGtCY/uLZzC0DXG
	RO/CY4Krp48z3iDCDFNHdnZusq16BcWxIljMOMAhxwg==
X-Gm-Gg: Acq92OF1zi9R3p8MkeysRzIUcvTfH4hkUeOo8/bsNGpk7q2KrenSni+/r2jYMXpYf/m
	elVzvEhDgEPtaCg6BB26r2ecpEppT36P76pn1p0/X+/IYTMBWqVJkRGLKnMJao7V8rSSyrIWeIf
	p9fsepxeBnqz6vQXQ0Ez2COzNfB394mlcSiDsqJ00rNzZ2AFVkqydQV98431kHuPnHp96rDxv97
	lPfaV29yjjRJJ3NOTb6tPesBbntVCuJZHst2oFg+tJcLD7HkTmNhXKkib4BwUlasZbKbaV/ZGUh
	3l1G6tmNxCang9bsFjY9NKaVNbr5iopwHqe0xQuLIa4HmL+V
X-Received: by 2002:a05:6402:3215:b0:68b:539c:d269 with SMTP id
 4fb4d7f45d1cf-68e710ebc51mr4808114a12.12.1780590670971; Thu, 04 Jun 2026
 09:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 17:30:59 +0100
X-Gm-Features: AVHnY4Jq-Cm1FpMQ9NjMzo61aJ4t188OLXQIR-HELOPptilenf70Fcb7QJeV21c
Message-ID: <CADrjBPoHXi5hp9T=z97k4LKNKQUEnJdN4sSz5g+NgKAGC6jguQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] thermal: samsung: Add Exynos ACPM TMU driver GS101
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_093112_860430_7903C6C3 
X-CRM114-Status: GOOD (  11.78  )
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

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> the Google GS101.
>
> The TMU on the GS101 utilizes a hybrid management model shared between
> the Application Processor (AP) and the ACPM firmware. The driver
> maintains direct memory-mapped access to the TMU interrupt pending
> registers to identify thermal events, while delegating functional
> tasks - such as sensor initialization, threshold configuration, and
> temperature acquisition, to the ACPM firmware via the ACPM IPC
> protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Acked-by: Peter Griffin <peter.griffin@linaro.org>

