Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CEECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+W1ujC/i2sYkXDbzkORn7Jew8iq3dGZCwNInAwZJio=; b=bV3NUqKhGdoipERxsr8cHM97vr
	d0TQwY9S9vrEDd/fCTHRTxI7nu1ASN5bYn4qIT7ac3B1aSF+igyhKrL6Lehbp8JIgLX+pkkULtcOT
	ZWPj322uE06wNrQC/RKa914zhzu/BgeIBWJ4FtTelU0Klf3DBmEFtDlYeIP/3UE2wGpggWj3n5SWm
	s7ytaf1TEd9KMlSnVzU4bqk01DRvjLenJcU2YvElpzt3KQ/8EdkroTmb+vRGOQKAeITPEkabEmq/d
	m0PSj2zlX0f/nhbToa6cAF6Jcn//dTf2AfvbbX3CPQfc8bFHMPxXQ5imI8jkeAaI2k3O7mTsMBi9g
	+fsLclDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInEh-0000000786G-0YH7;
	Fri, 01 May 2026 12:44:51 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInEe-0000000785i-1S5Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 12:44:49 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8d736211595so129021485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777639487; x=1778244287; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x+W1ujC/i2sYkXDbzkORn7Jew8iq3dGZCwNInAwZJio=;
        b=ZrNkmHVghTIaFbADMIFDZ5uzmbc+mFP4VPVbtUTlwKN6v0MpZElfsxBrmyxLAp/VQA
         O2WwpoNpziH/Zo6iwqJ1GNvluLjjxNiXd4CGEfa9FpGlUoH/Ww8jLqM0yIexjAhe/RkC
         EGmwd+R8M07aZeuIQflUXX2YviAAYuQ+eGj4eLdXbLdtdhyWUvYGom1FWv/PpytLlxOm
         c7I+ljRAFJi9o4VsszmTN2b1+xhPAoDL/sXX/c7TlghMpXzLGQrQepgWuWO2/nDXQ0AF
         P59A9rUat9pnTxETKWXFYB/zAinkdgh+Vhcf/6Ygr6JS5KJbH6Ssh/UUz8bFZb1QjtIa
         LJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777639487; x=1778244287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+W1ujC/i2sYkXDbzkORn7Jew8iq3dGZCwNInAwZJio=;
        b=iDwZwLyMNZGyMs80tnLUlAXGlwKQO3ZWvuloNUZenJtGVr2Z767hfUtklG1uWpsSfQ
         imNISJsmPEJvQgeowSxeDH0HUKNTSP9tLgXUOaPsJMIEIQhnSCrANTkB50h2FrbDfd8z
         V4a1kkfzn18y0ZH2xuFodBeCvPz/us5QinGuNpAx7DEZB9viZe6zCnZXxkCniMEvMPZH
         5Rna4TZhq4d5iXRkCTwqW+lIF5V5QstYIx3Oz66Xjmht6UYbDHRSougG3qKOdAnw/1td
         SwIn6X+oIFU5ZEKHYYbzwuAfiT8c4yL1HcW7ey97CFJfRgVuaH9muxNcgZE9Y/iF8IQ/
         L9Lw==
X-Gm-Message-State: AOJu0Yz1bZC9yDV7L05NTI+HzlZUFhHcKcfdjtFAiohs8NqlLPJC609u
	dxA6w0gcTfYXluFtgP3icce3OFMMv43HAUfxoqifO/YlIG+zyvNZRBESvqpflzXyqhc=
X-Gm-Gg: AeBDievzfe90JEuT8GqgCQti6Rdz7uSobvxfP5xHbRA5S8/AeH2T0qFGJLoa3aKupLN
	0F3k9VFAkxgdsGUrnXMZEi5DSAXRF+EZMhbkx1e15pSPwKF0NbHXg9pPpauHh+YS0zE2N8MFqYT
	D0y9VJDLGqXQmF64On6pKyz4UD5Igqz/82X/ghVtiFaQ3MQJ2BBXWPfxfjD3OOjBNBW1Ej8A2EX
	xIE3meRtVCV+Kbt/1T6SvB9B3E9mjYHcaw+EFLRNkK5+6HwX9bZe7y9sVHpH24nh/kglRrZq4Va
	5A1XuPqCVjURU6j8J8EfUYE5kypHyzaJGE0DoX10P49R6nVkX806Pc+gEZQCT5henY+YF0JMdmd
	zd+0kzOFYYYHn5hOv5vYCXQd30YWaQX52770YkS0z9/yqL3AGVnBnOcEqS/9Ci3M7iLXcJxY7th
	iTWBTxMp8sNiYnRcCPO9tk334OVcUcBAsd8RtmGlejQHHCTmkfoB3Zs9az8B6dZ5p88DioQKSw7
	lO0ULD8i/V6olvmyL0doQZ4fOA=
X-Received: by 2002:a05:620a:6989:b0:8f0:a3f8:fb2d with SMTP id af79cd13be357-8fa869c827amr1076322085a.2.1777639486728;
        Fri, 01 May 2026 05:44:46 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd06f16sm155809085a.42.2026.05.01.05.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 05:44:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wInEb-000000059N4-2gid;
	Fri, 01 May 2026 09:44:45 -0300
Date: Fri, 1 May 2026 09:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 03/25] iommu/arm-smmu-v3: Split code with hyp
Message-ID: <20260501124445.GC6912@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-4-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_054448_411159_C3FE9331 
X-CRM114-Status: GOOD (  10.01  )
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

On Fri, May 01, 2026 at 11:19:05AM +0000, Mostafa Saleh wrote:
> +int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> +{
> +	memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
> +	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);

Hopefully I get to it today, but I am going to post a series that will
move this logic into the headers while deleting arm_smmu_cmdq_ent. It
should be directly usable for pkvm as well to achieve this same split
without having to shove a giant inline into a header file.

https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/

cover-letter: Remove SMMUv3 struct arm_smmu_cmdq_ent

Jason

