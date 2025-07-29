Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9FCC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8BeCJxT0E9y6LqcrNbSOsYh4JRswSE7zt76fN7xljQ=; b=gvk+/UbiduXFagJRy7d+7bqiy0
	4NzfDsW7UXsduAJ26uf22PNezJ4dv4eLXRytblHdxkVEWexgJgnWDdr0mnUpoMJZrq1njLW38AI2f
	6TAefN6kbopGxM5J4XaoxXB22EckwnQtq9Wdsp/agbRJmaHpT0W8V3sLzwwwrIIwnWT/9frzrPZ/Q
	s48XVFew4Zpd2hgrVTcTb65yiQCoavVBTrU9uCn8uc97Bc+/unySib6saHhvjiyHQKxl/3+qRCKhY
	MbowprDJhTmzgqNzZMiI1bPsVvyFeZzlHE3UxUGwezGGvuG2Bidb6oPesMFpkAJR34FqnlhhFSJCD
	GcFF1pVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugh9V-0000000GTRY-2IHe;
	Tue, 29 Jul 2025 10:01:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugh3w-0000000GSY2-0mbh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 09:56:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4561b43de62so71295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 02:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753782958; x=1754387758; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y8BeCJxT0E9y6LqcrNbSOsYh4JRswSE7zt76fN7xljQ=;
        b=A51gCac3aToa1bIfir6r3doEHYu2dTl37OIlfSP4At2ONf3mQhxG+l6bsh59GYd4I3
         v+BzJOx4l8m3hXf8DuqN4J6puXnhRaX4VmNpT4ztcOdnLogOdCqpedyDPfhMCOAlf6Ws
         o6fpFHVmmGcYgmK/oSOJA74tDHP/pg7OfHd1DuVa5EpIocq5BLqMdwCkdK5138Qx25BQ
         2MT2Rvdx7VexF7uK+7lT7DvZw2pqhbCRRziTRCNS2cNk4cobfG5W2u6aLz9bqUtEFGM6
         DBwRGQMZnvCXuwPvyX7bXEU0ExK+2jPDMvoAHGDe9P2Q57FNXly688tE+jBdaXAr2Lrt
         MCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753782958; x=1754387758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8BeCJxT0E9y6LqcrNbSOsYh4JRswSE7zt76fN7xljQ=;
        b=VtW5O64oPyn8PnghRIi4RG0ZZX4fafeH/dRSuvPp17cOK3GjlT/f6n3rl7HeciJkP8
         OVQ14E/vXTaBBZj420vgRYTSQgTveCNdnVAwAynZHgSoeR6Zs2Papt571OcaC1m3eWps
         xuApGeFjn6MxfHcYFOMXKY8ld/oLVexVu6XWFgxrfTt5t9FfBEkHD+NsTCzvOFdm1XiX
         6hceOa9TaYxMbgkyDtwy8qU0qkHxGw6VUN5Ipum0cnq9v93OjPcACX9iEKDFYINV2vel
         eWgFl0lOImZlcyMBhcba1FBagq8sY5Q8VZINh5l/Mm+YWR1URJKEMwj3t6tb3gOzXvSl
         qtvA==
X-Forwarded-Encrypted: i=1; AJvYcCWKQG37Mr+4FbKFGsbQZalGhAxYJeD2DstmxosB+G4VdEOyrnP2L7qT6ffV4IIgPaAzyMcskl5hKk2XcWcL/5e6@lists.infradead.org
X-Gm-Message-State: AOJu0YxtAUlB40d1qGQCOFN6RhKxGzIDplZY6gVFkNxFFUIMm1mjznRu
	QpYhk5qSVQ+D5b64lomGw3QN4ZznO6K/kNqrRek6vxYC8z0P6Lrfen0iNJRmv135+Q==
X-Gm-Gg: ASbGncucIMaUpVV/q/mSTWhGgX8GCXVEwSDC7sHoE8ohihNiPG1U8t1vud043zv4IO+
	TE0DVKbYRNwWa3pF1BZ2kq4DMIfwwCeKpY9xsWh8/uNdZ7mDRwAvitGy63Ns9vmFMEofrK6308y
	7QlgiUIRxJRbBAa0rrlTb6HhTV9IV2Rsw5OPRsF5yQBf/1ZVOeyKqjAbxDA5BNZ8NB1PkmpZNF6
	z+9FjwiEq0jptSfUyJ3tkjbHGnFg/eqBiJ3cqNIeafHN08nSsg7XXny6baXIUnQYfTb83Lei2EW
	boMp34DJGrJlw7LjhRFPzm6AITfFTznywOa/3bLjXC79vSI5ONxJMRyAkEG2+lS3STTO0CBFrzU
	Lf+JmB6pk1xERDJaGkCxmV1Sl9XxK/xkSdOgjnt9LBpaSSNR58mvvGJ7mRwLf
X-Google-Smtp-Source: AGHT+IGzES6hqfjR1ngn6YMh6m2QMnuLZqGDQbq8stqciYuYMIFTwvOmpG+4EtUrCFw2V/nQTG/heg==
X-Received: by 2002:a05:600d:17:b0:453:6133:2e96 with SMTP id 5b1f17b1804b1-4588d58f585mr1058175e9.0.1753782957791;
        Tue, 29 Jul 2025 02:55:57 -0700 (PDT)
Received: from google.com (232.38.195.35.bc.googleusercontent.com. [35.195.38.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4588e33f8a2sm19702345e9.0.2025.07.29.02.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 02:55:57 -0700 (PDT)
Date: Tue, 29 Jul 2025 09:55:53 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 20/29] iommu/arm-smmu-v3-kvm: Setup command queue
Message-ID: <aIiaqSVtSpX7hr8i@google.com>
References: <20250728175316.3706196-1-smostafa@google.com>
 <20250728175316.3706196-21-smostafa@google.com>
 <c8da60f6-4083-4aac-b921-d57b767fa895@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8da60f6-4083-4aac-b921-d57b767fa895@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_025600_231629_62817249 
X-CRM114-Status: GOOD (  12.47  )
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

On Tue, Jul 29, 2025 at 08:44:03AM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2025 19:53, Mostafa Saleh wrote:
> > Map the command queue allocated by the host into the hypervisor address
> > space. When the host mappings are finalized, the queue is unmapped from
> > the host.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> 
> Your SoB must be the last one.

I see, thanks for pointing it out.

Thanks,
Mostafa

> 
> 
> Best regards,
> Krzysztof

