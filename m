Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711B4CE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WJnbrt2+eyPMiVYG09me24q/mcBtJcn+Lsz0IxKsZc=; b=4ShGPKed9K/oqJ16a7Y8Fa2u5J
	YNxUFsx176FIN5lHO60gH+2yU+1va5SYZORKxaYHvyRk1keB0+j3JH2cCoAJxx5WSQANFTj2S/rXv
	bmWLY+nsTrzgyDoWeeQ3TXYjAjrSKVzz/roxZpckYNdGzuhpu1ePFsZwLJ8JaNcwtPHbHxK7vq3Ap
	AwVP7JRa2rxTNfnGMRzhI4/IyLqqKx+oFbZ1Dj15hCIrGzEfFm+kUHgDzu/hkeL14uuQUdkS3qTMh
	v+SFyhfKZLYZaoeXvKmnCyTMpX72zAUtWuelMEdQ+2H2gtYKf6T0pt8SBcEXgHe7UcFphDgRzvhEp
	7NiQ+oQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t428J-00000001OBQ-2YJG;
	Thu, 24 Oct 2024 18:00:27 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41nW-00000001Jgh-2JxG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:39:00 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539e690479cso1288528e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 10:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729791536; x=1730396336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WJnbrt2+eyPMiVYG09me24q/mcBtJcn+Lsz0IxKsZc=;
        b=dabxGgZgP6WpCbcOoALTTpoVv+7YwA/iCj4g3ZsMJZa2uA2dXd5cff5VAWM77QgOL0
         REfA2E5MuRMAqYl6LKIL6vRSzm3zJIrTioq66a3WxsgSSPHUvQkIkssSMAnOueFG2Sfh
         xVp9eB0u9Fuc+XzoaLa4phO+M6jtubJbQ6F+zUsMWLJnJOp79DRNZY8Yan2B4IJL/gUa
         kkJHtNSa/fb9I32+QqsM75XREP0puE2zLaeWJg39YySxB7SFWdU5hUOhyW69DznJdn97
         kzu85bc6Z6Rwouqsp02TqCN5/pm/ucuuOSnKIwXkc5GzkCjYKRcTXDD3DEGxS9Imi5l3
         +unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729791536; x=1730396336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WJnbrt2+eyPMiVYG09me24q/mcBtJcn+Lsz0IxKsZc=;
        b=vfSeTHtM2qBL4afccd/jeenly2hhG9mAg58Wc6aiUy7ohaM/XgEDLQa8NCzCDickG9
         hkrUpfqEsY5luhtbbOae/RTM3pD7Gs8W/fJjJYwUbuef1Ew1gRgB5Mkck6PtP1zSaizf
         cW7FDgmBv+8GUhEp6xsDDC6ikKmOT2S2BCMVQPNWhG8bdwUAts8dOPW5Yfv5reu1oZfQ
         bJMcd2HzIXRKYiiLZHS2P9ab05iiS6B2SH/Z+2pIngcLs2RNLnV6lO3g9BnNJYjGlFF9
         19zGAnFrIYyaZEgG/DjgrFv0I1QcA+slyzSdjJ/ojLguyCViH+uxbO9T1Q80PL0SeC2V
         y1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCV57INBXGrwmWV/sXiIunMBeUWGnXrKIPtLI1ACnRtBg9R8DdAW/6UE+HQingoaxvHIAcFAF+FjduoJMsZGaAH2@lists.infradead.org
X-Gm-Message-State: AOJu0YwU+J6vp27EPiMdMComw8zVijMqe6lIcb+IphLgkaTD0Cmo7rdn
	Nvkfd/8m9yR9OhdQ3A+BnDW29b1+hUipO06TZ/t+tFdLX/SonlEP
X-Google-Smtp-Source: AGHT+IHBgp08+X7VDah7A1PXK+oh2J53hxr+ZwxrWtWH2iwrLcyRGNg7D7RBAUjcie/LivvlgLDo6g==
X-Received: by 2002:a05:6512:3a96:b0:539:e436:f1cd with SMTP id 2adb3069b0e04-53b1a306993mr4517544e87.16.1729791536088;
        Thu, 24 Oct 2024 10:38:56 -0700 (PDT)
Received: from seven-swords.. ([2a03:d000:2:9006:4eed:fbff:fe72:e806])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2242024csm1417428e87.121.2024.10.24.10.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:38:55 -0700 (PDT)
From: Ivan Epifanov <isage.dna@gmail.com>
To: linux@roeck-us.net
Cc: andriy.shevchenko@intel.com,
	aospan@netup.ru,
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
Date: Thu, 24 Oct 2024 20:38:51 +0300
Message-ID: <20241024173851.245260-1-isage.dna@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <68e35542-d360-4a37-9ff1-16fe76594b6f@roeck-us.net>
References: <68e35542-d360-4a37-9ff1-16fe76594b6f@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_103858_617831_35BFED02 
X-CRM114-Status: UNSURE (   5.07  )
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

> Yes, everyone should do that, and I did.

If you did, you'd knew that their defence ended in 1940 with peace treaty.

Surely, Great Britain, Canada, Australia, New-Zealand and Union of South Africa delcared war on Finland in 1941, because Finland was "defending", right?

