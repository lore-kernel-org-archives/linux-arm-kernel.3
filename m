Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E612CCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXHkdfv5tUm0CpyurnPpmySUCFcyGseszzZdpVNrQUA=; b=pHSPOm7Qo0Lb07KzqqlN8OZ3eB
	eKYIXUe8QtUmqVJEyIEvnh4joKMGG50HMbwnuQadxSI8+jt7oYwaQL8Fq2CGbSOq/LCVGysfOLrhq
	Fm7QibEtctFcgFCQs2oUU7DB7iYXIMVCjz04Yj/QprynhaE8FZr+MhtxkAzzlOPlsR87Ilp25pTZq
	vTxFFZ7Y7YKbQDFloosOcsmSeSzVy/RZQVQpgA6hAXNOE00yaYRgBYT7J0cHVIPdDuN9Faky6dtBM
	6AJ54P7oNHPH1H9G6Vgvqo+9aMb80W21C4J011LJcrlfJTCq4z7NfmimUhyay4qfv5mYj4ck2vNLt
	D+mZy7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mwo-00000005efo-2Ra5;
	Thu, 09 Oct 2025 09:28:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mwk-00000005eeo-2lgv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760002104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXHkdfv5tUm0CpyurnPpmySUCFcyGseszzZdpVNrQUA=;
	b=I/mejTVLwyHu4siBdvmC3pX+l5zwJg1Juufmb/ysGHQEaXOFS894y3fqj8fM8IPkOZr1Vc
	49PzrYZxrHPNzP1BlQvT00mGR03GYZbYXf8ekvdBIqu0+d3xa2STtiAvgLr1TC1XZs4BAO
	Z0dh4fW7Ga5WNBeRvDCbqHqT+oPKDa4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-btnL1LtjNtGGEwQZI0oswg-1; Thu, 09 Oct 2025 05:28:23 -0400
X-MC-Unique: btnL1LtjNtGGEwQZI0oswg-1
X-Mimecast-MFC-AGG-ID: btnL1LtjNtGGEwQZI0oswg_1760002102
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e35baddc1so8848295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002102; x=1760606902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXHkdfv5tUm0CpyurnPpmySUCFcyGseszzZdpVNrQUA=;
        b=r/tWNSOJAZ2DConCWwVzokv04/jW8GUK1MuCVKBKdS+23mf2YZNTj1fIxCo2oqlJbL
         Y9FBlvZD3gMM4/tFwD3/Q6dxEOO4DNYn6lxGCys9qf0KRtB8UOh2euTkaynGDmp53Bpy
         gb4NBX5x1axJr1/UICz1EH5n2n+rpG+B/HPLy2JPxvdT5u+dUkKYK3KueemED8UCcFWE
         v+bnoGppOK06WmhxlL0mlRzA4S0kPZLegwsYHah/YBgkcEaJ/cK3biamAKUn2oNfViex
         GJn6JE4T26AhNq3PDk+m21aJWBE6fbnVW9ZVgP4qoTB06Oih7ktaz5s6DiZKvG2aqNP2
         /3Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU3fUAoFSMlvlWzc2w7lJQWAPARiy1eY3z1qa30O7zcGYbiEPHCEEYQl74yt8u0fwEiPs+5UFT6d/mAWegmyd7H@lists.infradead.org
X-Gm-Message-State: AOJu0YymKu6bxr7nfhuEkIOwIpDG8xF9mqrh3ANcmn/uf2L8ksNGhmbl
	jCpmsYcybAMSceRVepk0lL4Kdh7tm8/OMoiDDdZwUfT0eV6Hr4oD5Tk3F57oThM0Pvu54jTe9Fe
	N9Nowy8AwERNEHSS2EQWMqrhWmleHWfiAlDHt55iTfSZ6NYhnLWjwnI//falaG/9IzioX+KQvtE
	js
X-Gm-Gg: ASbGncsKM5kZ9+FmzhfEIgP42sIxC+rlsqiWb9bvldUSI5I4bijwX4GUeXsLlpEtEWR
	Qq4YP4cN0e11j0Pc6qnuSisqw2MLW0OgYGFCG1KjkEusQKVxf8MOv6rwbrUhZ5cLNtGwiGr25L2
	JdOl68AdyFKVgeD+9k76IKGIfeJuThhlV69ZuU4qsX7IXc0lp3KVuLtL47kzFndyNqsCSWrysNx
	iY6iTyoHz8ZXnauK0GCsbGK+WXr0BdPLIZWkS1qha55OZ7iSPEO4wi4ayckfeHI/l3QjOf6f012
	PyhOT65WfkpMCGtIXq+3I/gPku08Azyh2+nZn/hOEhmdasqmBAXtMI1aWddyRm9zvCaX5+USvju
	XxNT7cb4KDG2bHtK00A==
X-Received: by 2002:a05:600c:4e01:b0:46e:6a6a:5cec with SMTP id 5b1f17b1804b1-46fa9a8e5e9mr45746255e9.2.1760002101713;
        Thu, 09 Oct 2025 02:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY3/Xon/8eow6YV6te1PVIUeQNsTPhTN4xL/Kc6c75ZTtzIKnnqNPMPgFzo3E/3FgK5+ApKg==
X-Received: by 2002:a05:600c:4e01:b0:46e:6a6a:5cec with SMTP id 5b1f17b1804b1-46fa9a8e5e9mr45746105e9.2.1760002101274;
        Thu, 09 Oct 2025 02:28:21 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d7f91esm75339585e9.20.2025.10.09.02.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:28:20 -0700 (PDT)
Message-ID: <3184d938-5100-43f8-93e8-f88549ea4b72@redhat.com>
Date: Thu, 9 Oct 2025 11:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ws4-TMapH12tR-TF4gqkvrEcJBsaKERBDDmZRlqNSeY_1760002102
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_022826_794183_418F3357 
X-CRM114-Status: GOOD (  15.66  )
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

On 10/8/25 10:17 AM, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - Fix the power-domains property in DT bindings
> - Rework the DT bindings example
> - Drop the DTS patch, it will go upstream separately
> - Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

## Form letter - net-next-closed

The merge window for v6.18 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after October 12th.

RFC patches sent for review only are obviously welcome at any time.
---
Also please specify the target tree in the subj prefix ('net-next') when
re-posting and possibly additionally CC Russell King for awareness,
since he is doing a lot of work on stmmac.

Thanks,

Paolo


