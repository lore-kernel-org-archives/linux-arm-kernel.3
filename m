Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91D9C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8zx6HqiP0IYCIOJkJv49NyaMCMfUqHrZKQYAY9p22I=; b=a2Fljfy5mc1SNjHMTIsg2iHr7O
	w58lS8ejWO86trozMadfYEdI/0VAPkPRREVSBxSejDjAj7WlNOoBydEk/hr4v8Mo6nE+g8kb0ygDs
	LoOU1TP1D+32GarMJ2pRuqtUBb+h5xtrfpKN5G3X75F3Y8wXVNkNBlRjj+uLpdi82/PSC+MHSJEoT
	Rk8IPMrYoPNQhg0lvvLZtOxXjxS7Ud5f1PUoGofctGHfFyk1WT3qR+ePChbOLerF2ZL49lQoBi0XV
	LzrDsXNB7w+X3rV1SskT9aibpfPOXy9z/K2CmZnqmnCPy3FkylxkMYtkseijUz9t6SmgfZDS8/vpI
	ndG/6I+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9IV-00000007D8g-1UwX;
	Tue, 21 Jan 2025 08:07:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9Ej-00000007CaF-34lL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:03:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385de9f789cso4022670f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 00:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737446628; x=1738051428; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N8zx6HqiP0IYCIOJkJv49NyaMCMfUqHrZKQYAY9p22I=;
        b=JbsyV7/3iUGkOfwYDX31CCgWMP28GNo0AXMfDn+jndD3VnFCTUrE0WrOHCqeh/Z/oq
         oT6JyrpychFiKsSH+J+R7I7dJ1x48xcqt5jrKuVtyg2L0S9gdcTdQ9ROg/nEXWeP5nwq
         e3vmNMovTPfpPhDocfaME9WAfXi5R9SMoicA2uU3CwM3w6bnieYa4JMSTWXaQhQVEYZQ
         QJAnq7Tr+tkTtolkTgRCmzJP1Abz5V7ivKST5bq5fHiHbXEYkByOnCJDhodntApDcy4/
         eyv+gsfHIG/svYzSu2YiKP5sH14B4JSG28eDw61pZJfQx7UZdRlEAzRPRE3y9bp9pSuP
         yhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737446628; x=1738051428;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8zx6HqiP0IYCIOJkJv49NyaMCMfUqHrZKQYAY9p22I=;
        b=H6DxYF7jm41Xo5OaS47nXSS9ttAa52ps8jwm0myDohbTXf6dwL0ZPEqKDcaoc/GQtB
         AUS3e6Sn0IJvuFvotq2Z0Lk2JxQTojLuyf9yzNkKfStBsJdpDPUmD10G/zy6MxIQXphF
         3ZeCOdGQsxU0zjPMJ6+RDKvSz3AtZy3PJDW7lSHa7Tw/3l2v+bzlG46QakYx3CrM6RW5
         UXXauu/FjTbGpV2oS1aClgEqUGsxcoRXRp0XMR77Hzqg0kTlOK/s6rpsHnOnxBsUa+oR
         BGDIXGI+nnDjOt4qMyf3bsMt78j2tNS1JFs7ao0NhI6HQSA4Gcp1W2F3sHE4Qpo7N/3G
         i9gw==
X-Gm-Message-State: AOJu0Yxb9m/YAmr9isNacIPlBLtd169QACF8mmaEbxczkMF1lTudVQPQ
	yULM95iMKf11oWS+dpKHYIzR/Zfnjg5YI5QZw9hrmYudakKlIQCHATS99GYjNEg=
X-Gm-Gg: ASbGncvjgGJ8JknF4ZHJqsKbkX5rE/Ym9xXtFHtvSW9YH4vOZvJSM4Vghl9jrGy1VMQ
	qUchYSt5/G1jil42eVGmOwsEzjlncCuy//Ss22+K7mhHJwyKAnAMLuEhdYt5XBiNQP5TnX50K6L
	6+4OE18rY8y9kXWbEY6/BPMucONnlUH2yxKkfcEcFw5nw0/8kK9JSPXFiXrMH9RIuLzg0S3eJh9
	pWSBX5yOI6q5pLMRgDXv7E7xPA5VWx7iyg6vN8lTh4s/jSMfTrrI9QN7ienrbSSxgVvczXbUqU=
X-Google-Smtp-Source: AGHT+IHrNBKASCNdy9476OAsuENS8PkN67B0BVHI6CbHYNScLbwyX+0XbsUcr7Ex8YfKUrH7iaH6kQ==
X-Received: by 2002:a5d:64a1:0:b0:385:f44a:a53 with SMTP id ffacd0b85a97d-38bf5655b07mr12484539f8f.4.1737446627668;
        Tue, 21 Jan 2025 00:03:47 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321508esm12791757f8f.10.2025.01.21.00.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 00:03:47 -0800 (PST)
Message-ID: <09af67d5ab80c6891d546cc74261866999af4433.camel@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: samsung: add support for eint_fltcon_offset
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  kernel-team@android.com,
 jaewon02.kim@samsung.com
Date: Tue, 21 Jan 2025 08:03:46 +0000
In-Reply-To: <20250120-pinctrl-fltcon-suspend-v1-1-e77900b2a854@linaro.org>
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
	 <20250120-pinctrl-fltcon-suspend-v1-1-e77900b2a854@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_000349_831482_AEEE63AA 
X-CRM114-Status: GOOD (  11.15  )
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

On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> On gs101 SoC the fltcon0 (filter configuration 0) offset
> isn't at a fixed offset like previous SoCs as the fltcon1
> register only exists when there are more than 4 pins in the
> bank.
>=20
> Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
> macros that take an additional fltcon_offs variable.
>=20
> This can then be used in suspend/resume callbacks to
> save and restore the fltcon0 and fltcon1 registers.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


