Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C86C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih23spaVgrDHOFSey9aqnpQ7LFap1dWio/xJjG+h0zE=; b=SDaN2n5fDq76wzFNzjv8V6Rs/z
	GKDpQL6UHWCp7DiwufYuuoPSRTnIOiBgwlcLozWTtQFkQ4norwl93rs92ulEnoNbu/rZXVmjfhcWW
	Cw7RmQtFubKoqcfcZKSTlIierlDwKZYOYdThygTVpsXsCrxa7E+qnnUtoc8NNXm/fBuRi86aZVEMo
	B+VG9gVdApRJQq2r6UhmgwI/YXhTLAw8JXmo9d3cWgeRhaXOjzBoQqfuocwT6H0U31+XhVEGvMjw4
	E6YAUz9dm17fdOSYHqdAFjWGw3YVpJwMqfboZj1OTiULNDKAOwUdTSbQS74DZXySYtAYpAhI5QZCt
	hejpTFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Mfw-00000008L3u-3bJ8;
	Wed, 23 Sep 2026 13:06:16 +0000
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Mfu-00000008L3S-3T0O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:06:15 +0000
Received: by mail-dl2-x10.google.com with SMTP id a92af1059eb24-142dce6e237so662097c88.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790168774; x=1790773574; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ih23spaVgrDHOFSey9aqnpQ7LFap1dWio/xJjG+h0zE=;
        b=ZvAiBejkIjHsuFOlL91KJrEo9bXxLpQM5B4z9AUbHjdHErdlG8CjksbiRxT+1AQK84
         16yeR7KATRBe9ivIFzCD6plTDGsbZSInA+WCc5GNaCDOtAK4uROsIifC6t1mbhuM1ua8
         pkVwe1ESmgRreN09OAdqLkX0zPurnbntzjVLeJMMK0IDXqGZ2a+u2U9w5HDHL4GBCuZ6
         PXE6BV/Ab7b5uYcaqlhCQ1BrMVQ6bEZ9sKRGeQRIx5FrfMIfwToCBj58aiX1Le5nMOr2
         plJkgU9r01xTbaN8q8d3yhS+lrfWq1ouTOp1wcg0Ib1qqZr6BRmUvbsMhrdXeyY+FQJU
         A/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168774; x=1790773574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ih23spaVgrDHOFSey9aqnpQ7LFap1dWio/xJjG+h0zE=;
        b=z2fhnqnJ0NdNupZv/7QymzEWJg+sxHds61DfQaJ4PG0cgyjFjduqOD3m3IQMC/YdtH
         +pVM2vzTDGQ49u/eSxa4pXLAmu+siqKb9luQ28flr9IQnsyavzDcP2CcUlcNdgQ4vIdR
         1mB7QHoLurzeVc7TyOfZf9hxIqugS+m7BDyjnyxFvOYCcVc4I0Lk33SpCqlRUaDo+ADP
         7z+7pAaOb3/gEli4ZdB493to+dhNLfzecwHPDh6eZjBfGY0Qk0Ko7M3CxY6lJWda8fot
         qXQgG1f+KgAnI+mEmId+ljekl1MM31scQ1CUC8TS3fut5fiIkIDwPPdZ7BYIuw1mVZ2n
         FFiw==
X-Forwarded-Encrypted: i=1; AKwUvBzmPbPpVua0O/nZ0nqoJpokWNpLX+0ffrU70fwc7UDA4NpMCNSmKtrK2Q30uT0GSufzO/vFUxFyWIA4Y2q8dPSV@lists.infradead.org
X-Gm-Message-State: AFuF++lpQucUrRnVZVvb1HK1yp7XTg3NZq2NtoTolTUS+DUBk30suFf2
	iclCCM2sHTDDIpEoBQAGSHCzUfnAdD/3ebfQHrDjOYBTXiIcwoaKtnR5+uDTzLI4CwY=
X-Gm-Gg: AYBFou2Er2futDRYOZXkEds+BGk5N2J7uf7/Asarydqx6V2hPtZ312VEKcQT0N9HnE2
	h2V5KRRyEJRT0epvE9W3WFMymKRi22xuqY0PB4Uditr75hOwScdpLWDMwuHBIuCDmO9NKF9r8GT
	vMsmPsSkGdYPSERPI34z1RmEU3proQ09I9s6DwTcsZN+OtRn36CEpcrEfwYG4F71Ekkz/P3troY
	ioIpR+K5e5PL5LqZ5bSRMpdiFhiLIHG5ZUdr+DubozbsmN0GWVZKnJ31G2qhc5xkIv31b80P9jL
	Ba2lFI6KZ5aep+cKkr1Tq7yhpzHAnDY9HbM+LU53lc96DxSdEMiMRZKEbL0jyabFrrcskpf33mg
	YC/3bc0d7J3s0/9BoprEisil/waxfgpznztv4ys1wRJ+x2Dr6O02QABqPTc/0jj5ELpdGGdXIiL
	ioyu/NqhQ1OaiJlgyMtiudGq/qudXUSeCJ2g55nemHY/sh
X-Received: by 2002:a05:7022:1402:b0:143:2719:566c with SMTP id a92af1059eb24-144f9198b49mr2872815c88.40.1790168773123;
        Wed, 23 Sep 2026 06:06:13 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm10833873c88.13.2026.09.23.06.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:06:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9Mfr-0000000DZ6d-2NEP;
	Wed, 23 Sep 2026 10:06:11 -0300
Date: Wed, 23 Sep 2026 10:06:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923130611.GF1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org>
 <arOspFxWZ1DjgcAr@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOspFxWZ1DjgcAr@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_060614_867065_0F864B21 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, Sep 23, 2026 at 11:40:36AM +0100, Catalin Marinas wrote:

> The simplest is probably to always zero in the backend and ignore
> __GFP_ZERO to the allocator. But it's probably only marginally smaller
> than passing a CC_SHARED_ZERO flag down. Get codex to try this as well
> and compare the diffstat.

For patch ordering I would convert to use the allocator first

The semantics of the new API should be clear

If you pass GFP_ZERO then the resulting allocated memory is zero

Otherwise the allocator does Whatever The Arch Needs to not leak
private data out.

Once places are converted to the allocator lets go see what is left
and ask why it is left and what API it actually needs.

I think HCH was right that nobody should be calling this in driver
code, lets aim to unexport set_memory_decrypted as an ideal goal

Jason

