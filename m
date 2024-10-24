Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FEECE8E91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZXCwg6hYJwlV3dQoijUPbMEIAM4RESJSpWVfasu2GA=; b=rEYp5c/shob6mETH9wqzvHi32y
	6KngzY5RuWtIwDQAy54GbDdEkqeEBIzKgAg2sJQ76+TOq1mXpeVsFPd8YAoci/5PjFlciRF4jWP4V
	8ZYP5tvlhhTfGmCM6aQXLjaEwbcAseK/OPIY7rtQC1jkKumL4sqhrkk3JOx5BsEa/Iqj3pfLyj+ZZ
	13VpV/GHxEG0yI+152yL1NkeGEYA+vhZFNR0L3yuh9ZWMRoQsW51l+OAi7iDaxtKeGvCtJpSB1+a4
	nyxWLL0mUDxzUxkbIVVj5lYbaY/4GCDfcN7sDh1yQqnbXQQkpb1rUl2dtdggnUlTlDVqicnPS2ZwB
	LgN59Xpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40na-0000000174L-3mMK;
	Thu, 24 Oct 2024 16:34:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40iv-0000000165Y-0BcV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 16:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JZXCwg6hYJwlV3dQoijUPbMEIAM4RESJSpWVfasu2GA=; b=nOJbd7HJuowm3MgGjBIjI8+cHF
	W0kB1pHf1enNG7rXVNrrFAAxX9Wh+M8SHipkEvXN2a34GKGc8RdVAsG19jD3AAenpQTgCZrGcDwJP
	njvCNfdmgA1bjALUfBOXubrCLa9Y+6l4eBM/kPefapf79e3YlD2XPmqiuRJJTk2hq/eRo2IJUUOC/
	OfdUUBzEdgFW5Y+KRwmjCoEatV/CMSauX6SnfLafM4clvJlM0G4LYxe/sGVjGR61wkRtBHfna0mB5
	988lavQi1NoAkt4DrSHEGqSJxM5k63MzsYuBeAWthcWZDEWdE7ZrruuSvH8JVIP5JqyuZIPDOZsUm
	czDBq7Uw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40ir-00000008iKS-21Ox
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729787391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZXCwg6hYJwlV3dQoijUPbMEIAM4RESJSpWVfasu2GA=;
	b=fdGRwmWsqj+lueErmglc1O03FFyhlr7+9pEdARz3JBGWrD4TSCEIh3blrr6F2eMu+UWGQT
	uBNPQmfBsE2nkHNLJJD2W+1nhZsw1pNIaVohT2YFi7dYo7Fr78sTVT7Rx+3SxiYF2Z/kJK
	E2EIcadfe7Ubo1M0WucEfEqaeG3vcDA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729787401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZXCwg6hYJwlV3dQoijUPbMEIAM4RESJSpWVfasu2GA=;
	b=YtPkMuXdecD/aDaFhW97PtHIMQ+tvJunFA1dWfSpR+VnVP8mkPRucnwEQni6A2BkclgOsJ
	kdvUmMdFuBWmo7TTTgLfDge7eCaw/YnyFR7cnwGDqCCuX82VHlCnuKbIek0p0U26ArM14q
	yjvYTaxvX+rSNpVks8XgG+Cn/TmOsd8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-dfSO1eGjNc2GLBOVCuIBgA-1; Thu, 24 Oct 2024 12:29:50 -0400
X-MC-Unique: dfSO1eGjNc2GLBOVCuIBgA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-431604a3b47so8192345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729787389; x=1730392189;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZXCwg6hYJwlV3dQoijUPbMEIAM4RESJSpWVfasu2GA=;
        b=T9EJH9WJTcuEzo3gI6F0hPGFar8oqnpoZ+Y9ZPQzE/GFK+jUK8E//VxJ6qaVigS+cN
         F2Adl7Kj4JJW8dmM3ylwQhIHJ/QfWUvee5LQNaWuk0z/9ugd2RQ3uQSKADYGhhUMx8+r
         75CZPRkFmjjG0vKnvWXFNdqst4hksMNm6qcxy14dmKLbD4Eh698EfN/LAErBDyWjjJ3w
         0iBquL1x+kXbrETdt9WOFwr+jK5wVFq9bcGcNPNFlsRxYLF54ZUWzmxg0nxxw7OwLrrp
         WNMDARx/H13rlkr/Wjg+XsiNaXFJZYoWcsD9Sxrdfh77fmrZUHOyBB/OmGZaXDLSZpJz
         pzqw==
X-Forwarded-Encrypted: i=1; AJvYcCUpRShK7RR0xl075pAHZFOqJ9K8MbiWo8ToWZNlfZyqXmzOSHUyBbOGccQMqe8tQeKL+nXUivVKdTlhZi/AVXkW@lists.infradead.org
X-Gm-Message-State: AOJu0YwM9T+LCzzTsR+jXQ0sMI6kMmITtHevEuixAEGt3BewM9/tQW4I
	bOiGJ1n2bYEr0+07BiRetInU8Ezx0hm0+VdDSSh0P023zLurEfCpARmPXMEpFQc0Ml45KYF5kzc
	mA5YlhnbczTMkasOGoUBTcyLsSjqEoWbXVFnVbMBR9D2T0J3ZNHm1RSKKNnRw5KyzjsMBs5TRIF
	Eyn/Bq
X-Received: by 2002:a05:600c:1e16:b0:431:561b:b32a with SMTP id 5b1f17b1804b1-4318c6f505cmr23112385e9.19.1729787389131;
        Thu, 24 Oct 2024 09:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET7dTcaOAuam5O1YOxfn6XKm0SifRdkj3JgT8AA6xwQNV6mNJK26LyEtPp9s4XkYUWZXGjDQ==
X-Received: by 2002:a05:600c:1e16:b0:431:561b:b32a with SMTP id 5b1f17b1804b1-4318c6f505cmr23112135e9.19.1729787388661;
        Thu, 24 Oct 2024 09:29:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c1e911sm50457715e9.45.2024.10.24.09.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 09:29:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, David Airlie <airlied@gmail.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Simon Ser
 <contact@emersion.fr>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and
 all drivers
In-Reply-To: <20241024162240.2398664-2-jani.nikula@intel.com>
References: <20241024162240.2398664-1-jani.nikula@intel.com>
 <20241024162240.2398664-2-jani.nikula@intel.com>
Date: Thu, 24 Oct 2024 18:29:47 +0200
Message-ID: <875xph1n2c.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_173005_797515_D7F6AB1B 
X-CRM114-Status: UNSURE (   9.11  )
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

Jani Nikula <jani.nikula@intel.com> writes:

Hello Jani,

> We stopped using the driver initialized date in commit 7fb8af6798e8
> ("drm: deprecate driver date") and (eventually) started returning "0"
> for drm_version ioctl instead.
>
> Finish the job, and remove the unused date member from struct
> drm_driver, its initialization from drivers, along with the common
> DRIVER_DATE macros.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


