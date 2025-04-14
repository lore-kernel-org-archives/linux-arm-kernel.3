Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4C7C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 22:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jliqBof10kGvn2stsr88DwEv0qVbyZTOfc56zdJieWM=; b=zT4pjuDytQfIvwnOg0MVPdBve/
	gxX8kyYVMqHx7OHG6GpTaDyegq+9iNOZjZuHxLm0Q7wa+ajCNOFYwhVASp8dO9VExXqoqGKysumBo
	xzx+PgXNapbywO7hIwnqZ3xeLvxEpQfG75JeN2ZF98lIlUPaO9Lzl8zaSAS5pMGI7aBQIhXVj8KeB
	mKJSRS1/Ev+15/wje4g+KC2jJsej7q6HrnBK9BoZY9KK6u0JlBBJqD/0zJQcVJx+yVT2IEIbNlcJV
	CahoM9UMXL9nWBSkgRKKXDEtx+8oEgABKUxcrIEKNhsIXyXgy43tynY5SuV1NTBPmrSoN5bCgL32W
	25gZs6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Rxv-00000003g4f-1ccg;
	Mon, 14 Apr 2025 22:07:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RaN-00000003ayL-2V2Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 21:43:25 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1582a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 14:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744667001; x=1745271801; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jliqBof10kGvn2stsr88DwEv0qVbyZTOfc56zdJieWM=;
        b=h3jzmJpCBGnAcg8yU5ROpOwObbXFmbEGiRtdfV5drv8Q3rLQp4efcL/rOGfG2ph2/F
         cmF1lEFhS7JtpjHC5M1WgFBqbD/3S2KCpDi/RRJNs3KzFE7n7D4hLcrytT3u9f34ASyA
         SA2GtEy8T4Nvs0xQfQs1LhfjiRpTlXSLgJJC/IWqNyS8bD2jGCNSIbNvqI/316VyF6IF
         Au2Le65KCY74LFBt/x7hGJTHAAhBRPAwHATxeLo299O4IqZQtV746w5BRmYRQQ+JgNBT
         zJFvxc4p6620tPV6h/8BHF1a4Lx6TRXtgpE8qrJNMmFRhh62pJYv0bvS0P+xOIe4+2VQ
         vNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744667001; x=1745271801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jliqBof10kGvn2stsr88DwEv0qVbyZTOfc56zdJieWM=;
        b=RYaM9iIeoqz+tVIg5joD+ACQZq1pqDtSJvgVqQjrJ+Kvn2btIqbyoY+KPCWXddXfJ0
         oqjyUlJu3ao1NkL4An7YF9ncwC7Jb4XYYLOSWX19vuRdEzb2RLkLQa2epuk17e1Y6bMe
         34e+FeDw0FgcQCG45EAiehRPdrpnq0F8zJRF6mPm2orTHJeNw+Kpj53kzeJFGzL27C++
         dbqygpOttghgyoOYNEOcrdyNBSNhWiSROCjnqGA4Vtj4B0uRFERSgFXj8Qm27A0TN9+I
         kbJHwlVb5mL3JQbRiTACrhHylrAiWxTcpA+OK2awQvtuRClO4TBBC2S4rF5yiQq5hpRf
         9cqA==
X-Forwarded-Encrypted: i=1; AJvYcCXKun0KcSzrtAMj8BsdZGB09fG+1eoWlHZ8GqMgQuBbC78fOjj4u5ae9+cfb2xjfePuCeDxmgpMIwgYqiVvA5aB@lists.infradead.org
X-Gm-Message-State: AOJu0YxTe8Wk0IlqMouYL2a/p5YoT59P9JvgNjk5xES74g9SNjQ8W8Zv
	Bp0KA8/jV5sz7fFI0pMWmFRomDDmKkUZuXhtcLEOEs//B5ZUeatnZD47Bo2nee5YMbuoLAbnTZP
	idhQjcw93yRXH6kd0TlEk+aecvQaU5HmEpgvq
X-Gm-Gg: ASbGncsDt4UxbcRUaiLtSlF8VbTyLW9I98WjbdukUoDr5vcEO0Cbpt5gF8+WdvGMBiU
	WZaJzurefaQdEeKIe7iuAWAAizPLbphc59bYNwbyPc8TNelIb1ryxOufqGaIQHicyMyiKKYdK0Z
	GBt2n845mOPmfFQ5vf88WOzkTue4IYCA==
X-Google-Smtp-Source: AGHT+IF5jEV8t9GKXR37hi1efKrfDy4gSlcsUnWqdZfoa8G3x5RlMK5uNSj4O9wpiMQjxd5mc1NgLS1WEEc6drcdrik=
X-Received: by 2002:a05:6402:1cac:b0:5de:c832:89ad with SMTP id
 4fb4d7f45d1cf-5f461612fcemr15338a12.6.1744667000732; Mon, 14 Apr 2025
 14:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250310222942.1988975-5-samitolvanen@google.com> <1744624410-471661-1-git-send-email-huangdao1@oppo.com>
In-Reply-To: <1744624410-471661-1-git-send-email-huangdao1@oppo.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Apr 2025 14:42:44 -0700
X-Gm-Features: ATxdqUF8Q8A-bzpJY7EigqAvtM5EQ-PQqm5e98cbBX9TPkbAF9oeXUHfstec0l4
Message-ID: <CABCJKufDbYVAMi23aF=+daNkZa-8YHOoZfnLGtZ4qCG3EzJtCw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v8 1/2] cfi: add C CFI type macro
To: Dao Huang <huangdao1@oppo.com>
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	catalin.marinas@arm.com, daniel@iogearbox.net, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, mbland@motorola.com, puranjay12@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144323_630645_B4676113 
X-CRM114-Status: UNSURE (   8.77  )
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

Hi,

On Mon, Apr 14, 2025 at 2:54=E2=80=AFAM Dao Huang <huangdao1@oppo.com> wrot=
e:
>
> we oppo team have tested this patch on Mediatek DX-5(arm64)
> with a kernel based on android-16(kernel-6.12). It has been running
> fine for a week on both machines.

Great, thanks for testing! Can we add your Tested-by tag to the patches?

Sami

