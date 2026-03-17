Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24DAFED9E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qStIndcPGw+JcPKLiWKmJZ3dJRcw/C0qeNG09MqJaTo=; b=TbMa9p3HhXp+E+YVI9nOJSU7QH
	VpAMdYQOvE6fpeRPDHJ1qaKowkst/0H/Gk8ftLcYkg/k0hwbsfUROe1dToAojH1RTz7xts0a65ta/
	aa+YCk5jC1haXZ3xjGsydiZe6VNusVS4Svntngm94/HfnWDPca/gSI/DzqZe64p/gA1+sJuIrBgqW
	lrkrYaLEEpD4Sv/A+KEDOp2NhoxFDWXjmSp1bUipm/n+cP7c7sEAfQpgtWqe1lQHnEKRrmIZRLzGX
	6+0xRHkX/J+Kzv1MOfYyQA8AlgWF8pprUApHOu/ddocDptFHO4aMFyGxokfoJBnm2N9kK6+T8irp3
	eqJ81C7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Wpe-00000006luB-3vCq;
	Tue, 17 Mar 2026 15:59:46 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Wpc-00000006ltn-42na
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:59:46 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-128ef6c4a41so2807219c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773763184; x=1774367984; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qStIndcPGw+JcPKLiWKmJZ3dJRcw/C0qeNG09MqJaTo=;
        b=C2DtOOd8NdJnYQn+PjaAtUPuX0izsIUMQmpNvN71Pl/m5D/zvJkzeHirV2LU/21le9
         IYbqN+929OSpI7oFIhr97KT5mhHnuj0DpEDG93BnRqlkGXl0vX/1zIlvEJNQ55twHBlm
         ZMCIcpbzi3D4kNMwT50hKG8rUltlOLpIMqUqqzVr8FRIKfBRoYevQ+6Jb1/Gd7AiFAGD
         kkaHpOy+PwVfuOTegxS+Yhp2+wYD+oYZf7FPnC30tK5QP9IUfpigydQE1FsZ9mAA+Pm8
         KOCrVHHh1M5sI8TDMxblqYamAMnE2ES3Ei/wp9fj2D9c92akx/eWlmCtqlTFMHIOBpfs
         Gf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773763184; x=1774367984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qStIndcPGw+JcPKLiWKmJZ3dJRcw/C0qeNG09MqJaTo=;
        b=A52OSFWI8L4Sr+V56XpHlsTod1F7VFkx7fxhFxyIHSaXVjFxMG5WhBnhoY5DX+uG9l
         phuTee0Uced/ycuV/t8RCUdEZ2MuxyRdUIFTuMt/B7iog/Ofz3rGuTzRXuzLqack04l9
         FFKnR5ptyfNj7Pm8EDNR5iYl3n07Aegayp/x0czdBCqVtP/n3xrqBYp+mOXabXSBNpzh
         AofP0YI7x0WbjO29cZ7aZfIdtFC0iGp+nHFdFly68euiSrGBK7wjv0Xd/8eLlVj6IX8T
         bBV37z8qTyAEyhh3qaxe2gxUVboNrhka//dQQ3lqbvp5SDVcgNMvjpZv3nAFri27tUSR
         FxCA==
X-Forwarded-Encrypted: i=1; AJvYcCVfZJscLYiq+HdYvi6Pwgz7ZhjKCHCyQl+Lksga3giVAA8Sng8OUzSJw9iFCoH25/CQG3FcQlVxm4aWMLJgf0DK@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs7t7Ff0AWRkJ0F3OakbmFQvN/brFUswL+IKotZYWZLZL0Jknz
	4AkbVmzXggTYl3H97C3RU5NPSJcXffGDnZrF0c4lnbo3NR1eaNEp4UOO
X-Gm-Gg: ATEYQzzRM6KWEb1q++cJieWlS9OCM/mvlnKPJk7Hpp+ZxIBIoigw24nRvaFjHUAJ+pj
	wVEuVvSS+qI26uMLOpFMXqWbpdyO2McWUNFqOMaSFUuadGHLvqrrZjcDc1Rtu6IYDyakCPWvYK9
	FAYAb//yKT/yx7kzJ+E8GoYym6923rd+2k9QfOO6xCberrKR0mH0Kq6VHIpmTVopYjGp6Gp3WId
	1sdgfSNcVFJhaSFgPfPr7EGHC7Tkt9V7XgCh2wtEq2o9APYWi/nQbn5J+1lxVOTw6sdGThHGetK
	jm/dB2BsXdhfNW5Hha/gO8CUWS4zipe3gMWciIG/wtFK5D2NRaQMjmbJkLHUwIFTx1nwG0UPRc4
	JuK0GFGlBfADgUsblMNhnT/qrgM/lebZVBOnVa6sFbziJFM1G+VMw2/YImmaBitNEVQiMdW9ZWQ
	dnikUL3V+t1ukxS58YzSH8xRkE+XS3PSZHAs2V
X-Received: by 2002:a05:7022:4387:b0:119:e569:f609 with SMTP id a92af1059eb24-1299ba1cb97mr18072c88.2.1773763183880;
        Tue, 17 Mar 2026 08:59:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f62991c7sm16442227c88.5.2026.03.17.08.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:59:38 -0700 (PDT)
Date: Tue, 17 Mar 2026 08:59:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (aspeed-g6-pwm-tach): remove redundant driver
 remove callback
Message-ID: <351decf2-0a11-4f4c-a332-d5ae28c4c13f@roeck-us.net>
References: <20260309-pwm_fixes-v2-1-ca9768e70470@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-pwm_fixes-v2-1-ca9768e70470@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_085945_005174_B067E03B 
X-CRM114-Status: UNSURE (   8.67  )
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

On Mon, Mar 09, 2026 at 10:33:24AM +0800, Billy Tsai wrote:
> Drops the remove callback as it only asserts reset and the probe already
> registers a devres action (devm_add_action_or_reset()) to call
> aspeed_pwm_tach_reset_assert().
> 
> Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Applied.

Thanks,
Guenter

