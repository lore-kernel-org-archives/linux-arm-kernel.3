Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AD8CFD63F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BDG7xbVRj31iwvp2QZLc9MANiXnQroW5ucqDh8y6XA=; b=OPQu3ZtHav/aYiw+ES1LvaipjY
	PXWedwHJaB/yAdG5uVcthiS1Qw7G9WFuJnyeBpsE3/EYX6SdlL4aoI29iRc2ZZxfOn75CCoTiQnUN
	kucyw45rO5D1cA46qlaYKivIb48cEJlx9XGm+2pm1XjzIDaZAHEjG0ZDEWGww6lWsJumr0MfXFM5k
	sFQZaXrPiHdXnMaJobI3v7zuK1ayCiOXfYG1gj1xAAGaZmOMPI3syRggh/tpLoTAAmHEBp99riPNl
	6jWDrdHe9av+0qjiLsh4Q6odMy/fwn1sVMz69fA7fKxLOIcoORO1DBwil46COgfGWTa1RSr3kCveW
	yOnb89/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdU7g-0000000F2gw-3ETK;
	Wed, 07 Jan 2026 14:02:52 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdU7d-0000000F2g9-27KX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:02:51 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso8134885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 06:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767794567; x=1768399367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BDG7xbVRj31iwvp2QZLc9MANiXnQroW5ucqDh8y6XA=;
        b=cGITzRAr6Ybl+Xf31eT/rkkLpVVcfYwLV99s89TBoM2108k763j49qbTUDF+1Lbzas
         KdNvOrOvGaXnu+7tmFR0r3wYvL3BlXg2toevNJ4280NAHReZfhMQi/0lNP+XPBBCa0y/
         wAioXxtYkj5M8ekbWu+MQE/p4mxv+8ScSS1l1O0dfa/Yct01fQ+VSY4dJnAagGZGaacq
         6jn8jd9sBG+h65G8Y/b6AjevSjXcx11MRulM/9YfAX3Ft+mf0yQ/BFeGVbfAvp1mZsEd
         Ehb18SJEbRKfL61bWthb2vmPTxFWJ69Zug/Mo+eY/4JD0Qa5q5SCCiJRRF1i5CwBKCzh
         5czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794567; x=1768399367;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6BDG7xbVRj31iwvp2QZLc9MANiXnQroW5ucqDh8y6XA=;
        b=F0ANKN/SuWHUp++SHJePmI3N2slzEc5fnjdVlFkmxrG0NZGbcGTeLFTqDu3l0R5nS7
         9nCNKwROAzi44Ux7y+UjByE6mF1Ydm9c5BVLNR3E7KCipAJjxRAGOulc+DbnK0C3Oi2S
         QrZtYDgxd6GfqjAVHcrpSm15YuebT4Hh8yt0IapTPzb9WDacl3aquSqVrEnFepWuR8Dz
         FlHL8pujOUT3p1tdFWSWWEhsMavfsab3iF8sr/zu9MUNXRElTFO43n9OeiS2FmbOXjm9
         7QmiFpdCvnCl2fzXeRh2bBKvByBfjDhsK62YWKRamyIytkv8hzRwPaO6nLEJUBVJjXy7
         fYRg==
X-Gm-Message-State: AOJu0YwzdsIuqcjrWY0HNqVZmGh85NzKj+LTrMAAtwseLwysx9P870TE
	ByRKQZn2oSwcSlK37ODnhsAciTOlQq2Oo9/7r0dDKWxYvFXIbK07Nnyd0FRg4ydEBDo=
X-Gm-Gg: AY/fxX6hAt3eXMoIkOmWeugK6Hr9n0HVNuKqJPwa76ZU9gWSLHtRnrdJ45c+64ojoGD
	6oGGA0XnroaChKhIBQeSNAkUPD+UOvzWnSiwNSZNXCH1/q+HI9MMFZ74FY6h/esVpw0LnOXs9KZ
	Xjg7VZWM6A1AshzJknOGapwNbVk/A2rhWr8nOtmJBgkspHyaI/zMCVjUOl5qrmTdfE0Om1Y6Cx2
	o7RdJpiPPmaosE6WjeikB2REiMjyZxLXvpqh13ovOTFlOyzV+/zbyWGHKaKVrkswDWL2OICHFZh
	tOyY+PXtFJ8Oc5luGLZeGt7A4gQQfoYjghmKqY5YlttrIEDa6oGeKm24drsD6xExWHI57dO3mlr
	zPHSiSaVfvu4JQT3ou91p1HyGFZRC3lDWyKDNFB+8iOrO/mCragS11sihcERG+N82aDIB8qpHbT
	SlcROP4V8K/2NnDS20q3R9GLNmwxg+w/wxZ7juJ0aHrw==
X-Google-Smtp-Source: AGHT+IF8g7JPh9nCMCzQBNOrHSzDkobpLseaf1/RjnitIhd9ll3VtbdpfKbAXuC/dOThCTR3xUtEVw==
X-Received: by 2002:a05:600c:3e8f:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-47d84b0b315mr30859255e9.4.1767794566851;
        Wed, 07 Jan 2026 06:02:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df939sm10401879f8f.21.2026.01.07.06.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:02:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20251108211503.1578711-1-martin.blumenstingl@googlemail.com>
References: <20251108211503.1578711-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1] ARM: dts: meson: drop iio-hwmon in favour of
 generic-adc-thermal
Message-Id: <176779456526.1559433.8154425618822276172.b4-ty@linaro.org>
Date: Wed, 07 Jan 2026 15:02:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_060249_595184_5AF1AB14 
X-CRM114-Status: GOOD (  13.74  )
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

Hi,

On Sat, 08 Nov 2025 22:15:03 +0100, Martin Blumenstingl wrote:
> Commit 85b21fdec906e ("thermal/drivers/generic-adc: Register thermal
> zones as hwmon sensors") made "generic-adc-thermal" also register hwmon
> attributes. That means we now have the temperature sensor shown twice:
> - once from iio-hwmon
> - and another time from generic-adc-thermal
> 
> We need the latter for SoC temperature control, so simply drop the
> former so userspace doesn't see duplicate sensors. Also
> generic-adc-thermal provides a better name to userspace
> ("soc_thermal-virtual-0") than iio_hwmon.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm-dt)

[1/1] ARM: dts: meson: drop iio-hwmon in favour of generic-adc-thermal
      https://git.kernel.org/amlogic/c/5ea75722eaec226c60472dc578a302aae1d1fa3e

These changes has been applied on the intermediate git tree [1].

The v6.20/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


