Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3226DCA6002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75mYoqO7XTZPDFCrG1UYJermMjb5BcnwengTra+DTqY=; b=xx61sYL4kH6ECi1tSstHZeK4MT
	Idw73m+DUSZIdr0E/lNDMkuRmxj7NHjl9yx/JBuC3GqAKHxbLknRKLeG6JkOuHBxghQSu9KSg/T8T
	H/nwjK5uFxsyrjGWWdc99DzcOkRlH0rYGIg/1lSqQvHXXbspLiLi71yswx/TJXd1gOMYyH5CNOjmy
	pHnVgmvDjMRCZEPpaE6+2aQ6h5FwT2NwWC7T5N/OITkX8I85vRSyABRI/VpJbG9KuzqvpFDf6YpSH
	hZdKDKYS0L4XQKMcAUFt7bty4PvDFym5EF2eAI01Xo2ZH3lDnPIi5RQNieWN1lyMkv/ZtEuSD7IoS
	oFLD3r+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE18Z-00000000LYz-0DK1;
	Tue, 06 Oct 2026 09:07:03 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE18W-00000000LY9-02Nz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 09:07:01 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 67E337A00EC
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 05:06:55 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 06 Oct 2026 05:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791277613;
	 x=1791364013; bh=75mYoqO7XTZPDFCrG1UYJermMjb5BcnwengTra+DTqY=; b=
	Og0sykee5JkbnTUUlaWG8c6h66zPhcFNn1l6Fyi2axwrG5ch3EJToRI6gi74O3oY
	K9lwIEkZJ12blMqR37W5XwXKvf1g3k0H4/zAMaAU98Im7mYKP4csUXNMjdvi+PG9
	gUSTvhQpH129paHqKHlqNlVBRbtDIjykxf8QfaLyiv9mXiuVhqxk+g8rUQFu7+Qc
	JYCB3NmK5rl5rDjajfI8Y4g1G1biq1KId/6f5V5/fScJxXRtWfgMqb921cNIwBlT
	cn8LBvb0VDAHMs/URrWsYoH+XOjPIMCslimH8aOKW7+cPEy5TlNsKLZX1gEuh2Uh
	55L30Qm7aSROiIa7oR3P1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791277613; x=
	1791364013; bh=75mYoqO7XTZPDFCrG1UYJermMjb5BcnwengTra+DTqY=; b=D
	oKzgbX6el4e7Uf7LGDwW9kROhDp1sSw2u3EC2LPOQGCgPN3fUm4QEYvwItL+hFMm
	IMi3KXezHkwqCz5b2kV1b+S/8/DW+9h+bCuKXVRMVp1mIoCa8NeHDUhjDU4O4SIf
	IfGfI5hA5GxWyc976VMcStoeQVgR0fhFdLtvee+AtrrbjaQxNZCLuC9/q+v7ndJe
	jt4NpMC7uAqM1z4TfL/ScyH+xYA2iI5os9N5avoJ+HvE44+3DwO6SY9P93BvpPOZ
	jxQNUPczu1Bqr63KD+WU9eAx3NqKxFqaf/dxuEBaMClE1xtV9XTVUTuzpU/7wAG1
	b7yjkZ9p0aN5KY4fm7kFQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791277613; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:onaRyFu/yNDH7VaU3QjaTRquzjQOIntebJ6Qz1IrEX0g21i
	dDWAgnqcKbbF1fBIzemrNjvlU1pArdFMYoUC4lLvwWEsHGzyt9jpai6smBoeRWua
	R2YOeUGQtgxD2mInz1WFWHgJXTCchWBwqaebEtBDjdlfn5T0p0B51ETh64/x6Rcg
	vZPx++KG8EOsiVzvJUDe7Rqpm55DWHKxIYjgr1+iXTC351c7+SnwCt8HJUFEVtO8
	ofZwMZdS8M4VsFZLxoMLKNejciFfQH/2pOTU0oi+6kVcvyNiV27F0oK79c4JAK4A
	DdGvLb+2f1Pn50X2BaGepXLqerbeZGw/uLQL6aA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:kfiOc7mNBEKN8npdJqjsfHKxTRdaDx6XhmllkuqgXAE=:1bvDS9fHDJTL5ME2XlLK2KRX7HjHcbnJDvoYJnlcOl8=;
X-ME-Sender: <xms:KbrEaihIc2eUV7hVAceMaCTWhTfcIFv6FAK0iySGdSd2aTT_1BrkjA>
    <xme:KbrEat18WK-jCMUaNKqXA2Qi_errmWRsjFwJczDKUSwA-wKDpa6v2ytCGTKUvfQ7W
    rUk_KJ34qNaeoueuT2Hzepm9pvuyvh49XyQGvYYNADDxPx8bBkipxmB>
