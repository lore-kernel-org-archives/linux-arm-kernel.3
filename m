Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6417C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 22:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMRUnS9h0I4E1M9rrYsru3/ZHmbTDkVOTPmvmnyeUFU=; b=1pTTld8Gi3NA+7CYWFeX9gzuQQ
	2nXGsu2R1Be93rQjhNe8aSiIH2mcYx+l6frXydjGGjfUlW7fXX8g3H7BCxHpUGJg+ijENxF0jQ8wR
	dFDd5zRmftB+ZNNsG7yPBZozgbyv6GBwDzNeN9G2BkqLyt8d5KyrE+AN9jT4XBBIoZWZb17uYUs7P
	i7Y7IP0DmefDzmvGuj3La+WbIyzNbXbY4cfNLGY7yWsW+Mxrc4shcr2Ipx690TazSOivu4bRJQiXa
	HLeXWsIknektmjSu4N/Jatq2ix9rxia8Ov+vkh/p0MtPamk4GT+jfJvLUTxSKAYKXAnl3FKkCv5jz
	2+9Z48Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tE0-0000000Fz6V-3Dvl;
	Wed, 02 Sep 2026 22:14:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tDx-0000000Fz5l-0lPG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 22:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788387268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMRUnS9h0I4E1M9rrYsru3/ZHmbTDkVOTPmvmnyeUFU=;
	b=fgapnAz1/yx16qQOP1NzTZZo90xy0LohaJ0dr2xXFPObgerer6MNTh27acyx6fkqbtobLv
	HjREjtpmGfFZaYeQZ26Vmnt+Kt95gqmHdslsRKgRR3hg1MtR9WawrUEswN252YdU2JNPPg
	TkAo8LqNvf83U0t5njOND1zC2391+Mk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-Drc4ocRtPACz9H5MEIbUww-1; Wed, 02 Sep 2026 18:14:27 -0400
X-MC-Unique: Drc4ocRtPACz9H5MEIbUww-1
X-Mimecast-MFC-AGG-ID: Drc4ocRtPACz9H5MEIbUww_1788387267
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso244619785a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 15:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387266; x=1788992066;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMRUnS9h0I4E1M9rrYsru3/ZHmbTDkVOTPmvmnyeUFU=;
        b=NT8t+kiO4O53PDszYwND5BKc/bdBb8pjfgtcvodVXOzFMFvH8ahm/WsDQddal+xpLA
         Tf5jku+hL6EBq7P0o1YR5Sju72zU7UB3E5x5pxuh/dyJEU5otNM3SG028eBCJ20e2BIJ
         QZE4K1fdFfPAMWqNgWxsfy0AQ0fcr85XQNYcNIOVQ/25NiTjUviHBg7FhCyEWwhSfZRA
         WdYir7jQa9ihMVEFfkiDVQ2/EWGLOUvUiFFaGMHssLxnOAFvMRtiikajBGCJ25kyDhnc
         jh60JIEFibnTTpZux/IPhkd34vBXbImuKrsnruBDXWkmeFXGeFIBsh579f+clK+j1yTv
         mMcg==
X-Forwarded-Encrypted: i=1; AKwUvBz0PQsYuFYcDH11QYyTtaBQ7nERwWlOPDPtI4wV6DZJ4oHbQTpJ1CFpBrW0kF5zB5NiY0NwEKJsgqD+6A0nMkYO@lists.infradead.org
X-Gm-Message-State: AFuF++lMGuA6UikJOKuyobRSWYWABsP+9j39O83l3b2QSjyGu8DYvn+O
	E1qpwdapfOYJZftY8iDkoCwhqfc7kdaP/0QB1DhdlKasU/0/FYCoebLZX1tQa1ysnlmiyeh9c91
	K6+qFBl43VXcqxds/xw+9tEUjzzpa4W4acpdjTIo4rHjanvl9lloTvDbXMGiIEeyO25VNscwF3r
	5f
X-Gm-Gg: AYBFou3TL2vUD5sjWTxS70bqjh0V1QnFvUTsmkC+xZQDAH9iwvWHkKJSR+ut5HKhy1O
	yIg8J+npzr/opOVl4Ly6rQ5PCmRssFbNE61y3bW4Iqp5EXcmtpENddGXIGxv7ZlIwCOUey88JW5
	2yp9dfOCxfOae3QVWX2T90KeP0cVJLd7h/IdLVMNlZ6Oj3gK9DmSnnZATjermomBM/z6OOv6XYv
	jd4Sis5RMUtA7hsE380NIesUoC/LIRj5bymXJdDZ1XbfbAmy0b3/dCRq15ZolW38Q1j1/4HZ8ZS
	E6g//6nBYGZW5l+UaxBKhs8SWgfvFYWB2JYZ8MNCyTbZT5Y3+7Ts7aUMhCBXi9zW+v9Wd3Eo8zy
	BeA==
X-Received: by 2002:a05:620a:224:b0:939:6dea:374b with SMTP id af79cd13be357-9396dea3871mr270245985a.47.1788387266607;
        Wed, 02 Sep 2026 15:14:26 -0700 (PDT)
X-Received: by 2002:a05:620a:224:b0:939:6dea:374b with SMTP id af79cd13be357-9396dea3871mr270241785a.47.1788387266148;
        Wed, 02 Sep 2026 15:14:26 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f1bb916sm333992485a.21.2026.09.02.15.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:14:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-actions@lists.infradead.org
In-Reply-To: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
References: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
Subject: Re: [PATCH] clk: actions: Drop unneeded forward declarations for
 clk_fixed_factor_ops
Message-Id: <178838725006.2050893.8055946747659778474.b4-ty@b4>
Date: Wed, 02 Sep 2026 18:14:10 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=356; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=UWho1uqQ0CDENJKMvXX+YEGm4bA2kTI7CNsEm75ctQc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmzN99cWbGSYXpOwItG+YHsChGTbuy2IzTfLGjVswqP
 0aBAL20jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACayZBIjw6s/bcZVz26z/3+0
 YvFyl843TlmHH+8SPd145aSy0nPj+eaMDNNMq8q3vIp4/FgpODVs7Uod992W3PUHO/gmFNnzzql
 5xQcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CwIOSnLVy5beZb9yT6tmu8ULD1sX8GMxnLI-h0HN2Vg_1788387267
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_151429_293082_22982181 
X-CRM114-Status: UNSURE (   7.09  )
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


On Fri, 14 Aug 2026 16:43:30 +0200, Geert Uytterhoeven wrote:
> clk: actions: Drop unneeded forward declarations for clk_fixed_factor_ops

Applied, thanks!

[1/1] clk: actions: Drop unneeded forward declarations for clk_fixed_factor_ops
      commit: e831ea3564120f5eb21a90eb7a46249b5b4f2878

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


