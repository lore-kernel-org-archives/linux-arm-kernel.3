Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D289DFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 15:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Dekv3tI4SAkRrEMgiD3ZmjSX8tBUo5iiLFe1Kp62is=; b=of0mkaK/5JVlUQ+LRrP99GNMPj
	5JP0jUUZl/KbbnMmlD7o1dRGJOJR3fm0NWYwo/ZLjWqE5aF9J9YMJ+LOoxx2ew8y31v72lfGQxIAk
	fHjHMP0JXBHQW0J8oV8Ir0cAw8xE2dZzuL9q/bVuUvYfEh84PVMbzOwJWEpU5KSbv6DjYAwo0NwO9
	GiTP7s4aqDtOZ+laVBDR1VhtVDFkHftgAQiP0wl2YFG/uTu4SSoiyM5k+0ZFhtK8w/B9cwstb9vF9
	VeO4GlHeDCXmUpErwFZUaAz/MYtwwkCR4LwHEVB4wQn5mx+fo6DxPb4hKyXCISwUQcKpY+dChEXmq
	TzP/VHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZCB-0000000BFn9-2G6f;
	Sun, 03 May 2026 15:57:27 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZC8-0000000BFmd-0xlK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 15:57:25 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-83659d38e38so109975b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777823843; x=1778428643; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Dekv3tI4SAkRrEMgiD3ZmjSX8tBUo5iiLFe1Kp62is=;
        b=c0KoMf5Nx0zgCFFNuY56ah5NejIthixcxaDDWQgPawgFX6d37PFfqVnsStDztZ0f9Q
         bsreoQo+vy1B+8hu5rHt7MpG8XTEziVMHCPkL/FsNU1vS8TVkJA12fN6kZFEuiLTzDGS
         qoCTa7VNoSc6xayghjb86+C1qpoD0gT4QHD+zhTcGChbkUwbmhADlBuGeDvkUgbEA/jp
         WKgheTJJzIcGa0nBsRtJrlMjo758ZwSMmzgP/pLkG7KI8G/sidEnjpOj4CyXoMT2Qd1r
         rcfdZfpwmWjmfcv02L+alUYf1sABzwaI01WBjIddo+SwKW+E6UQDzE/c6kfU+DOnjiM+
         1G5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777823843; x=1778428643;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Dekv3tI4SAkRrEMgiD3ZmjSX8tBUo5iiLFe1Kp62is=;
        b=X4zK7q1+lQilya3CJjeRZH85fNX+cd4XvrRkEzDuQp2ndGZDVvO2+j6kg//YcvMfii
         +5XZCBiMj5XupOpQhT546qAKEMdFRY8H9FgjPZ7r/hvnBoFEQQ1H7aXm8PTzGNallkOJ
         E9YTGQYSkgCPyAK3AH/+Ea1loM3X3Y+E9y2DjDg1TulTwrDbLPX+XlbHeC6uLKSlrCkL
         QqZK9hsLa4KW5AZjuPje+uct0rr2UL8AkIHe7tAahTMX1ASntC1zJzksQdGkI+6JjAFe
         3TxJfsLb/+VOkZ0pTUumDcnjIuwVWeEVJ1p3Mu2a/lmcpvlQN2CENupGzw0nsP3DWpoz
         zVOQ==
X-Forwarded-Encrypted: i=1; AFNElJ95yEnid+vvUm/v/3FuTuKGZNJzsLwEBo3RvFXF2I02DBAbBxvMu05xScIlX7bNjJ96ARpLPIaZ9x5wM4yEGEYO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt/6uBFO2RDuMH/C3w2GRh/ZqRkGAy1+i3m2Jgro7PRwsZv+kJ
	SDJDodbAZfNFUtUzc9VRSL3fqzVZynh8MP3MuTY7e4ax3sCiT2EOX4/p
