Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663A1606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 22:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mKYtyFCd;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=plLRNEg3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pygFZ9vqYBILhtMeY66ELPOJ+MRQd/5b0EPAclzFcAQ=; b=mKYtyFCdZzXwL7TyCpAQiMIoRv
	qlkuHIxqJV3m/sr3EYZYk2o/jjvgGRxjDJTqs0TQceYSguvM8LVNc/HbgLXqZH2y4hs6t2WaDQcmx
	hVlY6FUIig2RHXAjulAsLV1chbkGr5Fvj4xk+pb2iRXPaWwkUnKXN6ShncuyeXC+gjdjK2jTBedvD
	CfzFh8LXZMoMMGJ70c3R8CX8/KN6IEFN6x/+1n7t7HuUViRxcF2QbeFro2cYLAFJLSGbZ1pxJMGRS
	eRugCzPNVLXGTd/97xqWkSgWLjagDQ5Dv149sjuPKbScc1YAQGXEPz/zt7ICrw5JxR8+3I0HOIO0y
	qRQ+ZekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK1YD-0000000F5WO-2nHk;
	Thu, 22 Oct 2026 22:46:21 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK1YB-0000000F5Vt-1f4e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 22:46:20 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DD0BC40430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792709176; bh=pygFZ9vqYBILhtMeY66ELPOJ+MRQd/5b0EPAclzFcAQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=plLRNEg3aJjupC8b2HPHX07IUAuKggNyhASz34cMN0inqcrig8adFsrs8N/dfsjIs
	 MFDyCm4sURsK/JHkkA7d9fZkGmY/kI6GClTtLv98Ydckveh5TIRZvvBwebS8OcRFa5
	 /YaPbQjXNjF/cVWJF+BMvUmTI7KSsrs8RJTbS8Q3q89WZNGwdkb4XPXgVN1cqis9pV
	 psoisvUuwdgJqFLyzzdcvgt5Ho+xrlKILQh4KA68LMmUdr0coPmJzMlqUj4bbNa65y
	 Kbr8imsXyi4/RCIvtWA4J8MuSULVUPlDlHNQe59/7NmmOo4yn2U/POVPDiABl97q62
	 zhVbF6mMzmBRA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DD0BC40430;
	Thu, 22 Oct 2026 22:46:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: linux@armlinux.org.uk, Bart Van Assche <bvanassche@acm.org>,
 James.Bottomley@HansenPartnership.com, mkp@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Breno Rodrigues Alves
 <breno3011alves@gmail.com>
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
In-Reply-To: <20261022222819.92507-1-breno3011alves@gmail.com>
References: <20261022183658.58090-1-breno3011alves@gmail.com>
 <20261022185224.60700-1-breno3011alves@gmail.com>
 <20261022185224.60700-2-breno3011alves@gmail.com>
 <871p9h1kc7.fsf@trenco.lwn.net> <87wlr9z8iq.fsf@trenco.lwn.net>
 <20261022222819.92507-1-breno3011alves@gmail.com>
Date: Thu, 22 Oct 2026 16:46:14 -0600
Message-ID: <87o6clz749.fsf@trenco.lwn.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_154619_508866_1A46CA0D 
X-CRM114-Status: GOOD (  13.60  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Breno Rodrigues Alves <breno3011alves@gmail.com> writes:

> You are also right about the broader point: "assembly to C" on its own
> is not a justification.  The kernel's assembly is there for reasons, and
> translating it for its own sake is churn that reviewers have to pay for.
> I have been approaching this as a translation exercise, and that is not
> the right frame.  I will not propose further conversions of that kind
> without a concrete functional benefit - something that fixes a bug that
> can actually be hit, or enables a change that cannot be done in assembly.

Note that conversion to C can be justified if it eases the maintenance
of the file in question.  In this case, there's not really been any need
for maintenance, so (in my mind) little need for translation.

> Bart's Reviewed-by: stands on the technical merits of the change as a
> change (the C code is equivalent to the assembly for even lengths and
> correct for odd ones).  Your concern is a different question - whether
> the change should exist at all.  Both are valid, and the decision
> belongs to the SCSI maintainers, not to me.

Bart's word outweighs mine here, just to be clear.

jon

