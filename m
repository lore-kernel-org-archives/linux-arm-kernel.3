Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C632C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9UzD1Ky2bx9uaDef0qVlKrUGPVh+KVmS6RPxnxKCs8=; b=RwsqXVcUI9qTaV4bK2ojw1Vjfr
	HmQZst5G3taS8gqeJ8O/XSpFIibSQ+uUGIslwYrbuvWxZVEOHuvuZZiTJSZJUnzrFz++gQ54hUXpw
	aSIrtYMZ6+PcaivradZsxrOf9EstxycZgUtl0836Y4lfMIyRXG53tyTuzfEofHHizRYjsQLgcwfkX
	i0ngpeTlA96j/J1cmtFkTZjt4P+zuPywv5fBHBq9tEIBHvazZM0xZoIKxEMUzlhcLf4nVmc5F+DCq
	IIq/jX4wx55d0YloRZ6v7r0hhDic4XwUcCs644fdj9H8e2sTRuAC/gNyILnVwrrvKNAGHHbnYhFD+
	8gQ7i7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYso-00000006LoK-0e9P;
	Tue, 18 Mar 2025 15:29:34 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYr6-00000006LfK-0H42
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 15:27:49 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-22409077c06so146448725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 08:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742311667; x=1742916467; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9UzD1Ky2bx9uaDef0qVlKrUGPVh+KVmS6RPxnxKCs8=;
        b=W4ZxjaKrzn6LITV4UyjaSmUjTR9oAzbl7srt0XLXAhINWbGNj+osbdqAUu/NdgqOEG
         ZIKw8efxZtpBjzb7kB1zqrEnRvgtgzV+VtndiutNbiPxzaXyDXNLSZXjf1Bc7r9h669T
         zWXEAMzEy0D/jxPPHjRvu8TZdXZhSyrrtNIwT3WJiLr/l/e2Og7JWawmLdxrYmsxzeNM
         rPwQe55lvbBuJqu6hLNBhodKenbsRHNqagfIFeEYmqYEQ63Nn5xK5hOCfGA9ts1hWR2Q
         KohUZNVv2ndRSpbn0P2CREWC8s40hOk8hC2a4MumXIZ7pswJEwr98iW8hdKKbgGI3bZz
         GQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311667; x=1742916467;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9UzD1Ky2bx9uaDef0qVlKrUGPVh+KVmS6RPxnxKCs8=;
        b=pJNgPBp+jdTfTlh1nvyDJjDgAuJwRZ6/NywE7PgukFGDBD+A8mP2fBIyMt8O8wpP63
         C/m+euM352F+0+cM8LDwrjDodvcqmoNL1sJHTGGAyA1FUOpWoe5/OCaARHx+DgI6SPln
         efaHbay/J2H622LLwBpd80dy04ZNXSMeASNTFWEci532wNYBhsKmIaIk0ZfYUybM9ZMn
         cmNmCifrsa2cmWpdu7TZiDkju907WCze0TWnO9YbX/RubZI85LMeev/l1vA+ot0S8fR2
         Vym6C55Ex3j+WW/B84cMb/oNxnewGVuYx2I7TUSJwJfClFRddJdGCE8k00hq3ky8R9zR
         k/uw==
X-Forwarded-Encrypted: i=1; AJvYcCX8OWWYCHStgwLbs9d6p+BaSAYuDJkNRIi0MOz1Pf46F55cDQCjPtBeiIrupzpUivvSj/D0uQz1JtrWfuLfSsBO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn/H5PUPS/VNTt2gSZPr1yM538+3C8m5+kD7XAXqDoAh7HID1f
	UAhxuNF7J5v+jYvYA1P9C+Tl1PYpHRSLVYhxL98mErXyhAK8L/l5nQJCIhKB+sk=
X-Gm-Gg: ASbGncuGD4CklAhKu7irHBEUj7Q1QRLk7HzUDmOZZfLaNz7mwetVZSfUlN755FM36Vf
	a3NRYKRtBeuRpajwCyBP40t+hFRuysVqucPKRA5N6pSkjBeRxyU51lhD5pI1gujc6a4noVqzeOi
	Ib7ParSovKHSkrdrYLuQZJf9w0dA2/LMknbMTNn7o69sdY3ijnSiKXlQHKw8nImuBvGH1EMlAkU
	d4eqQJ9S0pb0WJKmrrKvBKvhQFtiwJ8zX/E7svNtB+0p0QXvMM5VRcn8bQAOzV0ASAGDqhD4cPv
	7CU8CCfhQ0U2l0//sLriFr4/MN+q9QbVwgvnn9tHB/7k6s0VOCza7g==
X-Google-Smtp-Source: AGHT+IE2D/VJp57Hxl9axDzo6oJNvumHjtvBrJ+oZN2PEHsYJkVXPJxJR8fnVya7s6LHOzxTsDuPTw==
X-Received: by 2002:a17:903:40ce:b0:224:2717:7993 with SMTP id d9443c01a7336-225e0b0ed1dmr230864945ad.45.1742311667265;
        Tue, 18 Mar 2025 08:27:47 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6913sm95848435ad.142.2025.03.18.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:27:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: OMAP1: defconfig updates for v6.15
In-Reply-To: <7hcyefqzt2.fsf@baylibre.com>
References: <7hcyefqzt2.fsf@baylibre.com>
Date: Tue, 18 Mar 2025 08:27:46 -0700
Message-ID: <7h4izqqryl.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_082748_102689_D213C8A2 
X-CRM114-Status: UNSURE (   9.79  )
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

Hi Arnd,

Kevin Hilman <khilman@baylibre.com> writes:

> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.15/soc-signed
>
> for you to fetch changes up to c2a5f8c4f28ffea8c93d10e509c5a6e61172cdca:
>
>   ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP (2025-02-05 16:31:37 -0800)
>
> ----------------------------------------------------------------
> ARM: OMAP1: defconfig updates for v6.15
>
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP

I see now this one was already included in the arm/fixes branch of the
soc tree, so you can igore this PR.

Kevin

