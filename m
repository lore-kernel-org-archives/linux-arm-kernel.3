Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40C7F4610B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=; b=hpUkr2waHQmb20SE2edm/BMyr9
	pTiR83Wj797lTLndhRF+sZqgbnvSUMCNfBbDcMdnMOVwxglADjSbCJpdfSlyHnPRpg+sQDhuqAJ7I
	qL4xZA+9w6SgmgcNna5/l5zYYvc2CPRYY0DVAYe/8eBWQ1k+g8GjAi+QutHZCUUefs4Lw1H+LylP1
	haiA7Y+v+mPKoGZYOkSa5Q79+OO59VA7oM0YWcY1v446VLruz+GBLrAOXucOnSbcE3p7gsxCLhpXG
	Rw4/l7S6KEUoqrNIQ3ZDZd1ZcSEQEwdeWnJxms5YCe8tap+LPc9dnyMBsAlzS8K3dlU18GhLdPL11
	l2hrkCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4f6x-0000000Gldn-2QpS;
	Mon, 23 Mar 2026 13:14:27 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4f6t-0000000GlcR-30kA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:14:25 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-12a70b4de9bso170109c88.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774271663; cv=none;
        d=google.com; s=arc-20240605;
        b=eo7RUuj0Erd6jnxe05FL8XvcBdcDef0cfDC2jGShGCARl/q33Lzkr224OW2zh5icQ9
         rk7bW2Tz47U65NqsSKBK/jnfBl4nyXz4NmdoyFt4mQnaoDEVaHKEXSRW7d1zzmOQPKdR
         QQ+aYluH2VMOlQuMZFZsOCXnl3d2ZpV/VaZ9j3z5a11tEko/cJBegyzfUSrgYH70ULX1
         thEgUnlmPyifnIrr2edjjPUUoRZI8BTOeiPoDXtoFIhm+WEKMUvs13CL5ca8dEYphA3f
         NYSvYvyUHF1LlcArhPRLOgpzHFkYNrtonSxksdmWoTkz5/mARpcG7v8St7qMxtqiaAw+
         MZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        fh=FVLU7NbEaXhdz3lGjDoALldoLJGW/fUcrkLObWrCR2k=;
        b=JQbmX+QPUTeOME/2YEwNLBzcL7wYD6kMndRa7ubkxGjk8CVGvohOzguCWVtnqKlQ8I
         FHkVHmexrA14JrnmuvuOk+8x6+ETtkqfM1y8+lAOdcZao1kA7MNXbbQsdvAm3pyCkCA5
         YQ1aSNuMBK9Jw7AeYfAt4xmiaviegarIj1TRke57cqA/chLW655JT2nGzO/C0REEnT+r
         k1KqC8QAj/Wa3IrP7xZwwABSIPp+HI2O9SCZ//6AV2r29oKJoyv45rUCnW0Lfmogiq7N
         yfwB9ezfJSKgPtFPanLMozA99CLuE4GsBijJxFd5IV+gdyS3XpCTzBKeq0aIRU/aOWOF
         ilqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271663; x=1774876463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        b=hsYbLoo6PYF68UtZWpbuyiINJ1DyNsl3v/ib/j/F4Wwh8GMlboCazqUjFcj4jnHQNI
         RB6H1r/nhfDVTYfwUBSTk7XzanPtpaecaSX8+v9iaiq468DVr1MJrDoF2OJN+MFY5W0z
         ocUMAJk18C59Wd/5zUh0O4XngXjTpKtBRQCvSYkcw1R13yFH0zIa4tJV6Gv6O15uOVJM
         QEWR2xs0zhqpXEnzwBv7okSrbM99I2wLgjrQSUxsvDFcyC9f/S4qxvi0E9zlZ4caFsVV
         Ex2eMCOvgjWGNegM9FgZHnrc4LNsRF74swIB1KM8Y1PX1QkK52gv33Y5hE3zEJZO37+e
         uMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271663; x=1774876463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        b=b6YlSN85QLHe+F87M+RzmdqPzi/WCV466L+rr6kCflFoVvCAO0JcZYzrwtGjgdJeom
         iYAF8sENtT3difodVnM7eYQrDqQo/YizI9QtBsxfL479+HJyMbsMI1zaf7jrFIi47FzH
         qdPZm2fnU8pPKdiW13aohnXYqy8M5787WMcH+SccFvlPoOWInv+krTIWHbi4Kdig1p/K
         dRG2cNeWtOjxYMaqE8ImP/RhdDixVEMzqBEFlfO+9tCMPvgzzxYRn8D+KPTMkbs95iEU
         Lfz42x8qyLzqlwaNyVpHbXjDU0zgsU1n82vzVB3X73XLyoYCPUAqShaeC9fmFQv5Vehu
         75kw==
