Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A67C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw+9uymcNzlxJKKy4FHGEVrfFsfp6TRSqHYePvcSjr4=; b=ksKBemHrI3bHycIUMlnY4JzyI6
	oYF+mrf3NqN88i/kQk5rI6g7tSTXvU+VFl3+j0+I/G/J0o3orx1CvnA99CbYe/FgjonI9NjLyXI9C
	2WrXbixZK49LqFi0W2qMij0mNiIP7TVOnBkPCo+FFuJf6wQaZwmf3fFBBqVcWHwI5LGnnoYNmfhCg
	xQkbyqFyurUgieL2uyjzARPsi4BDNC6SbYBrynDnf7JaoCh8n1HbYmKGpVG9ZVX92dbg0h/IrB+D/
	fhZcnBmovQ1i0i85a8pNYUhRiuAAOPrb5YiUXIaylHSb5MCqd83yhbxW7GmE1aJI2VB9nz6IydvI1
	vN9R8+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkN4m-0000000HUhq-3N7x;
	Thu, 16 Jul 2026 14:28:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkN4j-0000000HUhO-0VSD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784212110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zw+9uymcNzlxJKKy4FHGEVrfFsfp6TRSqHYePvcSjr4=;
	b=cOcSuJf1zTKMjY3IcOlXpB/h3pV8yWqKYl9hFCgtAQ11Oel6tPYCHZWnAVAxRwvslHKLro
	gnu9jpxIg7OzJ9NakEkYuOAFIOO307+l3OIOIWltdCqks5ZItg5AQkWuHC9/Wfc9BAQWZ/
	mqbqJQ7idpVq3H2XaYNgld+9nAjzGVM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-lTbPDG3KPryZ_zf0qzqZ0A-1; Thu, 16 Jul 2026 10:28:28 -0400
X-MC-Unique: lTbPDG3KPryZ_zf0qzqZ0A-1
X-Mimecast-MFC-AGG-ID: lTbPDG3KPryZ_zf0qzqZ0A_1784212108
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso131076211cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212108; x=1784816908;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zw+9uymcNzlxJKKy4FHGEVrfFsfp6TRSqHYePvcSjr4=;
        b=A4vzWGuOV0IOH5giUkyL1ii2ptyVDkS7AjxTWu40mof9QWGwlZXP7nSSaLl9WkUrpz
         8YOcZ6ct2PD0kYpUvf9RuEJO/bJW+AF7aTg2rOjGsd4MfIhsvWuXWZo7cBLtE4iMmQkJ
         UmrrsoECF3+M3v7FAd88s8cr8MjWYOnzYHyQcuH5+kOf/lyCFaQ5TfBUUz7j53yzQCXh
         ZEjamt1IJlmctEXlmPCQvvwFSmEnomlb00yvAWChL7LMoIm41/S4om6kmcCKHy8YzgvT
         JsqEHZspVfO2Ua8DIGQae3KbDX0si3EYS6yToZ3IDpDm8ug9utmxcQrDLMldMSpWKn5W
         DHxw==
X-Forwarded-Encrypted: i=1; AHgh+RrTX6ASnqjdXXy4Yr7/5y4jbBDC3Jpgze5alnocjQYZPaEEJEgi/6Jvy35xdNm2Sp6uhaUPGvMHjPfXYCwIh8Ds@lists.infradead.org
X-Gm-Message-State: AOJu0YykPlirPmwYtEc97YRq28p7PS7QQRRnECLFBexMltfzCmN78KSi
	o8AVXSxXuM2MzTeYoGrBSN51Xg0UcCiBp0wnpKUyED/8oJ9ql6/xbIvmXjp3JEudkjbbhdZgXQF
	ABCjNBE5SlSZHBqJjBNWPzyxm68FPmYTB3a8UEfT5eQvrjvPts0tBFhL8QHBMehDf9IusNkmAMq
	1u
X-Gm-Gg: AfdE7cnoNauVNDKBMlb65qcNzsw0P9y5J/DAOB4FLXdJT7KDD1W7ShPkMLx2v/2hohw
	I8x7k+Z4WGXQACFm9l7JWrfjm3WkrkXh5/hSMIPP+dWHoRG7NAX7E66ArwUub0TGzO6nzgAu4qk
	Gt4R/sEfKkdtRRUzV8uK+/Q27fnTO9pwLte0cvALYaNJ7ASMa18ptyrF/WNgAI0cSqPw92j8T/l
	hrAaaj8+5RHIGpGRmokXsUBEfMFrr7I0+i9jdsWjJbHGJx7xW9yg0UkIXlALEItoAuchIz2qaPe
	VO8WGkQDGE5R4IoFoVAUKJNELgbdnExVLDYd1q4x7ygf5QNBzXue7VqydX6Aq1mNJzJpgmg=
X-Received: by 2002:ac8:5a09:0:b0:51c:15c5:2be6 with SMTP id d75a77b69052e-51e3c1551d5mr134459091cf.8.1784212108122;
        Thu, 16 Jul 2026 07:28:28 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:51c:15c5:2be6 with SMTP id d75a77b69052e-51e3c1551d5mr134458541cf.8.1784212107530;
        Thu, 16 Jul 2026 07:28:27 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf671e2sm154835271cf.25.2026.07.16.07.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:28:26 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:28:25 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: duje@dujemihanovic.xyz, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mmp: pxa1908-apbc: Remove unneeded semicolon
Message-ID: <aljqiVLKvMztoQCM@redhat.com>
References: <20260714052525.3219644-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260714052525.3219644-1-nichen@iscas.ac.cn>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ILTsyIAgOvIPYe9EdCfHpJaIhSSYStN1mHzcnfJL_Oo_1784212108
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_072833_252164_CC59F50C 
X-CRM114-Status: UNSURE (   8.70  )
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

On Tue, Jul 14, 2026 at 01:25:25PM +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>


