Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AD0C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 04:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qS0Z7r3EX0ZcTNJZb2kibKrC2Xd/v6RxpcgDmAdFoZs=; b=4aBy/VHYMEmrqIQ6iOKxaep7aY
	lEvsz9QA1zdZSRocJguIEcylN+/v/TWEAPyXiVj4LmqYj7gB3geQ/pLpgeoiKsMQzI4028Jjfq2qz
	uIQa1HKGltXyiycw/xghX3LsseSNa6XX5GCCXHjF1yZ7iaGjnbGoQLxw4f4ofvARYgwX4bW6ckGNP
	9UeB9XwCshzSsTHmXQBFpHs5k55cxCSDu9ve/iMt8yoiwoJkH6AcouKgrmISmxixIqtihEXgJXh8E
	Mn4Tpuk+OiehUYj9QNE0Ouct2rHMkge5EAbIq8dq3tCdWB8K8etvKWqTNjawB5wDdsHJ9ZmVV3/no
	C9m/EXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf9b5-000000090MA-1Dwm;
	Fri, 25 Jul 2025 03:59:51 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf9YW-0000000901s-0ob1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 03:57:13 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6fa980d05a8so14891556d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 20:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753415831; x=1754020631; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qS0Z7r3EX0ZcTNJZb2kibKrC2Xd/v6RxpcgDmAdFoZs=;
        b=a+zKAOT55FiPOd14lqMCHVmviXpHhWxYFkk4eanGl0FMDo+BkYWcDqC2aMzPN/ZwuG
         j/mKEvPHFlxBeLv6No3z5L9Qmlk7YNGvnMILRs0WvZR8BbByLDKAt1HPtpdQaV4WxPXq
         lM/bCGguANRMarjKrQdgXMe0giIB6yhJxO+JpFQkZXLK+4FrWZqhuIFQjrLnoUAvVyZc
         uNcXXJGX9oIt2aWRg/l7PpIqLrESDt860tv7Ca8xa06WTiz9QNOAQ3mdomw9hULwhUfG
         ahl5zrbSuXtILZ4eMPcoBpIScOdP5Rhdqtk/M2cAgj/Z3wOM26087dJLU8Q1GU3FvyKJ
         e/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753415831; x=1754020631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qS0Z7r3EX0ZcTNJZb2kibKrC2Xd/v6RxpcgDmAdFoZs=;
        b=awV99mvq17TeQ/uZkuB7Hd5cmyLwh5+O7EWaFm4LVMar+jcBTEAP/b9jdl015Je39h
         UBiOuAsP4b1YsbPKte9IFe8FOvZZHnzNVGy8CtN3L88mcgPbtfTo8MMDSzbcasxPIOks
         4ccCTl4NoUgBPZL9e7GF9Ebs9fu2ET/SBJPR3v4UtOsdiR+X8y++AQMQG9VEycTyMG4T
         1ToYeUf6/nKxHHK324PxyzkbURZUeMChlLWXWHxYWx/jJhmdvWBW0ph53T5AqIYkSdTr
         NpFTdyEA9DJiJ4v8LHDjo3eelm/89rdc5tR7CCnCRzjmiPMvrK9E7i/4pTeP2LPBCBA4
         aU8g==
X-Forwarded-Encrypted: i=1; AJvYcCUaJId/S1dy3SZGWIL2E5ApUEU8lqOKYWrcqo3P+6+/blZX7oBbaEx32wpIguocwUtA3qk4hJultbIf2LDMlcS6@lists.infradead.org
X-Gm-Message-State: AOJu0YyQUo6z42UEGHOho/uX5R6h7kV1ocRLxQ1bYFe5cZAoYQV/NY8K
	TAZRwICV1sYCOMAczn+gxBgVQ23+RKGkalTw+/CDnnavWqD/ab1QD3Wz
X-Gm-Gg: ASbGncvYZdBXXWcM7O9GiKXWZdmuB0syPR1vrx56FWbFWlwelmW2pWtaMCfnNlRccwn
	xbg/6mTMIPc/kED1jsSBff6aflfZcPPmhAHro7GzOg8EYXcQuwcG5hphDvvuYsmQCpS0iJk+aNq
	rOlZNAesO/HbY0qJm/OyJRIzORZ7Z7wz1q5JW+Oz4KFSiIIMMADSo18ojfbRFzYi0+b1dPIcrAN
	MoGW5ZfxWrZCgDKBMKBsnPwehAhcKmx9AZLxW8mAzMuh6ZcGAzxXdP3PjhXteepMM1u/GM6Qizy
	jzZIlmaw7zHrSW7q/BoGmvhpwkb8M+cUbwnSfW8aLLn/tt/r4zuUsPJDNVE3HppU4NUpjJZPhb8
	F8ZLB2lUplosVjw==
X-Google-Smtp-Source: AGHT+IGkfDM6npOStCLeJgu/CWVD68Q0/nsCWaHQZboVHGGZgry/9g6hSgC9hYmtKfgz39J9kvADNQ==
X-Received: by 2002:a05:6214:20e3:b0:704:f7d8:edfd with SMTP id 6a1803df08f44-70720602e3cmr5571786d6.50.1753415830648;
        Thu, 24 Jul 2025 20:57:10 -0700 (PDT)
Received: from pc ([196.235.221.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70714c88fa3sm16584396d6.91.2025.07.24.20.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 20:57:10 -0700 (PDT)
Date: Fri, 25 Jul 2025 04:57:05 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mvebu: Use devm_add_action_or_reset()
Message-ID: <aIMAkbdOyHsiPeph@pc>
References: <aHsgYALHfQbrgq0t@pc>
 <20250724164217.GA2942464@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724164217.GA2942464@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_205712_253325_A4878487 
X-CRM114-Status: UNSURE (   9.33  )
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

On Thu, Jul 24, 2025 at 11:42:17AM -0500, Bjorn Helgaas wrote:
> On Sat, Jul 19, 2025 at 05:34:40AM +0100, Salah Triki wrote:
> 
>   ret = devm_add_action_or_reset(dev, clk_put, port->clk)
> 
The second argument of devm_add_action_or_reset() is of type void (*)(void *)
and the argument of clk_put() is of type struct clk *, so I think a cast is
needed:

ret = devm_add_action_or_reset(dev, (void (*)(void *)) clk_put, port->clk)

Best regards,
Salah Triki

