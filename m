Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935A6FD8770
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xG69i8JOUMrznCX6jQd2A8Mx07c0rQ57RLS0YIP3VgM=; b=z06XRPPZDnbyQjTST8Z8x/TZeD
	4aM8Q720xWQM6Yd9zDZcHhOUif7SJ7SfqIoTQT+HpCL+aHkE1OuhsuxtQkGANU6MzAuAD0L8UN+tX
	XQUBp2SxFZMa1sN4GBzU4ctHyNjfYw/UnAjAtKtKDjVCLtcqLlhOCW229bRZLQP+Y07KY0bA2VnPh
	2DDgo8L+mRw1XrhfLJwRI9nV8WvS3+Uk/yUE6CgjSrsXoK8ag0hTM7lVICzbUNnSqkXP3oguNzNgA
	yH7j8gNUChYW8M21U3VJpanKi05xK9xUa4KsAtxDSWmRJAmYDT3eUoFOZJkV9vNBJbMWWUlbCemGr
	sAPhktBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VBK-00000006Xaa-1tF0;
	Tue, 17 Mar 2026 14:14:03 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VBH-00000006XZe-3lUf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:14:01 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c7393c6832bso2064934a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773756839; x=1774361639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xG69i8JOUMrznCX6jQd2A8Mx07c0rQ57RLS0YIP3VgM=;
        b=Tq4UWqTJahe6US3+WsjFaNUm+Ab7gwLAeT4j7OTCReApgPXp7hi9ctqn009IZ+MDKV
         Kxf6ahSjRignpEinD6yDdn3uTsJL2VrANAXGvm7QJXHixrDmu6Lu1JJpcoa+UlvZlJXm
         n1yFkuI79AVVX3cDGv/PB2jUxNe6nZQnJhG0Bk1y0R4MLMupr1sCgnvrSio0PDuQAX2N
         UTRESqyXwT41sCCbXrSLsEnwrB1RzudpY+L4Oh86ihTX5dJJnaqYOHhE74UEDgZIEHJU
         60Ldufch/mfqnw6mW6ncCWslwbt2Bi6XWlJngNzBR850/y/29GsfuZ+0f4PLlFxQO60H
         jbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756839; x=1774361639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xG69i8JOUMrznCX6jQd2A8Mx07c0rQ57RLS0YIP3VgM=;
        b=ZGoZiZcSRjbhPzBTSkK9EccE+cicggak28Ap8x2FYD1yuH9bCCctRFIAM78YUteXno
         Bd09NxJEYUdi4cubU92uzx4eZXp277rWpsfShNSvo8CKL3wRNSY/qTubEjJ9j6aQ2YGj
         GprkDpUeLixgvSIQ0xa3Vluk4RNpklsyrNXh2PL9tz/GnPgFhwqBoo2M3HFasaTvvzZZ
         sMHpdgU0gmLpoZ/vdsTw55NR9xpFUSYP8F1JOo9x9bjabiads6axxGF8uBbOQyfHH0jX
         S7LlQcSmjw+iEeoM6gFSBJRPrOeYbhMWYcWwtBXjmP+p9Kz7jOzWnnbIcppEPn6hHqWQ
         huaw==
X-Forwarded-Encrypted: i=1; AJvYcCV3hdVkcejztQ2+csrrcLi6rGEnADGZ8EgaqXnGcQMgtaNQZPtHa7tVkep3HjK1iiAQ8C8dofS/iXSeklFsNd1d@lists.infradead.org
X-Gm-Message-State: AOJu0Yw01eDBx404dK3Hfj0PmPfhQX3i03FsFhCtyUHHv+8JJi+RyAwg
	AbBcEELMqiKBlhcTvziSV2YJytRyrMPhqACprLYd0h/jKBIkOKao/Lvf
X-Gm-Gg: ATEYQzyuCUZ/dTlhvKY3vMYabBDiW5X2HkNtLqQr7NpW54Y2mqIRZJn26Orrq7k1fDa
	SBAcG4/2iAmanu2a0YNK3hYL/pW56lfLc1OiPC60tx/oFghSzqJ+gA8wcVfW16VGm56RQWSS4QX
	fEC5951WeB6x6B2QDmaLF+b6itY+93Ze8US22fYFYTYyy1NdVtJ+CWQMsvUxASjg66SB4qfbWgf
	uDZtAZKjfxxZHutrVc4QQKGTb+JfE99u1bMzceWVhTZOgdmuPPBfToPFsYudAI/aUf/VSbN0OpD
	ue6Wez8DOfx5Uvy8JQ9zBZJpj4MrhpQW9U633SDb9Hhp9lzDAxpFvCT0YFFqFDDE7QlxbWHx4ng
	CNyK0PqnxMFSK2M8BsygfzcvxD8lpOVbqh9l/wHpWckt74oQ/Cz//uRr6FozdjY+Fz30Tm47iWx
	KAqjXZR4hk7cmxYx9g9CDi45k74McAblGwB1wZfCqgwLeyYYoGy7Dvqiol5mD3jJLt96cvtA==
