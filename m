Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3140AC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0inqpIltc360onMbVfotB+9G1BiiqcT6cFZ7024EJR0=; b=KNQv54Mgb4swrYU8lzDNchPTa4
	dx/XYCbADGwB5o9bb7JqSZyKi4SkvlNdsGQSf6Tqmtg1bZLHRPBqL/qLkBmbKVgiy/SfGRge4PPx4
	nq9Nsj5iaLJMTgVuBZFyZC4KSH6UlD4vlo0ch8aT/wZV51+mPFWExuLzE9voDNEoUuzFN6VRKkCHJ
	l4moyrbx9Jr6t65qNQXyPBFZjcL6W/bQZ3pTu+cZgH+zw2Kln0DnUYfuTWgYRtHpSvwUYFsMsnAxh
	4RUGlueuGKZKQib+5eU4E5+qgwcu4C75rJey4uPCwwFcKIPv1qdK6MYhcUfMy/ywr+YXu9ducXIyA
	jCXlwzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVtW-00000006BQF-3ymR;
	Fri, 21 Feb 2025 16:28:54 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVjS-000000068VS-1kXZ;
	Fri, 21 Feb 2025 16:18:31 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22100006bc8so41372715ad.0;
        Fri, 21 Feb 2025 08:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740154709; x=1740759509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0inqpIltc360onMbVfotB+9G1BiiqcT6cFZ7024EJR0=;
        b=Z756a/7Cml3O7m6RwSy9vpBfvCYZB4zsfeRDe3dUB4mtr/EKfgbalc0xQKNhWJnPn6
         g29Qeg6pU1/9nCc2puj5oBRmqImGKD/hCQ2BcVuDBpoLLtUTINfU29ZB7Z9ZdtrYy3Ft
         K+4kM3JcxWbl+NFfKg0oZ3+6+lq3Er/mzih5ekxhlvgTmK/HycRQKKOcSEZWohYvyZJm
         LdY6pVzOZV0Oi/WgrXV/b6gvCJi1CWR34CHuRxiGvvPqvRMYlQ6hdDS/Bujn7SGnAO2t
         nVGSkcg6M79Sq/shaJV2jaAnUryyjPUbCwClac4GJPEhCJr8jRlj6kHRzGHuMYKvWkrh
         fqVg==
X-Forwarded-Encrypted: i=1; AJvYcCUjmFwSLQquVVeOBqLwK8p9y0G+Oe4wduiWvG6Z+0WqOKPPZigbVSaem2EkVNNp1/Iq9GAjCaFMbtm1gl2HB4EM@lists.infradead.org, AJvYcCVQbveAHrhwn/b9T6gqkPWFi8/dHzyOLh+NORTyjVK6RX0Cc++fMh3G5Kf1KG/fU7fUtKXO8VFsQaw7fTqO9VzgHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEcfNPwMaWqa/9Lrj1i0p1lXRnP2XiO3qqY2kxRNl3mFoW3HPZ
	8C/1lXgHUduSHOOfyC9sd/4zeNAY51jV6Gi36QvRNSJlwDqmh8Zj
X-Gm-Gg: ASbGncsEyvte/3y+p9ujWvZd2BMdYaCWXV7euNsdJ/BWtIBN/2oIk/RocE30fIgrLrV
	xukrpkxGbRFVwwbNUfiSjTp/NHoaPEcWSphreXY8VbDWpxzhoYQS6AJo95rS0hZIYtS+paidf81
	YFePOzftdJBuVN//51Ir9ZmEd6nD3H20DkbMKdF3hAWGY1MDub7VBro+12iN2pm2CgCLgIILrWJ
	VMCQXaeSnFrNNTAPnz5UXGu7ifi1/tZwBXYjjtqhBR2V1Gkzug6/3IasLnRIAu394L2TC2bVCU3
	yDjZzIVlNXj9+lCRB26arrG0Boda/uDR/gabrKZeGmkQCjDvogT8K98rsBgi
X-Google-Smtp-Source: AGHT+IFFC7TzkmeEvaeC5hCBX5n8UmyFJ/BAqfgtyU7o+6JEfRW/3+0dEFvOaLm8q97F1jekjmOYFg==
X-Received: by 2002:a05:6a00:92a2:b0:730:9946:5973 with SMTP id d2e1a72fcca58-73426c8e077mr4818381b3a.5.1740154709362;
        Fri, 21 Feb 2025 08:18:29 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7325b4d5609sm13149663b3a.87.2025.02.21.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:18:28 -0800 (PST)
Date: Sat, 22 Feb 2025 01:18:27 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 -next 05/11] PCI: brcmstb: Expand inbound window size
 up to 64GB
Message-ID: <20250221161827.GB3753638@rocinante>
References: <20250120130119.671119-6-svarbanov@suse.de>
 <20250212180009.GA85559@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212180009.GA85559@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081830_451692_F59FAEA5 
X-CRM114-Status: UNSURE (   9.04  )
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

> > BCM2712 memory map can support up to 64GB of system memory, thus expand
> > the inbound window size in calculation helper function.
> > 
> > The change is save for the currently supported SoCs that has smaller
> > inbound window sizes.
> 
> If you repost:
> 
> s/save/safe/
> s/that has/that have/
> 
> Otherwise we can fix these when merging.

Updated directly on the branch.  Thank you!

	Krzysztof

