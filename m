Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD823C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 19:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ehvXM/x2Xpjmareg8hVceTaEqRxIeAlXfZcNgyZJpQ=; b=ywklB//iVKRvHegdv+Blhdqdvt
	gkPkCyZu3H7CBOXDnGtB6nBser7MQz7Yd2VSB4BmeRbRzwG5HKFkg0R2a4DRfOEiA3Gmm6UbmtwNW
	78Hz2gWuebJhKvBrUWCNZ2ieCg7uxNGNjPRjBHo5k6yuDrmrvvOK2xGmMXm31X5zi3C0pjX5VMng3
	S+Xm4+cuVE1gqvQ3zAqFQD0huMp3Q4otTzYI7AS+ruHrBymB3xzuxdPfzbzXRVZgmrPN/QF5/hfHK
	7w/3UBjFsdw/YaQ7ZlZgjQNPuEko9/ZpEsdxv2xJDBj5BaXtAHbvEoHZ60orwbSerTNAFdHniB7bw
	TT3ypMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3Cg-0000000DAYh-2Ps7;
	Thu, 23 Jan 2025 19:49:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3BN-0000000DAIy-3l3q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 19:48:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2163dc5155fso24334215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 11:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737661684; x=1738266484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ehvXM/x2Xpjmareg8hVceTaEqRxIeAlXfZcNgyZJpQ=;
        b=njeIRFcbdcfmTVCxBuFTkMya/g9sYuvpwD+PH4cp5qX6gHJua8Zh1EI7VrsYLE/Ncl
         2BrmIbcyYKg+QooDkp96u8xLgct6QtuMzD6lB9OBqV4bA45OlXHqZN/iwHoMZw0K/PMI
         2OvFOQ5ZguTrRwN0uf1vUJZXr3GOkiHtYJsz+fHOqdRemZeM8Stv/NSl5XrO/G5h6uFQ
         KpGdol3jaj6ZF1zsjzCLZJJnwi8U3ErmKE/D0A0b85icIVcffztlgRcuYNFmI7j3C8SM
         YDbKzBwJs6taex3bTxJ5xhxRS5g/7+S6704x24fIrVWAsrx0U3pL6ZcxYZthm434MvpW
         3SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737661684; x=1738266484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ehvXM/x2Xpjmareg8hVceTaEqRxIeAlXfZcNgyZJpQ=;
        b=VYs5vEf2ppL4n1kJZnkg5WGqVQgItjGd5AkBBwTBCTC9b8Q8x41kGuKGIbrb8AuM9d
         j3hXHZ4/GKb18iGTOAVxaVeenN6YGYOQ8UdRIKGXTYSl8st5/I6oILxmopHq1MAHAd7+
         M5NUYoRtNWpjyrvY4MjW7nRnlcJmZXbdKSfHw94g9Yv1tdUGyqYDBtY8JhnpCoOLhy3Y
         scAEGDl3XKO6VMu7gIchC6YaIKMkBD8wlGCTmgCpb2M98U3+q62Aqnrkg5uuHrpObO05
         BZMq1INLJnTdSLUjAwQ/1GtLhwtn1XTDOUHiojsX3B5+mZJQDCaTk2aVT1qBvEcHM4PB
         3qVw==
X-Forwarded-Encrypted: i=1; AJvYcCVKvn0nv2aqr+r79FYmK74bLB8oVgHh1QdLT2IYWHvrjh+pVFdVQuI15k70zwPSVwGNs9JLJhVGM84hJ0jHpQuy@lists.infradead.org
X-Gm-Message-State: AOJu0YyMOu7j8CTJud4veUzQGWTbjhkxHySKYmV75FH21fQ+KnEByy8q
	FeawaOtPkrTe+CcNQLK+clJkPvJ9crakfNM0aPgFYRDGOCXuFG4=
X-Gm-Gg: ASbGncvPpc18FacL/fu2HCUmuYTj+HV1VwJuZ4iSYirqYuk/eU8djukUhqhRSkvUClW
	KiNIw5hkoFYbFYhyF9wi6xFUaC/yNun3h4F2xAFZPd2wid9zhEoa82y7JdEBkigJTpaWbCwD8RV
	BtLsiHVNtjruSw2h6LewvI3b3l5SP+B234ZJcddu9opLVr7BkiEs/Z7Dk8Vp7ta+IX0XlIMOM3+
	jDRb9vKE+mdYsM52R3p9RwiXwd0A2J6KR4FLd9CXCFRx1TfV22WQiZ8BxLHQNcQ/dAtBjPEe7y9
	oaDt
X-Google-Smtp-Source: AGHT+IHN0sZtZXkNpILip1vz+eYUU1Y/MTgN8GKmFzFYwee95EZNDldTyC5bmSvcCfRBqUDdtCAgnw==
X-Received: by 2002:a17:902:e548:b0:216:60a3:b3fd with SMTP id d9443c01a7336-21c351d345amr370312355ad.3.1737661684548;
        Thu, 23 Jan 2025 11:48:04 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea2430sm2880515ad.65.2025.01.23.11.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:48:04 -0800 (PST)
Date: Thu, 23 Jan 2025 11:48:03 -0800
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
Subject: Re: [PATCH bpf-next v6 2/4] selftests/bpf: Add launch time request
 to xdp_hw_metadata
Message-ID: <Z5Kc8wufjrsXMCW9@mini-arch>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-3-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250116155350.555374-3-yoong.siang.song@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_114805_934345_DE4D20D0 
X-CRM114-Status: GOOD (  10.88  )
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

On 01/16, Song Yoong Siang wrote:
> Add launch time hardware offload request to xdp_hw_metadata. Users can
> configure the delta of launch time relative to HW RX-time using the "-l"
> argument. By default, the delta is set to 0 ns, which means the launch time
> is disabled. By setting the delta to a non-zero value, the launch time
> hardware offload feature will be enabled and requested. Additionally, users
> can configure the Tx Queue to be enabled with the launch time hardware
> offload using the "-L" argument. By default, Tx Queue 0 will be used.
> 
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>

Forgot to add:

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

