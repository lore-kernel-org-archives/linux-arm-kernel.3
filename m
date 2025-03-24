Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6B6C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWDg5sAJRa5yGnJsUjCGug0MakuT+w++shbZerB1ON4=; b=mMZDpobWic2MV3bUOoEry+Joou
	W8sA3uEJ25hvHEW2hqnbVXYy+2s9/6fqQC8dvtTRFc2V1OK+4WHKbAiIuJYcmXBPsGUKomEL9BGFU
	zb4qcqecx1vBVkezDkd/vGHIrwhFNDV97TkeQfeRN5embtl5Nd4ajO8XsAoVBuvXxVb33qEsp6D0F
	CdX0Rk/EzJJdxQgFHknzp2k5OR7jbnwIrcTdhxsFK5ifMx7jT7p8Juqnytt8H4o38q/MRkSnMP8PB
	OVxZDAWMJhgAAssYBCoqpguf7KE6TTnRe59eYf0kdBghGzyg9havpKFuF7RLEL82IQlmIhXDTkdAB
	bQP6bc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkwf-00000003hSK-3DLC;
	Mon, 24 Mar 2025 16:46:37 +0000
Received: from out-69.smtpout.orange.fr ([193.252.22.69] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkq1-00000003gEC-3Dgh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:39:47 +0000
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id wkphtqyvuqGhjwkpntp5DD; Mon, 24 Mar 2025 17:39:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1742834382;
	bh=fWDg5sAJRa5yGnJsUjCGug0MakuT+w++shbZerB1ON4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=plw1bbqE0z5rfrjQQw+4DOFlYoe4aXV3HOaYnSLm4RqTOwzMgwQKESyqhPy7pOEzI
	 RzgjMUqxC8ZfAHGz5LF9ADf/97gKqsFaQHLOpeDQdBoj4wEjt64flQbW5nouKULz4h
	 93zAhY4igdCOqZ4ALMnPyRm7wTEm2NxGiFBIckIwP30Sw8w6NISDz4h2kjuJfSikGp
	 jxqoEh4a/Cd8GSM30qRtkSdvYka3Cbow7j8N4sYl43NVW1kqgfg5H+HN8Fna2ogrA1
	 KA7ghA72CgLM2GpLM8NRIsgQ88QLvJBI8rk4/9xmMj4RW6KI9x4skpd9321SXaLNBp
	 ozWdbaJ0vBkRQ==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 24 Mar 2025 17:39:42 +0100
X-ME-IP: 124.33.176.97
Message-ID: <1f9ea3e3-e348-46d7-9b15-8c017762b12f@wanadoo.fr>
Date: Tue, 25 Mar 2025 01:39:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
To: Yury Norov <yury.norov@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250322-consolidate-genmask-v1-0-54bfd36c5643@wanadoo.fr>
 <Z-GEFcciqCwxL88W@thinkpad>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <Z-GEFcciqCwxL88W@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093945_938690_815D0E7B 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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

On 25/03/2025 at 01:11, Yury Norov wrote:
> + Anshuman Khandual, Catalin Marinas, linux-arm-kernel@lists.infradead.org
> 
> This series moves GENMASK_U128 out of uapi. ARM is the only proposed
> user. Add ARM people for visibility.

Actually, not yet. Here, I am decoupling GENMASK_U128() from
__GENMASK_U128(), but I did not touch the uapi.

After this series, __GENMASK_U128() is not used anymore in the kernel,
but I am not brave enough to remove it myself because there is always a
risk that some userland code somewhere is relying on it…

(...)

Yours sincerely,
Vincent Mailhol


