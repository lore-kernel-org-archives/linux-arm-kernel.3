Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2CCD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhxX/8uDggNdPWZGQUwLY+E3xDBHhNp9/a6c92aFQBY=; b=xey0EaFtR5URX8u/L2CSDbsqiM
	aDwr2JXk8M0EEtHqZAyOrAIgbR9dT8AkD1K1Y9kEe4S6fdgWBl71YkxhL9BT074g7hlJqFj9fvBK1
	wFOz9oGW8J8Vog3nBNppgf2RVxCNxB8ghL8y3KvTmbYc/6ffQiX07wicjGPfoFIb3gRbjZljNakh7
	iQqNtPU6vBJPZQXCntY9OHcz4N1j8+GHaYOAnHJBZF/zFftdLvoTIHOX2YQIKBUrQlD+PLlwtI466
	MaNf3b+TGj8w+uBEQYe1pXX/WBU6DEBmtZpgtlM3NwfrdWbJ6LTx5LdplV1HZIJFmYqki0g4kTPOC
	qmVhQqlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0bN-00000003FJD-2viT;
	Mon, 01 Dec 2025 09:53:49 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0bL-00000003FHZ-0pCi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 09:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FhxX/8uDggNdPWZGQUwLY+E3xDBHhNp9/a6c92aFQBY=; b=mfuN6C6j0ekJcB9agsvCd5/ClP
	Ig04fxeGgHg4yQKG/ZIKZRFs0J4hYi6xK4OR9xmFVEosoBX8vg/eJZwPj7V5bUjuohT3Uy5xjoIRD
	66cn5O2AHZdz0l1nS9B8QcLY17mvat/LED0216Sdj6rcDkVutSeAtulzkdWS+cLMVNdiqwblIu6Zw
	E2rgHmChN11AY5cG4sQM+O+tR4D0l4Y/kPHYpyLzBsGd5duT+kxAjKKIpqsC5a2CFSOZGsWEZt91v
	qMdwLR9U0Ss4wz99NM9Crro9NtwYIG050MwBRNwm4N/90Q8HpxEb8bUQPJ0UvaSxbcHd1qNdUAeFo
	jYuXHbXQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vQ0bA-000Y94-3J; Mon, 01 Dec 2025 09:53:35 +0000
Date: Mon, 1 Dec 2025 01:53:30 -0800
From: Breno Leitao <leitao@debian.org>
To: yeoreum.yun@arm.com
Cc: Mark Rutland <mark.rutland@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, pjw@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	coxu@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bhe@redhat.com
Subject: Re: [PATCH] arm64: kernel: initialize missing kexec_buf->random field
Message-ID: <j2ilxmuhlgu5dwswl3qk7rbzmbk25qn4s2tidhdy4uy7dzfcnn@6ulgmdw4effw>
References: <20251127182644.1577592-1-yeoreum.yun@arm.com>
 <20251127113706.d89a84f277dab3ad273dde75@linux-foundation.org>
 <aSjqEQDv7V79V3Na@MiWiFi-R3L-srv>
 <5wel6vqjwwf25hryvg6s7z6aaog7xc3zxjevupt3jn4gntme6d@74wwwmhvvelt>
 <aSmrUGnZp0UeTp1E@J2N7QTR9R3>
 <aS0Ch3hrYPDXomDC@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS0Ch3hrYPDXomDC@MiWiFi-R3L-srv>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_015347_235928_93D1CD86 
X-CRM114-Status: UNSURE (   8.74  )
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

On Mon, Dec 01, 2025 at 10:50:47AM +0800, Baoquan He wrote:
> On 11/28/25 at 02:01pm, Mark Rutland wrote:
> > FWIW, I completey agree; your proposal is a much better solution.
> 
> Yes, maybe Yeoreum or Breno can post a new version to fix it on arm64.

Yeoreum, would you be ok doing the patch? If you are busy, I can do it.

Thanks
--breno

