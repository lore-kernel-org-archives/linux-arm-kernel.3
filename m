Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A860C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 00:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbDhewnz6sF7NAjuh/IG2morMwwWY78lrdk+Dwk6HUA=; b=BaDhi6OcNls4vF7eE9XIjZqO8u
	Y/xcBsA8+ou4Geee0uI7J/tyG9cTau4dLUKNnvsmN8t9+bFd5n47aycl9fMlJQWwYuiQcfB3hInl6
	aOls5dhHD7bdxBdcHxdidGOcgHuCSR1TrNpLBi1tXRjhxryAz299Q9y6kGl8YbOUDfAtBk4G3M/du
	mtwW6oot/DfrRUAZqIUJCn/VBog5IKOZc8wbkyqjJTf0adh0Fs7Ho1M+pp8A+Tv14u2L78rHm71Po
	Ns6/mB+ex3qkMUWQ2ewG8EMrLXYQLERWSd100ceb3p7e7FAhikX7U2KwueSZ1uta/G6cURdcX7XXP
	DB9Pj9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYDnv-0000000DSjH-3IBL;
	Thu, 16 Jan 2025 00:32:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYDmg-0000000DSQR-0uHn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 00:30:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-216395e151bso5853025ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 16:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736987453; x=1737592253; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nbDhewnz6sF7NAjuh/IG2morMwwWY78lrdk+Dwk6HUA=;
        b=MxftZwuUJSxbtTOiVe8dEBdg8zjOcWKWlzSUxLbaD1oASjYgWwBe/oF/MCumqVoSl3
         orLEDa8Yo2XNitMxCgYpg7I7kiMejMqE0dUPn0iNmmaCZ4cPJU0JvyjjjIYXkJFuxNl9
         piksDedxD5jy+P1Xv19KyeO3oTrW5RNHir4cS/Q1GZ+rL9IXh8mXDAUb5M1cW/48vMdv
         iL31wsE1zCBQQeEBx74isEtHHqrWkLFYFlzZwVxj3BJlsmHWSaIPvCwHXhMEjtoqISxv
         QDPLn/ap8PA1WadeO6AV+g+NB27ifbvPkC3vptiW75BAzqi1sbaM3A+meRzwbS+KDpUk
         uXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736987453; x=1737592253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbDhewnz6sF7NAjuh/IG2morMwwWY78lrdk+Dwk6HUA=;
        b=CXAvTYdRt9YYii+EeIjB8ZoSZBeuMfkFDWjhou32djb4M+pS5aoInpPXDMmSiNQwN8
         gtQIs8Ax7niR37sIl1mnwCNKBPhUHugOLHwozI91NsNlUjFidwUzUd6H8uxpRlV2Yp8n
         zZOU4LyJgWlR17E5xez5ymRlFdJpK3BK6CrhxTYi5ATPzenbpnqQ1dOAEN1qfJ1I7BoL
         QRqBBnxvNudMDiq2bBMuGOU72WF5ybT7wMuvlCDlxlFF1p2poM/nBMyp8x+RpyEP14sf
         bcarNViSSvelu/cdeVKs9FH0AYDNuYhawWqnpaaFLbOXyMasZS9y0o9AqF0boAnbv5Ii
         WKbw==
X-Forwarded-Encrypted: i=1; AJvYcCVZtKMEcx4o+XjaQNLbr8h3rw3UM2/tFB7bZCRAx3I6OU0JDaNM9iTbVppz7TFv1V2DQNhMF/vsBrGTbcFnqpii@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7B73XWh+kRZgT10a0z3o08JSNPpr1sURvzvnDOHhgd9/DsNXe
	DcPK0tOUNV2fyDZ+W/uhKKlrIV6olA0BNNgZKzgOdjoxCjnyONo=
X-Gm-Gg: ASbGncs85D9f5PBiEAPpIk2Qx8P0tkxn9WDQ4YLl6tAq7vk/ty+YO33PYQp/QsFI1Ua
	E6AyY8sNKEtStZRPGYzvNDvOZIccK4ghxHevy54cOkYcuTkBzkVl+PxSl4dbhw7nuTI15zR4VkK
	XAlW+YAi8kbyZdea7FzNKGAiiKGYXXXtqZly0NP4ebfLyjDc5ZKhQvUgR9qp8LJhKBYd8djhjme
	8TFqPu7bSXlIISEUGYRb6CuzhU6DR3YCkeScRnDyDN6afjhWr7k9Mp5
