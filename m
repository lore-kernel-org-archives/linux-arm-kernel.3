Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3F4C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqFrysN/+2cVNmsG8C/cGiUNyDrof3Ao3d+7KzBs1dg=; b=Zq5QZxFSrh0aaOiOER2f9Larm6
	u0aLde+lKLnheC7CqIOIAaBUKTlfLEdlU0SPCAye9WEcEegFz1I8dOFkdlv8mKViKKhoRDG/VRVl8
	X0dxf92tsovk2mZibtdJUGhLTiOwsCT70RnblDDna1zkXtBmJ5bk+QJ3TiQgFMTSXs+9+6r3LB0nC
	eMFGTOdQZcLXxlcOppQceWirR7J3dMrani9CLwd8iXS2p2bP03omqxcT16DBFdX81wao1Yf1SQciX
	+L41wzAP1YLpJG6RKwzz8udaRePvSYwLCTzzjpI0CqhA93HW9s9HBCCsH7qf8XMrWeplabaT3V+bu
	ImJDHSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mHF-0000000F14B-1IB6;
	Wed, 02 Sep 2026 14:49:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mHC-0000000F12E-09bI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788360560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqFrysN/+2cVNmsG8C/cGiUNyDrof3Ao3d+7KzBs1dg=;
	b=L9kbnnbOMr4eZBelfYGJ9k0y1oVeppzlgx9iYz1l8M6CrnjvDu0AIh2Av2aM7QH2SmSi1u
	sRBOoG43v/R1VaPVK7z1vqegltmPRSwwO7RjNn1cg6TovIFU9LL1WE0Ol4/ngyJ/C1b3ae
	nsGHi7hqdtqvzu7Z1MGEeeh+b2sok/o=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-s526a6ALOyOWX3gB-VFPkQ-1; Wed, 02 Sep 2026 10:49:18 -0400
X-MC-Unique: s526a6ALOyOWX3gB-VFPkQ-1
X-Mimecast-MFC-AGG-ID: s526a6ALOyOWX3gB-VFPkQ_1788360558
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e853561c5so14266756d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 07:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360558; x=1788965358;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqFrysN/+2cVNmsG8C/cGiUNyDrof3Ao3d+7KzBs1dg=;
        b=n68u34c7tXLhu98ypSghkYJSfwpZspk2V9zIqENYowgXAffypVOWxvyz9OQeX4DPTt
         B799V/61qlR+fRUNsC629IzETIkwBIlNkfnDkVwnnhdEVhAKXZ33/k/alIkxdVUph2MT
         aR2/6KB0kVgtKOpCNPq3PSBM0ndGQv7iE/PQPeMIB4X0UeswDf1FQwR6JUJaBhhRYlr7
         b5a6r8xD6+HpMne/+TixuO/gpyTzP3sxXVl/hV6kKdmpyVsvKNbU3YbVdcj6Gce2kJZY
         AUAXWBVGY3Bw2q5G0waHTFBdl8zt9wZyJBRTxGT+v289F9E/JaR+RfXndCRXHJLVK2L5
         TO9w==
X-Gm-Message-State: AFuF++lNU5ZMYb3mXeRBF9MZVAI/AIrxhy5GbEHxnOoqikpeAS2wGu8J
	TfCpGKRG8H1IS4T0nlJab2VQuqZYabQmDth+gY/wmyyL8ZM1wWKbWsXb/WO0E/i6gA4QLB72npD
	r6m7nLyrwIngrfw0re0WTTkuNbx3kUA13ryzcgR2Okfhj38IDY7L4cZHUf5YrOAmkgWpItUmk9r
	Oo
X-Gm-Gg: AYBFou1n6Z/9KDAbGl5/ecMZoHW5f3UMm4/JdBrWpZIu9inAr9i9RoMya58IGXm9rLo
	IirgYlc8PdVZ8p++1PT6+N0owlOo2I9ltQBFR2gO1iApix7jsleUwNUcB57NLlX8VSd7kKi0KF2
	BcrdP2mW1u7xTqEe1ebSsPtKqq7AuR1q0cYtWPgbXJzexhBs5c2mA8shRJ7untSrZuMe0d46A6e
	uj+H7jfPSzBXKFo4t/ME33b+P/Q61x+jvkNM2iuMvSOoGB0fRpLjzwrJlhM/v5G/u2oKpMdrDY9
	8lIjHGUekmBaNGjDAmMPdpsA9WLc83LmvlW4gaVET7UHwbnPLRFkHwYz6hNPc2a1d0t14AS/sCe
	ysYdZjYKt6U5YDnxofVUiEsv5DMrLUx8MDXvY+LM=
X-Received: by 2002:a05:6214:2b0a:b0:90e:8dcc:4e5 with SMTP id 6a1803df08f44-90ebafb8fefmr72182166d6.28.1788360558155;
        Wed, 02 Sep 2026 07:49:18 -0700 (PDT)
X-Received: by 2002:a05:6214:2b0a:b0:90e:8dcc:4e5 with SMTP id 6a1803df08f44-90ebafb8fefmr72181126d6.28.1788360557564;
        Wed, 02 Sep 2026 07:49:17 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec8482sm19647986d6.31.2026.09.02.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:49:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Daniel Palmer <daniel@thingy.jp>, 
 Romain Perier <romain.perier@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, hanzhijian <hanzhijian1991@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260824142800.3497263-1-hanzhijian1991@gmail.com>
References: <20260824142800.3497263-1-hanzhijian1991@gmail.com>
Subject: Re: [PATCH v2] clk: mstar: msc313-mpll: fix off-by-one in clock
 array allocation
Message-Id: <178836054100.2017040.16035095251394555993.b4-ty@b4>
Date: Wed, 02 Sep 2026 10:49:01 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=332; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=idLPkDsA8mhI1Ih+j5hSWIEMKho7R3PzR+kQbEfB5mg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmmKdNeOt2NXwvq8a0uXzTGK91flEzf1zEn9/tJ7lxd
 uxx2eagjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaS94jhn36ndiwDS89kU/kU
 4xW5Rw2qK/X+qds+mnL19/FU5s3S6xgZGm8m+nMnrD7x/5+EmK2SqqDHZFsBaaMLxtKucwwemrY
 xAQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IlJUjtGfC-qYF2g-35RsvERO1X4WNjlB6o8UkPPkS58_1788360558
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_074922_157851_5CAD5690 
X-CRM114-Status: UNSURE (   6.90  )
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


On Mon, 24 Aug 2026 22:28:00 +0800, hanzhijian wrote:
> clk: mstar: msc313-mpll: fix off-by-one in clock array allocation

Applied, thanks!

[1/1] clk: mstar: msc313-mpll: fix off-by-one in clock array allocation
      commit: 712b75152c00a8ab0c56dbfe34caf88e3870ddde

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


