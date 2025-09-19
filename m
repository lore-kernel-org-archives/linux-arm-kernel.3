Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E20ECAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3uHcZporxbBE1WPZdYvszS55+oRtlQmqDOxaEQ2fa8=; b=W+sO5aAkSm1Q8JptHogMrNZaXz
	nIlVs+DczZcRD5I6Ljl1aQdId0Sbr+vcpFChLDGSlQe5rzTF4BhYFVwJ55oQ02V6Zo0XvwHouNtJJ
	wRBHRZQ3V3h/WCWHYNI3DztO5THWXpeT91SgzcFqZau5R+h9kFNytUHroBFNvCFvQgLhDTlYVZclh
	i/H5rWB1T/YgpXHpCxj4ThSvD17xhg623Vxw+Ivxy6HriTeBLVzY2TNNzyM2XhjwWTWMM1R4ytLs0
	BQ3XTVDbrAujm5elwBKxeDrYB3hH+i1BUVCtxzvbc3YksT1cMg9YqqN5+Ohgg3srdD8m3qSYOy+FV
	PrhVLHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uze1n-00000003X7U-0Wsx;
	Fri, 19 Sep 2025 16:32:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uze1k-00000003X76-1Bs5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:32:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3ec4d6ba0cdso1656942f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758299522; x=1758904322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3uHcZporxbBE1WPZdYvszS55+oRtlQmqDOxaEQ2fa8=;
        b=bkUam7/MDK114ISuDdMjrSIjnkmfWR4eBdwVwkY8uZ1pvbnn9kRwWRoEAR19AHA/IC
         8j/EqaPFhN30qENhq+k3eNXyrJYWZ/mOy1BpjckF86uk63FjyOCTMfloPGxwd2l4sWnZ
         QBJ2QDIme6tm6pJ1YoSLNYoLUNZpYpQdo/jQyjQVcU8CHjWJzuDU47CClCtydnAEyYIo
         R5W9HXFQ4M+dJUekdUgFEgcP4lQOVIlWjoExIug2H1iifd+nKnA3CH6fonzX6RqmFg/J
         6Mv5wqmNcSPtDF1sulLXkiOAwlU80NtdcK9Dr49IvJjQrs0U2/ivfawNLtdw5ZlGAewA
         mwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758299522; x=1758904322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3uHcZporxbBE1WPZdYvszS55+oRtlQmqDOxaEQ2fa8=;
        b=WX7cGkoZShPY4MPYDaBsf/cPUk89GjRE2rfoExUlTyK3RlhLR4HfD4DywRHb9Lgg3H
         WREuI0vJm4lgMZ/raT3ShoRgTZ3WqIqK8jxNeewrOn1iX8S8F3MVMGVGcSUxV+Inb87F
         RBTp73tAYR3Pxj+dRXsQ0Qy75xMK3vqxdodM7PFMaEoSqKkIBaKJ6pdVDq5WA1rWojG3
         3G6ppJBDBDBtX9VHYpzOiKGHkmIP2Q3c2/0iSAYrPctiWTDEuumKoGBR8AOjiBjvPse7
         2QfQNaV7GNHDEnLyd9KarErlpGw854H84VJahWUzX4lsPWhci5+mM1U7482YpFUTulqM
         a0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXDDuya6KtkFBwxQXKLOcTezoZOlGBLkgeiFSL26eULTpSUFyy1gqARmpY05a5gQc+EAkxj12wnnzsXe2by1d6b@lists.infradead.org
X-Gm-Message-State: AOJu0YwskX+W82Puj9pa2kRRQszymcUNbg2//HKTiVk8yxCpIVfZqCn2
	TpRfVx9FL47S7oHw9uAc71610nuofjVFvyTtFcNzJU5MOuXK1Vr7XTnJjxEO10+t+ZM=
X-Gm-Gg: ASbGncuNT1rkG4mL0AsqfAY4FwjSBEwy0ScNQUtkI1EKtIQCaoctpmDBjM5gbyGSNSu
	bXZF27M3spPweiMVmiWh8GibYAEnrAQMYD+jZiuvIEDYWNQEsicLmVH5997dWnel7KV39fpnIj3
	VbMwo4/Xo9NAxb+L9GViQdPoV+t9wrC3p2ZnP2vT38ofP7AZQzvIRpHJx8obk7GcZ50fYmaa7eW
	eEnmmV18MpLite0j1WPlGlTUxKn9BuJ/+Ej76tR3DiNBg07CzwxIYziuWKuhTcsdNJPc4Y3SsGv
	2l8duStKxHQ/2mlPnozL5xJI4+QCQGCS/WSctJhqAenHxK82AyUJLY9WXrgmoXBHfvIeWCJB8CF
	PBjwXjqWpC0apO9aAGqkYFFEUmRki3D+kgsTiKDewx7sC0902wkJoJaaVjPynftlE1ie70hh9Ae
	DWVw==
X-Google-Smtp-Source: AGHT+IFhk+LOiZNH/rRpRXbN6bz0btV5zhKbIxziWw9SsXhSe8tWkBYWko3E7XSIWr2izSKCXzAcxQ==
X-Received: by 2002:a05:6000:1ac9:b0:3e7:1f63:6e7d with SMTP id ffacd0b85a97d-3ee87ac9b1emr4152734f8f.45.1758299522399;
        Fri, 19 Sep 2025 09:32:02 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee0fbfedd6sm8619569f8f.60.2025.09.19.09.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 09:32:01 -0700 (PDT)
Message-ID: <5eb98f0c-ba81-4e7d-9484-d88ba9ec5f86@linaro.org>
Date: Fri, 19 Sep 2025 18:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: timer: exynos4210-mct: Add compatible for
 ARTPEC-9 SoC
To: Ravi Patel <ravi.patel@samsung.com>, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
 krzk@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 ksk4725@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com,
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
 smn1196@coasia.com, shradha.t@samsung.com, swathi.ks@samsung.com,
 kenkim@coasia.com
References: <CGME20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc@epcas5p3.samsung.com>
 <20250917071311.1404-1-ravi.patel@samsung.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250917071311.1404-1-ravi.patel@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_093204_356092_98EC0D4D 
X-CRM114-Status: UNSURE (   9.19  )
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

On 17/09/2025 09:13, Ravi Patel wrote:
> From: SungMin Park <smn1196@coasia.com>
> 
> Add Axis ARTPEC-9 mct compatible to the bindings documentation.
> The design for the timer is reused from previous Samsung SoCs
> like exynos4210 and ARTPEC-8.
> 
> Signed-off-by: SungMin Park <smn1196@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

