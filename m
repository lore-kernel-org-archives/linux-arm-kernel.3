Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E76C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faoj1Myu+9icVQdUpGQqIdpGYG/tK6O2kdZEgu4Y+4w=; b=rrHp2oeqxYOTgUXuMpY0IJu8wW
	T7LpRjHq+ORCgd9A4prUPEyulYNpqzbirtgXewLThk4AXL/I3jSAg2myq0X/HBoCj5OOH2lE6s4s5
	loTFXpYC43TLXzbOI9vJa8MShh26hLb8tDwQDJqXAOqJBQnCDOEaAfMPGoTe1Se0P3JfOTDLTy/7V
	Nat/3yI3CrcVEtXxsaBmJt+sjjaE3YJFvAApw6mZBbMhiz5lXTEcs29iqq2Q2sz9Srw2HCMB5Hc7o
	aFOHPA4gTygEOQ18Jb6sSpkfHjPBVYvqNpz8oQFHpyLeN+f1M2R7GROFkWW9bjg4aJz1O8UT+G7zu
	WQy18zkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pER-0000000C2wc-2WtD;
	Thu, 24 Sep 2026 19:35:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pEO-0000000C2vu-0dNe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790278541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=faoj1Myu+9icVQdUpGQqIdpGYG/tK6O2kdZEgu4Y+4w=;
	b=GyxDHMEw9Ice88SdB3avp+QzveJ3pGOAyczCrL8fZYS1/Dq97t5ivMapi+8TW3nZRq6VyW
	5FNLy9PT+NNFpH2cTpWvUYxvaSYgpbBfzMIVjCF6cb7AsQIJxMd5W2fXLSvPAO7jJFj13X
	6/DHU7iyl5eSj33XW/vXNRP2Ik+cPpI=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-hT2rXqXsPNq7hFoN88O6qw-1; Thu, 24 Sep 2026 15:35:39 -0400
X-MC-Unique: hT2rXqXsPNq7hFoN88O6qw-1
X-Mimecast-MFC-AGG-ID: hT2rXqXsPNq7hFoN88O6qw_1790278539
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-893d2c627b4so3094067b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 12:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278539; x=1790883339;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faoj1Myu+9icVQdUpGQqIdpGYG/tK6O2kdZEgu4Y+4w=;
        b=YeWJim/gZIMrJVu6Rj7GGTmxgs48CXVWfwgFBil/j/xkBnA0kJGKPqfXnSsxTs98sX
         gVXvpsnBAuKiLfh7bFDvDe6FvfNUkQPNfr7I3SRlSCSEVSAK2u+C1Pz0lS/SvL3fhcdp
         gWGE9TvGfHn0r+vOLArt6gAoqigaJ32S6QZsgElv7fHGAuloQ14uroUUEdKyV2Y/EbIp
         1ucE8CIXVPD9CxIvAlm7Xx0o6wH4LPG1oB0S3mrLEgTHR0/iOu5/EwoILqALT7xd1oQD
         CGROtL00oHSM9e5PkSPl3R7cmSzaz45xTmaN2wjOQmzLD1Y1qU5RduXdamZSxSnlLtiC
         XetA==
X-Forwarded-Encrypted: i=1; AKwUvBx8ICeeFl2QY4YYWa9cjJiVyBrByZABvX6/f2XR3BmE3xw8x3Ey7I81E7fSw1V5U1yX3Az5lMoAeQg/Fb5+kyq5@lists.infradead.org
X-Gm-Message-State: AFuF++mKLf0+fBeqVymf9a7VAaBYJWQw8I8/W/kOHFjKYKzPKShGzsuT
	vhKIxfatSGeFxdUJZ0GbccMlr+/M42KqWMPs8i4s/jEfrxNSwQl0bpLGjgwhO4zFAp6vfqLUtBq
	WcGFbv5K2BDdnvBVD7OqtQyn+sGPlan1p991g0g0uKmsS8CcpnYLrtkvB4R0IhDL4qq9uNbqiFi
	Mi
X-Gm-Gg: AYBFou0pU5fCFMh0utcZArUSzPz8oDQRz52GEapERWsy5xfviOmQF/E9ZJBY48hGNN9
	wXqxzddTdu319dMFMWgbMDeGXdWRxhSfsUTkM6LCR0oIJhsz/tPlmyEkw5TZk/rq7WxxvJhtgZt
	jCDOuCwBuf5aB5vUNC+E+ZqDHB7/+t4xMbF6/zWbH2mTUrwaMJIuVmsFiSxQHVRjpFKM69ucTsK
	OmZ5CQgu9hnoyn8/6NreJYeDDN+SoPf59DtNeIR6k6gIX+HiXBoAmFIC6VADIIXs4+MoFG/8Zdn
	9V4Gyngvvs9OiUkRK12PAGeUDCstl4QmMspk88fD9RcYAkVL7e3ZqvVCB21DPa1w6dQF+GQPVnW
	8K8hqNIg=
X-Received: by 2002:a05:690c:e21a:10b0:89b:689d:3a73 with SMTP id 00721157ae682-8a64968736bmr19121837b3.42.1790278539149;
        Thu, 24 Sep 2026 12:35:39 -0700 (PDT)
X-Received: by 2002:a05:690c:e21a:10b0:89b:689d:3a73 with SMTP id 00721157ae682-8a64968736bmr19121737b3.42.1790278538479;
        Thu, 24 Sep 2026 12:35:38 -0700 (PDT)
Received: from [192.168.134.224] ([2600:382:8501:4f43:e566:7498:c7c8:a7ec])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860fbcb2csm997117b3.25.2026.09.24.12.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:35:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Gregory Clement <gregory.clement@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 linux-hardening@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <AS8P251MB000199E5C86A0447B3FC48EDC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
References: <AS8P251MB000199E5C86A0447B3FC48EDC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] clk: mvebu: ap-cpu-clk: Assign .num before accessing
 .hws
Message-Id: <179027850326.211017.6896107198657392154.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:35:03 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=90S9+JQ9kh2224ZVg9ldJrz1f/1vkihNmKSNrXDf66s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2Vrf4iC9aYqXVz71kbdH+Ov1saU+nCVp74zj/zdWyX
 mEz/UV/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABO5x8HwP+Xe94k/F3Qz7le/
 aWa/fb275ucvfCwNMmdm2e078PxT8TyG//k/v/++Pquid3fu0QMaWlpS1TdcLl8o4LMx/e64uC9
 zATMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1S1n0LsmwFTwZab7vwONpEn5ygQ4SDo6KiQ19CVRapM_1790278539
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_123544_275439_6EF8208C 
X-CRM114-Status: UNSURE (   6.37  )
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


On Sat, 05 Sep 2026 21:48:07 +0100, Aamir Ahmed wrote:
> clk: mvebu: ap-cpu-clk: Assign .num before accessing .hws

Applied, thanks!

[1/1] clk: mvebu: ap-cpu-clk: Assign .num before accessing .hws
      commit: b4243850393f2f24e21b9f4b2c56233e60c904b4

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


