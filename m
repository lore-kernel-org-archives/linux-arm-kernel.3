Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284DACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVDXLgZcWUdOJudfln+3132bH3PdmBQDTl58aH5R0jM=; b=zC2sKv571Cm3maMX4K/g+XmsrY
	C9Voqyehw10oS7LdV/iVWUJInWtDKI+sIfN4E41iavTfxiXvVkW89HzSSsVD8mYpBxxGBb1VEd919
	AGbYG/rTNXfx0zOrUvcvx6nEmp7UI2pexSEuL+WTnNxZ9riqxvA2/2gmK2bukw7F1RMzuVkqRzpwp
	EX5J455YJc1qKBGx7vQIsfqu5tLXXKEO4id8CURfQZfUmq00YpO7+XsKMO9OEevRQEZIY2pjPOSKd
	x28yyp/+76NOci9Amic4iuLasVxS3QWhdNr2Om34y5k13LwiGtcCsff7bHCKfGJSYxVkX4bTgAbbg
	m8NphkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPg3y-00000004Z6d-3P0I;
	Wed, 20 May 2026 12:30:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPg3v-00000004Z6B-146T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 12:30:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43d75312379so3972876f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 05:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779280209; cv=none;
        d=google.com; s=arc-20240605;
        b=NNzRGDhc5yN8Ve0fEaPXGXXsSIIbVAtYZachAbm0g0dXHfAuNd4kjAsZVfKGg0NZ0J
         Wl6LpdgiF64HT6gbsiLL85dV2HeaBBX7B9suf9wZW2EuqpyR/DckcBpJOPC74yUXVWGJ
         m9h9ROxmcOXu75xs9inaN5qTAXwqbg0vEUp9fULNqqaHXo/dPDOhIKCbyszKJqbC5kYh
         r759peyoYnTmUn2evyyq6Rk5Q5jc00clb2lvuMr1An9CwlLpeBPmAT3sp0V8y9u7VNK6
         KjAqEqsX4xA2mdlAc0igM3ZE8vwpCrbk6SGxXh4nPm7H4BcTJySkjiQ891MUSsngpvwb
         AXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RVDXLgZcWUdOJudfln+3132bH3PdmBQDTl58aH5R0jM=;
        fh=MJg9ZQAHbJKH3GdnqpQ31Y4EkbliEwO9K6f0kGHTeLI=;
        b=ZqzyYUcTtrcuxpx6LnpMD/98JFBqcYvZGecgwoKKHeP2m55aX6b/fp7/KagNAvW2xG
         7IVO/czpp3rqKSUupvjF8qGkI6VbTe2CChbXpW0XHFnhAgfffX9HYTIe6UruEGYMUHGM
         27lZSPkOoi/jXgJ5n6K1/l26QpKRHx64l4drgWOaZK8on3Ojp5jHthDX0x4KAanl2ktq
         aYQNm/IclcZ9eofNn2bGSIfwcObY0tF2mHqeFgGdQDnCbft2BOkKlmbCKW064lxdSkN1
         pYWu47xdTSv/izeyb5JUqAzdDpBD6fSoBSZbHz8YuHG9RLXbrYT3snzRPeUu73/7tPl0
         HKMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779280209; x=1779885009; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVDXLgZcWUdOJudfln+3132bH3PdmBQDTl58aH5R0jM=;
        b=JxOQPZAdmVhbKkvbORzHpofofVEHEuV25jhYzEzgF7aLy80OhR6OhKyzcjteGnj2/0
         1zFUP4yVARvsOFwAG4QPNcqLfpFp1JwjeYq7YN0KSgi0YrJhKvN+XHVyshcpUcPvRczy
         bC9GPcnI0do2nVOqN+kXkTefdnsmH+TM2Y/0WVVV+scJckaOo8Y2OqWXUrLdJD8xWCK0
         TXtpTADdf0evD5hIhjcm8z7V5O4tn7BMwKD9tF72YwCSm/vo0pNlpgLLsS7FEs8CO3hr
         uDh8fawQYuR4YYMMihdH6hhpvktpp2KdyPF6DkPA1s/+4YFf+JRVrGfXl9tUFXlrj9hT
         A2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280209; x=1779885009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RVDXLgZcWUdOJudfln+3132bH3PdmBQDTl58aH5R0jM=;
        b=PhLseazLRGu45q/vFvd83vv3WoGR2tmw0gcIKGkqkANRLqkbarJZGOMp013Ab0wYVn
         FgBU0Gf3F2DkCviFI/80oKmAO2X0iC7k8EcLVIslcihrxOvoRz5DPAkyNkk5H/d8SsUi
         iiIdF1jDaKqlV7KbvMrGFGnWsNmwjBVmrELNAJfX/tTM0CrZfZ6P7CjCqwVsV9hc+ArB
         kjyezvWSupoSBAGwjybsngDoPbaXfiURIX57zW/B8l2AXC4V4oycjwyf46+0ZaT3+fSO
         Mp79c2qiBTRPpPCpzwCJVt7X0d7g7nO4TKeDRlGJkeLOAJRzHytIK4kPVn8XHC0k9vZV
         U8mw==