X-Google-Smtp-Source: AGHT+IHL2kbDL71i52Tl5thJXHFKE0VJJEHYy6lN0jWJKKjChbh+K9Wolj1lEqEzzNUmnYNfgO9FbQ==
X-Received: by 2002:a17:903:2410:b0:216:2aec:2d54 with SMTP id d9443c01a7336-21bf077dbc9mr79922565ad.8.1736987453496;
        Wed, 15 Jan 2025 16:30:53 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f6d7sm88927685ad.52.2025.01.15.16.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 16:30:53 -0800 (PST)
Date: Wed, 15 Jan 2025 16:30:52 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	"David S . Miller" <davem@davemloft.net>,
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
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"Damato, Joe" <jdamato@fastly.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
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
Subject: Re: [PATCH bpf-next v5 2/4] selftests/bpf: Add launch time request
 to xdp_hw_metadata
Message-ID: <Z4hTPNEGreEo6igW@mini-arch>
References: <20250114152718.120588-1-yoong.siang.song@intel.com>
 <20250114152718.120588-3-yoong.siang.song@intel.com>
 <e273b1f1-868f-440e-b226-84b493ef7ee2@iogearbox.net>
 <PH0PR11MB58300DA3845D1E3F788C4FC8D8192@PH0PR11MB5830.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR11MB58300DA3845D1E3F788C4FC8D8192@PH0PR11MB5830.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_163054_255839_FDD813A8 
X-CRM114-Status: GOOD (  18.83  )
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

On 01/15, Song, Yoong Siang wrote:
> On Wednesday, January 15, 2025 10:57 PM, Daniel Borkmann <daniel@iogearbox.net> wrote:
> >On 1/14/25 4:27 PM, Song Yoong Siang wrote:
> >[...]
> >> +	/* Add mqprio qdisc with TC and hardware queue one-to-one mapping */
> >> +	char map[256] = {0};
> >> +	char queues[256] = {0};
> >> +
> >> +	for (i = 0; i < rxq; i++) {
> >> +		char buf[8];
> >> +
> >> +		snprintf(buf, sizeof(buf), "%d ", i);
> >> +		strcat(map, buf);
> >> +
> >> +		snprintf(buf, sizeof(buf), "1@%d ", i);
> >> +		strcat(queues, buf);
> >> +	}
> >> +	run_command("sudo tc qdisc add dev %s handle 8001: parent root mqprio
> >num_tc %d map %s queues %s hw 0",
> >> +		    ifname, rxq, map, queues);
> >
> >Fyi, above triggers selftest build errors:
> >
> >   xdp_hw_metadata.c: In function ‘main’:
> >   xdp_hw_metadata.c:763:45: error: ‘%d’ directive output may be truncated
> >writing between 1 and 10 bytes into a region of size 8 [-Werror=format-
> >truncation=]
> >     763 |                 snprintf(buf, sizeof(buf), "%d ", i);
> >         |                                             ^~
> >     TEST-OBJ [test_progs] arg_parsing.test.o
> >   xdp_hw_metadata.c:763:44: note: directive argument in the range [0,
> >2147483646]
> >     763 |                 snprintf(buf, sizeof(buf), "%d ", i);
> >         |                                            ^~~~~
> >   xdp_hw_metadata.c:763:17: note: ‘snprintf’ output between 3 and 12 bytes into
> >a destination of size 8
> >     763 |                 snprintf(buf, sizeof(buf), "%d ", i);
> >         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   xdp_hw_metadata.c:766:47: error: ‘%d’ directive output may be truncated
> >writing between 1 and 10 bytes into a region of size 6 [-Werror=format-
> >truncation=]
> >     766 |                 snprintf(buf, sizeof(buf), "1@%d ", i);
> >         |                                               ^~
> >   xdp_hw_metadata.c:766:44: note: directive argument in the range [0,
> >2147483646]
> >     766 |                 snprintf(buf, sizeof(buf), "1@%d ", i);
> >         |                                            ^~~~~~~
> >   xdp_hw_metadata.c:766:17: note: ‘snprintf’ output between 5 and 14 bytes into
> >a destination of size 8
> >     766 |                 snprintf(buf, sizeof(buf), "1@%d ", i);
> >         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Thanks for pointing this out.
> Btw, do you know which build command will trigger these errors?
> I am using "make -C tools/testing/selftests/bpf" but cannot
> reproduce the build error.
> 
> Thanks & Regards
> Siang

Last time I used the following to reproduce similar issues on my side:

make -C tools/testing/selftests TARGETS="bpf" LLVM=1 USERCFLAGS="-Wformat-truncation"

You can also try to use something like asprintf instead of managing the buffer
sizes manually.

