Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8555BCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4tLH4zZsU/KCMVQpK5rDpwcnO5VG4igW8/S8Fp/Tqk=; b=eFsOWWxhdMp0fTip6vMMTM78Vd
	U6w27RixZVnzupJeW87E5npA1I/Q8aAACfTndMeTE+F+I8oMfQK+yeT3z1J6ScOJrZcUA+sURZM62
	B3ky4z19INKm0Jqpv1AhJvJt4CTshE3kgAajZE8q48djqnm50gDlmqvhWoQlWkIRR8D+EPji0qPC6
	hLwF/WWzlqmLCKzZg6HgXgAI9iaDDpU8uBtmpvsM/VP3OnrRTVfbDC6ogRtq7l/CSKRExpdRzf1VW
	ej+tiWgLtCsJJjtI8nOpgSF7auuOrTufbkfJqURq5iL32FmwkmYcMlGBO58HydDz+91s0qjf3sJZ3
	nU/TCacg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2DK5-00000003edv-424k;
	Fri, 26 Sep 2025 18:37:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2DK3-00000003edT-3cpJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 18:37:36 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3f44000626bso1603111f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 11:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758911854; x=1759516654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4tLH4zZsU/KCMVQpK5rDpwcnO5VG4igW8/S8Fp/Tqk=;
        b=cWWZQlEgmk+zkbADyS+Uj7Bble05WowxOHEGkAWwF1MTwKBHkc9ueNp7/8WvWB2hIc
         6VADTcccMJiJ3Uo6yulwcmcmdWZqp85ZtSNGDEn7fk6XevfR38P30e/7IQFNcJBYinaJ
         vk7ZLL4zSDKJbAmmxaTQjz6mBwUcYYvNUUdxjMGUyT8MuK0pqp72ef76UZ+vAD6Ru3dJ
         Sj8wd8oGZPl/y5wkfRwZGUYOsCkbIYim1lXeFj17iCVm5XUwDlWx10pvr0fs6z0qFLmH
         ggFaASjEqipHg6P4BA42mKOLS4mSp9G+4MksJZo3eNEKI4ce1Eki0+akWPXeOUVLH3vs
         dADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758911854; x=1759516654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4tLH4zZsU/KCMVQpK5rDpwcnO5VG4igW8/S8Fp/Tqk=;
        b=FtgEZllXucfFfDnr9p9shbD61QfHLhlrTRHpaRYTybAvC8oQ9cOPirf76nk8tQLkbg
         UGYWZf81l3Br357S2GiVi77+ssOAlD6RZgY4bq8Rp8p9+kuf1R+tJXZ262euIBCCU2Hi
         Z8mY+wgF3+LwUzl50W+MChlRi4JCwWGevzRdgjGtt6JR7UVRZ3H+X013uQdalTdtqPd/
         ZHm3f13lfakIO6jO07II52MmNDfgOJG9STKYI7cODtwOJtvaLd4DMMnSFe+0hYGDvBEs
         PFWLHBpDmEqhe1Q+1vTEdvyWltonX5ZYRTr1pA+FRIxZLw9XZNfSiBLCzqpaGt4cG6xI
         jfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqPRrwN6NZXlPRpg8qv4XUlP311YM1zE9a8y4EXQQey523BCCbqwKGvy6eZ9Vw6IPq8lkDE8YdJUgUO6uoPKMM@lists.infradead.org
X-Gm-Message-State: AOJu0YxQZeDgPZtIs88wGIZL+MnZwHMr3+eLw5DtEVgsDFi0PiVFfEJB
	zPEZw+nnTiLFAWLnP5uHiwvitd+8pDRq47xdfB0BBT6uznRmF9cw6HDe
X-Gm-Gg: ASbGnctWci5HoMSMkBukUCxWCyY2rDY+OAane/fb6Z/CPsvHON8gzF9osCO5OQTHokZ
	EXBLZjFNBfIyWu4wejeSPb6fqkZRBQCEQSXGw50N/rIHCpCI2N5Et9mpafWQrElRu2voMCGSizG
	/6jqBTANrkyr9VkRfEmiEi0a00TxjHxmyXKAXWJIvmQ+iZMQt5EpIrkRE+Npa310BtQaR7mFKJp
	KOEBJM+Dxb9Ip1BSmViIbBAkE7eYrAcDOM/pRqosIHhRFvjkz1n39lqu271s9qhQHzNPS31PIVg
	q9vM4ifd4Q/wqMY/4ELb0OAIf0soHzmpJm/xy0ud8plNrjVPR3I51/KgRMYQZZ171ubONBycoHI
	FrHWs2NEyB5ZKeK5nGxuGJlVhi2cMt49RcclrVLhN9RsLfrDUMXQt/I2RO3pmWZeWnE4Kr/BB84
	zxFE2I9Uw=
X-Google-Smtp-Source: AGHT+IGL3QvqfsVcdYoP6UEPTEo7LkSql6GFvlUpYyPH7Az5c/OcA09RHs++MokV2IPq/7GahQRVUA==
X-Received: by 2002:a5d:5d07:0:b0:3d0:3eae:576d with SMTP id ffacd0b85a97d-40e437370afmr7995364f8f.22.1758911853783;
        Fri, 26 Sep 2025 11:37:33 -0700 (PDT)
Received: from radijator.localnet (93-140-141-58.adsl.net.t-com.hr. [93.140.141.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc8aa0078sm7876881f8f.59.2025.09.26.11.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 11:37:32 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] clk: mmp: pxa1908: Fix IS_ERR() vs NULL check in probe()
Date: Fri, 26 Sep 2025 20:37:30 +0200
Message-ID: <12766491.O9o76ZdvQC@radijator>
In-Reply-To: <aNYQiRJDmOO0mEWs@stanley.mountain>
References: <aNYQiRJDmOO0mEWs@stanley.mountain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_113735_910084_828CF0AF 
X-CRM114-Status: UNSURE (   7.52  )
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

On Friday, 26 September 2025 06:03:21 Central European Summer Time Dan Carp=
enter wrote:
> The devm_auxiliary_device_create() function returns NULL on error, it
> never returns error pointers.  Change the IS_ERR() check to a NULL check.
>=20
> Fixes: a787ab591c38 ("clk: mmp: pxa1908: Instantiate power driver through=
 auxiliary bus")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Acked-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

Regards,
=2D-
Duje



