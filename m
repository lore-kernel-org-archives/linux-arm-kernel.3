Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4633EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsm1NzR4usjbx6eO/EwG40atDxqPYD52GuN4cBVAfg0=; b=O2BXbVtMKvCOIKQaHgOv0AzvEq
	0vA+NymJ7tNVAWoliG2ifuaPh1pdKb70ttkfcKtZLfO4m4yJBBsQ5qY3Hf5KGkc+oxV6KJTXPxCqk
	IVlND/wYdrxh54SOM4PD9x6qzBODdu/OuDUJCepFS62PKdRM9UBTOUgdNMkWDNcZten8hlmhHB09C
	3Ffroxeknru9Uyqb2U4Zrl0foYKxgqYap3zh7Wk82VHGfG9ABjR+Ev+i0Kw5NjWfyAkM97RnVtnn5
	6yjlNEUojhQIfWF0t3ytjk3TfwR5jcDX6m8ufSJlQcloBIeSYd2tOoTpoUqdETmlKQcTL0kRLVcGS
	XHGVorPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GKD-00000008JAa-3XTc;
	Thu, 03 Apr 2025 08:53:25 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GI2-00000008J0P-3qQ7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743670239; x=1744275039; i=markus.elfring@web.de;
	bh=hsm1NzR4usjbx6eO/EwG40atDxqPYD52GuN4cBVAfg0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T0YmZK2/pL9+WbMqmOXhvUo7+aEJ9PPrMuag5ZnelfrIFHE0Qne3yt30CZCJfTvV
	 BvoNlcsUkWLUY9B55A9t20il17ol7L3ssLqSY2xaxnuylioYofYXwz2IisKsaZL5f
	 gqhbybaQOHG/hZzZaqgqYHVfwY8PzkpBMtigzn8NkIw0g8ZTvOSKIVaGZHkvEQ4wk
	 zahvddiKFphUty4Ub4vpG1NWTmLCK9fGON7abJnuuuBkxKGN7XeqjFn17KJzf10Xr
	 QIABN0jQGu9QpA95VY3A2npeKxcWQsbk2DHYEYItSXm3vo9Mo2YBcF5RJClyCp3JC
	 jxN2GxFJENsiJXz1Kg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.50]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MsrhK-1t7KB53E2i-012IHI; Thu, 03
 Apr 2025 10:50:39 +0200
Message-ID: <970e78d3-e3bc-4a34-9ba8-40df4823726f@web.de>
Date: Thu, 3 Apr 2025 10:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250403070339.64990-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] serial: Fix null-ptr-deref in mlb_usio_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250403070339.64990-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IyQRX81AoN2cTzefdi5EWIMxrAugxODoW9dQT5OAekcqd4WPkI9
 uAyGDMmtnVkQ+CGHwwmJEXvyk1lBr9sH1oGVSm3DkpcAv8mxPmgcr4mo6NhNv6gei7+AoeW
 xf1Dqy8Yn5/hldCS48DlmFr1Rd9cEUIquUONktOrroU/YUmPyDIskNzGnifPQyXEpY/h86q
 VZ5MxN/WcRGJS6JK/VPUQ==
UI-OutboundReport: notjunk:1;M01:P0:qn9RJRcmBMM=;K0Ku9YlURmKXZNnats0w/CadTYA
 vKAGlXpX1XsvOST4O8RjRWBFf7l42TmbhCD2myyNEdyPcu+IKJmWXKZzH89b8KSZqHofU76Bl
 b9kEYPKXRuS55dusEtsbExqAgjmKyKFFQyME3lkKyAGME7SBX1jWfNC08HerO6YoAG5W+Xyor
 5/4stNSZo8QqyvvvCII8J+l8EQu72vFSfXguWNis0Q3R3Udl+9efliVaX0APrg3tPt3pidno1
 NBymGxEIT0AZOPDFiiVI5zynCmbacGqGE52Zi5N0iyvsd+p55+ku4U+m/CIx19MBz0p5ue3Of
 DQYUAmxxmEflrziNvYOz0TgUjqb7ylTxVGhwKsgxsLPY15eXu9ePxtl7NX3iHmeipbODQnCcI
 CLS66Sk3Hw8FpiAQIlbRvJmhyDLGsXo9vGFDHOFTZJ9kvOxRn+AjFEFsYWMX8fxBBN8nW1qOU
 /G3fyZN5R8nY+f1cEavSGNjnwxACgQ9IJg4YD3YYp0o6GeSCDhf0P97CnvplTTef9jkvvNIN/
 A1S+4Z0QDbESwgpO2HZi1OEeyXchBqCvSNbxKVCXZ4pqUeD5Q9WFOlRLZ1f9tTaD87Q5jllhf
 /TwByyImGs/BuibAOIJ5X5faqPvXFnvZxtmYLbugWms/YKkATL4NkAKYCqokV041dEE/fiTqw
 H1gQeSzCDBKtWs8Z8HCPvea7INzFwlLcI+u7rCEeiYorbauHa6eg6EbzLJIZLd5UXS2vOwdYm
 q/rp1txbM28XyJHEPG92V/mRa+rTaI9D05UbGN5N9kwgJtLxBBqR9i5IEegy9yrlU8tyzKPhR
 u7qv24hZmRGBm/0jf9tNBfEPYHuCF/OQpBjFti6Rgcpf5YWadnlzpzm+bBXvc4+uB2F++7UOj
 pTxu6CD3Unk1HVQJOYNzwr1oZ2G15ETzb2i1S6WTUz64vtowBKeRvv49SDpIPs9aP3M2Mxy4U
 LzWYhJymlXcRQ2je8KkQNvW0c7lx0OrZxgfJXPL10vEiuvtdqTwltKiWVvukv+xyKF3NdNS6h
 BbLrLsMTxIXPK6+K8SHrghcJ2ldOsblE78WeapCxCuHkOpttvdcoxIlWiCFt/IMvEYxPbNzSh
 /Gdo5fQVJYlgjylzFDZa61FYz06FYMFx9Q8nzLKMpYtZCqFjsgicnFWe/gnEkfcSzOXI/XkI2
 5KKffcAIbr0s6tkmgSEb7ELob4e5i0VbSeuTNgAz7MXo5hqX6zVEDBqoVXa4rv6V1jUmAwOPi
 c6nLKaHUuUQdvWTpW4vGTg3138UdRpmrURH9ZTlI1FgNKtAkTzy/7er3iyLLwh97iGmbVtztC
 Bc3HBfoFrKAztJHjMb1OcB50nQfuiKh797bizMkjKbj7QSBgPRdbgb/asOaEUAAU0jeNqVx0+
 EwIcbe3MbnXjP9MMF9wHPqPl7CDYbdwbmn0weMDKMC5dSRKFGN5ecwMFXOImgJKbewHEKiPFg
 5hYkRr7q/Driejx95rYgls4EpIyCgnJ5dNFuxWUbqFaTisuoq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015111_390287_EB01AFBB 
X-CRM114-Status: UNSURE (   4.16  )
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

=E2=80=A6
> Add NULL check after devm_ioremap() to prevent this issue.

Can a summary phrase like =E2=80=9CPrevent null pointer dereference in mlb=
_usio_probe()=E2=80=9D
be a bit nicer?

Regards,
Markus

