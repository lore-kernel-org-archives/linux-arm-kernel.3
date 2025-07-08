Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618E3C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtyOMEbmKhYccPR85zPZqi+3OXt4HRCWKlkTUzeAlK8=; b=IDTYtEIFCSv2DWJ4fQMCGVi4wx
	bF/GhS4JIUCwjFNrL8H4RJl7JSo02//KBX7OrCTPQwXcUY5jeuI6eV5PcxcSMDrIkSnrKgadniso6
	vp1nibp70lSvTdAYew+gLa8hkQi9Yz8PWbTxR6gM3+1bqzgSQrBSVxQYEz67JTVXnxOxRGW/AEc7e
	pHoQR6m6W8umnSLns16NTTf4FhePx0toLgXq+NyJwDkO6KJJXGyIwyT0/vmfEUuOW5SX+JQ33zY+D
	dv/nyPXhSCI+LjEz0Ids2uES12FcR8nVN6lqmAFTkcwoHeyifkbGEgEi8uGQ29j7rpRn1TK3Lajha
	oMzyjKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8zs-00000005XUJ-38LM;
	Tue, 08 Jul 2025 14:08:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8wQ-00000005X2P-3a64
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 14:05:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso13416665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751983501; x=1752588301; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HtyOMEbmKhYccPR85zPZqi+3OXt4HRCWKlkTUzeAlK8=;
        b=YNa8XNFcgdvcBcL+pY8IgcknQ5TAuhO6l5KshFeEeiqjgO6CgzXeX2oWU4Yy7yYjLR
         Q7bEM1GFgWCtwDYVMWrdeOTCVOSwUrvxzmCeWZ/fB1SAbxYSoGicnIFd2I6zHi3BUkzh
         uAsUjo4+JuIOm1AOwcx1DvW08EsLS9AZi3y1NWref81nN754vamtKkSLmjSVX+Pk8vdZ
         2aMt0UC/Jm4jLB0NuREycetA1lcaurQjTDgD2XvbldTyVoCKfssIOfMFgQ4S4HMnVK8K
         F89fSJ8yiwQ9xXtgszunAMuAcqG3Phae6Jb2CzGlGCDXevVTPcy4JtSFBJVDIdatyrTV
         Qbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751983501; x=1752588301;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtyOMEbmKhYccPR85zPZqi+3OXt4HRCWKlkTUzeAlK8=;
        b=oSI7LsjlGEN//yXyzREOnOTkVHnplGQ+q0vOjnBRYlnJQr2TijKkAVEY3wHo0HJITt
         wh73mbWZMLevBBKWJUKYAlmELLNaIUM1nFk8X6jlt7K9ILzA9MWFrnZ/GsW48Cbt89C5
         tVtp7EViHeKlYtFeouQ8lrueyod7tJdZeGUOtKZnqwz+3Yd90GL+In0hc5vIQInO7W/O
         zZtie/TU/T8S8riQZ1PEEwSuApBPoY8oZ8ph64dqvLDtVjRmOTtkPsXFGcLgk/odzDNG
         j22cGfOeE+0KnuGiMy7E8HZt8ZcMYIGX5wFtdKOdU4aQYJuzUAmAtf3BAcGHchj7vZyB
         ibSg==
X-Forwarded-Encrypted: i=1; AJvYcCXadwp++8at8QafchgSHqaVf0/jWYQG/c3ijgt8xqKJlb6hfJUPKZYMjBHpPxP7+85vGMIqnLOWsXNimbSPfAnX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpw3s8148eWrUAPm5cOUsUQGqlbDfg7EYW5841FnNbBwlvxoZ7
	QX18TOAXk/ASiUW/cZQO8wa16O2jQBosTfsNNxiGFhhC4xRFTkfAz9Av
X-Gm-Gg: ASbGncvvvnxDAMy+ZCvp05rfxW78tcoEMeX0TfHKCMm3VGMKD6MO7ox2C/BkMaZgWUL
	adC7Jm+iryolsAOoBeXilcUsC6Ix5cZBjsuJIGGuecYsg1bn3mIvcnT6AhILbdiM+eXHcoOztPM
	v4/pkiDoAZKJO9hyZxeosxoiSTQdj6NH09o4d7s/4MZ8E3A+f6/rhbF5c+Nawsv7PEn9vJXlhPU
	CxheYml/ArKV0xGJfvqdwvJNTkz+3Cjb8yGSSHMXUfLvc6YWKLURdn4a0ID7UV1aBd+oXlzT/k4
	KJPTP4LOC8LGQZBGpG77/02GAu3yqH2nN9HYIC7V0i0j1sMIm+zSMjGEihUjAg==
X-Google-Smtp-Source: AGHT+IH2IcGnzTu4f5ARGuOr251NCQFPNC43aWQKhhYdtFHA2gXGRsOu9touosxAKfObj0pUusrlfQ==
X-Received: by 2002:a05:600c:8219:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-454b3107ef7mr149559065e9.2.1751983500451;
        Tue, 08 Jul 2025 07:05:00 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454cd38f03fsm23612485e9.5.2025.07.08.07.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:04:59 -0700 (PDT)
Date: Tue, 8 Jul 2025 16:04:57 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] crypto: sun8i-ce - remove boilerplate in
 sun8i_ce_hash_digest()
Message-ID: <aG0liS6ZSr9HF_EB@Red>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
 <20250626095813.83963-3-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626095813.83963-3-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_070502_895949_6486DDA2 
X-CRM114-Status: GOOD (  11.27  )
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

Le Thu, Jun 26, 2025 at 12:58:05PM +0300, Ovidiu Panait a écrit :
> Retrieve the dev pointer from tfm context to eliminate some boilerplate
> code in sun8i_ce_hash_digest().
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Reviewed-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards

