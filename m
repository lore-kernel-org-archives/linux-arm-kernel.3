Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2054CD1359B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=etuJv7VN1Rzoyh2Pz9FpTtPKX14gyYSQIP4BK59zGFo=; b=psSziAu4LcIfqMJ6Jyt9hBpmO0
	yyyMW7WY3r9BqfZjUKKKq4ZPUXo+OJPFnNAUAc9h6rhXaPqsVDmlk5jl5DuK7AAca+7ErTFHe757W
	DrlYkt4iFb9VEEC0xbO9HOMGgSaETJAKxGNfU/Yh3dGRDCvRR4Ry7JvxrOqlsPwDh3ogQ74mSXB5t
	/u2GXXCtrAzRaCXAJgXm06+9ONeiqExjmhGr7kpwJNemzxE0VbcZrKm93gYwFRjyc4lmMX+AxQpCV
	uKWFx7fMcU210pqwh3ot/+dKaSK32BtEzXjT49pDtEQzfeUAiJvR+GYC/i1Vmdg3JCi6fOo6Lf/3M
	1WvYiMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OQ1-0000000AeK1-4Agw;
	Mon, 28 Oct 2024 12:00:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NNk-0000000ATeg-2UIl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Oct 2024 10:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=etuJv7VN1Rzoyh2Pz9FpTtPKX14gyYSQIP4BK59zGFo=; b=NWROH7Z7zGtx4VeQSGCcoZ7aEV
	FAF1QUgymkGV6BW0ZIEf7BJkXcyYentv8EC4jxWcxF4RyPwKnQOuS59EcYX8JYXk02i2kf9StLrry
	l2NZSSTd+lyHlhpZDi6if00p5I9TIbhnlC43JoaGMWwGzMIcx9wUKdlxZQ19LE7Hro+3HqkNypJPa
	rN5E2gRLt1YpwY84G20JmLVKqyIhuzUR8iNF991AwdXFgXfSj3UzH9FbT6HTYm+4zGczZx5AGeZrH
	sKJxjiFH6EmcNKQm/iuqxD+3tkDJBb18PS6N/PxtKSQ62DyN/6jGCrXCOvp8jeASFPOGBDB29sRmC
	WbA+BUmA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NNh-00000009dIW-2h86
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CAB64A41BFE;
	Mon, 28 Oct 2024 10:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAE3C4CEC3;
	Mon, 28 Oct 2024 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112830;
	bh=etuJv7VN1Rzoyh2Pz9FpTtPKX14gyYSQIP4BK59zGFo=;
	h=From:To:Cc:Subject:Date:From;
	b=sgzjd9JHnH1rX1/B0TEqBvuW1gcqUTCwY+vitLAdTKQyyCChEmboFJ8huUl8x/qJv
	 r8U+YRgXJ66+dyH2p4VGekHSs0UaRDjGf+RBc+ZPgVv8mUTmpmWNgejT9389n2+G0c
	 jrf5e8V3Zsm78rXR0cpFBCwtiJ5fBxaNegQSHt7vq9t5KEO54RX9s/rWWqBXDGAZ/w
	 +To5M7vkiGGV2w6iK9U315gdUQTGQvIbuU7Fq1ehcwhdl+nWMP/Cq2WbCWMnz3CCEj
	 L/MnNxIP3yQTr1bgxWJ/GwusbY0J5Ew3dA11sQQe+R+Y9/ZH4CYLaabqxFeFDb2sCd
	 xXQqX8vhNJuUg==
From: puranjay@kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, "Arnd
 Bergmann" <arnd@kernel.org>, =?utf-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Sumit Garg
 <sumit.garg@linaro.org>
Cc: puranjay12@gmail.com
Subject: Supporting KVM_GUESTDBG_BLOCKIRQ or something similar on ARM64
Date: Mon, 28 Oct 2024 10:53:34 +0000
Message-ID: <mb61p4j4wwlap.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_105353_844236_E8FA6C32 
X-CRM114-Status: GOOD (  10.79  )
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

--=-=-=
Content-Type: text/plain


Hi Everyone,

I work on the BPF JIT for arm64 and regularly use Qemu with gdb for
debugging by single stepping parts of the code. I realized that whenever
I enable KVM, single stepping doesn't work as expected and it lands in an
interrupt handler.

It always worked for me on x86 so I looked in the source code and found
that x86 supports KVM_GUESTDBG_BLOCKIRQ that blocks IRQs when single
stepping.

I assume that arm64 doesn't support KVM_GUESTDBG_BLOCKIRQ because it is
not trivial to implement this on arm64 due to some architectural
limitations? There was a patch [1] posted in 2022 to solve this issue
but it was not merged.

Let's start a discussion about what needs to be done to support this on
arm64.

Thanks,
Puranjay

[1] https://lore.kernel.org/lkml/20221219102452.2860088-2-sumit.garg@linaro.org/

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZx9tMBQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2nf8pAP0Z4l83ZysYTSxJ+Yx1tDM5p5iqe7sb
sHTd8cxXSmY7wAEA7XIBZjFQpUNqB4bRQSPm8hHZAQg8Ckd/fVQVdfsSuAA=
=ZEKp
-----END PGP SIGNATURE-----
--=-=-=--

