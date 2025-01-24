Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B62DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 12:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8iXRUajdsrMRbaddd2Fj3z0NrBTrdrHV4nnZ8KPUYE=; b=JkA+QFcc2/Mg1lGY9SPjN0aCNa
	lvhfx3qQb8QopQZ0bnVUOQZXTNzNuyCFprJOFWeCxDVF/HHJiCJ9Ffdt6aIdyvFrRVcRwZtyHQH7J
	4d1QvBpnfUj7qiDal5PWMq9EqCS6BUMBBGPoxTLhANhW3t2vxX5ZbmcA2wczJJIr8uHTLj1TOFWcT
	GkgU9nHvwLItHND3Mmp30LNUb1VPIfAjvpgE0tiiOWtC+4aR8sgEiIqs0spBKdrlCIVtQDMUvAMmX
	rddj+iLj7ym47HQp1wW7Q80325MV1VwtyClp/SojnzpMlLCfuYhf4e4N8rqoFXDAvqsc53KS9Pig0
	GGKBfARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbIW1-0000000EcvX-1fr0;
	Fri, 24 Jan 2025 12:10:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbIUg-0000000Ecpf-3Unz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 12:09:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso12834215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 04:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737720540; x=1738325340; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g8iXRUajdsrMRbaddd2Fj3z0NrBTrdrHV4nnZ8KPUYE=;
        b=ntvWVDbPo4S8IH4oKhtuYnVd37xmpfOa3hDRAGe4En4xwS7qh3+BlEqxREkgnO8XGS
         YqGItzcF4M6rYzDQIccECWjLxro2VNR1xht0q9wWECCz6nfUi/G7VTMNYlBqpAl7MwYu
         Dq20lI+ciaEAUuNM7zaDDqmDlxGHnHpC4kNGdbluMO6kVbGY8Mtc+fcMd4/h7rB8JQ7e
         m2QY6wsqjtntlIwfh9gx9JmdTF1pYU1DjHLQAFh3Mc/7vAamYcHLSwIxa4k9mAqMFgVE
         fuB98xxU3OIC292FzYwWqj2ivwXQ3cR5uAyOjwzog5SAew/3ySB9cA0+FkMaNFLKjpjE
         BGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737720540; x=1738325340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8iXRUajdsrMRbaddd2Fj3z0NrBTrdrHV4nnZ8KPUYE=;
        b=d4SiZiinZHnMmfSjdTs/BD5N7LX4rPgC3I8pkrvufdvrarGzXb8ZZ8cVH8bkyEo2PN
         qPzFpR+XtFQrMt2ovcuhjaJKX7LfCrOI5vx4ZOzBK5xpc6Ia99BGBdFRVKaW4JFwYDCP
         k25oygz9z5FTj9GUCFW8AcOrvj1yJfKFFtnZ5o8jR6gt2uyfp3Bqzbfx6JUuDdHRa2ZE
         Au/V/w4rUhbTRgsmVva6PvxQ3D3oUAshRM++RpkNWxzWCXBROt68VcSjrHc6V++oRXJn
         7Hw/4ZjrFv6HxIE2oD+jFmskXDS7ElOvqfBAvnhpdMtuThD4Guqw5MjnlDu1mYWbNbHx
         Queg==
X-Gm-Message-State: AOJu0Yw+Ewpzy+BMjyDTU2CpeGTUiYk5SoqRd02vqR7pSso0CJpssS3K
	g0Wq29M77ktqRCsdjBLVwY5/O61DAOSX7ltcC3MVuDUONnuSRme9SoDPTr/aMak=