X-Forwarded-Encrypted: i=1; AFNElJ96EV/tEMG/r9GdKPslEARg0nnIo56OI/rQHHBpy1fJAxDrbvdIXxuS4jwnbNtqTF0lSY1bnXAKAhF5IwFa1xvb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ZXgTd1AwlvpjMfLwYJxHPNYv/nvnwJLShyB8QXtPgx+3S/jl
	PlgmiKVT36d+4fugytaPzQmlMMugP0FqKVC6fpBM8TdXobh4jRNjSSf0Ngk3AxZuWgXAE0P8usx
	hxk1aZByKwufLj7R9y+VHsduVeUTubFY=
X-Gm-Gg: Acq92OG1ftFyj+fqGa5wWXJsiAgNENf595ApKoF/8BPuOieqHhrhQhGexJH3iHGqsJl
	J8EOEnEDr4nHQ0KviI25pPyPufQDIPbwhaMugA+PKXYjKSoDDHpspUVE8ujZSPMA9UFPrLvMmCo
	zuxiR/dY/FOxUKQZTToSAMnTcjQgoRb4koqheg6J0BG1C4UHmXW99J2RrvEwEMci5CTmpYLs064
	B2iLuA73C8hzojJH0u4S7U2Ybs+j/JTuHRR1/lwZwXqua15a65OKMxyCsgz/ojWjBSzR9BzUmuH
	uQmn6i60LBCnCmteUOo=
X-Received: by 2002:a05:6000:1885:b0:45e:88f5:cd01 with SMTP id
 ffacd0b85a97d-45e88f5cf39mr11767823f8f.24.1779280209043; Wed, 20 May 2026
 05:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com> <20260519131738.11a78ba88e1be28ba5cb26eb@linux-foundation.org>
In-Reply-To: <20260519131738.11a78ba88e1be28ba5cb26eb@linux-foundation.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Wed, 20 May 2026 20:29:57 +0800
X-Gm-Features: AVHnY4JRofC4Z9W1Vip22g--k2HQT2-LeN--T0Ui5FZTEy2X-VIsk0rnAhQpIDg
Message-ID: <CAHKocdHVDhGAP=DXiYW5tF+3cjBR48=x6YFhCpFARjtt6fjstg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com, baohua@kernel.org, 
	Xueyuan.chen21@gmail.com, dev.jain@arm.com, rppt@kernel.org, david@kernel.org, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com, 
	linux-kernel@vger.kernel.org, Wen Jiang <jiangwen6@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_053012_403075_ED5D2A16 
X-CRM114-Status: GOOD (  15.90  )
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

Hi Andrew,

I've reviewed all the Sashiko findings:

- Patch 2 (fls() truncation risk): Will fix. Replace fls() with
  __fls() to accept unsigned long directly.

- Patch 4 (nr overflow risk): Pre-existing type choice.

- Patch 4 (missing NULL check before page_to_phys): Will fix.
  Add defensive checks consistent with vmap_pages_pte_range().

- Patch 5 (flush_cache_vmap with empty range): Valid point. Will
  save the original start address and use it for the final flush.

- Patch 5 (virtual address alignment not checked): Addressed by
  Patch 6 in this series.

- Patch 6 (caller tracking loss and while(1) loop): Valid point.
  Will pass caller as a parameter and restructure per Uladzislau's
  suggestion to replace while(1) with explicit sequential attempts.

- Patch 7 (partial cache flush on early break): Same root cause as
  the Patch 5 flush issue.

Will resend V3 shortly.

Thanks,
Wen

On Wed, 20 May 2026 at 04:17, Andrew Morton <akpm@linux-foundation.org> wro=
te:
>
> On Thu, 14 May 2026 17:41:01 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> w=
rote:
>
> > This patchset accelerates ioremap, vmalloc, and vmap when the memory
> > is physically fully or partially contiguous.
> >
> > ...
> >
> > On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
> > the performance CPUfreq policy enabled, benchmark results:
> >
> > * ioremap(1 MB): 1.35=C3=97 faster (3407 ns -> 2526 ns)
> > * vmalloc(1 MB) mapping time (excluding allocation) with
> >   VM_ALLOW_HUGE_VMAP: 1.42=C3=97 faster (5.00 us -> 3.53us)
> > * vmap(100MB) with order-8 pages: 8.3=C3=97 faster (1235 us -> 149 us)
>
> Nice.
>
> AI review found a bunch of things to ask about:
>         https://sashiko.dev/#/patchset/20260514094108.2016201-1-jiangwen6=
@xiaomi.com
>
> It doesn't appear that you'll be getting any more review on this
> series, so please check the above questions and resend?
>

