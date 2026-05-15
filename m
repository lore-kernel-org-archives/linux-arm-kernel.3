Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EC6CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skcHqYBlrM1emWOE4306eVJFUzXeydUKGsGl+9rnsaI=; b=B8PULuQWd5kj3aX2DHHOdNSK1g
	frgNM+2X8n8Xu1HzGUJ78IKzyO4X+3URgQ/V32YVXtPEAGoTV1xkI1IVuypf62WoPnAE95jay7SPS
	BN+7Pci9YMJN6APuj1Y3J5c2qghEp9JYn2V2dFGDRT06ZM+nR7AoS/w6bfN9M5T0pQy8Cp2xSU0Mk
	c8SxS48FHvQWKSD9JfbvGjySJC5WzDE/AwnxWzv2LOK8MqJGMYzIv8Q+Vu/9rYWGqzJfFi3qohuqi
	qnuglrQb/TOvDFJrmYcnNA+oN3F6SJ1LgBao2C6McC1nkKw+uSvsBHPUBwyuaBqPEfLcMD3fHaeus
	JBnlc2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNs8D-00000008Nr1-3Jvl;
	Fri, 15 May 2026 12:59:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNs8B-00000008NqO-0aHJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:59:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45562c41ec7so4710320f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778849944; x=1779454744; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skcHqYBlrM1emWOE4306eVJFUzXeydUKGsGl+9rnsaI=;
        b=YHi0n2ENTIt67Ir2eXZirGOAWa6UCq/u2kXf1hkVbXbMcN3MynJxd26c5p4zq+HV8M
         Nsvd5mZnrri2UFuwDSnxIFFk7Ai8QMcmloxH/lzwe+eoYvj2w8o+3CIh5KcTeQ3lk8MR
         FettEhNAzNidU+fNK6BvvckGFqaPe4T9nGdsq8yE8TwBz+AgfafrVi9h2cedl9IvCK92
         SlQ9oOgSQbpvL/+kdoiq6T7OCNsUhlxkmBtmKUl/7KuXCp9pwXFonHvnMVn4EIaTQNOI
         A11Q9PTHTDXLOuifz71unjzfV+UVApyWZkcURyFPeTdDgXPf7N9T/tH7Omxz/OQFN+wb
         yT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778849944; x=1779454744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skcHqYBlrM1emWOE4306eVJFUzXeydUKGsGl+9rnsaI=;
        b=R9TXbj/icuNlhsds4YYzQhHOAugEmuCYvF7nzw/XdzINS+F05XeZr88wvTNvfFt0kV
         xxyCQnui48pKzfIvor2jq0uztFUO/0pDxXRe4znqkZUx0fUmWSlreeP7prANQyaGcVGL
         UwO0aAVR7GWZeOFnI07+Qdm1YvkQO/OdWlKQ5NIuzfWQcAVu5yb231oEpyZMW1EH+gPL
         sA55Jbu4HZeFCNipn2IVePygW+Fxnze8fO4lAGN0XKngQLJgJxoVIqJYyH2nPCHUzCSa
         q59/qBSTbWID1/A3533cei2H+IwFcSxfU7lh/aRl81RNUYAU/ajt1NFztJWEx8qfvE2z
         gbhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sypuWcz7wLnou4ycXkXouZXQfW9MMKPOi4OQ4MNrDeYy7pOmVaG6Qgk/n7YwtNX9BpvPhLxQ1XI+bNB8GB81q@lists.infradead.org
X-Gm-Message-State: AOJu0YwNeBOQoN5LyEZdg64Y92g82pgNDN+hfiHC6DX8W/DXqUeo/+2w
	c5NwaBs/y0FVhaNHjHMltYdt7a+UBRYAaoV4yRa3WXpkMenqLivPbaDI1wBBPBdonw==
X-Gm-Gg: Acq92OETC4ep8kKGwtPxKzmBeuBNNCRFACcNayy5WtztC1+SwRrbD9vb+sLFESpJpce
	EkxlyMTaBOrkTlU9eyPRXXiMrnRaplU4WwUY8m9PStT3xcWJ8GMhVjQUKLsesfasWEIE8LrtR3e
	avqsEs/HEjpXYm+rRSQM61BYN4TN36JTKlFrmuFJVviF2llwtZybxLHPPnlpDTTzVf3ACuZxOBH
	quxed/K7g2vvQilfe6LxhaFBwKob15tyOiOjjPV6QvF3CDjzmtUQ7TDH1lUzVUippWrnd02lkcO
	VCp05IisMKeduDiezWvnuBIDbkbOD1MFa7SYFcbDmLY2vcy4d1Wv9t3SOHkqVGU4IZ/+HPy9ETc
	KKSKtkaSusU4dPklLBi2t1+SrTuTeAUe99iYQPe4nZjJAyKX+zwq4smfm24f2rIj7npRiFn2Uga
	9M9t4Yd5ty0NELkO3XEctyWU5umZslXm120+B+AePM/5cDVq/4CS8oYXaKtb5PYBMw+KVlwAur0
	0tqyg==
X-Received: by 2002:a5d:5d13:0:b0:43d:7a97:78a2 with SMTP id ffacd0b85a97d-45e5c5e3384mr5357411f8f.28.1778849943799;
        Fri, 15 May 2026 05:59:03 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767ee0sm13812111f8f.1.2026.05.15.05.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:59:02 -0700 (PDT)
Date: Fri, 15 May 2026 13:58:58 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Fix nVHE/pKVM hyp tracing error on invalid
 desc
Message-ID: <agcYkufvLE-siBum@google.com>
References: <20260514162624.3477857-1-vdonnefort@google.com>
 <867bp5x9b8.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867bp5x9b8.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_055907_186597_296DDB54 
X-CRM114-Status: GOOD (  16.04  )
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

On Fri, May 15, 2026 at 11:21:15AM +0100, Marc Zyngier wrote:
> On Thu, 14 May 2026 17:26:24 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > pKVM must validate the host-provided tracing buffer descriptor.
> > However, if an error is found, the hypervisor would just return 0 to the
> > host. Fix the return value on validation failure.
> > 
> > While at it, rename the function to hyp_trace_desc_is_valid() and skip
> > validation for the nVHE mode as we trust host-provided data in that
> > case.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> Fixes: tag? Should it be considered as a Cc: to stable?
> 
> 	M.

Fixes: 680a04c333fa ("KVM: arm64: Add tracing capability for the nVHE/pKVM hyp")

It is only from 7.1 so no stable to fix.

> 
> -- 
> Without deviation from the norm, progress is not possible.

