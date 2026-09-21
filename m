Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1811C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hygh9yjLTAw14bbP362MY2rWRpJP0PkurR+442/BpWU=; b=jGpwjAf+fpLWekcgmRkrufew/5
	5+sVw55MnsbQchPidMY1mkbSwuHr0GiXk9QKEI68jBHrcA03pUJTeCvqnI1dUTw5CibpVsewR+KQW
	cTOxfbDgEpkAZUBSvT3VxZVqCcytU/vAxpwIz4QSqOV8efzMYTtZlMk79yhW5+dw/SHIYwylIcu47
	AS0dXqCT4T3lhnY6hP5+kU9VDAIxtKuNpXYZeNVch/8pHbqlZT5dAEF85DC6tHh4z6N4bU/MsJ4hI
	mY6mDLinOHAtxNiXYUdhXyfw9ooSK2GpaLq1j9e+osvWapxqcoOao8K60kfM3ahV9dP/tWmLifHPg
	bc4tX9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ymq-00000001Fzn-1Dcs;
	Mon, 21 Sep 2026 07:50:04 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ymn-00000001FzL-45Kr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:50:03 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso2624088a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789977001; x=1790581801; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hygh9yjLTAw14bbP362MY2rWRpJP0PkurR+442/BpWU=;
        b=KQoXKOsUazxXqIp2jgcBmAfUNtANLDJ8+Sokfzo6k0BJYiF3vleLns1yrVhL7yIuzd
         aPUg9v1sA17MV1Y2HpCYgNZusd93fpPsBkoCOYT4PfP+wbO+PDlwzhWj68+rtgy6Fdry
         +4M3/IKXBmiJ+uZ6shFQ51mqYi6fvyGJFzdbCfWhZOCqfJEZ7X1XxFnTW19rimWUukAR
         lDzYF+Yoi4T1/FMX9gQqTVVqm4FNUX8R6fFUY8r746hWMp7B5empXVaSIiFnqPr0yvt6
         Ee6THt38mo3A7mVHHQVn2fjX1SXkR85wR1bWGHXKgnr9cPqQC2O1VJuLAiWu92KGvH0l
         IVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977001; x=1790581801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hygh9yjLTAw14bbP362MY2rWRpJP0PkurR+442/BpWU=;
        b=ZRgdJy7Cf9sNvhIUOtL8YzkHURhc8Imc5PrQCaD1hLllsjF7ErOzZ2Eecy/JWOesgM
         /lLOHADYOR53XvV3SiTmF2CsExDxDD5M0fCh0CCv93GMtVgek1zBa6ahWAB0xUdw//2g
         5R+o2i/s7uy3aZxfQibH3dyJkDHq3HLkADIDlW2Ob8yvy0PK2/C29TbnyfQgprCHg2v8
         /ehNxeck2sNIAUgPdPfiayB8M4NWj/Z7RWV8ijG+8p4qqmovMVpxFDX6wOil2BPtx2Ur
         N8/xWf7C/tHCLxWfyb5/Scm6xdLI7yUfn3ejsnNOtuB0ClLG40Ce4VuYalO7Q8vIQv8y
         Sz8g==
X-Forwarded-Encrypted: i=1; AKwUvByL3yqm4MFL8og6/I2Q0WTAKVJ8qBkVfJVGzPLs8LjrC8zc/a6waFQ5SAfYgw1MnyxOcY5b5/cbgsh/UCEm0C88@lists.infradead.org
X-Gm-Message-State: AFuF++m6M6Eq0OWDf9TBI5XMRkxg2mAWOz1jzJhMMQOzbFk/duVi9HSa
	mEA1QMwlz83BaDJMPy+XS++jgUJ/uRI+VUmsNqq5nr8aXZpPrmgNkFYU
X-Gm-Gg: AYBFou3p+rJ2tLFI71un61ijKIHLdhUDU52+UWiF3lVsajvINAYE6KtVstOkDHRCWg8
	BKdDHxZ2/u0R0NuNax1eGAqstXeTCgRIJMgWhMMbQvbqT+HO702XR7RnO4JeYQyJMHCjy1Zrzij
	sEq8y6od4nZuiHdfqESi4g0y8JGulROw1n6SWGeP8TzzySEu/uaTyrJvtj3sLsbdTKa6giOUIY6
	4f1n6kTHH4LQuUxIZa+ZxnaT/LFLxECPKD40QznV48ySNU3/4w52OE6S2tlog5xSb0hApZJ4s0h
	33Oz9FTGmEekG+y9u8GPd72NbisngmgifqePxP1tkxxlRksDbEj1aTXGqyFJknylRuweBJz74Va
	uAfNO+k1gihf+syul1Ab8z349jz6oS1lyF11LJBHRPcH6SeGfw0umGxIMKkHTBADe9LniqQwimd
	Kjsnee++DT+al/Ezob3IC5YO/grvwjPkvknJBjEq5W5bmul12lAPZsUrSVFNVPfiIpquJ4w3IAd
	vNrwRCkXtfp5YDdR6o7xGGgJxHXlu3HXrt4N4VC1yXEWwkpNPvbKtE841+qiRAxfw==
X-Received: by 2002:a17:90a:bd0:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a022be0af7mr5110747a91.2.1789977001038;
        Mon, 21 Sep 2026 00:50:01 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a041b87bfesm5623407a91.3.2026.09.21.00.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:50:00 -0700 (PDT)
Message-ID: <b589c197-2297-42c4-b017-3594cdd1cd56@gmail.com>
Date: Mon, 21 Sep 2026 15:49:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane disable
 clearing FB_EN
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260918030125.315978-1-a0987203069@gmail.com>
 <20260918030125.315978-8-a0987203069@gmail.com>
 <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
 <1d988dfb-c930-4c17-ae77-47b93ff9f159@gmail.com>
 <cb30f57c0ac124aac85efad32626e6182b9f1369.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <cb30f57c0ac124aac85efad32626e6182b9f1369.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_005002_015931_FBC81CA8 
X-CRM114-Status: GOOD (  12.49  )
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


Icenowy Zheng 於 2026/9/21 下午 03:30 寫道:
> Maybe it's better to just make it the 2nd patch in this patchset, just
> after the binding change.
>
> Waiting for something into drm-misc-fixes again will need another fixes
> pull and another RC back merge, which can consume weeks and miss the
> current merging window.
>
> In addition, it's possible that `drm/verisilicon: introduce per-variant
> hardware ops table` also gets backported for a more clean primary plane
> atomic_update disabling fix.
Understood. I'll fold the FB_EN fix in as patch 2, right after the
dt-bindings patch, targeting the current vs_primary_plane.c directly,
so the ops-table patch just carries the already-corrected code forward
into vs_dc8200.c. Agreed that's faster than round-tripping.

On primary_plane_disable_ex - I'll keep the "_ex" suffix. DC8200 still
has a real per-variant operation there (clearing FB_EN + commit), while
DC8000 leaves it NULL and does nothing, so the suffix still reflects
an actual per-variant difference, not just structure introduced by the
refactor.

While testing the cursor plane, I found the same class of bug there:
the disable register write was being triggered from the plane's
atomic_update() invisible-branch using the old plane state to look up
the CRTC/output, which can be stale or NULL on a plane's very first
commit if it's already invisible then. I've fixed it locally by having
atomic_update() derive the CRTC/output from the state it already holds
before checking visibility, instead of falling through to the
old-state-based disable path. Just flagging it here for now -
vs_cursor_plane.c isn't touched by any of my patches.

Thanks.

