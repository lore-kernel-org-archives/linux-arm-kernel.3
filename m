Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17AD103E2E7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 21:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62szJXz/A2eQXAOWFiWXMMGTOedky9LlOTBYtgBVjM4=; b=QbU91ZZ+FExK7Gw51xV7tWd7Lu
	pI6ORLLuHNNF0eAqVbaIAD/Z9i7uHJM0aBYbUhUBouotHgVFoOBAiUe/924qEbtzAbEQVn5cSnbBg
	QeB0yuRD0CbRExZmR23hHNa6pTbHZEKfjEOXTfXPizFN+ogqZfGXHp4203Qwcw3sdP4Mn9kf8cdfX
	Ol9gKK3LLXfjV6qAcde9N/Zf6NUX7J49h/TRDLUqy4shcAGu8FL5ajG+A0bCnWqPYk1LEkp1JexZJ
	GF5SydTTjj/YTWIfUNaLgfs0IBNJB2DbMf4lkxv/lOMSi8xqm0zukGY3iyjOoOEl9+AqJxBNk8bsK
	GYscRjVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RO7-0000000CYvF-3VKt;
	Wed, 11 Mar 2026 21:46:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RO5-0000000CYuq-1pwn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 21:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99CAF4436E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C527C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773265600;
	bh=E4WB8CGEUiLarR3T9osq/Oaqjj54PygMKczEGvbpNs0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WqiQp5xsWQBhyQXGiOlqSuNomn0ZVsfEUfEk8SIZVgxgT0IX+ncQksj264uXyCnQS
	 WrPcYmxXDzPct3JUTHVrMcteFzg0xsS2kKOxyZtOGQlQ0Gf2WzRRZsDr5oMTd2nFyD
	 yOBlgvVcoCoNaupdApRFFNrLOs72K2Ze9DT5IBN8zOnA0dWELH0b2eTE9lpBE1Ok0Z
	 F1Pn6eORCrPQJCDoUlMbeD5ms5UyticxfWcfRx+Vu2gZruiX5q2HI+aiVAjdBfUtIQ
	 J9hwteJCT89l6vdlGSP6FC7qjdR2oB+jzVIcAD/K0TTQI9FCxBl7m/IfF4a3EK8ptm
	 4OUf7Wc9xg7bg==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ca09f2056so297388d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 14:46:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW07fU65mWmD3eqPnl6o28mh+khQguYrt2ETk/yX8jgWd45RsY4ErJpGwYolF5yDepm9gHKFjxjV8F0dxJPLfgI@lists.infradead.org
X-Gm-Message-State: AOJu0YyNualjJcXk5BR5KeXRSDztnMIPJ7TmXPpVl+oKNX9Fc/2csVDz
	shcIB6rjLZxJFgpEyr5tpUI4BLuBijkhjc4aGSGBRaHit251BvKrctEqIXgHxBty/Yr1QubuvTz
	teuLtLv9/7+GAajfBweyrw7wcI2aIDqQ=
X-Received: by 2002:a05:690c:64c9:b0:797:4722:f8a7 with SMTP id
 00721157ae682-79917ffd343mr37941397b3.61.1773265599658; Wed, 11 Mar 2026
 14:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:46:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLk8P2MxVXPQH7xBcb4+EvchNiU=9gsU4dabwhLfNzXaMg@mail.gmail.com>
X-Gm-Features: AaiRm52h-eY9dTa0n1sMqKmJTwOkVtk8E54CVD2Z9mkZZ7WCE7689aWdILDRW6E
Message-ID: <CAD++jLk8P2MxVXPQH7xBcb4+EvchNiU=9gsU4dabwhLfNzXaMg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_144641_496228_72793D31 
X-CRM114-Status: GOOD (  12.67  )
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

On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
> reading or writing to the pin.  In SCMI, the parameter is represented by
> two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
> SCMI_PIN_INPUT_VALUE for reading.  The current code translates
> PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).
>
> Add a function to translate it to either INPUT or OUTPUT depending on
> whether it is called from a _get or _set() operation.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

I think you nailed it :)
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

