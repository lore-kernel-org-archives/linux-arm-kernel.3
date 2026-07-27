Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EACC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 01:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+YAafdUWyy4iyACMaMYl4fxl/7MRA/3Ye5L0fqVOqU=; b=O6WxNDJ0tYkyyx93ah15V0l9sd
	JZDqIr+sC70OfEm5zgkq+vkj738Sj9Wo9hGGRu/MnlUjXGMfNs/F+g3fsJYZMuXHkmZksqWRL3o/w
	SQ08has66lHviAz0lFOUYDFZ4jBm1MseR0UYDYRylidsayH8n6I/v+U1Dn0Sx6k/lvS2F3//LB1Nv
	5CXx6zkniPZR2hH+4mL0iQ4rdIeUFiH/olv7A0l8cQapndd5LHUAwoiW1yPnNlatfX6Sk3hGDK61h
	vDt1NSRViMrs3qOogGCtpX1wI5mqI3nOFNOJe6bV9MTIomVfHiu2AYoQxDgvJQR82QIuJfnLggWGM
	I0dqG/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woA99-00000001m67-3oUc;
	Mon, 27 Jul 2026 01:28:47 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woA97-00000001m5g-1YPz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 01:28:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1512809f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 18:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785115723; x=1785720523; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J+YAafdUWyy4iyACMaMYl4fxl/7MRA/3Ye5L0fqVOqU=;
        b=BHtIYN/eWh1fJfURFsDg91L3TcRbcjoSrlX0OpCDwS2hyUFTxMahoX3X2Oyye6lbRc
         pNEiyEqfx1B3sZpJBBK8FfWU+HI0Bk97/NSKW6o1ImqRAWgfiilHFX+FfNZo82K6O9QU
         xB7T4XQWHpL4UY4b00jFhgFHF3GO0YpIJLrxmKETRVPXZ/bjBGnhawNxh0utqMm98vzk
         HqWWKcqMsn+OC0GrAClOd3SLjTri3y6PaRYanBAX/3y2TE8rccqYw464CKmcYX70jsNu
         EbIdI17V928Ma7GJz2GIkAWAowXNZu3lIVefacFGc4RcHm+VjSynJDA6rG7OI82iabO/
         ta1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785115723; x=1785720523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+YAafdUWyy4iyACMaMYl4fxl/7MRA/3Ye5L0fqVOqU=;
        b=cSwfAwavTHLzEVt3DWJgO5iDsrBqW4ceBsNFOtz97XEvMvEiQ2nefRJzF8B8s+BuIi
         98copXzgQYbwiSkfEuEjcNRV1Eo8fxTxTECCX9jpxSFjoLlgX6Rg5MxsNTsZjeayOse9
         TSkDCssWwTN8EOIhCyIFRSHc5rVcgiHBITTHCABiz0UOK1jb1yZaaNOmXpyx8PnTZHAw
         glGvL9+bPbKMmpJgIVtqH+ppStV9+bp3uig9bDLUJ+DXff3w5JA7TnC2Ld+zu0d96Wrj
         rqO0/a96wKFA0auwLshquuQqZIdLTawIsJB1pNhqtquz+hFBwf0dHWAy3vcrpvc48eeE
         TuZw==
X-Forwarded-Encrypted: i=1; AHgh+RoVlz8CvQZhgGHoe75NcKcH7dNH9KcwE27ssY5DT9JJuID2D+OjBxY9ROgH+ahKMNmsLtUEO8yT3OwLvLxhv819@lists.infradead.org
X-Gm-Message-State: AOJu0YzL/NTPwe9sYMX2iJq0njiQAX7FB1Al0t7UCXaMFkshSo591iLA
	jphTnt8GdYvAnItzlOsVscsJy56HhDWiIbkTKPEcRiu/ws1He67Cl5vG
