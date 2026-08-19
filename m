Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9343BC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tvM2Ri/bAIZx5VClq3Xw8a7pPZMRrgBXB/xPl4O2u4=; b=MsNI4qcKJvejtg52JNGMugtnTp
	/Nal+3HN2QYDw1G4a4u/0cBHuGIUkBYunrilfUMyubhorqLg0pC1HgAyQgu5Wt+uzpxcmLJr1yqKa
	ulyouzDuZyVqQ2W+UMDwA7uhKJEWwF/TXPRx7UgF3zVRMkfR+r48wEIcyhlxJyfU+QyNMI4c5Qlg5
	eMb68VF4YQ3u67UkOP+o7/5lzLYhXiblAc//f3/wzb/OtIhrQa8d6KfrYbRWHWT11kU67U6sniuMG
	4OQ9FpncplXOBQJUxkYlo8Hq/1q0hJXE6TKyTlYGmXfEUZS6QHmbfo74COoO2cP2Oii8e/k33sktu
	zMJVNTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweKk-00000009f2L-3p2W;
	Wed, 19 Aug 2026 11:19:51 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweKj-00000009f1P-0LPa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 11:19:50 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 7816AEC01B2;
	Wed, 19 Aug 2026 07:19:47 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 19 Aug 2026 07:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787138386;
	 x=1787224786; bh=4tvM2Ri/bAIZx5VClq3Xw8a7pPZMRrgBXB/xPl4O2u4=; b=
	AdL+Wt648ukEnd2j5Wo8uYCg4+PobA4yQo6dazhgw7fkUCwNR6d5BwSQApQYWJ1J
	aKhTX5YEl5K9y6tfZ9ExWaf/OfbcYfT+tLnOJB2wThFqCu6CCjmvZr89JRHqBkLC
	P4cXD1hCgfc2QZP9udqcAAE+LtsFsF8RyoOyuMG3MNH4fYaDjZf4Sqi8z75I6KSt
	XJhzcmAOjQ27Fsv3sD85b264pZ6siUt3ZarK+z4d9nQyAQwtDjElBUMEcQAqSYx4
	aLw2NxwUjlmSsL8398KvI6PSoSBy5hfKmTW05VNzQ3tk4wBwTFjqgGTHrbBBsF3u
	XS8ezFtvN8MBefGDb0Q3LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787138386; x=
	1787224786; bh=4tvM2Ri/bAIZx5VClq3Xw8a7pPZMRrgBXB/xPl4O2u4=; b=D
	KV/hk7fd/wfpmFM1t/jz8YCLgz1PstaeyQqglmPJ0BrIeLSu39NhnLituttcEuv0
	mXFFWLOZldzfhKo64Oekr3SXTr6tVnVF6gba9PU0GS6rpdvWlq5vI0aZk4DSMuvU
	IuMaqBn6D6hrFCes/oUiQOzQI0NyogOzEDPA41/3R9vA/D8Qy5O0MPqvYNAzcYjs
	h7uyhxAePScCvcaWMfzHUme7adOBobviIoWkNfHpaDTaLMqnLB+bDVBJG1iwkSIn
	O+Nd2gsUTLkttTD3gytmyRuHIMCLOz6FgpwUgA5thbL0RDmDFYm0YJ2M5sTZv27h
	Tq9N8nTcktnSZn0QVeoOA==
X-ME-Sender: <xms:TpGFamlWBZAwNHztowPVggiXQVbV5Yr8-Y8Kg4nTeQDgNCNn4sSLgA>
    <xme:TpGFaor0QrCj2Hp_t3sYV_jwpAGpPHlABCtfq-XWVfxaOB_mJ6LSSYVzvo1HpySQN
    Eo2ufIdX6o94d-ao9JROgZhM7F35CDvn4bfWRzRgtxU0emODOBrHQ>
