Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26914D75BD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hREuEO5bVK0P8afBUPbQKjHm3+nA0mzaIkZSOu2Ro4=; b=J9JyzNVF8kENHXerKJsxfN9GYz
	qutOn1IK6fCx3kqea1NZjThm+F9IXWCwwBEuHL+F/QdKzpCs37EV1EZx6j487i0pl5aiBegFu9s/v
	o5kskN1B3hYTScB5zcjKSrf9nZuLp3asJBNkLFRzWA2yNBjAm4A6pzjjmokpx/rPS7N7RBfDvRAL3
	fvIngL5sNGCCopt0eRpOVcE3IrfSfy2Z/YdVTFXSwn9R+2nwjPC+ngy/hcucqxXhdfL3BhCCz/cO1
	5lw7vYMBujEXQqGPwk2stdFn/32cq3kXpd5ChaLHZF+evxF1MTkb32MbWCtVzr8+d8aZeUpu6slTq
	pz5kFJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2cf-0000000H6SH-2BW7;
	Thu, 21 Nov 2024 08:33:09 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2bj-0000000H6Lr-2Irs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 08:32:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso97517266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 00:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732177929; x=1732782729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1hREuEO5bVK0P8afBUPbQKjHm3+nA0mzaIkZSOu2Ro4=;
        b=pHyKZw6AuZoHEqmtQLga/4cOw+Y+NxJMr6XfQS2zCKDgWcI5bGMae+W7xdQ82qwPDK
         snZYZhtEw3P89z0JYRafmsEZUcXTjHjgv4+49Ar5Eb6bLI0sJ1BzqjAP4uaXEAdMBPWQ
         Wh2tEY42lka85BxlsGj9sZaarlgq83Pjhs4dj5CPM1tmuRkIDOj2xdDRgxAF2aG+bDw9
         D+/2SOkLq1cc/3pJ2zQ641QHomNQd7vdUBttkIkqtviHUZVg9lPYk2VNvWibgZImBze9
         +zI0M2rDWd/Psu0B7E+SddZHtATtoXF0wrQggP4QJ0MHhuTCtg3w2oRKhconCDbZG7E/
         1+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732177929; x=1732782729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hREuEO5bVK0P8afBUPbQKjHm3+nA0mzaIkZSOu2Ro4=;
        b=pcQwu9nhnF8ugn+GwL7sOZIoYpWaj88Ze7a2ZWBUq5+mRo72ECHNcRibDLQ7ojTocZ
         9sb4wivb0SJjjXJ1TiKR3StjN+zf+8qpkWPg1Jt0+DLH1wkA3t53cKhMGRnr0y4JvyFb
         qGKIblY983S8C4xWuD9sKPiMjsAI1kW0Yz+SP9rKu35CoAdt1LzXlA2MCPi9lnw4Sp42
         vjGyY+9xKJiGqTtS7/uKwvpG76V1v3HsopLhY1NO81HGXgRle8za4lqeyLwWB/hIF7i+
         8NLFAwAGx1sMIbN+vXfu8DYJtTaycnZMc3yZs6GNG1ekBDdPsXdq5yOE75+e8zVx1ejs
         lckQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFTXfh+G472TrOcVuwG/1sUO427w0nWiP7HjOG7gYfJpImQMNUU/RaksE61CHZzNUvUSe/zpsewiAm73BROqZp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt3DhKMZc62Zib3Hhjqgc9+5VCTrCU462YnXwvWw0oVWKSDTLP
	/pw7hxnMWGEz7RtBG185kjAgZAqyc0ue/P60gushItpnsRTedxIEOF0l/j5TUg==
X-Google-Smtp-Source: AGHT+IE4TKd5wDKmvQpBdEEu/xfgGiIKA3cuRbSFfnFXGKnL4yHVKF2Vc8v1y9VFoin4Md85lL2nLw==
X-Received: by 2002:a17:907:86ac:b0:a9e:670e:38bc with SMTP id a640c23a62f3a-aa4dd52fd73mr593858266b.3.1732177928228;
        Thu, 21 Nov 2024 00:32:08 -0800 (PST)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f431a7absm52035166b.143.2024.11.21.00.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 00:32:07 -0800 (PST)
Date: Thu, 21 Nov 2024 08:32:05 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Subject: Re: [PATCH v1 10/12] KVM: arm64: Calculate cptr_el2 traps on
 activating traps
Message-ID: <Zz7wBU3BHW-XNnbr@google.com>
References: <20241120105254.2842020-1-tabba@google.com>
 <20241120105254.2842020-11-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120105254.2842020-11-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_003211_586990_1D366953 
X-CRM114-Status: UNSURE (   8.60  )
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

Hi Fuad,

On Wednesday 20 Nov 2024 at 10:52:52 (+0000), Fuad Tabba wrote:
> -static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm *kvm = vcpu->kvm;
> -	u64 val = vcpu->arch.cptr_el2;
> -
> -	if (!has_hvhe()) {
> -		val |= CPTR_NVHE_EL2_RES1;
> -		val &= ~(CPTR_NVHE_EL2_RES0);
> -	}

To be on the safe side, should keep the RES1 stuff for nVHE?

Thanks,
Quentin

