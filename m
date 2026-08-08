Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C51BC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmc3Sr56uC/xFBzOAHwswW+8EC/Y4FNYJBinKHwg+a4=; b=QiN3ub/dw0PUUKlyVzgjcSzejj
	8L5a4Mi3/wbxSZjKp0xX5OcYGfcCkLCZvw+xFaViIHmeRv2dLi6O5mux2ssxYQDGkgivBMlbUDrDZ
	fi+dmBPctIrPhVzQKsastUaKFqASKEEhvP63PXOHBkULfNT9zA0zErDPRwJvo2c7rnOH8Dipp3W15
	SDaukKh4T26AzABCOwq+rVwPAc5cA1MmlMSyzFVcAiIitCIo5ziguckuyDa/8sAV+gcB9LrTkPtP8
	uz1Z/HtWlMMXokRRpvJvLVM596Q9nuV/ZKI9GPTQD9YezF09t+LTU6Xq0yeRHe0xbXLem3w+MyoG+
	ExSYhYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUzO-00000008uou-1NrY;
	Sat, 08 Aug 2026 00:32:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUzM-00000008uoW-1rkF;
	Sat, 08 Aug 2026 00:32:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24F7343B7F;
	Sat,  8 Aug 2026 00:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488111F000E9;
	Sat,  8 Aug 2026 00:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786149155;
	bh=dmc3Sr56uC/xFBzOAHwswW+8EC/Y4FNYJBinKHwg+a4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=VazOFjkvaOFHy83xSYbjGqgdaUthYOr5MtKzcB3yK8A8ZS+jvB/e34IjhXHZ+TK2P
	 Es/ZNvFiJ4H+5zPlprKlcYVCvlS7RkCX5fWndtR6zGgAXfFkPUnKPVdkFDlaVXe1Az
	 VKH+7g7CmbNsBDAFEzYn3vazM0oM7qgg2+MDqIp21q05AUm2SY9qgDovLj63IgNKky
	 T65hrSpEmR8Ob4MD5uGA9lAxasp2NBrh3WL31IT/2MapHM9+BbXbkzErx16wXG0k4P
	 VJCjBGP9ZilU9Eb2O9ODfz6bH/XCA4VbgXahLrrD8Z94AHysRY0zv/WUyTkP4NhuVy
	 RZSGcG+NwTlNg==
Date: Fri, 7 Aug 2026 18:32:33 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
cc: linux-riscv@lists.infradead.org, atish.patra@linux.dev, 
    anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] perf: RISC-V: store available counter mask as
 bitmap
In-Reply-To: <prpmask02cmap.1786092600.git.liuxixin@kylinos.cn>
Message-ID: <93cab992-f808-8f3e-03a6-19d84baf38f3@kernel.org>
References: <cover.1786092600.git.liuxixin@kylinos.cn> <prpmask02cmap.1786092600.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 7 Aug 2026, Xixin Liu wrote:

> The available-counter mask was a single unsigned long, but iteration
> uses RISCV_MAX_COUNTERS (64). On RV32 that reads past the object. Filling
> with BIT(i) is also wrong for i >= 32.
> 
> Use DECLARE_BITMAP, set_bit/bitmap helpers, and stop counters one word
> at a time.
> 
> Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>

This patch contains several array indexes to element 0 of the cmask 
bitmap, but that element is going to be XLEN bits wide.   Does that 
actually work on RV32 systems?


- Paul

