Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374E8CE8E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqKO+VQufYnnSQGNsjJoV9pHpcM4NLycUTcWyfMcgg8=; b=N+l7ZZy0QHAJAhySVdXBWSh9rr
	5QLTHGcYF5XBFbJQ1q4XRmS0+mQORWJw6I/nQuvVMFQpNw11QK2ewi21S1t4mjMLiIw183Rp0HiJd
	qS3qzOtynXvhTQcEDIsft3yMTaax9xLLr214bdzj15D3+chMj8IFRPhc6w6L2lqL300KciVjqmVFh
	6eLXjo+D3eTy8BMgPkcNtcWJxE4IskIsbOnQoJinWMXyuUnnLWns8WhnRZpl9y7YFQJlELq57fx8s
	M7A1Ga4oC7FBjZUydnxPaf+6cfq8SQey7UKsvgxCWnXTNsVS4ZPly4y3vOfcSixpc7szsu0VP2PmL
	O9FnCPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x7i-00000000Mwh-3Sjs;
	Thu, 24 Oct 2024 12:39:30 +0000
Received: from mail-oa1-x43.google.com ([2001:4860:4864:20::43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x2z-00000000LyN-0Ulq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:34:38 +0000
Received: by mail-oa1-x43.google.com with SMTP id 586e51a60fabf-288d4da7221so473931fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 05:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729773275; x=1730378075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqKO+VQufYnnSQGNsjJoV9pHpcM4NLycUTcWyfMcgg8=;
        b=ln4qKqE6D9QoaoLdDOYO420RcfJOGhAWGHf0nluc48ws7oAA3hYqqsgxHETlLpLK/H
         vH68bafmYfm5RGQs2lEVRV0s3HNzbDr8eU0BuLls6cwWNiTYuGCdEx99tEYltv2hbn4Q
         o27ldBIxDERMx4pqtoqeXsdEWJvFnFl0oVBPUDSpnIs+uUIawOcqwpQlJ1b4GWOKCqcX
         IvvztW2cb7NEoJo57T7Pj9qgoe+6517YTBC95XChySUZGo6FR8dmOZ/7VZYHGu/OW/xq
         Iak45rXlrdumaN0KfzA9AA4btvcq/VNmV/LmM0L5ced0UgqbFY1d2bMzYnLxj1Z+hGa/
         h5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729773275; x=1730378075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqKO+VQufYnnSQGNsjJoV9pHpcM4NLycUTcWyfMcgg8=;
        b=qtc4r9sfRgHkZz7Ufi5C4LGGWf6GEiTEHgnLH3pQVdyinpPOXpzAk1D77y7gx00Ob7
         dfyT3sRe7dL5Pc//Q2Pnsd0oVzRXBReVWnxvzvFhxoUrZjOj6nUsY9AHcCdYkDnB7YaU
         3uEmP5j8aqMlSNvyx4e6/O/23MHTBgDXCdX+nZJ87MIwnyYrJnoChOc8tVHGR4CSXZbu
         bkoPslmk6o1TAx7tfgcixaHcrni/mQzqqZlcKla2hyjkcASwu3nU1NyJgCJ+zhVFm1JF
         WKIQXGEe6TyqZN5szCep4Rhp5hG+WOmX07T1JvYnKyv+T/jz1qWaPTrPGJcqDZDdOebF
         2xPA==
X-Forwarded-Encrypted: i=1; AJvYcCXu+1E5UDEOYBw4Gwuua4M+o2tJtgzhoWEXO3l89YnszIxZC2SOqAkdnqOhy2BOY0hu0n+yS5e9WGbK33oUii0b@lists.infradead.org
X-Gm-Message-State: AOJu0YxBVvZGwk1eM/4/nmFEcXvCTQf/t3IUHO3DUZnf5TTXdnsdIeyZ
	Qjo3rxsbLJvbT+413zWZQ33qFv/jLsLmsigiSlxGZamlFOPEcRbY
X-Google-Smtp-Source: AGHT+IGNbdDr4bWOuekBU0ohovYD+u0SLmOKefBPtfh2fzqlR42/5wZYBu+ZqeJfv789Y4nUSEsYRQ==
X-Received: by 2002:a05:6870:218a:b0:277:fb59:b74c with SMTP id 586e51a60fabf-28ced48efd0mr1364818fac.40.1729773275318;
        Thu, 24 Oct 2024 05:34:35 -0700 (PDT)
Received: from localhost.localdomain ([114.246.193.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab48f62sm8534093a12.42.2024.10.24.05.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 05:34:34 -0700 (PDT)
From: =?UTF-8?q?=E9=99=88=E5=AF=92=E5=BD=A4?= <cxwdyx620@gmail.com>
To: jensenhuangnvdia@gmail.com
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
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various compliance requirements.
Date: Thu, 24 Oct 2024 20:34:03 +0800
Message-ID: <20241024123403.154-1-cxwdyx620@gmail.com>
X-Mailer: git-send-email 2.47.0.windows.1
In-Reply-To: <20241024113246.22901-1-JensenHuangNVDIA@gmail.com>
References: <20241024113246.22901-1-JensenHuangNVDIA@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_053437_191410_8C0815C4 
X-CRM114-Status: UNSURE (   5.73  )
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

Well, the fact is that Linus Torvalds, our leader of Linux, is not **Palest=
inian** but **Finnish**.=0D

