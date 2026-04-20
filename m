Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD342F588DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ReL9mAV/3BRJ2Kkh/ldlZKgZcqKVBFpRWFlO3tSbuI=; b=pQfYe/4pUS1Zy7lefuHtCU+AeT
	Wq2De807xSojsuNqPq/FmjukTYjexL5vsdNjJmRLQmh9LmahnRMpz8DMQyqxLqEMFvXlzD0R9YlEr
	IDZG4pKWuwi2PD/3c2TOUwjakv0PIpMjXqa+tPn9IEppJ4FvS1Ul/iBfUJkPBjmmsVZuYyR8sDprt
	gXpZ2UXUvxG6HnVbsKXZRt7HKUAazAJdG2OoMaCyTUOUTQQUTZS1PZr/rtZTbN/bwKuqKI7fB4pC0
	dwiodff/PsHg3YJWuW+/TP5SGF2wOxkJbxHd2YnXSBl1JD5mR+TNfIfPtejSKz3ekXdN9V9zVIMnN
	T5s5Vilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpUS-00000007AHY-3fHp;
	Mon, 20 Apr 2026 14:20:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpUQ-00000007AH3-0ur4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:20:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so96335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776694840; x=1777299640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ReL9mAV/3BRJ2Kkh/ldlZKgZcqKVBFpRWFlO3tSbuI=;
        b=LLgkW8vJQLig2efwLxzy7z2RqR0ukhuMsZFYuKXseiJh0dQisE+rmKwGWmcKTpHjU3
         jKHzAq+hZSWc5wHMC2TP11cFLF9nxzWg2LpYVMuKk5aZgwlCZ3bgjXfc5uGOTfKZsMZ6
         e5Qx3Ar/BEuaoCZUw2UKixdYX3SkPkS3NbEc/trBT1Md+4vTG8J59menrIFHPtjleFRo
         n4w5rwgzrzfRnaes/z3zAiGxdPUdHFTeGm2bC7gSmgKlkDQXN5ocfiXQwTKutHGX8t7A
         GmqIIEhXMeqvUlwgQEoFU9rfDKunirCOvNZeMoSHnlKcF1XQIoKR6SgB9zre3C5d05L6
         1b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694840; x=1777299640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ReL9mAV/3BRJ2Kkh/ldlZKgZcqKVBFpRWFlO3tSbuI=;
        b=l8UqaZrWi9y1OcQiEzdtLBpfTCOIcqfW3aKNAiVhMT23C2qdt3n8RS8Sv7yNJj8XH8
         WRZGTgt7c6XuAJQD50USFXal83R+vmNgLR4URb82KA4eJvpv/QDrkQm3oy0FCBS4pniy
         aQCHVsp9PupGWyZwONFg6I8Bv4+jtV4cvLDZmDf2RNyeXDGcjPR3t4VUEHfyoW8VKC3z
         Xa1t54zGzUUetuoESnyR485sotyi9EWvhxxEFX7ITT5oMROCFctw8dV0PyqzqVh4Lye2
         PzsAggzBJih1GupuoAJFn6FtoOThvI+3YHpO+FmuTlK5lbI+dOngIfcKSLtPWEdMaZy/
         oEkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jFQA6J2p0uDlflMVWNcKcRhBMHZ3TXoyPj2cPgTjc3SVvVsEfx306CrZLI2TBnzVOGzRv0wDdoAxHupXlcnEK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr+UD1EX5jyXKwOYszCI6LwV70s0wn/W80poHclhyGcFGJuoVd
	GWZ79jLLfA7uw9cFa9gdLkh/5vxxstZcYzpIAmi+H1k9w8aoSvOTyEekAC+7lDq65g==
X-Gm-Gg: AeBDievY/awqpBMrq5HBQ7QOyHlXVcfNobfRG/Gutf4twTHV7VjFL1/eLwNwMlbIEyW
	S3ym9/oKO5vIPdiKzCKEBKVXwG0tJIKQVTGodp81aGeQndGkI0bsAKmtfme0Rm61F+KYfq+7Zs/
	D+HsMi5pLVIbtZF+QO7p9iv46AiRwe3GFk/unya76RZgSMjbrHf60JUfy/ImVQ1oUdNYYkFTwKm
	XEtI2rslJ6i2SG3ydjFus5TjQoNsEXy4D+E0mooffIajMMb+o3dGRHXlTiaiMXDie3upbIl97Z9
	o63oJBw7twvw48Pq6HvqNUYRpLrp8Un6oqroAN4F8RoxQwkAxU4225tF02InysniKRkF/UNpnGq
	t1YqYwfVHlZ3WX02Ze+GcNeR/ypd0pPYZNMi/ZS45mFWpbkP9JeYL7veEwh1DtI58UBUf0bnhMO
	YhVh81DOJ76GB32vMcBlIpAc6i7zi3+cjeI5g1kwT16xwEQmawZL5zUsKV/XhXGDQBrE3evHExM
	vcCn85+BJF1s68iSyQ=
X-Received: by 2002:a05:600d:848c:20b0:485:4133:4021 with SMTP id 5b1f17b1804b1-489013bd634mr1619625e9.7.1776694839891;
        Mon, 20 Apr 2026 07:20:39 -0700 (PDT)
Received: from google.com (117.15.199.104.bc.googleusercontent.com. [104.199.15.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c318636sm86355285e9.7.2026.04.20.07.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:20:39 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:20:35 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aeY2M3v97c00JjFe@google.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <aeYbdmshGZJ4GhXd@google.com>
 <86mryx2408.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86mryx2408.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_072042_342920_3692397A 
X-CRM114-Status: GOOD (  25.79  )
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

On Mon, Apr 20, 2026 at 01:46:47PM +0100, Marc Zyngier wrote:
> On Mon, 20 Apr 2026 13:32:32 +0100,
> Sebastian Ene <sebastianene@google.com> wrote:
> > 
> > On Fri, Apr 17, 2026 at 06:57:59PM +0100, Yeoreum Yun wrote:
> > 
> > Hello Yeoreum,
> > 
> > 
> > > When pKVM is enabled, the FF-A driver must be initialized after pKVM.
> > > Otherwise, pKVM cannot negotiate the FF-A version or
> > > obtain RX/TX buffer information, leading to failures in FF-A calls.
> > 
> > At the moment this already happens after you move back ffa_init() to
> > device_initcall().
> 
> But relying on this sort of ordering is just making things more
> fragile.
> 

Thanks for letting me know. Since this is not a solid construct we will have
to change the driver init code to come after pKVM in this case.

> > 
> > > 
> > > During FF-A driver initialization, check whether pKVM has been initialized.
> > > If not, defer probing of the FF-A driver.
> > > 
> > 
> > I don't think you need to add this dependency. pKVM is
> > installed through KVM's module_init() which ends up calling hyp_ffa_init() to
> > do the proxy initialization. The ARM-FFA driver comes after it (since
> > pKVM is arch specific code). We don't have to call finalize_pkvm(..) to
> > be able to handle smc(FF-A) calls in the hyp-proxy.
> 
> You do. Without the finalisation, SMCs are not trapped by EL2.
> 
> And even if it did, relying on such hack is just wrong.
> 

That makes it an even stronger argument to move the driver init at a
later stage. I was relying on this to trap early ff-a when the
ARM FF-A driver was used.

> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks,
Sebastian