X-ME-Proxy-Cause: dmFkZTFEFI+CaJ2h1oX9YFs5GMV8MCMZvTPL1thlVPLVugs32kcwKnY9Kgq6MGaSIrYvfQ
    DfXmw+lWkAC5tgEyU9aesseaAVekQVljMlOpgMG2FQjXBNiW/0lGbZVWiMNMBL3H4ehRqf
    RcdD3GomSF45K3Qexk8OtOfmtQHavTMaleuowjlM8OIAmu+evBE5rDyuiE+p2La8Huf7o/
    qdSv6zb+uB8Njm+v10WMb++CLlAaroG8Gw+8/S2OjKqedFfhP5jpzDSmJZVFdJZb/lKBUJ
    vzNYBCrEik2pdCYkK7MHqHCeOUKM3m+veBzSG9CTQKaUrDSyVWkJ7WGQMBj27acPcJaZbP
    3qsp8TB/I9yLObz6kPlFujLAa5CMlgslVyOP/CFI0hUg251HifQ6nf9KWQ1Kg26CLGLt4P
    9rCyL795gATbrVoYLkl16pBMpKfz243ZB4b78o5W9I23Bu0t0yZAjC8WuMHYRhVZO9Knl8
    NQX7yg29pnhVd+JEB980q4SKUW2LBrIzCAkhuuAbWYFyG/YKRjb9UP16BUbZsDpO82j8rP
    kYfSA7BJutudAA4ZQq1wcfML8Zf8uVJ6TdcBAZBFDv3fBfoTa2D48n6iQR6+9Ab/hh9+4I
    rAzme3So6ayp5dAmRmrhC0hkusg3CtjQ5NnkQ+n0rHq4by2iwBywO9+6btiw
X-ME-Proxy: <xmx:UJGFaoMNq1oIUONU1h0EAeVLKaVzcSLzqWOCbtkkKSwBrN6okFObTA>
    <xmx:UJGFapDSCarQXHw0cRNJDltyYqhXKyMMX7_uvxDvtmByuDWGzbd1Iw>
    <xmx:UJGFavJi9ql3waSBcygR9i9QeIvSmRSII31tsXOW3fTUn83BkqAq4A>
    <xmx:UJGFaiOITlxFbFd5jeQ4hGx_e_Qclc4N4Y3QYsBciguOEmJStQkoPw>
    <xmx:UpGFah_go9rKAmcegPZJD6CnaO7gCthOdM9hBQ0xNIW7yzst6ecGH3J1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5298B32A0071; Wed, 19 Aug 2026 07:19:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aqm_jcT6PvEF
Date: Wed, 19 Aug 2026 13:19:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <4078f942-e29a-4f6f-b6fc-780e8c6d6874@app.fastmail.com>
In-Reply-To: <aoU2ezSYVbOw0hun@gmail.com>
References: <20260817000231.21311-1-kmehltretter@gmail.com>
 <e238944c-9349-497a-9d30-0dd2edd7f115@app.fastmail.com>
 <aoPKzPb9YUVULlXG@gmail.com>
 <e3c463a1-81ae-4bef-b65b-fea1a4eda5bc@app.fastmail.com>
 <aoU2ezSYVbOw0hun@gmail.com>
Subject: Re: [PATCH] arm64: compat: Keep alignment address arithmetic 32-bit
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_041949_194884_9E4DE80E 
X-CRM114-Status: GOOD (  15.83  )
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

On Wed, Aug 19, 2026, at 06:56, Karl Mehltretter wrote:
> On Tue, Aug 18, 2026 at 09:31:14AM +0100, Arnd Bergmann wrote:
>> On Tue, Aug 18, 2026, at 05:22, Karl Mehltretter wrote:
> I now used:
>
>   CONFIG_EXPERT=y
>   CONFIG_ARM64_64K_PAGES=y
>   CONFIG_COMPAT=y
>   CONFIG_KUSER_HELPERS=y
>   CONFIG_COMPAT_ALIGNMENT_FIXUPS=y
>   CONFIG_DEFAULT_MMAP_MIN_ADDR=0
>
> With 64K pages and KUSER_HELPERS, compat TASK_SIZE is 4 GiB. The last
> 64K is the kuser mapping. The test maps the first 64K at zero, so memory
> exists on both sides of the wrap.

Hopefully nobody actually uses CONFIG_DEFAULT_MMAP_MIN_ADDR=0.

I don't see yet why 64K_PAGES makes a difference. I had
expected TASK_SIZE to be 4GiB regardless of the page size, and
the top page (but not the bottom page) to be reachable from normal
userspace.

> On native ARM32, the kernel is mapped at the top of the address space.
> Userspace cannot reach the 4 GiB wrap.

right

> So v2 is enough for the original decrementing LDM/STM bug. v1 does not
> add a working wrap case by itself. I think the small v2 fix makes more
> sense. v1+ would be the theoretically complete version for AArch32 wrap
> handling...
>
> Am I getting this right now, or am I still missing a case?

That sounds good, v2 should be all we need then.

     Arnd

