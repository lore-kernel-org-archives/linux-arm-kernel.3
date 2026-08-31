Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C73C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+e3nkWCWmnCXTSnQisaZ/JcY9969zoxFZBJ4/hDxuA=; b=v9laDs05ocykdSczmzx79ZYP7D
	2sDQG2xmtgL02658nIeOiLTT5QoKycbHWzGL4qrPgkf/ZAUitdvIyjbKnmNDiui4WZrbe67CIiDQ4
	+VNpWR2v8wMDgV142HprC8YQWC76I87zimiAMtyMsp3bi3CTDuThC+YYzEc1Grli0vJTK4T1iMKx8
	c1epANMHGOzb8OV23lSAkMBxulu6CLvkeDiJdyZgE9HMRndLClfjt3Tk6rFStewgyJtGcNPbvKTPD
	b99JtigqRNv0CCNKSaVxaeqaRypYrRXS2X2zkE8WgVnQY48NzmAq4BzlaPvP23q9yqH/zsgelZH7P
	4MHiBcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10MZ-00000009Do6-09dH;
	Mon, 31 Aug 2026 11:39:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10MX-00000009DnW-0yUF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 11:39:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-482e067e908so2464301f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 04:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176379; x=1788781179; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+e3nkWCWmnCXTSnQisaZ/JcY9969zoxFZBJ4/hDxuA=;
        b=iLaBfHB1xQqQ7XNIaaaGWKdRnvIc3WY95nh+V6rtf8HG2v5Cp3UdmaXxKsq2YKRmws
         CCPUSpkG8Y0OkfcS0ZqEX8k7c/e4g1Dz7D7CD4Q+wp76rsinc5QXs0GGIFkxASwn6Gb/
         9ycLAXrhm1K2PWWoOSUiT0y90UcxJzHQiid3167gx2qN5/wWjrCdyM1fQujRiFZ41s6s
         EYntDgXeokl7Ofj4Pnuql6xx2C2rpDjsJr84ZL9MtvJGhPG1rPH5vAEWaLgbg4RISome
         eW9+rMTmuTF6pqMNXs7M3J/WE9iS8+3n9uhH1F3fipS0qwkfdYsozFj4vJSFm4Xbi7XS
         Gypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176379; x=1788781179;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+e3nkWCWmnCXTSnQisaZ/JcY9969zoxFZBJ4/hDxuA=;
        b=duOaXxkCvWYQChe5ZC+eAtJRCM3rLWo1o9bnapxbejV8+IkltKM/OtgPo/bFvjqihj
         OUNBhnPzBzcKrQYHje5Sh5NeWwcs/M/NZY2yyETVgiF//jSU/qUaw0Yl8TUZwJluPx0I
         5Swtn+91p3VEBMJzS/jd8ncn2VSEs7dRS+yTIa9XLRfDGtLAg3gElRN+vHaa9aPQRn8g
         o9iJiDJFbjqBGXOAcC0aSz74zN/KrwfG68sjbqxSo/h2prwU/Njwxwlg7z1UCyXhMcCA
         LaGT4ztbNOGV0uOxNnYv2YyC3zqjZescr8T3w2ahgBQlgqi6xqKV2q1uC8dIruFljzkn
         01qg==
X-Forwarded-Encrypted: i=1; AKwUvByOd8pc6JbkKbAL9C75M1BD9c64u+tTtqLPkkpy9JZAe72ar4oxjHcH+r921v+jC6IqSqACfrNnz1d+LC1fVJEc@lists.infradead.org
X-Gm-Message-State: AFuF++nEWpygjhZxYMXBPRdBCfXH/vyGNcqK/hRm7KE4a+BlHLaQSIUh
	oNtUYxS7cXIR7r2x8VJhYJ2g3ihltfz2SfCCikjwUDhOTpPX/LxaIhDPj98DGku9
X-Gm-Gg: AYBFou2G6p1cURIB6sRzdBZWfYeACi34M89XWkfbL5xE4wBWAufjHB3uz4Yi8pEgbQI
	vr2BnnhYuu3to+isBpmoM1BS3l2bW7CXah/rQmg70DSq2Feo4KlWqGIQd37HnbyFT51WBbz+KfW
	Q3dC7g3RYZQap4vsBKXksqdLmr37Cvn6QT22KGvpxhA7whsPdr9UFojidio/Tv4xJwR/rguY9FD
	gWl6AazTWFdnLfW+MbLt1ErZ95NsK/T7++PDoITo+4DVr3mwlokInszZzX1NoOvaKwPo/ogn9ZP
	lyqgSbAIsL3xIdtR8yMbP1HDxZ8xctnTSV/TqlMJE/1z/t3VSgIq1+0w8FCXXbjRiJpmwec9xGV
	1O47n/fl1Te7fUsoObqtbXPGo9aeW/fDcNiiiq3kzK8GU8MObTbHAhyqQzPT5nSkVINvLJlBcDE
	grFqD9y+Wsw7A32S5siDk6q5sQgDtV7xJuF8cwghfIf0BoLin+Txy2fWp3Fx9V2N4fz0H+nzSrQ
	EOBvzE5Y/uDSE/RNR/ws2AVXQ==
X-Received: by 2002:a05:6000:480c:b0:484:3f5d:7dc3 with SMTP id ffacd0b85a97d-4843f5d7de3mr3330798f8f.5.1788176378681;
        Mon, 31 Aug 2026 04:39:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843310ab29sm14535272f8f.0.2026.08.31.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:39:38 -0700 (PDT)
Date: Mon, 31 Aug 2026 12:39:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@amd.com>, Ritu
 Agarwal <rituagar@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Matthew
 Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <20260831123937.32255a49@pumpkin>
In-Reply-To: <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
	<20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
	<f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_043941_301810_9F57022C 
X-CRM114-Status: GOOD (  17.65  )
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

On Mon, 31 Aug 2026 12:13:08 +0200
Eli Billauer <eli.billauer@gmail.com> wrote:

> On 30/08/2026 9:47, Mike Rapoport (Microsoft) wrote:
> > fifo_init() allocates the buffers backing the software FIFO and
> > endpoint_alloc() allocates the transfer buffers of a USB endpoint.
> > 
> > These buffers can be allocated with kmalloc() as there's nothing special
> > about them to go directly to the page allocator.  
> 
> Except that they are a bit large.
> 
> fifo_init() may be requested to allocate up to 256 MB of buffer memory. 
> This memory resource is split into an array of buffers (fifo->mem[i]), 
> each 64 kiB (or less, if there's trouble obtaining segments of this size).

Would it really make sense to allocate the four buffers separately?
And/or use vmalloc().

David

> 
> Citing Documentation/core-api/memory-allocation.rst:
> 
> "The maximal size of a chunk that can be allocated with `kmalloc` is 
> limited. The actual limit depends on the hardware and the kernel 
> configuration, but it is a good practice to use `kmalloc` for objects 
> smaller than page size."
> 
> Regards,
>     Eli
> 


