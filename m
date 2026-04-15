Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788C4F41980
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=; b=YbozzP4a3pAGamGQhIFaMijXBy
	cth8Ik8JIxFpd/Ll8bucuVWH8/oj2ADI/ZqqoUqNgpGcmvbBhBk+Qgk0X3uaDB4azx05+KN86TZji
	LpHwTQTz6k2sqLne5e4N5UoHeNRYjDs09bn1KprcHhXz5yVRN5tHlbwD0Yck3WQz4VJyJSM5d396+
	+bCMCEOr2WJEPGDADJmBa34qiMHvtitvLDu30nulKbZpiwXuCEEskuBjPc2+gUy29AarSeE1xY39E
	Oi6tHp5Z9MzxasUcL23X27qTbhwQ0Lw9kbbq1tbzMPgZfYiKYueb9qZIgPCDhAyjQl9VS5ylogq6y
	PL1q/k2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwqz-00000000veB-27vz;
	Wed, 15 Apr 2026 09:48:13 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwqx-00000000vdK-32sq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 09:48:13 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-89f1e767f92so52268586d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 02:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776246490; cv=none;
        d=google.com; s=arc-20240605;
        b=WEYgybleb+T3F8OYIJ317yuTND+8JWMx+p9mzc0MTK3xa6WB3uBhDxKwuqDY557KRe
         +cDmEvwXDO3hd1pjDv4GWAid1puL3wAU+RiqRyBh5K18eYGLS7rVMJXF/y3IvNU74xF6
         JvT+zzewkwEK7SojSqd7DrjeF/tI9W0GhrpwG0Rcu27m8naFoWzqhTCzsrR2GGO/GzM2
         lAi6rqb7IVSRTBXVHyGKqZo375YfZmzBLJcOI4NSKBlWDIu/+FP4fiLi2hXvSzABayli
         zJdYjZHoNRdENOa+JdMr2tcBS2Iu5GgYjbUgzgmhcBjn3/0cWKD/VR8OikA6CCqNmaXK
         1+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=;
        fh=zC8DjEQp6kJnvt4xek1HeWH6ia+TM/lGFnfJeqZpagY=;
        b=XWIf8Bj98wQxl7/MtHcFQSnZTNSGlK7jtAdNCduMlwjyOGBw3rdxj5+CZWIFQzJhXN
         1if4Lv/v/GQrt6AQ+w5ZZTaZmUxc865mgGgog7opH3WUE/QrJ+zz2oc0JA0/epgb8+8q
         ULgHgGtno5HNC3vDZADCafHLSqQJU1zCiIqRr57j/J7kksjqsrQcSJIz9uPZAtHhSAhV
         ZkLiRqZjOZ1vo5Hh1YX5Lj3SZMJs3yZUxKVQaTFT6uSCmYQT8ttc2Y8kmefwCHRljTRh
         cCs4gBVh7W2ZIIy5olQgQ7QYBbxk5hJtiLMxxXT1u1p+SdNdG0S4lCIbEvxh6pl7ajNn
         UCTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776246490; x=1776851290; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=;
        b=soIz5LI2qdaTZL42YM8tKmPqIlihjZoqEntCimD2CbslqGrHJHd3go8YDFhrJnJVq4
         rtluUx/SPUutgyNRFcBHE7QhLRedrCHV4UHF3pGUrUDlxFLKbZC3eaV2S+ptoWYs2pZf
         eOIa5jJH9w+pBfVqlRSxbQ8SeZrgoQLbLAXa1ZUE1V0dRuOTICtA7MwW7C1Zfllt8fAf
         LAddbczIqmMORB0CIjJ5mvxmcjQPIYpv8wKMibE6Sx1nLubKw7Wl60yFCLiENRwe2IHm
         0xufsF7HaDA0ZR0bHb1/n0Y8NKCctY0tKEeIRwYz19YAZPGHRvAiSY9ofQztrkmYv3IW
         zqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246490; x=1776851290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=;
        b=Vjc7vXBOkRK+p+cDPxVjFHNkts40duLY1VxUMoDA1nPuscj9UmgjA5Q0q/lsavQ7Mu
         7xElG4anCd+w0roWTKIQWzgQNTQOtVRsISbHTe4HOMsfCX1uR+EdKf9ZU0y1dKhs95SD
         L4eBwoi0TAyZOutHDn2ZG/wWYZIy9ACugaKtKl+Egp3QiD1jlnBSCAhf0JNqkg1wmL9e
         JnW2zR1EGvmuaius+z7jwo7knGgxxP2hER6f+j4Edm3LNNfBLH70UspoDDluFdq9QNkR
         sloHPWZRTAOZjmNZ9IWASf/hJyyiNzloxdrmV5OfN5YP65+tHUUnv7B/wR/Zd0RVxjIc
         jzxg==
