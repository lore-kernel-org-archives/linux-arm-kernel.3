Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21394F8FA8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mjuJmdvwe7PzDVz8q3vHSG4MYXWlbBcdt3fOBIwOXE=; b=lWEk0dEit8ts3RBhaVKJlafiar
	Dly8goNPXt5FEDfx6zRQDhvp5XtbLPgBX3qcbixPnppYhVQuCO2ba3uc5MVuW8OOV8VvfNLbKvgul
	QClY+lB5vnzSMJ7ltFRe+d89N8nLpcg5IYmWSGmVBt47UXdq+GwecNYuItoVjjTkdBJr2yIV+lgXs
	Y0LKVTsXgEvgI3pryffP6vg5lvyl/TXpa75QfX7A2NLTQzLwhUC5wL2XNg4JETTYv/iJKvmFZIlvR
	RpayoG+uH3q7srJmhqJa/decVOLP7c1tpZ3ALh3jWJ1puIMA3OIB4sHBj/8gYWdj5a0Lyq2Iw14Ll
	KXryjvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCY0-00000008nUp-12T6;
	Tue, 21 Apr 2026 14:57:56 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCXx-00000008nUO-12wf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:57:54 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so2138954b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776783472; x=1777388272; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mjuJmdvwe7PzDVz8q3vHSG4MYXWlbBcdt3fOBIwOXE=;
        b=dYdApZeY/wzj2TSH1/Clj2pq4kackj6tzn63aId/Ei4GjffOuY6+eMnbRKHLwM21/2
         upSprtnu8VschKRpUxJpQ/TrshVoSMvf7X/T1pRqvhxANFpdhBkzx8XchOU/EU410gdc
         ujd5tTDVXQnR8cJuQp8WNMW3hAxZMMrsFZkxUn7Q5pf6ntJm2ffETpH/oPMKiI3PW5W1
         C9u3BriiKTkqLcblqpKLs5hAawqnaB3m2to/43ZLEcL5LUEOJ2hCZbhaIKtWnLpSq7Bs
         ZOPDOc0SyjWBwE8pnAr4lPvqEDedzN5WVJQtEV8aX4Ykgf3yX3dAKkksaW5R0buuvG4g
         gZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776783472; x=1777388272;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mjuJmdvwe7PzDVz8q3vHSG4MYXWlbBcdt3fOBIwOXE=;
        b=oj3PFwthvial8b5saGwcJseMLZNiWUq+P31HcEYnSg4lpWT8l6gzSpnhJkWyQLW+Mo
         s0i/7YcpxgxXjtVGasG5j4urjE8vv54+8/WOPQpTeyJChx+OacTlwcD4KxwjoNvnevpM
         IGzZOc+XJaQw5NLD70sfDDdfkQCDs4vFImcTFHkJE74Gz4MvM8MnyQcPO+Q3rOLqZiT7
         8+U+hiFStrZWTafxpvijEbMOE+t/bPIRbOykuZ6+L+bsBazuN+ERRn7KIg8gZcHaptjw
         kS/5Y4OqPj0bUU+nmAq1hefjx5KbZ4EgEMT7XbtlFFeJcluWNio415GW7pojiRFoAWz8
         P4Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/Hs9ZVZKhY0qJfLiwfLVmFGbfZwfV8I2qVMTn05Mts36el7ScsPeUxq+A5KxKepu3eiMzUSYht6evfYGQmGZpE@lists.infradead.org
X-Gm-Message-State: AOJu0YzaokzezXcBffGjQ2Wi+Ef6LpJiVTC5FNgFaSL/olrWDoZCFtei
	GZexquOvvcgH9/9gA6HKSRwUq31WgU1A+3oUDo+yu+dkiGUAHenU6af+ZMRhLPJoJ44=
X-Gm-Gg: AeBDiesUVSa8/nFoVe8vdSJMKHfvW1nKDkd4NlOWkUgDnMWgLv4IlYC4B2p4lZ63ttZ
	NqWb92NDMUSfFBhnZKRNQb71Fil7CkxvAOcEFDvD872L/wRgzYG+Jk/3WIhetKvBA2fp0S0vV1n
	Ys851tXgeswbOEIYglUKz58nXSClf6IymUtqEydO27f87LjEOIwVCQLj++F0z1BCwqs8XUt1OcG
	l2T2WaAFOLVxbFek753XYOwP4tPhcZwmJUTX0DytvCqHct4OPQcmyv1WFNSQ4rk9CRdxfV3b6Yq
	r3Qoz5+JM8iyJgmTMRZyKv8LmeaDY1IIHlG3ICrtJxRdABG6Y8T3ATdAXew7V9eB8Wj0+DlQz44
	OSzo4fUSigHVpJIiC18Tf6G8ts09obbc2S7JvOxQYqzNdSsMYT20+LIWNNgRmS7gHbJZktSMDqh
	ZGkdiFmxbqnahaxyh+HwYsZWHJ5eD6Ew==
X-Received: by 2002:a05:6a00:3c86:b0:81f:40e5:34c2 with SMTP id d2e1a72fcca58-82f8c8bee9dmr18805718b3a.32.1776783472262;
        Tue, 21 Apr 2026 07:57:52 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819fesm14280551b3a.4.2026.04.21.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:57:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: power: Add power-domains-child-ids
 property
In-Reply-To: <20260421134949.GA1045294-robh@kernel.org>
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
 <20260420-topic-lpm-pmdomain-child-ids-v3-1-c2c40bef238c@baylibre.com>
 <20260421134949.GA1045294-robh@kernel.org>
Date: Tue, 21 Apr 2026 07:57:51 -0700
Message-ID: <7hh5p4qs28.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_075753_307616_33BB9ABF 
X-CRM114-Status: GOOD (  12.65  )
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

Rob Herring <robh@kernel.org> writes:

> On Mon, Apr 20, 2026 at 04:51:17PM -0700, Kevin Hilman (TI) wrote:
>> Add binding documentation for the new power-domains-child-ids property,
>> which works in conjunction with the existing power-domains property to
>> establish parent-child relationships between a multi-domain power domain
>> provider and external parent domains.
>> 
>> Each element in the uint32 array identifies the child domain
>> ID (index) within the provider that should be made a child domain of
>> the corresponding phandle entry in power-domains. The two arrays must
>> have the same number of elements.
>> 
>> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>
> Missing my Reviewed-by.

Oops, I thought I had grabbed it with b4, but I didn't.  Sorry.

Kevin

