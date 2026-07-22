Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C010C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ftngr6uIQGGwpB63XFYD2rUJOFykaHdNqhOYri/BMvc=; b=p4CzQYUmSqNhnG8OAHJQepYrub
	4NO22Z6RL8FqAunis23Yd8D3iVPi1HevsPAJpED/DyS8qE5YY5+X/fnlT4R/t28vAnOCnZP3It77J
	tmXvrWlPf8pT6Do8q0B2RotcxaNwyp/EAmmzJNaFLegIay7J7chdiGtERZ+esnw+wEeSdEfXDK4Pv
	AwB0USt9IowmvX21YPLpAtq+zZIRlliEUOSQgJh6l6NIlS3O1pXGYWLBo7TmdxBpdamr0k4yhCG/h
	uv43+Els+XE+W5Bzu0kDGoHUNkfH5Cvab9+V/H5s7M7GFKgPJ3jc3c9EGyaD9bv9m85oijk+8E935
	B/+BhXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVSy-0000000BgFi-486j;
	Wed, 22 Jul 2026 11:50:24 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVSw-0000000BgEa-0RMS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:50:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2caea3f742bso147969095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 04:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784721020; cv=none;
        d=google.com; s=arc-20260327;
        b=qcsVVIYHC192aMCxXkrcXABcupzplKB80ctiN8Y854RcPDg8s6AzkQTcdFTR4ZqxyW
         ygG9Y/TQJlvlpOyEoDOo5s22lWYfAryhS0A0yYxc+5xqJqWJ1Lp2jnXUkHYe1yNMJ3+J
         ZHdhF1/n38aIWw4Cc9kh2sAB06ySCZkZlVaEcsDe9ngSJELjlt68o7jUVChMwhVH5a1c
         oVPqUBJzOuhz5Wqti/3sjFcOfYY09awrOkRnpyq3dJRJpt/KRdSY4qCwpYQeBWSKk/Hj
         50rrr+q5an0px0E1LhlQBEkHuWVHuiF/tWiXqyDymE0OR0RYD/wXV5PLZQJbOggQbGfE
         eTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ftngr6uIQGGwpB63XFYD2rUJOFykaHdNqhOYri/BMvc=;
        fh=juRlGxrQTl+zXwFGKhlqG2ZrxlXsO1FWa9kYoqpBK5g=;
        b=bZke4Thplmfr1KPwVTkWxkJVG5uco+FiLDccHeevhGNkikWrFQvcXeQnwF6IsG5VNF
         MpEkpASswJDYYWzgt3FPBKK7XYgGYYisVz1oYSDjZgJMGzI7H7JRS8xOdttMmSynxIjP
         3EmvhmGi9UgrD04hPxtjQZM8DIdvy2hrIrqs5jjeI1B+ibFIVoBhSgX8QNwx2bF7WqIe
         gIY78ZQOQcXUe1B9q1LVIJbxku2cKc12hlAgUhN5lG1SntKjf3wbft26Zeuv3fj+AToS
         ulDPV2rB4LoBiIv4Coo7EWXzD0YshY73S7lKVE+PcDplw1SexEl5hAVEE7NuoNIvk0sm
         Awdw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784721020; x=1785325820; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ftngr6uIQGGwpB63XFYD2rUJOFykaHdNqhOYri/BMvc=;
        b=Hmllt2oVfnif3SaxJI9y7xaWTA2yQjT3qOQDB7bUqSAG1OyqxWLqYShRsvB0l3aV+X
         yNoLadI+xRHbp91WNsRbd+7o1s2bmBnstPtC+36MIZB8CNIYcwRXqQ83zMHVxxS/G6oZ
         FW5Dc83aG42pxYin0KBqB+J4rEe0jpkUHWFJwhg5RH5b5u+Igq/O1cv0u0Pvn+GgqJZX
         uQKp8UseN42jDPKN7lEhHPfUtPMSbwQHE+iwUuDYtp1VtnhLRR6VWcNB9m3cpeBYPqBV
         a/SqcgMv53ZHYYsJkYSspJjoWe2rJkPAgy1dAIv3hc6pclJmD7WT0KPnsaiHeAjO2EkR
         3N8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784721020; x=1785325820;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ftngr6uIQGGwpB63XFYD2rUJOFykaHdNqhOYri/BMvc=;
        b=RN33wNj2IoP9XShHIpqbKHTOiHvOiG+JR1QOAgxvmQgOVi8XeGKHG7a/rTTF3WSW2n
         T913h+vfW3/WmUbT7g9z1pNgb6Lzzsmy60CB1gdPKOOeYYbA9rrznZyZOGXH6+meWi3h
         GkaynLd3BHa4+Yhq3LgujxdHyA7xs/umkHN68szc3bos67kTMEJFCoSvsFmT8TYoAijk
         D4zFku1h5OC62fCXXe+Loi/+nPpCVYYcgJxM5U9thraOoB4NDK/mv4bfZGKs+8C+WqjR
         q5xE/DLLDUEAX+SVWNrgLJaW6tga9X40tUPvOCgTYO7AyKviP3DYnrwm14pASSb3KBgj
         mV9w==
