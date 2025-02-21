Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425B6C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ew/m0Tesk9Nn8WJobtK7q6jqPTmqqXgIVl6zfztn/w=; b=4vpoSyWGuAMP1rh2hKFYp5YAKC
	8UXX5hVHbnSFioEG6WWreeYR+A30SeGbYVIIoNY1SWDW3WRvxE1vLc7UWYXsL0kaOnDnCsAmCjOdF
	Dv9p9tqrj/UEVlWtSoZFlNlya+lcuZBj8L3qSJgUY3rZHBcZwxsFAIdbwJAexPJS9kpS7iv6/C/wj
	7inOg5+YsWs09y18WQD0YJfJpTsgAZ2lAAj1jrHFlVBw703K3rxurGET92aan8RI250XsFrq4EeUT
	U06r/ePzeqqWkX5u+88LfaKZr0cKyKzO6hi42yuur49/x9NYFj9msCXHdnusn6akgba9wwColdIeO
	vke5I+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQPX-00000005CpZ-0DzC;
	Fri, 21 Feb 2025 10:37:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQCo-00000005AW5-0ubT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 10:24:27 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22113560c57so37391975ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740133465; x=1740738265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ew/m0Tesk9Nn8WJobtK7q6jqPTmqqXgIVl6zfztn/w=;
        b=JPWEFkCulGm/paMQFm3j9wo8n4Rqe4JLtp60R8Ap9HActkiPb/2YAM4YP8VeJWlqPz
         ng2+JjGfp8L5wAIzXtHpqSLlMDMFlkLjK277BXuUsgghVHQfKjhTwXZRVhEH+SHInuyQ
         cqV04XLFvP79Yiw32FXq5X0xhhfK8L48Pa74efwaxZLSwKlbI0ScBFWAPX2TOK8gicwp
         kyvtfkVrGoG7uf4ssCdabFQ1o9IPDYRHNI6tYucknI2ORxTLg3ibC2ly2UiJLN4L8F/u
         /golxv9h4Y7KjOhYB60v7ln/SH8i31GL0FkaRM53zyGhoR02UhjzKr6MMaOlXW9pgjC4
         MEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740133465; x=1740738265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ew/m0Tesk9Nn8WJobtK7q6jqPTmqqXgIVl6zfztn/w=;
        b=VmVXxIPTUMeZ5OwXvDvGrsLVxC3IZ7Si7FU++uBDFWz3AxWVR1a9O15no+4yJnqdwy
         dniZ2Mc8sNuMUOsqI8gfIWvrue8/w0YkjZ/x6ENTCxMHjZPhO0NvX/1aqywKPl8MRtp2
         Pv8n2gLQRxZx3D0SBoYAUn3aNOcfTokUSNgwPskJ0e83mgQkS52Tub0YQwI3ORXCiQa+
         TRDONw5TWzFgW99tViWgIVe/iTvdt9ndU4fHqJVmg9WV8Mh5CRDQ7WASNNFwaP/j7fVX
         QxeGPEUTA5D7/Tp55CAL9UWmklS7s44/AEyg2j/y/rD/Ktpqqd2iJeIrJuncx5ZDVnkd
         Kd+A==
X-Forwarded-Encrypted: i=1; AJvYcCVotbxMVBWwyHw4eQS6uAeWIcofgf6G7jTzvNgbKl28Jt+cPnLT+AruM6xqkyqGCsQ5TB9LYFL3dG1syfy+Fh7H@lists.infradead.org
X-Gm-Message-State: AOJu0YyU8w6tpFDOBHfDlCliz9ZrqLXdMZf6pYHnFMd2fvbdZ5oGOU6C
	yIpoMV19G4rdzRF0Td4m61nbyYgJ5TC9auh8s115GnbNpcp3yABV
X-Gm-Gg: ASbGnctVTHRl7DpXSbjuTPG4bbPUR6J5VJ5WPD+YjxGBYv9dnMFdONptO2X8SbF8+dY
	Gx+RvWR4KBe56LU9kyxsNEbjA0wKyK8KmTS/RgZAFCZYq3MqZBYmBygAZOM05kTkH498Wjd5nWk
	1QzkM2FPySc3LJ8Z3hekcQT4a0YGDzL91skeMHXVIvutfy1VVkoXOyccxtiEbGDFFCkwbD8gmO9
	9/bkE6kSmrasCzqa/fHZt9zGP3J5VaJ0C/PFFlPRUdfkkIaNYhc+H4g43TZB5EXhQPqd3saXhWE
	HHIEKBwSmbbJpRtPDzUN62k=
X-Google-Smtp-Source: AGHT+IGJZmPsP1AQp35fmvwVzaW4gHUPKNfzSI/RTvC+piEPapIcYtvOiFrJzWkqFVimOfGDgcDxpA==
X-Received: by 2002:a05:6a21:7888:b0:1ee:e669:ef88 with SMTP id adf61e73a8af0-1eef52da075mr4126395637.16.1740133465235;
        Fri, 21 Feb 2025 02:24:25 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73250dd701bsm13961074b3a.131.2025.02.21.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 02:24:24 -0800 (PST)
