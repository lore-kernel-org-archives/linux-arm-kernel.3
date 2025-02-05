Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D285EC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSjdJz/xDA8mb42ayTcwdNMNuepVYnt3TrZB/pvMUoI=; b=HVkbyqSMqpXTQTHfLSSoitsaiF
	XS/UlPGmNj3lE75BlDCXM7fMwNrmNP5sZHi/4/9SxBGP5l0o3fzZEhSPy6aozuGyTPGOkolwfPx77
	wEp0ShOKReKRBUe92zU1jqUXMSUqtJuwrGnig8FyCxHVKf7OLj9RCJRUrPHuFr8wvkBnExPeiQHsw
	Zr7RsPBZmTfjvOqHsuLa/wqhxQ3uYXft0sz4mVlUoO+xXZt8fVfTlJXyjJ+x9MBKK0s+dq1Piz+Lf
	K1YyEJVQ9/k0x688qAYG57PLKSDGebuiqYIZyV32BIJ1IkOpfzmPg7Pf226s3bveDJ7tGKA/9QRKP
	aKTTeidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdB0-00000002zgx-2bcC;
	Wed, 05 Feb 2025 11:02:38 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfd8w-00000002z7x-2O53
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 11:00:31 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ab6fb2940d4so136210866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 03:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738753228; x=1739358028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSjdJz/xDA8mb42ayTcwdNMNuepVYnt3TrZB/pvMUoI=;
        b=U+QKo7tAmepxqHrAkr12ihm6fLpPnv18vDq7reXchYgR/6/aTTJr4XHPP2i2VBG30+
         lWj71+0jBDTr1uO5bSOM2kDEP72fVY1CotvH/DmgTm3nAKLPIrjhIqbb3aD5SuWBmSdS
         SgLkdFmoIDv75Jt/67G4TFCKISRd7pDqGc7fmkZ6/E/nE4ol72M89ECmS1XJuPKhyorK
         L/bEM+LoNyuB2UiaJSrcFmIvROU2Wm0hwx9NA4o+Gcm6FzdS2Kqt2hl9d9MOeQtgGdkb
         ou5+h/WANiKUoa/7IY8KCaFAikdcb8jkeXhwSrD+A1BH3CsgNp7prp5HUfQYqH9HCRG5
         ZkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738753228; x=1739358028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSjdJz/xDA8mb42ayTcwdNMNuepVYnt3TrZB/pvMUoI=;
        b=GhAcwMRLsGPeXzq2eft5ra03EaghKicTcfyw69ZXziAZcOgKM/2hqc1YlVG5yWsnoy
         wUqr/LDJoi+n59Qw5bk2ZNrJNrls6IS3SRzLZkhDU1dIqy6kC56SMDhDApUc5DqbD7z3
         I02TbsaHgd547mF9o343CYiuqAgohZNr2URYCHyGzG1uRQWcHz9d2iIMJuPpMR27N1ri
         825OFl1Vip8XR+KZsIUWbxNV932mniOPwFWSZ3zPElI5eQrPAgTZvJtPvKjdbhRGgALd
         MrZz6jHI8s3Q8OZZWqKMVsJwr4eOjV58a4IkwMdLbPqVwyQqZZKSiy5KZa8fqEkJcpOq
         fdng==
X-Forwarded-Encrypted: i=1; AJvYcCX/BICcn2vYffFLKZsDTmqWImmqxsdHOgRnE/p+gYDxxRvbgOlQ18ULR0BWiFUTe0/hBjN8IV29cjifqOFcmi3N@lists.infradead.org
X-Gm-Message-State: AOJu0YytcNo49O0zZGvASZBN1bgbenK3sGkzvXsliZtRZ0ZZ/yTDCR2B
	S/I3Ic6NxPFWkbmFTGxGGElABLtWY4wWXWEVKE6fIlMLdEXlsD7/
X-Gm-Gg: ASbGncsPp02LvXQFThFybIKJ9I8zPgrc1/OR4dTWwc9aKP7rdQA5ntbgcdAvL7SNHHq
	p62b0chjc9jUdAdrA7e7ObMU1ts8+iE29vvt71Kd7ViML3JhLBTCBBEyspyaQQLUCKNI7bvkFo9
	5KOCcrH/A5uSmOd0f6Sw26SV04hkLnsNls4ghsIvATu+8iPJzG17wIE4VupKlUZyR8+F8KAm06S
	nFVnifCC3G+FQEzU2wAauZuMnzWVJ12NbkrZZMSL3dM9p8vCdXJXVMSgA+SNqF/
