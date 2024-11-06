Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EDFD59F41
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+lke+kSJ/sHNhBrjG2QR3DbhnvDmE7dM4quD4X0oVI=; b=4kgNGmj8irPODC0PDMDm6EPrnq
	NTgfqZqFwTlcmHrrFnoihg1qtXNqCJJ0x1bFOLcSyA1DWFHlw5vEAeGoihA5SeagYyDw5Eanauwzn
	LZyMxqA/gjWyl7Bhg+5gz3fmllNcosLHcX9JSvsjjIgmvMkHwi6H6lnHSGYTL3+5jucCn1GXtSc1w
	nJgeEhjAJfa7aiN6M5UwDyUUffMM2l2gJ9/6GtDwTdEmewKNWq6riOnytEZ7nPEcN8EHrKPhyFP2P
	lCfeYkqL+cK7KOKaim/AzC91E5Wa7kJedZeo0JqoVHcdY7RxL50CMNfNEkFaos6ZRDxObr9Sy2dmb
	UGcwT/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iAI-00000003rUh-3qGa;
	Wed, 06 Nov 2024 15:41:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8i8X-00000003r8q-1Agk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:40:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso59367745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 07:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1730907599; x=1731512399; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T+lke+kSJ/sHNhBrjG2QR3DbhnvDmE7dM4quD4X0oVI=;
        b=CWhzIdLnQlYRhgzBJetxysFemC2hCemunzCR7yjl+XEXd5uQQzS7GiWhWHzjiV/CUd
         h9PgwCodxqGr2o+2XCpIsvDKTu3UMFS7aW3U0oY3M7Fwbz3bGGqSFVDG7LW4++kMj9Er
         tnQjBkOCohyRejw+SHdhiroyccq15C9HfOEt++QN9d0fVRAHhvGwCISt9OetkNInGiqF
         ZJ6WWLTu3vkT5xeYT/Z4lwFH40qZdJtoDjlKjExugbBoM1CBKU2LfB9X1Hx4KvSusWqr
         ki9wJuN4mUTaewNJDo8Qjr2iT14LRJ0Uti7lkC1jq2pftW8K6Jq1gdxXjfe/el0rFmCh
         yZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730907599; x=1731512399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+lke+kSJ/sHNhBrjG2QR3DbhnvDmE7dM4quD4X0oVI=;
        b=ww7YjMfYpEzOU7Ajw83UMU82WHxIAf+pnPDSxZz7+5NGGLPiXj298uJC7MImSFM4I/
         9zvDo3ht9E/L+pKWn6Art4b9IVB3s3Vgv4VwMy9OSnfTfUmqI4MesnecS1Mf57LIu53h
         6f57pZHfXgnBecysPj7e4x02INsRL5w27VvyMqej8Ls6SdYf+sD8IGnv6Eyh4tawDsxn
         RlnDvcdcF9Ggid1W+Q1hdJZd4h+ISW/lBahpO74z256o7u8uoclQ9Ojp1KNDGxQ46itr
         pUjXwOomuvziaz+rcrRDZrtJYvJw8tbseoTnmkgkR9ZzoG0ljkXdLf+vn95Vdp76y6fU
         ZcVw==
X-Forwarded-Encrypted: i=1; AJvYcCVJPQUCXAyAIdFEhMX+sSy/Pk2c1xT/AuwxjXJVuJhQLVipZhahGWzBdg8+PIqQyiEMtcrOcgGMTx/HLbUnv7DA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+noFAaICABr0ymmNawqwgeH4i+AKFDLfkdqkyY1bpNqvXWPKS
	wYQoa87s3ffP6x2Q6ohbcF6K7BJ8H3mopDJuk6SApW6ZvQs4BBsEdwU2F2wio3Y=
X-Google-Smtp-Source: AGHT+IHaXpKkIZTp98WaTVKW8arf8yLJ6KlxXz0Ga7zfB6YCb98iODL5Q30kaHjC536zM+O/RrwHzA==
X-Received: by 2002:a05:6000:4711:b0:37c:cc67:8b1f with SMTP id ffacd0b85a97d-381bea0ee17mr17133942f8f.48.1730907598706;
        Wed, 06 Nov 2024 07:39:58 -0800 (PST)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7b32sm19556510f8f.18.2024.11.06.07.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:39:58 -0800 (PST)
Date: Wed, 6 Nov 2024 16:39:55 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: geliang@kernel.org, liuhangbin@gmail.com, w-kwok2@ti.com,
	aleksander.lobakin@intel.com, lukma@denx.de, jan.kiszka@siemens.com,
	diogo.ivo@siemens.com, shuah@kernel.org, horms@kernel.org,
	pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next v3 0/4] Introduce VLAN support in HSR
Message-ID: <ZyuNyzu0kv1_pemU@nanopsycho.orion>
References: <20241106091710.3308519-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106091710.3308519-1-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_074001_341534_FA6451C4 
X-CRM114-Status: GOOD (  12.83  )
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

Wed, Nov 06, 2024 at 10:17:06AM CET, danishanwar@ti.com wrote:
>This series adds VLAN support to HSR framework.
>This series also adds VLAN support to HSR mode of ICSSG Ethernet driver.
>
>Changes from v2 to v3:
>*) Modified hsr_ndo_vlan_rx_add_vid() to handle arbitrary HSR_PT_SLAVE_A,
>HSR_PT_SLAVE_B order and skip INTERLINK port in patch 2/4 as suggested by
>Paolo Abeni <pabeni@redhat.com>
>*) Removed handling of HSR_PT_MASTER in hsr_ndo_vlan_rx_kill_vid() as MASTER
>and INTERLINK port will be ignored anyway in the default switch case as
>suggested by Paolo Abeni <pabeni@redhat.com>
>*) Modified the selftest in patch 4/4 to use vlan by default. The test will
>check the exposed feature `vlan-challenged` and if vlan is not supported, skip
>the vlan test as suggested by Paolo Abeni <pabeni@redhat.com>. Test logs can be
>found at [1]
>
>Changes from v1 to v2:
>*) Added patch 4/4 to add test script related to VLAN in HSR as asked by
>Lukasz Majewski <lukma@denx.de>
>
>[1] https://gist.githubusercontent.com/danish-ti/d309f92c640134ccc4f2c0c442de5be1/raw/9cfb5f8bd12b374ae591f4bd9ba3e91ae509ed4f/hsr_vlan_logs
>v1 https://lore.kernel.org/all/20241004074715.791191-1-danishanwar@ti.com/
>v2 https://lore.kernel.org/all/20241024103056.3201071-1-danishanwar@ti.com/
>
>MD Danish Anwar (1):
>  selftests: hsr: Add test for VLAN
>
>Murali Karicheri (1):
>  net: hsr: Add VLAN CTAG filter support
>
>Ravi Gunasekaran (1):
>  net: ti: icssg-prueth: Add VLAN support for HSR mode
>
>WingMan Kwok (1):
>  net: hsr: Add VLAN support
>
> drivers/net/ethernet/ti/icssg/icssg_prueth.c | 45 ++++++++-
> net/hsr/hsr_device.c                         | 85 +++++++++++++++--
> net/hsr/hsr_forward.c                        | 19 +++-
> tools/testing/selftests/net/hsr/config       |  1 +
> tools/testing/selftests/net/hsr/hsr_ping.sh  | 98 ++++++++++++++++++++
> 5 files changed, 236 insertions(+), 12 deletions(-)


Looks fine to me.
set-
Reviewed-by: Jiri Pirko <jiri@nvidia.com>

