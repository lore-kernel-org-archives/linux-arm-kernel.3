Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F84CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdvEr7CMGHUXYm14SkrvOmvdQ1yeNQ3r2FisQDvIWDc=; b=yljl/n7ZIIecPfbhxUQFthOcZb
	b7Pmlmqen83jy0/XSgSgWn8GYLi4gFgCwAU+dra8CjQ0z6Jle/YOkIW7bYTh5xzxPfinmsVyuZbn/
	7gRgb+/RgyY3CoO9nfahZDI4t5epEcccNtB1+hUYeIWBIdrd0NtG4KzZIyf4aEKx8eEZpRmwiYbeP
	q/7jTQpurkqkRQMDjVFmOjLooVh7zwekPdxf8MpE/u88WoEYIXSEflqscGohCh96LiLhCydcKr9q4
	2oVsXoBte0pl4ZDKItt6wanU6DP54RC+qJw12iKWDNHe/FXHAgD2tksF9naaYGbryPtfxNMMoSNMj
	1egIPQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIigT-00000006ril-0zQ2;
	Mon, 19 Oct 2026 08:25:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIigQ-00000006ri9-1san
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:25:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2e8623790f8so67515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792398325; x=1793003125; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zdvEr7CMGHUXYm14SkrvOmvdQ1yeNQ3r2FisQDvIWDc=;
        b=MxQVbqX5wP2WdxR6BoHpUdhE4PRiE7FMfNPYxOHnOPJy2SMBhnBS2z5tNh181+8jHU
         9G9OGcUHHlG8kNka6JkJuvn5kfIkbWShKv9uBWtQ11HQj5xWd98kkQ9E5txY6GllhS+Z
         sxqZpjd1AgQnbtdkS4c2lPz5H0sJ+p+BGL9dFyLydGP+dA51TYjq7fWHLMGUIqkAUCrp
         wei9C8+soIqXKEDh9CC0O2f54gR7/2rrWl3thUYAYHsWDjtyC0iEHp6zmdO8lvfW+o+R
         ZtW/TZllEhIcmVNf4hJ6d9zemgXXPYCpwW/DC1U+UGT/AcTcPWdzuRNE8J1SBubkOt1B
         YEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398325; x=1793003125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdvEr7CMGHUXYm14SkrvOmvdQ1yeNQ3r2FisQDvIWDc=;
        b=l44v2eqgJRovgOOkobkR8M7ZgAdBLM2kpt5ApKPYinLYoLTbcNQRtqPKW8O7iEH/7+
         RNFhIWx17JmbhX2VtvxRhQNckl8gh9XHLBkZYeDXa3l41nnAsEUxgBO1/ShSoAFCBhxf
         UyBEk1RqElTmuZmTt48m7oqKmiQD/iM9HEQFS1xHJ8BTKmf2R4mry5MEvkDB4cAqBdJ5
         Cl/862C2OrRSquDqTSIrwIReTfE++aPL3TKz4ZPihdvmSYcX33L0vrZwKwEt416HkU1X
         cOr9lIPKPXdrEZlhxFAQBA2GsqpY8JlHxb+kuAxIEvfyiwpI8BpYMVVFTnQswvey4YlA
         1YTg==
X-Forwarded-Encrypted: i=1; AKwUvBwfC1tcIbuTmvMRmLUdIIgGIGgNxwnthDN1668LL+a0b0A3Da02ODsXHgnS3sMGeQmt4bt5qCDyqzNTkP58BBKu@lists.infradead.org
X-Gm-Message-State: AFq9FYIvpmPM0FKQPq2hBN8HKqWD/NxplMeb0KUnfeZG+Oq2IMrshZmz
	n7gvoBVto3sAhPU6gskSWtngBUSfjW191jlNSpU80S+nzEQSyE7MpMA+dXWr3ar0Iw==
X-Gm-Gg: AYBFou3IS+OhIAVf1i6OVnwEAsumqTVyaHCCXdFwgR4DdmGZA01M0Fea6q5/rJ49yVE
	x5cwJK4ZwvRA27dJonrsslFNpnGy31Q+63xvzRB6kMq1npPzlxkk71L5KiC4eKnf4JYOsnBIEJC
	E9cjoxwrs0u7mqXwvMQLzrzaw6TQobqx6K7Q5Dphn7IRNzzSW/8Ps2Rz4dUunOAAKhfDXqoI2OB
	ROqaZ3t8LWgq5o7hQOaLjq8bL4GDpVb00hvGcS6G6SQM7qGXVGdEoRgUzA3MBDZ1TP2KRmZeS+9
	85I2spZGyQkZkIOMrSoRTP8OoKbJAcZ/mFDp7gQ9McMZvnf8awdRRfUJLksELOb9ciFgx+DN6Cc
	5Qw9vPrMIl8xHTgblVSPLVl/h+Do41GCxQABJtOCGWjmIuWC/pYV33fjEt3zjy3/oNDxXJbwB/m
	OaPOA1qElRBT9QKL5QRapyqAhqgf+ln1oToESSyFBKdNdL3HdmNX3RglbvCFCVSvogwfdSAoPhX
	1TEvrjxoKFj/5umpCojmrIQXdlAs+Br6jg6SIU297ufrjGK4kHXvzQNoBIi8Iep7Vcax8KxcMsd
	H51yX3wtXSvlpI9jeFEGuVKabx2fFl7yWBIS2Hw=
X-Received: by 2002:a17:902:d506:b0:2e9:492d:f1a0 with SMTP id d9443c01a7336-2e9b332b549mr6191375ad.16.1792398324879;
        Mon, 19 Oct 2026 01:25:24 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm19384883a91.12.2026.10.19.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:25:24 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:25:16 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <atXT7FtKrA2e1f8Q@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <asZSQRSYBjbUaaH0@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZSQRSYBjbUaaH0@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_012526_486040_9E8151AF 
X-CRM114-Status: GOOD (  18.41  )
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

On Wed, Oct 07, 2026 at 03:08:01PM +0100, Will Deacon wrote:
> On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> > queue's producer index to safely gate command submissions during device
> > suspension.
> > 
> > The flag embeds the suspend state directly into the existing global state
> > The flag is checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
> > which acts as a Point of Commitment, ensuring that no indices are
> > reserved or committed once the SMMU begins suspending.
> 
> I'm not familiar with the term "Point of Commitment". Is that something
> you came up with? Without a general definition, I think I'd prefer to
> avoid using it, especially as it sounds like something to do with the
> Arm memory system (where we already have architectural terms such as
> "Point of Coherency".
>  

Ack. I'll re-word this to avoid confusion.

Thanks,
Praan

