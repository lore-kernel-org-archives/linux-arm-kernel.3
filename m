Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A97C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 03:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpaNCdk8qOT4pxEFWnuB/KdAsmJR7/mT/BqEQpedxvE=; b=vwShkdDOChYlo1Kq+zNss9gTvS
	uF3qi65LE03yBiqkk2TVZzGwxx2Hz92CXAC1LqL2FIqLnvrmeO9ua9vhpnIk/ZPGPfBx+84B+TZXF
	RddSEu69CKNUA4HuwAsUgAK1nw8BmvDTfoqIBgjcgJZLGoFSejzA8HVTgjPRVXSzIbLMln+BrWv5f
	QV7swREjEvoSqpKHm6G69MBhtwrC/ovjnrzICM/Nhiru6pf4d6UYX7BvfXS5J3wPcf8BLKdHDXt5g
	MIeM7H7riv2ruclU5IPMJaYypvTGsJ7U/VGPapi8K/wC4SEJyc2/MsLzcG0dil4BKhqIe2RzJNwDV
	bNlaeWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KaM-00000000vbT-3K3k;
	Fri, 04 Sep 2026 03:27:26 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KaJ-00000000vap-36Lc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 03:27:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-482e06fda73so58409f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 20:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788492441; cv=none;
        d=google.com; s=arc-20260327;
        b=IHXTXCzsx7tdVwFOdcZLcXBAaOV7gLOFepnoig1ryP+W4EWxBSpI4prXytrknXvAt/
         zIV4S0nq10XmT26SAIoRm2Oucpp1g3Lman+Hz8HxBNB+Ia6OWZpC70EtmwEeqKLZ6DWT
         ucjIyOBlDpM52nYKSv7JoAkSur9L044yNzzZdOzF1FyKloailMoS/tHP9gdKxt8f3MMD
         iVUbn8HR5ZWY7CnNGzOrwF0T7EgUpHdjDYlUMrLFqRD9wCOlQVjRIrPW/yp9Sp07PK+d
         t5eZddiUW9l/qgP7oVyJ/yD7PoRKrECjgXr8LHJHCtNdgMAHPQZBBfhyWUDxA0rz2IyJ
         SZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YpaNCdk8qOT4pxEFWnuB/KdAsmJR7/mT/BqEQpedxvE=;
        fh=d45UpqOiYhwaWtW3scHEM1FccRmeCmKGyLyLyzBI9Ik=;
        b=l7IQkdLmzPNAUkBboh6k85q/Fea7cFtYPkIY6pi4Q7LeefN1NauDjWIwYadHRvrvBd
         biOlg+rk4zr1e5krlbxqb0is5cVM4CQT9A8Upb4t6DzPmh2qv2Y1ONBx1dBQpHXn8Jt4
         YHt35Va54m1zkL3+nA7lpMlYbHusy7wOG+AtStNfGLhff0qoh3A5tbqQS8s5AuEtUYe9
         ogC5QO11shgejOgSFLFoqQwG6YczycRYAVeE9PqEwDjCJQJHCJBE9yBypWswIukb7uyt
         fEurE2NvGUliH/eKmDxaDsYmksiBvWQDFt7qkrpy8wGRM5rdk81Fwatm65Jyuk98wXtw
         g2oQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788492441; x=1789097241; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YpaNCdk8qOT4pxEFWnuB/KdAsmJR7/mT/BqEQpedxvE=;
        b=BSr4H1rk76bQOF04nG+LN+el3KwtSKHSyTN6JRT3Nho6C2TCdVgzPRh35v57yoFIjn
         CuCIgtYCgecA/haqbemF04vvjgqs3TOtqQ58XHPtFjanQv2nxYYWmyiQBw52OBsHMUhf
         /8haATDFD1Q14I/0Ajt1eqPKTQ/xvbOH813JPrdFtasmuPy6LbaqranXV7XaKH84R8ga
         tR3e8HFSlZWkCQVBupkZgarcxnxdbcRXzXkhH+nxu4Vm4+vccjllnfrICGNQG/llHhpt
         qha6+pGP08pYf7MHYAWfj+5V4/5/pK0b8aNG5k+hpvXQ4ofMQvjlhDoclnF+UEanrorI
         aJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788492441; x=1789097241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpaNCdk8qOT4pxEFWnuB/KdAsmJR7/mT/BqEQpedxvE=;
        b=JlkzMHhdPhSJAC5pIGAPeNvMmbqh8YEFQ/ByY1PxetmAk6dqtWFPJoNWW1OJdtrqnf
         Oe+1fRz4HNBAN5Lue7/wDmLFe7Zf+1ocyphMlHrZ7HojRnyU96yhpyxCKlERcxSKKMG5
         W8+X4CqygiAzCHzS2rDhxamAPVMyP30/xGbX/G0FG9hCEtT5wQqvE2XkH9ymPENu/uAN
         qivx5jqxkGdCHK89eAnncKvxNzCm5vOwntOL8V5mTpZ8ti6DJYYYcFCg8WAEs8Ox5CRB
         Viu8BWa7/iXsRQ0xl6sNkdWZgc3kLkRhmMNt1RCi5/HnhRkY2HxJRGwe/PRs9EmuoiKP
         GCAw==
