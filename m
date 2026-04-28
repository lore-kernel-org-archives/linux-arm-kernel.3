Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BECCFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 01:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:To:
	From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PMSr9SUypRFje2+As/Y2378jivS1IQ2hBaeRfXknxc=; b=1apx0/1ScQ+0ssCxaveax+eLzg
	YE/1K8LI8wKflcPuR8rqPVYkH1W78NOWltIfK/YHpvy0YjshSsbzr8LdB0Nw56siB3/mEJ+2G/r7u
	wr9V2KYAq3lXK1QINSKdf1cFnbXrsHy3ybWG7/7WT/Dd7OoyirX8/42tvE+EFfHv3IZ2sb+cECz2a
	arWUwxDE98QWQ1a+iSsKHQNx/074ePM8MNaQ76PT+nrCrfB2w0BdB1tKV3yq9t4C7uCZ+OQwawCbS
	CXw0jO7c5OpZkEOkrEVqTiIMQGWLBiN3urfwI3v5PqeJJkGZhBOxbcjfQSsvUkLYqRMp6MJidt2p7
	PYJmJIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXJH-00000000OEt-0zKZ;
	Tue, 28 Apr 2026 01:32:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXJE-00000000ODq-13Jc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 01:32:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b941cd869cso16144425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 18:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orb-net.20251104.gappssmtp.com; s=20251104; t=1777339939; x=1777944739; darn=lists.infradead.org;
        h=references:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PMSr9SUypRFje2+As/Y2378jivS1IQ2hBaeRfXknxc=;
        b=OVqdSwwJRlIfGG8I17QVvMPlK06vPqpppLmqEoy00G/HDQQOASwAWqHcJKITNF7FR/
         SsGlsSX1BUAp4Z/TfSBX+a42dCotrw4GNMRFFY7MZTlNC7HQ5JQaQgupLmGOYm6km6wJ
         Ka2jxaoLUPDzOfcc/aVUshCAMWr/MLrPHfs5alp7RWzf9anmbauI6aAKwCg0vOMV4ThI
         dfGLF1jLVR73O7vAGzqe8hXZ0I6uQgkQ2rqlyGHB7al6+ER2ys9WEE9+w/lKNmKWYbGL
         BLZQZgkBLx5EVVBKDzn2QhIkDFCqqoO7lWYH2j+Z28t1dU680VsNqy2VayyLabib8dCi
         xc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777339939; x=1777944739;
        h=references:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PMSr9SUypRFje2+As/Y2378jivS1IQ2hBaeRfXknxc=;
        b=jM8GIu7uAoJOQ7xpyzWU+us24fHCIhMKjKu4aa6iHCJPLgAL3q9YYW1L0m5lrl7SLi
         ekmtSgEF5NbzrETGN01S+QYsorSSKXzg4ahbp+kO9/OOCsus60kNZ1YByy+mhE2T7lv+
         jr/sh6LbIpy5TYpAabeB4KrqeyytYoTdhRiHo8urqRjmjejor0qeiN3nNrWUNJh7jO9R
         Mjy/a5N0Lh2qy17FPtPpZuVYIxX43f0UhMuhNtqGwFuE1/3T/eEsZNLoaLqiVxwP7PHG
         EERZN8QmJpBjLBXyl3WSt0r8wfrlXIylMvKGvntawMlxhL645UOpeRXXfiapJIsOBKAG
         PNyw==
X-Forwarded-Encrypted: i=1; AFNElJ9Zz/fXNKnHsESJuIkN8/VYlneagJ8lBCgFvUHCaYBRTr/A/BuEXnaOu7h5LxgBeGA6golcj3+TxQA4dviLBQlX@lists.infradead.org
X-Gm-Message-State: AOJu0YwVlvVn5F3ikGSKEZnfa+8/y5xCSj449GCplX4nuh+kwriTjc1B
	xzK6dXgsgZXUCkTpTvMxbZj3r2c2UwWxMRJRiz+UZ80Wmv049otg0DUZoUKwVh8ix4w=
X-Gm-Gg: AeBDietzPw1fFVTOBF5etSsRPML0ewQL0CcEsnVGoqozOvyVANP50GaQC2MYhw/6o1C
	18EJuFVOvqAa/sB1beFyDilxhSRWhwDnT1lyhFsbC0k8zrJOtNPiQxGNOUUHclMXBRNsSh4sLRM
	0Ndyr/qSr4NG2WMGWKEbd9G4+Vm6I+NbTMRtZgNj7XdhTJi43ouL5hcRtGuOJi5hBLIvaFjSVSm
	N3et3Csbtc/R6HXuM0rjrN52Jvc+OIyHmbYZI1M0r6ZFONc+nI5KbF8GWluNb0oISQCsn8WmoxG
	+N1RYTzIFf6YvO1TwVtSud8vL87DtBja14RVvoqUEHrcYCz8FKV1SXuXE+jZ3+StmaqDdS+H8gp
	QBGf85mGD5+VRWv1erAKesG2v/sSJdve6Qava5pYGp9yaoj4046VARt5K8xvdvRepvr5NENWUpi
	TLVDd0EQ8QlNeAD5JcBs9/4p27+hUvM5iZojl8NvNP/KBBb2MxxxSjMnpT8bi3V9MLrOK1SwJCj
	b1ejiitLsw=
X-Received: by 2002:a17:903:1cd:b0:2b7:a89d:6135 with SMTP id d9443c01a7336-2b97c3fab8amr9326525ad.13.1777339938955;
        Mon, 27 Apr 2026 18:32:18 -0700 (PDT)
Received: from claude-dev ([50.125.94.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac78880sm7441665ad.40.2026.04.27.18.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 18:32:18 -0700 (PDT)
Date: Tue, 28 Apr 2026 01:32:17 +0000
From: Daniel Bozeman <daniel@orb.net>
To: shawn.lin@rock-chips.com, finley.xiao@rock-chips.com, jonas@kwiboo.se,
	ulf.hansson@linaro.org, heiko@sntech.de, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pmdomain/rockchip: skip QoS operations for idle-only
 domains
Message-ID: <afAOIfNcy73GC7lU@claude-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adRH235mv00OdOsb@claude-dev>
References: <20260331180223.1682283-1-daniel@orb.net>
 <5c8732a3-6cc9-5d02-f56b-fc7ba29c7ce0@rock-chips.com>
 <fbf16b5a-1565-39c9-0d92-33a7a577212f@rock-chips.com>
 <f1b9a97a-f1f9-0757-5dc7-33960318be61@rock-chips.com>
 <693c6c27-6ff2-4ab0-994f-3821e5ffcec8@kwiboo.se>
 <adRH235mv00OdOsb@claude-dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_183220_666628_21013F40 
X-CRM114-Status: UNSURE (   8.41  )
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

Hi Jonas,

Just following up — I have the NanoPi Zero2 on my bench and am
happy to run any tests if that would be helpful.

I can confirm the EPROBE_DEFER teardown crash is still
reproducible on your next-20260403-rk3528 branch (7.0-rc6)
with your conditional NO_STAY_ON fix applied. If you'd like
me to test a different approach or gather additional debug
output, just let me know.

Thanks,
Daniel

