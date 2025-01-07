Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961BDE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6IgG8TBqPF+D4hNW02w96Pdr6FXNShPU0XiGtGLP2U=; b=EiTR7I70DSDOzmQxgRocB4MNI0
	Cctr4uSNlk02QG8fry0veNoRuegI5x+jj2LdcHCZqbWorewj8PtsgE4IMG/SN0hsiYS51P2LU724I
	Los2Kbb5kSsU+LZNQjIkT6c88E+M2xB5TrL2w8RLOgGy+BCycFd72Bo/zt+xJKdKkqbt9V9QkhQf6
	DU2ycv0/JzOi9txsAQofyvPdMdYAdyTzfLA8Vi5YCy2ZUXPs25W83nxQOaaHxKAEXkpMSsqN7gb0T
	ffedK8Rwt5tZ9RBStSfsxucEXV7pEwL5DIPBcHAj862nm3Uhe8R/FeViU0tqY3xJrJQafFNqwJ29i
	L0buztjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDGT-00000005q6G-1LFs;
	Tue, 07 Jan 2025 17:21:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD3O-00000005lVI-3dwR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:07:43 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2163dc5155fso229837055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 09:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736269662; x=1736874462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H6IgG8TBqPF+D4hNW02w96Pdr6FXNShPU0XiGtGLP2U=;
        b=RCv2rigiwUlKBBzUEaRFgKVO9PwfOqkbGVGNthtrV37jMxkmmdH0FdrPYvOF5GRzVy
         4CnlPWQJv/g/KQjj6aptMWoQaJK1Z/ATGZLUezUOQFozbine69N5yGlKX1r+mDUBCqad
         zz7PBVSB1XHWa4ClL8QOcCTzh3R3oDFst85AmjkEZanYvUVqSdNAIEDWf8TjESc79nOh
         Vt3f6mVMdK7z8OeQXiRLDMMB35TauduVgutLKOgxkxDal2mWeAkfPqaqiX1NLcE/lq9y
         6+oLLT3J0F2dBeTdgRyiC7vEc5WgqGjAuvKlmlxBrUpz1cydwnlNm6kIhzPDGsV/w+mC
         Ojcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736269662; x=1736874462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6IgG8TBqPF+D4hNW02w96Pdr6FXNShPU0XiGtGLP2U=;
        b=sPsf+PBys3aut2pvwxaT5C3G2dy6DeaUpHArGPAxwPZj6Z1F9Mf8tM5Ely4OEgwiz2
         ve24x3oikYoLwcCpUCerjiXZcDsB+9EPDb9A09DrV1ZR27/Bo+0g1AJqMr6bd2r1gQPK
         /4HiONSbfipgo82/CZKDzq9TCNK7OSa6u/uLDFjsN/ZIwteV+f+WShRB4uQ+3vQ6fbWM
         waO1LJ4GrvZFmnRNCQIROq7DevKIVdAR3KFuIPBaUh6QcFbD2BevIN0K+rd913nuSxun
         VQEaHwXOhzCA2sHXzlDdYkuclZ9wLygnmQT2Br5YUWYLB1WVl2ElxJgF0W4Avx12cVdN
         PQiw==
X-Forwarded-Encrypted: i=1; AJvYcCWPNTG9IERQg7YARiWWegJ4PQNoQED84XX067LBxPtd7/XKSGnCoJfesiVz4bwaGRtlnSFqbB/T8TDGYVhCQNHL@lists.infradead.org
X-Gm-Message-State: AOJu0YzPPwcShEJ7lkYARJX5J3hn4CDT/RD1aMtnOwz+pTPZlAC1uldV
	07gQGjLRYn6N9e8Amcs3oDfbKzzSHMDAwrt197CnHg8gCXKQRk0=
X-Gm-Gg: ASbGnct3cb70Fr2stHaJnTYOkz+3v3m+Y/b1jpz+D9GNAuWSiDXQP8boW1CY6lVzn4p
	sX+wDrJclSvnAwkg16zvZuU4YwPW3jc3bjWsg6gvKqvBszRsjJPkhZOX678yLWkxblb/GlnoCSi
	v8P4kxFDRp4iMJGrHupSGi/bFr6QcJFG91EmyRc+jeV4fWXOBK0Lt04okK/FTB3UrJWccKXPTGs
	IGlmhsJIpv0Taf+x3Nk7yLJUPnAb29U0WWJtaeqSz6Mc0fKPF0xjSTw
X-Google-Smtp-Source: AGHT+IHI4UAilr4fOsWcWRXO8E8vJoNjH2hq0o3vxddLmqIYgmVN8lBTyI8wQrNNttLzXRdwB4KPiw==
X-Received: by 2002:a17:902:ce92:b0:215:5ea2:6544 with SMTP id d9443c01a7336-219e6e8c365mr758236605ad.7.1736269661645;
        Tue, 07 Jan 2025 09:07:41 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca04ce7sm305940015ad.283.2025.01.07.09.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 09:07:41 -0800 (PST)
Date: Tue, 7 Jan 2025 09:07:40 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Joe Damato <jdamato@fastly.com>,
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
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org, xdp-hints@xdp-project.net
Subject: Re: [PATCH bpf-next v4 3/4] net: stmmac: Add launch time support to
 XDP ZC
Message-ID: <Z31fXHxWuKNog_Qh@mini-arch>
References: <20250106135658.9734-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106135658.9734-1-yoong.siang.song@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_090742_908654_0E78EE21 
X-CRM114-Status: GOOD (  12.90  )
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

On 01/06, Song Yoong Siang wrote:
> Enable launch time (Time-Based Scheduling) support to XDP zero copy via XDP
> Tx metadata framework.
> 
> This patch is tested with tools/testing/selftests/bpf/xdp_hw_metadata on
> Intel Tiger Lake platform. Below are the test steps and result.
> 
> Test Steps:
> 1. Add mqprio qdisc:
>    $ sudo tc qdisc add dev enp0s30f4 handle 8001: parent root mqprio num_tc
>      4 map 0 1 2 3 3 3 3 3 3 3 3 3 3 3 3 3 queues 1@0 1@1 1@2 1@3 hw 0
> 
> 2. Enable launch time hardware offload on hardware queue 1:
>    $ sudo tc qdisc replace dev enp0s30f4 parent 8001:2 etf offload clockid
>      CLOCK_TAI delta 500000
> 
> 3. Add an ingress qdisc:
>    $ sudo tc qdisc add dev enp0s30f4 ingress
> 
> 4. Add a flower filter to route incoming packet with VLAN priority 1 into
>    hardware queue 1:
>    $ sudo tc filter add dev enp0s30f4 parent ffff: protocol 802.1Q flower
>      vlan_prio 1 hw_tc 1
> 
> 5. Enable VLAN tag stripping:
>    $ sudo ethtool -K enp0s30f4 rxvlan on
> 
> 6. Start xdp_hw_metadata selftest application:
>    $ sudo ./xdp_hw_metadata enp0s30f4 -l 1000000000
> 
> 7. Send an UDP packet with VLAN priority 1 to port 9091 of DUT.

Tangential: I wonder whether we can add the setup steps to the
xdp_hw_metadata tool? It is useful to have one command to run that
takes care of all the details. Same way it already enables HW
tstamping.. 

Or, if not the full setup, some kind of detection we can signal to the
user that some things might be missing?

