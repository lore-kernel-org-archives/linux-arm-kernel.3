Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0FAC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=; b=UXto/eQsuaSNoKzhzGln0hkV+O
	kL1kyH9KQll7NHQNgV90bImfSyj7xQqyfEgW04qnkboftcIwZulTYhUUBedvrUTKJ3Ux4cXpzSK5S
	rUeHqszAQh/+66RZy8yLA+4xK/MAwvqv7tunnJi9tZlU+fNAgXBk0dHQGvkaY6UyCFpaIFTBVeRze
	dcPfcaJWjftqcmsP+Vsi79B/eRWMur7rJaz9WiXhk+A3uTlqzaGLslVaUoM0r85r39f6G66APNaZ9
	9ILZpI/8FHI1nuCn9urbItVw6pYPfDplTZ8bFkHKj/muFdL/KdQqM6n3HGBZfYZWPzKwIWmV1tBqi
	HlcsrG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59pq-00000000H9m-45Fy;
	Fri, 11 Sep 2026 22:35:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59po-00000000H81-0Paf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789166101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=;
	b=YRFlWIdalXHFZr1hXfXLmtQYP6CgoFT+h6DQOwqUHikxryyTCH7R/ZRsSUaXqnNbTGcxbJ
	8ZjJ1hEy5vy3XBvK0v8X1jqIjL86f28RSsrja674DwvNZGuqzmIROxZbgq3Ac6HyxL33R1
	Q+09dAJ7hBbFgNEt6FmEcPyIkJRfnqE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-cKJo2_AfNjePNjWL_596ow-1; Fri, 11 Sep 2026 18:34:59 -0400
X-MC-Unique: cKJo2_AfNjePNjWL_596ow-1
X-Mimecast-MFC-AGG-ID: cKJo2_AfNjePNjWL_596ow_1789166099
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530d86d40abso18098551cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166099; x=1789770899;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=;
        b=BqGfEDZD221XkMrO27ZHtYyYTB6roAis8htiwEnGssku8bi95tTDZE3m7pYCce3HbY
         cSVCG4HzikOYbn0iANeKGWCB7mqHdmrGzUbRW34mtANfKzyIBnPhM+aRulhR2MYT28Dp
         BixHRc1755mPZsUQPcvlFL/GEEVxkeUhQu5QMZdvxn4BQQ16M923aTyHqVNWhB+/eQY6
         jLzzMqAKCuyCbXshq0o7xRT2OC8QCSomfBaAG38IFh/20GM/bqO/1jnZlJWep/uTm1+q
         Bt6HEr/c24WBNoCWM/DLx5mEwSf/DgkOW++qrTqrOUbXOxshImLxO3kbgY46sc7OI8Vn
         2u9g==
X-Forwarded-Encrypted: i=1; AKwUvBzAu/SE/vghw5Hwf06AJ1O8rsUizJ4enK6+Xobzx0PTdYAyA1WyXLy2wkBFnaRUk5VRkdXX4j6JK594X6eE9QeO@lists.infradead.org
X-Gm-Message-State: AFuF++lGmaYR9RJNyQVjilvY5l1qm3A73JS307LENBTA+SvgQCQiZNlY
	rLdeBg4gN+Fw+CQG7m0raAr4Cxo5TwW45e6YB0BviYFHbDxATSp+z7tWcT3aRJS9ALfli+ZqXGl
	FOOTXA5v0Dwk2xZuOs2V2Sg1R+jr1FpVyJgR8U7Yqx5m74QEoOvkLWTlnztRXb6cvV06yXenxfQ
	4yRmcrnFUliN7mfXYxWDw67uM0ITvk6soygkpGzyafC1HHeSNgc2EfdizU/cU=
X-Gm-Gg: AYBFou3Y6hTTUGCmpRSW0ww12dHsujE0dFunT5KcNoE/Qhg9W3nnziSHZdfTBt/HBPe
	Pn5QzpmldoZVaxWlH5bVyT8hzjV/UiAGGrpkGBM7BvU5c6yXPpZTsPshVdD14DEt2nxypDMkBaF
	APYD4b5G9tD0rW3M3gqD6DIzm7SyUfqf1tvuBZS4O7s08KlfVZB/r0WKhwAQS7pIzhWoRtBb1dJ
	zdXQ4jNAQBxt/XBdAcECkwFgcS5ONQ1xvMs0UnC/UrJDG+d0/VfR5c+E2CreFKZmmRND/gpA5XV
	0datYmag9Cy6eawDJeON1cTOJTyBOTPmz8hYZ1i8czBCpxaqsV6hnl6Ow+y/RAg9vM/b66tuCat
	7kQCErXhmsE2ERb52dtds4I4TQYeEtLZbMFKQQcAx
X-Received: by 2002:a05:622a:1a8b:b0:528:38b1:b547 with SMTP id d75a77b69052e-530c8510528mr108925911cf.8.1789166099040;
        Fri, 11 Sep 2026 15:34:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8b:b0:528:38b1:b547 with SMTP id d75a77b69052e-530c8510528mr108925361cf.8.1789166098564;
        Fri, 11 Sep 2026 15:34:58 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530cc781402sm28631931cf.7.2026.09.11.15.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:34:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
References: <20260910033000.15926-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] clk: mediatek: reset: Fix device registration
 kernel-doc
Message-Id: <178916608638.746679.11554691931309415049.b4-ty@b4>
Date: Fri, 11 Sep 2026 18:34:46 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=F5o1tXYctjSgBI/LtZLOoWzWpvKzHWB6U29+4E8/BK8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWNHGz1Rv9ef7R/H6WvYPKyV69j11R4Wk/pTJCPIN5v
 ML2ynt0lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMJGyaYwM99cy8j566Wpfs/h3
 CNuZP0GXPdlV1c57rtc46s+d94IpnuF/Crv6VYVM/yli7qwb+PrEI+6n7TIX2/1T7fjfJYw6p2Z
 zAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KHwcp3Yissm_kstU8DxdzSGDmHTBfay8oeGcmauYcPM_1789166099
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_153504_217434_81D2435E 
X-CRM114-Status: UNSURE (   6.72  )
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


On Thu, 10 Sep 2026 05:30:00 +0200, Karl Mehltretter wrote:
> clk: mediatek: reset: Fix device registration kernel-doc

Applied, thanks!

[1/1] clk: mediatek: reset: Fix device registration kernel-doc
      commit: 8d5fa37307ac1f0612cf17ac0ccabcc258cc1526

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