X-Received: by 2002:a17:902:e54e:b0:2b0:5472:ac80 with SMTP id d9443c01a7336-2b05472af91mr89495745ad.42.1773756838550;
        Tue, 17 Mar 2026 07:13:58 -0700 (PDT)
Received: from localhost.localdomain (61-230-23-18.dynamic-ip.hinet.net. [61.230.23.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b04f40f515sm114820005ad.74.2026.03.17.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:13:58 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: krzk@kernel.org
Cc: afaerber@suse.com,
	conor+dt@kernel.org,
	cy.huang@realtek.com,
	cylee12@realtek.com,
	devicetree@vger.kernel.org,
	eleanor.lin@realtek.com,
	james.tai@realtek.com,
	jyanchou@realtek.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	mturquette@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	sboyd@kernel.org,
	stanley_chang@realtek.com
Subject: Re: [PATCH v4 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
Date: Tue, 17 Mar 2026 22:13:52 +0800
Message-Id: <20260317141352.17813-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <949b509d-c712-43e7-85a0-60f4c5e24a09@kernel.org>
References: <949b509d-c712-43e7-85a0-60f4c5e24a09@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_071359_953159_9BA7A752 
X-CRM114-Status: GOOD (  15.11  )
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

> On 17/03/2026 02:57, Yu-Chun Lin [林祐君] wrote:
>>> On Fri, Mar 13, 2026 at 04:10:51PM +0800, Yu-Chun Lin wrote:
>>>> +#endif /* __DT_BINDINGS_RTK_CLOCK_RTD1625_H */
>>>> diff --git a/include/dt-bindings/reset/realtek,rtd1625.h
>>>> b/include/dt-bindings/reset/realtek,rtd1625.h
>>>> new file mode 100644
>>>> index 000000000000..e69b5ee14cc6
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/reset/realtek,rtd1625.h
>>>> @@ -0,0 +1,195 @@
>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>> +/*
>>>> + * Copyright (C) 2025 Realtek Semiconductor Corp.
>>>> + */
>>>> +#ifndef __DT_BINDINGS_RTK_RESET_RTD1625_H #define
>>>> +__DT_BINDINGS_RTK_RESET_RTD1625_H
>>>> +
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET1     0
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET2     1
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET3     2
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET4     3
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET7     4
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET9     5
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET_BIST 6
>>>> +#define RTD1625_RSTN_REG_ID_DUMMY0          7
>>>> +#define RTD1625_RSTN_REG_ID_DUMMY1          8
>>>> +#define RTD1625_RSTN_REG_ID_DUMMY4          9
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET11    10
>>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET12    11
>>>> +
>>>> +#define _REG_ID(n) ((RTD1625_RSTN_REG_ID_ ## n) << 5)
>>>> +
>>>
>>> Not a binding.
>>>
>>>> +#define RTD1625_CRT_RSTN_MISC      (_REG_ID(SOFT_RESET1) | 0)
>>>> +#define RTD1625_CRT_RSTN_DIP       (_REG_ID(SOFT_RESET1) | 2)
>>>> +#define RTD1625_CRT_RSTN_GSPI      (_REG_ID(SOFT_RESET1) | 4)
>>>
>>> None of these are really bindings. Register offsets is hardware data, not a
>>> binding.
>>>
>>> Drop all of this above and further - actually nothing in this header look like a
>>> binding, since you called these "REG".
>>>
>>> Best regards,
>>> Krzysztof
>> 
>> The defines in this header are NOT register offsets. They encode "Bank ID+ Bit
>> Position" for use in Device Tree.
>
> Bit position as in register bit position? That's still not a binding.
>
>
>>
>> Agreed, The naming with "REG_ID" is misleading. I will improve naming all reset
>> IDs in v5.
>
> No, all are to be dropped or renamed to standard IDs (incremented by one
> from 0 or 1).
>
> Best regards,
> Krzysztof

Hi Krzysztof,
 
Understood. I will redesign as follows:
 
1. Binding header: Sequential IDs (0, 1, 2, ...) without hardware details.
2. Driver: Internal mapping table to convert IDs to register/bit positions.
3. DT: Uses abstract IDs from binding header.

Regards,
Yu-Chun

