Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B9EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJefdQ0fcifSAbmN42YkvhRzBSsRE/Tok4/E/KLKe4w=; b=MSvM+6e6Eduepok8a95XkIKd22
	6BR/Sy4Aw/zVDCZ9tqGpITwQ+o7OddaU+hGFHOq6hnoztnMTSk5PbPSwpRe9s6OfWguOt07SR+FLa
	Nom9qAfAr56QP4epHwRgkTo9p4AjT4TE3sxPTVgn1dN2to86KVrPlsPVaGncwI/cfl4JRmO7fMK8f
	nU+adzrmr4q3JQRzD+ODShVVv7T3qJnvAQYyHZuOY+CV6ecAyIkz5kehFU2xria1gbpAhQK+h/uo5
	4wYP68VwKvwnbDWOL9dQEDOsjN1qnYLIfR3V4tWVAq4Wa13kjpXkJ06OZInJeBqU6ZTEEpTguC/3v
	Nl445r+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzxl-00000006UNr-0zRw;
	Mon, 17 Aug 2026 16:13:25 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzxi-00000006UNM-3L5z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:13:23 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-ca80d708489so38150a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 09:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786983201; x=1787588001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJefdQ0fcifSAbmN42YkvhRzBSsRE/Tok4/E/KLKe4w=;
        b=pXoVC1Fk3VsFWFK8OOGlei/VHJS90HGD/iXQ8Djx3tX6AxgerxM5lcuanoEJsS0RvO
         quWvyF/JSbk6oEC9/VUFKAAZQQv9WjHHrWJCCMjwsbYYSxSOKNVnVb3i6NutfxEJaIdV
         YIMsYZimKbwkrOY3nLInE6nRbjHFT/JNgUoGraFTwSBnGEd5PVbEjNF3E0uLsOWTWoix
         vj9JycggcbqPrs8kOIn7PwdLoXkVVLqaJhp8AVU4o6dvMRnIci4InVEQzsx0oFdDTNNZ
         V+X+WUdnGQLl8iTRbxRTvcFLFOlMTyAc3hpbaZ65NJ4fhhNyq7KHcv595gf0mowSEwIN
         lR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983201; x=1787588001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJefdQ0fcifSAbmN42YkvhRzBSsRE/Tok4/E/KLKe4w=;
        b=Ek1HHTBqC9Ol8w+uuDPzCS0EbkN7EdchENSQyW1phCtH141F2AG64WdIVGRFSEo3hK
         5n669RIiQc5fL5fNcfyiMag4Czp2lCRSNfY1Vvy9BxAYnTGwBGFTN+ClwmMLtJPo+TOP
         dy3zLgEJimmHssm4yvX+JtRrUHxOW9Vz5CICYItILLN8djTkMXP1BZMLo8RXG9JDNify
         7JMHPtsWa/DMgQLrq5SB/XEBGvxJHfWClhjSDjamiy3+mZwxekZ4zMotwMIAcIdPOqfg
         SiQEA54lK2kXby8iLHHY9yj0ylXmt02QnPcMQfU3zTUU3QV91GYYKfSPprMsUUQgDwLp
         sAsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWHaUscysSDZahReFmborBFJyc7I8TXE+x/MTPIGkJRRqozms26qFLEjT7uraBF5UmHgZ2OE6uHMhz3xEVwUjc@lists.infradead.org
X-Gm-Message-State: AOJu0YyRSnakewxhNNA9XhlYiQnNbd0B84zi+U9fbh9Ur6ua9fv0FvWH
	/mQZLLIT0Vcif6+VKby4sJ2kkS0DRzIiRZiGh/tCdMHtaJorwoTD8JUB
X-Gm-Gg: AR+sD136kxScQHJ+OGqpaC4Qsq6rMC7tfprSPDPSLLnTPgLHo59ev7v1n3Ww48colRI
	myZARbzNhXWQtMiZkat71f1znnL1PRE6aKYpcv27NDhLRmoUZbEpvqFuvm4/h2ljdEmsHntjLLV
	WFVaNmXu7qWPQR6MleiwovCniCL4rgxc7ABjVsT9UFy+pHVNZ9sbt8OGsY8Pszj3huXa1v7juFp
	MGPAXnI+hPHwdk0LUX8boQX92qxGo6Ytzi87qOLy1w4PQ1iPuDEv5xs+VhLjASrxczFW8USOY5c
	+Opcbfp21k4UyiW8P6mNEzex6f0BT34pklDBPN7oyPc6MUXHJ5jf0D39xVZpTVrRnf8vUaLf6++
	UeErAuEByv9eOt9CPBaZ94vnP3Rh35fI4S1+Rat3IKQZXDU8aESIQP/senw1UXPBrxM7T4zDd1Z
	RQOPmlFDv4dB4Xc0aYUorAUIBQH9yBorWVoNxvnzJKfTUwiIKHpJuEDjW/yRo=
X-Received: by 2002:a17:90a:d005:b0:38e:4f42:d0d6 with SMTP id 98e67ed59e1d1-3955f1d0d60mr113069a91.12.1786983201436;
        Mon, 17 Aug 2026 09:13:21 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:faaa:24d8:b961:4887])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd22f7sm11391087eec.1.2026.08.17.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:13:20 -0700 (PDT)
From: mdshahid03@gmail.com
To: daeinki@gmail.com
Cc: airlied@gmail.com,
	alim.akhtar@samsung.com,
	dri-devel@lists.freedesktop.org,
	krzk@kernel.org,
	kyungmin.park@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	peter.griffin@linaro.org,
	simona@ffwll.ch,
	sw0312.kim@samsung.com
Subject: Re: [PATCH] drm/exynos: vidi: use memdup_user() instead of kmalloc() and copy_from_user()
Date: Mon, 17 Aug 2026 21:42:47 +0530
Message-ID: <20260817161247.156884-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAQKjZPwb00MePpUTmKZbn67jXp=UWX7m81evttd29L+9UcVxw@mail.gmail.com>
References: <CAAQKjZPwb00MePpUTmKZbn67jXp=UWX7m81evttd29L+9UcVxw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_091322_839498_855D53E4 
X-CRM114-Status: UNSURE (   7.62  )
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

Hi Inki,

Thanks for the response. I appreciate you taking the time to review the patch.

For context, a similar cleanup patch of mine was recently accepted by Greg KH and is now in linux-next.

Thanks,
Shahid


