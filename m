Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92AACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNWw9DWW+f/uHjT/RqJlGuJEj3EDU+LfC71q1l4z5Ng=; b=gzfHhRynr9JKZe+jyg0aXK0i6u
	if3mWMFCbnE5arnzJnZCKjOJfyhWGPvsq39FSItbEsgJ9LqpI/27TIzcdGgocWEuf9cV+dUQcMM0e
	ubUc0AomeiTt0PQFyhkILDq0qR1tJjs2u3KkWEUV2rqVrTGHuMC4jdCiO4ANtq4cCKQCoC0HL/rWL
	m1JGobZgdIFk3c8T4k79H9OrRkeYl1QYTbuEZlRRA5YeEBRCe7QeChA8AMoyO0L2uayHhKpydVx1H
	8XgZEdVxs5gfFV7cTDK5swCVF8WoysZ1wWeYfuwKjQrUI1ZcG70CwnGQEDoWqSfizKokW9M67XhtX
	olG76LxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPo2g-00000005mva-3u4j;
	Wed, 20 May 2026 21:01:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPo2d-00000005muK-1tVe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:01:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso40347305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 14:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779310881; x=1779915681; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNWw9DWW+f/uHjT/RqJlGuJEj3EDU+LfC71q1l4z5Ng=;
        b=f9PCPBGGD49qgiR3+6tt80vZfrX2t1rLA7FngdZMh+Wu6QlGrCvmoPIS5qmm+fBnOV
         qKXCy+37lSF88UIz0qg3B2S3RjnmE5DskVSW/gyEFjstsNNkv0cjfrEWUTcWudmn9l4h
         4ZkWdx/uXw9pD355s2/0QOgAeEfq/0GaMG1Z+Yw9+aoMUhg8CxHnYT5tvEFNsCpilD4l
         /6XmrJw/unkezH4j3uYpcnuO6hFHrqsjhLfKlcPQj7n6TV7A/5kpjHu0QupER9CDYRVe
         Mmzdb5k/+U88ha1KMvW0AjopNY9RrJTGvwmhncKbbPjo0VvtVok7y4qBY11I8zmZnS+J
         u8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310881; x=1779915681;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNWw9DWW+f/uHjT/RqJlGuJEj3EDU+LfC71q1l4z5Ng=;
        b=qxXqxxC96d2SjutcNIRvshjv659mo9qoCZQpHQJx+TEANYXiHY500bqbA1O8qx1mKR
         DVLRIP++6yVk5iIX+Lp1/uWuF6LdbC2ghqznTzfm0ndpxhHOs9ASzE5zqyE+BPOh7Icx
         ffzZpl/X3bCEVCWniAanqRfeGt0zgsGW8k6aactSixuUtG2N3l5Hw7T7zX88rh9OaR3p
         Jk1eJkUZif90T3p6ApwkIaalUSajrOQx5MS2WfcKJrUddc1XYZgGX4Gdv7TYfq63NdKQ
         nduf+3/Rj7vvuueLl8QP1cnCOd+0w9lUm/bhiUcwUY1amwBf2oEIL0P/k/B0UUgGgqcu
         cWEA==
X-Forwarded-Encrypted: i=1; AFNElJ8uNMrlnmYGXUWqw+zNgVEdUHqfUTOG+V5leyYx4zJa3W8JUl9Hejlz7P3JvwAqrBlEzdWDH3mdSAa8+y08gNsZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yydvm9IcY2Mzd/zr9bbNCa79DPnqd1cE6L0ieorFZaevLFK1xAy
	R1hiz9K8sgzdQBB1ZgdL0en2j0K5x8aWWuE6i5t8kH1/2pUwITzYbvVAbImKlW3XnsI=
X-Gm-Gg: Acq92OEaeXQBlNodu0Egp537SYfbPaGKwtIai//QOC8auAeUyz/3mSJ0c+HcWAL5hjz
	/RbTgngbMyGRIW9wg0nFUcAm6PwRgIOETt0YN7dit2w8Fsos6kQGXN5RhpWm53CNZ1FxpRh3KXR
	56NKbAQWN7Geh+YODLMbWCGYtZdani6L6vz5nTgz/ZC+4qpf/QWiJ5USm1i1VIOWO9y08/TcjEP
	H5Q8I4FNjcE/A31RXFH0RQV2oB0zI8FWUXlrAZJZtKqF4DAC0HDzQ6ARSefpo0LUsvYmEg1x0Sl
	nr8BDejeu3CcZbvcVC+SbzPw+5euZAKR8MJl1I0UvjY9+hqFf93RAQ4c7LXgTDLEOVUyCSOGHIE
	fvOMJ9mLYZpj4wXD6WD8E23A2O5Mr5k6yPJ7nz1Z+HmxmNxpbKglRM3BAZqxGSk1g44HvIsgGlZ
	nCLFW7unnX9XJhsaA6R0wgG8yhQ5poIuuyd/s8r6DqEaWLM99tKysgnE1jlObtaIklhIK4DfC6V
	IKkpH51Dmd94g==
X-Received: by 2002:a05:600c:17d1:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48feea9dda7mr217316295e9.17.1779310881027;
        Wed, 20 May 2026 14:01:21 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c45734sm849305e9.11.2026.05.20.14.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 14:01:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 22:01:19 +0100
Message-Id: <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
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
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
In-Reply-To: <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_140123_526629_D8F6E149 
X-CRM114-Status: GOOD (  19.31  )
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

Hi Tudor,

On Tue May 19, 2026 at 4:46 PM BST, Tudor Ambarus wrote:
> Hi, Alexey,
>
> On 5/18/26 2:24 PM, Alexey Klimov wrote:
>> Thinking further about this I'd humbly suggest that even
>>=20
>> 	if (fw_err >=3D 0)
>> 		return 0;
>>=20
>> 	pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
>> 	or pr_debug(...);
>>=20
>> 	if (fw_err =3D=3D -1)
>> 		return -EACCES;
>>=20
>> some debug message would do.
>> Perhaps we need some convertation, for instance as it is done in scmi
>> code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have any
>> data for mapping acpm errors to some human meanings.
>
> I did that for the pmic helpers. I don't need any debug prints for
> gs101 TMU as I have clear instructions from firmware: 0 for success,
> -1 for error.

This doesn't look like a right approach for upstreaming a ACPM TMU
framework.

You are trying to submit a gs101-specific implementation masquerading
it as a generic ACPM TMU framework, while explicitly pushing the
refactoring work onto the next developer to add support for other
SoCs in this generic ACPM code.

The ACPM TMU protocol implementation on Exynos850 is different: it uses
different error codes, and half of the calls in this 'generic' driver
are not even implemented in the Exynos850 firmware. Relying on a
hardcoded if (fw_err =3D=3D -1) in a driver named generic ACPM is broken
by design and may silently swallow critical firmware errors on other
SoCs.

What about such options below?
- rename the driver to reflect reality: rename this specifically to
gs101-acpm-tmu-something to reflect that it is tailored for gs101-s;

or=20
- abstract the firmware error handling paths through driver_data or
a dedicated ops structure now, so that other SoCs can cleanly hook into
it without having to rewrite the logic later.

Maybe we can utilise build info date from SRAM initdata base to
distinguish between different version of ACPM firmware implementations.
Sadly I was told that specs doesn't provide any version info.
Or probe for implemented calls but that may break ACPM firmware
potentially.

You also mentioned that there are capabilities returned by TMU init
call. Maybe that one can be used somehow.

Thanks,
Alexey


