Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEE4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NI5xFWDo;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=yL2lDRgC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tjfAbDDo8h+t2m7Oll5N9+sjj2zGWKROZ1OXhj5/7js=; b=NI5xFWDolvsKtv
	0PsaQNXpDnYkcXxuA5AucE1TggI69wIUh4pgg35Mpv3FcD54ldrzg7mivGuF/FAvT9hCog5h8qWYs
	2o0Sr4fPqdhkPhSA8grYxiO/fqAciGEjsgX3pL7P4AOH6CtBBeXuD25tQ40yWBBuzWDUFMXRZThhe
	NVsedylYzxi5JHcbcldAFmpCdNVDSjIJJ4Ze6o/zqZSrZqixSrTHRvA2xoJ20Lx9rC74Dy9z1m1Wx
	0RvJGVR3QJI504HPrLeSmwF8iUEgIZ4pW7OxgQqeMJfaSNkfUqw6wBwFR91fpIRmMyt6z0gvycjiN
	uh++IBn4QAO2UDZAq3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMLh-00000008pce-0tM4;
	Thu, 29 Oct 2026 09:23:05 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMLe-00000008paM-44sa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:23:04 +0000
Received: by chaosmail.tech (Postfix) id 0122E1C87C3;
	Thu, 29 Oct 2026 09:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793265776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjfAbDDo8h+t2m7Oll5N9+sjj2zGWKROZ1OXhj5/7js=;
	b=yL2lDRgCJDJpaZDz8pZYltehrxUJx2mB+TmBFD943/OHPwTRwWms3JeGoZZCx75H9dN9TB
	U9YD8Ti7GkEr4GTe1Eao9vIg9GWutDjjVcKfHlF1Me/XLMdJEgAXiDGW7GzXlVJSwMVyYQ
	9XzUrTModweKsYsUaE6CyFELP3+Mng8=
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261029085504.3547-15-atharvatiwarilinuxdev@gmail.com>
Date: Thu, 29 Oct 2026 10:22:43 +0100
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Guenter Roeck <linux@roeck-us.net>,
 Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Griffin Kroah-Hartman <griffin@kroah.com>,
 Hans de Goede <hansg@kernel.org>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
References: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
 <20261029085504.3547-15-atharvatiwarilinuxdev@gmail.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_022303_470538_08F6C7F1 
X-CRM114-Status: UNSURE (   8.54  )
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

On Oct 29, 2026, at 09:52, Atharva Tiwari =
<atharvatiwarilinuxdev@gmail.com> wrote:
>=20
> Add a /dev/smc device so userspace can talk to the SMC
> directly.=20

This should either be dropped from the series, or be hidden behind a
`melt_my_mac`-style module flag, or switched to a whitelist approach.
We do not know what keys will be introduced in new smc firmware
versions, and there are already keys that should not be randomly poked
at.



