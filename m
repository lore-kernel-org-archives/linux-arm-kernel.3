Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE32FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2z5CJStQaZH5C1yDNgwonipIcrAGaww4SYiAIYI8F8=; b=LTwzVMLVtkrQz7UbC0zeDPKkum
	xehn2JFFGm2DQ7MAC4p0bJZB7PZ5dOBWUizj8PPsjH1t7uV/pniPSOVwEhRuEAxWmFgC8qso4+lTW
	NICwq6+FHdwjZKg2dcflxRFwanZvcfQ3QQVNk9VGur906JfAv5MfWcvPvQPApWJqMrez6NS3NtNYs
	Oq4IPlOs5CGLV7vnzSGI5ABAm53QWnI3zr36qdgHe+GoPnuSxd+zhJLwlIfn3hCHqnha30H1gmVjR
	UeV9oHRIWxNE1xBq8TDDxZeccOihEFf+NJ4vdFybOvAbUC8AIbUgCZjMh+yHWfef3Ym04EYruAMS/
	4Xy6xG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp0s-00000002S3f-24DZ;
	Tue, 28 Apr 2026 20:26:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp0q-00000002S3B-1iQ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:26:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488b0046078so106616885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777407989; x=1778012789; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2z5CJStQaZH5C1yDNgwonipIcrAGaww4SYiAIYI8F8=;
        b=yM5xc6S1YvlBHjQdrlvPZV5bANVuTG1ReEH+WJzMBj522PxFYt8ANDabnI/5o6XThl
         4G34emU+i6AXdz6pK3JweqInUKPHHw9vA7AJPL2B9rPE1z7wZ8p77V7nsB4F28Qi+Z/X
         10xvoLYhYnyzlRWB9GP6+9BAn4DJ0HfyW5bFKZ1zwu05L0mQ4DbnFZXm1ioLQ5fe2yho
         2EJkMnWie/DBO5f2GellCg0emhQOv0a43H/SnygKMmEf3hGNbo2K3bbhqohMfXWB/G1N
         OU2djjJ/Zvtl8q3VjDu/9sdgsA+yxVD4lzhwSARirly9crGBcoP5cx86ruD7GrR7nAa2
         C32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777407989; x=1778012789;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2z5CJStQaZH5C1yDNgwonipIcrAGaww4SYiAIYI8F8=;
        b=QoZhF9jMpcVF9YSeYoa/HJGh/xm4Gixs37zINhdcIYpNdtNB1z/4v9XQwXIKtmQz8J
         2m9jO+5hcGepb68AwDSUrQrKtMzU8mCjD1Q+EFI9tUkouPD5x9ATmkAHTR5c+vt/H+k0
         zYd6kBui4b2TqemTxKH6OdIcJEWM/scCH/vsmPmXxO0tqzFczZaeW1ulti39m+vhSgtI
         GH8YjCjFbf4n1q1+Ko2CGhQ5W1teavNPO4vEusiqZrzFKrmYZ8qRE/tgzJEo3bfEus6c
         lvg1FYbhewM5kPvCQYEdYyuBpmRFVVXIZuxvAMUqicvvi9ars5z0+9QgFxBJNUZ+qs9c
         L5CA==
X-Forwarded-Encrypted: i=1; AFNElJ/4hF2xYEZhxQCfvk9YkcC2Wvxdvnyb0Ick+HBLHtqAQ9qw/JY2D7qAkKXk8+INW/gL3dtpvipgJ7OciY3vai/e@lists.infradead.org
X-Gm-Message-State: AOJu0YzgS9sSWX0TUQ5MBlEZ58hQgehDy2kba66QISS988QsP2RGQ9GN
	YPGocDIevKbp1r3idsY/ErCPHt3wy0TJdtJwcIRYP6xIJeC9lfIpc/PZNApF1tuT3R4=
X-Gm-Gg: AeBDies92XMq1d8Ur0ETYvEeuZrhuZ7/K7OCsYpmHGeRP7gaGIdnFPmGTvYfXagVf95
	A2opqE3RiA8qlZPU7vuRTn3mG8ramVlTwlRdc/FNaoj8MbPI7l2fUAX9VfcXA+jMfOZscv5gepy
	4LjFkJ/nxz9vsUhhhnbFuZM3MM+39RPEWThnCzAUsSAJEi16XlG6sw7Y6KZNh1/PxqQpjDjnSEA
	F4Mvy8UQWK/ZH2BSUvFSZnf+v9hR+lTF5QEQp/B9xaihr50l+8dZHu0tiGeRfFh0b/CChwlU9zO
	ZT3gPTynoxoqOqI4FciFCWhOt3WqPDz/DgFHCVDlCZ9G6Wf/QsU9UJwD3SPLYyYOYCG8RriDTny
	FzVAYTe6ko6RBrPJR9cpsccWx86XrOAKaeUGHk7Ev6E6R8PLt3NM6bBJ1Oso6UFU862uiG0gPfe
	m29tIEy8ujj7uWlBcamle17vLQtigvYabTIqYZZ3fbOpWxTjjtj2HxGGf2clxorlG11r16uEsRD
	Jd/tJTvFKazXoArWoGmGyU/
X-Received: by 2002:a05:600c:4f0c:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48a77ae5386mr75966715e9.5.1777407989369;
        Tue, 28 Apr 2026 13:26:29 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc11fcbsm10511235e9.3.2026.04.28.13.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:26:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 21:26:27 +0100
Message-Id: <DI52JP9JH6AH.3I5OKWOZ56MIU@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850
 mailbox
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
 <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
 <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
In-Reply-To: <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_132632_488309_440B5AC8 
X-CRM114-Status: GOOD (  12.72  )
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

On Wed Apr 8, 2026 at 2:08 PM BST, Alexey Klimov wrote:

[...]

> On Thu Apr 2, 2026 at 9:42 AM BST, Tudor Ambarus wrote:
>>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *c=
han, void *data)
>>>  		return -EINVAL;
>>>  	}
>>> =20
>>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
>>> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
>>
>> Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask inste=
ad of
>> a shift.
>>
>> I would rename irq_doorbell_offset to intgr. It aligns with the register=
 name
>> from the datasheet. You won't need to prepend _offset to the name, we al=
ready
>> see it's an offset when doing the writel().
>
> Sure. Thanks. Let's use FIELD_PREP.

+       /* Ring the doorbell */
+       writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
+              exynos_mbox->regs + exynos_mbox->data->intgr);

FIELD_PREP() wants a mask as a compile-time constant. Unless you want me to
add switch/case for different SoCs or I misunderstood something I don't see
how this is gonna fly.

Best regards,
Alexey


