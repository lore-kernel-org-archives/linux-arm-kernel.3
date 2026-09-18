Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D75C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p32LQHLzzMSNCQDrCQVRbQJDsxmVl9uccGFGyZXBagg=; b=uDWVNeLv7su1GOLW94YOTwmoz2
	ZQ9GMinz3a+HfMLxjSgiKDsWdkRovP28tTVXuZ9TXx1u9GeTC/gCrn8ahLTt1iS58i4sS2+3mPq/i
	fG9Y3RbggfrnI9ZFo4jacPadiJcyNygbjoGiIj1YGt2LCmpH8iqi+QXcLiY/R6wjAnMyYsi7pi7mN
	gDx8TOmcm8kFx/OlbLARQimQmfhlYHq5BADpastl94m1c5M26T3sVyguoUYFW8D1+M/E7NObJuqju
	E5xBNYpmtJjxLlD02TWCUy9cpedTzLvA8+ljmSdN5402hhVqz+KD6Cz53B3iOsAJVFKWk9h+Pq7Hv
	0lD211hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7h5K-0000000Fd1F-1OpX;
	Fri, 18 Sep 2026 22:29:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7h5I-0000000Fd0v-0MR3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p32LQHLzzMSNCQDrCQVRbQJDsxmVl9uccGFGyZXBagg=;
	b=MDB0HSA8Stfm3Ttqx4kS5NY3piXwYrxs6KKc+R3yViaNyR2kjT1tDVHUuEBXoZ2b4lOVX/
	93AF8LO4NIwAMsbrISYzbSX082YJY7yX/IDhTEk72iflu8Z92qBwI76tgx2osnOQVjW5Xd
	7c9pPEXGCYgdAokfl24bUtwEY3mkCDo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-Aqr8s6DKPuSh8GRAglEbMg-1; Fri, 18 Sep 2026 18:29:29 -0400
X-MC-Unique: Aqr8s6DKPuSh8GRAglEbMg-1
X-Mimecast-MFC-AGG-ID: Aqr8s6DKPuSh8GRAglEbMg_1789770569
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53122a93eecso26959651cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770569; x=1790375369;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p32LQHLzzMSNCQDrCQVRbQJDsxmVl9uccGFGyZXBagg=;
        b=I0xu/gVyDHePb3588RZIsE1CLKdRweMVdcT3FK/KkiDFqfPJf6Rb8QJ+dqbetKpYaE
         3bqHEQ8gA4NoqMrplfm0nMT7sTlksSE1Y9cMyLNt6rGjuvCviqBtl8PNMyIS1KzmV2gM
         3acuPdZk8H7++/1a/1J1Cn8cyQXQbm+NaEFqxUYyxetcTQiw/DuWmWd3a2FKB6IGeGPy
         un5uXqHxxw5TSbZ1nVX6e4f4l87L33VXxRhMb8YRdylh2cjz0DbgMWgZ3yipO+2UUkKa
         KGW4OPB39QQMNmiZ6QP/3Djkbi8aoKelfqYbs/HjestKJnTZ5QT+RRVipbYRYwULs+Gu
         F3hw==
X-Forwarded-Encrypted: i=1; AKwUvBxYJpYMzqr9LjIxJCMLtVhztz8gJ6W25o6hvevCxlFMIMMMcKiggYuUC1VFX82LZhsu+la7MmbY6BCSGgVDIVKd@lists.infradead.org
X-Gm-Message-State: AFuF++nBwX6Om5g0BwcgGODxnFyL1IMqMXwUFfQZ3l8LK4wyTEnQLGwk
	oTLXUK956ZclHKi1LqfrDJPfclhUKJK5shJtDGgt2waw8jdhBcQqh4UBl9YwOYlJMYd8J65DHnu
	jcmWswG13HAcuhCnq6ooVXZtNDcUn6YzoUe4Wv1nVBqLHXiN6zMW14OIp1+ZASKsRyYqlJvJZW1
	Mc
X-Gm-Gg: AYBFou02DvOzBHzZ/FL6oC78V53/3ywBXtt3FuQ8pMOvPZ8iPWFDu2/YWrXr8F4mBwn
	qsxSduWsoNU5ZkPAxY1KEdhmd6ReGkpPBwJjaj2F9zgBxjD2phOFnX21EAUy2DLpp9KWrGflofe
	uVMLEYpsx1UgAgBsshd8sZUkpz/ntaqVoP3tDK+caNZ2+/2xCdvqbtExndW0Zh6RT7eQycTHEGE
	6+g4lg+i5pwaroYmf5vp6iQyFt2EJiR3nUE4UW2z5YEMawrs0L5btwl54sn2pceio5wGGRBk3rk
	+nZOW+hSHe9/4yH7gQiJZe/6gUsEEGMrsT1rMRneoEEn2Ikr4vy7RUdyocNoFdffaIxyOnme5w7
	9rA==
X-Received: by 2002:a05:622a:1115:b0:531:1e4a:8eea with SMTP id d75a77b69052e-5328d0015d9mr129233901cf.32.1789770569013;
        Fri, 18 Sep 2026 15:29:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1115:b0:531:1e4a:8eea with SMTP id d75a77b69052e-5328d0015d9mr129233621cf.32.1789770568655;
        Fri, 18 Sep 2026 15:29:28 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae758a61sm7260371cf.26.2026.09.18.15.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:29:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linusw@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, stable@vger.kernel.org
In-Reply-To: <20260915070103.1733176-1-vulab@iscas.ac.cn>
References: <20260915070103.1733176-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] clk: versatile: clk-icst: Fix node reference leak in
 of_syscon_icst_setup()
Message-Id: <178977052357.517928.2775331133276610419.b4-ty@b4>
Date: Fri, 18 Sep 2026 18:28:43 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=354; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=C+KFUpRy04Zo8PlhMyOdpcWavq81OHmCgPld83aOHow=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLW7na5kVq75sCanhIhw7Zm1+124rpM7lUH3BpVzy1c5
 HziXGV5RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOx/cPwV0rousCtVRntK5yW
 Ty8slf/jddblmuDt7MiJ7kyz/zOuk2P4X6H1c6ea39vL0XltLBNCmUP3SSqX8tmKqZbd+60afJe
 NGQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vMwV7P1tjG3JiDU2-hzdEd2bXvxaIzSHb9spDrrudcU_1789770569
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_152932_199047_0829D497 
X-CRM114-Status: UNSURE (   6.63  )
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


On Tue, 15 Sep 2026 07:01:03 +0000, Wentao Liang wrote:
> clk: versatile: clk-icst: Fix node reference leak in of_syscon_icst_setup()

Applied, thanks!

[1/1] clk: versatile: clk-icst: Fix node reference leak in of_syscon_icst_setup()
      commit: c90a50d07f0c38c62ce13a60806ab5e3b841f70f

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


