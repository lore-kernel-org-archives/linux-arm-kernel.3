Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B73EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdHRAWZU5RvyobFuV6RTA7jKM1EALie4R5bJcqyxVa0=; b=nd1BtyQCxXy1FBhmt9yf3WbcJ4
	MNe6oDIjGfVfcxjkinflJ1mTS5D1OS0YGCbZNYOnsWUgI+jPpTAOkc04bQr5dVWF/ol9E+D71fKnV
	wNBCqkg1w0fK4TZMf2vNep/F3b8QVe2Cd6BQUhKjImzfpNKOPHdliJDuq8flcFa/xwGI8v3o9JWu1
	8XhvY8cg19caJRwrgH0+ZYde1DY/8/M/MG06HBBK49vpq3kSHGMSr0b7uxh5jZbDiBKLacUrWN8F6
	6WDOVeFnVflbavxNV+fzT8IapYg0m9FEP/zNr/9/zOQpJ3DHnun726wQCbXX6He7WfwFG8iN0t3qo
	UboStG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1XW-0000000Bfg3-2iwM;
	Wed, 15 Jan 2025 11:26:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Tx-0000000Bf3C-3Jqp;
	Wed, 15 Jan 2025 11:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NdHRAWZU5RvyobFuV6RTA7jKM1EALie4R5bJcqyxVa0=; b=gf4pB3tZlJh9SByX6mSB8a4CKf
	yGrZ1DkJhEPVi/9tSmcN+j0XCDY+AZvtQj6+2M2buuibbI6oy7O8jvwW3E9gKt9dV+cLM5lqAfTWf
	hmVoo6VNWJU3XBIAhM5XQtZ7RMVWQh1WLooSMUbe7dUlc28MYSO/Stw7IMdROw9wy+v/1zNZywSBz
	rQkEcXLMeHHRvUCCzzq6O1hAYOR8afIEIvJO8Th1IfJ3RcM5wRqTa1RdwKjyZ2PuCOG/6pfTUbKWZ
	D8y6Rgw79WpCE8e+gQCnUCebgCjyPgkvvO842aIuq+Zi49A+m1z2bVR+klD0q/EG+QDK2TuI4Pj3U
	ZNakMh5Q==;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Tu-0000000ArB5-44Ml;
	Wed, 15 Jan 2025 11:22:44 +0000
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2156e078563so97117135ad.2;
        Wed, 15 Jan 2025 03:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940160; x=1737544960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdHRAWZU5RvyobFuV6RTA7jKM1EALie4R5bJcqyxVa0=;
        b=st8dEMHmpZ08IjpmJZ55Ko1Cv+WwKeZ3+mk1Jk3XIarl1V149M2qhSyGk7ufY7qjs9
         XFAvwx1gR2/VgXjGv1ekTY5b5U0iHhd/GwNdRwwgF/BUEFVJ7KIJxPwCEtQuZiGSFycu
         Nlcs/iMRmZTqLEvOnVgsd3JWtiSPWGoQT/fHLmvnsbel9tZbe7B+AyCn7Bht4JKB7MIV
         mBn+RiV2VkwfyFbGkC+2BfzlaWo5f+CMDLfxDKH2Yz7nil7yKscykmjaAvsb7KvW1jro
         VTr0VSPydSII93ugOYrUagQUTNgmCUwkRP9TJHS/Zf+dyC+f2nIVHLeae2V2PNIoLZkZ
         F1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVza9tV7cooUsy1skTskFAyI0NNqW+z9hem3OdmvUQ6OVVDSZVZJ5HlLcR+oAK9cz82hxMzLTp1MYQlhHHvd/Y=@lists.infradead.org, AJvYcCWuN0Gcf73jYv80P+aXh+G8Q+FL5p81+MKSXXAhvNH3eVbGyHPE5pD1hx8UqcXQM4+fVExo8zmHJUauocBrqi1k@lists.infradead.org
X-Gm-Message-State: AOJu0YzOTCBfB6PrL+qo5Q3TTqsKE+xZcoZjERreQPXZD96QcBX29B2Y
	qW0o6l2Rp4wSv4b7HSY6HxaTA3V+STw/C2Ws1v+uJVCWbrarjEI9xi5Tcctc
X-Gm-Gg: ASbGncuQyafdrz7NX+QT7WqiX/smPEIideQfWXqOFZndH8V8J+HKMUiBUK9w7sc0nQi
	H2zaDUE39G0MaTtoQfAK6u09ljtg3AMZWldAMV3t+YyQX9aC5MiaU7GsaulCOn5CBGWy8lQH6Um
	Wr4hY4w1qsjXnY7ezywkGDLTbG/0WXOcG7Z/AHmebfZAq2ibR9Kp0yrrCHMeYD7Clxh+MgYMu21
	OLKasAnn/BrvK/zYeuKHdEdpjA8v94/HE6fvJFnjAo1J65MehWO0WqMs3kL4mm9Uis//mP8mj2s
	0t+tFGTN08/ER/c=
X-Google-Smtp-Source: AGHT+IFRI2XP02LwQUmY3pnma0SuabUzBgf9C62h7vyS9cRaTSJWkLia1YuVRcGizJq6nHLphMfk9g==
X-Received: by 2002:a17:903:41c3:b0:215:9a73:6c45 with SMTP id d9443c01a7336-21a83f4cc87mr532263225ad.22.1736940159859;
        Wed, 15 Jan 2025 03:22:39 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f137eccsm81322735ad.95.2025.01.15.03.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:22:39 -0800 (PST)
Date: Wed, 15 Jan 2025 20:22:37 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Replace magic values with defines
Message-ID: <20250115112237.GG4176564@rocinante>
References: <20250103095812.2408364-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103095812.2408364-2-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_112243_089545_575790AA 
X-CRM114-Status: UNSURE (   6.49  )
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

Hello,

> Replace magic values with existing defines.

Applied to controller/dwc for v6.14, thank you!

	Krzysztof

