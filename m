Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B797CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 22:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I59lx++Tx+ZboAPSBm8Z9Aq9d7rn9DeuhAfPTw4RUyo=; b=xb6poTvPQLcZJ3/gLZDgunuLj/
	R7jyqxQBAepVi2Cl9MpDSErWwLMvYWZZjsj6Jmt0XGm0GLP3Gda399w5wHBCBB8GacdOh4aFBBfGA
	UAOdHTBfwBiFvNMwZKGATuALKeh6RgFjQuFPc/1HZFU6UiEUHFa4Dr6PkgdzJI72qJi3T1mtW9CIw
	t2Qnv1Oxe0iJiu/HL23CEvIjvCEQ2LNwwBBtss8yHQq0NI1tQEku61R1S4454XsF8JXAzavwQb4Do
	hUfzq4K6EiYVk6UjB/lHloizq/8OboyHIP5DOeAQgxybdOEfsu19CB0GBq4vqVzdAX1Jo2RnJlpky
	HqanMxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pHs-0000000Bf6t-3e6a;
	Mon, 22 Sep 2025 22:45:36 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pHq-0000000Bf6W-237y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 22:45:35 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4bb7209ec97so111771cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 15:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758581132; x=1759185932; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I59lx++Tx+ZboAPSBm8Z9Aq9d7rn9DeuhAfPTw4RUyo=;
        b=bmC8eSy2VGHjLpqBgJuvAXf2vyMmwRt3f7HcXEzhUwEN+kfXvXdt/tWtmROOHXe9dk
         NmWRGmwyx+1s7cS0HHAH73gT5mRX7ccMGs0TybonpPENyy/99OxlmDRVuUUZ9Ih6NmqS
         njPP5U6ommnnqxMb02lSlwNsL6NOc+YeZDP4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581132; x=1759185932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I59lx++Tx+ZboAPSBm8Z9Aq9d7rn9DeuhAfPTw4RUyo=;
        b=vZUFjnmG12PTArzICoLOOi/zVE43b+9r2jwJmKN3jn/pmqrBby8VcLYglTn2m36e/f
         oaYtTfNog18mBa2QJjQGuhSkCNe7ZcOzHn1lmOVwU78CZpjyBinOf8fwRS4mVDrgz/Jn
         WY2+itrgyxMJ97X7ru4ZAtmhuYzzWHzKBEmqt4gfKgRshjSu5ifSvvnBVMyxoiBbpnIB
         keuXDwA4v1lNBBZOMlgkVnyArKWvS9dGClOaPzqTyseScSt2NQUNrH4zPhhvLkd1KsM8
         f9NjuyR2mWIn5TjDvfhM5TVxyLHiQUCzVfwj+oiNQWbE9VNqQPaI/mYll6OGfcU2uxTB
         0IFA==
X-Forwarded-Encrypted: i=1; AJvYcCXaOPpGHbZWOeKvcZwbG3bTe7VPK5kmiWy7yVw4m4LUhKmoi28bKYe2XjhUTGjiLRhiGe5YJTdoTA52uR8V6h4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzNIASVUMW9i85FY03NismObunfikby/tBhfJApVtRY8IjIb+HF
	dVxee+zwdedaEhgmMp3POhXILA73znN5gADr5tNNnv7Nj1pdbS0ag1EBSQA1d4Y0ShGZq4a6JOp
	FJHIkVOAQ5RqZG6BB560z+JpBXe70E5FOuP7Kyzsf
X-Gm-Gg: ASbGnctm0QhikOmtuqczIfcsxtGGwSWFH1oIxEG4hY5ccFWRJ3I52iMWPznDVthK9oH
	+meuV5llBOPpUpzgVCXx0bQM6G6H9PCtYygVBc7QYshiQ3g19SpUM1KToz+TbOxhcHkmzsfOGcz
	WfM7ePoiGqzpxsgNZyyAd0FJSlpKsGs+sdCSgEB77Acl9NC4bFYWRHKYbtG2cKfIzpq753M5rM4
	PT+
X-Google-Smtp-Source: AGHT+IEEHjj+wsiT1bNCpHBT5Mi+r8GATT0+bhUw8kMDnXciBxiK/CjOVLMPqzXvLsmITsSiS2BY9rY1zKy2QnMzLjo=
X-Received: by 2002:ac8:5903:0:b0:4cf:dc5c:8c76 with SMTP id
 d75a77b69052e-4d36ab2866fmr1207671cf.11.1758581132096; Mon, 22 Sep 2025
 15:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com> <20250922-b4-ddr-bindings-v7-1-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-1-b3dd20e54db6@gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 22 Sep 2025 15:45:19 -0700
X-Gm-Features: AS18NWDpJeoFHhQc83aqhmhoSwFRisU770ZW4iy7Do1FLF-ntGplzcw3QSX4Lyg
Message-ID: <CAODwPW_oDTh9FdnLq7w2FPQv68ReAUUpssqEktUH5zhewbfcxg@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_154534_555681_1D2A01CC 
X-CRM114-Status: UNSURE (   6.69  )
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

> +      lpddrX,YY,ZZZZ or ddrX-YYYY,AAAA...,ZZ where X, Y, and Z are in lower

It looks like you accidentally changed `lpddrX-YY,ZZZZ` to `lpddrX,YY,ZZZZ`?