X-Forwarded-Encrypted: i=1; AHgh+RpE5xaA/9IRMuDB0LoqBkiOpglt0gDAU5dptEqv6ndzIy1bjnmpDRp7u7VmD3UwD4AmpgsoXUgcNhmICT2JfCNk@lists.infradead.org
X-Gm-Message-State: AOJu0YxTPnck0VH4DpP7AbXEK2tixew5pw9RYvxbsGEjnXEtCPWu5Awb
	iQk/zus/PWf0HRShoIJGQvh/n6WPZTjSsd/1unDOHj9PosvTtS+gaZcFLdJgrYeG5KSRF27GNOF
	rY9ddexrj+sFVbPfQQ1uIten78pOqs3s=
X-Gm-Gg: AR+sD11Cv9g1bR55spmgYMvrWTB42uWuUuWaC0aBegGXNonk7YD1pzjg3z0ISNZCVu+
	w5sfu0TkfSNEvFHHJe4xNLqNr4rw8hBcf1A1wkOPnEptKwIeKA2qi+0Etdazui6bn5Cv1tdCP2A
	FaDE910bjUZxGBev5hKEuqB5rzEwIuh8Bp9CZ0P7m6mEBIXbSM/PZSo25x1UANA8WhWyPr4mSGB
	/u0FI7ZuEROl5Ho2xTrLCEQAaDVnejRt7R9EUF2qGJPVXrU5SQBs9+E1pb7sEsmI+UmC5NXrDHd
	+RU4VAgTf658V+RH
X-Received: by 2002:a17:903:3c6d:b0:2cf:9c35:82d9 with SMTP id
 d9443c01a7336-2cf9c358a44mr8759895ad.10.1784721020533; Wed, 22 Jul 2026
 04:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260622005613.21870-1-phucduc.bui@gmail.com> <CAABR9nG6BL+-urEg0qDzJHYmowm7O=du_0T4+K2ogdrcD30CXA@mail.gmail.com>
 <CAABR9nF8GebpxX0ry-MMLCfsyPJ6EUpkEtYdASAep2jX+d5gnw@mail.gmail.com> <xrl5n7J2R2GNQC1ABA20Mw@collabora.com>
In-Reply-To: <xrl5n7J2R2GNQC1ABA20Mw@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 22 Jul 2026 18:50:08 +0700
X-Gm-Features: AUfX_mzEis5-yMHxueiT7BVXSfRPH7RVBNtfS-uZsE6HjdS-QePUSBci-Ql7jW4
Message-ID: <CAABR9nEbm2UdqdE6hCrW0RJOqp26=A8CPPSfCTxDHy7=zx_jFw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Hand over hclk control
 exclusively to Runtime PM
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_045022_142687_51D4148C 
X-CRM114-Status: GOOD (  23.16  )
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

Hi Nicolas,

Thanks for confirming and for the detailed feedback.

> > Regarding the case where PM configuration is not enabled, with the old
> > source code, I suspect there is an unbalanced clk_disable_unprepare()
> > call on hclk when the driver is unbound after a successful probe under
> > CONFIG_PM=n.
>
> If "old source code" refers to what's currently in the tree with the
> devm_clk_get_enabled, then yes. There's the manual resume function
> call which isn't balanced.
>
> I think your follow-up patch does make sense in light of that.
>

> > I noticed that Nicolas tested and ACKed the use of devm_clk_get_enabled(),
> > so I'm not sure whether that testing included the CONFIG_PM=n configuration.
>
> Nope, I basically never build with PM/RPM disabled.
>

> > > You are right, pm_runtime_get_noresume() doesn't set RPM_ACTIVE. I
> > > think we need to add
> > > pm_runtime_set_active() before pm_runtime_enable(). Otherwise, with CONFIG_PM,
> > > the pm_runtime_put() at the end of probe() might skip the suspend,
> > > since the core still considers
> > > the device suspended .
>
> Agreed, this needs fixing. That is an odd behaviour of the PM API.
>

I'll update the commit message accordingly and include the runtime PM state fix
in the next revision.

Best regards,
Phuc

