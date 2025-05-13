Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2E3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mu1MGhXj5I1mhXSeVHZqWhuT248q8j49CzHBBK7frdY=; b=mE6Fpb0nyQk3cBAuoOU/V4Sdta
	mz/+vZE6VY51Pu5iDm5//uYJ3ESwKEDNt6w+qGB8iY9TfNlVaExnW2Pwrooke/ZpapWjq62CHOSXS
	58XOLXXRLH++H3+er6JhB4nRNPoTdBM/pcxI6OE31y2ioneGtStOpsplQC6+f0pKSV0VNHwhhW/HL
	X3/RAUICAddZmdjComeYQ9q2YZBwwg7wI9remV9Iq6AoklTvltVuk5XqNK/uqQe9PkWnlf6//g051
	cRbuqAgmTjaYoakS/teenV79gczoEtPZGyfGhpg2I0teleD37mTMel4g+0H2I8TpYsfWYk0qWxjPz
	4VkblTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEo88-0000000CIZ2-08cB;
	Tue, 13 May 2025 11:49:04 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmpC-0000000C65X-0cTw;
	Tue, 13 May 2025 10:25:27 +0000
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7370a2d1981so4587364b3a.2;
        Tue, 13 May 2025 03:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131925; x=1747736725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mu1MGhXj5I1mhXSeVHZqWhuT248q8j49CzHBBK7frdY=;
        b=uWswd5GScDd48FMZQbxUmZ9jcaTqXd1YB4q9x7QpXZt/AlbuekDyFGJCncqLm9Tq6n
         eswpkeYvvpv3ELmr6b5MGsMBkTW5NpFdIQ7F2pyggFeFbq5j9HqJeKZq8oHX2CTdAu9f
         HDBbF6QdvDja5eW80eVS6XU8pMqzkRTpu73wSHh41KtoLLDuliUDgwTXqi9eeDjUyW9M
         YIYMhYufo2vqBdazFcH9Hy2XCpI90lb+0EHPfHlcX7/eqHG3Ydm/m92qrrKVuXsWdz/0
         pvHSeYQhSZLppLR0KnNOeBy9szm/K7z/m69HdYqw0wonTopE6R2h8F1YDSsIEPLhgSH1
         XzCw==
X-Forwarded-Encrypted: i=1; AJvYcCVKgbfXqh6T7Af6tBcDS6bgOtMsatm7CTKt/UtDc573I0fgrZj2OWMszE51rCMif9sXIRVD6YNFEpypfmHyNia1@lists.infradead.org, AJvYcCX+pGuXbT1kNCldThEIj0XjJZuEx8y9zJn6HCg2iaaYvPQBSWV8wqCoAoUEUdSHsAQxBuCHrfPHiOJpMhZgBrQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw52k/0qGVfM+7AQt04JLYMLBwI07+Kk6JF9krsQJz07rvWPCy7
	ndAONf5d7kOsFJyksdEmjsVgEPYwze7nGoZkPI6Oq6Ijw1qKrWFR
X-Gm-Gg: ASbGnctQohU9Wf1Xy6oyNLk7D2JbhwSC99uT5HJVba5IIstno2Cca0cnQPEom4GePPf
	gcdS8LyR4SfS4tfLbp+Y5H7KniqJFbCfmfV5skgPJVxQKVOVpF0v5xtBxMXseq92SrV4cx8ri49
	RVaQuyrUvqUI9+eHf7mCCU2sjfnwlf99K58q69JKn5hwiF/QvPW8ie+YRx+LOeL69f+Y6N7qkaS
	5c4CGIf3Rvolsf7fOIEGF5xsZQD08dcXuTmZ/dudSCllNukHz6pLO20kRU2nB9YGDbglsU8UIFw
	2aHuW8DjBhpAeVwcEKyeW/Rd5eXjGJzaTeqIjGjTdrWlIVdrhqc+2c4BLMwv+Zs9qI1g4mU4KAN
	cPBOWMGGU4l+17d62BHVy
X-Google-Smtp-Source: AGHT+IHgkbHZ6vMrXJ+sz5YsVjInhm1h5+2wTuSy//t/gr3IwKHBMkQrJvmGQ6JKu6VeSx7VxR7jBw==
X-Received: by 2002:a05:6a20:c6c8:b0:1f5:7873:304f with SMTP id adf61e73a8af0-215abcb169cmr27543835637.37.1747131924739;
        Tue, 13 May 2025 03:25:24 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b234ad3ea55sm7013073a12.36.2025.05.13.03.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:25:24 -0700 (PDT)
Date: Tue, 13 May 2025 19:25:22 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alan Douglas <adouglas@cadence.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/6] PCI: endpoint: IRQ callback fixes and cleanups
Message-ID: <20250513102522.GB2003346@rocinante>
References: <20250513073055.169486-8-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513073055.169486-8-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_032526_185265_442E65FE 
X-CRM114-Status: UNSURE (   6.71  )
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

>   PCI: dwc: ep: Fix broken set_msix() callback
>   PCI: cadence-ep: Fix broken set_msix() callback
>   PCI: endpoint: cleanup get_msi() callback
>   PCI: endpoint: cleanup set_msi() callback
>   PCI: endpoint: cleanup get_msix() callback
>   PCI: endpoint: cleanup set_msix() callback

Note that PCI prefers to capitalise first letter of the subject.

Thank you!

	Krzysztof