X-Gm-Gg: AeBDietbFIFcKE1I4faW7fwB5QDcSCeg+TCKkX8RezfiEKlXGv7t5Mf+lT7clO3TgHw
	WqcyBjsR2JHhNFfztr7agezHITtT2nxUOdTRpvogmK6sFtVi74v64xLKmb3mztbEqtgHHSRSiLy
	f6Pnc93tE1/4sZuEqHLnKh83EGJ+ozu240RFW8mKH+1IRZD1TNrO5hgsNQ3nq15Xw6IijyIHASr
	k6iidaBKzKURzMVhXaSsFpMyvijY31ve9irk5sODGRHHfLol5fD9oy2OupPz41xED15GJsme903
	WXis0Ahibf8GDgs4jGPiUrSn8pKrCn0TTZnQJQuogHPDRjoR9FqtQwNBL5ts7e6DBGNPzt/vtmJ
	m8J1CBrLid/ZidLfWq2O4GoWWd56xAASfSIi9c9LrJKfL31Q6HtwEJmdYqujcykmZvuEZvXGIKv
	okjeooJWKNTLkw7wI1Fh75p5CiqRP/OEmNI/P79wEoEVcCmmxxkg==
X-Received: by 2002:a05:6a00:4c15:b0:82a:6852:559e with SMTP id d2e1a72fcca58-8352d1f7175mr5950625b3a.12.1777823842767;
        Sun, 03 May 2026 08:57:22 -0700 (PDT)
Received: from udknight.localhost ([110.87.76.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158a26d3sm8671335b3a.19.2026.05.03.08.57.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 May 2026 08:57:21 -0700 (PDT)
Received: from udknight.localhost (localhost [127.0.0.1])
	by udknight.localhost (8.14.9/8.14.4) with ESMTP id 643Fsddo019172;
	Sun, 3 May 2026 23:54:40 +0800
Received: (from root@localhost)
	by udknight.localhost (8.14.9/8.14.9/Submit) id 643FsY8J019166;
	Sun, 3 May 2026 23:54:35 +0800
Date: Sun, 3 May 2026 23:54:34 +0800
From: Wang YanQing <udknight@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: akpm@linux-foundation.org, willy@infradead.org,
        torvalds@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: lpae: fix non-atomic page table entry update
 issue
Message-ID: <20260503155432.GA18098@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	akpm@linux-foundation.org, willy@infradead.org,
	torvalds@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20260315004746.GA32062@udknight>
 <abYHfGjqTRAB_oyR@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abYHfGjqTRAB_oyR@shell.armlinux.org.uk>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_085724_273882_7F514E43 
X-CRM114-Status: GOOD (  20.85  )
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

On Sun, Mar 15, 2026 at 01:12:28AM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 15, 2026 at 08:47:46AM +0800, Wang YanQing wrote:
> > The ARM Architecture Reference Manual explicitly dictates that writes of 64-bit
> > translation table descriptors must be single-copy atomic:
> > ARM Architecture Reference Manual ARMv7-A and ARMv7-R edition (https://developer.arm.com/documentation/ddi0406/latest)
> > "
> > ...
> > A3.5.3 Atomicity in the ARM architecture
> > ...
> > In an implementation that includes the Large Physical Address Extension, LDRD, and STRD accesses to 64-bit aligned
> > locations are 64-bit single-copy atomic as seen by translation table walks and accesses to translation tables.
> > Note
> > The Large Physical Address Extension adds this requirement to avoid the need for complex measures to avoid
> > atomicity issues when changing translation table entries, without creating a requirement that all locations in the
> > memory system are 64-bit single-copy atomic.
> 
> Thanks. Now, please locate where the need for the updates to the page
> tables needs to be done atomically, bearing in mind that we program
> SCTLR.AFE=1 and SCTLR.HA=0, meaning the hardware won't write-back to
> the page tables to e.g. update the access flag.

Dear Russell and all

ARM Cortex-A cores (cortex-a7, cortex-a32, cortex-a55) all have "walk cache ram", 
according to cortex_a32_trm_100241_0100_00_en.pdf (https://documentation-service.arm.com/static/5e7dca43cbfe76649ba52835)
"
...
The walk cache RAM holds the result of a stage 1 translation up to but not including the last
level
...
"

The walk cache ram will cache translation result of L1/L2 page table walk, so the non-atomic
pmd entry update issue describe in the patch will cause partial updated 64-bit entry to be cached
in the walk cache ram.

On SoCs like TI keystone and Sigmastar SoCs which will run arm32 linux kernel on high address,
the physical address of page table will be 64-bit and will meet the issue described in the patch.

I think it is right to make page table entry update become atomic according to ARM Architecture 
Reference Manual.

Thanks
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

