Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A883BCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G7G3x8CQosaH9I2KCc2mDmp0caEd6Jn1e0HXGIwM0A=; b=IjZFsKpUtIg0MkpHMkAmCMBxvR
	kXHMbOVsmZEu5Ddpn0m65AQMjPYiD3NSMkBvNVRo0cNfIiZuY7+fKiv7OqoUWZPnhiptKla6mmFqz
	jT384kKqSD665H/YsgOqAwA7Fn7WIhWfJivIgAnZs8fLRdwSeR1RB04xmzTqHlS3Mru7mvvqsNp/8
	qarGSXyatSZAXpYJl6ZxjN9A4Hp9q/pWI0NK6rCQ0UU1mYbuLNsHX9occO0PiD9KpGQCKGbFVSq/N
	+XBBhyI2IDE5bxv5oXxB3NkF9qM8A2yAZkoCe12VZSTZWjGxFdb0+hXAA+Lcoj5DwhlYjwM1Y3JYC
	PbZKBYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0Tr-000000078Gu-0Y7E;
	Wed, 30 Sep 2026 20:00:43 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0Tp-000000078GW-0lJA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:00:42 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so6425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798440; x=1791403240; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1G7G3x8CQosaH9I2KCc2mDmp0caEd6Jn1e0HXGIwM0A=;
        b=wJ41ger0vtJcs8SKEXYiBNDObiUbmQC5643OyuXaN8M2epEOKOnzRAx5fLt+0XWymB
         xgvGCLQMBt2kCOLD1bDO5t2CS8B9c2YRVI9A8KvB1S6vZBnS1eM1eoSMf556wD1aSUHu
         5Ge1k70LGMzVhGoDyQC8qFPvMSsIs4hTqiwIuTvrEpbHZ5PL3pD01zgqztCWXq3xci9Q
         21K5xiFR/Sq66mFToLued4z+uNyJZ60hyVYE+i5dn/kxuwzCEGFcWAOnpLOCpGbiYlEk
         4jE60+XS0LJSdnrq2kvyMjLFsyQVM0pv0bn5vUE/awWDTJEvMcb5KsGMhVtJHGAQTmUH
         VtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798440; x=1791403240;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1G7G3x8CQosaH9I2KCc2mDmp0caEd6Jn1e0HXGIwM0A=;
        b=MAoP3JpGES8UVKZx8iRrzdWdkVS6eI1EzERUNVVNZ4w/KQO3ZnvajPGeaU86fIX7ax
         XbrbE9ArNkQ2CN19lYWlOpYZW03hWlTKy3wwhQHj1N8So4xIhfPVO7S4DbvXyvxM2t75
         hh6nAr3AcrWT6hJ10SG6LWRw4IMAiHEFrMEsung90wVHSjIV+1e6GH4PEkZrqfvwNgyD
         qXaJ0bIRossTiJwgNY06eixBpF5+hF5vdSOhCjOP9bGHrJxttg4Qh8W5b00s3fRfECYx
         eek5vV0aFZCLUYDtS6GK0iVMVOxqIEokMN9FYPCkB48QiXXtxZb3qj0zibd++IzL1N3F
         CIiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVgCtDcHyNIQ+ZQbbXerbwTdZTSRS1NBXr8mZPLz2LqMIU/gxvoAB3xDEQj+uFlsN8K9t2ZcvjkPc3k/H15Hca@lists.infradead.org
X-Gm-Message-State: AFq9FYKJYXp6r6mgAPP/TbZmo8kTJvDESYTCY3z6/17m6Fw4hWkd0UPw
	cYIiHHixATwoiYAGPt8bAxtCK3Fxv2qH3x7m3GcDtjjWAf+O9K0g5kX01xme8t/HFw==
X-Gm-Gg: AYBFou0X3yt/li3rTZtLYRC3qglMyXWsCipCzLJQ1aLpl1KIscdnk3vw0REUkFZtiq8
	kbbor1oBffV4aqFIehpA254UdVsZVWd66rzkDJk7i8QsDL7VQzgHJ0iCn+KUVYJWpPjf1OBJb2b
	gN9mf5iH8LArIAzODXUdbX5zXemG8+GApk10brqvmo5qjNzIhMbf54cLatMNAs+NOokk5nfrXK3
	lQAqLUGZ10eAjDNmaFWZGs5MfM0Jr3z5iebBIDuFHNha2kJiCF75AfrpjCn30ItcxEmJkOuCEci
	jRrmbXkWc4X3Iuv8DTd2ICvcqMkbcLf639bvDcu3c8LXrOAKDZbTBtFfc64C08UqA6mQmDxshig
	2ASDQ2JnCo+OLX1/MAsAwf2Co8g4zxwbGBHVQcrd3KLm1nb/eWm5a3a5U0go26KcpBTR1cJM3YF
	/1am1biOi5NQSKWOL1e6lkZroLZjJyAcVf7nWLWLNJnQwgSPnRTelhUZa0xmLmflQMmsCFh83Hx
	UP6WOKpPVfmyhl5HiuoBDUHRP02ehIXIhEZ
X-Received: by 2002:a17:902:e951:b0:2df:8ff7:876c with SMTP id d9443c01a7336-2e305472617mr373115ad.16.1790798439504;
        Wed, 30 Sep 2026 13:00:39 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f44d0a30sm753405a91.16.2026.09.30.13.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:00:38 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:00:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v11 10/16] iommu/arm-smmu-v3: Factor out
 arm_smmu_handle_gerror()
Message-ID: <ar1qX_Ox2ONgcZM5@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-11-praan@google.com>
 <ar1WQCud+B3nAWX6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1WQCud+B3nAWX6@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_130041_235630_F518BA4A 
X-CRM114-Status: GOOD (  18.54  )
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

On Wed, Sep 30, 2026 at 11:34:40AM -0700, Nicolin Chen wrote:
> On Tue, Sep 29, 2026 at 03:45:04AM +0000, Pranjal Shrivastava wrote:
> > The GERROR register's state might be lost when the SMMU is powered down
> > during runtime suspend, requiring the suspend sequence to handle any
> > pending errors before the hardware state is lost.
> > 
> > Refactor the gerror handling logic into a helper function. Subsequent
> > patches will invoke it from the runtime suspend callback after disabling
> > the SMMU, ensuring that any late-breaking gerrors are logged and ack'ed
> > before the hardware state is lost.
> 
> CMDQV has a separate IRQ, so I think it likely needs a counterpart.
> 
> I have a similar patch in one of my series:
> https://lore.kernel.org/linux-iommu/16ae24cc2a002802b990afa1a69fe4ceab1e0da2.1790188510.git.nicolinc@nvidia.com/
> 
> Mine only handles CMDQ error though..
> 

I'll add a counterpart to arm_smmu_handle_gerror() in v12, I'll factor 
out the body of tegra241_cmdqv_isr() into something like 
tegra241_cmdqv_handle_errors() (bailing out early if VINTF_ERR_MAP is
clear, so we don't warn on every suspend). The new impl->suspend op
would call it after draining the lvcmdqs, with cmdqv->irq disabled
around it, right before hw_deinit(vintf0).

Since yours is for the CMD_SYNC timeout path, I'll keep this
independent? WDYT?

Praan

