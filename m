Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB57606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 03:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zbpwNvQx;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nG1zv4un
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vuMOrMNlsDeXB/gOpGoVTc30nETCHnPARKydNa9wPb8=; b=zbpwNvQxJ/XKLThmyXZWckppKk
	zH+WbebJu+4lLeqfFjLlRItwDOCw6nWPu3o+2sUu+0ZNOeJyaiDq31yCW+hrOR7iujkvctT4UYXxC
	Hk3PaFjdsD53Sek0s3eIqaNC9XYTHqctRXI5QuXa+FjtAEANC2QMX1p38xR9hbL+FNh8KS1J0Xm34
	jfc1mKTIQVUf9HicGcFgivjrpqV6OaGxFW3Umt2p8PBAAiIYc+1b6Vkdt6p7AiP8kcefcPut/HOx9
	Y0Adma56wHiFnG6jkDHdgPEQ/2/Sbj+Vs+B8VxPsDXZ/V9tLwU/GD1aqeYd0ALG1utRLo1xuQ3L/W
	MCmFXj+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnqL-00000007ebq-1ocd;
	Thu, 05 Nov 2026 03:08:49 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnqH-00000007eaT-1aUF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 03:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=vuMOrMNlsDeXB/gOpGoVTc30nETCHnPARKydNa9wPb8=;
	b=nG1zv4uns5j1SF7EQQHL4A81sYee6mgvz28McBXq/nZTsB6X7wEk4TY6igfzBO
	U15191s2WTw2n8N/X9eXGwnHw13C/chkLVwEjzKUluQzq7vV4D+2PFpFuVQwjSmy
	tv6ocGVDFy4cfDjuGIRTPdeCA3i8HrvyANnyt+IpQNFp4=
From: Wentao Liang <wentao_liang_g@163.com>
To: Alexey Charkov <alchark@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@prisktech.co.nz, wsa@kernel.org, wentao_liang_g@163.com
Subject: Re: [PATCH 04/20] i2c: viai2c-wmt: Fix clock leak in wmt_i2c_probe()
Date: Thu, 05 Nov 2026 03:08:21 -0000
Message-ID: <179384810127.1670076.13427386991396484928@163.com>
In-Reply-To: <CABjd4YzNzZ0nnO4Xgw1JsRHhj9Crc6diX1uJnWHpHvd6BcPk2g@mail.gmail.com>
References: <20260916070631.1965713-1-vulab@iscas.ac.cn>
 <CABjd4YzNzZ0nnO4Xgw1JsRHhj9Crc6diX1uJnWHpHvd6BcPk2g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3j8wt8+tq+C_JFA--.4408S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy5GFyrJr4fJw4DKw1fCrg_yoW8ZF4Upa
	9YgFyYyanrAFySkws2va17Zr18urWxKF45Xrn5WFW0vrn8JF1jyF4rKw4vqFy7Zw4kJ347
	Jr40qa97AF4DuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU7EfnUUUUU=
X-CM-SenderInfo: xzhq3t5rboxtpqjbwqqrwthudrp/xtbC7A6dzGrr8y7vRgAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_190845_893468_0E633964 
X-CRM114-Status: GOOD (  13.09  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexey, Andi,

Sorry for leaving Alexey's review unanswered, and thank you for reviewing
and merging the fix. I am following up from wentao_liang_g@163.com because
I can no longer send mail from my original address, vulab@iscas.ac.cn.

> Maybe we could go for devm_clk_get_enabled and drop some more
> boilerplate which follows in wmt_i2c_reset_hardware, while at it?

Yes, that would allow a broader cleanup. The current reset helper calls
clk_prepare_enable() and disables the clock if clk_set_rate() fails.
There are also explicit clk_disable_unprepare() calls on adapter
registration failure and in remove(). Converting to
devm_clk_get_enabled() would need to update all of these together to
avoid double-disabling the clock and account for the resulting cleanup
ordering. The merged devm_clk_get() change only manages the clock
reference; it preserves the existing explicit enable/disable handling.
I agree that the broader cleanup belongs in a separate follow-up rather
than a v2 of the fix that has already been merged.

> Backporting this to stable seems like a stretch to me, though

I understand your concern about the backporting effort for a rarely
triggered leak in old code. The original stable Cc was for the missing
clk_put() on probe failure and driver removal, but I should have
addressed your concern at the time. This reply is not a request for any
additional backporting or for the broader cleanup to go to stable.

Andi, the 04/20 numbering came from a batch of independent fixes across
multiple subsystems, sent to their respective maintainers and lists.
This fix has no dependency on the other nineteen patches. That numbering
was confusing here; future independent fixes should be sent separately.

I used OpenAI Codex to help inspect the existing clock cleanup paths and
draft this reply. No new patch or hardware test results are submitted
with this message.

Thank you, and sorry again for the missed follow-up.

Best regards,
Wentao