X-ME-Proxy-Cause: dmFkZTFrrhbwtUy0L2w/r2xQ+i+KheQroFIeLxX3YbJhFKS5iiH3ieg418s5r0uFyK4Rgy
    IG3wvbppnJD0mjzMKqgUxAoRRNPdqEf0zIr6qeOhyd9bwJsLtTnXuJU0iUa2LWtbaBMO0q
    TKTAgcuCeJ0h+ujOH3bk3tc2v2kcoGzjqmro+OFNsxlrtqb/MlgSbGFFcEU/5lyR/nOcgF
    zwwxw9DNXH1XIPQgAi0jNkW+6bovyA7XUrttc05zk+9orEwO9NAC7mUCx27hMjj9cXy3Ld
    nWUS+733Mn+Efb4gcywFQ5eGeOzrwT8gbH9WI9MSTKJLe92slk8HcGJGhJfUfyyoFPamN7
    xawYOM7peLUb8/+x6qvi8f5hW8UbOpWlb6q8g0+9wzWNR/doEMod8rOA84I4COId780SF6
    VK/HsNtNZKb395yz34yFbobjp4MLjlHC+932y1FkBQT4sCMMds+xEC1lcWm+wQ3TsIwNbi
    KJqy8zVQDmFMKctTFSsVCsx9AzU2G6NPkDkjyMnna//msyAa2ijP5498U6RSIkq6hc/qTv
    8EM6LU2fyu/QzryvMZLr3qH2A7Y5ST+dQ13VQdn4ufMHQ8xMmgPfYsj4wB24UiVT4OhpNJ
    NK1LYqdmDhxob9HzNZbsu4f3UhR1K7qzq/53opHxkf5ZS5Idru56HEqJj5pQ
X-ME-Proxy: <xmx:KrrEagU22bzlpUVgxVZtG4ztIY9xQODjUwDzV597Wco36cIVnnniSQ>
    <xmx:KrrEaoS_EamPfyn7KykR7hqvF3MSfos_6wh4BjitlpnI350K1_MUuw>
    <xmx:KrrEauN9Ej1mDMHTLToLGpgatDRb9tsk6t2IfVY5keMFyzx1H6yw5Q>
    <xmx:KrrEamT7KmnQ2RzzHOpRHtcmnexu5QFko9rnPpLU1u6ARfKN2amS3g>
    <xmx:LbrEaq7z9OJG1s4JiC22g-0SP65ujSiJtJBU5dIf6nFfeGQKZhkyQ7_B>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6D6D432A0096; Tue,  6 Oct 2026 05:06:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AAFP4Q54jfPg
Date: Tue, 06 Oct 2026 11:06:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: "Linus Walleij" <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <dcc948ad-a718-4ee2-87d7-f4dc7536b4bc@app.fastmail.com>
In-Reply-To: <20261006055223.9299-1-kmehltretter@gmail.com>
References: <20261006055223.9299-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] ARM: mm: compare ARM926 cache range sizes as unsigned
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_020700_495607_3DB1C1E0 
X-CRM114-Status: GOOD (  18.62  )
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

On Tue, Oct 6, 2026, at 07:52, Karl Mehltretter wrote:
> arm926_flush_user_cache_range() uses BGT to compare end - start
> with CACHE_DLIMIT. Sizes of 2 GiB or more are treated as negative
> and take the cache-line loop instead of the whole-cache path.
>
> Use BHI for an unsigned comparison, keeping the line-by-line path
> at exactly CACHE_DLIMIT.
>
> With the default 3G/1G split, unmapping an untouched 2 GiB
> PROT_NONE mapping flushes the range through tlb_start_vma().
> On a SAM9X75 Curiosity board, munmap() took about 1.3 seconds
> unpatched and 20 ms patched.

Good catch!

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
CC: stable@vger.kernel.org

> ---
> Based on v7.3-rc6. Tested on a Microchip EV31H43A SAM9X75 Curiosity
> LAN Kit with two kernels built from Linux4Microchip revision
> 8f2c610093aa3d5a7bd50a8d0597be4f0b7a3eda. The vendor function matches
> mainline.
>
> Both builds used Clang/LLD 22.1.3, the same DTB and an
> at91_dt_defconfig-derived config: ARM926T, MMU, CPU_CACHE_VIVT,
> VMSPLIT_3G, CPU_DCACHE_WRITETHROUGH=n. proc-arm926.o differs
> by one byte, the branch condition.
>
> An unprivileged test timed munmap() of untouched mappings made with
> mmap(PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS). Boot order was
> original, patched, original. Each cell is one munmap() call:
>
> Range              Original A1     Patched B     Original A2
> 16 KiB               0.0840 ms      0.0852 ms       0.0844 ms
> 20 KiB               0.0656 ms      0.0636 ms       0.0632 ms
> 1 GiB                9.7688 ms      9.7702 ms       9.7716 ms
> 2 GiB - 4 KiB       19.4054 ms     19.3928 ms      19.4066 ms
> 2 GiB             1323.2802 ms     19.6478 ms    1331.8680 ms
> 2 GiB + 4 KiB     1322.2016 ms     19.3972 ms    1322.2146 ms

I would suggest moving the extra text into the actual changelog,
as this seems useful information.

> ARM925, Feroceon and Mohawk have the same BGT but were not tested.
> Their fixes are left for a separate patch.

My feeling here would be that a single patch for all four
is best, since you have conclusively shown the solution to
be correct for one of them and it easily translates to the
others. I don't object to separate patches either, it just
seems more work for everyone.

       Arnd