X-Gm-Gg: AR+sD12dJbAv4rL0vEaHV0VxTPFWdyKJBJPuCBoZiQ7syDNkmHIkhqM0Kmf8AuK2HI+
	an+KJDV/1mrn7cC5I+MEHIf7pClpEBbke6zkCYSGAuNPM2ak+ytCV0HdfoIMIxJaaMJvZdSG62u
	6KlkD+gh8RaERkdkbid/01+R0taRLhT0fiS5nrb+qhhoFsKBjyiMu0qJ8K6thpzKCPvq9NHy30L
	7yvg/R9NHx5385kme8WINIY2eYbMX28Emek8ESbEEu1i6B1NiKwjHG4IUxmS6tQyNFHfx3eqTcd
	dPxtKyjKnHVNjz83N36aBF5Jh6bYGYwGqDsdRMZMb587jZDlJkSNQQkwq7BEpaSZVWxqNOt7MUs
	/9iHMuw1IsAvj0V6tu87MPOX33XiuOguZjCNKYK/c8trPCeJeqYxwfQyG1WJLMizzDwepova0nC
	hkThK8fpoK5EZFIs+xN2xlnoBVntkyPtNxf+fzQXr4aE/RFHvoYO2p4xgece8ukjopAM8x76jVR
	Yps0a0k40kCylHR7nesa7Q9T9pXRAGFPrVuZw612WU=
X-Received: by 2002:a05:6000:2903:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-47f9cdff8abmr11557115f8f.16.1785115723100;
        Sun, 26 Jul 2026 18:28:43 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-116-215.95.114.pool.telefonica.de. [95.114.116.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f96d4656bsm27341954f8f.21.2026.07.26.18.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 18:28:41 -0700 (PDT)
Date: Mon, 27 Jul 2026 03:28:09 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Linus Walleij <linusw@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] ARM: traps: Implement KCFI trap handler for ARM32
Message-ID: <amazbT2M9PQgb_Vq@gmail.com>
References: <20260715175223.make.153-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175223.make.153-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_182845_432089_DE1B3FCA 
X-CRM114-Status: GOOD (  12.38  )
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

On Wed, Jul 15, 2026 at 10:52:27AM +0100, Kees Cook wrote:
> +/* UDF base pattern with KCFI bit: cond=0xe, 0x7f, xxxx, 1xxx, 0xf, xxxx */
> +#define CFI_UDF_IMM_BASE    0xe7f008f0
> +#define CFI_UDF_IMM_MASK    0xfff008f0	/* Mask for UDF + KCFI bit matching */

With this patch applied, KGDB and CONFIG_CFI cannot be used together. 
Setting a breakpoint causes Oops as CFI failure.

This patch on top of "ARM: breakpoint: CFI breakpoints only on demand",
multi_v7_defconfig + CONFIG_CFI=y + KGDB/KGDB_KDB/MAGIC_SYSRQ, THUMB2_KERNEL=n,
clang 22.1.8 LLVM=1, qemu-system-arm -M virt -cpu cortex-a15, booted with
kgdboc=ttyAMA0. 

Then "echo g > /proc/sysrq-trigger":

  sysrq: DEBUG
  CFI failure at kgdb_breakpoint+0x2c/0x58 (target: kgdb_breakpoint+0x2c/0x58; expected type: 0xc0472d70)
  Internal error: Oops - CFI: 0 [#1] SMP ARM
  Modules linked in:
  CPU: 0 UID: 0 PID: 1 Comm: init Not tainted 7.2.0-rc3-00278-g38436106b2f5-dirty #1 VOLUNTARY
  Hardware name: Generic DT based system
  PC is at kgdb_breakpoint+0x2c/0x58
  LR is at kgdb_breakpoint+0x2c/0x58
  pc : [<c0472d70>]    lr : [<c0472d70>]    psr: 60000013
  sp : e080dea8  ip : 00000000  fp : 0021a1c0
  r10: 00000000  r9 : 00000000  r8 : c2004048
  r7 : c2205d9c  r6 : 00000000  r5 : c1609558  r4 : c22bb994
  r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
  Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
  ...
   kgdb_breakpoint from __handle_sysrq+0x150/0x158


Thanks,
Karl