Date: Fri, 21 Feb 2025 18:24:09 +0800
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Simon Horman <horms@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Russell King
 <rmk+kernel@armlinux.org.uk>, Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, Suraj Jaiswal
 <quic_jsuraj@quicinc.com>, Kory Maincent <kory.maincent@bootlin.com>, Gal
 Pressman <gal@nvidia.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Andrew
 Halaney <ahalaney@redhat.com>, Choong Yong Liang
 <yong.liang.choong@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Vinicius Costa Gomes
 <vinicius.gomes@intel.com>, intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH iwl-next v5 1/9] net: ethtool: mm: extract stmmac
 verification logic into common library
Message-ID: <20250221182409.00006fd1@gmail.com>
In-Reply-To: <20250221095651.npjpkoy2y6nehusy@skbuf>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
	<20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
	<20250221174249.000000cc@gmail.com>
	<20250221095651.npjpkoy2y6nehusy@skbuf>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_022426_269565_0CA0A91F 
X-CRM114-Status: GOOD (  18.96  )
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

On Fri, 21 Feb 2025 11:56:51 +0200, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:

> On Fri, Feb 21, 2025 at 05:42:49PM +0800, Furong Xu wrote:
> > > +void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
> > > +{
> > > +	unsigned long flags;
> > > +
> > > +	ethtool_mmsv_stop(mmsv);
> > > +
> > > +	spin_lock_irqsave(&mmsv->lock, flags);
> > > +
> > > +	if (up && mmsv->pmac_enabled) {
> > > +		/* VERIFY process requires pMAC enabled when NIC comes up */
> > > +		ethtool_mmsv_configure_pmac(mmsv, true);
> > > +
> > > +		/* New link => maybe new partner => new verification process */
> > > +		ethtool_mmsv_apply(mmsv);
> > > +	} else {
> > > +		mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;  
> > 
> > Tested this patch on my side, everything works well, but the verify-status
> > is a little weird:
> > 
> > # kernel booted, check initial states:
> > ethtool --include-statistics --json --show-mm eth1
> > [ {
> >         "ifname": "eth1",
> >         "pmac-enabled": false,
> >         "tx-enabled": false,
> >         "tx-active": false,
> >         "tx-min-frag-size": 60,
> >         "rx-min-frag-size": 60,
> >         "verify-enabled": false,
> >         "verify-time": 128,
> >         "max-verify-time": 128,
> >         "verify-status": "INITIAL",
> >         "statistics": {
> >             "MACMergeFrameAssErrorCount": 0,
> >             "MACMergeFrameSmdErrorCount": 0,
> >             "MACMergeFrameAssOkCount": 0,
> >             "MACMergeFragCountRx": 0,
> >             "MACMergeFragCountTx": 0,
> >             "MACMergeHoldCount": 0
> >         }
> >     } ]
> > 
> > # Enable pMAC by: ethtool --set-mm eth1 pmac-enabled on
> > ethtool --include-statistics --json --show-mm eth1
> > [ {
> >         "ifname": "eth1",
> >         "pmac-enabled": true,
> >         "tx-enabled": false,
> >         "tx-active": false,
> >         "tx-min-frag-size": 60,
> >         "rx-min-frag-size": 60,
> >         "verify-enabled": false,
> >         "verify-time": 128,
> >         "max-verify-time": 128,
> >         "verify-status": "DISABLED",
> >         "statistics": {
> >             "MACMergeFrameAssErrorCount": 0,
> >             "MACMergeFrameSmdErrorCount": 0,
> >             "MACMergeFrameAssOkCount": 0,
> >             "MACMergeFragCountRx": 0,
> >             "MACMergeFragCountTx": 0,
> >             "MACMergeHoldCount": 0
> >         }
> >     } ]
> > 
> > # Disable pMAC by: ethtool --set-mm eth1 pmac-enabled off
> > ethtool --include-statistics --json --show-mm eth1
> > [ {
> >         "ifname": "eth1",
> >         "pmac-enabled": true,
> >         "tx-enabled": false,
> >         "tx-active": false,
> >         "tx-min-frag-size": 60,
> >         "rx-min-frag-size": 60,
> >         "verify-enabled": false,
> >         "verify-time": 128,
> >         "max-verify-time": 128,
> >         "verify-status": "DISABLED",
> >         "statistics": {
> >             "MACMergeFrameAssErrorCount": 0,
> >             "MACMergeFrameSmdErrorCount": 0,
> >             "MACMergeFrameAssOkCount": 0,
> >             "MACMergeFragCountRx": 0,
> >             "MACMergeFragCountTx": 0,
> >             "MACMergeHoldCount": 0
> >         }
> >     } ]
> > 
> > verify-status always normal on other cases.  
> 
> Thanks for testing and for reporting this inconsistency.
> 
> > @Vladimir, maybe we shouldn't update mmsv->status in ethtool_mmsv_link_state_handle()?
> > Or, update mmsv->status like below:
> > mmsv->status = mmsv->pmac_enabled ?
> > 		ETHTOOL_MM_VERIFY_STATUS_INITIAL :
> > 		ETHTOOL_MM_VERIFY_STATUS_DISABLED;  
> 
> You mean mmsv->status = mmsv->verify_enabled ? ETHTOOL_MM_VERIFY_STATUS_INITIAL :
>                         ~~~~~~~~~~~~~~~~~~~~   ETHTOOL_MM_VERIFY_STATUS_DISABLED?

Your fix is better when link is up/down, so I vote verify_enabled.