X-Forwarded-Encrypted: i=1; AJvYcCXeBvinkKb1DPOZoeDZtLefWrX0GhXmWYrs1DzcwoBZ6jxLIMqxoMSuvFMb//R2gE9S68PBvS65y93AGK08QzXr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9bdfxHPp/jb6o6OxvdzF0kxBWVClrI77RMxztxxuBn4SpuXob
	HnjGcFi54uYdTDNQiI7ACGjdRUakSTBQAVqsRfnKOyCC+X/dOByJtmrc3ewXTPYBml3v9BtuyNK
	VuHuRkNzE7uaPprAjPjpPU2rnEzwIB10=
X-Gm-Gg: ATEYQzziK6dyBVI4TFjqi2+RRxKXVNQJwpG7evbjKXlQ9hGKU9XLeBwfVcXjCKUSFDI
	hO9cF5UL9MXeICq4tvf9Qo6hUgQ8XczrAzp4ErJulvn8HiQCAGo8fyA4z7nCnIlyHm4M03Lyu9E
	L6LT4QI2+q15U5oEzbXstf0QetNm0Gd4aQWEWDFEEPULcnct2iAzfCzydK374MKHH/neXwc2Ls4
	NbVyhBPWWpNNr7xphijvVDoj+aFVqWE49xF6yPJhnzP6qGgHqwDzTOMVL9leGyzQgbbHR9fEsUU
	hdvCXNpkqWMtsbrnC2qdGjm3BKO4lkw5s81S0r2V33ZrIIzSXm91/RhHwYCQCOAP0dVzSD9q9o1
	dp2PMxjLVCV0LV8jzgV2uATI=
X-Received: by 2002:a05:7022:f8d:b0:11e:332:1e01 with SMTP id
 a92af1059eb24-12a726a9b6amr2560622c88.3.1774271662774; Mon, 23 Mar 2026
 06:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch> <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch>
In-Reply-To: <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:14:10 +0100
X-Gm-Features: AQROBzCU6xTHp3fepOJZJySC8VZYOKbiHafZdHuv7S9AawfpKcVFscMWOGjChLE
Message-ID: <CANiq72kbp6cDnNsKb+rPHiEJzOa-EnvR2HHthM-VtT2GMukY-A@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_061423_762331_B75AD648 
X-CRM114-Status: GOOD (  16.79  )
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

On Mon, Mar 23, 2026 at 1:55=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> The current proposed code for netlink needs this feature, because it
> needs access to inline C functions. Is the implication, following a
> chain of dependencies, that netlink would only build on x86_64 and
> arm64?
>
> If you want netlink on um, arm32, riscv, loongarch you would need a
> different implementation of the binding?

I still don't follow -- this new mode is opt-in, and only a couple
architectures (or whoever decides to support it) would be able to
opt-in. Nothing else changes.

> And a completely different question. Are there other work in progress
> solutions to allow the use of inline C functions? For networking, in
> particularly MAC and protocol code, anything which needs to access a
> struct sk_buf, a solution to this problem will be required. Do you see
> this "fairly exotic approach" as just a sort term bridge until some
> other "boring approach" is ready?

This series is really just a way to increase performance, i.e. it
doesn't really change what we can do.

Cheers,
Miguel

