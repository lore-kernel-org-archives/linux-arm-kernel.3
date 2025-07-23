Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B02C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbnjsD8D8fd/oPMol8b7h4DNOpO8k+r3dNGd6webbIw=; b=Iq1tv9MEKt90eyGxjGQU0IJ9uk
	2XH7oE1U+47WfFcVVzFcPnbHVlrsF5zp/p5mitLqUap4bLtWlbuZQ7Dss0KFkhxk2ucIWBOH4aZ1o
	2i6G/W/EEpSEZrLWmcmr0iTJaxnbs5OAJLjlRXeo7ncxWvuiQstRq+ROrbAG74d4kt2ux8Fa6kL+i
	oYvmKIXhGjio3IPvO6bMQQICjWs+pTp14TN6dzk6/GzwKYkgPpeuqUIMQTuc4j+yRA6flGLj1q0/t
	WNaSlTjvXSTHTfZvjMldLncU8XpZW/oTCd5YMJpSYXX8cQWNY51eIl9Md25D41+dE8bqp60DkJOKu
	3nwCi2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebj4-00000005QX1-0PQ3;
	Wed, 23 Jul 2025 15:49:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebZg-00000005PKr-1vfE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 15:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753285207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BbnjsD8D8fd/oPMol8b7h4DNOpO8k+r3dNGd6webbIw=;
	b=X33EK5DFbHQWUYLzTgiourtxi66wtqfJdyItbgcsqu7a6SjgNta4oY8eO4yCB/bud40eEN
	vh/0MD5ZshYjsjPe1/cGfapSfTVp265pMmnel2lG9Ka1VYAHsb6hKAsuvmsHv93UFJNkPY
	t9K4mCLZjzFNVhFXFd36Chymclapo0A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-L7AGALTjNsOpeMLdtIFrog-1; Wed, 23 Jul 2025 11:40:06 -0400
X-MC-Unique: L7AGALTjNsOpeMLdtIFrog-1
X-Mimecast-MFC-AGG-ID: L7AGALTjNsOpeMLdtIFrog_1753285205
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a503f28b09so39532f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 08:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753285205; x=1753890005;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbnjsD8D8fd/oPMol8b7h4DNOpO8k+r3dNGd6webbIw=;
        b=hTEdHuK1yHs+lFDWnrOzchBOR2dliIMmP3WGnV8c3de95zd9LEjLKIfoHI1+5soDQM
         BIte2Imd3l54xmDw9AWpajP0I0Rwl1jEml4sL+Ynbx9wq8osrmdsfuQXOHMyPo2t/djQ
         ED9cTCQgqREV+1XkHi1Ec/f317iYjzyO81LOe3LhF1mBBjrv6YuCkLzfI5BMqYLiWy4/
         l601ffVNKJsDM2xjHXGtbIHIrhKk98jMkawzjWTDT3UbWYRbC+hwzsaw8H6H6zzvD1+Q
         cxWM/7ZCZB/jtyhgh8bwaJgtlEg+Z8Lff6pMOqinKRTAib9M26MgnrAXXWblhIadnari
         QxSg==
X-Forwarded-Encrypted: i=1; AJvYcCUywIdL4dkSzvwmHxO2/X0nTnH6FduDq4+Z+yAvGlRWrGtIh9Zt6fp+iChsVg+P72rgjbHhWMpQXErpv3UUrHNb@lists.infradead.org
X-Gm-Message-State: AOJu0YyM+f5wcEeO5KLrPdWXkQlB7T2Kw+XkiyJ/x0tUVX1axeXmidnY
	CiEwFCW3kxCEs/rANyF6mZcQ3143RSJt9wMoZUkbz69kYZndS1Lk4L+NZxzAxLtX6n0h6JfIRxG
	C6XqOGi4XT6gUYlNoWNsYf46QC+gwd9q218dB8wyI/XDOYV1K7dWQiMDkfFeOI9aonE5KmayiKU
	Pl
X-Gm-Gg: ASbGncvZcgZBHLrEXTYKD8jvh+Fm8uV8Zh1xrIEGT4gU31Bsnxsp3bblbHrjmxJ7ktB
	lvwCmAhuzQy1aiamehwsgySrhFduaMNjESLWVgLgGNR0as6nTul7Toxi18zjxAGVm1KrDpaCKRs
	f2eUnRs3tOdACperdbeFwuEyGZ0Osct2kqqzrnGycFoD+Gw+VvoODjT6APaiYwWZ0wIN6w9LBLp
	ahZWe6iUtNNPmvFfC+22NRBvHNPRppsRqWeph249KEZKAmbLZZG6Yr1T+VknuiwW5UakIbznZOB
	K3ItoGRqW13x+S0+VYpNzuL/3YfCpEgGu2Mg1OgilkfnF1P6V0pkp/8qr9hR9hf3oWiaBfOETOQ
	DEiH02tZyA+W5
X-Received: by 2002:a05:6000:2403:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3b7634e592cmr5632745f8f.15.1753285204912;
        Wed, 23 Jul 2025 08:40:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsc98BzmsjHqrVG2AWlzqEG9l1z4Dg4Bl7UILlo445wKwDwA6rd8BWhQgGwVIisFVWO4wVpA==
X-Received: by 2002:a05:6000:2403:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3b7634e592cmr5632711f8f.15.1753285204420;
        Wed, 23 Jul 2025 08:40:04 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c5e3sm16917670f8f.78.2025.07.23.08.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 08:40:04 -0700 (PDT)
Date: Wed, 23 Jul 2025 17:40:02 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
    kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
    Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 3/4] KVM: arm64: Enforce the sorting of the GICv3 system
 register table
In-Reply-To: <20250718111154.104029-4-maz@kernel.org>
Message-ID: <601c0048-ef37-0695-8c46-e703884b3612@redhat.com>
References: <20250718111154.104029-1-maz@kernel.org> <20250718111154.104029-4-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PLyT2c3H1j-scmFLyFKPVo1v_sxcLVy449-lV-vVY6U_1753285205
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_084008_565543_99B0E017 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
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

On Fri, 18 Jul 2025, Marc Zyngier wrote:

> In order to avoid further embarassing bugs, enforce that the GICv3
> sysreg table is actually sorted, just like all the other tables.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


