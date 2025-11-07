Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 18:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVJ2xtJlmj5EezO+VKSHrAcAYjS9yDJNYT/T6/c6kPg=; b=KtF+R3LGEenz9LRklE7RrO7vjh
	6qKO5wiWMasMVVhFaniPM48Ep7Jv8UvCNkbiDUInyOQoN8BpALMwhe1GzhAN7Zmv4QB89v+gg7Kgw
	tBMRYIC8FVNjTcntNOffWKeX0comtDXBW1IgK687qnvWt1s9VoHxL/ylIG4S6u8Ly+SXKbb0yiiBx
	JJ1qy0YrcvE8eetTxar9RfvXpZ/pWfvZHhsNc/h0+SMnD2PHXBzBErNw0LCHAh8ozzdw1W4/arHPW
	GKduLLIS0HW3kzWW3coQbpQxZsnpsmjXtHGjiVCXYG5k+PuWGR8fRgO0Y0+GRQNtOGNc5YTsf1svy
	4rlHrhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHR0b-00000000RG6-1DxR;
	Fri, 07 Nov 2025 18:16:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHR0Y-00000000REp-336u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 18:16:24 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-429bf011e6cso1044497f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 10:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762539381; x=1763144181; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tVJ2xtJlmj5EezO+VKSHrAcAYjS9yDJNYT/T6/c6kPg=;
        b=Wv5pGvHUuhMcnON3UGxHZzkvB25ax81aHENI0sCP7bPweJDgfH7GNUKn+m4AqFP2HD
         +fNS6GafhPV0qK4U5+qILUFc3Bi1s3lOIg+pYE/s3L9+h4OnnCGauqdLd7OLBofQLz5E
         9jL3vSRPzw1+KUJ11cHzFtjhXQ+1XLaHYtdNzxxSsajr1IDGraWmrCfgzWKDsWRUHD5Y
         V1xmNGQgaeHA1o64k45v450fA/pIEVvqXdVoUBgoaG82DJmdxX9hy4qX37RFIKdWAh2I
         vOfi4qvAdLhnyRT7VaJPPl9PtLg+j7DE/Uc9mniYadD1GjkCxRrNJ976sla4jv8QIEhk
         gdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762539381; x=1763144181;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVJ2xtJlmj5EezO+VKSHrAcAYjS9yDJNYT/T6/c6kPg=;
        b=b2n7wZIRplE/pfN7SJmT9/Gia4PO/qtR57H1AYfmUXZnMB7ppK8X+8n0smvxuLPgqX
         5ZhrhcNBHQidCTSsyhVlxwZ8Gn6Rzo6QV1Zmc+5FEigqOzGFBTusxubbtetHg6bi0p96
         R8xNOOwdgLAQqqfQAtKmJOxqOHkZCRV2YmqqGAvpTnqxI3RD8I+jg9gMfOFYh3XRcib8
         JYUECvrLXJGmOI1eZqwDe585w3YC+L9klb5d7FVwT/I4+xZfWht23gyUdBOR7MtxgfJ4
         hodihmFG2Pp67yepT7s+lQRNPVdPP6efN1lQYAFgjN/UP5yri2W3E0/6HTR/B20OBekh
         4sCw==
X-Forwarded-Encrypted: i=1; AJvYcCVMbh5XzaXGcCsQsGoHBSn7HLcxQjc92Iijbz+t3963sAXjiYq0Hys3A8IwQmc0kh9P/AaUnTzVze9cQavhztzv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2MSTcPaPT4MDAaJHBMYLue8wy5iI9yz/stEXoxLoxwZAkjrKc
	iB3FYxCy7+gWIe7Rsz/MDfuryO7PAlM8cRng6BDwEKajd4aGqP12Oa8+bMTLJA==
X-Gm-Gg: ASbGnctEFCJFaPP50hFi5hp6BvINLEifF9oYfNA5TD2SNWtXKF8FJ/A9mC6hs0ZKz6P
	b0oFkN+X2iWYDvrsZcNEAZOwUgLTUT5Fx/DA+yN7zCAUklig6F5gyU2q7HYes5/tptu1rBYClBn
	5KTy+v/fD9tmv16WeP6uO0bhPmZo5f1wWyO8qCvW2E5kcgvRWDkAL6ke2ct8Y4mi6ZU2iWF62Lh
	csJrfCiRMjgWRVbnuzJstaxqL52MeMMIh9CfVK61hHkW2AlSydcskt2OswsCzR7a6F14JjSKqVP
	YoI20WQZ2HuqaXu5SBNxtOTp9rnvFHnMUPRucjfw+Ik7xkmT8rICBvUSHlpw2ccHo728490/T2+
	S8j3WoTCprM8m+E7pwp4hxp9b9nynazW21rrLTHW0oHJIXRPrAEUlH7vydQJ2mQOkyOOqt5yOoO
	BwfDHcFRH0QGLe78XcpJtLpBcGopMUfbBXiZji4t4=
X-Google-Smtp-Source: AGHT+IEp8RA70w6dQWLu5Sj+5AV/4tZ1eqge9CXFqZ79B7Chsq8jWBSCViddS2yq0HyDzJ/vWl+q5Q==
X-Received: by 2002:a05:6000:25c3:b0:429:c851:69ab with SMTP id ffacd0b85a97d-42ae5af4abemr3058281f8f.55.1762539380754;
        Fri, 07 Nov 2025 10:16:20 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm8032998f8f.44.2025.11.07.10.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 10:16:20 -0800 (PST)
Message-ID: <690e3774.5d0a0220.2246e9.71a5@mx.google.com>
X-Google-Original-Message-ID: <aQ43cbO7Lu_IBJek@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 19:16:17 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: Add bindings for Airoha SCU
 Serdes lines
References: <20251107160251.2307088-1-ansuelsmth@gmail.com>
 <20251107160251.2307088-2-ansuelsmth@gmail.com>
 <20251107-crisping-doable-365d6b7d60a6@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-crisping-doable-365d6b7d60a6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_101622_802422_3FF19EBD 
X-CRM114-Status: GOOD (  21.13  )
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

On Fri, Nov 07, 2025 at 06:14:31PM +0000, Conor Dooley wrote:
> On Fri, Nov 07, 2025 at 05:02:43PM +0100, Christian Marangi wrote:
> > The Airoha AN7581 SoC can configure the SCU serdes lines for multiple
> > purpose. For example the Serdes for the USB1 port can be both
> > used for USB 3.0 operation or for Ethernet. Or the USB2 serdes can both
> > used for USB 3.0 operation or for PCIe.
> > 
> > The PCIe Serdes can be both used for PCIe operation or for Ethernet.
> > 
> > Add bindings to permit correct reference of the different ports in DT,
> > mostly to differentiate the different supported modes internally to the
> > drivers.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  include/dt-bindings/soc/airoha,scu-ssr.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h
> > 
> > diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
> > new file mode 100644
> > index 000000000000..a14cef465dad
> > --- /dev/null
> > +++ b/include/dt-bindings/soc/airoha,scu-ssr.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +
> > +#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
> > +#define __DT_BINDINGS_AIROHA_SCU_SSR_H
> > +
> > +#define AIROHA_SCU_SERDES_PCIE1		0
> > +#define AIROHA_SCU_SERDES_PCIE2		1
> > +#define AIROHA_SCU_SERDES_USB1		0
> > +#define AIROHA_SCU_SERDES_USB2		1
> 
> I'm going to assume that 01 01 is correct here.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Yes the value are then translated in the driver internally.

-- 
	Ansuel

