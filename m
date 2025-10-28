Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C47CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuJ043THRvtCeNNEXMyo9HE4WCxrom2sWKd3gBR4LJU=; b=oKL6hzWB30LG3oM/Dv2hIX8osn
	eU4jmWn7uQH6V+d+uBM9vS5nH5+wy1WmaKGRFHvcaLLE58lt1TMrdHj0z0+m3GzYIGP7Q0455uQls
	HuVj11CAt3Ey9sjasqPNv7bGbM5gloXtY0sJy6GFzpzerRZpRBIUUt2tx3LRGgdMj5ryCu56/NVe0
	S/fUf4STa/h/St8TNtr80ww/yWxyQtQhSqLiZPtFa7/TpAMuMxXGi1ajKRuX3sbpQXQ3Wg1o1cKeo
	C0+7IYA3tXgtXU+Elq2e9/fG5Sxpb/af8chZfaiQvBnG2ZPTvoofNsouFCHwus2k3VOE7wtSI7fyQ
	Ltvfmihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm3L-0000000GFSh-2sHY;
	Tue, 28 Oct 2025 15:56:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm3K-0000000GFS9-0hUG;
	Tue, 28 Oct 2025 15:56:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761666964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UuJ043THRvtCeNNEXMyo9HE4WCxrom2sWKd3gBR4LJU=;
	b=OzfJrQmaGSYN7SjKtIVGt8XfMPuNg4JidCQ8tWQK7AVcOCmFMWTyt7m3oaUqsJxpyM0pab
	+9VYgPLRugbHDX88KcBOysbJ/aq1qSI58eSdNkEqVOW7qjKTKIUy5Dlk/fxAOLwId5eUGL
	MMCc/R6qmw7qog3LmZOpn1hDbjFJ/yfaXhgNJR3gCLTsi/v5MgAafS4ZxWm/T3HYbhDBYz
	7c21YHT0Nu/Sjny5kfjGTXYYbNGtZT06Axwaf1pQQ7shqgfmdljAo2APs5uuRC3KZQDlgK
	uYX1vd7MjyQwAwEqJ1sI+OyJphVkD9lM3WBrKG1nbnqWkrsRgH5c5NF/n8hOYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761666964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UuJ043THRvtCeNNEXMyo9HE4WCxrom2sWKd3gBR4LJU=;
	b=+BHGZAi3yNFrAvpwe9vwol5p0lVACxAmOqomEwb4Pm2KqtlBgDYqoGb8xyRWB/0XxRQyXl
	VePkBymJj4BQJSAg==
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?An?=
 =?utf-8?Q?dr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, kernel test robot <lkp@intel.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Linus
 Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 10/12] futex: Convert to get/put_user_inline()
In-Reply-To: <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com>
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.736737934@linutronix.de>
 <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com>
Date: Tue, 28 Oct 2025 16:56:03 +0100
Message-ID: <87frb3uijw.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_085606_341755_6437EEC3 
X-CRM114-Status: GOOD (  15.44  )
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

On Tue, Oct 28 2025 at 10:24, Mathieu Desnoyers wrote:
> On 2025-10-27 04:44, Thomas Gleixner wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>> 
>> Replace the open coded implementation with the new get/put_user_inline()
>> helpers. This might be replaced by a regular get/put_user(), but that needs
>> a proper performance evaluation.
>
> I understand that this is aiming to keep the same underlying code,
> but I find it surprising that the first user of the "inline" get/put
> user puts the burden of the proof on moving this to regular
> get/put_user() rather than on using the inlined version.
>
> The comment above the inline API clearly states that performance
> numbers are needed to justify the use of inline, not the opposite.
>
> I am concerned that this creates a precedent that may be used by future
> users of the inline API to use it without performance numbers
> justification.

There was not justification for the open coded inline either and
converting it to get/put must be a completely seperate change.

