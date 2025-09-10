Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A4BCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 21:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=; b=LQdLZnwRK02Lh3isET27G7l59G
	jCl5VnejLZ2pa7RYxOQZeoR2DXyBXdk/oUiyfGTxgnd/foTW0O78Kv7Do7u0VLVwsHFmjm4qvtXjE
	/TDOs48/hgKclmB2hw0AxX1O8XBrt9hmgdVW3XiLX7HGIptbomkWZyH49bczCyNqCbJIcy0Y3nJ3n
	QcynqDFyuOJA0xXcBSQNwAjUc1BG1aqYSSOUdXf18EVJl+8e7/fEFtTgVs1y/50Lujcb6SWBtewXM
	leTETpSdfWIL9baseKlY7+/cSC8E1ttblS0XYoebsd7+HbJhcxIl9dNob0i71yJ6S3y0KaUpTW8Am
	odpico4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSnZ-0000000GyIx-2LRF;
	Wed, 10 Sep 2025 21:56:17 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSnX-0000000GyHn-0fBS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 21:56:16 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-625e1ef08eeso83114a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757541373; x=1758146173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
        b=Pdh2dhnfdxXoiCkEpxnEXoMaGYNHIPginRvqZ7PirX2g/SmKTZKGT/LqcgMJqjLAJi
         oO8aiheF5gNFDJeXjADRs/n0OSyK7HXt59SMewzUxIorBG9kNXJiFoyB3REKOAaM2uVN
         NIzuc+JstRqHiQkKir3RdFvvb8+25dzd2EWGVC87tIwC091YDos/EbquTl/CCMQRrX77
         4+H2kXvLmToc+fZC75TxKmcw6CI+Judq1QFgfzE5l3T+EIpXkGNAOWRAlS/+l9dtOAPC
         WxIxFfmWKt9dlaGSkYsAPD+w35Gjn2l5PDc/OZKutcCsc4E7P81DZGSzxxNWEu+bKw0M
         NLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541373; x=1758146173;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
        b=YDFphtVDQ/HxsFdYoyYlUeAh8qGsnT1AmcAPBjij1/qFqubvFYcMt2enthV52Mkp4y
         SBX1jTGbVJTAhmFjCv9xF4YdQR75Q40kpIChb6LT3PRTIFMtFYKDQDB2A95mIRgk9IeW
         JHqKeCnydOy4sRtwnQkz8wCt/aFt4b7fJ0+353Pu9BT0oprTGYcPXB5Bivl9aRF3aK3g
         AgV+1ljqKTWeJ4GCL7Oa4aA0ynnJECpMLQzU83pAIrqS7JaAwwaQWkJzD9bNIpLpileL
         bDencZmnRWBoev3YtvAZXMNy4OUyq7ZV9vxJ62XmSJCGF9g1pJHpyDwLj3xDmBtPMfsN
         XOYA==
X-Forwarded-Encrypted: i=1; AJvYcCX9RnXQ0U8QhhkR9vPWnKxPxhXncNava7/ci2RGVN1o+sB7umX/ZTfvicX+J26Uv4HlmfzxjG00U92ymel2ut0P@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ562vwqMzMxCUDp8LwIl7+b6sc1mmealWr+gS7wAGBzQxFUb3
	95+npulIFTHxN9t1vHr9dVcMuEd/5x99CAxCW+Hb2vaQZl+lFQ8S77BV
X-Gm-Gg: ASbGnct4VY4y0vR5HyE9bcgP05dUJAA4Ksudkbm6xtw85w9ZH9ptPxs/4MvXxaCKV8B
	txTFpqEcb1qewCe+c4Dtzhf0k0QAQ4OtJoGm0Bv/ImaP+P9b7f97ZJDsi/6EP0pJjn4Cs+WYYfC
	pUuo3ix4tHxBPSvr2wR6l5ZV2HRGxe2EAcChD3YhZVDj1L5ichKTFY/mNj/182vxmR/jIGx6EBF
	yL1S1wTeobzgX3PNrIrPqu+sDOYD8qqUpbWJ+QflCEvlNUlRrflXhhesot80CdlsnfbbC+n+ADf
	94kLvtYbeytq3VbGJNorDOi045Ho9xaj3xg6I2b2lCYlpU4uTDcB66s0stWs/SEUnXuxX1AXMHZ
	AogMukbqTPu80Vs+KIE40pmOeqbrvnaXuCADMDVRMg8//kgp5caizEWkMyjBtqYiLDd43vwxKYw
	JngSwhTPA=
X-Google-Smtp-Source: AGHT+IGBsR+U1n4WFqO8g+vB4ERFu4ybrDNCTovC+1KY6W1/R7uSZEcXa89aKrlY6FwBWGiHJP9Ndw==
X-Received: by 2002:a05:6402:50d2:b0:629:c417:ee5c with SMTP id 4fb4d7f45d1cf-629c417f146mr10662130a12.32.1757541373118;
        Wed, 10 Sep 2025 14:56:13 -0700 (PDT)
Received: from [192.168.0.51] (217-62-96-139.cable.dynamic.v4.ziggo.nl. [217.62.96.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ebfe0ac03sm69476a12.16.2025.09.10.14.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 14:56:12 -0700 (PDT)
Message-ID: <1206e86e-488c-4c58-9e67-2313a678a5a0@gmail.com>
Date: Wed, 10 Sep 2025 23:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: richard@nod.at
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 alexander.sverdlin@gmail.com, andreas@gaisler.com, ankur.a.arora@oracle.com,
 arnd@arndb.de, chester.a.unal@arinc9.com, christophe.leroy@csgroup.eu,
 dave@sr71.net, david@redhat.com, geert+renesas@glider.be, heiko@sntech.de,
 imx@lists.linux.dev, ira.weiny@intel.com, ksummit@lists.linux.dev,
 l.stach@pengutronix.de, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com, nm@ti.com,
 rppt@kernel.org, sergio.paracuellos@gmail.com, surenb@google.com,
 vbabka@suse.cz, willy@infradead.org
References: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Herman?= <rene.herman@gmail.com>
In-Reply-To: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_145615_210341_2FB54F7E 
X-CRM114-Status: UNSURE (   8.43  )
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

> In the past I saw that programs such as the Java Runtime (JRE) ran
> into address space limitations due to a 2G/2G split on embedded
> systems. Reverting to a 3G/1G split fixed the problems.
Believe you guys are talking specifically ARM so FWIW, but I remember 
for x86 that at least initially Wine and things such as VMware were 
affected by the more creative PAGE_OFFSET choices.

Both will have been as a matter of plain bugs and are supposedly long 
fixed (and I in fact believe I recall such fixing for VMware). Never had 
or as far as I recall heard of other issues back then.

Rene.

