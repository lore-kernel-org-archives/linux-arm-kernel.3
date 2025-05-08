Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054AAC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfaMOjFCxtcOF8MhEpb1KgHLIQZnLvXhrX8KE+Reg/I=; b=p3WGw8yCVy8kMie2rPMs99yT6e
	ZaoERaWdN+SNE4TjCyOdgixoWn6SwstChWvCjVzJnW6YSc04YQ2/vT8hPmFMVau+ghkd5E/tOvE/G
	ooFoiAwOZeJHhizKAGQACnQi5sf8Qhew3iSPzrytQIB0Y/+e9UHEQ7WueQfLuReHGG8uoOffUMOLA
	Q6SHGQSCvJTYW+Hw9NLS2EYyZ6HySSbEnYA8YIBnPW3MgeSYaXqe62JYHcuvcLAzZFayLhIvstWr9
	1Qh/Xl16wj+P05S1a2oUmuuabEXhTDDI4yrp2/oCFRQSugcG3ipXMACbQpJsLc3k0jYZhlW+OK4Iw
	dBUSmdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0fi-00000000ezj-2qt8;
	Thu, 08 May 2025 12:48:18 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0YX-00000000diu-40Rh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:40:55 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5fc003315dcso150539a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746708052; x=1747312852; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfaMOjFCxtcOF8MhEpb1KgHLIQZnLvXhrX8KE+Reg/I=;
        b=Ax1LqiRwuaCPX2MTiHwW/SsYknjRWUub1aG0bxdxi/VOhYG29vKaUgX2dL2VwLk2Nw
         OWuGVBy4RE+f5/l+pUrKreG4Fasb+i7M2XZv5nehOiDFIIR0j244zzBgGR+gJmm0LoM9
         EBIw3C8JM3aVVXfCPCYCugdkyj4KU82umP4TEWMeRgWmnUg8rqM6F0XYXg8zbK2MxC4+
         VmGqpHkvL6ClhaT/0XFR9mYcbg7ZXkpVWub1XUyblECp+uRY/+RKRu9fCLzUCmowkVHE
         UopKDGIKxZwUYrbCsMxWIBWEBONSCqBAZIl0fZdVbqlWcN+LR8s927emMHuIFhlqIdx/
         u/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708052; x=1747312852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfaMOjFCxtcOF8MhEpb1KgHLIQZnLvXhrX8KE+Reg/I=;
        b=OCZXI+4hgunDEKEb2YGQlLGAYrCWryIKFP4zVOWHkooyAtLt0JCHZG+T/5uO1Kk6dx
         Sb4xPHc9bhDhTYnW3pTXnNlev7pXviBxAUKm1lQgaT0C3YPz6+5H87juiCgqQ8hi53Et
         Qy4I2dhS9N6V3ticnRaWcBjnAKd/q5RrTbphRS8mIgH2FalHGM7xww143RpZ7VKJADoH
         hpVoBaGV4sdzj3rZ3bUJpoB1AM1FncH4F4W4TWKwANHGpsDyDfD/+KdSwIlFBsrGEnoz
         M/uSjyiPWZ+EfdIjmiLBsHFetzLaCJdu0DUkKxUXFFjeIB9t3xsogK+3J0wvCTfUkUkP
         mjbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0KibUYVvnqqT4yYLVWUeCWDMzZvJL2d4JFN3ca8whmvWSOyU3g727rv5CZYUrAqiN+P4M/TuEfIZB5Jbj3HCp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxna2e37vR/nAqIwlgym9alSeO86esBweBXXqHGII71M/mwHCQR
	phbvFuZHsjVpizSwvyA+0pkQhWPhUgQW630nTJhLAEObEji2ZcS+
X-Gm-Gg: ASbGncszUwOUP8Cx3RAVWirqLaD5oVHZ2XgIjrKmaX+lmv2u63vW6xgO85C5Idj4Pbb
	qKaARBRdfchyhHfummV2v8cClFkifIe0INSX55nFQCZgZD8RFGaBBkebH3RvZt/Ia5rO3GjUvVU
	YdtAjO7Y7cwPslZEaaj7cdSB/vwhWwsNNPVy2zyeazt7ehCv30c21A02CAeLl+WaEd8e7QYie7w
	+QN9t6J6rTSIcu9iWI222ejlooesOMUsX8Z1c4G/BA7JFe9XhxWNHCyKR4dnNKDpPMH5m7fLEL6
	Tyb6ikF+VRvIwCiCUrgBfbokOtC9
X-Google-Smtp-Source: AGHT+IFmPs/2aiiB0+rhM6F30MuvsarGsibw9G89lQ2xc3LVHmTRux9M5oIqfkwsO5WMCG0k9AZPCw==
X-Received: by 2002:a05:6402:278d:b0:5f9:2a29:543b with SMTP id 4fb4d7f45d1cf-5fbe9e329e6mr2233823a12.5.1746708051532;
        Thu, 08 May 2025 05:40:51 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b70sm11517512a12.29.2025.05.08.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:40:50 -0700 (PDT)
Date: Thu, 8 May 2025 15:40:47 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>, irusskikh@marvell.com,
	andrew+netdev@lunn.ch, bharat@chelsio.com, ayush.sawal@chelsio.com,
	UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, sgoutham@marvell.com, willemb@google.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: Re: [PATCH net-next v1 4/4] net: lan966x: generate software
 timestamp just before the doorbell
Message-ID: <20250508124047.xyhrabkxsbhceujv@skbuf>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
 <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
 <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
 <CAL+tcoBrB05QSTQjcCS7=W3GRTC5MeGoKv=inxtQHPvmYcmVyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL+tcoBrB05QSTQjcCS7=W3GRTC5MeGoKv=inxtQHPvmYcmVyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_054053_992387_69250CF9 
X-CRM114-Status: GOOD (  13.89  )
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

On Thu, May 08, 2025 at 08:22:39PM +0800, Jason Xing wrote:
> Thanks for the kind reply.
> 
> It looks like how to detect depends on how the bpf prog is written?
> Mostly depends on how the writer handles this data part. Even though
> we don't guarantee on how to ask users/admins to write/adjust their
> bpf codes, it's not that convenient for them if this patch is applied,
> to be frank. I'm not pushing you to accept this patch, just curious on
> "how and why". Now I can guess why you're opposed to it....

The BPF program is not user-generated, it is run in the context of the
function you're moving.

skb_tx_timestamp()
-> skb_clone_tx_timestamp()
   -> classify()
      -> ptp_classify_raw()
         -> bpf_prog_run(ptp_insns, skb)

