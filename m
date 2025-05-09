Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F91AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUZP0RFWcvqcYymU0Mxq5VI0y3pwjw/JUMrv8IOQZ5U=; b=u7Ud6oX+6qXf2CEo90nILd+Jzp
	RiAghaKYaqd8Yo9Y60x3/V/GMPvc6wscCh1d0tzbJvUF0qtfSOIUqnp4KZEkua5Qd6gBwozrpXyPk
	HHo7lrb8X2rNN+ZU5l8jko8cnL0r8kyzIleXVZJfxrWjH+7B1b8uUkIR2MKy2zMlsfSZRbQW1dt5z
	pU/V1nipmd9QdPCKywPh4EYXSc92W3l9st42plumkC7DWggyuwVJaas6R6tiZ2vXbcU5YDYGmng5f
	YbPFB5oKIunUdtOJvdKD4vUd1WW2XtZagfbswr+dvuiX4evQA6+caUrjij/U8Io11tV63Qi+gXuP5
	tXljnmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP6s-0000000409c-163R;
	Fri, 09 May 2025 14:53:58 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNgm-00000003kHU-01GU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:22:57 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso21591016d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746796974; x=1747401774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUZP0RFWcvqcYymU0Mxq5VI0y3pwjw/JUMrv8IOQZ5U=;
        b=JrooJ/72r0/QdzZa5xat3Tq1ot4cEk38cLeW/eAJhJmINqy+3IvwmQZjh09DD/4S0w
         feL9DrYOBF+vquLfJPCht9PZ7MWbshk2gW57QNeJJLUaxlbpFBb9Hi002+LbsvxZdyVe
         MkL3EWi1BRn1u64rcwTIGcPchZpfQ45PNe38iXEcr5+c7FL5oPXbmSKefFnhxK94K2gC
         +ei4XAYuojRMDWUINkSHiaFJLZpF+1q2Ti2ZQcLYeLMwX2QlKbjHPmoQBry25fqG1ZsF
         sr7LRFJWZw5aa6Ax0YDAlVb0SVoG7yE1fT6QhQDFa7K+5L5G2zzibT1RnsTng7b33ELT
         dcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796974; x=1747401774;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZP0RFWcvqcYymU0Mxq5VI0y3pwjw/JUMrv8IOQZ5U=;
        b=L4z5osesGZCtoa2fOKa9zSycpQHznOMxoFicmVMKS9JgDhsz2l4vivQMWBbRKUhz/y
         ICR29wvfbKE45/1ZlVQsoHkGVSKGyvkWzNxQDRrXkyI5QcmDQThn8KrUPtudPuK2/9P9
         ++i8egQauEDyyJA1eW3sh3HTWHJQsLgRM6zuLkbzDKQF1SvZeuGfYpUf0PlyToG9ZIBR
         Zyhzeh4OyZwmSkCHF1NXQNcTRjOH7gd3tZvKgcXjIbwxMj06on5gEVSJ6mA7NN/mB64p
         WJNskQB5pvBYKD649/BKH9Kqmx0gmW5Byf3yySzoiZ1+jcBWrta/8dVpOaWzfHNhN+ni
         opUw==
X-Gm-Message-State: AOJu0YwwPKZWu+4Q2t84+FXyHPQ6ruZSmfoS0B/2vfr6PdcKF8eWcsEB
	fEjzouVBweWvnmFS+9fcj0U40THY2RO1027jXP8a0Hxt+AbpQJxd
X-Gm-Gg: ASbGncsYjE6M7S+L5Gczby85xpC+sGYg644SF3yNGunhfHlZJhMEy3vfnZga8I4Dnqo
	4DOPXcQe5TfgTdxmFNzRYXg9jHsVoQhsy7AZ+DeLRrxy29BYoXQO1wWNkJe2beH1fJgAsBBHs9w
	3qzAyO/4KQjj0N11xUOPF6/DBS7JG/VrtAeobcergTRiz9DGEE93UjfkRoozJvSlM1J1zZ//4SF
	0j9BfhcAlnZxi2SdJMhblYiUGyfNRPr2Uae/XIZPQ+DaK7wWz826tYGpjAnMjTDyLKbzUwV7GfP
	7M0KymN782JbuFfFk1WWpRD/BZxzPHlF8wggkfdFIaDt+MRkuAkXByZJgeJfKIQj2JNGfvSq30E
	0VYkQjIwUTWJ0DLqQSoVJ
X-Google-Smtp-Source: AGHT+IGxbWsS1epORct2c6lQrwEMJD69ZnjSa+IjNQL3Op2yrKOuY+EYtEmjR7RQ7dnowdIZK9Gieg==
X-Received: by 2002:ad4:5aa5:0:b0:6f4:cbcf:5d46 with SMTP id 6a1803df08f44-6f6e47c345bmr51474076d6.20.1746796974323;
        Fri, 09 May 2025 06:22:54 -0700 (PDT)
Received: from localhost (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39f4689sm13560016d6.28.2025.05.09.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 06:22:53 -0700 (PDT)
Date: Fri, 09 May 2025 09:22:53 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 sgoutham@marvell.com, 
 andrew+netdev@lunn.ch, 
 willemb@google.com
Cc: linux-arm-kernel@lists.infradead.org, 
 netdev@vger.kernel.org, 
 Jason Xing <kernelxing@tencent.com>
Message-ID: <681e01ad26187_2b1da22945c@willemb.c.googlers.com.notmuch>
In-Reply-To: <20250508034433.14408-1-kerneljasonxing@gmail.com>
References: <20250508034433.14408-1-kerneljasonxing@gmail.com>
Subject: Re: [PATCH net-next v2] net: thunder: make tx software timestamp
 independent
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_062256_046261_84BED6C7 
X-CRM114-Status: GOOD (  12.24  )
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

Jason Xing wrote:
> From: Jason Xing <kernelxing@tencent.com>
> 
> skb_tx_timestamp() is used for tx software timestamp enabled by
> SOF_TIMESTAMPING_TX_SOFTWARE while SKBTX_HW_TSTAMP is used for
> SOF_TIMESTAMPING_TX_HARDWARE. As it clearly shows they are different
> timestamps in two dimensions, it's not appropriate to group these two
> together in the if-statement.
> 
> This patch completes three things:
> 1. make the software one standalone. Users are able to set both
> timestamps together with SOF_TIMESTAMPING_OPT_TX_SWHW flag.
> 2. make the software one generated after the hardware timestamp logic to
> avoid generating sw and hw timestamps at one time without
> SOF_TIMESTAMPING_OPT_TX_SWHW being set.
> 3. move the software timestamp call as close to the door bell.
> 
> Signed-off-by: Jason Xing <kernelxing@tencent.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

