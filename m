Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737E4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KsRQIc1JxQBezEIVdfkOzKqKFxNDLhEnsfcwp5vSS0=; b=d3k3BVBjiSEet2sL2HJiMikC8c
	M3B4WFm1gSwJ+PRXDQ64WnKx+6HN2RjlDAVhMJcFgwjIRnn3bPOeiSx9pCZL3uTx5JiALNzYRHD3V
	QyuVk2FeBSeFAmKGrPrKwp8NJzX1g/vEWAVY/4pFYMWBFm4WZ2ipvkVUu7WGStGWwm96FDlJU/2Yc
	yuso+4Pul1NNpNUNcLxkGqy/AjTaimkJyeZ8cLTW45hgq+sWqrmtqMudF0J08/Ng6C5X7cmtzL1GD
	oKZJSKb/qD9QXVRRNDLf5F20H4fDnIkT72sl25YpLbABm2+WWDUOhbQA9Yg2q6D84H6i1oKSmPr0c
	xfFj3N8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwWL-0000000Crwq-3QRL;
	Thu, 09 Jan 2025 17:40:37 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwV7-0000000CrUg-2rRV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:39:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216728b1836so19584255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 09:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736444360; x=1737049160; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6KsRQIc1JxQBezEIVdfkOzKqKFxNDLhEnsfcwp5vSS0=;
        b=P6IuwfeK/g0bPsHsJ9UO7ljEiPdEwfzqAeYXLI2qJCuM5DPXHcWEdXVAitW/9gUKEP
         vT12VeqEfJeSqBJMYpMFoQgF/ZgbUm3J4QGHnUjcuKnlHgnSPogLuDghMTukD8LYqmTp
         cNeiqmWSmWoSBjV8P1zguiYEnkMHG9IdJPebodWMDNHM4dUsqfbNJHHeTAf+Y8RF8NUM
         hqN0JO2VH++5DxbB78awq3FWSwQ11cbKKotLo4aU/B7Vh6R495zNaytMtUsLcvg5BmFm
         ctl5afNQ7e+Gs5wcAwcG6N1bcJy4dIAX+ar9sk8fgdkOIhhQoO29kH1jlOraZuqAIL3g
         3TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736444360; x=1737049160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KsRQIc1JxQBezEIVdfkOzKqKFxNDLhEnsfcwp5vSS0=;
        b=G4oBcMrdsQbC2+hfw7niDyJupZrBcq4k1KvliQL5tdCYeudSDsXMqUnOsZg+3EZyhH
         p2t6yN1KiZNBEPDT7kECb1IBtIwu0QdZyaVvLldB0HKMnLd67HbsGKplzIpewZQVQ3Ay
         A+osVIL5RHx8KS1V5DavJ0ttVtNAwIl1g1COI63lJ5jiRBR38i6LRcFJeQCweh7jQht0
         ouQ8tXVm4OVJpWle37c1RIRGHA71aOhaRalQGPp6MoFqN28CfTZAs+S3btmgauKf0btS
         UQ3pQwYnQdDx2LmwpBCCNJyZchzUDFYTM/0ZHSl8Yl1ezr91MidT26QKy1vuSyMLc5KQ
         bbKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm9jCCLg/1DadLx8CCHK3Ukq3hBo9Pr1LmP3UGPE9pjPczF9XwSKm+nKjZkfgpCJqT/9sM4ngN0U72jW12VLZj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy45fYd29axu8UQjQ8S7VgxEknXmuLJsCiOdLxZ+lA9fJO1bYUX
	P51lQxwKVnAV15qkrlYC9WI/u+MViETYZfyN40SHZOHyJXDePHw=
X-Gm-Gg: ASbGncuSq64lL2QX+FU4wBtDTSug8F6UtJLoBxyod9/QTcQ8R2XeQdTR+nN2QrbBPuB
	Qo36aRDDBuluZ77DdY/LcsRqFpTZ8CO2e+X7Ma9nr3Ni+OmYaDKAVKhLcdxtcgvYgY3B7PSVVkv
	ju6LVAsdJOj80FgH2wNP60K/JCG8J4GCCu7NI6VxJXYBYnMB4VrlW0OkxYMv9cIE4wNWeKUjDAD
	zs/izRF1H3l6Xvc66ynzyxT4VMR+7FLJWR15/SFK9edNFK0LUZWpNIp
