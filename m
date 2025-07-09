Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E91BC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5h0vY+8yWR6d53ywzrllmdRVHS+9LkknzDUPnvu0s3A=; b=Wz72/8ojpATp0HsuOgVD9WFz/I
	NYYeSH7P1/UalIevAoAnEe+CFuKWI53ZyV96lVMb75lDG3x0wY/vaR4G3zFBCCltQcF86iD4jWXY/
	gg89/TGENcHcqtPjFdIaPhT9Tewj5rlmXq/h4R33mXS0n59SzbOhRuqdxL7ZC4Iyc8rcqAP5a6spV
	Q6oQppa43PDITGlTxCzmY+dc60hE8vGO9MNTLQg8x1b7EDn+SFTIIgWk1vjkAx+XUz7YZ5MUDQF9l
	J819Iq1gF5I2FVUMrd84KdgyOcJYenU0TMj06VyhyaqmSwhFj/X0h1S/JQ8+S4rG16KDCTnBsA7im
	Ix4/aJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFF-00000009fVP-0OBP;
	Wed, 09 Jul 2025 19:14:17 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWnI-00000009BDj-2Ohk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:33:13 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7426c44e014so4683786b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752075191; x=1752679991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5h0vY+8yWR6d53ywzrllmdRVHS+9LkknzDUPnvu0s3A=;
        b=QuX/Gwclvpnqa/cLQE+UwXRfHrI+YQeAGxDhKnkJ/m26d+1ZgOyOOoJctTIdpf9oUn
         c/Rpsjv3ecmdx6UuhQClYKCsinlHhstEipYpAC3YwBN0shV+PfcaJpdGcGAlRgx1vKPg
         j0t+PA4n6jWm08rYlsaHmFjaxR8BU7mCSe6H0gGRXaup/YqDjwMdl0QFQXkHKJNYEsxI
         8yoi3Vu2Lv6p9PsQvOqnIEHiTALhR1wIyKGWXzzHgVJildiGo5MPe64hyu7q64gNXizP
         2olIFZRFXRvLYdRg7/GlRhggzhykq1eWRLpsizx+gLAnKTarX7uMunccKJ/MHeJ/H+Ds
         OhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752075191; x=1752679991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h0vY+8yWR6d53ywzrllmdRVHS+9LkknzDUPnvu0s3A=;
        b=kJS1NIrriXuQwN3wAd0dMvGR4P+Gvzox0j8erqua9QReQy6AAzARn6FCsMIXesqJ6y
         MBJY1aX0J7vcUSyk6LjlhJT3hwHKcwITb8uSAhg5zv6hfXG2aSpUT7HyMRhgllXgD/cz
         nJjnR9U2+xYVx5JUoONn9r+me7mBZdG9/EOp3MdLffPj/MUXpvzJR589p0ncZ2VvBXKt
         n5ksSAFu6/mrRiduDYtnaAcnTdJFoX3BnOZUDM/gmACO8dWhm577KjBQAO0Fi2IQfLcp
         GQ45pTVpI7Cldb9+6Of/9oKQTb3INLhK4EUduk6VrMOcILF9TCJv80j/+cCp5RK7mNVF
         EK6w==
X-Forwarded-Encrypted: i=1; AJvYcCWWm5Yzb5sWTF/+2zSLnc79WNrYa1Jm0W+VvA6DjXznxM70yUPHrKAPg0kTk7RsvRsFm9yYMOgjPhD/ur+xp+Y0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq3ZjPA6NvgRQHmm4tI1XiA8YLYqq6Fa/GB/64t3tEZ/w2/RGY
	A7W428rbnGsvrhGRgXm7Fp8V2sMAv7lnYSKwrCUHDWkYFNWo5ruKhuyg
X-Gm-Gg: ASbGnctyBtv1WAMVmaRn02hbD5dDaLP2POkre0lLkr9755hxwtpHaNH4EiGIrtreBE3
	CdrO047XbOWEJuG7BSkLWI3It3ZVkiKXLYjznoTFbIzqbgEfObQT7SpmiPpn/eZ3zlaKD9KjmIa
	uwAAV40oV7cg4xdf/dVTxaH1MYjAblRZHi+T/Mh8N1q0Vxf1WVlorNMiqMwDiPirlSFId8UQXw0
	EJlcoG8WAW3c2PSrAqYr+M9by6NwgsVgt50sT3O48sGbusR2I+jTgrMuMU0R82ZWXuBl1zvhl/s
	DHS2+uJp5/lCec8JldqCKHpZGj4Nrc67wHvRCo2whU8/CoWwxQOqjAoN6VdGHQ==
X-Google-Smtp-Source: AGHT+IHZtURowHsYjnMJ5BnwtddfQEn1Fb18GjbXaV0krfOX1jJD/FS2hhGkqD/zQ8JNrPNyVELOKg==
X-Received: by 2002:a05:6a00:ccc:b0:74d:247f:faf1 with SMTP id d2e1a72fcca58-74ea645f1b0mr4005899b3a.6.1752075190794;
        Wed, 09 Jul 2025 08:33:10 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62bc54sm14821781a12.59.2025.07.09.08.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:33:10 -0700 (PDT)
Date: Wed, 9 Jul 2025 11:33:08 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux@rasmusvillemoes.dk,
	linux-kernel@vger.kernel.org, james.morse@arm.com
Subject: Re: [PATCH v2 2/2] bitfield: Ensure the return values of helper
 functions are checked
Message-ID: <aG6LtJ2N1smBKHh1@yury>
References: <20250709093808.920284-1-ben.horgan@arm.com>
 <20250709093808.920284-3-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709093808.920284-3-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_083312_606508_CE14336C 
X-CRM114-Status: GOOD (  13.43  )
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

On Wed, Jul 09, 2025 at 10:38:08AM +0100, Ben Horgan wrote:
> As type##_replace_bits() has no side effects it is only useful if its
> return value is checked. Add __must_check to enforce this usage. To have
> the bits replaced in-place typep##_replace_bits() can be used instead.
> 
> Although, type_##_get_bits() and type_##_encode_bits() are harder to misuse
> they are still only useful if the return value is checked. For
> consistency, also add __must_check to these.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Applied.

Thanks,
Yury

