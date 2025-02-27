Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A39C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVfI19/EVZuMF44ISw3H+kHayQljK7ILxbA5Nh59FJs=; b=NxD5u93/vONpRw/JsHX1o01tc0
	F+ati+ANiKk5shqxVNhjGwGlAFYrZG0jjlg8oj7Bo3zwpcitDHRHYZqFQDsXiCrTUvDyPzZAEYkr7
	qrsrmMQHt1IyJtX/mllkY/EmG1cJ4JDjDB6hYwMIq/BbbOiJV2CsFIRsGnSQB+bIZZzjRSvbXuyPH
	XKIPwMuNCYWkbK5T7RXgCslneb0wjDF8paAQ0mkxv9fVFZ4LkwAlEmmf23IaGO/uvFOB3Tre0DbSa
	4JkaBNUiZv4Vt8yqOkOL+7zSCYi2gZWhCxa0k70s8Lr1CwKkg1VwGxtyTGyz+itgr6chvJwPzbvgC
	aGX7VvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYyF-00000006eed-2z8U;
	Thu, 27 Feb 2025 08:10:15 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYt8-00000006dZR-0nr5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:04:59 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-221ac1f849fso84455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 00:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740643496; x=1741248296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KVfI19/EVZuMF44ISw3H+kHayQljK7ILxbA5Nh59FJs=;
        b=GCimDLc6CMK/4/2/nb8eXpmAfA8urfu2/6qyzS/ttyAsbLEwyZsVmx4XhQfIC9QXpt
         onKbx3xSha6rfXyVhPfpzKbl/hkIfXmUjvZrovePjGSA9xDfxBel8MVBFgFtcocC4zsP
         DoLnxKEpvBYDSwv4GNp0cyNX1dWRnBX0jUGeawXTFVw3SOnPcvO77Nts43m2r9rANLB7
         XoGBxCFL7Xbsb3j6cTI6ufLPz37GZT87ZU+V6SaomMdep8AAqnVDPLzot0jsYPv1Evb8
         gDIxFR63ESysN2aVpdZzMvrFUx5BHuYpmTftnLt1MH2D/TxYHsr3s8TRN69rtoQUhf34
         iRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740643496; x=1741248296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVfI19/EVZuMF44ISw3H+kHayQljK7ILxbA5Nh59FJs=;
        b=CDczh13YGskG9E1q6bkJb7OxaZlbU8a2nluUhgb63rZFStOX8Nx9KuzKP+clw531bZ
         PPsAyBTRh2Anj4uF1xA/2tZbw1Rbbeuy8PbY8DbRCAGwO7JoiXkcbQRtVCmMGr4ln6Hk
         0MAfHTT+dD5sCtA04oQbCwoBAeyzRh3aOtfIcv0ifK7OEUUw1j4lbVIytzrX0nVyQ6H/
         oXrHSMf+nf3W4f3YkK56QKcvvP4SCDEl0DtX1g+H+DPnkFmK9oPc+YTLLvrPCoXzG2aj
         xTkWBkf6ABI3bEI4o8n2Csn5Uly9ft6vxsAkqy9bZYkLBavz1mT6mjvsEIVwNCAPq2Ev
         0L6A==
X-Forwarded-Encrypted: i=1; AJvYcCU9Epno/pjt5u/3sUeFB4OSKY02fIEMx1wzIQYbso0zAjEb/273Bxdh2dehfwy8YJGiwETVhO0bOYU4JZk/t1a/@lists.infradead.org
X-Gm-Message-State: AOJu0YxnwM+Wd3eAf2tw4v0WDXwUfekRYxR1PFAvXF4v/cjjYRBCtIJO
	cpKlArtM33PxCdexPa+GiFFQ02u2NMyi/raSMEDdoblDnc0byrerS67ifsT4Ew==
X-Gm-Gg: ASbGncvB4eFqVYsOHTlOFDCpMgN4Du4jd62XCf+w0PhIfZvKeuoEHkayoO7olTigtxE
	y7woGgmeCuaaai44fWdrSIM2XOOmLqtgt6cGGrPqLs4k/hFu0L/Tiu/z/lodVjMA/FFzRQH8oUI
	MwvmT0rFh70fpp828OFth3vBPBukk5i7WRblb9SO+/cxbWaQNAQGfuNWQFfZE/stm2maGev9o9x
	bn5b+cDa3biRnSBumygLmHSgoUlmAo9OZnmRqdMJhtN+62oU/jujFfM0QiPz+aTE2Hzs8g+xD3D
	qVXjfuIGMy5+c+gYTMQpBAUAGPbIN1KNf9Eb58dSLR/oF+ST12sp16nHXp8LozcY
X-Google-Smtp-Source: AGHT+IH0kXAKW/WxeUSAkDJ6hpUz3G9Z8tiiq25Pho3rUzHzfEO4KswpeTVilRNrTdkuX5sOdpqUXQ==
X-Received: by 2002:a17:903:17ce:b0:215:9327:5aed with SMTP id d9443c01a7336-2234d84ead1mr1995945ad.20.1740643496268;
        Thu, 27 Feb 2025 00:04:56 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe4cd94sm910482b3a.38.2025.02.27.00.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:04:55 -0800 (PST)
Date: Thu, 27 Feb 2025 08:04:50 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Yingchi Long <longyingchi24s@ict.ac.cn>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 4/9] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z8AcosbkJ_n8wEbZ@google.com>
References: <cover.1740009184.git.yepeilin@google.com>
 <e2d7bfc155a26305a3024aaa102a3acfa693e565.1740009184.git.yepeilin@google.com>
 <CAADnVQKEcof-WBBj_W=GpsP0Tjm8hyxeWc06243ZBR7_Ua0Gfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQKEcof-WBBj_W=GpsP0Tjm8hyxeWc06243ZBR7_Ua0Gfg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_000458_256978_61D60216 
X-CRM114-Status: GOOD (  14.44  )
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

On Wed, Feb 26, 2025 at 06:18:47PM -0800, Alexei Starovoitov wrote:
> It's border line ok-ish to delay arena ld_acq/st_rel on x86 for a follow up,
> but non-arena on x86 should be done in this patch.
> It's trivial to add support on x86-64 and
> limiting the selftest to:
> .. defined(__TARGET_ARCH_arm64)
> is just not right.
> 
> Even arena ld_acq/st_rel can be done in this patch too.
> It is such a minor addition compared to the rest, so I don't see
> a reason not to do it right away.

Sure!  I'll add x86-64 support (including arena) in v4.

Thanks,
Peilin Ye


