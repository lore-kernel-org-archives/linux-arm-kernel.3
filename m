Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F2CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAOjJxhCfv8VWKL7BVvY9ZNzsKcaY5YiZqclR7H4/vs=; b=ks8T9KZww15y/eCOzmrhzqkU9y
	cu0ObeJLMnm82kJtTg/gGbuaNfoIQf6tFXjhAOfiovcLjm+90diYE2Sz2iUkPX1xmrM7Nfx195H3F
	EySyNgYwR9A0MLT1NU01aDfr06P4W4fXeDx25nWxUeVscH+6LDIABtOw3UgL1H1//7c8ZETeoZrLz
	EKTuWHen1xOyygDWfZKv/wNS9sIlIYzu2gdiTgn7L01JS8LKs6kw5sMTur7Z0djpI07J62YiB13iS
	pFKpd3SkIHeigNjRrELMctk41omf3o5+WzGAolqm/dyECuvOdeR8SkAy4jVoBizqh2Et9+6UYSYbZ
	ZkpgfHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPc4e-0000000COyy-2Ocs;
	Thu, 12 Jun 2025 07:10:08 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPc2W-0000000COnW-4Alc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:07:58 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-74849e33349so668340b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 00:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749712076; x=1750316876; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAOjJxhCfv8VWKL7BVvY9ZNzsKcaY5YiZqclR7H4/vs=;
        b=R2mQac3NALwXO5ff6rDtJre0mzUS5O2DNSnPSGPBmDWgUmAAPiMxnas6q9r5OhqfTA
         zskjPb8MS6dXITls74T+voQptmO9vLHTMVR7g/MhjANJewAjHkWewrOSOJ+OM4BmijfO
         5s3T40YyT7ej9Qqw0FTdjXM1KBOSyKK7U03Qj62CR7FJqyhH2MPkdER56+TbVFtAb6w9
         YWa59w39bolHC6qRqYI0s2oobq9MrgaffD2V3Gk+iQzB/3skHhuGMOFDgpwZTEUxxMbZ
         OkN2fI7ycOl74e7lRRlxJDogEyry2e4yNFVrQqHwFDXc+SCUfX7ygDVFCR/s8AukhksF
         Jy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749712076; x=1750316876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAOjJxhCfv8VWKL7BVvY9ZNzsKcaY5YiZqclR7H4/vs=;
        b=jThffZ9gO36phf43zRZzEGTWlVOszRoysRGoBdUsy4dIgKwn0SF/oq1BD2azigPuHh
         G4oKC0zIJdWdGK5fjmvrkerQarcmBav7PFjZzRiLAQDIY7tJq3+MN3XhARr89mp4h5Yz
         LVixkpNOuME+bNy9/qAxHEeULbGM0SAlbEpRAgtpGlI0BCaV+4QS9OD8S8k1wcOSOtFT
         YY5nHjiSs74PpwPv0RHO8V4YIQ1HKfMXqBiee0baOw92JeEpBBzMTxLyZ1ZIhYmErTf3
         rVd3TCGZ0+bZgVrMMO4YRi+zS720NrPDU+rdmRCQOBlIh93c+uBn3zSVOxZ1lZWNSIai
         nCBA==
X-Forwarded-Encrypted: i=1; AJvYcCWSBmdC0SMGv/Hne45afI+gKg8IO9nNjcNfAu1K0xtnHz7AuZJXg/VvoE3/VJk3Vra7q4et8bmvhsDqUlP6hMFy@lists.infradead.org
X-Gm-Message-State: AOJu0YziNiULDXDXQarbv+C3eMjKFtVgIisUw1SZlQGAW38SA5vgM7Yw
	czKzD0ChxL1OTLbNnFjuQNG4yMi8dMg7x4IGVX/HuMyzMc9AbY6SmoC6r43ljtAJ5IA=
X-Gm-Gg: ASbGncuOaC6AgdhoW1vxQXZPMbWiFlfeqr7T9KetA5kSBoFw1hEiLjctAR92mWouEeJ
	LkywBUCUrfaGQgKSZIe7U/6l+I7zQUIrmeo8BxOoK6dRGmkUKwV4B8XIXkR7LwA7c2bvI8cE+wI
	/kfsdsLtc3d/Bo1/72w6JB+EMxmGgLaHMZ7fZFmYk1Vrcj1TvpZrOP8g8ETbitXoiyYPGv0DcBq
	i85NUsAJ7fooEtVOnsx85PmtNzl8n4eVtLLWHQdjmi/OcIeHsScJ+aeIV7nJwRiAxJcFDSdXZnn
	khExm0/82r2iMBFtFmCYj8LLW41iFUMzEoEdG2RBh6v8wsY3+OQkKx6hcmqoOVx3i7qxLSmsVxD
	gpBGqN3WhrS1FF/9ajguK
X-Google-Smtp-Source: AGHT+IGfi33QMmP2NxREt3lPErfPBTHFxGftgC5xTDBsF/Wzhv8TdBvW48FWIe805inRamkcxDRnzw==
X-Received: by 2002:a05:6a20:729c:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-21f86600846mr9497042637.8.1749712064431;
        Thu, 12 Jun 2025 00:07:44 -0700 (PDT)
Received: from ankitchauhan-Legion-5-15ITH6 ([2405:201:4042:d128:1895:113a:65dd:3ae0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74880a06b64sm738064b3a.143.2025.06.12.00.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:07:43 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:36:56 +0530
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: lanyang: fix lable->label typo for lanyang dts
Message-ID: <20250612070656.bir2ywkwu27gxs7d@ankitchauhan-Legion-5-15ITH6>
References: <20250529-lanyang-lable-fix-v1-1-8a2dcb48bda4@gmail.com>
 <3fe9885cc54a328932915a63816ac1b7952689a2.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe9885cc54a328932915a63816ac1b7952689a2.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_000757_035954_FE7BA200 
X-CRM114-Status: GOOD (  15.78  )
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

On Thu, Jun 12, 2025 at 03:01:58PM +0930, Andrew Jeffery wrote:
> Hi Ankit, thanks for the fix.
> 
> Regarding the subject, can you please use the prefix 'ARM: dts:
> aspeed:'? From there, I'd prefer something like:
> 
>    ARM: dts: aspeed: lanyang: Fix 'lable' typo in LED nodes
> 
> On Thu, 2025-05-29 at 17:09 +0530, Ankit Chauhan wrote:
> > Fix an obvious spelling error in the dts file for Lanyang BMC.
> > This was reported by bugzilla a few years ago but never got fixed.
> > 
> > Reported by: Jens Schleusener <Jens.Schleusener@fossies.org>
> 
> Please make sure these tags reflect convention:
> 
> https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
> 
> Rather than spaces, they use `-` to separate words, so:
> 
> Reported-by: ...
> 
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=205891
> > 
> > Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
> 
> Finally, all the tags should go together in the 'trailer' (final
> paragraph). There should not be an empty line between the `Closes:` tag
> and your `Signed-off-by:` tag above.
>

Hi Andrew,

Thanks for the feedback. I will make all the necessary changes and send
a v2 PATCH.

Kind regards,
Ankit Chauhan

