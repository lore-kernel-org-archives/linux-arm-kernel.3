Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2149CE8E97
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4zqWpgJymZz2GSVXCHfh3D8JgL8gK/HJOJAl8/d83M=; b=rZ+GNmfHTdvXFu14c5u7yiczLY
	lwIlV3bgegtAbKwV/HUTNt14T8zdCMfoPu6Jjx9D111eNkyWhheV4ciBVmVcEnlG+6oPn9npgH+wc
	I+bDG3IN4aEtkn7GzAx7vqrh5sqZKbn4etCFC3KwxvvCboCkEDCw/4niaCUxZo6yfrDNjYtViJNLU
	6lBy8RN3HMEKteb1IrcE58fo1NJwJLlLLUJ0ZHtuUDPj9UAtXXqMib0WvW7Nt6Ycc6QqO4963peZg
	Xo7OyL5F4efXM66lj5XembRefczOD1CpQ2c+h0jzTG4r/lVHhdzoTvaVMGc6e6TjdqNbMGPbBKAn5
	rKJrerGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41LH-00000001DnA-15vr;
	Thu, 24 Oct 2024 17:09:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41JO-00000001DVL-3NWC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:07:51 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1409914e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 10:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729789668; x=1730394468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4zqWpgJymZz2GSVXCHfh3D8JgL8gK/HJOJAl8/d83M=;
        b=Ar5n4zHLIgmeBKHx8fiKtzMdJHmcat6BCJXLBQTs7pqSl1BbpsHmZ6kpewyCNKGX6d
         4KX48t0aT8yzdpgcsEkw8JeQUUPvob+itanWlN53/H1T14Oe0lMqx2xzrVHkKBNjC4dl
         32+REXlCYLBOdteNrfNmPFR+q/Hft1G+H8yuR9o1amrkTfT3aLQYQMIBd8rRPtI5dmTn
         4R8h32RR4x7ERqV/FRGcVHN3mLIOw7I+0sSVgxR/WRNHO1b7wMbm7B/aJq4URU6Tqf8b
         77egP0yhJP4PLcTSuNgqNJyivQRgAl23akmjCLkn2GK8zXi50CJl6EAMjSsSxLeRZ51F
         8ASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729789668; x=1730394468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4zqWpgJymZz2GSVXCHfh3D8JgL8gK/HJOJAl8/d83M=;
        b=ibcQrrB+USB1Qie6agTn5Bp5b33NeShNOPPVw9QyRMnRRdcFgTzQQ/qnWV0chjPyFU
         ExVtOJklNOyCn9xQNZDjstm68kRF/aJtlkGbKcBAZRpETm+xvIsqvqEGQ16ksBgTC+lv
         i4w0hGnfTRYtHMLtZdHdKzd8JY3LWCCk1JAgvYk1LbyqBXx1OCSmsgmMEqIC8JLBXHFm
         fTUlzNNEksWcBHAJs8wxRz16GMwWVx8jtpU6GYuIS38YYYTEHLo6TaAVTHhvPFBJQYNn
         4pHglDguXrwiQ9lCy2c3zFxCVx8IyPuZbyC93B3/AEbHxWRn0Cx9dfQHfe5mCCAutOQb
         B0ng==
X-Forwarded-Encrypted: i=1; AJvYcCVWCqktCA78Dna3Xxozdy+yyX/+E1AaU36/B/3IXet0qUAGeSRoVArBdZyThc8OeCXDxWLUR/vC/SMKX7K8jPOr@lists.infradead.org
X-Gm-Message-State: AOJu0YxXgr6zGksGOuOHYzZgdfQK5bRoozW0diQJwcvHfBnQYJhrCtcs
	iLfgHT9SboxI5IHrCUwi0F7Jf8iyNY0pKPkpBXp7yvXoSK28hhvd
X-Google-Smtp-Source: AGHT+IFz4e5V/ZhUT+FzKXu68/7/HX9Chj/TG/YiHuqSFphTBJiVCK9htk4MUJh3OJ5HcvAjn4kgpw==
X-Received: by 2002:a05:6512:1054:b0:539:efdb:4324 with SMTP id 2adb3069b0e04-53b23debc01mr2073012e87.21.1729789668288;
        Thu, 24 Oct 2024 10:07:48 -0700 (PDT)
Received: from seven-swords.. ([2a03:d000:2:9006:4eed:fbff:fe72:e806])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b1f30c189sm447396e87.51.2024.10.24.10.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:07:47 -0700 (PDT)
From: Ivan Epifanov <isage.dna@gmail.com>
To: andriy.shevchenko@intel.com
Cc: aospan@netup.ru,
	conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org,
	dushistov@mail.ru,
	fancer.lancer@gmail.com,
	geert@linux-m68k.org,
	gregkh@linuxfoundation.org,
	hoan@os.amperecomputing.com,
	ink@jurassic.park.msu.ru,
	isage.dna@gmail.com,
	jeffbai@aosc.io,
	kexybiscuit@aosc.io,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com,
	netdev@vger.kernel.org,
	nikita@trvn.ru,
	ntb@lists.linux.dev,
	patches@lists.linux.dev,
	richard.henderson@linaro.org,
	s.shtylyov@omp.ru,
	serjk@netup.ru,
	shc_work@mail.ru,
	torvalds@linux-foundation.org,
	torvic9@mailbox.org,
	tsbogend@alpha.franken.de,
	v.georgiev@metrotek.ru,
	wangyuli@uniontech.com,
	wsa+renesas@sang-engineering.com,
	xeb@mail.ru
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various compliance requirements."
Date: Thu, 24 Oct 2024 20:07:42 +0300
Message-ID: <20241024170743.241144-1-isage.dna@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <Zxpqnf1M8rPTB4DN@black.fi.intel.com>
References: <Zxpqnf1M8rPTB4DN@black.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_100750_898601_9CFA901E 
X-CRM114-Status: UNSURE (   4.99  )
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

Proved that you don't care about users of your product either? Sure

> $ git log --author="andriy.shevchenko@intel.com"
> $ 

Look who's talking