X-Gm-Gg: ASbGncvEzMYzpDEKOPytWLmtxX7NsLyI7dpNQnB3Utk7wKfl1VYWrgFU1YdQIPOhNW2
	UzGVqjjsGAw+0vVVIfXMhqK7DeaJ33b0OzZeHnjENJ3+cRHaG7fVXCqbJpa3TocQh65JCPOdivJ
	kgm4SL2mU4/GHAUkeHOTO6ttNBQfDQb/gox0NL3TdS9Wp5ORBwejjrTmH/5r8fNvwyPQmwTFaNm
	CgfXbsJZRo0WtBD92jmpLDJThVuPGSdlhy7x3BjmETfIInQMZMXj7dU0sBQ4jbUTsP8BXy9aFWb
	XoqkI3/KFQNJT3o=
X-Google-Smtp-Source: AGHT+IHOVyv4rF1Ie9u8PD45exHzGa60S5mXYDhT21RSV9wThybLuUYDNdK3QGFTrCOWKSuQcJXjJw==
X-Received: by 2002:adf:ee0a:0:b0:386:380d:2cac with SMTP id ffacd0b85a97d-38bf566c309mr21561411f8f.26.1737720540517;
        Fri, 24 Jan 2025 04:09:00 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6b2sm2566833f8f.34.2025.01.24.04.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 04:09:00 -0800 (PST)
Message-ID: <da7dcddb-d407-41b2-8343-a0ec21914606@linaro.org>
Date: Fri, 24 Jan 2025 12:08:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/8] Coresight for Kernel panic and watchdog reset
To: Linu Cherian <lcherian@marvell.com>, suzuki.poulose@arm.com,
 mike.leach@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 devicetree@vger.kernel.org, sgoutham@marvell.com, gcherian@marvell.com
References: <20241216053014.3427909-1-lcherian@marvell.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241216053014.3427909-1-lcherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_040902_888830_8F12EB3F 
X-CRM114-Status: GOOD (  20.20  )
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



On 16/12/2024 5:30 am, Linu Cherian wrote:
> This patch series is rebased on coresight-next-v6.12.rc4
> 
> * Patches 1 & 2 adds support for allocation of trace buffer pages from
>    reserved RAM
> * Patches 3 & 4 adds support for saving metadata at the time of kernel panic
> * Patch 5 adds support for reading trace data captured at the time of panic
> * Patches 6 & 7 adds support for disabling coresight blocks at the time of panic
> * Patch 8: Gives the full description about this feature as part of documentation
> 
> v12 is posted here,
> https://lore.kernel.org/linux-arm-kernel/20241129084714.3057080-1-lcherian@marvell.com/
> 
> Changelog from v12:
> * Fixed wrong buffer pointer passed to coresigh_insert_barrier_packet
> * tmc_read_prepare/unprepare_crashdata need to be called only once and
>    hence removed from read path and added to tmc_probe
> * tmc_read_prepare_crashdata renamed to tmc_prepare_crashdata and
>    avoid taking locks  as its moved to probe function.
> * Introduced read status flag, "reading" specific to reserved buffer to keep the
>    reserved buffer reading independent of the regular buffer.
> * open/release ops for reserved buffer has to take care only about the
>    set/unset the "reading" status flag as the reserved buffer is prepared
>    during the probe time itself.
> * Few other trivial changes
> 

Hi Linu,

I tested that decoding a crash dump of ETM1 (trace ID 17) from panic 
kernel works:

   $ ./ptm2human -i cstrace.bin

   ...
   There is no valid data in the stream of ID 16
   Decode trace stream of ID 17
   Syncing the trace stream...
   Decoding the trace stream...
   instruction addr at 0x140c9afc, ARM state, secure state,
   ...

I noticed that once in the panic kernel Coresight becomes unusable, and 
the Perf Coresight tests fail, with no obvious way to reset it other 
than a cold boot:

  $ perf record -e cs_etm//u -- true
  $ perf report -D | grep AUX
  ...
  AUX data lost 27 times out of 27!
  ...

I didn't debug it yet. I thought it might be something to do with the 
RESRV buffer mode, but it doesn't look like that should be the case from 
the code. Perhaps its the claim tags and coresight_is_claimed_any() 
lingering, so it's not really an issue that's introduced by this change?

Thanks
James


