Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73037F54ACD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8Ez8KE3X9ncxAR8sxSpYM0vX0MuKytP0Jw8nmLk1y4=; b=bqGq1zi+v9dn6GyMOVIZWWtMO6
	Jz/AUQehbNYXa33L6ooYiEXdO2mYtRuBKnuWvyw4tVgjXIfgs5QUArI6YBxb3BW5tYHKrana0O1Ni
	P6UDG70SlQNMjLpUJJHbtf1L0T4n4x7KzYFCxmUrVozCXVnvoAL/qlFrJSUW/dubTujGFaO/cemH9
	vzMlMNWXIv6MGy74WGLQmmasPhy1bNIlWxJUgNlXDqUQi6OxhHj0Pyvk+o3hNQrKpSSjd+1q1Bl8I
	9t5Wy8tnkK0unA7FQhNeUpEk09S84V5ZrzM9DYP9nxz5WALz/SRnIG5l4pcyV2MN8I+qoNJtecHV6
	VjYdZBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53JD-00000001iLo-3PMa;
	Tue, 24 Mar 2026 15:04:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53J7-00000001iIu-0NvX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:04:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48569636800so77975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774364675; x=1774969475; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x8Ez8KE3X9ncxAR8sxSpYM0vX0MuKytP0Jw8nmLk1y4=;
        b=CXYgjuZVtqkzmFCaVur43HTHHn3yLhCHT583ORaNdYSvOm6GenamLS3qn+su+Sae7F
         n2s1XIFDiSYkA7wvd1QxgGKyYBrkgIWncCrq4aCKAYxMT7tIxgF+YQqlQdbzz77c1DM4
         F46AWAYCwAKlR3pSimkcWQEzRHc73cVhWzl/hXbJr/vLUcd53zwNmqccnoQdQ4Cm92NC
         ZpbGM/TFWQ9rKSsfBaiPFmfIb9yDnKJWGFdL0lX0EBdy4Ab57F6h1a7RpbjKrsGajqce
         aUxe5ClQI72hiAYF5F9htniSI9DNxQyglx8EmltC9NKYaZBbvBEKC2YWzFh2AZ4m3MFn
         JxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364675; x=1774969475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8Ez8KE3X9ncxAR8sxSpYM0vX0MuKytP0Jw8nmLk1y4=;
        b=Mul3apEhtMMa0tUsU4Oeh6hBPvhd/dTYZIT6T9csPSwUHV7LMlfKm7OAuQAsiSz9g2
         oohbIKnXazEypis6f2AIVaeo14agHo2WJOl2MGX0dwCebf/Sg+61Ga8jqLVJjYmtSYsm
         MAT8KGha79A5CxSg4WlYBKVzlvl3TSyjV1vD77C7g2pcdF4uKCq6ADZG4BryMsHQZ+5u
         MNrwEN2D0FAWGBToQqfhXMVdHE9Uy/hpKpOUEwT009mWsrXWcxOTDltwMYaazpAEYr+n
         qq4QPtM1iRy2E8TmhrQnsTD4yZfECMDFZ2TNBpLfVluFFed90oBHWIGVEQqmV3Bg6ils
         m+ng==
X-Forwarded-Encrypted: i=1; AJvYcCWgcM14J2hrScQFACkaBJ4jPED8ffqcGsMJ3yewPr3PuhPs7MndUOP3+2BgS28q8SMYTD1f6Eq8BsWmYhAsiwRE@lists.infradead.org
X-Gm-Message-State: AOJu0YwXJMOT398c+m01QobhPlabVU1JWTps3kkBSJYAeisRYR+nmLE7
	sB6SiMuCfycsB7IkNNLuxDRGi7qqA5NfTOiWhPZ0iVS+WU4vf0LBWdhsBp4rBptavw==
X-Gm-Gg: ATEYQzy2Jwzz5Gk2/UuK+zcaEbNC7n5L794HMN1aJi9a6Z6LvaF9gFQPGpYET8BWPwo
	vdhVYRefCWdw7vskT3ugmXMKZAMynpVHFqtF7ecuzmh5o6SLUez9/HrFMKuw1YwiTZjA96Go+1W
	bHmamR0ecousq+y1jZzP7rApJ7xDkXSPMQcExRYH/DETay71eGizEo75yI+4uRPdQ6qNPCdBH+I
	ZVQV045MIIhxya44ZTABGRdVuI9nbMwt25RyBpDXSdsAMdJDEukETc06mnPD1kMOSzCkLDrqVSY
	s2Ufh6KjIYC2jdxR2P8IJhnb2m+1PvC2njTJWjDcZDF3qZ/0ZEQdu9Xh990APVO9KhhAmQ6S3EN
	B36evwgyUggzFXGzZeGgoMSfDsE3eVJSpsuinWD7u0iO2zqkU2EFz7kHe6XpU/iMUgHwGj/yo7X
	iBnQ1kRRZc4ZaZI+WqOCfr5BeKeiJ6eHAQkTxRblbCb2qml2PpLIgBGTVMhzf88BqnV/Q=
X-Received: by 2002:a05:600c:6388:b0:486:fd5a:18db with SMTP id 5b1f17b1804b1-48710f55c35mr1233335e9.11.1774364674685;
        Tue, 24 Mar 2026 08:04:34 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48710fd2c4esm38080035e9.4.2026.03.24.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:04:33 -0700 (PDT)
Date: Tue, 24 Mar 2026 15:04:29 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com,
	oupton@kernel.org, suzuki.poulose@arm.com, tabba@google.com,
	vdonnefort@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Inject UNDEF when host is executing an smc
 with imm16 != 0
Message-ID: <acKn_ct-tmwxEwRB@google.com>
References: <20260324135728.3532400-1-sebastianene@google.com>
 <86tsu547ao.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86tsu547ao.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_080437_140374_DBC5103C 
X-CRM114-Status: GOOD (  18.06  )
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

On Tue, Mar 24, 2026 at 02:43:27PM +0000, Marc Zyngier wrote:
> On Tue, 24 Mar 2026 13:57:28 +0000,
> Sebastian Ene <sebastianene@google.com> wrote:
> > 
> > The ARM Service Calling Convention (SMCCC) specifies that the function
> > identifier and parameters should be passed in registers, leaving the
> > 16-bit immediate field of the SMC instruction un-handled.
> > Currently, our pKVM handler ignores the immediate value, which could lead
> > to non-compliant software relying on implementation-defined behavior.
> > Enforce the host kernel running under pKVM to use an immediate value
> > of 0 by decoding the ISS from the ESR_EL2 and inject an undefined
> > instruction exception back to the caller.

Hi Marc,

> 
> No, that's completely wrong. SMC never UNDEFs, unless EL3 isn't
> implemented. You can't just decide to generate an UNDEF because you
> don't like the immediate.
> 
> All you are allowed to do is to return an error code.

Thanks for letting me know, I will update the patch to do this.

> 
> Thanks,
> 
> 	M.
> 

Cheers,
Sebastian

> -- 
> Without deviation from the norm, progress is not possible.