X-Google-Smtp-Source: AGHT+IEOsPd8gi8EzkqvvII6DaS7kpXwJUDoEvR9sz6x99GD7Aypk+y99jv+WqRaCxVsNJdjbVm5kQ==
X-Received: by 2002:a17:902:d2ca:b0:216:56d5:d87 with SMTP id d9443c01a7336-21a83f8ea52mr112422135ad.34.1736444360267;
        Thu, 09 Jan 2025 09:39:20 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22f051sm516575ad.203.2025.01.09.09.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 09:39:19 -0800 (PST)
Date: Thu, 9 Jan 2025 09:39:19 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	"Bezdeka, Florian" <florian.bezdeka@siemens.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>,
	"Karlsson, Magnus" <magnus.karlsson@intel.com>,
	"Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"Damato, Joe" <jdamato@fastly.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
	"Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>
Subject: Re: [PATCH bpf-next v4 3/4] net: stmmac: Add launch time support to
 XDP ZC
Message-ID: <Z4AJx-a-eY3pgHNv@mini-arch>
References: <20250106135658.9734-1-yoong.siang.song@intel.com>
 <Z31fXHxWuKNog_Qh@mini-arch>
 <PH0PR11MB58304082BF0EA96D1A74E4C5D8132@PH0PR11MB5830.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH0PR11MB58304082BF0EA96D1A74E4C5D8132@PH0PR11MB5830.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_093921_723542_5313021B 
X-CRM114-Status: GOOD (  20.76  )
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

On 01/09, Song, Yoong Siang wrote:
> On Wednesday, January 8, 2025 1:08 AM, Stanislav Fomichev <stfomichev@gmail.com> wrote:
> >On 01/06, Song Yoong Siang wrote:
> >> Enable launch time (Time-Based Scheduling) support to XDP zero copy via XDP
> >> Tx metadata framework.
> >>
> >> This patch is tested with tools/testing/selftests/bpf/xdp_hw_metadata on
> >> Intel Tiger Lake platform. Below are the test steps and result.
> >>
> >> Test Steps:
> >> 1. Add mqprio qdisc:
> >>    $ sudo tc qdisc add dev enp0s30f4 handle 8001: parent root mqprio num_tc
> >>      4 map 0 1 2 3 3 3 3 3 3 3 3 3 3 3 3 3 queues 1@0 1@1 1@2 1@3 hw 0
> >>
> >> 2. Enable launch time hardware offload on hardware queue 1:
> >>    $ sudo tc qdisc replace dev enp0s30f4 parent 8001:2 etf offload clockid
> >>      CLOCK_TAI delta 500000
> >>
> >> 3. Add an ingress qdisc:
> >>    $ sudo tc qdisc add dev enp0s30f4 ingress
> >>
> >> 4. Add a flower filter to route incoming packet with VLAN priority 1 into
> >>    hardware queue 1:
> >>    $ sudo tc filter add dev enp0s30f4 parent ffff: protocol 802.1Q flower
> >>      vlan_prio 1 hw_tc 1
> >>
> >> 5. Enable VLAN tag stripping:
> >>    $ sudo ethtool -K enp0s30f4 rxvlan on
> >>
> >> 6. Start xdp_hw_metadata selftest application:
> >>    $ sudo ./xdp_hw_metadata enp0s30f4 -l 1000000000
> >>
> >> 7. Send an UDP packet with VLAN priority 1 to port 9091 of DUT.
> >
> >Tangential: I wonder whether we can add the setup steps to the
> >xdp_hw_metadata tool? It is useful to have one command to run that
> >takes care of all the details. Same way it already enables HW
> >tstamping..
> >
> >Or, if not the full setup, some kind of detection we can signal to the
> >user that some things might be missing?
> 
> Sure. I can try to add the setup steps into xdp_hw_metadata
> by using ioctl() function. However, there are some device specific
> command, like the number of queue, their priority,
> how they route the incoming packet, etc. I will try to find out
> a common way that can work for most of the devices,
> at least work for both igc and stmmac.

We can query the number of queues (and everything else you need) in the
tool, similar to what we do in
testing/selftests/drivers/net/hw/ncdevmem.c, take a look. But if it's
too complicated, maybe at least print these commands on startup and tell
the user to run them.

The reason I'm asking is that I hope that we eventually can run this
tool from (automatic) testing/selftests/drivers/net/hw testsuite to
make sure the metadata stuff keeps working.

