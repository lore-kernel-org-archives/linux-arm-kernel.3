Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C450C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CkCEyDQzgVPhkiN5y/9tLvwKtrY/6iZcsRbiIgpyDQ=; b=dPU5LAo4pw8NBOoenTRYt2O+QB
	ROs56eBSMtiY82SqPPpN4LVOj6PCScKVddmqjS4PxnsmYNlF+pdi7SRJkJ431JHolEaVSwJ9eHGs0
	wuj4T88F/EsDxi0uq17lWVDYZjyq3Lhti4v8Y6/PJV3WLLJ1c8qiPiZ577KIMzQDH8iDQwBfz856E
	vxPynGcRABq+ax4OW+tsFYT6IiFO4WXyLYtjy8p80kvlJ4sSw+Bj8nNGrE8kY355oYzcMquhEo454
	zdvCeKKfRe6XPhAg+oXcapYnx9qrB2mE4dgD7AqvsX1H62o2UqhV0SnmSJbwoJ1mHXzmOrymwhnnQ
	bFfefVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qHZ-0000000C9tZ-3lnl;
	Thu, 24 Sep 2026 20:43:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qHW-0000000C9t3-2Y8f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790282581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CkCEyDQzgVPhkiN5y/9tLvwKtrY/6iZcsRbiIgpyDQ=;
	b=MEeNceBPPZnUpntty9CHv9ydWeB4qdTLG6mLJCMfkMlyc4Bu1NuN/S5Givade6N8nFdWPs
	kOiMxr5zv4AbSyJYoHfJanYXiCDnP2Ljesy1zvhH7qAY9pq/T+Xim1Q5Zp2HGp3mCWkDKm
	j4o8iNpQIfx/3oQSsExhC2veEhEFJxk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-RuNwr60eNCeTFY2x2DHYJQ-1; Thu, 24 Sep 2026 16:43:00 -0400
X-MC-Unique: RuNwr60eNCeTFY2x2DHYJQ-1
X-Mimecast-MFC-AGG-ID: RuNwr60eNCeTFY2x2DHYJQ_1790282579
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so57751685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282579; x=1790887379;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CkCEyDQzgVPhkiN5y/9tLvwKtrY/6iZcsRbiIgpyDQ=;
        b=qKS8/jUMUGdFjlRTeK+JpqY/c0KF1Z6I2ydebusZqYBfFYA6xrT4qSQ0jrt5aTcAps
         RqHT7BvWOzgqsaVfVy3UD5tQfA5YnHz5Sa4kpObf+lr8MmjtMe/KgMHf81y5C+SASKK0
         Ba2Fg752o0UzjkFQccZaSgiftO5vBL9xEn8uDN1JZpt+H1P+fZJsbz/F91VQfuzzKAKJ
         858O+1OhWmfPr5lgNXn0MX1obC3LVvvpqBSmTttEGCcSadJsO0gCv0YGAiliwgTNFj9J
         P7JYn4eB1xdUL42V6oRKLY3JVK/fjsNbdohMEw3pwT8kYR5HJaavtp2wXWbwimyJxoYS
         lNOA==
X-Forwarded-Encrypted: i=1; AKwUvBxqDWpdZGgl0QLcnVZdDmtsxpPnpTWkCAeiEpC9/Awlps/DH0xkq/3qzHneh6ls8F1/1aGOt/sEf5dz/vq7cu9v@lists.infradead.org
X-Gm-Message-State: AFuF++kHPILKcI2QIEv6qs3MvtwKtF5Q1zVHcWAskLiJlTGnWxlL3ghr
	zVJt4IR4C90VWDYDwRYN60ra+eZUqehImemVSICwAytFHFK7KxdtyUVTazZGAQF6nCiHJYS/R5Y
	jUcJ0IeTb1aBPViHHk/3JCVsdvldQLcpWbuGo7RxsOQ+fnZ0ndGJZsfGVAGVDz+5bYSzIft6JAO
	pZ29NJadOk
X-Gm-Gg: AYBFou0RH2FrOVeUB+aJ80vNEUCebYHSm188NZWWs/2M1OOyxKuzfPfb68RaNKvX1TN
	sO6xq+vidQUfxk9UZBVJAAgUSXSdv2MAG6/WMeZmrG6pNd5YUkdJqFGQp/dyk+iTzz1LJyOAYkb
	KZ/nZA88yBurzwnonXvwYUO+wyg3uKJ8ltzNl+JazMisdXL2LHDokQCKo1IosDIS5K+WHilYRBb
	0H03OWIvhsObBSJjoLCOxPrSF39fWl0ZpgCiIQVHwf2Er0mRWghGEaCyuHw92lOxdVvxmFAOw69
	hO/ZUHso9vvjzkINschDqqkHBCpP9GgZa5hNhcwAW4Kucwt11wCBRcQ2G6MLKapBt016b5qLsRh
	r4SIVYdJjBo7ndNkRK+fA/GwqY+S4vzLbOWmxXaUi
X-Received: by 2002:a05:620a:4105:b0:939:707b:ec10 with SMTP id af79cd13be357-93c43dca32amr84393685a.52.1790282579355;
        Thu, 24 Sep 2026 13:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4105:b0:939:707b:ec10 with SMTP id af79cd13be357-93c43dca32amr84389585a.52.1790282578743;
        Thu, 24 Sep 2026 13:42:58 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448f544asm20179885a.18.2026.09.24.13.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:42:58 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 michal.simek@amd.com, shaopeijie@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909131412.3051635-1-shaopeijie@gmail.com>
References: <20260909131412.3051635-1-shaopeijie@gmail.com>
Subject: Re: [PATCH] clk: clocking-wizard: Fix overflow in clockout0
 divisor calculation
Message-Id: <179028254070.218801.10108489974991747895.b4-ty@b4>
Date: Thu, 24 Sep 2026 16:42:20 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=346; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ux0dnfgDZkR6Z8fYUi+Fxf86Gv4PesUYUmg9HR0c0+I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2druWdNeVsjhcTFkw++OthhLWw76nt+mZX7pac/xz/
 BIljQq9jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaiasPI8PbybOUNfYFKXWYf
 jnKcbRRLcS5raNxo9tZ4vaPRg09pXxj+B4r9sLGosJnw+O3LQx6ZQdxfai6cMWVtOrh9k986y0Y
 9bgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d6lBl246SMXaDEt6b-xT6OHKMy63wWCSpkpe6PJLXs0_1790282579
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_134302_727184_44ADD98A 
X-CRM114-Status: UNSURE (   6.04  )
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


On Wed, 09 Sep 2026 21:14:12 +0800, shaopeijie@gmail.com wrote:
> clk: clocking-wizard: Fix overflow in clockout0 divisor calculation

Applied, thanks!

[1/1] clk: clocking-wizard: Fix overflow in clockout0 divisor calculation
      commit: a1d0465f027d341c6855324a5c63e54780ce20f3

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


