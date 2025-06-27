Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8220BC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 05:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEyVocKnMCps8xWL9t4dI9N+dVYbiLKomAWOYOvHcuE=; b=hzXPD4JwFC8TnKRlIuXer3T1ik
	oR/To8EOAXk4LuTvb5Sf7nTd4Ig0+m4q1atZc3TGlqdscQ9R7pEJLrbYzhxcSq9quixBXVN4vsmPy
	SoZzCAcEdcU3mqTZK88d0PWSnOBCjAzblIel8y7x/zvs02kKt7jMfu6UtV9UPHnolxXBQ2grLDyjt
	ELiz+8H3/YH6rnqLLyYqmL5MVbQEiLcBcZUoWU1nAgnZh3rqo2yjqhmvxB2Lm9xyJ30/BWEyRLxHB
	WsAKFjYmtz8xfXMLkBbv9WdsYyaxuSxHjLdxIcF6R14EZRCHuCb4xlYMcNELAPVDGBVqk6dkVZ5nj
	oGjOjzhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV1Lb-0000000Dbo2-0VQd;
	Fri, 27 Jun 2025 05:09:59 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV1EO-0000000Db4q-2MgI;
	Fri, 27 Jun 2025 05:02:33 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-531466622beso506976e0c.1;
        Thu, 26 Jun 2025 22:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751000551; x=1751605351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEyVocKnMCps8xWL9t4dI9N+dVYbiLKomAWOYOvHcuE=;
        b=LSWLbCfVo7Bf6xGHv2ogcUhqINnQRIqP+c45U6g18Di/J8G78VJEAa/jHDd3jLQtxU
         Y+KirD0+dAaMYJjZ9DmjUSz6uTqOYyOeEp4RIEGY8LjnI0Cf/Qk9V4Lh23w48lCkkZhe
         Du5PfHdJqyvlusIMVVUyElyFO1Js2M9PUJYGt2mJPMlFtDl8ICeHzLdFQh98Ws7hx2V8
         Q0OoH3jZ4STOSu5kfs/wkN2eQYvjTiLhPdGb85qHWZo3l15Lpt4VkLbntDFK9/jhunEY
         OFWz+UijYdM9lMBdKOHI8Y59VkDWI3Xwns87bTeU37lMjX3S5XvtDRPTqQzXTR7P2RLK
         6KJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000551; x=1751605351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEyVocKnMCps8xWL9t4dI9N+dVYbiLKomAWOYOvHcuE=;
        b=dxQVXBsl6Eq03Dzu4Z2n+FgAzx1edohy1gmYKe9Led5DFJZi6MBtB122LbhWSLDTo6
         0v5D0WFPVV7ZDOyh2HL+h/JcADGaL8soAuIXH3guk46y//oABLzNaNpKeeevIYYbH+T6
         bpjYcOKnk5xTxSJ3fktZeJy66jOj/lLyRT5JAAGB7lYA3rEXMhMWiSF5JzJTGFNLef0D
         r4ib+HgVHUKlaQT+8W/UvwyiaSCqLGhVrmRZUMPJT5UEgMqUfjOmMwBapGc5aiINUuqt
         1x+EwUCLILL9MPLXJXKaOTyArJzLK1/Mb0dyytDGtz1+3pDYo0t9wK8HA2S0BHHq3d0u
         LrpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9JsST5ZQeCYhR2VpgKAQawlEN53v/KqveNTK/FaJnEpOcO4gUcW5IBKm8enSNuFovWWg2PwrFwGX9BDo=@lists.infradead.org, AJvYcCWrdYmcGqc6h7iwoRVhkPzWMeJnYjaUnvKzF0N970ON2N6pReomJswI6BfAzPaOMDhQlQTW1SkYJz5vKW4K1Ha1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3sI/OVv1oG6fu8ZIjZbS7YyKXlKr6doJ3Pcfn3fzXra2CyXSe
	7jrDRtpOWBrDE+m/N3QZ7nfQ9BWVWnoHogAkV+IFPMeK8rlmDN9lGzxTZGI3QcHqqyuLcpTdmlH
	GAJuGZDwtld2ChZp3OZ6mEjq/EhOFvW2SSqh9
X-Gm-Gg: ASbGncs4BtqxIMfeyhwT0YtIRwfPnyre5LeiDcQM/xHm5NS78ZHGKJYHgcLB8MSJ9mT
	S6mXeXKvJZJiwzhptYgUMhG21murEGLNB0vBdOIhV4gXL/qQp95rarPejy4IAotEQXNsjg4r5BR
	pgv8L7L616XL5+IRTIcCWJ5+YexNDW/Puw5YwVPu2nKPM=
X-Google-Smtp-Source: AGHT+IEvQnJ4QRqSGP2qB52UDJLc95vE2WmXbirVa0pHP16TPMhIb8u9XNfVSz15xZVnzrhavxHSi3E8vgSvANL5nrA=
X-Received: by 2002:a05:6102:149e:b0:4ec:c50c:399f with SMTP id
 ada2fe7eead31-4ee4f692664mr1810518137.11.1751000551372; Thu, 26 Jun 2025
 22:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250627025214.30887-1-lance.yang@linux.dev>
In-Reply-To: <20250627025214.30887-1-lance.yang@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 17:02:20 +1200
X-Gm-Features: Ac12FXywX0xekxUXC52Wn56ratHki1z8cUWVFBJGFLSfqAnwCvDX9QWChaOYL38
Message-ID: <CAGsJ_4yjvHzeUTDoALafLddTCTOSzYiFQNvAmSQORLJV1HPhPQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/rmap: make folio unmap batching safe and support
 partial batches
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com, 
	mingzhe.yang@ly.com, Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_220232_603242_8E99895A 
X-CRM114-Status: GOOD (  13.48  )
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

On Fri, Jun 27, 2025 at 2:53=E2=80=AFPM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
> From: Lance Yang <lance.yang@linux.dev>
>
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> can read past the end of a PTE table if a large folio is mapped starting =
at
> the last entry of that table.
>
> So let's fix the out-of-bounds read by refactoring the logic into a new
> helper, folio_unmap_pte_batch().
>
> The new helper now correctly calculates the safe number of pages to scan =
by
> limiting the operation to the boundaries of the current VMA and the PTE
> table.
>
> In addition, the "all-or-nothing" batching restriction is removed to
> support partial batches. The reference counting is also cleaned up to use
> folio_put_refs().
>
> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe=
@redhat.com
>
> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios=
 during reclamation")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

I'd prefer changing the subject to something like
"Fix potential out-of-bounds page table access during batched unmap"

Supporting partial batching is a cleanup-related benefit of this fix.
It's worth mentioning that the affected cases are quite rare,
since MADV_FREE typically performs split_folio().

Also, we need to Cc stable.

Thanks
Barry

