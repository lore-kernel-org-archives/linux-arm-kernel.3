Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC179606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NMRHCJ2F;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Nsrn3EDa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hi1ZL/P6xTwIFqhtVwLPu3VRn9H34CRK9uafD+p4DyE=; b=NMRHCJ2F4EbO+a
	ol4+W2ptLuAmOg6Q257xTzpVzEje7Ozj+mV3cLJaFnA/X1ol/+ziR0u6ES1E6vxac9/ZijU4lF3cC
	DkU+1xPJo1qIcbaHA5Gfn/AIS3m0c0tPO1oeBCUYElejNOerIV9OW5WS5B5epUaWJGqRGHB89Mq7R
	u+QVa+Di8bJ3qDiotWBMsvdbN2PRxYVhBv7yEQmDKBJx478B7uyX4m0ZPAQoO4dmOlANWGaxB2/Am
	P+R2l6pZ+jSOtATbCoQSngH4zhjWwD9IwKyEVt0q2n36rRl+bCrHhAtMH8laV2cZToLXxbmXXi3NX
	CCeop+yYSBTCnhSQ/e9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSGu-00000009eeu-2l3H;
	Thu, 29 Oct 2026 15:42:32 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSGr-00000009edz-3BtC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 15:42:31 +0000
Received: by chaosmail.tech (Postfix) id A043B1C8AAF;
	Thu, 29 Oct 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793288546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hi1ZL/P6xTwIFqhtVwLPu3VRn9H34CRK9uafD+p4DyE=;
	b=Nsrn3EDaUl1axthWNFon0U2+dA13f1L+vVnts30Oh3yVZBVUUR+B5XnWSpOkjv/V9GcWRI
	ewb8OQpnhWxOmbTnboc3e7UVtSWF/fmXK/HbIvxXDnKKUex+Xe99DbwEOEK26ZeZ2xDlWT
	Us7sOzT/XDhsHTcNPUT+Oeu2qg7dUjU=
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <12988c8e-95ad-4989-a6de-e02af3c9ef1b@linux.dev>
Date: Thu, 29 Oct 2026 16:42:12 +0100
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 alexandre.belloni@bootlin.com,
 andy@kernel.org,
 asahi@lists.linux.dev,
 bhelgaas@google.com,
 bp@alien8.de,
 brgl@kernel.org,
 dave.hansen@linux.intel.com,
 dlechner@baylibre.com,
 dmitry.kasatkin@gmail.com,
 eric.snowberg@oracle.com,
 griffin@kroah.com,
 hansg@kernel.org,
 hpa@zytor.com,
 ilpo.jarvinen@linux.intel.com,
 j@jannau.net,
 jarkko@kernel.org,
 jic23@kernel.org,
 jmorris@namei.org,
 lee@kernel.org,
 lenb@kernel.org,
 linusw@kernel.org,
 linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 linux@roeck-us.net,
 mfd@lists.linux.dev,
 mingo@redhat.com,
 neal@gompa.dev,
 nuno.sa@analog.com,
 paul@paul-moore.com,
 pavel@kernel.org,
 platform-driver-x86@vger.kernel.org,
 rafael@kernel.org,
 roberto.sassu@huawei.com,
 serge@hallyn.com,
 sre@kernel.org,
 sven@kernel.org,
 tglx@kernel.org,
 wim@linux-watchdog.org,
 x86@kernel.org,
 zohar@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <DA128414-1BB3-4D04-9361-C870E0E3B57C@chaosmail.tech>
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
 <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
 <0683C803-C578-4C55-B893-BC03EBF9A9F1@chaosmail.tech>
 <12988c8e-95ad-4989-a6de-e02af3c9ef1b@linux.dev>
To: Aditya Garg <aditya.garg@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_084229_953585_8BE46BCE 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Oct 29, 2026, at 16:25, Aditya Garg <aditya.garg@linux.dev> wrote:
> Whitelisting will create an endless cycle of upstreaming new keys. But =
considering T2 no longer is receiving updates, Asahi would be happy to =
send their keys they wish to be whitelisted right ;)>

Yes. We are willing to add additional entries to this list should we
need to expose them to userspace. In addition, the current approach also
needs more keys to be added to the list, as despite the claim in the
commit description, it only rejects a fraction of the driver-managed
keys (I do not see the GPIO or certain battery keys, for example). In
addition, the read side would also need to have a list, as certain keys
are read-sensitive.=20

> Fair enough. We can restrict it to T2 Macs, and Asahi can later adopt =
if useful?>

This outcome is acceptable.


