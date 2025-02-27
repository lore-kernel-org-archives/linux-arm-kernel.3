Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138B3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=witULyw7TtoqLetVGW1Y6LysfNxj0X5B05/dTt9izbo=; b=lNXhd7/LaUIpCQW4RF+ITXQOmt
	sQBg5UEtewWYk/fma/e3lYv/Jo6YfmExc7qG1cIYJp7o0+OxdFoTL0A18bSZ6sKEWcg/X4EMrNqwD
	VO2mmhyezZ3yNiqyMzYPwkFuNJ4z2Qe8G8Zisw5KN566es/0kfqEM8yb3s2wUT5DSw4JSg3xgupX8
	0Hawz9hleLgGVrJoakpLbKqbcEsVVb1uCd4NLAJ6DJ5s8eumrQw+57uW0XjNpgBxoHnxyEfzTgb49
	tLJzZbKgui62aYeEc0tqTlKyy/4Py87xv5EUHcFimewD6J5XK3yGR9FGE6bFBKNLrv1/uH8w0XlHS
	zaxOj+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjlW-00000008boS-1wac;
	Thu, 27 Feb 2025 19:41:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tni9U-00000008G8P-1jS2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:58:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4393ee912e1so925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 09:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740679106; x=1741283906; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=witULyw7TtoqLetVGW1Y6LysfNxj0X5B05/dTt9izbo=;
        b=2J9AqRjZWisBF1AvoE1gh73GludGRt6Op/zHNpJxh9IeQZZvTgLvVPACYwXy1zgHqC
         9JxlPw5O7iCr6PTULrCk2APPepbGtnxcfpW1pbaVxCh6ceP1V1v52/21+gwOGR/TniOt
         SC51kXmbLHjzbyaTRQk1SGQaQO/te7f5BAMLdjjcm0QUOnY7UP3DVHl6+l41vo9wRgt0
         XXrQL7vxKJ2qzHO7/Joz0rDqmn1/KceNyEc8Ga9+YIGgdSXwS5ccxHZQcjlZGsqX4D5j
         8d1+JALF8YwTBvnmWBwS9eYSTInPJ/75bgJOD9NbqXwt0gOpHtc3/8N1aOZ/PU4F1/90
         l4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740679106; x=1741283906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=witULyw7TtoqLetVGW1Y6LysfNxj0X5B05/dTt9izbo=;
        b=dXi1KHCeqsixWguZabLS9lysTKAVeIgigaWN5wtV4PEB0aMHjwOzptBKdw5IVhO1US
         VQzG2gnIiBgavnhU3O9/2kTJowhdU5i4aSm974+AwN6g4No5mY8YHMNq5hPZIJ93ZtUJ
         h+yWMNXah5c2q1mZFkmZvECuKJjNF1kNFhGgrgtG7EsVm2fH7UpEW5Mk4LvtGBNsgTxS
         Q1e2dyrDvCHiCEsu+Tbir/jaS3sJybMBtEOokodMVJOoluUS8WJ0rccZgjC5pnjMczhK
         BV9ADsWxT2CrMsnnFhNqUgbpW++P0fhqPrzL0f98a1Mqq/0KqY25i698Oxc+R49Q3PJE
         PL9w==
X-Forwarded-Encrypted: i=1; AJvYcCUSXc+risG4SaBoqMExypqUMJQAAo1OS0aqXdVho9Dcl4uCCXiq/U7SC/yFwXitO79yA86BKLiAOReF+1SxJTfv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8ohXBsDSqDcvKTBEFsAbNl/cOW6Xe4cRUVTMhXZ5PbBVN6i82
	N4uLCx7vt3ETSVx3rh3D0P1I02HwgX6nmGhqtgCToVDh5CG6gDZVFjSBCM5PFw==
X-Gm-Gg: ASbGncvHwcYObkatH3ykpaa/LxmHlJcH9MK8Lq/ZNaDSE02FCOyiQkl0Uanvtc/6XIO
	lwGhI3Ox6FWgQYIsocxc2067hAJVXIXXVBgvTpqkUO2gAagXd04ATy43JGrFQBfx6It9WSShFel
	TgKXaBVNxbCshCTxxu+YQuWaNwWFDYoVjUvyIpkqfuDhFawYtdRJTyKyyb/qrKFTPmhJeASFWbv
	aY16dGUO4ihQfBNn1OTAfJUsA8rkArBeSYlj7xfzmW4As2+RpsyLliqBeLYc1ipTlVH68HuMK4N
	8ji6MDd4ePFMPA1bYI0t/UJwEoJyJsY0xYaAZR/fTrCq/bo0t63a2Rj14kDPwMTuMKaRlg==
X-Google-Smtp-Source: AGHT+IGXNHWKRbpRDhtRxmSOQkQhsusbKI17eAfdufiuBuU7YJHxATrJHQS1X9gdlxiAiDFx96bvtA==
X-Received: by 2002:a05:600c:3ca8:b0:439:9434:1b6c with SMTP id 5b1f17b1804b1-43ba6bb74a0mr15565e9.3.1740679105829;
        Thu, 27 Feb 2025 09:58:25 -0800 (PST)
Received: from google.com (100.235.22.34.bc.googleusercontent.com. [34.22.235.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a7868sm2738983f8f.24.2025.02.27.09.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:58:24 -0800 (PST)
Date: Thu, 27 Feb 2025 17:58:22 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, will@kernel.org,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 2/3] KVM: arm64: Map the hypervisor FF-A buffers on ffa
 init
Message-ID: <Z8CnvkUwGKxcz2hj@google.com>
References: <20250226214853.3267057-1-sebastianene@google.com>
 <20250226214853.3267057-3-sebastianene@google.com>
 <Z8A3RLoZxVxcz3wj@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8A3RLoZxVxcz3wj@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_095828_456387_DE5F8123 
X-CRM114-Status: GOOD (  20.53  )
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

On Thu, Feb 27, 2025 at 09:58:28AM +0000, Sudeep Holla wrote:
> On Wed, Feb 26, 2025 at 09:48:52PM +0000, Sebastian Ene wrote:
> > Map the hypervisor's buffers irrespective to the host and return
> > a linux error code from the FF-A error code on failure. Remove
> > the unmap ff-a buffers calls from the hypervisor as it will
> > never be called and move the definition of the
> > ffa_to_linux_error map in the header where it should belong to.
> > Prevent the host from using FF-A if the hypervisor could not
> > map its own buffers with Trustzone.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c     | 46 ++++++++++++-------------------
> >  drivers/firmware/arm_ffa/driver.c | 24 ----------------
> >  include/linux/arm_ffa.h           | 24 ++++++++++++++++

Hi Sudeep,

> 
> Can you post the code movement from driver to the header as separate patch
> so that I can take it separately to avoid conflicts with the other changes
> I have. It could be just fine but I see no reason as why it can't be a
> separate change or why it needs to be bundled here.

Yes, let me do that and I will spin up a v2.

Thanks,
Sebastian

> 
> -- 
> Regards,
> Sudeep