X-Google-Smtp-Source: AGHT+IEVVg0kE39/wjtj8sTo6fT9WkDtB7UWVHKKZ58CONt1w8Vq3ELLHVci1DsLegASlf42WxQH4w==
X-Received: by 2002:a17:907:d90:b0:ab2:f255:59f5 with SMTP id a640c23a62f3a-ab75d2a9fe2mr249002866b.16.1738753227771;
        Wed, 05 Feb 2025 03:00:27 -0800 (PST)
Received: from m4.lan ([2a0b:f4c2:3::65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a818csm1077061666b.6.2025.02.05.03.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 03:00:27 -0800 (PST)
Received: from cavok by m4.lan with local (Exim 4.96)
	(envelope-from <cavok@localhost>)
	id 1tfd8q-0000bq-17;
	Wed, 05 Feb 2025 12:00:24 +0100
Date: Wed, 5 Feb 2025 12:00:24 +0100
From: Domenico Andreoli <domenico.andreoli@linux.com>
To: Jason Montleon <jason@montleon.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
	"si.yanteng@linux.dev" <si.yanteng@linux.dev>,
	"pabeni@redhat.com" <pabeni@redhat.com>
Subject: Re: [REGRESSION,6.14.0-rc1]: rk_gmac-dwmac: no ethernet device shows
 up (NanoPi M4)
Message-ID: <Z6NEyCRHTVfnM1vf@localhost>
References: <Z6CfoZtq7CBgc393@localhost>
 <INKEBRCGF47MsjO5WHpLcf1OTcQHw2KG6_Ez-K9QiTwAnb4MRVErnxoUT1euX_o9oRrxUILDRDvlOZ7ezguCU4maUyvkk-UqU52l6xLsF8U=@montleon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <INKEBRCGF47MsjO5WHpLcf1OTcQHw2KG6_Ez-K9QiTwAnb4MRVErnxoUT1euX_o9oRrxUILDRDvlOZ7ezguCU4maUyvkk-UqU52l6xLsF8U=@montleon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_030030_607577_BD097186 
X-CRM114-Status: GOOD (  23.57  )
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

On Wed, Feb 05, 2025 at 04:19:58AM +0000, Jason Montleon wrote:
> On Monday, February 3rd, 2025 at 5:51 AM, Domenico Andreoli <domenico.andreoli@linux.com> wrote:
> > Hi,
> >
> > This morning I tried 6.14.0-rc1 on my NanoPi M4, the ethernet does not
> > show up.
> 
> I am experiencing similar behavior on the Lichee Pi 4A with thead-dwmac. It works fine on 6.12.12 and 6.13.1, but with 6.14-rc1 I don't see these last several lines of output as in your case. I did also see the same new error:
> +stmmaceth ffe7070000.ethernet: Can't specify Rx FIFO size
> 
> It looks like this message was introduced in the following commit and if I build with it reverted my ethernet interfaces work again.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/ethernet/stmicro?h=v6.14-rc1&id=8865d22656b442b8d0fb019e6acb2292b99a9c3c

Confirmed, reverting it resurrects the ethernet also for me.

Thanks!
dom

> 
> Thanks,
> Jason
> 
> > This is the diff of the output of `dmesg | grep rk_gmac-dwmac` on 6.13.0
> > and 6.14.0-rc1:
> >
> > --- m4.ok.log 2025-02-03 11:37:03.991757775 +0100
> > +++ m4.nok.log 2025-02-03 11:37:17.249455484 +0100
> > @@ -15,4 +15,13 @@
> > rk_gmac-dwmac fe300000.ethernet: COE Type 2
> > rk_gmac-dwmac fe300000.ethernet: TX Checksum insertion supported
> > rk_gmac-dwmac fe300000.ethernet: Wake-Up On Lan supported
> > -rk_gmac-dwmac fe300000.ethernet: Normal descriptors
> > -rk_gmac-dwmac fe300000.ethernet: Ring mode enabled
> > -rk_gmac-dwmac fe300000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> > -rk_gmac-dwmac fe300000.ethernet end0: renamed from eth0
> > -rk_gmac-dwmac fe300000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > -rk_gmac-dwmac fe300000.ethernet end0: PHY [stmmac-0:01] driver [Generic PHY] (irq=POLL)
> > -rk_gmac-dwmac fe300000.ethernet end0: No Safety Features support found
> > -rk_gmac-dwmac fe300000.ethernet end0: PTP not supported by HW
> > -rk_gmac-dwmac fe300000.ethernet end0: configuring for phy/rgmii link mode
> > -rk_gmac-dwmac fe300000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
> > +rk_gmac-dwmac fe300000.ethernet: Can't specify Rx FIFO size
> >
> > The configration was updated with `make olddefconfig`, as usual. I
> > could not find any new option that I might need to enable, if that is
> > what went wrong.

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05

