Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F4CC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDviKLcvI9VrAI+wR/RQw9Ygk7b5+KAWd1c6p2r0hE0=; b=ydLpz+JYCzypeP4gxrh9CA/2eJ
	FmQTZwoJm4jijHIxKZy+U+zw7r2QVpznWYJZnnImTyy2lwFOFMhaT2awx8FGxeOJy7aNlDs/9+6Zm
	XrEHUtIusITMBeMSphVUtLM2w8waRb5oojX7HfMG5PwbRz8yojCBnt7trWq93myiesaeZ0R/XNDMN
	YhNjnGdpTp6bjSWFPARjzREKL2EqtFAhYhEmBJeJtgf2XCk0NyNMNNd53ZMQ//BsfFIeZvMkgm9uH
	nwWqZHOo/qD4IraUDfTJAmfRAzZF39KVQIGMmKNWOQA5nCn2N4DIU90XuCWqx7B3QdlaEsm0OC9L4
	AgxGMnng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPUr-0000000ALqp-26Gh;
	Thu, 17 Jul 2025 14:22:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOUp-0000000AElN-2L74
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 13:18:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45619d70c72so17269905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1752758277; x=1753363077; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDviKLcvI9VrAI+wR/RQw9Ygk7b5+KAWd1c6p2r0hE0=;
        b=F2ovuRGAY4U5sQuKxFnDcW21T4zRyZhFuzNPRLk2nMWse18tqg7oGOEfRaIWiz1z7K
         MvBTPFvHWJX39MRq/upXz2eFzgFm6aMn20fFopEWCcoFwVGUd9QpdrI8znqKuExYevfv
         ZjSYYNU6E3ib0z1Wy79ij0O3iBvCICYI1A3uxh8gp28A0BfQ/rwNjuWla4KNKAXQYfUI
         drZlv7Kqy9c47Rj9Ge3tJ7zIVbmMt5iV5DV5Lg46XXdiAKI6kFrUBEMzpc7U7qze3t+V
         Fgif6Sw7hcjiNzBLPE1JS6w3ZHk9YELr4YjLyIK9Ok4KZvq4dhj/zKyZh3clKnploGKM
         8g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752758277; x=1753363077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDviKLcvI9VrAI+wR/RQw9Ygk7b5+KAWd1c6p2r0hE0=;
        b=ECf53y/aywrWUIK2wkT8SgwQDnCtx05CoZ3U8kDs5qdOSsmvJOI4U/4k4b84SCi1v9
         DHZb+FrOvLITXB2MsE2VWmCWjOPog51n906UqlKLngI/OcdszjuSk3sXtFLdFFSnY1NK
         aHY7vIC84h+dD8BjW1k3PMrUxEDJWHENwPCxNja76l1+ryr7PfptvylvyAjyONKDAeyj
         tePhYOe8Rsi7DBf0IMFAsjFVUs/I0iY+l7HktAKE9Cup7+4DYuqw2l38+fA23LDAdIQL
         shqFdsjRH6WGLoIoPJ/YEMwi5HM3ZyTwm7Y4D61G43ArKuN4XgqDih7qykMj/BSZNb//
         aSIQ==
X-Gm-Message-State: AOJu0Yzl7GJGyuQbKvJEBxLL8JaqsGkHlkw/CbH+fvZfra9ncCdQboyh
	2+slVU4alAUC7t4A+R/uMk3quA3XfM6oafSyd5+64E8YU+q+9h9vi2EmFsbeGI9YBPujAWlfupQ
	/rbim3TpNNeEYn593uTw40JtBIAZNF5w33OwRx4qwoA==
X-Gm-Gg: ASbGncuIe2Ggocl1e0ML+JvtWxSpzXC5tNs48s5xBOeS/PMBq4iOMiS3IQ+8z9pidIr
	GXE9YZkqxuH1nfb3zmQ2PGOvwnZIGTZfKKHceFY02QyM0v2GvoZj4jn8E5GjSYNZuC3ww9hm3YG
	mH+lMjdQ0nYjAWZ2BEs9TiMJ6ajwLjyqzyVCBTKAR3wlFSW1dXtuoNEPNsWSdbVpl5UyaN4GCAG
	I4vpg==
X-Google-Smtp-Source: AGHT+IHWUpImxyj/M1iYj87ohSochOBEwmwUERfKvdToAyTI2JfgPVjFu+KTHMnlrSfiuDb5dWth2zr65OoSOyIcwLg=
X-Received: by 2002:a05:600d:17:b0:456:15be:d113 with SMTP id
 5b1f17b1804b1-4563451f300mr28829025e9.1.1752758276810; Thu, 17 Jul 2025
 06:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-vmlinux-mmap-v5-0-e8c941acc414@isovalent.com>
 <20250520-vmlinux-mmap-v5-1-e8c941acc414@isovalent.com> <g2gqhkunbu43awrofzqb4cs4sxkxg2i4eud6p4qziwrdh67q4g@mtw3d3aqfgmb>
In-Reply-To: <g2gqhkunbu43awrofzqb4cs4sxkxg2i4eud6p4qziwrdh67q4g@mtw3d3aqfgmb>
From: Lorenz Bauer <lmb@isovalent.com>
Date: Thu, 17 Jul 2025 14:17:46 +0100
X-Gm-Features: Ac12FXzAj1uStiEkTmwdY3kJmq5UyFHyQ5GKtR_wcQY_1cDKPtpY4TzHkBJQvTY
Message-ID: <CAN+4W8hsK6FMBon0-J6mAYk1yVsamYL=cHqFkj3syepxiv16Ug@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/3] btf: allow mmap of vmlinux btf
To: Breno Leitao <leitao@debian.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alan Maguire <alan.maguire@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_061759_605400_23B7A5F5 
X-CRM114-Status: UNSURE (   7.27  )
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

Hi Breno,

Thanks for reaching out.

On Thu, Jul 17, 2025 at 1:39=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:

> Should __pa_symbol() be used instead of virt_to_phys()?

I'm not really well versed with mm in general. Looking around a bit I
found some explanation in [1]. Your suggested fix does make sense to
me based on that.

Let me run the patch against bpf-ci and see what happens.

1: https://lore.kernel.org/all/90667b2b7f773308318261f96ebefd1a67133c4c.173=
2464395.git.lukas@wunner.de/

Lorenz