X-Forwarded-Encrypted: i=1; AKwUvBxXXNJOi4+lXIJJVqdcfl/I2mCRQV1uk6cMQ2VLUiUH7CASuatx7/6NTnEomnD3gPxbJFvcQ2A7p3AgbkhrGvVc@lists.infradead.org
X-Gm-Message-State: AFuF++m9lmmH4NehBWXLMDDUmVfrzP0WMRJoScnH1DHfYbjwhaTO8Gqx
	GeutEOKJ7l7/KtsMPmKJ5OUHnpBWgurpwNn5He5Fnb2w11RPOWlvyTYRGMgqPWbENmo6fBEWhLW
	zdFrP/JsQBzWlgNruKUBDI8xtdGeH8RY=
X-Gm-Gg: AYBFou2X9oGIMuO1mx+hahLkSRmoEfVCS7MlWm41MNmAHQngUE/uAhK1ofwRBuofzlu
	UO9g+d3uM/oKJH53E0DMfqpRaeFfQWrhQXTE7+PdynLrZpTxIi5vsjJBkV/C+VUowrg7n2b/tTM
	LxaEBIpCMysxlYfl9j3xOtV2712pgzTAgeCN7pp7RUDBub35paiaDd4h/3vO+9n3SOeu7GIkpzk
	fEj6957ZkBqh4EcH+KQn3ajTdkcqCxee5DrNn0fV30QysiZbj35FJmyCQvkScXYIAAeJN+jRW3V
	eqoHOOv6qLtbuCWcCUpAEgrXzDg/6S3h7+Knd9YAyHEAHgqsXZI965f2v80IopdyTAgCTzzHxLY
	o9QyM01y1yHnIZGM6TcNlyIcW9kVtqIbpJ/ZZen4=
X-Received: by 2002:a05:600c:a40e:b0:49c:f9b8:bae0 with SMTP id
 5b1f17b1804b1-49cf9b8baffmr9477045e9.2.1788492441090; Thu, 03 Sep 2026
 20:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <5026dbec-0b71-4408-a78a-484a4b8e77dd@intel.com>
 <apk775HfHg_DXpiW@kernel.org> <1aa2b2a6-b068-4856-97ef-91ab848f01c3@intel.com>
In-Reply-To: <1aa2b2a6-b068-4856-97ef-91ab848f01c3@intel.com>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Fri, 4 Sep 2026 11:27:10 +0800
X-Gm-Features: AcwNN1VvYizDBaPoshS173cq9tRkFRCRmLlnTgzXTNcKAb5wasusdZ9mZR0gx2s
Message-ID: <CA+qSx6wrfKJ+KuRkU_gLwjN+tS3+yv1VqXpsnZk86m2PZg--8A@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: Dave Hansen <dave.hansen@intel.com>
Cc: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org, david@kernel.org, 
	ljs@kernel.org, usama.arif@linux.dev, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, kas@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, hpa@zytor.com, luto@kernel.org, peterz@infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_202723_795088_004BB9A3 
X-CRM114-Status: GOOD (  16.92  )
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

On Thu, Sep 3, 2026 at 10:09=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 9/3/26 02:20, Mike Rapoport wrote:
> > On Wed, Sep 02, 2026 at 01:59:15PM -0700, Dave Hansen wrote:
> >> On 9/1/26 08:18, Xueyuan Chen wrote:
> >>> +static inline int set_direct_map_ro(struct page *page, unsigned int =
nr)
> >>> +{
> >>> +   return 0;
> >>> +}
> >> I still really think the stub here needs to return an error *or* the
> >> thing needs to just be void and tell folks that they can't know whethe=
r
> >> it worked or not.
> > All other stubs return 0 here when an arch does not support set_direct_=
map.
> > I'm for keeping them all consistent and fixing that technical debt as a
> > whole rather than creating a one-off here.
>
> Oof. I didn't realize the set_direct_map_*() functions all did this.
>
> I do think it's generally a bad idea, and I'm also OK if it is not fixed
> up here.

OK, I'll leave it as-is then.

Thanks,
Xueyuan

