Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CB8C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 05:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfTYsE/6ZAFQj1QetMnj/IgohbPhMLjdhTn20RmFQNE=; b=SBWFrB/Ew5uZ1sxAQF+ohmeSWd
	jgQpVdheGLOGoYSx5CEYwvN3A9UDTen8hEFQtqtdTJ2UUoYoeTcGGFuRU3VfJVsM3XxZtr+2CfcvH
	0ZI14dr7O3I2csYxrRs85QzaUlcGwx58RUpO6pormwkzGKd3kBtaoPhOLmi3/e7EuklCwcXuYHZS0
	OTRg9n7nGNuMdggxtB/jO5Dw3KJpZW3h70NMRgKrgjuXtmSF+V1gMVUB6X7xB7Qe61HT6Ks/SmyS8
	JZC1Z3ZZUr9GEZ1AOx0tEEFd6+ZBkHggsJRYmffk9SzMSEFEDif7BuDsKeHbI0qKVIjOtVliAIlet
	DA9B+u5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wox2S-00000006xI2-0xlU;
	Wed, 29 Jul 2026 05:41:08 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wox2P-00000006xHd-0hgG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 05:41:06 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8487214ad2bso849051b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 22:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785303664; x=1785908464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfTYsE/6ZAFQj1QetMnj/IgohbPhMLjdhTn20RmFQNE=;
        b=Izac7Ki4f+bNU0u8I8sblUQZqTphlkx0mks5TnIm5G27wVsjOs9/O1h1DKavOaeo9p
         Dg/MBGoVt/CZgISRICWyqVQKAvkcHxLBGUZDqD29SyOmh+7sEY38J147uSuIdUfk9Uox
         HyjP8MTyMY2lm1vJANli5NGOQ+KzYzXUHwxO9+D1aCCx2Dt/D3/Vk1NsJaaBNMtVhBKn
         N9l1nen2ujCgOVxx0d3UBNrIKbDp+CZ5k7ICMTDEnV7veCoZO/+9Sepy6IoLvSTq4Ri8
         YfN2J7IvFBpHXlIo1nOcHA5pYSgExPz4KETBs193XRvfQhUyaj3GkDIwSvAt+1QVqGBE
         vsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785303664; x=1785908464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfTYsE/6ZAFQj1QetMnj/IgohbPhMLjdhTn20RmFQNE=;
        b=PXzkOSGmTaEn9wbM77RuWhGEXHN4Khw6WaMGZ3md6/L+F0hmcNcjCEHRRafIC5lOJw
         1zAT88haxrAv7NRdcA30JK/Dpk/81KiBWgFu5kC+Q43lyHy2qqRb93gzbUp9JzPrOcKx
         9dcmvPz4q/Sc4gkmdLKuIQwpxL/B8oTM5OZOvZO3QiQNPeiKou0poYG5hwNIIZjcXHqM
         4wsug7wOXMVNzbJOQAjS/EXD3JnT7DFc3SLLjEAFwbTpM8PyldCKLvlKttlaZgw5ipm2
         YS8qO1eFD2dzuBlL86Na4ue/ajJsMby6K5lApbxCb2Jr9cJENir/v+xrDKinJmhELWhD
         KIXA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3perLe8ax72ZZWYLbeVITOsPan1ydO1fXAAyqYcjnEtoUo4aje7nmQldWT9fuaLGRmWzHdT8SNVx23jvbbkED@lists.infradead.org
X-Gm-Message-State: AOJu0YyAh+QmlfN+c/nLg9EVTlvYd5LOhDCFF39u9GhNvAmSmtdRZRc7
	bzCp9r0FY50XiqWhEtPlU/8kP9bSehifoiT5c755v/WuOsKm2NszeIgt
X-Gm-Gg: AR+sD11bz7okMTMnKgr4UuoiUeCDl9RWKBzopiMILu3yiqOiBJMwnaQqsCCPjtQp+C8
	t5vm1gWKLCx9jQw7o2E6SW+2NWzKgsQOPsZ1zJS+VvKBda3/lbD5Rv+mDSu2CT76nY/tzihvCAK
	exWe6sYqhiMTGXgByo42TRLEfqs2rL+8+yFu3mjTcfQ51VxXokvat+gzlHB5ye8nSwkJ6qZlekb
	MTbZ4MR4hxe47mQtfI4gLk+5wbFkipGfxZGz5H1ugzGmMia084oCpUdU2BRw8cPdze6ccII8rxV
	k6Za7qi0a3vRiEfif8boccc6u86b/kjGhP5slBk/Gn9LCptW0r5JTUyVqXEnFTYlM7FZjI6/sW3
	Jd8zzvcMLo6hEiL7Z+bYiZxyW2lClXLGxdQTpEbbN37SzblQ5HbpjW4Q3u05nApnDaAWuqCRVLU
	pQxeIWuUjBkbW9ypsfQPGMNBnRW4WxN1MifAGwZA2IA9tnzAfzxu+KjFQraHco
X-Received: by 2002:a05:6a00:94ee:b0:845:e08c:a4eb with SMTP id d2e1a72fcca58-84e9336c861mr5698218b3a.58.1785303663650;
        Tue, 28 Jul 2026 22:41:03 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm774744b3a.31.2026.07.28.22.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:41:03 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: Re: [PATCH] counter: microchip-tcb-capture: Fix DT channel validation
Date: Wed, 29 Jul 2026 05:41:02 +0000
Message-ID: <20260729054102.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714042910.7-1-bbnpreetsingh@gmail.com>
References: <20260714042910.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_224105_210199_15EB6899 
X-CRM114-Status: GOOD (  11.89  )
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

Hi William,

A gentle ping on this one - it has been a couple of weeks without any
comments, and I could not find a competing fix on the list or in
linux-next.

No urgency from my side; I mainly want to check the patch has not simply
been missed. Happy to respin if you would prefer a different shape, or to
drop it if you would rather leave the validation as it is.

For convenience:
https://lore.kernel.org/all/20260714042910.7-1-bbnpreetsingh@gmail.com/

Thanks,
Baban

