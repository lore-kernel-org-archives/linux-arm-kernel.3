Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A3D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I63M10Mn;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=JB0kqTmV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UbSiEL7++BWQVToI7FmOqiyK9zuBqGN72UpL4qL+D0U=; b=I63M10Mn1fd9ME
	HHxsTePE7WdrmpNwSOyNhr/RGnWjFHyUaptfb2Q+GZyTgdSMIiapv274eUiveq8iXDuuaUtY0DSZ2
	/WBtHz/cSTDQIcw4fDSXAXXVQscxwzwtMq8zHoa5+POVNHJWK2dTRStTHVuM7VorTw3g8dcKH7GJD
	78FyGDgzG0i5NKROO/Dpo+UK5bTaOogO/SyrHDq+N0cO3jp4zpLJPPFEFVKrBRHCoGOApISRBJUP3
	GXLYYZg/kbsmLkeXEAYXEERMKnjNzL/WEu14f0GAgJW0O5j03ahcYgjuzJoDNPOyj1wNuMJWK4Nyk
	i1kjeN+kfqosxjeyZFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRVg-00000009aTP-0JTH;
	Thu, 29 Oct 2026 14:53:44 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRVd-00000009aSC-1dAq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:53:43 +0000
Received: by chaosmail.tech (Postfix) id AA44C1C8AAF;
	Thu, 29 Oct 2026 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793285617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UbSiEL7++BWQVToI7FmOqiyK9zuBqGN72UpL4qL+D0U=;
	b=JB0kqTmVG4H4ja0Pp0Eah0YzrRch2nw5+T2+ML1Vpc13jMJHEYCHgQdssFpAxSYtsF+Vhc
	lxr/E6ukKsAYSFkTL14uCwyPFc9tJHoY58kAIAacAdrjWZvC2+VU0K1J2hjatCqtQu2uKP
	ianM2iZH8ZTIgpcbtXl0LW2Vy85GaGE=
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
Date: Thu, 29 Oct 2026 15:53:23 +0100
Cc: alexandre.belloni@bootlin.com,
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
Message-Id: <0683C803-C578-4C55-B893-BC03EBF9A9F1@chaosmail.tech>
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
 <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_075341_889651_0E3D3BBC 
X-CRM114-Status: GOOD (  12.09  )
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

On Oct 29, 2026, at 15:39, Atharva Tiwari =
<atharvatiwarilinuxdev@gmail.com> wrote:
> 1. The patch is required, atleast on intel macs, as without writing =
GPU and CPU
> states to smc, the system gives PROCHOT signal under small load
> , and heats up a lot.

In that case, why are you exposing a generic smc key interface instead
of one that just does that? If you think that this data should be set
from userspace - whitelist the set of keys that are needed.


> 2. the smc dosent expose keys of nature that can physically damage the =
system
> it only exposes power/volt data, and the most you can poke is reboot
> keys and gpu/cpu p-states.

Are you willing to make that claim for every smc-equipped device, not
just T2? Are you willing to make the same claim for future versions of
smc firmware?

> 3. If a person is randomly touching keys, Its their problem and not =
ours.
>=20
> 4. There are a lot of things that can mess the system way more and =
permanently
> than smc (undervolting for example), but they are not safe guarded, =
why
> should this be then?

I think it is inadvisable to leave a loaded footgun around and then
blame the user for using it. As an "OS Vendor" you have a duty of care
to your users.


