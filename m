Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF10CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6B+aPmBbpdYFEZ5jj5U7gq6e1DRXMQ9PT8K+t5rVros=; b=RBz33vbMXdgcKBPhJRPulTeKj0
	QRwHZmIaFHPS9V36mmj64a2Mxd7vr7TOqjFpSyUm7K6rptzzRhBHaQcJrhI7iAMKonLuz7eAMpYi0
	tZWIx2R7hDoTGR+uys8zFaDLE3P61Z5BIvNGQiysKJLtW1Jo4gao4PHxxuxNwmnHw/V4Ieuv/8Kga
	pB3YehEAm5GGgbaa9N9no3kqtKUXxXxGOyHpNIOIpA+sG3oBTBL74CFBR5LqxvuIpy2xOSE9QsyGS
	3KM9AfP6i/TW4VYqKMNX/tXhNAWrkxddiBYcQPRY96ioDLZrO3TWB4Qod87Rjt9boIgJLEwC8j5Xh
	Mr7+jyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGMEW-0000000CRpw-1R73;
	Tue, 04 Nov 2025 18:58:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGMEV-0000000CRpp-3gKe
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Nov 2025 18:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6B+aPmBbpdYFEZ5jj5U7gq6e1DRXMQ9PT8K+t5rVros=; b=moeNjv7/ckxp4r4fvj+rq/ZP4l
	riuv9l25KLQazT32smcvc/uHAzqHOhxjluV5t7pIbVLx4RpQapdRT7WMgzKFh5I65T5k6ueuMajDD
	gw3RywTxnw17PbeCDOu6HBnLwNhm7B6G8xzPrivHIzedPbQQfIFv0sLjFA+pfkl79QH7lMHC7hhE+
	t2C7jnTMFlAmdSdDKJmPge9kzz3iOIrq8XU68h6l3dPITzW2sbJJ6f9uDDjnmqpi14f1ob0Q/qtt2
	hsklT3T/i4dbvrMOO8+h+kCd7uFmpMO2Yxwih41uBkkD/fJeHzEEB1uTX7mU4Ygav9ZUnKRwXBAs9
	9doOv6JA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLMl-00000000gBq-2tFA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:02:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29555415c5fso45893395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762282695; x=1762887495; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6B+aPmBbpdYFEZ5jj5U7gq6e1DRXMQ9PT8K+t5rVros=;
        b=mU82NbiUikLW0LnZzJgVrvGBV2pTJsKpge3C7057QM59zmkT6qGINho7y9swTAnllh
         PYHmSUzWPiCp3iU/VT4RsvWUbCWeD0dJ5v2gPVxpOpZOe+WBcCrTzeccNH9d6Z9nZAOE
         pu1vVDBOBDSsLU2wefA7Jy9S8uF+OhBrmBKM8Vf0XJq2Kx3EJNO7vqTLw4UHpYfxjn77
         sbvEL70dBfieE3z6+tbC3LIZor4uvRPV5fTlgkGHzYEpP5uEGrdGqdl4LKSkYxcG6hvN
         QTvNhLA2JdjV0rrZ0mC1/Gg/gFL3e7XLjxcmPWp9YFMoRKRxtEskLQTrwfPlfm8Y1njf
         6eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762282695; x=1762887495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B+aPmBbpdYFEZ5jj5U7gq6e1DRXMQ9PT8K+t5rVros=;
        b=GcF4MSq4CWmJPSdgqR4lznj42GAs/5aM/FWBMRFn1tW4GxSwfDjHO/6qVbY88oWZi8
         RKqGBsfOEgJy3Th8sy5BGX96JkUwiIxojTl98ZJAv/3d3inRXEZXjoO0xS2Al9bqI0xT
         7N2ixtevNtRFtsvmWtsCs+LWO3evBTOqC0/OH0Eng0XB6JJXcXL6eLYi34S0jFeHovyD
         hjZr2i8ixXfe14cXtTKw1UhLeTBS4nKmttQTX5I+bURkAUcqOo08osK1bbljo8+rznaf
         VpZaIbjpFHdFEnKXLsCMvaXoSAsjHkN4OszL28sHv+qr/5I7+oVpDqe+L5Kh0/1ScMMy
         1V/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiREQPzE8LbpsyIVgV/6ZbVSRlzBeMq1iFMZbTxJ7lM4Zdx8J3Qr3XmdL3lat0SZyhBXmcaLqW+aHblHf2m2NB@lists.infradead.org
X-Gm-Message-State: AOJu0YzP5780RwW2/n741N27GyNuuslKE0xOb2BLW7PHjX15TLWp3aM+
	wa2UIVRkcK8KfypAz3o9QIjosKcYxXmckeEVUXkdUAUFwCaUNHmrySZQ
X-Gm-Gg: ASbGncs5k5Pj3nm7p03wP3t+Ypv2glQ3Ky+2RJWBVFMI24DyYEHWrT9gjS1H9SFuoMy
	Rnz3W3GY9uS5W0OUlDb3q2CW9MSpEWw497SaGT4eNqY5HWEfG69kqxFZDG+USl+ntFIawW9iHbi
	/QcqLd00E183cNqjQtxqFah9//dffOVZ114dXicC8AXVL2wy0fLHqE4qydCd0fh0tyHiacbFVUd
	O2+NguXEYOCek/C4mioDzFBtykAi1qkU56UbAMd82qrGUwG7taJcUcyj2skRaQ0NXc7iLmLJEDB
	iymb1jCPu+kahKeJqY3PLSandzuahlLqMHcgJTW7xtGps82tfzAQm8oFneeDY7bx66mvfualvFI
	zuPNQeGUp12zzi/HGELoFCpbNdymBXJLHxIkdwqXUP3G07iXKqkIFzibGpmG9fykfalViapCcC9
	mg9RmtjKp/pSNPA+IG5LKB9ZTtk2vIk7Oo+1DwG/mifw==
X-Google-Smtp-Source: AGHT+IFHo1RV7muJZAmmalRPgMc0IPBuau1lfoRTnOMDYdIJrPmtkFZaswgqqRuY7j3qYZj5YpoDdg==
X-Received: by 2002:a17:902:d482:b0:295:425a:350e with SMTP id d9443c01a7336-2962ad0c176mr6981645ad.8.1762282694755;
        Tue, 04 Nov 2025 10:58:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1f2a:f7de:951a:621a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998d4fsm35273745ad.43.2025.11.04.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:58:14 -0800 (PST)
Date: Tue, 4 Nov 2025 10:58:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: imx_sc_key - Fix memory corruption on unload
Message-ID: <uimkyxzdrcrcm6jmprcsnbl7pw6w3impm5dqam5q4gln3lrcwi@ngqtd5pbuywo>
References: <aQYKR75r2VMFJutT@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQYKR75r2VMFJutT@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_180247_812190_23C7E393 
X-CRM114-Status: GOOD (  12.31  )
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

On Sat, Nov 01, 2025 at 04:25:27PM +0300, Dan Carpenter wrote:
> This is supposed to be "priv" but we accidentally pass "&priv" which is
> an address in the stack and so it will lead to memory corruption when
> the imx_sc_key_action() function is called.  Remove the &.
> 
> Fixes: 768062fd1284 ("Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thank you.

-- 
Dmitry