X-Forwarded-Encrypted: i=1; AFNElJ+E5Emy4HZ5amC0L2iIYDIgSmdGx5vnXVAl8Dgs0yL57kbfuHWiPYeA6fu18HrAeDG2N6f56aqdNEygHat+tHB/@lists.infradead.org
X-Gm-Message-State: AOJu0YwETaXQaw6ncHq7UOpGnInfz9aFy/hYaI5N7khthH7GxJchxlvE
	fvMKZbodJU9899OQ4qdbPtrF6oN1WISFYHXkN/cOz/u2vaFZtAZR0XTrnrKK8xblpJdRes/ImDi
	/NtruEgGO/7jK3leVdBOLVAikglpLjP8=
X-Gm-Gg: AeBDiev+HTJdE4NdV4u1p2eCH5VxeP96W9UkACyrYkZ7ZjAzCLohmgDYn4W0Ml+oLLe
	ncUEDm3Se7h8yBapg+VMXBUgoya85RRwPXrGMct5f1eqnz3IUj4LTY7YSb8XzDG9O8htVXIIT6M
	ZhPdE/CHilt0n7wGqc0KLyzzV86BvnIt/kGxWktIGUSj5eTATNWAj3ilaGsnN7I/1K2jYMlc5PQ
	r4zuTqnhcpsH0l3uRpgolBxsLQJQVL4EM9fZA5qSgyfEpQ9tfUMwnhhVou8NhKXYA3MRWjlgLE7
	1Xnd7Nf9kkOoQrmM/Mp31zBUaVA=
X-Received: by 2002:a05:6214:2e48:b0:8ac:7616:569c with SMTP id
 6a1803df08f44-8ac861ad3aamr350240316d6.21.1776246489728; Wed, 15 Apr 2026
 02:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org> <abBPufvrG8I8UP69@lore-desk>
In-Reply-To: <abBPufvrG8I8UP69@lore-desk>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 15 Apr 2026 11:47:54 +0200
X-Gm-Features: AQROBzC_3emuWl_zkXPyDwuBn-0k_x9_JCqk9UTd8pYkmyaVmNF-Oazonv_2HuA
Message-ID: <CA+_ehUyfP7bohsSZEbjp-KLxD084NcR+2SmhDNrpoKQE=BiHcQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: airoha: en7581: Enable spi nand controller
 for EN7581 EVB
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_024811_798690_DBCD7261 
X-CRM114-Status: GOOD (  13.52  )
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

Il giorno mar 10 mar 2026 alle ore 18:07 Lorenzo Bianconi
<lorenzo@kernel.org> ha scritto:
>
> > Enable spi controller used for snand memory device for EN7581 evaluation
> > board.
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>
> Hi all,
>
> it seems this patch has been reviewed by AngeloGioacchino, but it has never
> been applied to linux-mediatek tree (or at least I can't find it). It is marked
> as 'New, archived' in patchwork [0]. Am I missing something?
>
> Regards,
> Lorenzo
>
> [0] https://patchwork.kernel.org/project/linux-mediatek/patch/20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org/
>

Hi,

friendly ping here. There are lots of patch with review tag and ACK
also for 7583.

Any chance someone can ping maintainers that take care of picking these patch?
Or someone that can reply on how to handle this? Maybe we need to sync with
them? Lorenzo (and also me) are fully maintaining the Airoha ARM target also on
U-Boot. Also on OpenWrt this target is starting to get traction and is
getting used
there, so Airoha is not considered an abandoned target anymore.

