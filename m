Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F322AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+mL7sLw774TWm8srN2xcPDLwTpzOXiXFyMo1RJsCVg=; b=NwR3829MN5VID608EycSEPue+C
	lZSogsYT/puGum4s0f2/zSnqQscjdKeiJALHJN3dBDVk3svdE0mLcoSASrQx26boL3rDUESWIhIxn
	KWqXJNsIIb4+L8ygnpObuWeCbA1U2Nnuof7cJ+AVZq0GR8JfWvdBtmcUAW35pHR+x2/iSUx+4iAgB
	aqHs24xqa06Mfm4Rq+iHVklW+gLxS1D8WyFmNDyqttS/Q8yLnsLgYTiGS8ZijiMdAYoE+7ON4DuUv
	gK9Lf8uNEjFWbZCEnyQgm0T4o2PG+SXh7rw8qdaSRmINVJYgpzut9rrmlr+A2WnnrMiB7v5GJPO9O
	Hu1tXWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTzW-00000000abg-2jDz;
	Thu, 13 Aug 2026 11:52:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTzT-00000000aaT-25oe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:52:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49802c418b5so19958905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786621974; x=1787226774; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3+mL7sLw774TWm8srN2xcPDLwTpzOXiXFyMo1RJsCVg=;
        b=yIRfLDeIxspUHjJwpWmJ7wAzhlne8Zz0Pef5Zi1DEZ/OE6AWFH5xxUfVZc8f41RVWs
         EBC42Tx0qPs5ESAGyEAPa1lZ11WFvXHdW0VPBH/j2HbkAWvpOmNgGXu/TUXrTKV/fMNX
         dV0yweNpeXXrUzia3TQqIDKvmsawysvqjHaJFsqpPAlb6z2YU5wKOxO6h+V/3GtigJJH
         AJPEN+p0s4mU5mZfZ3bfUNw8Cqy0QxOCm8AoBLi8SNichrSFSGFbVWWD/N3k+JRe3jVZ
         Q2XhYFnH12ca5wkWtYfhFHC2XSDLKoDTGiv1r+YA8LZKp57purT5yjbvG2vczBSkshMP
         jY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786621974; x=1787226774;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+mL7sLw774TWm8srN2xcPDLwTpzOXiXFyMo1RJsCVg=;
        b=eXh0nbTHiLpurtS+LJxEgO1b/KYd1BNQBjXdv8mNHAlBMhq3BAsCfzOaWFArDIltZy
         UWz4UfLkynHGlYhj+XbR1f/XQ3BTU86EYanL3s+4XLn6WTiBnyNQkq8QKhXE7vr+i+Ry
         ffjP+Iii6VQVDLcwDiOnTWcJBraj7ZZUOn+ilhSQvRAPothrIszuIDGwZvAorRyBB85H
         t1z4onE2PF5pl30Y5oQnWrq3h0j+yxk00U8GN1Rbp0rJnhVIpJQjZcaR4eP5tgBl1rKy
         BweqTNluVeSpClPJgn8+nDdps8pOpPTTfQ9MLNzNG0XRjUzG926J0cgyi1jjsKjXp4cU
         rO3Q==
X-Forwarded-Encrypted: i=1; AHgh+RofsS+51R45kHVeQPxAvBnaYdmn/7K3aQldOFdmLBtYC5GwRud//PFUPYf1g/J2PqkensvZMfY4RxmM9PXlMcCh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqn07IivAWDEcZEMLKR4At5nlKELjaxUS6OO2ziHJPuVWV1dxa
	1X6h0zX1UT4qEjYzztTQ20vpq3vuOCbCGvj3sVoJM4klk5SP4QykDFc6GcFsQ1SEaVw=
X-Gm-Gg: AR+sD13zmMo2IXxT+JUYl5Ky909naFWajfqEb6XYAuLaI2zTY8JDFk9hNp1r6dMWrSz
	09AtwMOqrrtH8Lbc/c16X47k7gf7IfdYjR29htYzmXrSXguLWRk+IphUl64GeQyPcO226MwzM8H
	6cz2gLfBUo/V/ZYVHx5BSBT5yINYzL1FfrpF8M3w69fmGtDda97bT1eKyAqTkFvl5fukF/iWmJK
	WMCUG3Rg85WDBoLPSkNyRcXOEnzHuDLeVYzmXumjMEi5ij/vTALg+aSl/1ouMknEW+FgPlblRYw
	HOx3NSkDm0ushsb2CR+EwXZzrq+wHrVBmqx9NwNromK3FgEA57mDYyWK5WShCfQL1/E6la+rKji
	BzGGxxPs+Ddl2V7f1i15wgyg9xe206NcvMJ7QTueCqx7ky3Bt8XpvRczQ4nrlYGOMRwQGIlsJ3D
	4LXMgvaJxId7EeMItBNipxDCnioJV/Pce5AH32uABUZZKzb9Lm41jDhVFR3hlVilv8wL0XeIuJ+
	2ASPaM0ydHmAMWSgBP4HO2Sk4+PpzcTt8owbMEgEsBckYM6gcQ9bmI5j1XwhJlZ
X-Received: by 2002:a05:600c:3153:b0:499:7ce1:d8af with SMTP id 5b1f17b1804b1-4998219bd2cmr62067605e9.1.1786621973610;
        Thu, 13 Aug 2026 04:52:53 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:c11:afa0:9e5d:4eee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b0f4afsm72097455e9.5.2026.08.13.04.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 04:52:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 12:52:52 +0100
Message-Id: <DKNSMR9KRFQH.3SQDYW46B42FV@linaro.org>
Cc: <jyescas@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bartlomiej Zolnierkiewicz" <bzolnier@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>
X-Mailer: aerc 0.20.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_045255_556238_4C8C6333 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

Hi all,

On Wed Jun 3, 2026 at 2:00 PM BST, Tudor Ambarus wrote:
> Add support for the Thermal Management Unit (TMU) on the Google GS101
> SoC.

AFAICS there are no new comments and no updates and Tudor said he is
waiting on feedback from thermal maintainers (for 2 months now),
what's the status of this?
Apart from some required updates [1], [2], is there anything else should
be updated here?

Best regards,
Alexey

[1]: https://lore.kernel.org/linux-samsung-soc/08d7299968e14e5fc07fa4791479=
abd9a2b11c2d.camel@linaro.org/
[2]: https://lore.kernel.org/linux-samsung-soc/DJHQR4IAYPDF.2BOI33M1O4CMO@l=
inaro.org/


