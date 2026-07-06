Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=; b=brDSIeJmsmEwr++xVC3ci1McDW
	Zz/5tVt4G7IRFBqGLnjLtEu0j3+I0RVTLdO3zMdL07vGPkM7BvzJDtCAlEOuiLuniiIRmzmHGiscA
	Mm13KYXVBHXWYiVxc12i6Ji292yTWBAV3AACpF8tShFUr3GVX+99wiT0WZeLjkjpoLr620a7Js+GQ
	rOCR5L4MSM4bJIN5VAInQJCeGSJGnnXuUU8HLiJerASafjvhccof6fSSFO1TsUqDpNAvLyyOlgKUk
	V1bLWShOBKXTpKThHIJN00v7hgzndCINoPHQcN8vOfQ2ENaOiCB5zLQddQxsk9g2Oq/rZMUDv5L3u
	A7Ac9cgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfRV-0000000BzUd-1xmc;
	Mon, 06 Jul 2026 09:16:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfRR-0000000BzT8-42xP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:16:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493c83474ddso25619395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783329400; x=1783934200; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=;
        b=MFcNzh/ENBSTkQX4v6nAOiD6DMdUmjtrbCFovvvxeEfb6qjAP+7VPiDTc4dfoDIaHA
         PZjF2hnZFieIhoqGmSiNSY7LI5U1zw2UU3UfFvICMv2xNeGokjAy0cBiVwcZg7hQozeH
         gGoNsyZtjo5qFqmzJ1kJ1+jYrfHaiM2FQvDLnghm6nfctKs5WeFXOO/86kFFGQW4/X5D
         avFyLm05VWJ5UWYXorvyvonzeIDgS+aGOqaRs5NszWrXXfknNX1UUhmh7FD0Mzss8UDG
         BW/jGcw/CYkIPQlzMUHhAKelX3H5vhOrPOFxP2EejvbnjMe7biWnRJUUbzcE81hFQfcl
         eQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329400; x=1783934200;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=;
        b=dHS143cz2Gg9XDgkNmdQ6++YflQxQCJRpOMBxHzdHAMYYme6/wKOAZDx/mWnWJbf43
         ZPSWo6x1dGXGGyj9BxydEfmqo+exbtx2ZpJlMoJ85yrvElpJwOG6AtXLreJo5PbbRmKN
         Huv3Cq51Jhk/MNNvtKuhJhbXQqqngIkAuoDoz46KTXlTnaR92GA8Oy7kVeibnewxfHOC
         W3A6adsUHeuC/onJdm7AAi8YTFcVV4xBni/j1ux5wqGzMOIdOD2f9hSbjET73sBMQq2R
         bZfJpGXYsHCD4tz7i2jfpMVM+sxJfxXad6HocJloIsja9ekZhpBYIxvmq2d1Zxv3vgrW
         J1Ew==
X-Forwarded-Encrypted: i=1; AHgh+RpyPoj1YK1Kn2JYidIXrdXbk9RZbg73FkD8R1aBbXw/3TY33Zvs0rxDTV3an1xFV31zqRyyVqokFCuKT8n/ZzVk@lists.infradead.org
X-Gm-Message-State: AOJu0YxgnQOF81ZWFkj4vP8iNnoNo3tA5F8jIWfuutxWl3Ha0Cpvzsmf
	g0XfzuI5KrktB2D0lBQwD7HjD8N7EhmvTBxCOMbBDF52s8SHXwIO7nfkqlk4a/gyakA=
X-Gm-Gg: AfdE7ckEprGqoP5/wOUzV8/GIqkQAFJnj0skLpSBZRbdefnUqx2RtuXZw1zreuLBaBq
	zsxUks/wOEKO8Vi7BY5GOdVVIKNLoK0+BHaohvfESIUVoJrH3dM62xGiyGxghfgT7eK7c2aEpbZ
	MOFYEuQaxAUbnzQ1blFaay1M7Xxka12ZsN/QNBlyz6iyjTdhhzmoDbMXYSwnIOCcLWevegZ4m4+
	jO7vi/jTQGqlJK0dofWIuJvRb9IE29dHAKW6aJUJuHV6woInDPI3oNzMlfduYGQm3+aPf3Sp30C
	2eAu29uA0VltDFy/v+KWf+zvmRTCyVoJVA8ASLogyW4E+dcG9TxGS7GYC8hWdYkk3NfEL9AS4xV
	xek5RHu/lSCX5czHonQM0m6vIVI6L7PBUQTdXe6W+ZZ1fTd3hcvMhQME9ClsPaGiiU+UTUGLCo4
	lo3g/O2iN9JmY=
X-Received: by 2002:a05:600c:3551:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-493d11fb8a4mr101976925e9.35.1783329399663;
        Mon, 06 Jul 2026 02:16:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6381e4fsm412373525e9.8.2026.07.06.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:16:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-rtc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 4 Jul 2026 16:25:07 +0800")
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
	<20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
	<CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 06 Jul 2026 11:16:37 +0200
Message-ID: <1j1pdgiikq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_021642_298722_21D7CDFD 
X-CRM114-Status: GOOD (  12.52  )
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

On sam. 04 juil. 2026 at 16:25, Chen-Yu Tsai <wens@kernel.org> wrote:

>>
>>  extern const struct clk_ops ccu_div_ops;
>> +extern const struct clk_ops ccu_rodiv_ops;
>>
>>  #endif /* _CCU_DIV_H_ */
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
>> index 766f27cff748..e2d6833a6d33 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.c
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
>> @@ -68,13 +68,14 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
>>  }
>>  EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
>>
>> -static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>>                                             struct ccu_mux_internal *cm,
>>                                             int parent_index,
>>                                             unsigned long parent_rate)
>>  {
>>         return parent_rate * ccu_mux_get_prediv(common, cm, parent_index);
>>  }
>> +EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_unapply_prediv, "SUNXI_CCU");
>
> This does not need to be exported since all the base clocks build into
> one module. And maybe it shouldn't as we probably don't want individual
> clock drivers implementing ops.

Indeed, I'll add a patch to remove the export of
ccu_mux_helper_apply_prediv() as well, for consistency. It does not
appear to used out of that module either.

>
>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>

-- 
Jerome

